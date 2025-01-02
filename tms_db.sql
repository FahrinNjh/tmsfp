-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jan 2025 pada 16.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tms_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `project_list`
--

DROP TABLE IF EXISTS `project_list`;
CREATE TABLE `project_list` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `manager_id` int(30) NOT NULL,
  `user_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `project_list`
--

INSERT INTO `project_list` (`id`, `name`, `description`, `status`, `start_date`, `end_date`, `manager_id`, `user_ids`, `date_created`) VALUES
(3, 'Cloud Computing', '																		Tugas Presentasi Cloud Computing&amp;nbsp;															', 3, '2024-12-20', '2024-12-21', 6, '8,9,7', '2024-12-19 18:50:31'),
(4, 'Cloud Computing Final Project', 'Tugas Membuat Web', 5, '2024-12-19', '2024-12-20', 6, '8,9,7', '2024-12-19 19:13:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Task Management System', 'info@sample.comm', '+6948 8542 623', '2102  Caldwell Road, Rochester, New York, 14608', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `task_list`
--

CREATE TABLE `task_list` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `task_list`
--

INSERT INTO `task_list` (`id`, `project_id`, `task`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Sample Task 1', '								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Fusce ullamcorper mattis semper. Nunc vel risus ipsum. Sed maximus dapibus nisl non laoreet. Pellentesque quis mauris odio. Donec fermentum facilisis odio, sit amet aliquet purus scelerisque eget.&amp;nbsp;&lt;/span&gt;													', 3, '2020-12-03 11:08:58'),
(2, 1, 'Sample Task 2', 'Sample Task 2							', 1, '2020-12-03 13:50:15'),
(3, 2, 'Task Test', 'Sample', 1, '2020-12-03 13:52:25'),
(4, 2, 'test 23', 'Sample test 23', 1, '2020-12-03 13:52:40'),
(5, 3, 'Membuat Web', '							', 3, '2024-12-19 19:14:53'),
(6, 3, 'Deployment', '														', 2, '2024-12-19 19:15:10'),
(7, 3, 'Presentasi PPT', '				&lt;br&gt;			', 2, '2024-12-19 19:17:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, 'no-image-available.png', '2020-11-26 10:57:04'),
(6, 'Fahrin Najah', 'El Hami', 'fahrin@gmail.com', '85064efb60a9601805dcea56ec5402f7', 2, '1734685140_Fahrin.jpg', '2024-12-19 18:45:08'),
(7, 'Waskito Agung', 'Wahyu Pratomo', 'waskito@gmail.com', '85064efb60a9601805dcea56ec5402f7', 3, '1734685140_Waskito.jpg', '2024-12-19 18:46:16'),
(8, 'Maulana', 'Furqon', 'maulana@gmail.com', '85064efb60a9601805dcea56ec5402f7', 3, '1734685140_Alan.jpg', '2024-12-19 18:47:16'),
(9, 'Muhammad Raffi Adhipramana', 'Putra Yuswito', 'raffi@gmail.com', '85064efb60a9601805dcea56ec5402f7', 3, '1734685140_raffi.jpg', '2024-12-19 18:48:45'),
(10, 'Fahrin Najah', 'El', 'fahrin1@gmail.com', '85064efb60a9601805dcea56ec5402f7', 3, 'no-image-available.png', '2024-12-19 19:12:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_productivity`
--

CREATE TABLE `user_productivity` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` int(30) NOT NULL,
  `time_rendered` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_productivity`
--

INSERT INTO `user_productivity` (`id`, `project_id`, `task_id`, `comment`, `subject`, `date`, `start_time`, `end_time`, `user_id`, `time_rendered`, `date_created`) VALUES
(1, 1, 1, '							&lt;p&gt;Sample Progress&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Test 1&lt;/li&gt;&lt;li&gt;Test 2&lt;/li&gt;&lt;li&gt;Test 3&lt;/li&gt;&lt;/ul&gt;																			', 'Sample Progress', '2020-12-03', '08:00:00', '10:00:00', 1, 2, '2020-12-03 12:13:28'),
(2, 1, 1, '							Sample Progress						', 'Sample Progress 2', '2020-12-03', '13:00:00', '14:00:00', 1, 1, '2020-12-03 13:48:28'),
(3, 1, 2, '							Sample						', 'Test', '2020-12-03', '08:00:00', '09:00:00', 5, 1, '2020-12-03 13:57:22'),
(4, 1, 2, 'asdasdasd', 'Sample Progress', '2020-12-02', '08:00:00', '10:00:00', 2, 2, '2020-12-03 14:36:30'),
(5, 3, 5, 'Membuat Web Selesai', '', '2024-12-19', '19:15:00', '19:15:00', 1, 0, '2024-12-19 19:15:54'),
(6, 3, 6, 'Deployment Microsoft Azure bermasalah', 'Microsoft Azure', '2024-12-20', '11:09:00', '11:09:00', 6, 0, '2024-12-20 11:10:20');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `project_list`
--
ALTER TABLE `project_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_productivity`
--
ALTER TABLE `user_productivity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `project_list`
--
ALTER TABLE `project_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `task_list`
--
ALTER TABLE `task_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user_productivity`
--
ALTER TABLE `user_productivity`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
