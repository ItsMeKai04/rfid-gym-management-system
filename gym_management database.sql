-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2026 at 08:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `user_id`, `full_name`, `email`, `phone_number`, `position`) VALUES
(1, 1, 'System Admin', 'admin@gym.com', '0123456789', 'Head Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `check_in_time` datetime DEFAULT current_timestamp(),
  `check_out_time` datetime DEFAULT NULL,
  `attendance_date` date DEFAULT curdate(),
  `status` enum('Present','Absent','Late','Excused') DEFAULT 'Present',
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `member_id`, `trainer_id`, `check_in_time`, `check_out_time`, `attendance_date`, `status`, `remarks`) VALUES
(1, 1, 1, '2025-11-12 09:00:00', '2025-11-12 10:00:00', '2025-11-12', 'Present', 'Morning session'),
(2, 2, 2, '2025-11-12 10:15:00', '2025-11-12 11:15:00', '2025-11-12', 'Present', 'Yoga class'),
(3, 2, NULL, '2026-01-12 11:15:44', '2026-01-12 11:16:10', '2026-01-12', 'Present', 'RFID member check-out'),
(4, 2, NULL, '2026-01-12 11:16:42', '2026-01-12 11:19:40', '2026-01-12', 'Present', 'RFID member check-out'),
(5, 2, NULL, '2026-01-12 11:22:37', '2026-01-12 15:38:55', '2026-01-12', 'Present', 'RFID member check-out'),
(6, 2, NULL, '2026-01-12 15:39:16', '2026-01-12 15:40:23', '2026-01-12', 'Present', 'RFID member check-out'),
(7, 2, NULL, '2026-01-12 15:40:28', '2026-01-12 15:40:38', '2026-01-12', 'Present', 'RFID member check-out'),
(8, 2, NULL, '2026-01-12 15:40:43', '2026-01-12 15:40:47', '2026-01-12', 'Present', 'RFID member check-out'),
(9, 2, NULL, '2026-01-12 15:44:17', '2026-01-12 15:44:32', '2026-01-12', 'Present', 'RFID member check-out'),
(10, 2, NULL, '2026-01-12 15:44:36', '2026-01-12 15:44:43', '2026-01-12', 'Present', 'RFID member check-out'),
(11, 2, NULL, '2026-01-12 15:45:48', '2026-01-12 15:45:51', '2026-01-12', 'Present', 'RFID member check-out'),
(12, 2, NULL, '2026-01-12 15:46:01', '2026-01-12 15:46:11', '2026-01-12', 'Present', 'RFID member check-out'),
(13, 2, NULL, '2026-01-12 15:46:17', '2026-01-12 15:50:26', '2026-01-12', 'Present', 'RFID member check-out'),
(14, 2, NULL, '2026-01-12 15:50:30', '2026-01-12 15:53:32', '2026-01-12', 'Present', 'RFID member check-out'),
(15, 1, NULL, '2026-01-12 15:50:40', '2026-01-12 15:51:29', '2026-01-12', 'Present', 'RFID member check-out');

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_logs`
--

CREATE TABLE `chatbot_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_message` text DEFAULT NULL,
  `bot_response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `membership_status` enum('Active','Expired','Pending') DEFAULT 'Pending',
  `join_date` date DEFAULT curdate(),
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `user_id`, `full_name`, `date_of_birth`, `email`, `phone_number`, `membership_status`, `join_date`, `expiry_date`) VALUES
(1, 4, 'Ali Ahmad', '1998-03-15', 'ali.ahmad@gmail.com', '0162233445', 'Active', '2025-01-01', '2025-12-31'),
(2, 5, 'Lisa Wong', '2000-09-22', 'lisa.wong@gmail.com', '0189988776', 'Active', '2025-02-15', '2026-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `membership_plans`
--

CREATE TABLE `membership_plans` (
  `plan_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration_months` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership_plans`
--

INSERT INTO `membership_plans` (`plan_id`, `name`, `price`, `duration_months`, `description`) VALUES
(1, 'Monthly Plan', 120.00, 1, 'Standard monthly membership.'),
(2, 'Yearly Plan', 1200.00, 12, 'Discounted yearly membership.');

-- --------------------------------------------------------

--
-- Table structure for table `member_progress`
--

CREATE TABLE `member_progress` (
  `progress_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `recorded_at` datetime DEFAULT current_timestamp(),
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `height_cm` decimal(5,2) DEFAULT NULL,
  `body_fat_percentage` decimal(5,2) DEFAULT NULL,
  `bmi` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_progress`
--

INSERT INTO `member_progress` (`progress_id`, `member_id`, `trainer_id`, `recorded_at`, `weight_kg`, `height_cm`, `body_fat_percentage`, `bmi`, `notes`) VALUES
(1, 1, 1, '2026-01-12 00:56:37', 75.50, 175.00, 18.50, 24.60, 'Improved stamina, keep same program'),
(2, 2, 2, '2026-01-12 00:56:37', 62.00, 165.00, 22.00, 22.80, 'Good progress on flexibility');

-- --------------------------------------------------------

--
-- Table structure for table `member_subscriptions`
--

CREATE TABLE `member_subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Active','Expired','Cancelled') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_subscriptions`
--

INSERT INTO `member_subscriptions` (`subscription_id`, `member_id`, `plan_id`, `start_date`, `end_date`, `status`) VALUES
(1, 1, 2, '2025-01-01', '2025-12-31', 'Active'),
(2, 2, 1, '2025-02-15', '2025-03-14', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `member_trainer_assigned`
--

CREATE TABLE `member_trainer_assigned` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_trainer_assigned`
--

INSERT INTO `member_trainer_assigned` (`id`, `member_id`, `trainer_id`, `assigned_at`) VALUES
(1, 1, 1, '2026-01-11 18:22:08');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date DEFAULT curdate(),
  `due_date` date DEFAULT NULL,
  `payment_status` enum('Paid','Pending','Overdue') DEFAULT 'Pending',
  `receipt_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rfid_tags`
--

CREATE TABLE `rfid_tags` (
  `tag_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `tag_uid` varchar(32) NOT NULL,
  `status` enum('Active','Lost','Disabled') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rfid_tags`
--

INSERT INTO `rfid_tags` (`tag_id`, `member_id`, `tag_uid`, `status`, `created_at`) VALUES
(1, 1, 'C90C4703', 'Active', '2026-01-11 17:04:18'),
(2, 2, 'F1DD4703', 'Active', '2026-01-12 07:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `rfid_trainer_tags`
--

CREATE TABLE `rfid_trainer_tags` (
  `tag_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `tag_uid` varchar(32) NOT NULL,
  `status` enum('Active','Lost','Disabled') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rfid_trainer_tags`
--

INSERT INTO `rfid_trainer_tags` (`tag_id`, `trainer_id`, `tag_uid`, `status`, `created_at`) VALUES
(1, 1, '7D894603', 'Active', '2026-01-12 07:56:45'),
(2, 2, 'FAA84703', 'Active', '2026-01-12 07:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `workout_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `class_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `trainer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `availability_schedule` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`trainer_id`, `user_id`, `full_name`, `specialization`, `email`, `phone_number`, `availability_schedule`) VALUES
(1, 2, 'John Tan', 'Weight Training', 'john.tan@gym.com', '0112233445', 'Mon-Fri 9am-6pm'),
(2, 3, 'Sarah Lim', 'Yoga & Pilates', 'sarah.lim@gym.com', '0198877665', 'Tue-Sat 10am-7pm');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_attendance`
--

CREATE TABLE `trainer_attendance` (
  `trainer_attendance_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `check_in_time` datetime DEFAULT current_timestamp(),
  `check_out_time` datetime DEFAULT NULL,
  `attendance_date` date DEFAULT curdate(),
  `status` enum('Present','Absent','Late','Excused') DEFAULT 'Present',
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainer_attendance`
--

INSERT INTO `trainer_attendance` (`trainer_attendance_id`, `trainer_id`, `check_in_time`, `check_out_time`, `attendance_date`, `status`, `remarks`) VALUES
(1, 1, '2025-11-12 08:45:00', '2025-11-12 12:00:00', '2025-11-12', 'Present', 'Morning shift'),
(2, 2, '2025-11-12 09:30:00', '2025-11-12 13:00:00', '2025-11-12', 'Present', 'Yoga shift'),
(3, 1, '2026-01-12 15:56:51', '2026-01-12 15:57:02', '2026-01-12', 'Present', 'RFID trainer check-out');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('Admin','Trainer','Member') NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `full_name`, `email`, `role`, `status`, `created_at`) VALUES
(1, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'System Admin', 'admin@gym.com', 'Admin', 'Active', '2026-01-11 16:56:37'),
(2, 'trainer_john', '5b3d264e4cdc2c39ca6708b3e1e21f082722be12e63ee21484bdbe15735ab066', 'John Tan', 'john.tan@gym.com', 'Trainer', 'Active', '2026-01-11 16:56:37'),
(3, 'trainer_sarah', '5b3d264e4cdc2c39ca6708b3e1e21f082722be12e63ee21484bdbe15735ab066', 'Sarah Lim', 'sarah.lim@gym.com', 'Trainer', 'Active', '2026-01-11 16:56:37'),
(4, 'member_ali', '5600376e863d2f57a053518f324ad3840b0bc2348b573af281a7b7cbe7a228c6', 'Ali Ahmad', 'ali.ahmad@gmail.com', 'Member', 'Active', '2026-01-11 16:56:37'),
(5, 'member_lisa', '5600376e863d2f57a053518f324ad3840b0bc2348b573af281a7b7cbe7a228c6', 'Lisa Wong', 'lisa.wong@gmail.com', 'Member', 'Active', '2026-01-11 16:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `workout_id` int(11) NOT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `difficulty` enum('Beginner','Intermediate','Advanced') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`workout_id`, `trainer_id`, `title`, `description`, `difficulty`) VALUES
(1, 1, 'plank', '1 minutes plankx2', 'Beginner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `chatbot_logs`
--
ALTER TABLE `chatbot_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `membership_plans`
--
ALTER TABLE `membership_plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `member_progress`
--
ALTER TABLE `member_progress`
  ADD PRIMARY KEY (`progress_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `member_subscriptions`
--
ALTER TABLE `member_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `member_trainer_assigned`
--
ALTER TABLE `member_trainer_assigned`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `subscription_id` (`subscription_id`);

--
-- Indexes for table `rfid_tags`
--
ALTER TABLE `rfid_tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `tag_uid` (`tag_uid`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `rfid_trainer_tags`
--
ALTER TABLE `rfid_trainer_tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `tag_uid` (`tag_uid`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `workout_id` (`workout_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`trainer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `trainer_attendance`
--
ALTER TABLE `trainer_attendance`
  ADD PRIMARY KEY (`trainer_attendance_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`workout_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `chatbot_logs`
--
ALTER TABLE `chatbot_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `membership_plans`
--
ALTER TABLE `membership_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member_progress`
--
ALTER TABLE `member_progress`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member_subscriptions`
--
ALTER TABLE `member_subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member_trainer_assigned`
--
ALTER TABLE `member_trainer_assigned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rfid_tags`
--
ALTER TABLE `rfid_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rfid_trainer_tags`
--
ALTER TABLE `rfid_trainer_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `trainer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trainer_attendance`
--
ALTER TABLE `trainer_attendance`
  MODIFY `trainer_attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `workout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE SET NULL;

--
-- Constraints for table `chatbot_logs`
--
ALTER TABLE `chatbot_logs`
  ADD CONSTRAINT `chatbot_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `member_progress`
--
ALTER TABLE `member_progress`
  ADD CONSTRAINT `member_progress_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_progress_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE SET NULL;

--
-- Constraints for table `member_subscriptions`
--
ALTER TABLE `member_subscriptions`
  ADD CONSTRAINT `member_subscriptions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_subscriptions_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `membership_plans` (`plan_id`);

--
-- Constraints for table `member_trainer_assigned`
--
ALTER TABLE `member_trainer_assigned`
  ADD CONSTRAINT `member_trainer_assigned_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `member_trainer_assigned_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`subscription_id`) REFERENCES `member_subscriptions` (`subscription_id`) ON DELETE SET NULL;

--
-- Constraints for table `rfid_tags`
--
ALTER TABLE `rfid_tags`
  ADD CONSTRAINT `rfid_tags_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `rfid_trainer_tags`
--
ALTER TABLE `rfid_trainer_tags`
  ADD CONSTRAINT `rfid_trainer_tags_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`workout_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE SET NULL;

--
-- Constraints for table `trainers`
--
ALTER TABLE `trainers`
  ADD CONSTRAINT `trainers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `trainer_attendance`
--
ALTER TABLE `trainer_attendance`
  ADD CONSTRAINT `trainer_attendance_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE CASCADE;

--
-- Constraints for table `workouts`
--
ALTER TABLE `workouts`
  ADD CONSTRAINT `workouts_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
