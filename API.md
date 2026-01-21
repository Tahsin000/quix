# API Documentation

## Overview

This document describes the REST API endpoints available in the Quiz Application. These endpoints can be used to integrate with mobile apps, third-party services, or build custom frontends.

## Authentication

The application uses Laravel Sanctum for API authentication.

### Get API Token

```http
POST /api/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password"
}
```

**Response:**

```json
{
    "user": {
        "id": 1,
        "name": "John Doe",
        "email": "user@example.com"
    },
    "token": "1|abcdef123456..."
}
```

**Usage:**

```http
Authorization: Bearer 1|abcdef123456...
```

---

## Endpoints

### Subjects

#### Get All Subjects

```http
GET /api/subjects
Authorization: Bearer {token}
```

**Response:**

```json
{
    "data": [
        {
            "id": 1,
            "name": "Mathematics",
            "description": "Basic math questions",
            "questions_count": 25,
            "is_active": true
        }
    ]
}
```

#### Get Subject Details

```http
GET /api/subjects/{id}
Authorization: Bearer {token}
```

---

### Questions

#### Get Questions for Subject

```http
GET /api/subjects/{subjectId}/questions?count=10
Authorization: Bearer {token}
```

**Query Parameters:**

- `count` (optional): Number of questions (default: 10)

**Response:**

```json
{
    "data": [
        {
            "id": 1,
            "question_text": "What is 2 + 2?",
            "option_a": "3",
            "option_b": "4",
            "option_c": "5",
            "option_d": "6"
        }
    ],
    "quiz_session_id": "abc123"
}
```

---

### Quiz Attempts

#### Submit Answer

```http
POST /api/quiz/answer
Authorization: Bearer {token}
Content-Type: application/json

{
  "question_id": 1,
  "selected_answer": "b",
  "time_taken": 5.23,
  "started_at": 1705843200000
}
```

**Response:**

```json
{
    "is_correct": true,
    "correct_answer": "b",
    "explanation": "The correct answer is: B"
}
```

#### Get Quiz Results

```http
GET /api/quiz/{subjectId}/results
Authorization: Bearer {token}
```

**Response:**

```json
{
    "subject": {
        "id": 1,
        "name": "Mathematics"
    },
    "total_questions": 10,
    "correct_answers": 8,
    "incorrect_answers": 2,
    "percentage": 80,
    "time_taken": 125.5,
    "avg_time_per_question": 12.55,
    "attempts": [
        {
            "question_id": 1,
            "is_correct": true,
            "time_taken": 5.2
        }
    ]
}
```

---

### User Statistics

#### Get User Stats

```http
GET /api/user/stats
Authorization: Bearer {token}
```

**Response:**

```json
{
    "total_attempts": 150,
    "correct_answers": 120,
    "incorrect_answers": 30,
    "accuracy": 80,
    "subject_stats": [
        {
            "subject_id": 1,
            "subject_name": "Mathematics",
            "total_attempts": 50,
            "correct_count": 40,
            "accuracy": 80
        }
    ]
}
```

---

### Quiz Requests

#### Submit Question

```http
POST /api/quiz-requests
Authorization: Bearer {token}
Content-Type: application/json

{
  "subject_id": 1,
  "question_text": "What is the capital of France?",
  "option_a": "London",
  "option_b": "Berlin",
  "option_c": "Paris",
  "option_d": "Madrid",
  "correct_answer": "c"
}
```

#### Bulk Submit Questions

```http
POST /api/quiz-requests/bulk
Authorization: Bearer {token}
Content-Type: application/json

{
  "questions": [
    {
      "subject_id": 1,
      "question_text": "Question 1?",
      "option_a": "A",
      "option_b": "B",
      "option_c": "C",
      "option_d": "D",
      "correct_answer": "a"
    }
  ]
}
```

#### Get My Requests

```http
GET /api/quiz-requests
Authorization: Bearer {token}
```

---

## Error Responses

### 401 Unauthorized

```json
{
    "message": "Unauthenticated."
}
```

### 422 Validation Error

```json
{
    "message": "The given data was invalid.",
    "errors": {
        "email": ["The email field is required."]
    }
}
```

### 404 Not Found

```json
{
    "message": "Resource not found."
}
```

### 500 Server Error

```json
{
    "message": "Server Error",
    "error": "Detailed error message"
}
```

---

## Rate Limiting

API endpoints are rate-limited to prevent abuse:

- **Authentication**: 5 requests per minute
- **General API**: 60 requests per minute
- **Bulk Operations**: 10 requests per minute

**Rate Limit Headers:**

```http
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 59
X-RateLimit-Reset: 1705843200
```

---

## Webhooks (Future Feature)

Coming soon: Real-time notifications for quiz submissions, approvals, etc.

---

## SDK Examples

### JavaScript (Axios)

```javascript
const axios = require("axios");

const api = axios.create({
    baseURL: "http://localhost:8000/api",
    headers: {
        Authorization: "Bearer YOUR_TOKEN",
        "Content-Type": "application/json",
    },
});

// Get subjects
const subjects = await api.get("/subjects");

// Submit answer
const result = await api.post("/quiz/answer", {
    question_id: 1,
    selected_answer: "b",
    time_taken: 5.23,
});
```

### Python (Requests)

```python
import requests

headers = {
    'Authorization': 'Bearer YOUR_TOKEN',
    'Content-Type': 'application/json'
}

# Get subjects
response = requests.get('http://localhost:8000/api/subjects', headers=headers)
subjects = response.json()

# Submit answer
data = {
    'question_id': 1,
    'selected_answer': 'b',
    'time_taken': 5.23
}
response = requests.post('http://localhost:8000/api/quiz/answer', json=data, headers=headers)
```

### Flutter (Dart)

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizApi {
  final String baseUrl = 'http://localhost:8000/api';
  final String token;

  QuizApi(this.token);

  Future<List<dynamic>> getSubjects() async {
    final response = await http.get(
      Uri.parse('$baseUrl/subjects'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    }
    throw Exception('Failed to load subjects');
  }
}
```
