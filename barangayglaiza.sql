-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2026 at 12:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangayglaiza`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` enum('admin','resident') DEFAULT 'admin',
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `action` varchar(200) NOT NULL,
  `module` varchar(80) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `user_type`, `user_id`, `action`, `module`, `created_at`) VALUES
(1, 'resident', 0, 'New resident registered: BRGY-2026-0006', 'Signup', '2026-10-03 04:14:43'),
(2, 'resident', 0, 'Resident login pending verification', 'Auth', '2026-10-03 04:14:47'),
(3, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 04:20:37'),
(4, 'admin', 1, 'Admin login', 'Auth', '2026-10-03 04:22:42'),
(5, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 04:23:18'),
(6, 'admin', 1, 'Admin login', 'Auth', '2026-10-03 04:26:47'),
(7, 'admin', 1, 'Saved Emergency Center: 32', 'Mapping', '2026-10-03 04:27:01'),
(8, 'admin', 1, 'Deleted map item #0', 'Mapping', '2026-10-03 04:27:05'),
(9, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 04:27:32'),
(10, 'admin', 1, 'Admin login', 'Auth', '2026-10-03 04:27:43'),
(11, 'admin', 1, 'Saved Emergency Center: 23', 'Mapping', '2026-10-03 04:27:54'),
(12, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 04:27:57'),
(13, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 04:33:13'),
(14, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 04:45:04'),
(15, 'admin', 1, 'Admin login', 'Auth', '2026-10-03 05:02:06'),
(16, 'admin', 1, 'Admin login', 'Auth', '2026-10-03 05:06:27'),
(17, 'admin', 1, 'Created announcement: we', 'Announcements', '2026-10-03 05:06:39'),
(18, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 05:06:48'),
(19, 'admin', 1, 'Admin login', 'Auth', '2026-10-03 05:08:04'),
(20, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 05:08:42'),
(21, 'resident', 1, 'Resident login', 'Auth', '2026-10-03 05:15:03'),
(22, 'admin', 1, 'Admin login', 'Auth', '2026-10-08 02:21:30'),
(23, 'admin', 1, 'Admin login', 'Auth', '2026-10-08 02:21:56'),
(24, 'admin', 1, 'Admin login', 'Auth', '2026-10-08 02:22:12'),
(25, 'admin', 1, 'Admin login', 'Auth', '2026-10-08 02:24:57'),
(26, 'admin', 1, 'Reset password for resident #1 (temporary password issued)', 'Password Reset', '2026-10-08 02:25:08'),
(27, 'admin', 1, 'Reset password for resident #1 (temporary password issued)', 'Password Reset', '2026-10-08 02:25:11'),
(28, 'resident', 1, 'Resident login', 'Auth', '2026-10-08 02:25:17'),
(29, 'resident', 1, 'Completed forced password change', 'Auth', '2026-10-08 02:25:26'),
(30, 'admin', 1, 'Admin login', 'Auth', '2026-10-08 02:32:46'),
(31, 'resident', 1, 'Resident login', 'Auth', '2026-10-08 02:33:21'),
(32, 'admin', 1, 'Admin login', 'Auth', '2026-10-08 02:36:45'),
(33, 'admin', 1, 'Admin login', 'Auth', '2026-10-08 02:37:41'),
(34, 'resident', 1, 'Resident login', 'Auth', '2026-10-08 02:47:06'),
(35, 'admin', 1, 'Admin login', 'Auth', '2026-10-09 02:52:03'),
(36, 'admin', 1, 'Deleted map item #1', 'Mapping', '2026-10-09 03:00:24'),
(37, 'admin', 1, 'Deleted map item #0', 'Mapping', '2026-10-09 03:00:25'),
(38, 'resident', 1, 'Resident login', 'Auth', '2026-10-27 02:15:55'),
(39, 'admin', 1, 'Admin login', 'Auth', '2026-10-27 02:16:16'),
(40, 'resident', 1, 'Resident login', 'Auth', '2026-10-27 02:16:53');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(180) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `role` enum('Administrator','Staff') NOT NULL DEFAULT 'Staff',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `username`, `password_hash`, `must_change_password`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Barangay Administrator', 'admin@barangaytalisay.gov.ph', 'admin', '$2y$10$hQfFTo7HMXZkAaxYP08BTO08p8x6N.hqw3j3tTS2A.FDrnI0eUOoW', 0, 'Administrator', 'Active', '2026-06-22 00:17:49', '2026-10-08 02:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `category` enum('Event','Service Update','Advisory','Important Notice','Other') DEFAULT 'Other',
  `color` varchar(20) DEFAULT 'primary',
  `publish_date` date DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `description`, `category`, `color`, `publish_date`, `created_by`, `is_active`, `created_at`, `updated_at`) VALUES
(0, 'we', 'we', 'Event', 'primary', '2026-10-02', 1, 1, '2026-10-03 05:06:39', '2026-10-03 05:06:39'),
(4, 'Fiesta Celebration', 'Join us for the Feast of St. Isidore on May 25, 2026 at the barangay plaza...', 'Event', 'primary', '2026-05-22', NULL, 1, '2026-06-22 00:18:03', '2026-06-22 00:18:03'),
(5, 'Health Clinic Schedule', 'Free health check-up every Saturday 8AM to 12PM...', 'Service Update', 'info', '2026-05-19', NULL, 1, '2026-06-22 00:18:03', '2026-06-22 00:18:03'),
(6, 'Curfew Advisory', 'Residents are advised to stay at home during flood alerts...', 'Advisory', 'warning', '2026-05-21', NULL, 1, '2026-06-22 00:18:03', '2026-06-22 00:18:03'),
(7, 'thesis defense', '123', 'Other', 'success', '2026-08-26', 1, 0, '2026-08-27 05:02:55', '2026-09-02 19:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `purpose` varchar(200) NOT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` varchar(40) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('Pending','Confirmed','Cancelled','Completed','Rescheduled') DEFAULT 'Pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barangay_settings`
--

CREATE TABLE `barangay_settings` (
  `setting_key` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangay_settings`
--

INSERT INTO `barangay_settings` (`setting_key`, `setting_value`, `updated_at`) VALUES
('activity_log_last_cleanup', '2026-09-02 22:47:19', '2026-09-02 22:47:19'),
('address', '123 Talisay Street, Zone 2, Barangay Talisay', '2026-10-08 02:27:28'),
('barangay_name', 'Barangay Talisay', '2026-10-08 02:27:28'),
('contact_number', '(02) 111111111111', '2026-06-11 00:40:59'),
('email', 'info@barangaytalisay.gov.ph', '2026-10-08 02:27:28'),
('logo_path', 'assets/images/logo_custom.jpg', '2026-06-06 16:15:54'),
('resident_id_seq', '6', '2026-10-03 04:14:43'),
('resident_id_year', '2026', '2026-06-05 16:38:48'),
('theme_color', '#0066cc', '2026-06-11 16:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `document_requests`
--

CREATE TABLE `document_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_number` varchar(20) NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `document_type` enum('Barangay Clearance','Certificate of Residency','Barangay ID','Certificate of Indigency','Business Permit','Proof of Residency','Other') NOT NULL,
  `purpose` varchar(250) DEFAULT NULL,
  `status` enum('Pending','Processing','Ready for Pickup','Completed','Rejected','Cancelled') DEFAULT 'Pending',
  `requested_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `processed_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_templates`
--

CREATE TABLE `document_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_type` varchar(100) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `field_positions` longtext DEFAULT NULL COMMENT 'JSON: {field_name: {top, left, font_size, bold}}',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `head_requests`
--

CREATE TABLE `head_requests` (
  `id` int(11) NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `house_number` varchar(100) DEFAULT NULL,
  `zone_purok` varchar(100) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_checkups`
--

CREATE TABLE `health_checkups` (
  `id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `checkup_date` date NOT NULL,
  `checkup_type` varchar(100) NOT NULL,
  `blood_pressure` varchar(20) DEFAULT NULL,
  `temperature` varchar(20) DEFAULT NULL,
  `weight_kg` decimal(5,1) DEFAULT NULL,
  `height_cm` decimal(5,1) DEFAULT NULL,
  `results` enum('Normal','Needs Monitoring','Requires Attention') NOT NULL DEFAULT 'Normal',
  `notes` text DEFAULT NULL,
  `next_followup_date` date DEFAULT NULL,
  `recorded_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_profiles`
--

CREATE TABLE `health_profiles` (
  `resident_id` int(10) UNSIGNED NOT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `height_cm` decimal(5,1) DEFAULT NULL,
  `weight_kg` decimal(5,1) DEFAULT NULL,
  `allergies` varchar(255) DEFAULT NULL,
  `medical_conditions` varchar(255) DEFAULT NULL,
  `maintenance_medication` varchar(255) DEFAULT NULL,
  `overall_status` enum('Good','Needs Monitoring','Requires Attention') NOT NULL DEFAULT 'Good',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_vaccinations`
--

CREATE TABLE `health_vaccinations` (
  `id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `vaccine_name` varchar(120) NOT NULL,
  `date_given` date NOT NULL,
  `dose` varchar(50) DEFAULT NULL,
  `status` enum('Completed','Scheduled','Missed') NOT NULL DEFAULT 'Completed',
  `remarks` varchar(255) DEFAULT NULL,
  `recorded_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `households`
--

CREATE TABLE `households` (
  `id` int(10) UNSIGNED NOT NULL,
  `household_head` int(10) UNSIGNED DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `zone_purok` varchar(60) DEFAULT NULL,
  `house_number` varchar(30) DEFAULT NULL,
  `member_count` int(10) UNSIGNED DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `household_invites`
--

CREATE TABLE `household_invites` (
  `id` int(10) UNSIGNED NOT NULL,
  `household_id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `invited_by` int(10) UNSIGNED NOT NULL,
  `relation` varchar(60) NOT NULL,
  `status` enum('Pending','Accepted','Declined') NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `responded_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `household_members`
--

CREATE TABLE `household_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `household_id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED DEFAULT NULL,
  `full_name` varchar(160) NOT NULL,
  `relation` varchar(60) NOT NULL,
  `age` tinyint(3) UNSIGNED DEFAULT NULL,
  `status` enum('Verified','Pending','Inactive') DEFAULT 'Pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `household_requests`
--

CREATE TABLE `household_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `request_type` enum('Head','Join') NOT NULL DEFAULT 'Head',
  `house_number` varchar(30) DEFAULT NULL,
  `zone_purok` varchar(60) DEFAULT NULL,
  `household_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `remarks` varchar(250) DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `reviewed_by` int(10) UNSIGNED DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incident_reports`
--

CREATE TABLE `incident_reports` (
  `id` int(11) NOT NULL,
  `resident_id` int(11) DEFAULT NULL,
  `incident_type` varchar(100) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `status` enum('Pending','Under Review','Resolved') DEFAULT 'Pending',
  `reference_no` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `username` varchar(180) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempts` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `locked_until` datetime DEFAULT NULL,
  `last_attempt_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` enum('admin','resident') NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `puroks`
--

CREATE TABLE `puroks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('zone','marker','emergency') NOT NULL DEFAULT 'zone',
  `description` varchar(250) DEFAULT NULL,
  `color` varchar(20) DEFAULT '#34d399',
  `coordinates` longtext DEFAULT NULL,
  `resident_count` int(10) UNSIGNED DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `remember_tokens`
--

CREATE TABLE `remember_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` enum('admin','resident') NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `selector` varchar(24) NOT NULL,
  `validator_hash` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `remember_tokens`
--

INSERT INTO `remember_tokens` (`id`, `user_type`, `user_id`, `selector`, `validator_hash`, `expires_at`, `created_at`) VALUES
(0, 'admin', 1, 'eee422ba0b4b0742a55d6cc3', '416936485e98dbb36a9a98c94610a2c53086510be54553290c534233dd1c49da', '2026-11-07 19:52:03', '2026-10-09 02:52:03');

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `id` int(10) UNSIGNED NOT NULL,
  `barangay_id` varchar(20) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `middle_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(180) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `street_address` varchar(200) DEFAULT NULL,
  `zone_purok` varchar(60) DEFAULT NULL,
  `house_number` varchar(30) DEFAULT NULL,
  `occupation` varchar(120) DEFAULT NULL,
  `workplace` varchar(150) DEFAULT NULL,
  `years_of_residency` int(10) UNSIGNED DEFAULT 0,
  `is_household_head` tinyint(1) DEFAULT 0,
  `household_id` int(10) UNSIGNED DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('Verified','Pending','Inactive') NOT NULL DEFAULT 'Pending',
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`id`, `barangay_id`, `first_name`, `middle_name`, `last_name`, `email`, `phone`, `date_of_birth`, `gender`, `street_address`, `zone_purok`, `house_number`, `occupation`, `workplace`, `years_of_residency`, `is_household_head`, `household_id`, `password_hash`, `must_change_password`, `status`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'BRGY-2026-0006', 'Resident', NULL, 'User', 'vencialaiza@gmail.com', NULL, NULL, NULL, '123 Sampaguita St.', 'Zone 2', 'Lot 5', 'Resident', NULL, 0, 0, NULL, '$2y$10$fJ2SNS.Y5scuf9Tb0Ae.GeHTZugcsviQS4lDk3cef1I3ip5ccL2q2', 0, 'Verified', NULL, NULL, '2026-10-03 04:18:44', '2026-10-08 02:25:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `barangay_settings`
--
ALTER TABLE `barangay_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Indexes for table `document_requests`
--
ALTER TABLE `document_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_number` (`request_number`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `processed_by` (`processed_by`);

--
-- Indexes for table `document_templates`
--
ALTER TABLE `document_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_type` (`document_type`);

--
-- Indexes for table `head_requests`
--
ALTER TABLE `head_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `health_checkups`
--
ALTER TABLE `health_checkups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `health_profiles`
--
ALTER TABLE `health_profiles`
  ADD PRIMARY KEY (`resident_id`);

--
-- Indexes for table `health_vaccinations`
--
ALTER TABLE `health_vaccinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `households`
--
ALTER TABLE `households`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_household_address` (`house_number`,`zone_purok`);

--
-- Indexes for table `household_invites`
--
ALTER TABLE `household_invites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `household_id` (`household_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `household_members`
--
ALTER TABLE `household_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `household_id` (`household_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `household_requests`
--
ALTER TABLE `household_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `household_id` (`household_id`),
  ADD KEY `reviewed_by` (`reviewed_by`);

--
-- Indexes for table `incident_reports`
--
ALTER TABLE `incident_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_lookup` (`user_type`,`username`,`ip_address`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_lookup` (`user_type`,`user_id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `incident_reports`
--
ALTER TABLE `incident_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `residents`
--
ALTER TABLE `residents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
