-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql100.infinityfree.com
-- Generation Time: Jan 21, 2026 at 01:13 PM
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
('quiz-app-cache-livewire-rate-limiter:b1e8171c8aa2d77bff9b53bdc802390a5084c60c', 'i:1;', 1768942780),
('quiz-app-cache-livewire-rate-limiter:b1e8171c8aa2d77bff9b53bdc802390a5084c60c:timer', 'i:1768942780;', 1768942780);

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
(21, 4, 'Which of the following is explicitly mentioned as NOT being within the scope of Natural Language Processing?', 'Text processing', 'Speech processing', 'Sign language communication', 'Machine translation', 'c', 1, 5, '2026-01-21 04:43:28', '2026-01-21 04:43:28'),
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
(40, 4, 'What is the main challenge mentioned for developing high-performing NLP models for regional languages like Bengali?', 'Lack of interest from researchers', 'High quality training data scarcity', 'The language is too easy for machines to understand', 'There are no computers in the region', 'b', 1, 5, '2026-01-21 04:46:06', '2026-01-21 04:46:06'),
(41, 4, 'According to the sources, what is considered the \'Extreme Dream\' or ultimate goal of Artificial Intelligence?', 'Creating robots with physical strength exceeding humans', 'Developing systems with efficiency at least equal to or greater than humans', 'Building a global network for all human knowledge', 'Eliminating the need for human programming languages', 'b', 1, 1, '2026-01-21 21:03:30', '2026-01-21 21:03:30'),
(42, 4, 'How does the source describe the difference between Natural Language Processing (NLP) and Computational Linguistics?', 'NLP is theoretical, while Computational Linguistics is applied', 'NLP is an applied field, while Computational Linguistics is more theoretical and linguistics-focused', 'NLP only focuses on speech, while Computational Linguistics only focuses on text', 'There is no functional difference between the two fields', 'b', 1, 1, '2026-01-21 21:03:44', '2026-01-21 21:03:44'),
(43, 4, 'Why is the \'Black Box\' nature of Deep Learning models considered a challenge in fields like healthcare and law?', 'It makes the models too slow for real-time use', 'It is difficult to understand the reasoning or evidence behind a specific output', 'The models cannot process more than one language at a time', 'It requires expensive specialized hardware to function', 'b', 1, 1, '2026-01-21 21:03:55', '2026-01-21 21:03:55'),
(44, 4, 'Which organization developed the Falcon 180B model mentioned in the sources?', 'OpenAI', 'Google DeepMind', 'Technology Innovation Institute', 'Meta', 'c', 1, 1, '2026-01-21 21:03:56', '2026-01-21 21:03:56'),
(45, 4, 'According to PWC\'s estimates, how much could AI and NLP potentially contribute to the global economy?', '1.5 Trillion USD', '15.7 Trillion USD', '50 Billion USD', '100 Trillion USD', 'b', 1, 1, '2026-01-21 21:04:01', '2026-01-21 21:04:01'),
(46, 4, 'In what year did the first research paper on Bengali Natural Language Processing, focusing on sentence parsing, appear?', '1939', '1952', '1997', '2026', 'c', 1, 1, '2026-01-21 21:04:17', '2026-01-21 21:04:17'),
(47, 4, 'What is the primary focus of \'Green AI\' in the development of Large Language Models?', 'Creating models for agricultural monitoring', 'Using less power and energy for training and running models', 'Increasing the number of parameters to maximum capacity', 'Developing models specifically for environmental activists', 'b', 1, 1, '2026-01-21 21:04:20', '2026-01-21 21:04:20'),
(48, 4, 'The EBLICT project by the Bangladesh Government aims to develop how many specific NLP tools or software components?', '5', '10', '16', '20', 'c', 1, 1, '2026-01-21 21:04:30', '2026-01-21 21:04:30'),
(49, 4, 'Which form of communication is explicitly mentioned as being outside the scope of Natural Language Processing (NLP)?', 'Written text', 'Spoken speech', 'Sign language communication', 'Digital messaging', 'c', 1, 1, '2026-01-21 21:04:57', '2026-01-21 21:04:57'),
(50, 4, 'According to the sources, approximately how many dominant languages are spoken by 70% to 80% of the world\'s population?', '7,000', '1,000', '100', '20', 'd', 1, 1, '2026-01-21 21:05:15', '2026-01-21 21:05:15'),
(51, 4, 'According to the sources, what are the two main forms of human language used for interaction that Natural Language Processing (NLP) focuses on?,', 'Spoken and sign language', 'Text and non-verbal communication', 'Spoken and written forms', 'Digital and analog signals', 'c', 1, 1, '2026-01-21 21:16:22', '2026-01-21 21:16:22'),
(52, 4, 'What is referred to as the \'Extreme Dream of AI\' regarding the development of artificial systems?,', 'Creating systems that can perfectly simulate human emotions', 'Building a system with efficiency at least equal to or greater than a human\'s', 'Developing a machine that can translate all 7,000 world languages', 'Designing hardware that never requires a power source', 'b', 1, 1, '2026-01-21 21:16:32', '2026-01-21 21:16:32'),
(53, 4, 'According to the lecture, approximately how many dominant languages are spoken by 70% to 80% of the global population today?,', '1,000', '100', '50', '20', 'd', 1, 1, '2026-01-21 21:16:34', '2026-01-21 21:16:34'),
(54, 4, 'How does the source distinguish between Natural Language Processing (NLP) and Computational Linguistics?,', 'NLP is purely theoretical, while Computational Linguistics is an applied field', 'NLP is an applied or application-based field, while Computational Linguistics is more theoretical', 'NLP focuses on hardware, while Computational Linguistics focuses on software', 'There is no difference between the two fields', 'b', 1, 1, '2026-01-21 21:16:36', '2026-01-21 21:16:36'),
(55, 4, 'Why are languages like Bengali, Arabic, and Hindi classified as \'Low Resource Languages\' in the context of NLP?,', 'They are spoken by very few people globally', 'They have very simple grammatical structures', 'They lack sufficient high-quality training data available on the web', 'They are only used for spoken communication and not written', 'c', 1, 1, '2026-01-21 21:16:39', '2026-01-21 21:16:39'),
(56, 4, 'What is the primary goal of \'Green AI\' as described in the sources?', 'To develop AI systems for environmental monitoring', 'To use less power and energy to run and train large models', 'To increase the number of parameters in language models', 'To ensure AI models are only used in green energy sectors', 'b', 1, 1, '2026-01-21 21:16:42', '2026-01-21 21:16:42'),
(57, 4, 'The EBLICT project by the Bangladesh Government aims to develop how many specific NLP tools or software components?', '5', '10', '16', '20', 'c', 1, 1, '2026-01-21 21:19:04', '2026-01-21 21:19:04'),
(58, 4, 'In what year was the first research paper on Bengali Natural Language Processing, focusing on simple sentence parsing, published?', '1952', '1990', '1997', '2026', 'c', 1, 1, '2026-01-21 21:19:04', '2026-01-21 21:19:04'),
(59, 4, 'According to PWC, how much is AI and NLP potentially estimated to contribute to the global economy?', '1.5 Trillion USD', '15.7 Trillion USD', '500 Billion USD', '100 Trillion USD', 'b', 1, 1, '2026-01-21 21:19:05', '2026-01-21 21:19:05'),
(60, 4, 'Why is the \'Black Box\' nature of Deep Learning models a significant concern in sensitive fields like healthcare and law?,', 'The models are too expensive to maintain', 'The models take too much time to generate a response', 'It is difficult to understand the evidence or reasoning behind the model\'s decisions', 'The models are unable to process multi-lingual data', 'c', 1, 1, '2026-01-21 21:19:10', '2026-01-21 21:19:10'),
(61, 4, 'What is defined as the \'Extreme Dream of AI\' in the lecture materials?', 'Creating systems that can store all human knowledge', 'Developing an artificial system with efficiency equal to or greater than a human\'s', 'Designing a universal translator for all 7,000 languages', 'Building robots that can perfectly replicate human movement', 'b', 1, 1, '2026-01-21 21:19:10', '2026-01-21 21:19:10'),
(62, 4, 'According to the sources, which form of communication is specifically excluded from the scope of Natural Language Processing (NLP)?', 'Spoken language', 'Written text', 'Non-verbal or sign language communication', 'Digital text processing', 'c', 1, 1, '2026-01-21 21:19:11', '2026-01-21 21:19:11'),
(63, 4, 'In the context of language processing, what is the primary distinction between NLP and Computational Linguistics?', 'NLP is purely theoretical while Computational Linguistics is applied', 'NLP is an applied field, while Computational Linguistics is more theoretical and focuses on linguistics', 'NLP focuses on hardware while Computational Linguistics focuses on software', 'There is no distinction mentioned in the sources', 'b', 1, 1, '2026-01-21 21:19:46', '2026-01-21 21:19:46'),
(64, 4, 'In what year was the first research paper on Bengali Natural Language Processing, focusing on simple sentence parsing, published?', '1939', '1952', '1997', '2020', 'c', 1, 1, '2026-01-21 21:19:48', '2026-01-21 21:19:48'),
(65, 4, 'Which model is mentioned as being developed by the Technology Innovation Institute with 180 billion parameters?', 'GPT-4', 'Falcon 180B', 'Gemini 1.5', 'Llama 3', 'b', 1, 1, '2026-01-21 21:19:51', '2026-01-21 21:19:51'),
(66, 4, 'How much does PWC estimate that AI and NLP could potentially contribute to the global economy?', '1.5 Trillion USD', '5.7 Trillion USD', '15.7 Trillion USD', '100 Trillion USD', 'c', 1, 1, '2026-01-21 21:19:55', '2026-01-21 21:19:55'),
(67, 4, 'According to the text, approximately 70-80% of the world\'s population speaks how many dominant languages?', '1,000', '100', '20', '50', 'c', 1, 1, '2026-01-21 21:20:20', '2026-01-21 21:20:20'),
(68, 4, 'Why are languages like Bengali, Arabic, and Hindi classified as \'Low Resource Languages\'?', 'They are rarely spoken by local populations', 'They have very few speakers globally', 'They lack high-quality training data and web content for model development', 'They do not have established grammatical rules', 'c', 1, 1, '2026-01-21 21:38:18', '2026-01-21 21:38:18'),
(69, 4, 'Under the Bangladesh Government\'s EBLICT project, how many NLP tools or software components are planned for development?', '5', '10', '16', '25', 'c', 1, 1, '2026-01-21 21:38:21', '2026-01-21 21:38:21'),
(70, 4, 'What is the specific goal of \'Green AI\' as described in the sources?', 'To develop AI for climate change monitoring', 'To use less power and energy for training and running models', 'To ensure AI data centers are built in green spaces', 'To eliminate the use of carbon-based data', 'b', 1, 1, '2026-01-21 21:38:23', '2026-01-21 21:38:23'),
(71, 4, 'Why is the \'Black Box\' nature of Deep Learning models a concern in fields like healthcare and law?', 'Because the models are too expensive to run', 'Because it makes the reasoning or evidence behind a decision difficult to understand', 'Because the models cannot process legal or medical terminology', 'Because it requires the constant use of physical switches', 'b', 1, 1, '2026-01-21 21:39:06', '2026-01-21 21:39:06'),
(72, 4, 'Under the EBLICT project by the Bangladesh Government, how many NLP tools or software components are being developed?', '5', '10', '16', '20', 'c', 1, 1, '2026-01-21 21:39:08', '2026-01-21 21:39:08'),
(73, 4, 'What is the specific goal of \'Green AI\' in the context of large language models?', 'To use less power and energy for training and running models', 'To develop models that predict climate change', 'To increase the number of parameters to over 1 trillion', 'To ensure models are only used in the agricultural sector', 'a', 1, 1, '2026-01-21 21:39:10', '2026-01-21 21:39:10'),
(74, 4, 'In what year was the first research paper on Bengali Natural Language Processing published?', '1952', '1990', '1997', '2026', 'c', 1, 1, '2026-01-21 21:39:13', '2026-01-21 21:39:13'),
(75, 4, 'Why are languages like Bengali, Arabic, and Hindi referred to as \'Low Resource Languages\'?', 'They are rarely spoken by many people', 'They have limited high-quality training data available on the web', 'They do not have a written script', 'They are only used in rural areas', 'b', 1, 1, '2026-01-21 21:39:14', '2026-01-21 21:39:14'),
(76, 4, 'What is the primary difference between Natural Language Processing (NLP) and Computational Linguistics?', 'NLP is purely theoretical while Computational Linguistics is applied', 'NLP is an applied field while Computational Linguistics is more theoretical and focuses on linguistics', 'NLP only processes English while Computational Linguistics processes all languages', 'NLP is a branch of hardware engineering while Computational Linguistics is software-based', 'b', 1, 1, '2026-01-21 21:39:15', '2026-01-21 21:39:15'),
(77, 4, 'According to the text, what percentage of the world\'s population speaks the top 20 dominant languages?', '10-20%', '30-40%', '50-60%', '70-80%', 'd', 1, 1, '2026-01-21 21:39:22', '2026-01-21 21:39:22'),
(78, 4, 'Which form of communication is explicitly mentioned as NOT being within the scope of Natural Language Processing (NLP)?', 'Spoken language', 'Written text', 'Sign language or non-verbal communication', 'Digital messaging', 'c', 1, 1, '2026-01-21 21:39:24', '2026-01-21 21:39:24'),
(79, 4, 'According to the user feedback in the sources, what issue is occurring with buttons in mobile responsive mode for login and registration pages?', 'The buttons are disappearing entirely', 'The buttons are breaking or failing to align properly', 'The buttons are changing colors randomly', 'The buttons are too small to click', 'b', 1, 1, '2026-01-21 21:39:57', '2026-01-21 21:39:57'),
(80, 4, 'What is described as the \'Extreme Dream of AI\' according to the sources?', 'Creating robots with physical strength superior to humans', 'Developing a system with efficiency at least equal to or greater than humans', 'Building a machine that can store all human memories', 'Designing a global internet network accessible to everyone', 'b', 1, 1, '2026-01-21 21:40:23', '2026-01-21 21:40:23');

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
(25, 5, 4, 10, 'b', 0, '2026-01-21 04:38:00', '2026-01-21 04:38:00'),
(28, 2, 4, 38, 'd', 1, '2026-01-21 06:54:48', '2026-01-21 06:54:48'),
(29, 2, 4, 39, 'c', 1, '2026-01-21 06:55:08', '2026-01-21 06:55:08'),
(35, 1, 4, 51, 'd', 0, '2026-01-21 21:41:32', '2026-01-21 21:41:32'),
(36, 1, 4, 52, 'b', 1, '2026-01-21 21:41:46', '2026-01-21 21:41:46');

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
(34, 5, 4, 'Why is the \'Black Box\' nature of Deep Learning models a significant concern in fields like healthcare and law?', 'Because the models require too much storage space', 'Because it makes it difficult to understand the evidence or reasoning behind a model\'s specific decision', 'Because these models are only capable of processing text and not images', 'Because the hardware required to run them is not yet invented', 'b', 'approved', NULL, 3, '2026-01-21 04:42:28', '2026-01-21 04:35:39', '2026-01-21 04:42:28'),
(35, 1, 4, 'According to the sources, what is considered the \'Extreme Dream\' or ultimate goal of Artificial Intelligence?', 'Creating robots with physical strength exceeding humans', 'Developing systems with efficiency at least equal to or greater than humans', 'Building a global network for all human knowledge', 'Eliminating the need for human programming languages', 'b', 'approved', NULL, 3, '2026-01-21 21:03:30', '2026-01-21 21:01:27', '2026-01-21 21:03:30'),
(36, 1, 4, 'Which form of communication is explicitly mentioned as being outside the scope of Natural Language Processing (NLP)?', 'Written text', 'Spoken speech', 'Sign language communication', 'Digital messaging', 'c', 'approved', NULL, 3, '2026-01-21 21:04:57', '2026-01-21 21:01:27', '2026-01-21 21:04:57'),
(37, 1, 4, 'According to the sources, approximately how many dominant languages are spoken by 70% to 80% of the world\'s population?', '7,000', '1,000', '100', '20', 'd', 'approved', NULL, 3, '2026-01-21 21:05:15', '2026-01-21 21:01:27', '2026-01-21 21:05:15'),
(38, 1, 4, 'In what year did the first research paper on Bengali Natural Language Processing, focusing on sentence parsing, appear?', '1939', '1952', '1997', '2026', 'c', 'approved', NULL, 3, '2026-01-21 21:04:17', '2026-01-21 21:01:27', '2026-01-21 21:04:17'),
(39, 1, 4, 'What is the primary focus of \'Green AI\' in the development of Large Language Models?', 'Creating models for agricultural monitoring', 'Using less power and energy for training and running models', 'Increasing the number of parameters to maximum capacity', 'Developing models specifically for environmental activists', 'b', 'approved', NULL, 3, '2026-01-21 21:04:20', '2026-01-21 21:01:27', '2026-01-21 21:04:20'),
(40, 1, 4, 'The EBLICT project by the Bangladesh Government aims to develop how many specific NLP tools or software components?', '5', '10', '16', '20', 'c', 'approved', NULL, 3, '2026-01-21 21:04:30', '2026-01-21 21:01:27', '2026-01-21 21:04:30'),
(41, 1, 4, 'According to PWC\'s estimates, how much could AI and NLP potentially contribute to the global economy?', '1.5 Trillion USD', '15.7 Trillion USD', '50 Billion USD', '100 Trillion USD', 'b', 'approved', NULL, 3, '2026-01-21 21:04:01', '2026-01-21 21:01:27', '2026-01-21 21:04:01'),
(42, 1, 4, 'Which organization developed the Falcon 180B model mentioned in the sources?', 'OpenAI', 'Google DeepMind', 'Technology Innovation Institute', 'Meta', 'c', 'approved', NULL, 3, '2026-01-21 21:03:56', '2026-01-21 21:01:27', '2026-01-21 21:03:56'),
(43, 1, 4, 'Why is the \'Black Box\' nature of Deep Learning models considered a challenge in fields like healthcare and law?', 'It makes the models too slow for real-time use', 'It is difficult to understand the reasoning or evidence behind a specific output', 'The models cannot process more than one language at a time', 'It requires expensive specialized hardware to function', 'b', 'approved', NULL, 3, '2026-01-21 21:03:55', '2026-01-21 21:01:27', '2026-01-21 21:03:55'),
(44, 1, 4, 'How does the source describe the difference between Natural Language Processing (NLP) and Computational Linguistics?', 'NLP is theoretical, while Computational Linguistics is applied', 'NLP is an applied field, while Computational Linguistics is more theoretical and linguistics-focused', 'NLP only focuses on speech, while Computational Linguistics only focuses on text', 'There is no functional difference between the two fields', 'b', 'approved', NULL, 3, '2026-01-21 21:03:44', '2026-01-21 21:01:27', '2026-01-21 21:03:44'),
(45, 1, 4, 'What is described as the \'Extreme Dream of AI\' according to the sources?', 'Creating robots with physical strength superior to humans', 'Developing a system with efficiency at least equal to or greater than humans', 'Building a machine that can store all human memories', 'Designing a global internet network accessible to everyone', 'b', 'approved', NULL, 3, '2026-01-21 21:40:23', '2026-01-21 21:11:43', '2026-01-21 21:40:23'),
(46, 1, 4, 'Which form of communication is explicitly mentioned as NOT being within the scope of Natural Language Processing (NLP)?', 'Spoken language', 'Written text', 'Sign language or non-verbal communication', 'Digital messaging', 'c', 'approved', NULL, 3, '2026-01-21 21:39:24', '2026-01-21 21:11:43', '2026-01-21 21:39:24'),
(47, 1, 4, 'According to the text, what percentage of the world\'s population speaks the top 20 dominant languages?', '10-20%', '30-40%', '50-60%', '70-80%', 'd', 'approved', NULL, 3, '2026-01-21 21:39:22', '2026-01-21 21:11:43', '2026-01-21 21:39:22'),
(48, 1, 4, 'What is the primary difference between Natural Language Processing (NLP) and Computational Linguistics?', 'NLP is purely theoretical while Computational Linguistics is applied', 'NLP is an applied field while Computational Linguistics is more theoretical and focuses on linguistics', 'NLP only processes English while Computational Linguistics processes all languages', 'NLP is a branch of hardware engineering while Computational Linguistics is software-based', 'b', 'approved', NULL, 3, '2026-01-21 21:39:15', '2026-01-21 21:11:43', '2026-01-21 21:39:15'),
(49, 1, 4, 'Why are languages like Bengali, Arabic, and Hindi referred to as \'Low Resource Languages\'?', 'They are rarely spoken by many people', 'They have limited high-quality training data available on the web', 'They do not have a written script', 'They are only used in rural areas', 'b', 'approved', NULL, 3, '2026-01-21 21:39:14', '2026-01-21 21:11:43', '2026-01-21 21:39:14'),
(50, 1, 4, 'How much does PWC estimate that AI and NLP could potentially contribute to the global economy?', '1.5 Trillion USD', '5.7 Trillion USD', '15.7 Trillion USD', '100 Trillion USD', 'c', 'approved', NULL, 3, '2026-01-21 21:19:55', '2026-01-21 21:11:43', '2026-01-21 21:19:55'),
(51, 1, 4, 'In what year was the first research paper on Bengali Natural Language Processing published?', '1952', '1990', '1997', '2026', 'c', 'approved', NULL, 3, '2026-01-21 21:39:13', '2026-01-21 21:11:43', '2026-01-21 21:39:13'),
(52, 1, 4, 'What is the specific goal of \'Green AI\' in the context of large language models?', 'To use less power and energy for training and running models', 'To develop models that predict climate change', 'To increase the number of parameters to over 1 trillion', 'To ensure models are only used in the agricultural sector', 'a', 'approved', NULL, 3, '2026-01-21 21:39:10', '2026-01-21 21:11:43', '2026-01-21 21:39:10'),
(53, 1, 4, 'Under the EBLICT project by the Bangladesh Government, how many NLP tools or software components are being developed?', '5', '10', '16', '20', 'c', 'approved', NULL, 3, '2026-01-21 21:39:08', '2026-01-21 21:11:43', '2026-01-21 21:39:08'),
(54, 1, 4, 'Why is the \'Black Box\' nature of Deep Learning models a concern in fields like healthcare and law?', 'Because the models are too expensive to run', 'Because it makes the reasoning or evidence behind a decision difficult to understand', 'Because the models cannot process legal or medical terminology', 'Because it requires the constant use of physical switches', 'b', 'approved', NULL, 3, '2026-01-21 21:39:06', '2026-01-21 21:11:43', '2026-01-21 21:39:06'),
(55, 1, 4, 'According to the sources, which form of communication is specifically excluded from the scope of Natural Language Processing (NLP)?', 'Spoken language', 'Written text', 'Non-verbal or sign language communication', 'Digital text processing', 'c', 'approved', NULL, 3, '2026-01-21 21:19:11', '2026-01-21 21:13:03', '2026-01-21 21:19:11'),
(56, 1, 4, 'What is defined as the \'Extreme Dream of AI\' in the lecture materials?', 'Creating systems that can store all human knowledge', 'Developing an artificial system with efficiency equal to or greater than a human\'s', 'Designing a universal translator for all 7,000 languages', 'Building robots that can perfectly replicate human movement', 'b', 'approved', NULL, 3, '2026-01-21 21:19:10', '2026-01-21 21:13:03', '2026-01-21 21:19:10'),
(57, 1, 4, 'In the context of language processing, what is the primary distinction between NLP and Computational Linguistics?', 'NLP is purely theoretical while Computational Linguistics is applied', 'NLP is an applied field, while Computational Linguistics is more theoretical and focuses on linguistics', 'NLP focuses on hardware while Computational Linguistics focuses on software', 'There is no distinction mentioned in the sources', 'b', 'approved', NULL, 3, '2026-01-21 21:19:46', '2026-01-21 21:13:03', '2026-01-21 21:19:46'),
(58, 1, 4, 'According to the text, approximately 70-80% of the world\'s population speaks how many dominant languages?', '1,000', '100', '20', '50', 'c', 'approved', NULL, 3, '2026-01-21 21:20:20', '2026-01-21 21:13:03', '2026-01-21 21:20:20'),
(59, 1, 4, 'Why are languages like Bengali, Arabic, and Hindi classified as \'Low Resource Languages\'?', 'They are rarely spoken by local populations', 'They have very few speakers globally', 'They lack high-quality training data and web content for model development', 'They do not have established grammatical rules', 'c', 'approved', NULL, 3, '2026-01-21 21:38:18', '2026-01-21 21:13:03', '2026-01-21 21:38:18'),
(60, 1, 4, 'Under the Bangladesh Government\'s EBLICT project, how many NLP tools or software components are planned for development?', '5', '10', '16', '25', 'c', 'approved', NULL, 3, '2026-01-21 21:38:21', '2026-01-21 21:13:03', '2026-01-21 21:38:21'),
(61, 1, 4, 'What is the specific goal of \'Green AI\' as described in the sources?', 'To develop AI for climate change monitoring', 'To use less power and energy for training and running models', 'To ensure AI data centers are built in green spaces', 'To eliminate the use of carbon-based data', 'b', 'approved', NULL, 3, '2026-01-21 21:38:23', '2026-01-21 21:13:03', '2026-01-21 21:38:23'),
(62, 1, 4, 'In what year was the first research paper on Bengali Natural Language Processing, focusing on simple sentence parsing, published?', '1939', '1952', '1997', '2020', 'c', 'approved', NULL, 3, '2026-01-21 21:19:48', '2026-01-21 21:13:03', '2026-01-21 21:19:48'),
(63, 1, 4, 'Which model is mentioned as being developed by the Technology Innovation Institute with 180 billion parameters?', 'GPT-4', 'Falcon 180B', 'Gemini 1.5', 'Llama 3', 'b', 'approved', NULL, 3, '2026-01-21 21:19:51', '2026-01-21 21:13:03', '2026-01-21 21:19:51'),
(64, 1, 4, 'According to the user feedback in the sources, what issue is occurring with buttons in mobile responsive mode for login and registration pages?', 'The buttons are disappearing entirely', 'The buttons are breaking or failing to align properly', 'The buttons are changing colors randomly', 'The buttons are too small to click', 'b', 'approved', NULL, 3, '2026-01-21 21:39:57', '2026-01-21 21:13:03', '2026-01-21 21:39:57'),
(65, 1, 4, 'According to the sources, what are the two main forms of human language used for interaction that Natural Language Processing (NLP) focuses on?,', 'Spoken and sign language', 'Text and non-verbal communication', 'Spoken and written forms', 'Digital and analog signals', 'c', 'approved', NULL, 3, '2026-01-21 21:16:22', '2026-01-21 21:13:55', '2026-01-21 21:16:22'),
(66, 1, 4, 'What is referred to as the \'Extreme Dream of AI\' regarding the development of artificial systems?,', 'Creating systems that can perfectly simulate human emotions', 'Building a system with efficiency at least equal to or greater than a human\'s', 'Developing a machine that can translate all 7,000 world languages', 'Designing hardware that never requires a power source', 'b', 'approved', NULL, 3, '2026-01-21 21:16:32', '2026-01-21 21:13:55', '2026-01-21 21:16:32'),
(67, 1, 4, 'According to the lecture, approximately how many dominant languages are spoken by 70% to 80% of the global population today?,', '1,000', '100', '50', '20', 'd', 'approved', NULL, 3, '2026-01-21 21:16:34', '2026-01-21 21:13:55', '2026-01-21 21:16:34'),
(68, 1, 4, 'How does the source distinguish between Natural Language Processing (NLP) and Computational Linguistics?,', 'NLP is purely theoretical, while Computational Linguistics is an applied field', 'NLP is an applied or application-based field, while Computational Linguistics is more theoretical', 'NLP focuses on hardware, while Computational Linguistics focuses on software', 'There is no difference between the two fields', 'b', 'approved', NULL, 3, '2026-01-21 21:16:36', '2026-01-21 21:13:55', '2026-01-21 21:16:36'),
(69, 1, 4, 'Why are languages like Bengali, Arabic, and Hindi classified as \'Low Resource Languages\' in the context of NLP?,', 'They are spoken by very few people globally', 'They have very simple grammatical structures', 'They lack sufficient high-quality training data available on the web', 'They are only used for spoken communication and not written', 'c', 'approved', NULL, 3, '2026-01-21 21:16:39', '2026-01-21 21:13:55', '2026-01-21 21:16:39'),
(70, 1, 4, 'What is the primary goal of \'Green AI\' as described in the sources?', 'To develop AI systems for environmental monitoring', 'To use less power and energy to run and train large models', 'To increase the number of parameters in language models', 'To ensure AI models are only used in green energy sectors', 'b', 'approved', NULL, 3, '2026-01-21 21:16:42', '2026-01-21 21:13:55', '2026-01-21 21:16:42'),
(71, 1, 4, 'The EBLICT project by the Bangladesh Government aims to develop how many specific NLP tools or software components?', '5', '10', '16', '20', 'c', 'approved', NULL, 3, '2026-01-21 21:19:04', '2026-01-21 21:13:55', '2026-01-21 21:19:04'),
(72, 1, 4, 'In what year was the first research paper on Bengali Natural Language Processing, focusing on simple sentence parsing, published?', '1952', '1990', '1997', '2026', 'c', 'approved', NULL, 3, '2026-01-21 21:19:04', '2026-01-21 21:13:55', '2026-01-21 21:19:04'),
(73, 1, 4, 'According to PWC, how much is AI and NLP potentially estimated to contribute to the global economy?', '1.5 Trillion USD', '15.7 Trillion USD', '500 Billion USD', '100 Trillion USD', 'b', 'approved', NULL, 3, '2026-01-21 21:19:05', '2026-01-21 21:13:55', '2026-01-21 21:19:05'),
(74, 1, 4, 'Why is the \'Black Box\' nature of Deep Learning models a significant concern in sensitive fields like healthcare and law?,', 'The models are too expensive to maintain', 'The models take too much time to generate a response', 'It is difficult to understand the evidence or reasoning behind the model\'s decisions', 'The models are unable to process multi-lingual data', 'c', 'approved', NULL, 3, '2026-01-21 21:19:10', '2026-01-21 21:13:55', '2026-01-21 21:19:10');

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
('2DYpVKkp1WWeFv539DHrHNXvWyxJXheLGMsW4Vjo', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2V6Q3dLVjVjZm9OTkZuMnZwVklxbkF2b1pQOHlBeDh1OG1tS3RtZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9tc2UucGFnZS5nZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000350),
('6Kmo3dONfX767YYG6XLkHQfwDYq13AM5dv0YZHmQ', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOTBKV1h3OEVHSXNDQkVsdG03YVp0Umw4ZGl6a2hDTFpSNUg4V2xPbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769000378),
('EhpYXKHzYsCzkqXZ8fvVIa1eFRqvIvBu744kTL87', 1, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiTG5INzBKUG9IcTFIY0FzdkczTVFHUElJR245emdEOUY2OTdNRk40RSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vbXNlLnBhZ2UuZ2QvZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE1OiJxdWl6X3N0YXJ0X3RpbWUiO2Q6MTc2OTAwMjg4OC4yOTg5ODE5MDQ5ODM1MjA1MDc4MTI1O3M6MTg6ImN1cnJlbnRfc3ViamVjdF9pZCI7czoxOiI0IjtzOjE5OiJxdWl6X3F1ZXN0aW9uX2NvdW50IjtzOjI6IjcwIjtzOjI0OiJxdWl6X2F2YWlsYWJsZV9xdWVzdGlvbnMiO2k6NzA7czoyNDoicXVpel9hbnN3ZXJlZF9pbl9zZXNzaW9uIjthOjI6e2k6MDtpOjUxO2k6MTtpOjUyO319', 1769002926),
('HvTeUOsQldrarskbUbTy7tDhjGH6V1lKcheDlK87', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXVFeWRSbGRlclphcFA1Y05lWFUwdTB5YXU5ekFWYzRsaGdBajFqRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9tc2UucGFnZS5nZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000308),
('K75S1xPDDSxXG90wJmbzgmZScTn0uJkKemwQ0BdV', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFZRZ0Z2cGFMMkJUbHMzdWZFa3gwN2o3VFZHV2IzS05EemJPQmNlVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9tc2UucGFnZS5nZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000322),
('K7QoxIoSnlb8MfvhalSh4qtov9uvuRlIP9OqMuwG', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1lUaWVLbEVROTZYbjFSWWpjWE5MN2FTdFZNTTJYaDl1YnM4RGxLaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769000300),
('N2BfEgkX5TosgFGntUDCGaDBSKONC3WovgSjBC9Z', NULL, '202.65.173.16', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVTlMaDdoeFRaelZKNXhDMDlGNnVMOGFnR2FRVURTQTBTa1duMTVpWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769000417),
('NoEwAGT6qfwQIuP0Js7lo2tgYlEUhTF9MAF0WDJw', NULL, '202.65.173.16', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1VJbkF2OUloRGZ5a1B0dXBQZUtrbjNCc1R4UHVHYTljVUM2Um1kOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9tc2UucGFnZS5nZC9sb2dpbj9pPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769000404),
('PuC9m8vqln4d7AxgVCyOU7TiUuS0F11KToNery9Y', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRFJyeGtJbHVvUFdvNm5ESnlTTFIyN0VsYUdWZlhNRzlDRzdZYU5wSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769000336),
('qkNedmIKZRTPslmNYsR0M7js6aS7dS40m3eGKj8L', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQTZ6c3VQcENtYmp3UmtYYmxQTHo2YzVZb2wyOTVkTjlUOTY3ZGV4NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769000318),
('Qwy9X0WFIvqvW2yBZiyjbCqcHi3EO7o6PFibj9PO', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic254WmY4SUdsTlZwMnRjZ1Z3N0Y3VldzNEdGYjZNeTF2MUp2a1dQMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9tc2UucGFnZS5nZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000289),
('rljmVs6uO55pOKBFvUq4TTM6kqQv4liwQxPKW8Iv', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmtzNmlYVVJxZWNQSG1IbGFaQ1d3UXJ4RzRQdHNZRkc2TmJKWHhHcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly9tc2UucGFnZS5nZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000348),
('rrliqBFFbGREBjrlGS6AUjIc24JdU2eBnd924GK1', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEFRNkxXY0E5WHBPSGNpQ29TRmhFTU9Jd0s0SjZxZmJZb00wQmI5QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly9tc2UucGFnZS5nZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000287),
('TeekvZ8UqVbMmYIsajNJarfMqWulmGXEklyQ84qb', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2tjRlJmYTU0U3R2WnhwaUNxYXgwRldBdzNwdUZzRDJQRWFscnJORSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9tc2UucGFnZS5nZC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000387),
('uQllLEfoMCxoCjnhgjvoo7iRAFA0MRX9hGEKlPi3', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiemlTcDMxeG9aZVdYUUlLWkZpcEZnNTBlV3BKcTYwbFR5YjVzdXl0ZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769000343),
('wu8hCaOdKCUwF4Sfx6tV8egQxcnw3I3UuD0Z4PXf', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1FkS1pPanJDYWszRHlnamRlNUFYam40U1JsUFd6NE1SQ3dnZlRNViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vbXNlLnBhZ2UuZ2QvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769000286),
('ye3NatRPHmKcu5ERhXqXRpQsmVnK0xHKge42tBJK', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2VRdklwbVRobWdDajRLOVRiakg5MDdEWXVqRUN2bXRmNHhsM01DZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly9tc2UucGFnZS5nZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000385),
('ZYWCNsNt0aVtWyh0rW3N2zyXm24wnCbXtE0CAkPg', NULL, '202.65.173.16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWRHSzB3T2QwZVZhRGR2ak9pWk5zbmxNcXlXakFjTFNxbjhZZ3VJRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly9tc2UucGFnZS5nZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769000306);

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
(1, 'Research methodology', 'Test your Natural Research methodology knowledge', 1, '2026-01-20 08:30:14', '2026-01-21 21:07:45'),
(2, 'Network security', 'Explore scientific concepts Network security', 1, '2026-01-20 08:30:14', '2026-01-21 04:14:44'),
(3, 'Multimedia system design', 'Learn about Multimedia system design', 1, '2026-01-20 08:30:14', '2026-01-21 04:13:35'),
(4, 'Natural Language Processing', 'Learn about Natural Language Processing events', 1, '2026-01-21 04:15:00', '2026-01-21 21:08:06');

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
(1, 'Mishkatul Karim', 'mishkatulkarim@gmail.com', 'user', NULL, '$2y$12$ycJ6ohXHQWRF37WTcx50HO3X.IqeqCfrpnX5xv4DSCVm2odoGLl/q', NULL, '2026-01-20 08:30:14', '2026-01-20 08:30:14'),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `quiz_requests`
--
ALTER TABLE `quiz_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
