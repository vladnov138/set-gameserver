-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 28 2023 г., 18:06
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `set_game`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cards`
--

CREATE TABLE `cards` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` int NOT NULL,
  `cards` json DEFAULT (json_array()),
  `field_cards` json DEFAULT (json_array()),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cards`
--

INSERT INTO `cards` (`id`, `room_id`, `cards`, `field_cards`, `created_at`, `updated_at`) VALUES
(55, 55, '[{\"id\": 48, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 75, \"fill\": 1, \"color\": 3, \"count\": 3, \"shape\": 3}, {\"id\": 13, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 2}, {\"id\": 67, \"fill\": 2, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 61, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 1}, {\"id\": 17, \"fill\": 3, \"color\": 1, \"count\": 2, \"shape\": 2}, {\"id\": 81, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 3}, {\"id\": 65, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 2}, {\"id\": 45, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 60, \"fill\": 2, \"color\": 3, \"count\": 3, \"shape\": 1}, {\"id\": 8, \"fill\": 3, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 59, \"fill\": 2, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 55, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 1}, {\"id\": 3, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 1}, {\"id\": 15, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 23, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 3}, {\"id\": 36, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 1}, {\"id\": 68, \"fill\": 2, \"color\": 3, \"count\": 2, \"shape\": 2}, {\"id\": 46, \"fill\": 1, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 32, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 1}, {\"id\": 49, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 14, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 2}, {\"id\": 42, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 66, \"fill\": 1, \"color\": 3, \"count\": 3, \"shape\": 2}, {\"id\": 4, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 69, \"fill\": 2, \"color\": 3, \"count\": 3, \"shape\": 2}, {\"id\": 28, \"fill\": 1, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 53, \"fill\": 3, \"color\": 2, \"count\": 2, \"shape\": 3}, {\"id\": 76, \"fill\": 2, \"color\": 3, \"count\": 1, \"shape\": 3}, {\"id\": 16, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 2}, {\"id\": 37, \"fill\": 1, \"color\": 2, \"count\": 1, \"shape\": 2}, {\"id\": 79, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 3}, {\"id\": 74, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 3}, {\"id\": 64, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 18, \"fill\": 3, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 78, \"fill\": 2, \"color\": 3, \"count\": 3, \"shape\": 3}, {\"id\": 21, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 3}, {\"id\": 2, \"fill\": 1, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 50, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 3}, {\"id\": 39, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 6, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 1}, {\"id\": 7, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 9, \"fill\": 3, \"color\": 1, \"count\": 3, \"shape\": 1}, {\"id\": 29, \"fill\": 1, \"color\": 2, \"count\": 2, \"shape\": 1}, {\"id\": 22, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 3}, {\"id\": 77, \"fill\": 2, \"color\": 3, \"count\": 2, \"shape\": 3}, {\"id\": 56, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 20, \"fill\": 1, \"color\": 1, \"count\": 2, \"shape\": 3}, {\"id\": 5, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 26, \"fill\": 3, \"color\": 1, \"count\": 2, \"shape\": 3}, {\"id\": 35, \"fill\": 3, \"color\": 2, \"count\": 2, \"shape\": 1}, {\"id\": 62, \"fill\": 3, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 1, \"fill\": 1, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 43, \"fill\": 3, \"color\": 2, \"count\": 1, \"shape\": 2}, {\"id\": 51, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 24, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 3}, {\"id\": 19, \"fill\": 1, \"color\": 1, \"count\": 1, \"shape\": 3}, {\"id\": 72, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 2}, {\"id\": 73, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 3}, {\"id\": 11, \"fill\": 1, \"color\": 1, \"count\": 2, \"shape\": 2}, {\"id\": 41, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 58, \"fill\": 2, \"color\": 3, \"count\": 1, \"shape\": 1}, {\"id\": 70, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 27, \"fill\": 3, \"color\": 1, \"count\": 3, \"shape\": 3}, {\"id\": 47, \"fill\": 1, \"color\": 2, \"count\": 2, \"shape\": 3}, {\"id\": 31, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 38, \"fill\": 1, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 44, \"fill\": 3, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 33, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 1}]', '[{\"id\": 34, \"fill\": 3, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 25, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 3}, {\"id\": 63, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 1}, {\"id\": 10, \"fill\": 1, \"color\": 1, \"count\": 1, \"shape\": 2}, {\"id\": 12, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 54, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 71, \"fill\": 3, \"color\": 3, \"count\": 2, \"shape\": 2}, {\"id\": 30, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 1}, {\"id\": 40, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 2}, {\"id\": 80, \"fill\": 3, \"color\": 3, \"count\": 2, \"shape\": 3}, {\"id\": 52, \"fill\": 3, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 57, \"fill\": 1, \"color\": 3, \"count\": 3, \"shape\": 1}]', '2023-04-21 11:20:46', '2023-04-21 11:20:46'),
(75, 75, '[{\"id\": 30, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 1}, {\"id\": 4, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 70, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 1, \"fill\": 1, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 52, \"fill\": 3, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 12, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 14, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 2}, {\"id\": 28, \"fill\": 1, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 54, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 67, \"fill\": 2, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 20, \"fill\": 1, \"color\": 1, \"count\": 2, \"shape\": 3}, {\"id\": 13, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 2}, {\"id\": 46, \"fill\": 1, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 18, \"fill\": 3, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 59, \"fill\": 2, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 40, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 2}, {\"id\": 6, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 1}, {\"id\": 2, \"fill\": 1, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 73, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 3}, {\"id\": 43, \"fill\": 3, \"color\": 2, \"count\": 1, \"shape\": 2}, {\"id\": 41, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 55, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 1}, {\"id\": 62, \"fill\": 3, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 64, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 75, \"fill\": 1, \"color\": 3, \"count\": 3, \"shape\": 3}, {\"id\": 25, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 3}, {\"id\": 39, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 65, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 2}, {\"id\": 23, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 3}, {\"id\": 71, \"fill\": 3, \"color\": 3, \"count\": 2, \"shape\": 2}, {\"id\": 7, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 80, \"fill\": 3, \"color\": 3, \"count\": 2, \"shape\": 3}, {\"id\": 33, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 1}, {\"id\": 19, \"fill\": 1, \"color\": 1, \"count\": 1, \"shape\": 3}, {\"id\": 61, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 1}, {\"id\": 32, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 1}, {\"id\": 22, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 3}, {\"id\": 56, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 38, \"fill\": 1, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 34, \"fill\": 3, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 51, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 72, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 2}, {\"id\": 36, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 1}, {\"id\": 79, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 3}, {\"id\": 42, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 31, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 9, \"fill\": 3, \"color\": 1, \"count\": 3, \"shape\": 1}, {\"id\": 68, \"fill\": 2, \"color\": 3, \"count\": 2, \"shape\": 2}, {\"id\": 57, \"fill\": 1, \"color\": 3, \"count\": 3, \"shape\": 1}, {\"id\": 48, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 8, \"fill\": 3, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 16, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 2}, {\"id\": 21, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 3}, {\"id\": 44, \"fill\": 3, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 63, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 1}, {\"id\": 5, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 69, \"fill\": 2, \"color\": 3, \"count\": 3, \"shape\": 2}]', '[{\"id\": 49, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 15, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 26, \"fill\": 3, \"color\": 1, \"count\": 2, \"shape\": 3}, {\"id\": 58, \"fill\": 2, \"color\": 3, \"count\": 1, \"shape\": 1}, {\"id\": 74, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 3}, {\"id\": 81, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 3}, {\"id\": 3, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 1}, {\"id\": 50, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 3}, {\"id\": 45, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 53, \"fill\": 3, \"color\": 2, \"count\": 2, \"shape\": 3}, {\"id\": 60, \"fill\": 2, \"color\": 3, \"count\": 3, \"shape\": 1}, {\"id\": 24, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 3}]', '2023-04-22 12:12:50', '2023-04-22 12:19:11'),
(109, 109, '[{\"id\": 60, \"fill\": 2, \"color\": 3, \"count\": 3, \"shape\": 1}, {\"id\": 15, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 36, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 1}, {\"id\": 9, \"fill\": 3, \"color\": 1, \"count\": 3, \"shape\": 1}, {\"id\": 68, \"fill\": 2, \"color\": 3, \"count\": 2, \"shape\": 2}, {\"id\": 79, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 3}, {\"id\": 62, \"fill\": 3, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 34, \"fill\": 3, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 73, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 3}, {\"id\": 50, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 3}, {\"id\": 54, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 2, \"fill\": 1, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 46, \"fill\": 1, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 27, \"fill\": 3, \"color\": 1, \"count\": 3, \"shape\": 3}, {\"id\": 44, \"fill\": 3, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 74, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 3}, {\"id\": 51, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 6, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 1}, {\"id\": 37, \"fill\": 1, \"color\": 2, \"count\": 1, \"shape\": 2}, {\"id\": 33, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 1}, {\"id\": 61, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 1}, {\"id\": 47, \"fill\": 1, \"color\": 2, \"count\": 2, \"shape\": 3}, {\"id\": 78, \"fill\": 2, \"color\": 3, \"count\": 3, \"shape\": 3}, {\"id\": 39, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 65, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 2}, {\"id\": 10, \"fill\": 1, \"color\": 1, \"count\": 1, \"shape\": 2}, {\"id\": 17, \"fill\": 3, \"color\": 1, \"count\": 2, \"shape\": 2}, {\"id\": 14, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 2}, {\"id\": 38, \"fill\": 1, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 31, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 63, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 1}, {\"id\": 24, \"fill\": 2, \"color\": 1, \"count\": 3, \"shape\": 3}, {\"id\": 45, \"fill\": 3, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 64, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 42, \"fill\": 2, \"color\": 2, \"count\": 3, \"shape\": 2}, {\"id\": 77, \"fill\": 2, \"color\": 3, \"count\": 2, \"shape\": 3}, {\"id\": 81, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 3}, {\"id\": 48, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 3}, {\"id\": 67, \"fill\": 2, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 20, \"fill\": 1, \"color\": 1, \"count\": 2, \"shape\": 3}, {\"id\": 1, \"fill\": 1, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 28, \"fill\": 1, \"color\": 2, \"count\": 1, \"shape\": 1}, {\"id\": 40, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 2}, {\"id\": 18, \"fill\": 3, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 5, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 8, \"fill\": 3, \"color\": 1, \"count\": 2, \"shape\": 1}, {\"id\": 59, \"fill\": 2, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 66, \"fill\": 1, \"color\": 3, \"count\": 3, \"shape\": 2}, {\"id\": 56, \"fill\": 1, \"color\": 3, \"count\": 2, \"shape\": 1}, {\"id\": 70, \"fill\": 3, \"color\": 3, \"count\": 1, \"shape\": 2}, {\"id\": 25, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 3}, {\"id\": 52, \"fill\": 3, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 53, \"fill\": 3, \"color\": 2, \"count\": 2, \"shape\": 3}, {\"id\": 22, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 3}, {\"id\": 4, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 72, \"fill\": 3, \"color\": 3, \"count\": 3, \"shape\": 2}, {\"id\": 80, \"fill\": 3, \"color\": 3, \"count\": 2, \"shape\": 3}, {\"id\": 21, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 3}, {\"id\": 23, \"fill\": 2, \"color\": 1, \"count\": 2, \"shape\": 3}, {\"id\": 76, \"fill\": 2, \"color\": 3, \"count\": 1, \"shape\": 3}, {\"id\": 16, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 2}, {\"id\": 12, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 2}, {\"id\": 69, \"fill\": 2, \"color\": 3, \"count\": 3, \"shape\": 2}]', '[{\"id\": 55, \"fill\": 1, \"color\": 3, \"count\": 1, \"shape\": 1}, {\"id\": 49, \"fill\": 2, \"color\": 2, \"count\": 1, \"shape\": 3}, {\"id\": 75, \"fill\": 1, \"color\": 3, \"count\": 3, \"shape\": 3}, {\"id\": 57, \"fill\": 1, \"color\": 3, \"count\": 3, \"shape\": 1}, {\"id\": 32, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 1}, {\"id\": 41, \"fill\": 2, \"color\": 2, \"count\": 2, \"shape\": 2}, {\"id\": 30, \"fill\": 1, \"color\": 2, \"count\": 3, \"shape\": 1}, {\"id\": 29, \"fill\": 1, \"color\": 2, \"count\": 2, \"shape\": 1}, {\"id\": 7, \"fill\": 3, \"color\": 1, \"count\": 1, \"shape\": 1}, {\"id\": 11, \"fill\": 1, \"color\": 1, \"count\": 2, \"shape\": 2}, {\"id\": 13, \"fill\": 2, \"color\": 1, \"count\": 1, \"shape\": 2}, {\"id\": 3, \"fill\": 1, \"color\": 1, \"count\": 3, \"shape\": 1}]', '2023-04-22 13:12:50', '2023-04-22 13:12:52');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

CREATE TABLE `games` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int NOT NULL,
  `players` json DEFAULT (json_array()),
  `is_processing` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `games`
--

INSERT INTO `games` (`id`, `name`, `creator_id`, `players`, `is_processing`, `created_at`, `updated_at`) VALUES
(55, 'vladnov138 room', 1, '[1]', 1, '2023-04-21 11:20:46', '2023-04-21 11:20:46'),
(75, 'Ivan_Sergeevich room', 3, '[3]', 1, '2023-04-22 12:12:50', '2023-04-22 12:12:50'),
(109, 'vanka room', 2, '[2]', 1, '2023-04-22 13:12:50', '2023-04-22 13:12:50');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(48, '2014_10_12_000000_create_users_table', 1),
(49, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(50, '2019_08_19_000000_create_failed_jobs_table', 1),
(51, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(52, '2023_04_14_031545_create_games', 1),
(53, '2023_04_16_090023_create_cards_table', 1),
(54, '2023_04_16_090333_create_scores_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `scores`
--

CREATE TABLE `scores` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` int NOT NULL,
  `players_scores` json DEFAULT (json_array()),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `scores`
--

INSERT INTO `scores` (`id`, `room_id`, `players_scores`, `created_at`, `updated_at`) VALUES
(55, 55, '{\"1\": 0}', '2023-04-21 11:20:46', '2023-04-21 11:20:46'),
(75, 75, '{\"3\": 7}', '2023-04-22 12:12:50', '2023-04-22 12:19:11'),
(109, 109, '{\"2\": 2}', '2023-04-22 13:12:50', '2023-04-22 13:12:52');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `api_token`, `room_id`, `created_at`, `updated_at`) VALUES
(1, 'vladnov138', '$2y$10$r3ZOwp7cGduOIXYtY/PAHerf9M20b9g0/MIed2n3Mm9cdf9LBJvF6', 'MVIAHAbMJz8qJ0oPITsY3yO18orUMWYiM0hP7XtKVGAWDUVH4hbxNHaNqbDH', 55, '2023-04-17 02:09:55', '2023-04-21 11:20:46'),
(2, 'vanka', '$2y$10$BPz6AwqECwK7uzxbadESTuNYLbGiZupikx1XAx1/6Mdb/sjpIOOR6', '1qRuvIGnzfjlAlmbUit0lTMdb44Xa6MnHkMuhByDLi9g4qUJqnrYYgWeRm1w', 109, '2023-04-22 11:24:44', '2023-04-22 13:12:50'),
(3, 'Ivan_Sergeevich', '$2y$10$HpFts71S737e7XRgb5uRcepFtVPr9OcWfud09SBbXQ5hQcQ/7ptba', 'u1AgimoFift2sdrF6K3WGhPZqZxlbILXDytSympgKd88Hh54sGRUS0fC8hyk', 75, '2023-04-22 11:28:33', '2023-04-22 12:12:50');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cards_room_id_unique` (`room_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `games_name_unique` (`name`),
  ADD UNIQUE KEY `games_creator_id_unique` (`creator_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `scores_room_id_unique` (`room_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `scores`
--
ALTER TABLE `scores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
