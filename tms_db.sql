-- phpMyAdmin SQL Dump
-- Version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Created on: 02 Jan 2025, 16:29
-- Server Version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Set character settings
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `tms_db`
-- --------------------------------------------------------

-- Table: `project_list`
DROP TABLE IF EXISTS `project_list`;
CREATE TABLE IF NOT EXISTS `project_list` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `status` TINYINT(2) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `manager_id` INT(11) NOT NULL,
  `user_ids` TEXT NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for `project_list`
INSERT INTO `project_list` (`id`, `name`, `description`, `status`, `start_date`, `end_date`, `manager_id`, `user_ids`, `date_created`) VALUES
(3, 'Cloud Computing', 'Tugas Presentasi Cloud Computing', 3, '2024-12-20', '2024-12-21', 6, '8,9,7', '2024-12-19 18:50:31'),
(4, 'Cloud Computing Final Project', 'Tugas Membuat Web', 5, '2024-12-19', '2024-12-20', 6, '8,9,7', '2024-12-19 19:13:51');

-- Table: `system_settings`
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `contact` VARCHAR(20) NOT NULL,
  `address` TEXT NOT NULL,
  `cover_img` TEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for `system_settings`
INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Task Management System', 'info@sample.comm', '+6948 8542 623', '2102 Caldwell Road, Rochester, New York, 14608', '');

-- Table: `task_list`
DROP TABLE IF EXISTS `task_list`;
CREATE TABLE IF NOT EXISTS `task_list` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_id` INT(11) NOT NULL,
  `task` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `status` TINYINT(4) NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for `task_list`
INSERT INTO `task_list` (`id`, `project_id`, `task`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Sample Task 1', 'Fusce ullamcorper mattis semper.', 3, '2020-12-03 11:08:58'),
(2, 1, 'Sample Task 2', 'Sample Task 2', 1, '2020-12-03 13:50:15'),
(3, 2, 'Task Test', 'Sample', 1, '2020-12-03 13:52:25'),
(4, 2, 'Test 23', 'Sample test 23', 1, '2020-12-03 13:52:40'),
(5, 3, 'Membuat Web', '', 3, '2024-12-19 19:14:53'),
(6, 3, 'Deployment', '', 2, '2024-12-19 19:15:10'),
(7, 3, 'Presentasi PPT', '', 2, '2024-12-19 19:17:17');

-- Table: `users`
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(200) NOT NULL,
  `lastname` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` TEXT NOT NULL,
  `type` TINYINT(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `avatar` TEXT NOT NULL DEFAULT 'no-image-available.png',
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for `users`
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, 'no-image-available.png', '2020-11-26 10:57:04'),
(6, 'Fahrin Najah', 'El Hami', 'fahrin@gmail.com', '85064efb60a9601805dcea56ec5402f7', 2, '1734685140_Fahrin.jpg', '2024-12-19 18:45:08'),
(7, 'Waskito Agung', 'Wahyu Pratomo', 'waskito@gmail.com', '85064efb60a9601805dcea56ec5402f7', 2, '1734685140_Waskito.jpg', '2024-12-19 18:46:16'),
(8, 'Maulana', 'Furqon', 'maulana@gmail.com', '85064efb60a9601805dcea56ec5402f7', 2, '1734685140_Alan.jpg', '2024-12-19 18:47:16'),
(9, 'Muhammad Raffi Adhipramana', 'Putra Yuswito', 'raffi@gmail.com', '85064efb60a9601805dcea56ec5402f7', 2, '1734685140_raffi.jpg', '2024-12-19 18:48:45');

-- Table: `user_productivity`
DROP TABLE IF EXISTS `user_productivity`;
CREATE TABLE IF NOT EXISTS `user_productivity` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_id` INT(11) NOT NULL,
  `task_id` INT(11) NOT NULL,
  `comment` TEXT NOT NULL,
  `subject` VARCHAR(200) NOT NULL,
  `date` DATE NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `user_id` INT(11) NOT NULL,
  `time_rendered` FLOAT NOT NULL,
  `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for `user_productivity`
INSERT INTO `user_productivity` (`id`, `project_id`, `task_id`, `comment`, `subject`, `date`, `start_time`, `end_time`, `user_id`, `time_rendered`, `date_created`) VALUES
(1, 1, 1, 'Sample Progress: Test 1, Test 2, Test 3', 'Sample Progress', '2020-12-03', '08:00:00', '10:00:00', 1, 2, '2020-12-03 12:13:28'),
(2, 1, 1, 'Sample Progress 2', 'Sample Progress 2', '2020-12-03', '13:00:00', '14:00:00', 1, 1, '2020-12-03 13:48:28');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
