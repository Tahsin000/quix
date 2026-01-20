-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql100.infinityfree.com
-- Generation Time: Jan 20, 2026 at 03:46 PM
-- Server version: 11.4.9-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_40943015_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-livewire-rate-limiter:b1e8171c8aa2d77bff9b53bdc802390a5084c60c', 'i:3;', 1768940342),
('laravel-cache-livewire-rate-limiter:b1e8171c8aa2d77bff9b53bdc802390a5084c60c:timer', 'i:1768940342;', 1768940342),
('laravel-cache-mishkatulkarim@gmail.com|202.65.173.16', 'i:2;', 1768940377),
('laravel-cache-mishkatulkarim@gmail.com|202.65.173.16:timer', 'i:1768940377;', 1768940377),
('quiz-app-cache-livewire-rate-limiter:b1e8171c8aa2d77bff9b53bdc802390a5084c60c', 'i:1;', 1768941754),
('quiz-app-cache-livewire-rate-limiter:b1e8171c8aa2d77bff9b53bdc802390a5084c60c:timer', 'i:1768941754;', 1768941754);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_20_140719_create_subjects_table', 1),
(5, '2026_01_20_140728_create_questions_table', 1),
(6, '2026_01_20_140731_create_quiz_attempts_table', 1),
(7, '2026_01_20_140734_create_quiz_requests_table', 1),
(8, '2026_01_20_151401_add_role_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` enum('a','b','c','d') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `subject_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(9, 4, 'According to the sources, what is referred to as the \'Extreme Dream of AI\'?', 'Creating robots that can perform physical labor faster than humans', 'Developing an artificial system whose efficiency is at least equal to or greater than a human\'s', 'Designing a computer that can solve any mathematical equation in seconds', 'Building a global network that connects all human brains to the internet', 'b', 1, 5, '2026-01-21 04:36:42', '2026-01-21 04:36:42'),
(10, 4, 'Which form of communication is specifically mentioned as NOT being within the scope of Natural Language Processing (NLP)?', 'Written text', 'Spoken speech', 'Non-verbal communication or sign language', 'Digital messaging', 'c', 1, 5, '2026-01-21 04:36:54', '2026-01-21 04:36:54'),
(11, 4, 'What is the primary distinction the text makes between Natural Language Processing (NLP) and Computational Linguistics?', 'NLP is theoretical, while Computational Linguistics is an applied field', 'NLP is an applied field, while Computational Linguistics is more theoretical and focuses on the linguistic side', 'NLP focuses only on English, while Computational Linguistics focuses on all languages', 'There is no distinction; the terms are used interchangeably in the sources', 'b', 1, 5, '2026-01-21 04:37:05', '2026-01-21 04:37:05'),
(12, 4, 'According to the sources, how many dominant languages are spoken by approximately 70% to 80% of the world\'s population?', '7,000', '1,000', '100', '20', 'd', 1, 5, '2026-01-21 04:38:43', '2026-01-21 04:38:43'),
(13, 4, 'Which of the following is identified in the text as a \'Low Resource Language\' due to the scarcity of web content for training models?', 'English', 'French', 'Bengali', 'Chinese', 'c', 1, 5, '2026-01-21 04:39:13', '2026-01-21 04:39:13'),
(14, 4, 'In the context of the EBLICT project by the Bangladesh Government, how many NLP tools or software components are being developed?', '5', '10', '16', '20', 'c', 1, 5, '2026-01-21 04:39:24', '2026-01-21 04:39:24'),
(15, 4, 'What does \'Green AI\' prioritize in the development of Large Language Models (LLMs)?', 'Maximizing the number of parameters regardless of cost', 'Using less power and energy to run and train models', 'Developing models specifically for environmental monitoring', 'Ensuring all training data is sourced from eco-friendly organizations', 'b', 1, 5, '2026-01-21 04:39:34', '2026-01-21 04:39:34'),
(16, 4, 'Which Large Language Model (LLM) is mentioned as being developed by the Technology Innovation Institute with 180 billion parameters?', 'GPT-4', 'Gemini 1.5', 'Falcon 180B', 'Llama 3', 'c', 1, 5, '2026-01-21 04:39:47', '2026-01-21 04:39:47'),
(17, 4, 'According to the text, when was the first research paper on Bengali Natural Language Processing published?', '1952', '1997', '2020', '1939', 'b', 1, 5, '2026-01-21 04:42:00', '2026-01-21 04:42:00'),
(18, 4, 'Why is the \'Black Box\' nature of Deep Learning models a significant concern in fields like healthcare and law?', 'Because the models require too much storage space', 'Because it makes it difficult to understand the evidence or reasoning behind a model\'s specific decision', 'Because these models are only capable of processing text and not images', 'Because the hardware required to run them is not yet invented', 'b', 1, 5, '2026-01-21 04:42:28', '2026-01-21 04:42:28'),
(19, 4, 'According to the sources, what are the two main forms of human language used for communication that NLP focuses on?', 'Spoken and Sign Language', 'Spoken and Written', 'Written and Non-verbal', 'Digital and Analog', 'b', 1, 5, '2026-01-21 04:42:50', '2026-01-21 04:42:50'),
(20, 3, 'Dolores quos labore', 'Cum laudantium adip', 'Sed hic placeat rei', 'Qui dolore distincti', 'Est qui eligendi se', 'c', 1, 1, '2026-01-21 04:43:26', '2026-01-21 04:43:26'),
(21, 4, 'Which of the following is explicitly mentioned as NOT being within the scope of Natural Language Processing?', 'Text processing', 'Speech processing', 'Sign language communication', 'Machine translation', 'c', 1, 5, '2026-01-21 04:43:28', '2026-01-21 04:43:28'),
(22, 3, 'Enim eum ipsum quis', 'Adipisicing dolor sa', 'Rerum voluptatem mo', 'Quas labore ut excep', 'Tempora laudantium', 'a', 1, 1, '2026-01-21 04:43:30', '2026-01-21 04:43:30'),
(23, 4, 'What is referred to as the \'Extreme Dream\' or ultimate goal of Artificial Intelligence?', 'Creating systems that can only perform mathematical calculations', 'Developing systems with efficiency at least equal to or greater than humans', 'Replacing all human labor with basic hardware', 'Building systems that operate without software', 'b', 1, 5, '2026-01-21 04:43:31', '2026-01-21 04:43:31'),
(24, 4, 'What is the primary difference between Natural Language Processing (NLP) and Computational Linguistics as described in the text?', 'NLP is purely theoretical, while Computational Linguistics is applied.', 'NLP is an applied field, whereas Computational Linguistics is more theoretical and focuses on linguistic side.', 'NLP focuses only on audio, while Computational Linguistics focuses only on text.', 'There is no difference between the two fields.', 'b', 1, 5, '2026-01-21 04:43:32', '2026-01-21 04:43:32'),
(25, 4, 'According to the sources, why is the \'Black Box\' nature of Deep Learning models a concern in fields like healthcare and law?', 'Because the hardware is too expensive.', 'Because it makes the models run faster.', 'Because it is difficult to understand why the model made a specific decision or generated a specific response.', 'Because it prevents the models from being used on mobile devices.', 'c', 1, 5, '2026-01-21 04:43:34', '2026-01-21 04:43:34'),
(26, 4, 'Which field of NLP involves teaching machines to recognize human feelings such as frustration or confusion through audio and video?', 'Syntactic Analysis', 'Machine Translation', 'Emotional Intelligence / Sentiment Analysis', 'Code generation', 'c', 1, 5, '2026-01-21 04:43:35', '2026-01-21 04:43:35'),
(27, 4, 'What is the primary goal of the \'Explanatory AI\' or \'XAI\' in NLP research?', 'To make models run on less energy', 'To provide evidence and clarity on how models generate their outputs to build user trust', 'To increase the speed of text generation', 'To translate between 50 different languages simultaneously', 'b', 1, 5, '2026-01-21 04:43:37', '2026-01-21 04:43:37'),
(28, 4, 'What does \'Green AI\' prioritize in the development of Large Language Models?', 'Increasing the number of parameters to the maximum', 'Using more power to achieve faster training', 'Using less power and energy to run and train models', 'Developing models specifically for the agriculture industry', 'c', 1, 5, '2026-01-21 04:43:39', '2026-01-21 04:43:39'),
(29, 4, 'In the context of the sources, how many dominant languages are spoken by approximately 70-80% of the world\'s population?', '7,000', '1,000', '100', '20', 'd', 1, 5, '2026-01-21 04:44:30', '2026-01-21 04:44:30'),
(30, 4, 'Which application is described as the \'finest example\' of using NLP to analyze web text and generate appropriate responses?', 'Google Search', 'Facebook News Feed', 'ChatGPT', 'Microsoft Excel', 'c', 1, 5, '2026-01-21 04:44:31', '2026-01-21 04:44:31'),
(31, 4, 'Which term is used to describe languages like Bengali, Arabic, and Hindi that have relatively less data available on the web for training models?', 'High Resource Languages', 'Low Resource Languages', 'Dead Languages', 'Programming Languages', 'b', 1, 5, '2026-01-21 04:44:33', '2026-01-21 04:44:33'),
(32, 4, 'What are \'Digital BERT\' and \'Mobile BERT\' examples of?', 'Large-scale models that require supercomputers', 'Lightweight NLP versions designed for mobile or IoT devices', 'Programming languages used to code NLP', 'Robots used for physical human interaction', 'b', 1, 5, '2026-01-21 04:44:34', '2026-01-21 04:44:34'),
(33, 4, 'Which technology allows users to speak into a mobile device and have it converted into text for messaging?', 'OCR', 'ASR (Speech to Text)', 'Machine Translation', 'Spell Checker', 'b', 1, 5, '2026-01-21 04:44:36', '2026-01-21 04:44:36'),
(34, 4, 'What specific emotional and historical reason is cited for the importance of Bengali Language Processing?', 'The discovery of fire', 'The 1952 Language Movement where people sacrificed lives for the language', 'The invention of the first computer in Bengal', 'The global dominance of the Bengali film industry', 'b', 1, 5, '2026-01-21 04:44:36', '2026-01-21 04:44:36'),
(35, 4, 'Which company is mentioned in the sources as working on Bengali OCR (Optical Character Recognition) under the EBLICT project?', 'GigaTech', 'Reveille System', 'eGeneration', 'Microsoft', 'c', 1, 5, '2026-01-21 04:44:39', '2026-01-21 04:44:39'),
(36, 4, 'When did the first research paper on Bengali Natural Language Processing, focusing on parsing simple sentences, appear?', '1952', '1997', '2026', '1939', 'b', 1, 5, '2026-01-21 04:44:40', '2026-01-21 04:44:40'),
(37, 4, 'According to PWC, AI and NLP have the potential to contribute how much to the global economy?', '15.7 Trillion USD', '1 Billion USD', '500 Million USD', '100 Trillion USD', 'a', 1, 5, '2026-01-21 04:44:46', '2026-01-21 04:44:46'),
(38, 4, 'Which Large Language Model is mentioned as being developed by the Technology Innovation Institute with 180 billion parameters?', 'GPT-4', 'Llama', 'Gemini 1.5', 'Falcon 180B', 'd', 1, 5, '2026-01-21 04:45:21', '2026-01-21 04:45:21'),
(39, 4, 'The EBLICT project by the Bangladesh Government aims to develop how many NLP tools or software components?', '5', '10', '16', '50', 'c', 1, 5, '2026-01-21 04:45:48', '2026-01-21 04:45:48'),
(40, 4, 'What is the main challenge mentioned for developing high-performing NLP models for regional languages like Bengali?', 'Lack of interest from researchers', 'High quality training data scarcity', 'The language is too easy for machines to understand', 'There are no computers in the region', 'b', 1, 5, '2026-01-21 04:46:06', '2026-01-21 04:46:06');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `selected_answer` enum('a','b','c','d') NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_attempts`
--

INSERT INTO `quiz_attempts` (`id`, `user_id`, `subject_id`, `question_id`, `selected_answer`, `is_correct`, `created_at`, `updated_at`) VALUES
(24, 5, 4, 9, 'b', 1, '2026-01-21 04:37:54', '2026-01-21 04:37:54'),
(25, 5, 4, 10, 'b', 0, '2026-01-21 04:38:00', '2026-01-21 04:38:00');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_requests`
--

CREATE TABLE `quiz_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` enum('a','b','c','d') NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL,
  `reviewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_requests`
--

INSERT INTO `quiz_requests` (`id`, `user_id`, `subject_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `status`, `admin_notes`, `reviewed_by`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Nemo Nam id aperiam', 'Libero molestias et', 'Molestiae officiis i', 'Architecto reiciendi', 'Est autem sint eu qu', 'a', 'approved', NULL, 3, '2026-01-20 11:58:43', '2026-01-20 09:02:43', '2026-01-20 11:58:43'),
(2, 1, 1, 'Ipsa incididunt vel', 'Quia tempor enim exc', 'Quia omnis voluptate', 'Et enim ipsam ullamc', 'Ex dolore aliquip su', 'a', 'rejected', 'tik nai', 3, '2026-01-20 11:58:37', '2026-01-20 09:16:05', '2026-01-20 11:58:37'),
(3, 1, 3, 'Dolores quos labore', 'Cum laudantium adip', 'Sed hic placeat rei', 'Qui dolore distincti', 'Est qui eligendi se', 'c', 'approved', NULL, 3, '2026-01-21 04:43:26', '2026-01-20 12:09:25', '2026-01-21 04:43:26'),
(4, 1, 3, 'Enim eum ipsum quis', 'Adipisicing dolor sa', 'Rerum voluptatem mo', 'Quas labore ut excep', 'Tempora laudantium', 'a', 'approved', NULL, 3, '2026-01-21 04:43:30', '2026-01-20 12:09:37', '2026-01-21 04:43:30'),
(5, 5, 4, 'According to the sources, what are the two main forms of human language used for communication that NLP focuses on?', 'Spoken and Sign Language', 'Spoken and Written', 'Written and Non-verbal', 'Digital and Analog', 'b', 'approved', NULL, 3, '2026-01-21 04:42:50', '2026-01-21 04:34:19', '2026-01-21 04:42:50'),
(6, 5, 4, 'Which of the following is explicitly mentioned as NOT being within the scope of Natural Language Processing?', 'Text processing', 'Speech processing', 'Sign language communication', 'Machine translation', 'c', 'approved', NULL, 3, '2026-01-21 04:43:28', '2026-01-21 04:34:19', '2026-01-21 04:43:28'),
(7, 5, 4, 'What is referred to as the \'Extreme Dream\' or ultimate goal of Artificial Intelligence?', 'Creating systems that can only perform mathematical calculations', 'Developing systems with efficiency at least equal to or greater than humans', 'Replacing all human labor with basic hardware', 'Building systems that operate without software', 'b', 'approved', NULL, 3, '2026-01-21 04:43:31', '2026-01-21 04:34:19', '2026-01-21 04:43:31'),
(8, 5, 4, 'In the context of the sources, how many dominant languages are spoken by approximately 70-80% of the world\'s population?', '7,000', '1,000', '100', '20', 'd', 'approved', NULL, 3, '2026-01-21 04:44:30', '2026-01-21 04:34:19', '2026-01-21 04:44:30'),
(9, 5, 4, 'What is the primary difference between Natural Language Processing (NLP) and Computational Linguistics as described in the text?', 'NLP is purely theoretical, while Computational Linguistics is applied.', 'NLP is an applied field, whereas Computational Linguistics is more theoretical and focuses on linguistic side.', 'NLP focuses only on audio, while Computational Linguistics focuses only on text.', 'There is no difference between the two fields.', 'b', 'approved', NULL, 3, '2026-01-21 04:43:32', '2026-01-21 04:34:19', '2026-01-21 04:43:32'),
(10, 5, 4, 'Which term is used to describe languages like Bengali, Arabic, and Hindi that have relatively less data available on the web for training models?', 'High Resource Languages', 'Low Resource Languages', 'Dead Languages', 'Programming Languages', 'b', 'approved', NULL, 3, '2026-01-21 04:44:33', '2026-01-21 04:34:19', '2026-01-21 04:44:33'),
(11, 5, 4, 'According to the sources, why is the \'Black Box\' nature of Deep Learning models a concern in fields like healthcare and law?', 'Because the hardware is too expensive.', 'Because it makes the models run faster.', 'Because it is difficult to understand why the model made a specific decision or generated a specific response.', 'Because it prevents the models from being used on mobile devices.', 'c', 'approved', NULL, 3, '2026-01-21 04:43:34', '2026-01-21 04:34:19', '2026-01-21 04:43:34'),
(12, 5, 4, 'What does \'Green AI\' prioritize in the development of Large Language Models?', 'Increasing the number of parameters to the maximum', 'Using more power to achieve faster training', 'Using less power and energy to run and train models', 'Developing models specifically for the agriculture industry', 'c', 'approved', NULL, 3, '2026-01-21 04:43:39', '2026-01-21 04:34:19', '2026-01-21 04:43:39'),
(13, 5, 4, 'Which Large Language Model is mentioned as being developed by the Technology Innovation Institute with 180 billion parameters?', 'GPT-4', 'Llama', 'Gemini 1.5', 'Falcon 180B', 'd', 'approved', NULL, 3, '2026-01-21 04:45:21', '2026-01-21 04:34:19', '2026-01-21 04:45:21'),
(14, 5, 4, 'The EBLICT project by the Bangladesh Government aims to develop how many NLP tools or software components?', '5', '10', '16', '50', 'c', 'approved', NULL, 3, '2026-01-21 04:45:48', '2026-01-21 04:34:19', '2026-01-21 04:45:48'),
(15, 5, 4, 'When did the first research paper on Bengali Natural Language Processing, focusing on parsing simple sentences, appear?', '1952', '1997', '2026', '1939', 'b', 'approved', NULL, 3, '2026-01-21 04:44:40', '2026-01-21 04:34:19', '2026-01-21 04:44:40'),
(16, 5, 4, 'According to PWC, AI and NLP have the potential to contribute how much to the global economy?', '15.7 Trillion USD', '1 Billion USD', '500 Million USD', '100 Trillion USD', 'a', 'approved', NULL, 3, '2026-01-21 04:44:46', '2026-01-21 04:34:19', '2026-01-21 04:44:46'),
(17, 5, 4, 'What is the main challenge mentioned for developing high-performing NLP models for regional languages like Bengali?', 'Lack of interest from researchers', 'High quality training data scarcity', 'The language is too easy for machines to understand', 'There are no computers in the region', 'b', 'approved', NULL, 3, '2026-01-21 04:46:06', '2026-01-21 04:34:19', '2026-01-21 04:46:06'),
(18, 5, 4, 'Which company is mentioned in the sources as working on Bengali OCR (Optical Character Recognition) under the EBLICT project?', 'GigaTech', 'Reveille System', 'eGeneration', 'Microsoft', 'c', 'approved', NULL, 3, '2026-01-21 04:44:39', '2026-01-21 04:34:19', '2026-01-21 04:44:39'),
(19, 5, 4, 'What specific emotional and historical reason is cited for the importance of Bengali Language Processing?', 'The discovery of fire', 'The 1952 Language Movement where people sacrificed lives for the language', 'The invention of the first computer in Bengal', 'The global dominance of the Bengali film industry', 'b', 'approved', NULL, 3, '2026-01-21 04:44:36', '2026-01-21 04:34:19', '2026-01-21 04:44:36'),
(20, 5, 4, 'Which technology allows users to speak into a mobile device and have it converted into text for messaging?', 'OCR', 'ASR (Speech to Text)', 'Machine Translation', 'Spell Checker', 'b', 'approved', NULL, 3, '2026-01-21 04:44:36', '2026-01-21 04:34:19', '2026-01-21 04:44:36'),
(21, 5, 4, 'What are \'Digital BERT\' and \'Mobile BERT\' examples of?', 'Large-scale models that require supercomputers', 'Lightweight NLP versions designed for mobile or IoT devices', 'Programming languages used to code NLP', 'Robots used for physical human interaction', 'b', 'approved', NULL, 3, '2026-01-21 04:44:34', '2026-01-21 04:34:19', '2026-01-21 04:44:34'),
(22, 5, 4, 'Which application is described as the \'finest example\' of using NLP to analyze web text and generate appropriate responses?', 'Google Search', 'Facebook News Feed', 'ChatGPT', 'Microsoft Excel', 'c', 'approved', NULL, 3, '2026-01-21 04:44:31', '2026-01-21 04:34:19', '2026-01-21 04:44:31'),
(23, 5, 4, 'What is the primary goal of the \'Explanatory AI\' or \'XAI\' in NLP research?', 'To make models run on less energy', 'To provide evidence and clarity on how models generate their outputs to build user trust', 'To increase the speed of text generation', 'To translate between 50 different languages simultaneously', 'b', 'approved', NULL, 3, '2026-01-21 04:43:37', '2026-01-21 04:34:19', '2026-01-21 04:43:37'),
(24, 5, 4, 'Which field of NLP involves teaching machines to recognize human feelings such as frustration or confusion through audio and video?', 'Syntactic Analysis', 'Machine Translation', 'Emotional Intelligence / Sentiment Analysis', 'Code generation', 'c', 'approved', NULL, 3, '2026-01-21 04:43:35', '2026-01-21 04:34:19', '2026-01-21 04:43:35'),
(25, 5, 4, 'According to the sources, what is referred to as the \'Extreme Dream of AI\'?', 'Creating robots that can perform physical labor faster than humans', 'Developing an artificial system whose efficiency is at least equal to or greater than a human\'s', 'Designing a computer that can solve any mathematical equation in seconds', 'Building a global network that connects all human brains to the internet', 'b', 'approved', NULL, 3, '2026-01-21 04:36:42', '2026-01-21 04:35:39', '2026-01-21 04:36:42'),
(26, 5, 4, 'Which form of communication is specifically mentioned as NOT being within the scope of Natural Language Processing (NLP)?', 'Written text', 'Spoken speech', 'Non-verbal communication or sign language', 'Digital messaging', 'c', 'approved', NULL, 3, '2026-01-21 04:36:54', '2026-01-21 04:35:39', '2026-01-21 04:36:54'),
(27, 5, 4, 'What is the primary distinction the text makes between Natural Language Processing (NLP) and Computational Linguistics?', 'NLP is theoretical, while Computational Linguistics is an applied field', 'NLP is an applied field, while Computational Linguistics is more theoretical and focuses on the linguistic side', 'NLP focuses only on English, while Computational Linguistics focuses on all languages', 'There is no distinction; the terms are used interchangeably in the sources', 'b', 'approved', NULL, 3, '2026-01-21 04:37:05', '2026-01-21 04:35:39', '2026-01-21 04:37:05'),
(28, 5, 4, 'According to the sources, how many dominant languages are spoken by approximately 70% to 80% of the world\'s population?', '7,000', '1,000', '100', '20', 'd', 'approved', NULL, 3, '2026-01-21 04:38:43', '2026-01-21 04:35:39', '2026-01-21 04:38:43'),
(29, 5, 4, 'Which of the following is identified in the text as a \'Low Resource Language\' due to the scarcity of web content for training models?', 'English', 'French', 'Bengali', 'Chinese', 'c', 'approved', NULL, 3, '2026-01-21 04:39:13', '2026-01-21 04:35:39', '2026-01-21 04:39:13'),
(30, 5, 4, 'In the context of the EBLICT project by the Bangladesh Government, how many NLP tools or software components are being developed?', '5', '10', '16', '20', 'c', 'approved', NULL, 3, '2026-01-21 04:39:24', '2026-01-21 04:35:39', '2026-01-21 04:39:24'),
(31, 5, 4, 'What does \'Green AI\' prioritize in the development of Large Language Models (LLMs)?', 'Maximizing the number of parameters regardless of cost', 'Using less power and energy to run and train models', 'Developing models specifically for environmental monitoring', 'Ensuring all training data is sourced from eco-friendly organizations', 'b', 'approved', NULL, 3, '2026-01-21 04:39:34', '2026-01-21 04:35:39', '2026-01-21 04:39:34'),
(32, 5, 4, 'Which Large Language Model (LLM) is mentioned as being developed by the Technology Innovation Institute with 180 billion parameters?', 'GPT-4', 'Gemini 1.5', 'Falcon 180B', 'Llama 3', 'c', 'approved', NULL, 3, '2026-01-21 04:39:47', '2026-01-21 04:35:39', '2026-01-21 04:39:47'),
(33, 5, 4, 'According to the text, when was the first research paper on Bengali Natural Language Processing published?', '1952', '1997', '2020', '1939', 'b', 'approved', NULL, 3, '2026-01-21 04:42:00', '2026-01-21 04:35:39', '2026-01-21 04:42:00'),
(34, 5, 4, 'Why is the \'Black Box\' nature of Deep Learning models a significant concern in fields like healthcare and law?', 'Because the models require too much storage space', 'Because it makes it difficult to understand the evidence or reasoning behind a model\'s specific decision', 'Because these models are only capable of processing text and not images', 'Because the hardware required to run them is not yet invented', 'b', 'approved', NULL, 3, '2026-01-21 04:42:28', '2026-01-21 04:35:39', '2026-01-21 04:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2rnRZ3MKfpB2laAernwhG5t0H9yUds8atrteJLxn', 3, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTXlQeGdsd1NlbEFER3liSk9VNVd1bkZTWjd4NTFhODE2cnJjZEp3VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vbXNlLnBhZ2UuZ2QvYWRtaW4vcXVpei1yZXF1ZXN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiROb2lMamsyUjhUc1V2SHg0cUN3YTZPbUJXTmtlNk1icS83TlguaVlBdDBIT0ZWRW1TTHBRSyI7czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1768941598),
('4VuO0S6xkSbv2a0N0x0ytVlbN4O4U2EJRhyFJOyb', 3, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVDdEa05BazBOaGFGaVhicFV5d09JM05mcXNIdUZGMnJEdlh6clRVMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM5OiJodHRwczovL21zZS5wYWdlLmdkL2FkbWluL3F1aXotcmVxdWVzdHMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkTm9pTGprMlI4VHNVdkh4NHFDd2E2T21CV05rZTZNYnEvN05YLmlZQXQwSE9GVkVtU0xwUUsiO3M6ODoiZmlsYW1lbnQiO2E6MTp7czoxMzoibm90aWZpY2F0aW9ucyI7YToxOntpOjA7YToxMTp7czoyOiJpZCI7czozNjoiYTBlMjYzYzEtOGZmMC00NGRkLTgyZjctN2E1MzM5ZTZkOWUxIjtzOjc6ImFjdGlvbnMiO2E6MDp7fXM6NDoiYm9keSI7czo0NToiVGhlIHF1ZXN0aW9uIGhhcyBiZWVuIGFkZGVkIHRvIHRoZSBxdWl6IHBvb2wuIjtzOjU6ImNvbG9yIjtOO3M6ODoiZHVyYXRpb24iO2k6NjAwMDtzOjQ6Imljb24iO3M6MjM6Imhlcm9pY29uLW8tY2hlY2stY2lyY2xlIjtzOjk6Imljb25Db2xvciI7czo3OiJzdWNjZXNzIjtzOjY6InN0YXR1cyI7czo3OiJzdWNjZXNzIjtzOjU6InRpdGxlIjtzOjIxOiJRdWl6IFJlcXVlc3QgQXBwcm92ZWQiO3M6NDoidmlldyI7czozNjoiZmlsYW1lbnQtbm90aWZpY2F0aW9uczo6bm90aWZpY2F0aW9uIjtzOjg6InZpZXdEYXRhIjthOjA6e319fX1zOjY6InRhYmxlcyI7YToxOntzOjQxOiJiYjliMDBhNzgwNmY3MzAzZjdlNTQyMjFlYmI4MWY0Zl9wZXJfcGFnZSI7czoyOiI1MCI7fX0=', 1768941967),
('hykcYjb68XydjwS7IqwLQQGb3fH4Cvz8wSeIXAKK', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU0lub0lndDFLT1d6VXZFSDVkNkxiYUtnaG8wblFsV1NlYmxxZTV1dyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768941669),
('NENrJ160R4SxKzsgzpdCLTjDWQ8QRjWZ7l8tsZVm', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV2Nud211YXF3MzBmbUhzZGRDcWZ1RExIN3FlQUtrNlFCR0hZZ2xVbiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMDoiaHR0cDovL21zZS5wYWdlLmdkL3F1aXovNC9uZXh0Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9tc2UucGFnZS5nZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768941669),
('O7AOeJFENOeKHcyyXu9tGTuHQgbMegaaWp6dnL0U', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVkVlaWhjbUtoWTVUT3VGdGZRcTN3bk5oOE5OY3NRaUw1NkxQa1NNbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9teS1zdGF0cyI7czo1OiJyb3V0ZSI7czoxNzoicHJvZmlsZS5kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI1YjJkZDgzMjgzYmRlNjNkYTBhMzZjMmE5MDNlZDJkZWY1NWVjOTk1ODQxMTQ0OWQ4ZWRlZWVkMjAyOTRjNjdjIjtzOjE5OiJxdWl6X3F1ZXN0aW9uX2NvdW50IjtpOjQ7czoxNToicXVpel9zdGFydF90aW1lIjtkOjE3Njg5MzQ3MTguNjMwNzM4O3M6MTg6ImN1cnJlbnRfc3ViamVjdF9pZCI7czoxOiIxIjt9', 1768934787),
('oOPhyon3mrEfVtBFLK7rKKfmj7AGQY0iG7qTgaz0', 5, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiaWF5V3lOcThZclBEQ2FITHV6NlpJMGZFeGlTdjRhbVJVdFlKMXRkeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9tc2UucGFnZS5nZC9xdWl6LzQvbmV4dCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU7czoxNToicXVpel9zdGFydF90aW1lIjtkOjE3Njg5NDE0NjkuMDM5NDgyMTE2Njk5MjE4NzU7czoxODoiY3VycmVudF9zdWJqZWN0X2lkIjtzOjE6IjQiO3M6MTk6InF1aXpfcXVlc3Rpb25fY291bnQiO3M6MToiMyI7czoyNDoicXVpel9hdmFpbGFibGVfcXVlc3Rpb25zIjtpOjM7czoyNDoicXVpel9hbnN3ZXJlZF9pbl9zZXNzaW9uIjthOjI6e2k6MDtpOjk7aToxO2k6MTA7fX0=', 1768941485);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Natural Language Processing', 'Test your Natural Language Processing knowledge', 1, '2026-01-20 08:30:14', '2026-01-21 04:14:03'),
(2, 'Network security', 'Explore scientific concepts Network security', 1, '2026-01-20 08:30:14', '2026-01-21 04:14:44'),
(3, 'Multimedia system design', 'Learn about Multimedia system design', 1, '2026-01-20 08:30:14', '2026-01-21 04:13:35'),
(4, 'Research methodology', 'Learn about Research methodology events', 1, '2026-01-21 04:15:00', '2026-01-21 04:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mishkatul Karim', 'mishkatulkarim@gmail.com\r\n', 'user', NULL, '$2y$12$ycJ6ohXHQWRF37WTcx50HO3X.IqeqCfrpnX5xv4DSCVm2odoGLl/q', NULL, '2026-01-20 08:30:14', '2026-01-20 08:30:14'),
(2, 'Admin User', '123@gmail.com', 'user', NULL, '$2y$12$ycJ6ohXHQWRF37WTcx50HO3X.IqeqCfrpnX5xv4DSCVm2odoGLl/q', NULL, '2026-01-20 08:30:14', '2026-01-21 04:19:48'),
(3, 'Admin', 'admin@gmail.com', 'admin', NULL, '$2y$12$NoiLjk2R8TsUvHx4qCwa6OmBWNke6Mbq/7NX.iYAt0HOFVEmSLpQK', NULL, '2026-01-20 08:30:57', '2026-01-20 08:30:57'),
(4, 'Portia Mcknight', 'renuvutifa@mailinator.com', 'user', NULL, '$2y$12$feb39aVKvz5pSEQf93ZSHuCHucS2mONyieWsnREv7.yz.NbLuCifG', NULL, '2026-01-20 12:04:03', '2026-01-20 12:04:03'),
(5, 'Jibon Mallick', 'jibonmallick017260@gmail.com', 'user', NULL, '$2y$12$ycJ6ohXHQWRF37WTcx50HO3X.IqeqCfrpnX5xv4DSCVm2odoGLl/q', NULL, '2026-01-20 08:30:14', '2026-01-21 04:19:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_subject_id_foreign` (`subject_id`),
  ADD KEY `questions_created_by_foreign` (`created_by`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_attempts_user_id_foreign` (`user_id`),
  ADD KEY `quiz_attempts_subject_id_foreign` (`subject_id`),
  ADD KEY `quiz_attempts_question_id_foreign` (`question_id`);

--
-- Indexes for table `quiz_requests`
--
ALTER TABLE `quiz_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_requests_user_id_foreign` (`user_id`),
  ADD KEY `quiz_requests_subject_id_foreign` (`subject_id`),
  ADD KEY `quiz_requests_reviewed_by_foreign` (`reviewed_by`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subjects_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `quiz_requests`
--
ALTER TABLE `quiz_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `questions_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `quiz_attempts_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_attempts_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_requests`
--
ALTER TABLE `quiz_requests`
  ADD CONSTRAINT `quiz_requests_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quiz_requests_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
