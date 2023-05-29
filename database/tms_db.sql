-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 03:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
-- Table structure for table `project_list`
--

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
-- Dumping data for table `project_list`
--

INSERT INTO `project_list` (`id`, `name`, `description`, `status`, `start_date`, `end_date`, `manager_id`, `user_ids`, `date_created`) VALUES
(3, 'EARIST SCUAA', '																														&lt;span style=&quot;font-size: 18px;&quot;&gt;SCUAA (&lt;/span&gt;&lt;span style=&quot;font-weight: 700; color: rgb(17, 17, 17); font-family: Roboto, Helvetica, sans-serif;&quot;&gt;State Colleges Athletic Association&lt;/span&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;) is&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(32, 33, 34); font-family: &amp;quot;Source Sans Pro&amp;quot;; font-size: 18px;&quot;&gt;one of the inter-collegiate sports associations in the Philippines, the union of seven major state colleges and universities in Metro Manila.&lt;br&gt;&lt;br&gt;Please get ready for the SCUAA in June 2023.&lt;/span&gt;																									', 0, '2023-06-19', '2023-06-23', 12, '14', '2023-05-29 12:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
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
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'EARIST Redfox Trendhunter', 'earistofficial1945@gmail.com', '8243-9467', 'Earist Nagtahan St., Sampaloc, Manila, Philippines, 1008', '');

-- --------------------------------------------------------

--
-- Table structure for table `task_list`
--

CREATE TABLE `task_list` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = coach, 3 = player',
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, 'no-image-available.png', '2020-11-26 10:57:04'),
(8, 'Jazper Mark', 'Costuna', 'jmcos1@gmail.com', '482c811da5d5b4bc6d497ffa98491e38', 2, 'no-image-available.png', '2023-05-29 12:28:06'),
(9, 'Engr. Bernardito', 'Fabro', 'engrfabro@gmail.com', 'cdb4300076d762dc8d62c4f4a778de80', 2, 'no-image-available.png', '2023-05-29 12:29:38'),
(10, 'Merean', 'Bonaos', 'mean@gmail.com', '162823c3b7fd7d6c13a2e4b92702e5af', 2, 'no-image-available.png', '2023-05-29 12:30:51'),
(11, 'Franchesca', 'Malay', 'cheska@gmail.com', '57e176c7e99b32651f053f6e1f37f2fd', 2, 'no-image-available.png', '2023-05-29 12:31:31'),
(12, 'Arnold', 'Mangaring', 'arnulfo@gmail.com', '49a30d03c669a09f2c01c3655032af3e', 2, 'no-image-available.png', '2023-05-29 12:32:17'),
(13, 'Sacre Joseph', 'Galindez', 'mrgalindez@gmail.com', 'cb07901c53218323c4ceacdea4b23c98', 2, 'no-image-available.png', '2023-05-29 12:32:51'),
(14, 'Justeen Carl', 'Falorigan', 'justeenf3@gmail.com', '57d3431b684354bd6d4a748610d5d09c', 3, '1685334840_Justeen.jpg', '2023-05-29 12:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_productivity`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `project_list`
--
ALTER TABLE `project_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_productivity`
--
ALTER TABLE `user_productivity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project_list`
--
ALTER TABLE `project_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_list`
--
ALTER TABLE `task_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_productivity`
--
ALTER TABLE `user_productivity`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
