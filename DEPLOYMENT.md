# Quick Deployment Guide

## 🚢 Deployment Options

### Option 1: Shared Hosting (cPanel)

#### Requirements

- PHP 8.2+
- MySQL database
- SSH access (recommended)
- Public HTML directory

#### Steps

1. **Prepare Files**

```bash
# On local machine, build production assets
npm run build
composer install --optimize-autoloader --no-dev

# Create deployment archive
tar -czf quiz-app.tar.gz --exclude=node_modules --exclude=.git .
```

2. **Upload to Server**

```bash
# Via SSH
scp quiz-app.tar.gz user@yourserver.com:~/

# Or use FTP/cPanel File Manager
```

3. **Extract and Setup**

```bash
# SSH into server
ssh user@yourserver.com

# Extract files
tar -xzf quiz-app.tar.gz -C public_html/

# Install dependencies (if Composer is available)
cd public_html
composer install --no-dev --optimize-autoloader
```

4. **Configure .env**

```bash
# Create .env file
cp .env.example .env
nano .env

# Update these values:
APP_ENV=production
APP_DEBUG=false
APP_URL=https://yourdomain.com

DB_CONNECTION=mysql
DB_HOST=localhost
DB_DATABASE=your_database_name
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

5. **Run Migrations**

```bash
php artisan migrate --force
php artisan key:generate
```

6. **Set Permissions**

```bash
chmod -R 755 storage bootstrap/cache
```

7. **Configure .htaccess**
   Create/update `.htaccess` in public directory:

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
```

---

### Option 2: VPS (DigitalOcean, Linode, AWS EC2)

#### Requirements

- Ubuntu 22.04+ / Debian 11+
- Root or sudo access
- Domain name pointing to server IP

#### Initial Server Setup

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install PHP 8.2
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-xml \
    php8.2-mbstring php8.2-curl php8.2-zip php8.2-gd php8.2-bcmath

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Install Node.js 20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Install MySQL
sudo apt install -y mysql-server
sudo mysql_secure_installation

# Install Nginx
sudo apt install -y nginx

# Install Supervisor (for queue workers)
sudo apt install -y supervisor
```

#### Deploy Application

```bash
# Clone repository
cd /var/www
sudo git clone https://github.com/yourusername/quiz-app.git
sudo chown -R www-data:www-data quiz-app

# Install dependencies
cd quiz-app
composer install --no-dev --optimize-autoloader
npm install && npm run build

# Configure environment
cp .env.example .env
nano .env  # Edit database and app settings
php artisan key:generate

# Run migrations
php artisan migrate --force

# Optimize for production
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Set permissions
sudo chown -R www-data:www-data /var/www/quiz-app
sudo chmod -R 755 /var/www/quiz-app/storage
sudo chmod -R 755 /var/www/quiz-app/bootstrap/cache
```

#### Configure Nginx

```bash
sudo nano /etc/nginx/sites-available/quiz-app
```

Add:

```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;
    root /var/www/quiz-app/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

Enable site:

```bash
sudo ln -s /etc/nginx/sites-available/quiz-app /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

#### Setup SSL with Let's Encrypt

```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

---

### Option 3: Docker Deployment

#### Create `docker-compose.yml`

```yaml
version: "3.8"

services:
    app:
        build:
            context: .
            dockerfile: Dockerfile
        ports:
            - "8000:8000"
        volumes:
            - .:/var/www/html
        environment:
            - APP_ENV=production
            - APP_DEBUG=false
        depends_on:
            - db
        networks:
            - quiz-network

    db:
        image: mysql:8.0
        environment:
            MYSQL_DATABASE: quiz_app
            MYSQL_ROOT_PASSWORD: secret
            MYSQL_USER: quiz_user
            MYSQL_PASSWORD: quiz_pass
        volumes:
            - db-data:/var/lib/mysql
        networks:
            - quiz-network

    nginx:
        image: nginx:alpine
        ports:
            - "80:80"
            - "443:443"
        volumes:
            - ./nginx.conf:/etc/nginx/nginx.conf
            - ./public:/var/www/html/public
        depends_on:
            - app
        networks:
            - quiz-network

networks:
    quiz-network:
        driver: bridge

volumes:
    db-data:
```

#### Create `Dockerfile`

```dockerfile
FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    nodejs \
    npm

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Install dependencies
RUN composer install --no-dev --optimize-autoloader
RUN npm install && npm run build

# Set permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html/storage
RUN chmod -R 755 /var/www/html/bootstrap/cache

# Expose port
EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000
```

#### Deploy with Docker

```bash
# Build and start containers
docker-compose up -d

# Run migrations
docker-compose exec app php artisan migrate --force

# Create admin user
docker-compose exec app php artisan make:filament-user
```

---

## 🔐 Security Checklist

Before deploying to production:

- [ ] Set `APP_DEBUG=false` in `.env`
- [ ] Set strong `APP_KEY` (use `php artisan key:generate`)
- [ ] Use environment-specific database credentials
- [ ] Enable HTTPS/SSL certificate
- [ ] Set proper file permissions (755 for directories, 644 for files)
- [ ] Disable directory listing in web server
- [ ] Keep Laravel and dependencies updated
- [ ] Use `.gitignore` to exclude sensitive files
- [ ] Enable CSRF protection (enabled by default)
- [ ] Configure CORS if using API
- [ ] Set up regular database backups

---

## 📊 Performance Optimization

### Production Optimizations

```bash
# Cache configuration
php artisan config:cache

# Cache routes
php artisan route:cache

# Cache views
php artisan view:cache

# Optimize Composer autoloader
composer install --optimize-autoloader --no-dev

# Enable OPcache (add to php.ini)
opcache.enable=1
opcache.memory_consumption=128
opcache.max_accelerated_files=10000
```

### Database Optimization

```sql
-- Add indexes for frequently queried columns
ALTER TABLE quiz_attempts ADD INDEX idx_user_subject (user_id, subject_id);
ALTER TABLE questions ADD INDEX idx_subject_active (subject_id, is_active);
```

### Caching Strategy

```env
# Use Redis for better performance
CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_CONNECTION=redis
```

---

## 🔄 Backup Strategy

### Database Backup Script

```bash
#!/bin/bash
# backup.sh

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backups/quiz-app"
DB_NAME="quiz_app"

mkdir -p $BACKUP_DIR

# Backup database
mysqldump -u root -p$DB_PASSWORD $DB_NAME > $BACKUP_DIR/db_$DATE.sql

# Backup files
tar -czf $BACKUP_DIR/files_$DATE.tar.gz /var/www/quiz-app

# Keep only last 7 days of backups
find $BACKUP_DIR -type f -mtime +7 -delete

echo "Backup completed: $DATE"
```

### Automated Backups

```bash
# Add to crontab (crontab -e)
0 2 * * * /path/to/backup.sh
```

---

## 📱 Mobile App Considerations

If you want to create a mobile app:

### Option 1: PWA (Progressive Web App)

Add to `public/manifest.json`:

```json
{
    "name": "Quiz Application",
    "short_name": "Quiz App",
    "start_url": "/",
    "display": "standalone",
    "background_color": "#ffffff",
    "theme_color": "#10b981",
    "icons": [
        {
            "src": "/icon-192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "/icon-512.png",
            "sizes": "512x512",
            "type": "image/png"
        }
    ]
}
```

### Option 2: Native Mobile (Flutter/React Native)

Build a REST API:

```bash
# Install Laravel Sanctum for API authentication
composer require laravel/sanctum
php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
php artisan migrate
```

---

## 🐛 Debugging in Production

### Enable Debug Mode Temporarily

```bash
# Edit .env
APP_DEBUG=true

# Clear cache
php artisan cache:clear
php artisan config:clear

# After debugging, set back to false
APP_DEBUG=false
php artisan config:cache
```

### Check Logs

```bash
# View latest errors
tail -f storage/logs/laravel.log

# View specific date
cat storage/logs/laravel-2024-01-22.log
```

---

## 📞 Support

If you encounter issues:

1. Check the [Troubleshooting](#-troubleshooting) section in main README
2. Review Laravel logs in `storage/logs/`
3. Search existing GitHub issues
4. Create a new issue with:
    - Error message
    - Steps to reproduce
    - Environment details (PHP version, OS, etc.)
