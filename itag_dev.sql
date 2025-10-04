-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2025 at 12:11 PM
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
-- Database: `itag_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `administration_routes`
--

CREATE TABLE `administration_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administration_routes`
--

INSERT INTO `administration_routes` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Needle Stick(Sindano)', '#004b23', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'Non-Invasive Methods(Vidonge)', '#fb8500', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(3, 'Skin(Kupaka)', '#e76f51', '2024-09-21 20:19:57', '2024-09-21 20:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `animal_disposals`
--

CREATE TABLE `animal_disposals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `animal_disposal_type_id` bigint(20) UNSIGNED NOT NULL,
  `reasons` text NOT NULL,
  `remarks` text NOT NULL,
  `meat_obtaines` double DEFAULT NULL,
  `vet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `extension_officer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `animal_disposals`
--

INSERT INTO `animal_disposals` (`id`, `uuid`, `reference_no`, `farm_id`, `livestock_id`, `animal_disposal_type_id`, `reasons`, `remarks`, `meat_obtaines`, `vet_id`, `extension_officer_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `deleted_at`) VALUES
(1, NULL, 'AD255827342', 2, 4, 2, 'none', 'none', 200, NULL, NULL, 6, NULL, 1, '2024-09-25 08:09:14', '2024-09-25 05:09:14', NULL, NULL),
(2, NULL, 'AD136558205', 18, 11, 2, 'Uzee', 'Uzee', 600, NULL, NULL, 27, NULL, 1, '2024-10-06 12:16:12', '2024-10-06 09:16:12', NULL, NULL),
(3, NULL, 'AD273828250', 21, 17, 2, 'good to go', 'good to go', 30, NULL, NULL, 32, NULL, 1, '2025-09-22 11:56:32', '2025-09-22 08:56:32', NULL, NULL),
(4, NULL, 'AD140374166', 21, 17, 3, 'lost bad', 'lost bad', 40, NULL, NULL, 32, NULL, 1, '2025-09-24 21:58:13', '2025-09-24 21:58:13', NULL, NULL),
(5, 'disposal-fresh-1759485834', 'DSP_FRESH_1759485834', 1, 1, 1, 'Old age', 'Natural death', 0, NULL, 1, 1, NULL, 1, '2025-10-03 10:03:54', '2025-10-03 10:03:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `animal_disposal_types`
--

CREATE TABLE `animal_disposal_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `animal_disposal_types`
--

INSERT INTO `animal_disposal_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Dead', '#d90429', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Slaughtered', '#073b4c', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Lost', '#8338ec', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Culled', '#03071e', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, 'Other', '#ffc8dd', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `animal_sales`
--

CREATE TABLE `animal_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `batch_no` varchar(255) NOT NULL,
  `animal_sale_reason_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `animal_sale_details`
--

CREATE TABLE `animal_sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `animal_sale_reasons`
--

CREATE TABLE `animal_sale_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `animal_sale_reasons`
--

INSERT INTO `animal_sale_reasons` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Slaughter', '#d90429', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Scale', '#073b4c', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `animal_vaccine_dosages`
--

CREATE TABLE `animal_vaccine_dosages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) NOT NULL,
  `livestock_id` bigint(20) NOT NULL,
  `vaccine_dosage_id` bigint(20) NOT NULL,
  `disease_id` bigint(20) NOT NULL,
  `vaccination_date` varchar(255) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `attachment_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `name`, `path`, `size`, `attachment_type_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '961485161.jpg', '/storage/961485161.jpg', '1639633', 1, 1, NULL, '2024-09-21 22:49:29', '2024-09-21 22:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `attachment_types`
--

CREATE TABLE `attachment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachment_types`
--

INSERT INTO `attachment_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Passport Picture', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `authorization_tokens`
--

CREATE TABLE `authorization_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `profile` varchar(255) NOT NULL,
  `token` int(10) UNSIGNED NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `breeds`
--

CREATE TABLE `breeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `group` varchar(255) NOT NULL,
  `livestock_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `breeds`
--

INSERT INTO `breeds` (`id`, `name`, `color`, `group`, `livestock_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Singida White', '#00afb9', 'Small East Africa Zebu', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Watusi', '#00afb9', 'Sanga', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Iringa Red', '#00afb9', 'Small East Africa Zebu', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, 'Zenga', '#00afb9', 'Jiddu or Tuni', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, 'Bahima', '#00afb9', 'Sanga', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(6, 'Zenga', '#00afb9', 'Sukuma', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(7, 'Mkalama Dun', '#00afb9', 'Small East Africa Zebu', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(8, 'Chagga', '#00afb9', 'Small East Africa Zebu', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(9, 'Pare', NULL, 'Small East Africa Zebu', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(10, 'Zanzibar Zebu', '#00afb9', 'Small East Africa Zebu', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(11, 'Improved Boran', '#00afb9', 'Large East Africa Zebu', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `calfs`
--

CREATE TABLE `calfs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `calving_id` bigint(20) UNSIGNED NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calfs`
--

INSERT INTO `calfs` (`id`, `calving_id`, `gender_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 6, NULL, 1, '2024-09-25 07:14:21', '2024-09-25 04:14:21'),
(2, 2, 2, 32, NULL, 1, '2025-09-21 09:05:38', '2025-09-21 06:05:38'),
(3, 3, 1, 32, NULL, 1, '2025-09-21 09:07:13', '2025-09-21 06:07:13'),
(4, 4, 1, 32, NULL, 1, '2025-09-21 09:09:16', '2025-09-21 06:09:16'),
(5, 5, 1, 1, NULL, 1, '2025-09-21 09:14:18', '2025-09-21 06:14:18'),
(6, 6, 2, 1, NULL, 1, '2025-09-21 09:17:13', '2025-09-21 06:17:13'),
(7, 7, 1, 32, NULL, 1, '2025-09-21 09:29:35', '2025-09-21 06:29:35'),
(8, 8, 2, 32, NULL, 1, '2025-09-21 13:23:40', '2025-09-21 10:23:40'),
(9, 9, 2, 32, NULL, 1, '2025-09-21 13:47:43', '2025-09-21 10:47:43'),
(10, 10, 1, 32, NULL, 1, '2025-09-21 14:55:18', '2025-09-21 11:55:18'),
(11, 11, 2, 1, NULL, 1, '2025-09-21 15:16:02', '2025-09-21 12:16:02'),
(12, 12, 2, 32, NULL, 1, '2025-09-22 08:49:09', '2025-09-22 05:49:09'),
(13, 13, 2, 32, NULL, 1, '2025-09-22 09:01:26', '2025-09-22 06:01:26'),
(14, 14, 1, 32, NULL, 1, '2025-09-23 21:05:47', '2025-09-23 21:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `calf_conditions`
--

CREATE TABLE `calf_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `calf_id` bigint(20) UNSIGNED NOT NULL,
  `calf_condition_type_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calf_condition_types`
--

CREATE TABLE `calf_condition_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calf_condition_types`
--

INSERT INTO `calf_condition_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Normal', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Abnormal', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `calf_problems`
--

CREATE TABLE `calf_problems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `calf_id` bigint(20) UNSIGNED NOT NULL,
  `calf_problem_type_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calf_problems`
--

INSERT INTO `calf_problems` (`id`, `calf_id`, `calf_problem_type_id`, `remarks`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Remarks', 6, NULL, 1, '2024-09-25 07:14:21', '2024-09-25 04:14:21'),
(2, 2, 2, 'well well', 32, NULL, 1, '2025-09-21 09:05:38', '2025-09-21 06:05:38'),
(3, 3, 2, 'good good', 32, NULL, 1, '2025-09-21 09:07:13', '2025-09-21 06:07:13'),
(4, 4, 2, 'good good', 32, NULL, 1, '2025-09-21 09:09:16', '2025-09-21 06:09:16'),
(5, 5, 1, 'Test calving for Dead_boy', 1, NULL, 1, '2025-09-21 09:14:18', '2025-09-21 06:14:18'),
(6, 6, 2, 'Test to check if previous records are deleted', 1, NULL, 1, '2025-09-21 09:17:13', '2025-09-21 06:17:13'),
(7, 7, 2, 'gigo like good', 32, NULL, 1, '2025-09-21 09:29:35', '2025-09-21 06:29:35'),
(8, 8, 2, 'maya', 32, NULL, 1, '2025-09-21 13:23:40', '2025-09-21 10:23:40'),
(9, 9, 2, 'now last now', 32, NULL, 1, '2025-09-21 13:47:43', '2025-09-21 10:47:43'),
(10, 10, 1, 'heheh', 32, NULL, 1, '2025-09-21 14:55:18', '2025-09-21 11:55:18'),
(11, 11, 1, 'Test calving without gender field', 1, NULL, 1, '2025-09-21 15:16:02', '2025-09-21 12:16:02'),
(12, 12, 1, 'y y y y', 32, NULL, 1, '2025-09-22 08:49:09', '2025-09-22 05:49:09'),
(13, 13, 2, 'none', 32, NULL, 1, '2025-09-22 09:01:26', '2025-09-22 06:01:26'),
(14, 14, 1, 'Test calving', 32, NULL, 1, '2025-09-23 21:05:47', '2025-09-23 21:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `calf_problem_types`
--

CREATE TABLE `calf_problem_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calf_problem_types`
--

INSERT INTO `calf_problem_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Fetatomy', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'No Problem', '#28a745', '2025-09-21 10:35:52', '2025-09-21 10:35:52'),
(3, 'Respiratory problem', '#dc3545', '2025-09-21 10:35:52', '2025-09-21 10:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `calf_reproductive_problems`
--

CREATE TABLE `calf_reproductive_problems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `calf_id` bigint(20) UNSIGNED NOT NULL,
  `problem_type_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calf_reproductive_problems`
--

INSERT INTO `calf_reproductive_problems` (`id`, `calf_id`, `problem_type_id`, `remarks`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Remarks', 6, NULL, 1, '2024-09-25 07:14:21', '2024-09-25 04:14:21'),
(2, 2, 2, 'well well', 32, NULL, 1, '2025-09-21 09:05:38', '2025-09-21 06:05:38'),
(3, 3, 1, 'good good', 32, NULL, 1, '2025-09-21 09:07:13', '2025-09-21 06:07:13'),
(4, 4, 2, 'good good', 32, NULL, 1, '2025-09-21 09:09:16', '2025-09-21 06:09:16'),
(5, 5, 1, 'Test calving for Dead_boy', 1, NULL, 1, '2025-09-21 09:14:18', '2025-09-21 06:14:18'),
(6, 6, 2, 'Test to check if previous records are deleted', 1, NULL, 1, '2025-09-21 09:17:13', '2025-09-21 06:17:13'),
(7, 7, 2, 'gigo like good', 32, NULL, 1, '2025-09-21 09:29:35', '2025-09-21 06:29:35'),
(8, 8, 2, 'maya', 32, NULL, 1, '2025-09-21 13:23:40', '2025-09-21 10:23:40'),
(9, 9, 2, 'now last now', 32, NULL, 1, '2025-09-21 13:47:43', '2025-09-21 10:47:43'),
(10, 10, 5, 'heheh', 32, NULL, 1, '2025-09-21 14:55:18', '2025-09-21 11:55:18'),
(11, 11, 1, 'Test calving without gender field', 1, NULL, 1, '2025-09-21 15:16:02', '2025-09-21 12:16:02'),
(12, 12, 2, 'y y y y', 32, NULL, 1, '2025-09-22 08:49:09', '2025-09-22 05:49:09'),
(13, 13, 5, 'none', 32, NULL, 1, '2025-09-22 09:01:26', '2025-09-22 06:01:26'),
(14, 14, 1, 'Test calving', 32, NULL, 1, '2025-09-23 21:05:47', '2025-09-23 21:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `calf_reproductive_problem_types`
--

CREATE TABLE `calf_reproductive_problem_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calf_reproductive_problem_types`
--

INSERT INTO `calf_reproductive_problem_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Abortion', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Nerve paralysis', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Dystocia', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Mastitis', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, 'Milk fever', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(6, 'Normal', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(7, 'Other', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(8, 'No Problem', '#28a745', '2025-09-21 10:35:59', '2025-09-21 10:35:59'),
(9, 'Mother injury', '#dc3545', '2025-09-21 10:35:59', '2025-09-21 10:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `calvings`
--

CREATE TABLE `calvings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `calving_type_id` bigint(20) NOT NULL,
  `calving_problems_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reproductive_problem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calvings`
--

INSERT INTO `calvings` (`id`, `uuid`, `reference_no`, `farm_id`, `livestock_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `deleted_at`, `calving_type_id`, `calving_problems_id`, `reproductive_problem_id`, `remarks`) VALUES
(1, NULL, 'CVN644752517', 2, 2, 6, NULL, 1, '2024-09-25 07:14:21', '2025-09-21 11:34:04', NULL, NULL, 1, 1, 1, 'Remarks'),
(2, NULL, 'CVN973323541', 21, 17, 32, NULL, 1, '2025-09-21 09:05:38', '2025-09-21 11:34:04', NULL, NULL, 2, 2, 2, 'well well'),
(3, NULL, 'CVN644330000', 21, 17, 32, NULL, 1, '2025-09-21 09:07:13', '2025-09-21 11:34:04', NULL, NULL, 1, 2, 1, 'good good'),
(4, NULL, 'CVN768705208', 21, 17, 32, NULL, 1, '2025-09-21 09:09:16', '2025-09-21 11:34:04', NULL, NULL, 1, 2, 2, 'good good'),
(5, NULL, 'CVN16021916', 21, 17, 1, NULL, 1, '2025-09-21 09:14:18', '2025-09-21 11:34:04', NULL, NULL, 1, 1, 1, 'Test calving for Dead_boy'),
(6, NULL, 'CVN560765250', 21, 17, 1, NULL, 1, '2025-09-21 09:17:13', '2025-09-21 11:34:04', NULL, NULL, 2, 2, 2, 'Test to check if previous records are deleted'),
(7, NULL, 'CVN124364708', 21, 17, 32, NULL, 1, '2025-09-21 09:29:35', '2025-09-21 11:34:04', NULL, NULL, 2, 2, 2, 'gigo like good'),
(8, NULL, 'CVN398726708', 21, 17, 32, NULL, 1, '2025-09-21 13:23:40', '2025-09-21 11:34:04', NULL, NULL, 2, 2, 2, 'maya'),
(9, NULL, 'CVN33760250', 21, 17, 32, NULL, 1, '2025-09-21 13:47:43', '2025-09-21 11:34:04', NULL, NULL, 2, 2, 2, 'now last now'),
(10, NULL, 'CVN186687166', 21, 17, 32, NULL, 1, '2025-09-21 14:55:18', '2025-09-21 11:55:18', NULL, NULL, 2, 1, 5, 'heheh'),
(11, NULL, 'CVN343063000', 21, 17, 1, NULL, 1, '2025-09-21 15:16:02', '2025-09-21 12:16:02', NULL, NULL, 1, 1, 1, 'Test calving without gender field'),
(12, NULL, 'CVN117893500', 21, 17, 32, NULL, 1, '2025-09-22 08:49:09', '2025-09-22 05:49:09', NULL, NULL, 2, 1, 2, 'y y y y'),
(13, NULL, 'CVN105011041', 21, 17, 32, NULL, 1, '2025-09-22 09:01:26', '2025-09-22 06:01:26', NULL, NULL, 2, 2, 5, 'none'),
(14, NULL, 'CVN53214500', 21, 16, 32, NULL, 1, '2025-09-23 21:05:47', '2025-09-23 21:05:47', NULL, NULL, 1, 1, 1, 'Test calving');

-- --------------------------------------------------------

--
-- Table structure for table `calving_types`
--

CREATE TABLE `calving_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calving_types`
--

INSERT INTO `calving_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Natural', '#28a745', '2025-09-21 10:35:45', '2025-09-21 10:35:45'),
(2, 'Assisted', '#ffc107', '2025-09-21 10:35:45', '2025-09-21 10:35:45');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `certificate_no` varchar(255) NOT NULL,
  `certificate_type_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `approved_by` bigint(20) UNSIGNED NOT NULL,
  `certificate_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_statuses`
--

CREATE TABLE `certificate_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificate_statuses`
--

INSERT INTO `certificate_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Cancelled', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, 'Expired', '#e63946', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `certificate_types`
--

CREATE TABLE `certificate_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificate_types`
--

INSERT INTO `certificate_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Transfer', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Slaughter', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Vaccination', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `short_name`, `created_at`, `updated_at`) VALUES
(1, 'Tanzania', 'TZ', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Tanzanian Shilling', 'TZS', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `dewormings`
--

CREATE TABLE `dewormings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `dose` varchar(255) NOT NULL,
  `administration_route` varchar(255) NOT NULL,
  `next_administration_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `vet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `extension_officer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_unit_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dewormings`
--

INSERT INTO `dewormings` (`id`, `uuid`, `reference_no`, `farm_id`, `livestock_id`, `dose`, `administration_route`, `next_administration_date`, `remarks`, `vet_id`, `extension_officer_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `deleted_at`, `medicine_id`, `quantity_unit_id`, `quantity`) VALUES
(1, NULL, 'DW346271679', 2, 2, '1', '1', '2024-01-01', 'rEMARKS', NULL, NULL, 6, NULL, 1, '2024-09-25 07:54:54', '2024-09-25 04:54:54', NULL, NULL, 1, 2, 14),
(2, NULL, 'DW265764242', 17, 15, '1', '2', '2024-12-04', 'none', NULL, NULL, 25, NULL, 1, '2024-10-08 10:38:18', '2024-10-08 07:38:18', NULL, NULL, 3, 2, 8),
(3, NULL, 'DW364846631', 17, 14, '1', '2', '2024-12-04', 'none', NULL, NULL, 25, NULL, 1, '2024-10-08 10:38:20', '2024-10-08 07:38:20', NULL, NULL, 3, 2, 8),
(4, NULL, 'DW524471458', 21, 17, '1', '2', '2025-09-22', 'well and good', NULL, NULL, 32, NULL, 1, '2025-09-22 13:16:38', '2025-09-22 10:16:38', NULL, NULL, 2, 2, 30),
(5, NULL, 'DW741839833', 21, 16, '1', '1', '2025-02-22', 'Test deworming', NULL, NULL, 32, NULL, 1, '2025-09-23 21:04:20', '2025-09-23 21:04:20', NULL, NULL, 1, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_spreadable` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name`, `description`, `is_spreadable`, `created_at`, `updated_at`) VALUES
(1, 'East Coast Fever', '', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Foot and Mouth Disease', '', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Animal African Trypanosomosis', '', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, 'Contagious Bovine Pleuropneumonia', '', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, 'Rift Valley Fever', '', 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `districtID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `districtID`, `name`, `country_id`, `region_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '1', 'Arumeru', 1, 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, '2', 'Arusha', 1, 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, '49', 'Babati', 1, 14, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, '88', 'Bagamoyo', 1, 21, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, '12', 'Bahi', 1, 3, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(6, '22', 'Biharamulo', 1, 5, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(7, '32', 'Buhigwe', 1, 9, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(8, '23', 'Bukoba', 1, 5, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(9, '54', 'Bunda', 1, 15, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(10, '55', 'Butiama', 1, 15, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(11, '86', 'Chake Chake', 1, 11, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(12, '13', 'Chamwino', 1, 3, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(13, '14', 'Chemba', 1, 3, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(14, '60', 'Chunya', 1, 16, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(15, '15', 'Dodoma', 1, 3, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(16, '65', 'Gairo', 1, 18, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(17, '38', 'Hai', 1, 10, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(18, '50', 'Hanang', 1, 14, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(19, '118', 'Handeni', 1, 27, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(20, '111', 'Igunga', 1, 26, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(21, '106', 'Ikungi', 1, 25, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(22, '7', 'Ilala', 1, 2, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(23, '77', 'Ilemela', 1, 20, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(24, '107', 'Iramba', 1, 25, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(25, '19', 'Iringa', 1, 4, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(26, '103', 'Kahama', 1, 24, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(27, '33', 'Kakonko', 1, 9, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(28, '95', 'Kalambo', 1, 22, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(29, '112', 'Kaliua', 1, 26, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(30, '24', 'Karagwe', 1, 5, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(31, '3', 'Karatu', 1, 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(32, '129', 'Kaskazini A', 1, 7, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(33, '130', 'Kaskazini B', 1, 7, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(34, '34', 'Kasulu', 1, 9, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(35, '131', 'Kati', 1, 12, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(36, '89', 'Kibaha', 1, 21, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(37, '90', 'Kibiti', 1, 21, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(38, '35', 'Kibondo', 1, 9, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(39, '8', 'Kigamboni', 1, 2, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(40, '36', 'Kigoma', 1, 9, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(41, '119', 'Kilindi', 1, 27, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(42, '20', 'Kilolo', 1, 4, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(43, '66', 'Kilombero', 1, 18, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(44, '67', 'Kilosa', 1, 18, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(45, '44', 'Kilwa', 1, 13, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(46, '9', 'Kinondoni', 1, 2, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(47, '91', 'Kisarawe', 1, 21, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(48, '104', 'Kishapu', 1, 24, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(49, '51', 'Kiteto', 1, 14, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(50, '16', 'Kondoa', 1, 3, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(51, '17', 'Kongwa', 1, 3, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(52, '120', 'Korogwe', 1, 27, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(53, '132', 'Kusini', 1, 12, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(54, '78', 'Kwimba', 1, 20, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(55, '61', 'Kyela', 1, 16, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(56, '25', 'Kyerwa', 1, 5, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(57, '45', 'Lindi', 1, 13, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(58, '46', 'Liwale', 1, 13, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(59, '4', 'Longido', 1, 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(60, '121', 'Lushoto', 1, 27, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(61, '92', 'Mafia', 1, 21, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(62, '126', 'Magharibi A', 1, 17, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(63, '127', 'Magharibi B', 1, 17, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(64, '79', 'Magu', 1, 20, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(65, '68', 'Malinyi', 1, 18, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(66, '108', 'Manyoni', 1, 25, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(67, '72', 'Masasi', 1, 19, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(68, '62', 'Mbarali', 1, 16, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(69, '63', 'Mbeya', 1, 16, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(70, '98', 'Mbinga', 1, 23, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(71, '52', 'Mbulu', 1, 14, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(72, '84', 'Micheweni', 1, 6, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(73, '26', 'Missenyi', 1, 5, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(74, '80', 'Misungwi', 1, 20, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(75, '128', 'Mjini', 1, 17, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(76, '109', 'Mkalama', 1, 25, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(77, '122', 'Mkinga', 1, 27, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(78, '87', 'Mkoani', 1, 11, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(79, '93', 'Mkuranga', 1, 21, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(80, '29', 'Mlele', 1, 8, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(81, '5', 'Monduli', 1, 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(82, '69', 'Morogoro', 1, 18, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(83, '39', 'Moshi', 1, 10, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(84, '30', 'Mpanda', 1, 8, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(85, '18', 'Mpwapwa', 1, 3, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(86, '73', 'Mtwara', 1, 19, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(87, '21', 'Mufindi', 1, 4, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(88, '123', 'Muheza', 1, 27, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(89, '27', 'Muleba', 1, 5, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(90, '56', 'Musoma', 1, 15, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(91, '70', 'Mvomero', 1, 18, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(92, '40', 'Mwanga', 1, 10, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(93, '47', 'Nachingwea', 1, 13, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(94, '99', 'Namtumbo', 1, 23, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(95, '74', 'Nanyumbu', 1, 19, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(96, '75', 'Newala', 1, 19, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(97, '28', 'Ngara', 1, 5, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(98, '6', 'Ngorongoro', 1, 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(99, '96', 'Nkasi', 1, 22, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(100, '81', 'Nyamagana', 1, 20, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(101, '100', 'Nyasa', 1, 23, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(102, '113', 'Nzega', 1, 26, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(103, '124', 'Pangani', 1, 27, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(104, '41', 'Rombo', 1, 10, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(105, '57', 'Rorya', 1, 15, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(106, '48', 'Ruangwa', 1, 13, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(107, '94', 'Rufiji', 1, 21, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(108, '64', 'Rungwe', 1, 16, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(109, '42', 'Same', 1, 10, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(110, '82', 'Sengerema', 1, 20, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(111, '58', 'Serengeti', 1, 15, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(112, '105', 'Shinyanga', 1, 24, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(113, '43', 'Siha', 1, 10, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(114, '114', 'Sikonge', 1, 26, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(115, '53', 'Simanjiro', 1, 14, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(116, '110', 'Singida', 1, 25, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(117, '101', 'Songea', 1, 23, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(118, '97', 'Sumbawanga', 1, 22, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(119, '115', 'Tabora', 1, 26, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(120, '76', 'Tandahimba', 1, 19, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(121, '125', 'Tanga', 1, 27, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(122, '31', 'Tanganyika', 1, 8, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(123, '59', 'Tarime', 1, 15, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(124, '10', 'Temeke', 1, 2, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(125, '102', 'Tunduru', 1, 23, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(126, '11', 'Ubungo', 1, 2, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(127, '83', 'Ukerewe', 1, 20, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(128, '71', 'Ulanga', 1, 18, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(129, '116', 'Urambo', 1, 26, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(130, '37', 'Uvinza', 1, 9, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(131, '117', 'Uyui', 1, 26, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(132, '85', 'Wete', 1, 6, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drying_offs`
--

CREATE TABLE `drying_offs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `serial` varchar(250) NOT NULL,
  `expected_calving_date` date NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drying_offs`
--

INSERT INTO `drying_offs` (`id`, `uuid`, `reference_no`, `farm_id`, `livestock_id`, `serial`, `expected_calving_date`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `deleted_at`, `start_date`, `end_date`) VALUES
(1, NULL, 'DRF854696469', 2, 4, 'TZA024I300247-0002', '2024-10-18', 6, NULL, 1, '2024-09-25 08:00:13', '2024-09-25 05:00:13', NULL, NULL, NULL, NULL),
(2, NULL, 'DRF272854538', 2, 2, 'TZ0001234834901', '2024-01-01', 6, NULL, 1, '2024-09-25 08:00:49', '2024-09-25 05:00:49', NULL, NULL, NULL, NULL),
(3, NULL, 'DRF852849280', 18, 11, '2345-00018', '2024-10-06', 27, NULL, 1, '2024-10-06 12:13:33', '2024-10-06 09:13:33', NULL, NULL, NULL, NULL),
(4, NULL, 'DRF743636100', 17, 14, '8991389741184', '2024-10-10', 25, NULL, 1, '2024-10-07 10:30:52', '2024-10-07 07:30:52', NULL, NULL, NULL, NULL),
(5, NULL, 'DRF849965916', 21, 17, '123-00021', '2025-12-25', 1, NULL, 1, '2025-09-21 09:36:23', '2025-09-21 06:36:23', NULL, NULL, NULL, NULL),
(6, NULL, 'DRF853320791', 21, 17, '123-00021', '2025-12-25', 1, NULL, 1, '2025-09-21 09:38:32', '2025-09-21 06:38:32', NULL, NULL, NULL, NULL),
(7, NULL, 'DRF597831750', 21, 17, '123-00021', '2025-12-25', 1, NULL, 1, '2025-09-21 09:55:24', '2025-09-21 06:55:24', NULL, NULL, '2025-09-21', '2025-12-21'),
(8, NULL, 'DRF941126666', 21, 17, '123-00021', '2025-09-24', 32, NULL, 1, '2025-09-21 11:24:39', '2025-09-21 08:24:39', NULL, NULL, '2025-09-25', '2025-09-25'),
(9, NULL, 'DRF915669458', 21, 17, '123-00021', '2025-09-21', 32, NULL, 1, '2025-09-21 15:31:01', '2025-09-21 12:31:01', NULL, NULL, '2025-09-21', '2025-09-21'),
(10, NULL, 'DRF615143333', 21, 17, '123-00021', '2025-09-21', 32, NULL, 1, '2025-09-21 15:37:26', '2025-09-21 12:37:26', NULL, NULL, '2025-09-21', '2025-09-21'),
(11, NULL, 'DRF393580125', 21, 17, '123-00021', '2025-09-21', 32, NULL, 1, '2025-09-21 15:37:52', '2025-09-21 12:37:52', NULL, NULL, '2025-09-21', '2025-09-21'),
(12, NULL, 'DRF170004208', 21, 17, '123-00021', '2025-09-21', 32, NULL, 1, '2025-09-21 15:49:12', '2025-09-21 12:49:12', NULL, NULL, '2025-09-21', '2025-09-21'),
(13, NULL, 'DRF543283541', 21, 17, '123-00021', '2025-09-21', 32, NULL, 1, '2025-09-21 15:54:36', '2025-09-21 12:54:36', NULL, NULL, '2025-09-21', '2025-09-21'),
(14, NULL, 'DRF272544375', 21, 17, '123-00021', '2025-09-26', 32, NULL, 1, '2025-09-21 16:01:37', '2025-09-21 13:01:37', NULL, NULL, '2025-09-23', '2025-09-30'),
(15, NULL, 'DRF372835750', 21, 17, '123-00021', '2025-09-21', 32, NULL, 1, '2025-09-21 16:06:52', '2025-09-21 13:06:52', NULL, NULL, '2025-09-21', '2025-09-21'),
(16, NULL, 'DRF555549291', 21, 17, '123-00021', '2025-09-22', 32, NULL, 1, '2025-09-22 09:02:15', '2025-09-22 06:02:15', NULL, NULL, '2025-09-22', '2025-09-22'),
(17, NULL, 'DRF921153291', 21, 17, '123-00021', '2025-09-22', 32, NULL, 1, '2025-09-22 09:18:56', '2025-09-22 06:18:56', NULL, NULL, '2025-09-22', '2025-09-22'),
(18, NULL, 'DRF846534208', 21, 17, '123-00021', '2025-09-22', 32, NULL, 1, '2025-09-22 09:25:15', '2025-09-22 06:25:15', NULL, NULL, '2025-09-22', '2025-09-22'),
(19, NULL, 'DRF371519041', 21, 17, '123-00021', '2025-09-22', 32, NULL, 1, '2025-09-22 10:00:35', '2025-09-22 07:00:35', NULL, NULL, '2025-09-22', '2025-09-22'),
(20, NULL, 'DRF197708500', 21, 17, '123-00021', '2025-09-22', 32, NULL, 1, '2025-09-22 10:01:29', '2025-09-22 07:01:29', NULL, NULL, '2025-09-22', '2025-09-22'),
(21, NULL, 'DRF925188291', 21, 17, '123-00021', '2025-09-22', 32, NULL, 1, '2025-09-22 10:19:10', '2025-09-22 07:19:10', NULL, NULL, '2025-09-22', '2025-09-22'),
(22, NULL, 'DRF944842291', 21, 17, '123-00021', '2025-10-05', 32, NULL, 1, '2025-09-22 10:39:09', '2025-09-22 07:39:09', NULL, NULL, '2025-09-22', '2025-09-30'),
(23, 'drying-uuid-001', 'DRY_REF_001', 1, 1, 'DRY001', '2024-09-01', 1, NULL, 1, '2025-10-03 09:56:28', '2025-10-03 09:56:28', NULL, NULL, '2024-01-01', '2024-02-01'),
(25, 'drying-uuid-002', 'DRY_REF_002', 1, 1, 'DRY001', '2024-09-01', 1, NULL, 1, '2025-10-03 09:58:49', '2025-10-03 09:58:49', NULL, NULL, '2024-01-01', '2024-02-01'),
(27, 'drying-uuid-003', 'DRY_REF_003', 1, 1, 'DRY001', '2024-09-01', 1, NULL, 1, '2025-10-03 09:59:43', '2025-10-03 09:59:43', NULL, NULL, '2024-01-01', '2024-02-01'),
(29, 'drying-uuid-004', 'DRY_REF_004', 1, 1, 'DRY001', '2024-09-01', 1, NULL, 1, '2025-10-03 10:00:32', '2025-10-03 10:00:32', NULL, NULL, '2024-01-01', '2024-02-01'),
(31, 'drying-uuid-005', 'DRY_REF_005', 1, 1, 'DRY001', '2024-09-01', 1, NULL, 1, '2025-10-03 10:01:18', '2025-10-03 10:01:18', NULL, NULL, '2024-01-01', '2024-02-01'),
(32, 'drying-fresh-1759485785', 'DRY_FRESH_1759485785', 1, 1, 'DRY1759485785', '2024-09-01', 1, NULL, 1, '2025-10-03 10:03:05', '2025-10-03 10:03:05', NULL, NULL, '2024-01-01', '2024-02-01'),
(33, 'drying-fresh-1759485834', 'DRY_FRESH_1759485834', 1, 1, 'DRY1759485834', '2024-09-01', 1, NULL, 1, '2025-10-03 10:03:54', '2025-10-03 10:03:54', NULL, NULL, '2024-01-01', '2024-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `extension_officers`
--

CREATE TABLE `extension_officers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registration_no` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_1` varchar(255) NOT NULL,
  `phone_2` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `medical_licence_no` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `identity_card_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `identity_number` varchar(255) DEFAULT NULL,
  `school_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extension_officers`
--

INSERT INTO `extension_officers` (`id`, `registration_no`, `name`, `phone_1`, `phone_2`, `email`, `address`, `medical_licence_no`, `date_of_birth`, `gender_id`, `identity_card_type_id`, `identity_number`, `school_level_id`, `country_id`, `region_id`, `district_id`, `created_by`, `updated_by`, `status_id`, `is_verified`, `created_at`, `updated_at`) VALUES
(1, 'EXF434737128', 'John Jackson', '', '', 'john@gmail.com', '123 Mtaa Street, Dar es Salaam', NULL, '1990-12-12', 1, 1, '19901212141210000333', 1, NULL, 2, 7, NULL, NULL, 1, 1, '2024-09-23 04:23:27', '2024-09-23 04:23:27'),
(2, 'EXF10063684', NULL, '0786634499', NULL, 'mwamba@gmail.com', NULL, '1010101', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 0, '2024-10-03 09:28:35', '2024-10-03 09:28:35'),
(3, 'EXF908960697', NULL, '0785433225', NULL, 'mtabe@officer.com', NULL, '88999', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 0, '2024-10-03 09:29:18', '2024-10-03 09:29:18'),
(4, 'EXF493384207', NULL, '0688000111', NULL, 'lutondwa@gmail.com', NULL, '1200012', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 0, '2024-10-03 09:31:33', '2024-10-03 09:31:33'),
(5, 'EXF58925099', NULL, '0688133433', NULL, 'ngallah@gmail.con', NULL, '000999', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 0, '2024-10-04 11:09:24', '2024-10-04 11:09:24'),
(6, 'EXF255928745', NULL, '0699888777', NULL, 'miqquee@gmail.com', NULL, '000888', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 0, '2024-10-04 11:35:48', '2024-10-04 11:35:48'),
(7, 'EXF548637378', NULL, '0987112223', NULL, 'joelmanu@gmail.com', NULL, '2342134ASD', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 0, '2024-10-05 08:53:06', '2024-10-05 08:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `extension_officer_attachments`
--

CREATE TABLE `extension_officer_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `extension_officer_id` bigint(20) UNSIGNED NOT NULL,
  `attachment_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extension_officer_farms`
--

CREATE TABLE `extension_officer_farms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `extension_officer_id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extension_officer_farms`
--

INSERT INTO `extension_officer_farms` (`id`, `extension_officer_id`, `farm_id`, `state_id`, `assigned_by`, `created_at`, `updated_at`) VALUES
(1, 2, 11, 1, 2, '2024-10-04 05:14:05', '2024-10-04 05:14:05'),
(2, 2, 12, 1, 2, '2024-10-04 05:16:35', '2024-10-04 05:16:35'),
(3, 4, 13, 1, 4, '2024-10-04 06:51:17', '2024-10-04 06:51:17'),
(4, 6, 14, 1, 6, '2024-10-04 11:44:05', '2024-10-04 11:44:05'),
(5, 7, 15, 1, 7, '2024-10-05 09:08:34', '2024-10-05 09:08:34'),
(6, 1, 21, 1, 32, '2025-09-30 00:22:10', '2025-09-30 00:22:10');

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
-- Table structure for table `farmers`
--

CREATE TABLE `farmers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farmer_no` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phone_1` varchar(255) NOT NULL,
  `phone_2` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `farmer_organization_membership` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `identity_card_type_id` bigint(20) UNSIGNED NOT NULL,
  `identity_number` varchar(255) DEFAULT NULL,
  `street_id` bigint(20) UNSIGNED DEFAULT NULL,
  `school_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `village_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ward_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `farmer_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `farmer_status_id` bigint(20) UNSIGNED NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farmers`
--

INSERT INTO `farmers` (`id`, `farmer_no`, `first_name`, `middle_name`, `surname`, `phone_1`, `phone_2`, `email`, `physical_address`, `farmer_organization_membership`, `date_of_birth`, `gender_id`, `identity_card_type_id`, `identity_number`, `street_id`, `school_level_id`, `village_id`, `ward_id`, `division_id`, `district_id`, `region_id`, `country_id`, `farmer_type_id`, `created_by`, `updated_by`, `farmer_status_id`, `is_verified`, `created_at`, `updated_at`) VALUES
(1, 'FM398566338', 'Juhudi', 'Manuu', 'Juhudi', '0715890890', '0756334433', 'juhudi@farmer.com', 'Dar es Salaam', '', '1990-01-01', 1, 1, '19900101141210000132', NULL, 1, NULL, NULL, NULL, 7, 2, 1, 1, NULL, 1, 1, 0, '2024-09-21 19:06:28', '2024-09-21 23:19:50'),
(2, 'FM957607305', 'Demetria', 'Wang', 'Hebert', '+1 (279) 467-3322', '+1 (749) 139-5472', 'honupowe@mailinator.com', 'Sit vel quasi necess', '853', '1971-05-06', 1, 1, '853', NULL, 3, NULL, 289, NULL, 13, 3, 1, 2, 1, NULL, 1, 1, '2024-09-21 22:49:29', '2024-09-21 22:49:29'),
(3, 'FM578474426', 'Mkulima', '', 'Mkulima', '0715890891', '', 'mkulima@farmer.com', 'Dar es Salaam', '', '1990-01-01', 1, 1, '19900101141210000132', NULL, 1, NULL, NULL, NULL, 7, 2, 1, 1, NULL, NULL, 1, 0, '2024-09-22 05:11:41', '2024-09-22 05:11:41'),
(4, 'FM973308679', 'Sam', '', 'Jones', '0713890890', '0713890890', 'farmer@farmer.com', 'Dar es Salaam', 'FRM002241', '1990-01-01', 1, 1, '19900101141210000142', NULL, 1, NULL, NULL, NULL, 7, 2, 1, 1, NULL, NULL, 1, 0, '2024-09-23 04:41:20', '2024-09-23 04:41:20'),
(5, 'FM45055491', 'Juma', '', 'Saidi', '0766494949', '0766494949', 'juma@saidi.com', 'Kikweni', 'FR001288', '1990-01-01', 1, 1, '19920412141210000454', NULL, 3, NULL, NULL, NULL, 92, 10, 1, 1, NULL, NULL, 1, 0, '2024-09-23 08:46:32', '2024-09-23 08:46:32'),
(15, 'FM963345565', 'Juma', '', 'Saidi', '0715839704', '0711225522', 'joel@farmer.com', 'Dar es Salaam', '', '1990-01-01', 1, 1, '19900101141210000132', NULL, 1, NULL, NULL, NULL, 7, 2, 1, 1, NULL, NULL, 1, 0, '2024-09-23 13:53:22', '2024-09-23 13:53:22'),
(25, 'FM538524266', 'Mkulima', '', 'Mkulima', '07158908232', '', 'mkulima2323@farmer.com', 'Dar es Salaam', '', '1990-01-01', 1, 1, '19900101141210000132', NULL, 1, NULL, NULL, NULL, 7, 2, 1, 1, NULL, NULL, 1, 0, '2024-09-25 12:42:01', '2024-09-25 12:42:01'),
(29, 'FM954672404', 'Joel', '', 'Kibona', '0788995544', '0788995544', 'joel@gmail.com', 'address', '', '1990-01-01', 1, 1, '1234567i91987654321', NULL, 4, NULL, NULL, NULL, 12, 3, 1, 1, NULL, NULL, 1, 0, '2024-09-25 12:50:54', '2024-09-25 12:50:54'),
(30, 'FM468774718', 'Kevin', '', 'Mruma', '0715676737', '0715676737', 'kvnimrm@gmail.com', 'Mufindi', 'T2847001', '1990-01-01', 1, 3, '4000911456', NULL, 4, NULL, NULL, NULL, 87, 4, 1, 1, NULL, NULL, 1, 0, '2024-09-25 13:02:34', '2024-09-25 13:02:34'),
(31, 'FM155902297', 'Emmanuel', '', 'Ngallah', '0688133433', '0688133433', 'ngallah@gmail.com', '01 Tengelea', '000001', '1990-01-01', 1, 1, '19670727233010000226', NULL, 4, NULL, NULL, NULL, 79, 21, 1, 1, NULL, NULL, 1, 0, '2024-09-25 14:26:17', '2024-09-25 14:26:17'),
(32, 'FM27454563', 'Mkulima', '', 'Mkulima', '0715890877', '', 'mkulima23@farmer.com', 'Dar es Salaam', '', '1990-01-01', 1, 1, '19900101141210000132', NULL, 1, NULL, NULL, NULL, 7, 2, 1, 1, NULL, NULL, 1, 0, '2024-10-03 08:29:51', '2024-10-03 08:29:51'),
(33, 'FM778391096', 'Jenipher', '', 'Tondi', '0763514276', '', 'jtondi2001@gmail.com', '555 Kawe', '00999', '1979-01-05', 2, 1, '19790105233010000227', NULL, 4, NULL, NULL, NULL, 79, 21, 1, 2, 4, NULL, 1, 0, '2024-10-03 09:35:42', '2024-10-03 09:35:42'),
(34, 'FM682428322', 'Test', '', 'Mkulima', '0715890800', '', 'test@farmer.com', 'Dar es Salaam', '', '1990-01-01', 1, 1, '19900101141210000132', NULL, 1, NULL, NULL, NULL, 7, 2, 1, 1, NULL, NULL, 1, 0, '2024-10-03 09:48:35', '2024-10-03 09:48:35'),
(35, 'FM109734189', 'Mkulima', '', 'Mkuu', '0745212121', '', 'mkulima@mwamba.com', 'iwiwi', '3456', '2024-10-07', 1, 2, '2939933', NULL, 2, NULL, NULL, NULL, 79, 21, 1, 1, 2, NULL, 1, 0, '2024-10-03 16:10:25', '2024-10-03 16:10:25'),
(36, 'FM579694673', 'Michael', '', 'Mkulima', '0655666333', '', 'mkulima@shambabora.com', '809', '7900', '1980-12-25', 1, 1, '19800007776672330250', NULL, 4, NULL, NULL, NULL, 44, 18, 1, 1, 6, NULL, 1, 0, '2024-10-04 11:39:07', '2024-10-04 11:39:07'),
(37, 'FM529828443', 'Julius', '', 'Manikous', '0981223335', '', 'juliusmali@gmail.com', 'Pangani, Kibaha', '6776676SDDSD', '2024-07-17', 1, 1, '23454545355454000', NULL, 4, NULL, NULL, NULL, 23, 2, 1, 1, 7, NULL, 1, 0, '2024-10-05 08:59:19', '2024-10-05 08:59:19'),
(38, 'FM780121848', 'Aisha', '', 'Mariam', '0658349328', '', 'farmer3@farmer.com', 'Dar es Salaam', 'F002394', '1992-05-01', 2, 1, '19900101141210000132', NULL, 1, NULL, NULL, NULL, 7, 2, 1, 1, NULL, NULL, 1, 0, '2024-10-06 04:42:54', '2024-10-06 04:42:54'),
(39, 'FM629818988', 'Asha', '', 'Saidi', '0788789789', '0788789789', 'asha@saidi.com', 'Chamwino', 'F78964', '1990-01-01', 2, 2, '4000976', NULL, 1, NULL, NULL, NULL, 12, 3, 1, 1, NULL, NULL, 1, 0, '2024-10-06 05:00:05', '2024-10-06 05:00:05'),
(40, 'FM383295532', 'Miriam', '', 'Test', '0799900900', '0799900900', 'miriam@gmail.com', '6777', '919192', '2014-01-01', 2, 2, '999000', NULL, 2, NULL, NULL, NULL, 1, 1, 1, 1, NULL, NULL, 1, 0, '2024-10-06 07:38:13', '2024-10-06 07:38:13'),
(41, 'FM222956791', 'Nathaniel', '', 'Mushi', '0983221112', '', 'mail23@mail.tz', 'Pangani, Kibaha', 'AA42342342', '2024-10-01', 1, 1, '3234234WERWER', NULL, 1, NULL, NULL, NULL, 22, 2, 1, 1, 7, NULL, 1, 0, '2024-10-06 15:41:05', '2024-10-06 15:41:05'),
(42, 'FM562279567', 'Mwashinini', '', 'Mgeni', '0689000000', '0689000000', 'mgeni@gmail.com', '800', '0909090', '2014-01-01', 1, 3, '12345678900', NULL, 2, NULL, NULL, NULL, 33, 7, 1, 1, NULL, NULL, 1, 0, '2024-10-08 10:34:00', '2024-10-08 10:34:00'),
(45, 'FM341440541', 'vallerian', '', 'mchau', '0756215388', '0756215388', 'valler1@gmail.com', 'ilala boma', '1234567890', '2025-07-01', 1, 1, '20011229-16112-00001-23', NULL, 4, NULL, NULL, NULL, 12, 3, 1, 1, 32, NULL, 1, 0, '2025-09-12 12:00:13', '2025-09-12 12:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_attachments`
--

CREATE TABLE `farmer_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farmer_id` bigint(20) UNSIGNED NOT NULL,
  `attachment_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farmer_attachments`
--

INSERT INTO `farmer_attachments` (`id`, `farmer_id`, `attachment_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, NULL, 1, '2024-09-21 22:49:29', '2024-09-21 22:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_farms`
--

CREATE TABLE `farmer_farms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farmer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `farm_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_statuses`
--

CREATE TABLE `farmer_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farmer_statuses`
--

INSERT INTO `farmer_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Inactive', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_types`
--

CREATE TABLE `farmer_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farmer_types`
--

INSERT INTO `farmer_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Individual', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Organization', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `farms`
--

CREATE TABLE `farms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `sync_status` varchar(255) NOT NULL DEFAULT 'synced',
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `original_created_at` timestamp NULL DEFAULT NULL,
  `is_soft_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `pending_action` varchar(255) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `regional_reg_no` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `size_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `latitudes` varchar(255) DEFAULT NULL,
  `longitudes` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) NOT NULL,
  `street_id` bigint(20) UNSIGNED DEFAULT NULL,
  `village_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ward_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `legal_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `farm_status_id` bigint(20) UNSIGNED NOT NULL,
  `has_coordinates` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gps` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farms`
--

INSERT INTO `farms` (`id`, `uuid`, `sync_status`, `last_modified_at`, `device_id`, `original_created_at`, `is_soft_deleted`, `pending_action`, `reference_no`, `regional_reg_no`, `name`, `size`, `size_unit_id`, `latitudes`, `longitudes`, `physical_address`, `street_id`, `village_id`, `ward_id`, `division_id`, `district_id`, `region_id`, `country_id`, `legal_status_id`, `created_by`, `updated_by`, `farm_status_id`, `has_coordinates`, `created_at`, `updated_at`, `gps`) VALUES
(1, '214fc137-be42-470d-bb5a-f3458512bbe3', 'synced', NULL, NULL, NULL, 0, NULL, 'RN576858602', NULL, 'Shamba Lingine Now', '2', 1, NULL, NULL, 'Dar es Salaam', NULL, NULL, NULL, NULL, 7, 2, 1, 1, 2, NULL, 1, 0, '2024-09-21 19:21:11', '2025-10-03 00:44:40', '-6.25,39.39'),
(2, '188b2589-ab42-4193-9f2a-ce48f834b51c', 'synced', NULL, NULL, NULL, 0, NULL, 'RN466423726', NULL, 'Shamba Kubwa', '2', 1, NULL, NULL, 'Dar es Salaam', NULL, NULL, NULL, NULL, 7, 2, 1, 1, 6, NULL, 1, 0, '2024-09-23 05:38:45', '2025-10-03 00:44:40', '-6.25,39.39'),
(3, '8b80f5e1-6a21-4298-a872-b827c1802ccf', 'synced', NULL, NULL, NULL, 0, NULL, 'RN214931970', 'F00282001', 'Mbuga Camp', '12', 1, NULL, NULL, 'Msangeni', NULL, NULL, 2726, NULL, 92, 10, 1, 1, 6, NULL, 1, 0, '2024-09-23 12:17:10', '2025-10-03 00:44:40', '-6.7165465,39.2268918'),
(4, 'f8410eec-b006-43d0-9d6b-26ed92a1d1b8', 'synced', NULL, NULL, NULL, 0, NULL, 'RN479299023', 'FB580027', 'Bondeni Farm', '48', 1, NULL, NULL, 'Msambarani', NULL, NULL, 2715, NULL, 34, 9, 1, 1, 11, NULL, 1, 0, '2024-09-25 13:36:30', '2025-10-03 00:44:40', '-6.7165472,39.2268922'),
(5, '02df5d54-49f5-46e6-94d6-92da66a2fddf', 'synced', NULL, NULL, NULL, 0, NULL, 'RN837938029', '0011122', 'Shamba Bora', '35', 1, NULL, NULL, '2000', NULL, NULL, 3971, NULL, 79, 21, 1, 1, 12, NULL, 1, 0, '2024-09-25 14:41:04', '2025-10-03 00:44:40', '-6.7232418,39.2309309'),
(6, '784ebc28-207a-4453-b568-236512815706', 'synced', NULL, NULL, NULL, 0, NULL, 'RN932349561', '393933', 'farm yangu', '1', 1, NULL, NULL, 'ndio', NULL, NULL, 133, NULL, 12, 3, 1, 1, 9, NULL, 1, 0, '2024-09-26 10:14:44', '2025-10-03 00:44:40', '-6.7232423,39.2309283'),
(11, '627955a0-5d33-4c66-b294-8e54673ae3b9', 'synced', NULL, NULL, NULL, 0, NULL, 'RN630240042', '343432424', 'Shamba Lingine', '2', 1, '-6.25', '39.39', 'Dar es Salaam', NULL, NULL, NULL, NULL, 7, 2, 1, 1, 2, NULL, 1, 0, '2024-10-04 05:14:05', '2025-10-03 00:44:40', NULL),
(12, '210f294a-9220-4d92-90c2-188dbda8051e', 'synced', NULL, NULL, NULL, 0, NULL, 'RN368194661', '444', 'Tunajaribu Shamba', '12', 1, '1', '1', 'mjini', NULL, NULL, NULL, NULL, 79, 21, 1, 2, 2, NULL, 1, 0, '2024-10-04 05:16:35', '2025-10-03 00:44:40', NULL),
(13, '3d33359d-7281-4f13-9380-e2085738ac7b', 'synced', NULL, NULL, NULL, 0, NULL, 'RN925629344', '11111', 'Kikwe Homestead', '8', 1, '25', '96', '89', NULL, NULL, NULL, NULL, 1, 1, 1, 1, 4, NULL, 1, 0, '2024-10-04 06:51:17', '2025-10-03 00:44:40', NULL),
(14, '3b9faf38-6d4d-4da7-a954-5737db73c3a6', 'synced', NULL, NULL, NULL, 0, NULL, 'RN665578535', '111132233', 'Kilosa One', '100', 1, '80', '75', '99000', NULL, NULL, NULL, NULL, 44, 18, 1, 2, 6, NULL, 1, 0, '2024-10-04 11:44:05', '2025-10-03 00:44:40', NULL),
(15, 'cc287da6-5ed0-4af3-9a8b-a94daa7bcb60', 'synced', NULL, NULL, NULL, 0, NULL, 'RN532228478', '234234234', 'Farm One I', '34', 1, '5.6', '3.2', 'Pangani, Kibaha', NULL, NULL, NULL, NULL, 22, 2, 1, 1, 7, NULL, 1, 0, '2024-10-05 09:08:34', '2025-10-03 00:44:40', NULL),
(16, '2ec302b9-312b-4096-86b6-dc07f32619f7', 'synced', NULL, NULL, NULL, 0, NULL, 'RN521828301', 'FR493388', 'Asha&#039;s Farm', '8000', 2, NULL, NULL, 'Bukanda', NULL, NULL, 140, NULL, 12, 3, 1, 1, 26, NULL, 1, 0, '2024-10-06 05:13:06', '2025-10-03 00:44:40', '-6.7165485,39.2268974'),
(17, '2032f3a7-5c8c-40d4-b7e1-16dd193225b5', 'synced', NULL, NULL, NULL, 0, NULL, 'RN428516299', NULL, 'Shambani kwa Asha', '2', 1, NULL, NULL, 'Dar es Salaam', NULL, NULL, NULL, NULL, 7, 2, 1, 1, 25, NULL, 1, 0, '2024-10-06 06:17:13', '2025-10-03 00:44:40', '-6.23,39.345'),
(18, 'b8fa5d5c-4ee4-4e61-ae70-7234558cd34b', 'synced', NULL, NULL, NULL, 0, NULL, 'RN95417403', '3333555500', 'Kikwe Arusha', '2', 1, NULL, NULL, '9800', NULL, NULL, 1254, NULL, 1, 1, 1, 1, 27, NULL, 1, 0, '2024-10-06 07:40:54', '2025-10-03 00:44:40', '0.0,0.0'),
(19, 'b0a06391-2132-4210-bcd9-7e2b565e289a', 'synced', NULL, NULL, NULL, 0, NULL, 'RN977116900', NULL, 'Shamba Lingine Now', '2', 1, NULL, NULL, 'Dar es Salaam', NULL, NULL, NULL, NULL, 7, 2, 1, 1, 8, NULL, 1, 0, '2024-10-06 08:32:21', '2025-10-03 00:44:40', '-6.25,39.39'),
(20, 'e3440279-59e2-42cd-8940-6da6768d5c1e', 'synced', NULL, NULL, NULL, 0, NULL, 'RN769467091', '12345', 'Mwashinoni Farm', '600', 1, NULL, NULL, '4500', NULL, NULL, 4672, NULL, 33, 7, 1, 1, 29, NULL, 1, 0, '2024-10-08 10:37:04', '2025-10-03 00:44:40', '0.0,0.0'),
(21, '142d0d9c-749b-414c-afb6-b18ffd02347b', 'synced', NULL, NULL, NULL, 0, NULL, 'RN44333666', '1234567890', 'Malaki@', '200', 1, NULL, NULL, 'Goba, Mbezi juu', NULL, NULL, 482, NULL, 59, 1, 1, 1, 32, 32, 1, 0, '2025-09-13 07:50:59', '2025-10-03 00:44:40', '0.0,0.0'),
(24, 'test-farm-uuid-888', 'synced', NULL, NULL, NULL, 0, NULL, 'REF888', NULL, 'Updated Test Farm 888', '15', 1, NULL, NULL, 'Updated Test Address', NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, 1, 0, '2025-10-03 01:18:58', '2025-10-03 01:19:46', '-6.7924,39.2083'),
(28, 'test-farm-insert-1759489164', 'synced', NULL, NULL, NULL, 0, NULL, 'REF-INSERT-1759489164', NULL, 'New Farm 2025-10-03 10:59:24', '100', 1, NULL, NULL, 'Test Address 1759489164', NULL, NULL, 1, NULL, 1, 1, 1, NULL, 32, NULL, 1, 0, '2025-10-03 10:59:24', '2025-10-03 10:59:24', NULL),
(29, 'test-farm-update-1759489164', 'synced', NULL, NULL, NULL, 0, NULL, 'REF-UPDATE-1759489164', NULL, 'Updated Farm 2025-10-03 10:59:24', '200', 1, NULL, NULL, 'Updated Address 1759489164', NULL, NULL, 1, NULL, 1, 1, 1, NULL, 32, NULL, 1, 0, '2025-10-03 10:59:24', '2025-10-03 10:59:24', NULL),
(30, 'test-farm-conflict-1759489164', 'synced', NULL, NULL, NULL, 0, NULL, 'REF-CONFLICT-1759489164', NULL, 'Conflicting Farm 2025-10-03 10:59:24', '300', 1, NULL, NULL, 'Conflict Address 1759489164', NULL, NULL, 1, NULL, 1, 1, 1, NULL, 32, NULL, 1, 0, '2025-10-03 10:59:24', '2025-10-03 10:59:24', NULL),
(31, 'conflict-test-farm-1759489216', 'synced', NULL, NULL, NULL, 0, NULL, 'CONFLICT-TEST-1759489216', NULL, 'Conflict Test Farm', '100', 1, '1883893', '213939', 'Test Address', NULL, NULL, 1, NULL, 1, 1, 1, NULL, 32, 35, 1, 0, '2025-10-03 11:00:16', '2025-10-04 06:22:00', '1883893, 213939');

-- --------------------------------------------------------

--
-- Table structure for table `farm_events`
--

CREATE TABLE `farm_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `farm_event_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_events`
--

INSERT INTO `farm_events` (`id`, `name`, `farm_event_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Animal Sales', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Feeding', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Insemination', 4, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Calving', 4, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, 'Milking', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(6, 'Drying Off', 4, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(7, 'Weight Gain', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(8, 'Medication', 2, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(9, 'Vaccination', 2, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(10, 'Deworming', 2, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(11, 'Animal Disposal', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(12, 'Purchase', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(13, 'Animal Transfer', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `farm_event_categories`
--

CREATE TABLE `farm_event_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_event_categories`
--

INSERT INTO `farm_event_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `farm_event_requests`
--

CREATE TABLE `farm_event_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `farm_event_id` bigint(20) UNSIGNED NOT NULL,
  `farm_event_request_status_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farm_event_request_statuses`
--

CREATE TABLE `farm_event_request_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_event_request_statuses`
--

INSERT INTO `farm_event_request_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Completed', '#04724d', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Initiated', '#297373', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'On Progress', '#009fb7', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Cancelled', '#ef6461', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `farm_livestocks`
--

CREATE TABLE `farm_livestocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_livestocks`
--

INSERT INTO `farm_livestocks` (`id`, `farm_id`, `livestock_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 6, NULL, 1, '2024-09-23 06:55:18', '2024-09-23 06:55:18'),
(3, 2, 3, 6, NULL, 1, '2024-09-24 03:56:51', '2024-09-24 03:56:51'),
(4, 2, 4, 6, NULL, 1, '2024-09-24 04:00:15', '2024-09-24 04:00:15'),
(5, 4, 5, 11, NULL, 1, '2024-09-25 13:39:42', '2024-09-25 13:39:42'),
(6, 5, 6, 12, NULL, 1, '2024-09-25 14:51:45', '2024-09-25 14:51:45'),
(7, 2, 7, 6, NULL, 1, '2024-10-01 03:16:54', '2024-10-01 03:16:54'),
(10, 16, 10, 26, NULL, 1, '2024-10-06 05:59:50', '2024-10-06 05:59:50'),
(11, 18, 11, 27, NULL, 1, '2024-10-06 07:56:28', '2024-10-06 07:56:28'),
(12, 18, 12, 27, NULL, 1, '2024-10-06 08:10:37', '2024-10-06 08:10:37'),
(13, 19, 13, 8, NULL, 1, '2024-10-06 08:32:36', '2024-10-06 08:32:36'),
(14, 17, 14, 25, NULL, 1, '2024-10-07 04:19:19', '2024-10-07 04:19:19'),
(15, 17, 15, 25, NULL, 1, '2024-10-08 04:40:18', '2024-10-08 04:40:18'),
(16, 21, 16, 32, NULL, 1, '2025-09-15 10:10:32', '2025-09-15 10:10:32'),
(17, 21, 17, 32, NULL, 1, '2025-09-15 11:26:08', '2025-09-15 11:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `farm_livestock_types`
--

CREATE TABLE `farm_livestock_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED DEFAULT NULL,
  `livestock_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_livestock_types`
--

INSERT INTO `farm_livestock_types` (`id`, `farm_id`, `livestock_type_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, NULL, 1, '2024-09-21 19:21:11', '2024-09-21 19:21:11'),
(2, 2, 1, 6, NULL, 1, '2024-09-23 05:38:45', '2024-09-23 05:38:45'),
(3, 3, 1, 6, NULL, 1, '2024-09-23 12:17:10', '2024-09-23 12:17:10'),
(4, 4, 1, 11, NULL, 1, '2024-09-25 13:36:30', '2024-09-25 13:36:30'),
(5, 5, 1, 12, NULL, 1, '2024-09-25 14:41:04', '2024-09-25 14:41:04'),
(6, 6, 1, 9, NULL, 1, '2024-09-26 10:14:44', '2024-09-26 10:14:44'),
(9, 11, 1, 2, NULL, 1, '2024-10-04 05:14:05', '2024-10-04 05:14:05'),
(10, 12, 1, 2, NULL, 1, '2024-10-04 05:16:35', '2024-10-04 05:16:35'),
(11, 13, 1, 4, NULL, 1, '2024-10-04 06:51:17', '2024-10-04 06:51:17'),
(12, 14, 1, 6, NULL, 1, '2024-10-04 11:44:05', '2024-10-04 11:44:05'),
(13, 15, 1, 7, NULL, 1, '2024-10-05 09:08:34', '2024-10-05 09:08:34'),
(14, 16, 1, 26, NULL, 1, '2024-10-06 05:13:06', '2024-10-06 05:13:06'),
(15, 17, 1, 25, NULL, 1, '2024-10-06 06:17:13', '2024-10-06 06:17:13'),
(16, 18, 1, 27, NULL, 1, '2024-10-06 07:40:54', '2024-10-06 07:40:54'),
(17, 19, 1, 8, NULL, 1, '2024-10-06 08:32:21', '2024-10-06 08:32:21'),
(18, 20, 1, 29, NULL, 1, '2024-10-08 10:37:04', '2024-10-08 10:37:04'),
(19, 21, 1, 32, NULL, 1, '2025-09-13 07:50:59', '2025-09-13 07:50:59'),
(20, 22, 1, 32, NULL, 1, '2025-09-15 06:02:53', '2025-09-15 06:02:53'),
(21, 23, 1, 32, NULL, 1, '2025-09-15 06:04:05', '2025-09-15 06:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `farm_machines`
--

CREATE TABLE `farm_machines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `farm_machine_type_id` bigint(20) UNSIGNED NOT NULL,
  `registration_number` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farm_machine_types`
--

CREATE TABLE `farm_machine_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_machine_types`
--

INSERT INTO `farm_machine_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Tractors', '#fe5d9f', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Power Tillers', '#564787', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Combine Harvestors', '#e54b4b', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Processing Machines', '#0b4f6c', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, 'Cars', '#242038', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(6, 'Motorbikes', '#011638', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `farm_owners`
--

CREATE TABLE `farm_owners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `farmer_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_owners`
--

INSERT INTO `farm_owners` (`id`, `farm_id`, `farmer_id`, `assigned_by`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1, '2024-09-21 19:21:11', '2024-09-21 19:21:11'),
(2, 2, 4, 6, 1, '2024-09-23 05:38:45', '2024-09-23 05:38:45'),
(3, 3, 4, 6, 1, '2024-09-23 12:17:10', '2024-09-23 12:17:10'),
(4, 4, 30, 11, 1, '2024-09-25 13:36:30', '2024-09-25 13:36:30'),
(5, 5, 31, 12, 1, '2024-09-25 14:41:04', '2024-09-25 14:41:04'),
(6, 6, 25, 9, 1, '2024-09-26 10:14:44', '2024-09-26 10:14:44'),
(8, 11, 1, 2, 1, '2024-10-04 05:14:05', '2024-10-04 05:14:05'),
(9, 12, 35, 2, 1, '2024-10-04 05:16:35', '2024-10-04 05:16:35'),
(10, 13, 33, 4, 1, '2024-10-04 06:51:17', '2024-10-04 06:51:17'),
(11, 14, 36, 6, 1, '2024-10-04 11:44:05', '2024-10-04 11:44:05'),
(12, 15, 37, 7, 1, '2024-10-05 09:08:34', '2024-10-05 09:08:34'),
(13, 16, 39, 26, 1, '2024-10-06 05:13:06', '2024-10-06 05:13:06'),
(14, 17, 38, 25, 1, '2024-10-06 06:17:13', '2024-10-06 06:17:13'),
(15, 18, 40, 27, 1, '2024-10-06 07:40:54', '2024-10-06 07:40:54'),
(16, 19, 15, 8, 1, '2024-10-06 08:32:21', '2024-10-06 08:32:21'),
(17, 20, 42, 29, 1, '2024-10-08 10:37:04', '2024-10-08 10:37:04'),
(18, 21, 45, 32, 1, '2025-09-13 07:50:59', '2025-09-13 07:50:59'),
(19, 22, 45, 32, 1, '2025-09-15 06:02:53', '2025-09-15 06:02:53'),
(20, 23, 45, 32, 1, '2025-09-15 06:04:05', '2025-09-15 06:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `farm_statuses`
--

CREATE TABLE `farm_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_statuses`
--

INSERT INTO `farm_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Inactive', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `farm_tags`
--

CREATE TABLE `farm_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `allocation_id` bigint(20) UNSIGNED NOT NULL,
  `allocated_by` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_tags`
--

INSERT INTO `farm_tags` (`id`, `farm_id`, `tag_id`, `allocation_id`, `allocated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(2, 2, 2, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(3, 2, 3, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(4, 2, 4, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(5, 2, 5, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(6, 2, 6, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(7, 2, 7, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(8, 2, 8, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(9, 2, 9, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(10, 2, 10, 2, 1, 1, '2024-09-23 09:27:31', '2024-09-23 09:27:31'),
(11, 1, 11, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(12, 1, 12, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(13, 1, 13, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(14, 1, 14, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(15, 1, 15, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(16, 1, 16, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(17, 1, 17, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(18, 1, 18, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(19, 1, 19, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53'),
(20, 1, 20, 1, 1, 1, '2024-09-23 09:27:53', '2024-09-23 09:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `farm_users`
--

CREATE TABLE `farm_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farm_users`
--

INSERT INTO `farm_users` (`id`, `farm_id`, `user_id`, `assigned_by`, `state_id`, `role`, `created_at`, `updated_at`) VALUES
(3, 21, 38, 32, 1, NULL, '2025-09-29 22:07:12', '2025-09-29 22:07:12'),
(4, 21, 39, 32, 1, 'Feeding Specialist', '2025-09-29 22:19:38', '2025-09-29 22:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `farm_warehouses`
--

CREATE TABLE `farm_warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedings`
--

CREATE TABLE `feedings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `feeding_type_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) NOT NULL,
  `feeding_time` datetime NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `sync_status` enum('pending','synced','conflict','deleted') NOT NULL DEFAULT 'pending',
  `device_id` varchar(255) DEFAULT NULL,
  `original_created_at` timestamp NULL DEFAULT NULL,
  `is_soft_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `pending_action` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedings`
--

INSERT INTO `feedings` (`id`, `uuid`, `reference_no`, `farm_id`, `livestock_id`, `feeding_type_id`, `amount`, `remarks`, `feeding_time`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `sync_status`, `device_id`, `original_created_at`, `is_soft_deleted`, `pending_action`, `deleted_at`) VALUES
(1, '5a1899ee-4bad-4472-aeb9-f00246a80396', 'FD961890840', 2, 2, 1, NULL, 'Remarks', '2024-09-01 00:00:00', 6, NULL, 1, '2024-09-24 10:48:42', '2024-09-24 07:48:42', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-09-24 10:48:42', 0, NULL, NULL),
(2, 'f9c7214d-db7e-4dfc-a627-a150c6f2e927', 'FD873697804', 2, 2, 2, NULL, 'none', '2024-09-24 00:00:00', 6, NULL, 1, '2024-09-24 13:12:30', '2024-09-24 10:12:30', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-09-24 13:12:30', 0, NULL, NULL),
(3, '27cda54f-514a-44f7-8b92-ac7be28c1702', 'FD39239372', 18, 11, 2, NULL, 'Testing', '2024-10-06 00:00:00', 27, NULL, 1, '2024-10-06 11:26:57', '2024-10-06 08:26:57', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-06 11:26:57', 0, NULL, NULL),
(4, 'fdfd2f76-81fc-4f01-a5a2-14e486c8ca08', 'FD575337182', 18, 11, 4, NULL, 'Test 2', '2024-10-05 00:00:00', 27, NULL, 1, '2024-10-06 11:30:21', '2024-10-06 08:30:21', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-06 11:30:21', 0, NULL, NULL),
(5, '47e84c0f-2b8e-4418-bf40-6ec87b7720d0', 'FD45347876', 17, 14, 1, NULL, 'none', '2024-10-07 00:00:00', 25, NULL, 1, '2024-10-07 08:48:02', '2024-10-07 05:48:02', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-07 08:48:02', 0, NULL, NULL),
(6, 'ce8745fa-a45d-4d0f-b8e2-da1afe4ac528', 'FD648181494', 17, 15, 7, NULL, 'none', '2024-10-08 00:00:00', 25, NULL, 1, '2024-10-08 07:41:06', '2024-10-08 04:41:06', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-08 07:41:06', 0, NULL, NULL),
(7, 'ddeb17b9-1140-445f-ac62-e347b6dc74af', 'FD699783974', 17, 14, 3, NULL, 'none', '2024-10-08 00:00:00', 25, NULL, 1, '2024-10-08 08:07:56', '2024-10-08 05:07:56', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-08 08:07:56', 0, NULL, NULL),
(8, 'b433fd9a-cbae-486a-b8fb-47f7dcc44466', 'FD763305373', 17, 15, 4, NULL, 'none', '2024-10-03 00:00:00', 25, NULL, 1, '2024-10-08 08:24:08', '2024-10-08 05:24:08', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-08 08:24:08', 0, NULL, NULL),
(9, '7cf846ab-64f8-4f83-b942-af51d5349895', 'FD663804485', 17, 15, 5, NULL, 'none', '2024-10-03 00:00:00', 25, NULL, 1, '2024-10-08 08:25:24', '2024-10-08 05:25:24', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-08 08:25:24', 0, NULL, NULL),
(10, 'c6bf3aaa-a886-4d24-af6c-c94c5fab6fcb', 'FD273466594', 17, 14, 1, NULL, 'none', '2024-10-04 00:00:00', 25, NULL, 1, '2024-10-08 08:34:19', '2024-10-08 05:34:19', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-08 08:34:19', 0, NULL, NULL),
(11, '3bfe05c8-7d06-4fe9-824d-ea01a94e2b47', 'FD990186287', 17, 14, 1, NULL, 'none', '2024-10-01 00:00:00', 25, NULL, 1, '2024-10-08 08:38:51', '2024-10-08 05:38:51', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-08 08:38:51', 0, NULL, NULL),
(12, 'd0ae0b1d-b64a-4e22-8368-b72b3e9b701c', 'FD236890050', 17, 15, 1, NULL, 'none', '2024-10-01 00:00:00', 25, NULL, 1, '2024-10-08 08:38:52', '2024-10-08 05:38:52', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2024-10-08 08:38:52', 0, NULL, NULL),
(13, '8a062d62-9aa1-4182-8ae1-33776e394211', 'FD717412458', 21, 17, 2, '50', 'Amekula vzur kabisa', '2025-09-17 00:00:00', 32, NULL, 1, '2025-09-17 13:38:08', '2025-09-17 10:38:08', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-17 13:38:08', 0, NULL, NULL),
(14, '3163e352-11d6-4bba-92e4-78a88d12e8eb', 'FD910379000', 21, 16, 6, '13', 'none', '2025-09-20 00:00:00', 32, NULL, 1, '2025-09-20 14:38:33', '2025-09-20 11:38:33', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-20 14:38:33', 0, NULL, NULL),
(15, '16efb73c-ee90-4918-aa74-ec967752f2ef', 'FD430072000', 21, 17, 6, '20', 'Finish is the point', '2025-09-20 00:00:00', 32, NULL, 1, '2025-09-20 19:34:13', '2025-09-20 16:34:13', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-20 19:34:13', 0, NULL, NULL),
(16, 'c70098c0-5324-4342-8746-6ed08be85162', 'FD4247583', 21, 17, 7, '49', '50', '2025-09-20 00:00:00', 32, NULL, 1, '2025-09-20 19:43:42', '2025-09-20 16:43:42', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-20 19:43:42', 0, NULL, NULL),
(17, '553dc897-bb27-4228-9a37-490dbfcacf72', 'FD91093541', 21, 17, 7, '49', '50', '2025-09-20 00:00:00', 32, NULL, 1, '2025-09-20 19:48:41', '2025-09-20 16:48:41', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-20 19:48:41', 0, NULL, NULL),
(18, '38d06d15-d153-4795-a342-7a1ae5e6080e', 'FD229006291', 21, 17, 4, '102', 'good to go', '2025-09-20 00:00:00', 32, NULL, 1, '2025-09-20 19:50:29', '2025-09-20 16:50:29', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-20 19:50:29', 0, NULL, NULL),
(19, 'f13fe99d-45c3-428a-9811-26c4ef89660f', 'FD591353250', 21, 16, 1, '5', 'Test feeding', '2025-01-22 00:00:00', 32, NULL, 1, '2025-09-23 21:01:15', '2025-09-23 21:01:15', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-23 21:01:15', 0, NULL, NULL),
(20, '03eb678c-622e-40d1-98ef-6f8df07d1824', 'FD901653125', 21, 17, 3, '45', 'Amekula czar', '2025-09-25 00:00:00', 32, NULL, 1, '2025-09-23 22:24:28', '2025-09-23 22:24:28', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-23 22:24:28', 0, NULL, NULL),
(21, '4ad6f589-2de2-404a-99a7-a140bc1c3db6', 'FD205735500', 21, 16, 3, '45', 'Amekula czar', '2025-09-25 00:00:00', 32, NULL, 1, '2025-09-23 22:24:28', '2025-09-23 22:24:28', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-23 22:24:28', 0, NULL, NULL),
(22, '27572927-e499-4155-841d-012cdcfffdf8', 'FD158135875', 21, 16, 2, '30', 'Amekula PUmba kutoka kiwanda cha kati', '2025-09-30 00:00:00', 32, NULL, 1, '2025-09-30 07:32:14', '2025-09-30 07:32:14', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-09-30 07:32:14', 0, NULL, NULL),
(23, 'c735b0f0-f777-405e-bec3-a2eaa8eec519', 'FD920944250', 21, 17, 5, '40', 'eating properly', '2025-10-02 00:00:00', 32, NULL, 1, '2025-10-01 22:16:17', '2025-10-01 22:16:17', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-10-01 22:16:17', 0, NULL, NULL),
(24, 'ea491748-2a81-4198-8ab5-6340a718931c', 'FD27169541', 21, 16, 5, '40', 'eating properly', '2025-10-02 00:00:00', 32, NULL, 1, '2025-10-01 22:16:17', '2025-10-01 22:16:17', '2025-10-03 07:45:47', 'synced', 'legacy_device', '2025-10-01 22:16:17', 0, NULL, NULL),
(25, 'test-feeding-create-1759478940', 'FD1759478940-UPDATED', 1, 1, 1, '15.0', 'Updated test feeding log', '2025-10-03 08:09:00', 1, NULL, 1, '2025-10-03 08:09:00', '2025-10-03 08:09:00', NULL, 'pending', NULL, NULL, 0, NULL, '2025-10-03 08:09:00'),
(26, 'test-feeding-camel-1759478940', 'FD1759478940-CAMEL', 1, 1, 1, '20.0', 'CamelCase test', '2025-10-03 08:09:00', 1, NULL, 1, '2025-10-03 08:09:00', '2025-10-03 08:09:00', NULL, 'pending', NULL, NULL, 0, NULL, NULL),
(27, 'test-feeding-create-1759480889', 'FD1759480889-UPDATED', 1, 1, 1, '15.0', 'Updated test feeding log', '2025-10-03 08:41:29', 1, NULL, 1, '2025-10-03 08:41:29', '2025-10-03 08:41:29', NULL, 'pending', NULL, NULL, 0, NULL, '2025-10-03 08:41:29'),
(28, 'test-feeding-camel-1759480889', 'FD1759480889-CAMEL', 1, 1, 1, '20.0', 'CamelCase test', '2025-10-03 08:41:29', 1, NULL, 1, '2025-10-03 08:41:29', '2025-10-03 08:41:29', NULL, 'pending', NULL, NULL, 0, NULL, NULL),
(29, 'test-feeding-uuid-1759481501', 'FD1759481501-UPDATED', 1, 1, 1, '20.0', 'Updated feeding from Flutter app', '2025-10-03 08:51:41', 1, NULL, 1, '2025-10-03 08:51:41', '2025-10-03 08:51:41', NULL, 'pending', NULL, NULL, 0, NULL, '2025-10-03 08:51:41'),
(30, 'test-feeding-mixed-1759481501', 'FD1759481501-MIXED1', 1, 1, 1, '12.0', 'Mixed operation - Create', '2025-10-03 08:51:41', 1, NULL, 1, '2025-10-03 08:51:41', '2025-10-03 08:51:41', NULL, 'pending', NULL, NULL, 0, NULL, NULL),
(31, 'flutter-test-feeding-1759481606977', 'FD1759481606977', 1, 1, 1, '12.5', 'Test feeding from Flutter app', '2025-10-03 11:53:26', 1, NULL, 1, '2025-10-03 08:53:26', '2025-10-03 08:53:26', NULL, 'pending', NULL, NULL, 0, NULL, NULL),
(32, 'feeding-test-1759486490', 'FEED_TEST_1759486490', 1, 1, 1, '25.5', 'Test feeding log', '2025-10-03 10:14:50', 1, NULL, 1, '2025-10-03 10:14:50', '2025-10-03 10:14:50', NULL, 'pending', NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feeding_types`
--

CREATE TABLE `feeding_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feeding_types`
--

INSERT INTO `feeding_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Hay', '#1b9aaa', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Maize bran', '#011638', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Rice bran', '#424874', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Silages', '#2ab7ca', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, 'Pastures', '#2ab7ca', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(6, 'Concentrates', '#2ab7ca', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(7, 'Dry Roughages', '#2ab7ca', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(8, 'Roughages', '#2ab7ca', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`, `short_name`, `created_at`, `updated_at`) VALUES
(1, 'Male', 'M', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Female', 'F', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `hamlets`
--

CREATE TABLE `hamlets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `village_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_conditions`
--

CREATE TABLE `health_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `disease_id` bigint(20) UNSIGNED NOT NULL,
  `disease_date` date NOT NULL,
  `disease_history` text NOT NULL,
  `comments` text NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `health_condition_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_condition_statuses`
--

CREATE TABLE `health_condition_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_condition_statuses`
--

INSERT INTO `health_condition_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Inactive', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `health_statuses`
--

CREATE TABLE `health_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_statuses`
--

INSERT INTO `health_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Inactive', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `identity_card_types`
--

CREATE TABLE `identity_card_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `identity_card_types`
--

INSERT INTO `identity_card_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'NIDA', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'VOTERS ID', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'LICENCE', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `inseminations`
--

CREATE TABLE `inseminations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `vat_amount` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `quote_validity` int(11) NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `payment_term_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` text NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_statuses`
--

CREATE TABLE `invoice_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_statuses`
--

INSERT INTO `invoice_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Paid', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Partial Paid', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Pending', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, 'Cancelled', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, 'Expired', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

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
-- Table structure for table `legal_statuses`
--

CREATE TABLE `legal_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `legal_statuses`
--

INSERT INTO `legal_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Legal land tenure (Certificate of Occupancy or Village Land Certificate)', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Registered business entity with BRELA', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Valid business license from local authorities', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Phytosanitary certification for farms involved in exports', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `livestocks`
--

CREATE TABLE `livestocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `sync_status` varchar(255) NOT NULL DEFAULT 'synced',
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `original_created_at` timestamp NULL DEFAULT NULL,
  `is_soft_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `pending_action` varchar(255) DEFAULT NULL,
  `identification_number` varchar(255) NOT NULL,
  `dummy_tag_id` varchar(255) DEFAULT NULL,
  `barcode_tag_id` varchar(255) DEFAULT NULL,
  `rfid_tag_id` varchar(255) DEFAULT NULL,
  `livestock_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `mother_id` bigint(20) UNSIGNED DEFAULT NULL,
  `father_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `breed_id` bigint(20) UNSIGNED NOT NULL,
  `species_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `livestock_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `livestock_obtained_method_id` bigint(20) DEFAULT NULL,
  `date_first_entered_to_farm` timestamp NULL DEFAULT NULL,
  `weight_as_on_registration` varchar(255) DEFAULT NULL,
  `total_milk_produced` varchar(255) DEFAULT NULL,
  `parity_lactacting_number` varchar(255) DEFAULT NULL,
  `date_of_last_calving` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestocks`
--

INSERT INTO `livestocks` (`id`, `uuid`, `sync_status`, `last_modified_at`, `device_id`, `original_created_at`, `is_soft_deleted`, `pending_action`, `identification_number`, `dummy_tag_id`, `barcode_tag_id`, `rfid_tag_id`, `livestock_type_id`, `name`, `date_of_birth`, `mother_id`, `father_id`, `gender_id`, `breed_id`, `species_id`, `created_by`, `updated_by`, `livestock_status_id`, `created_at`, `updated_at`, `livestock_obtained_method_id`, `date_first_entered_to_farm`, `weight_as_on_registration`, `total_milk_produced`, `parity_lactacting_number`, `date_of_last_calving`) VALUES
(2, 'dcb322c7-204f-4529-9d3c-eaec4cb9dc41', 'synced', NULL, NULL, NULL, 0, NULL, 'TZ0001234834901', NULL, NULL, NULL, 1, 'Bibi one', '2022-04-15', NULL, NULL, 2, 1, 1, 6, 6, 1, '2024-09-23 06:55:18', '2025-10-03 00:45:04', 1, '2023-01-24 21:00:00', '130', NULL, NULL, NULL),
(3, '4b169eb2-9a4a-4023-a028-245fd8ab61e9', 'synced', NULL, NULL, NULL, 0, NULL, 'TZA27370014-0002', NULL, NULL, NULL, 1, 'Bingwa G', '2023-10-09', NULL, NULL, 1, 11, 1, 6, NULL, 1, '2024-09-24 03:56:51', '2025-10-03 00:45:04', 1, '2024-03-13 21:00:00', '140', NULL, NULL, NULL),
(4, '5418ba91-7fbe-4d1e-8f92-747a277d0b5c', 'synced', NULL, NULL, NULL, 0, NULL, 'TZA024I300247-0002', NULL, NULL, NULL, 1, 'Malkia 1', '2023-04-20', NULL, NULL, 2, 11, 1, 6, NULL, 1, '2024-09-24 04:00:15', '2025-10-03 00:45:04', 3, '2023-12-11 21:00:00', '158', NULL, NULL, NULL),
(5, '4d8ed40e-9d6d-4e91-9172-aa8e874546bd', 'synced', NULL, NULL, NULL, 0, NULL, 'TZA40300078-0004', NULL, NULL, NULL, 1, 'Mshua Big', '2022-07-18', NULL, NULL, 1, 3, 1, 11, NULL, 1, '2024-09-25 13:39:42', '2025-10-03 00:45:04', 4, '2023-11-27 21:00:00', '210', NULL, NULL, NULL),
(6, '8a07a8d2-4b67-4114-a0f0-4b1bb1c82823', 'synced', NULL, NULL, NULL, 0, NULL, '868031001683511', NULL, NULL, NULL, 1, 'Kifaru', '2024-01-01', NULL, NULL, 1, 1, 1, 12, NULL, 1, '2024-09-25 14:51:45', '2025-10-03 00:45:04', 1, '2023-12-31 21:00:00', '235', NULL, NULL, NULL),
(7, '7eb4bdf5-b8c3-456d-838f-27594e5475ef', 'synced', NULL, NULL, NULL, 0, NULL, '8901238910470', NULL, NULL, NULL, 1, 'Mtoto wa Bibi 1', '2023-10-16', NULL, NULL, 2, 11, 1, 6, NULL, 1, '2024-10-01 03:16:54', '2025-10-03 00:45:04', 1, '2024-05-18 21:00:00', '142', NULL, NULL, NULL),
(10, '7b78b3ea-6072-47b4-9a9d-da49d8e68a81', 'synced', NULL, NULL, NULL, 0, NULL, '3349668609031', NULL, NULL, NULL, 1, 'Cowbell 1', '2022-05-18', NULL, NULL, 2, 11, 1, 26, NULL, 1, '2024-10-06 05:59:50', '2025-10-03 00:45:04', 1, '2023-08-21 21:00:00', '210', NULL, NULL, NULL),
(11, '5d8e28a1-ef06-4f34-8332-2ba422744489', 'synced', NULL, NULL, NULL, 0, NULL, '2345-00018', NULL, NULL, NULL, 1, 'MiriBull Test', '2023-01-01', NULL, NULL, 1, 1, 1, 27, 27, 1, '2024-10-06 07:56:28', '2025-10-03 00:45:04', 1, '2023-12-31 21:00:00', '230', NULL, NULL, NULL),
(12, 'd8073d5c-e890-4949-82f8-37084580ca15', 'synced', NULL, NULL, NULL, 0, NULL, '123456788990', NULL, NULL, NULL, 1, 'MiriCow', '2022-08-31', NULL, NULL, 2, 7, 1, 27, NULL, 1, '2024-10-06 08:10:37', '2025-10-03 00:45:04', 3, '2023-12-31 21:00:00', '200', NULL, NULL, NULL),
(13, '07b975de-da18-4add-914c-5a4c8a9488da', 'synced', NULL, NULL, NULL, 0, NULL, '244ABHIIYALEO123124', NULL, NULL, NULL, 1, 'Mtoto Wa Tatu', '2022-04-15', NULL, NULL, 1, 1, 1, 8, NULL, 1, '2024-10-06 08:32:36', '2025-10-03 00:45:04', 1, '2023-01-24 21:00:00', '130', NULL, NULL, NULL),
(14, 'bd2686ef-37f5-4521-90b9-ed921eb82a69', 'synced', NULL, NULL, NULL, 0, NULL, '8991389741184', NULL, NULL, NULL, 1, 'Haisa', '2023-09-12', NULL, NULL, 2, 11, 1, 25, NULL, 1, '2024-10-07 04:19:19', '2025-10-03 00:45:04', 1, '2024-02-22 21:00:00', '210', NULL, NULL, NULL),
(15, '24c727a5-105e-4fd3-afe4-c982898df6af', 'synced', NULL, NULL, NULL, 0, NULL, 'TZA878900056-00017', NULL, NULL, NULL, 1, 'Babuu', '2023-03-10', NULL, NULL, 1, 11, 1, 25, 25, 1, '2024-10-08 04:40:18', '2025-10-03 00:45:04', 3, '2024-03-18 21:00:00', '178', NULL, NULL, NULL),
(16, 'c12fe189-eda7-4229-b3aa-fe34f0005560', 'synced', NULL, NULL, NULL, 0, NULL, '12345', NULL, NULL, NULL, 1, 'babavoss', '2025-07-01', NULL, NULL, 1, 8, 1, 32, NULL, 1, '2025-09-15 10:10:32', '2025-10-03 00:45:04', 2, '2025-09-10 21:00:00', '20', NULL, NULL, NULL),
(17, 'aaccee72-ee9d-4431-a374-32b2315e353d', 'synced', NULL, NULL, NULL, 0, NULL, '123-00021', NULL, NULL, NULL, 1, 'Dead_boy', '2010-12-20', NULL, NULL, 2, 5, 1, 32, NULL, 1, '2025-09-15 11:26:08', '2025-10-03 00:45:04', 1, '2025-05-31 21:00:00', '200', NULL, NULL, NULL),
(18, '97d8fac5-1696-4915-a308-fc53e3cf165c', 'synced', NULL, NULL, NULL, 0, NULL, '3 9 2 0 1', NULL, NULL, NULL, 1, 'end', '2023-09-16', NULL, NULL, 2, 2, 1, 32, NULL, 1, '2025-09-16 04:52:26', '2025-10-03 00:45:04', 2, '2025-09-15 21:00:00', '40', NULL, NULL, NULL),
(19, 'e552eb6f-2918-4401-aba7-810610f57f83', 'synced', NULL, NULL, NULL, 0, NULL, '111', NULL, NULL, NULL, 1, 'Gripper', '2010-09-10', NULL, NULL, 1, 7, 1, 32, NULL, 1, '2025-09-19 13:02:59', '2025-10-03 00:45:04', 3, '2018-09-17 21:00:00', '30', NULL, NULL, NULL),
(20, 'frontend-test-livestock-123', 'synced', NULL, NULL, NULL, 0, NULL, 'LIV123', NULL, NULL, NULL, 1, 'Frontend Test Livestock', '2020-01-01', NULL, NULL, 1, 1, 1, 1, NULL, 1, '2025-10-03 01:29:38', '2025-10-03 01:29:38', 1, '2019-12-31 21:00:00', '100', '0', '0', NULL),
(25, 'test-livestock-uuid-123', 'synced', NULL, NULL, NULL, 0, NULL, 'TAG001', 'TAG001', 'BC001', 'RF001', 1, 'Test Cow', '2023-01-01', NULL, NULL, 2, 1, 1, 1, NULL, 1, '2025-10-03 13:54:31', '2025-10-03 13:54:31', 1, '2022-12-31 21:00:00', '300', NULL, NULL, NULL),
(26, 'test-livestock-uuid-456', 'synced', NULL, NULL, NULL, 0, NULL, 'TAG002', 'TAG002', NULL, NULL, 1, 'Test Cow 2', '2023-01-01', NULL, NULL, 2, 1, 1, 1, NULL, 1, '2025-10-03 13:57:15', '2025-10-03 13:57:15', 1, '2022-12-31 21:00:00', '300', NULL, NULL, NULL),
(27, 'test-livestock-uuid-789', 'synced', NULL, NULL, NULL, 0, NULL, 'TAG003', 'TAG003', 'BC003', NULL, 1, 'Test Cow 3', '2023-01-01', NULL, NULL, 2, 1, 1, 1, NULL, 1, '2025-10-03 13:57:38', '2025-10-03 13:57:38', 1, '2022-12-31 21:00:00', '300', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livestock_attachments`
--

CREATE TABLE `livestock_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `attachment_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `livestock_heat_types`
--

CREATE TABLE `livestock_heat_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_heat_types`
--

INSERT INTO `livestock_heat_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Natural', '#004b23', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(2, 'Artificial', '#e76f51', '2025-09-22 08:47:04', '2025-09-22 08:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `livestock_inseminations`
--

CREATE TABLE `livestock_inseminations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` varchar(255) DEFAULT NULL,
  `serial` varchar(250) DEFAULT NULL,
  `last_heat_date` date NOT NULL,
  `current_heat_type_id` bigint(20) UNSIGNED NOT NULL,
  `insemination_date` date NOT NULL,
  `insemination_service_id` bigint(20) UNSIGNED NOT NULL,
  `insemination_semen_straw_type_id` bigint(20) UNSIGNED NOT NULL,
  `bull_code` varchar(255) NOT NULL,
  `bull_breed` varchar(255) NOT NULL,
  `semen_production_date` date NOT NULL,
  `production_country` varchar(255) NOT NULL,
  `semen_batch_number` varchar(255) NOT NULL,
  `international_id` varchar(255) NOT NULL,
  `ai_code` varchar(255) NOT NULL,
  `manufacturer_name` varchar(255) NOT NULL,
  `semen_supplier` varchar(255) NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_inseminations`
--

INSERT INTO `livestock_inseminations` (`id`, `uuid`, `reference_no`, `livestock_id`, `farm_id`, `serial`, `last_heat_date`, `current_heat_type_id`, `insemination_date`, `insemination_service_id`, `insemination_semen_straw_type_id`, `bull_code`, `bull_breed`, `semen_production_date`, `production_country`, `semen_batch_number`, `international_id`, `ai_code`, `manufacturer_name`, `semen_supplier`, `state_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'bce01df6-a03e-11f0-a586-a2a4c4270ce7', 'LI370965522', 2, NULL, 'TZ0001234834901', '2024-07-01', 1, '2024-01-01', 1, 1, 'BU-12E4R', 'Breed', '2024-02-05', '2024-02-05', 'SE-09UJH65-09654', 'KE', '1234', 'Kenya Breeds', 'Kenya Breeds', 1, 6, NULL, '2024-09-25 07:05:06', '2024-09-25 04:05:06', NULL),
(2, 'bce02364-a03e-11f0-a586-a2a4c4270ce7', 'LI150988092', 4, NULL, 'TZA024I300247-0002', '2024-09-25', 1, '2024-09-25', 1, 2, '1', '7', '2024-09-25', '2024-09-25', '112', 'KE', '101', 'K Farms', 'K Farms', 1, 6, NULL, '2024-09-25 07:12:16', '2024-09-25 04:12:16', NULL),
(3, 'bce023c8-a03e-11f0-a586-a2a4c4270ce7', 'LI159123349', 14, NULL, '8991389741184', '2024-07-01', 1, '2024-01-01', 1, 1, 'BU-12E4R', 'Breed', '2024-02-05', '2024-02-05', 'SE-09UJH65-09654', 'KE', '1234', 'Kenya Breeds', 'Kenya Breeds', 1, 25, NULL, '2024-10-07 09:43:20', '2024-10-07 06:43:20', NULL),
(4, 'bce0240e-a03e-11f0-a586-a2a4c4270ce7', 'LI212539820', 14, NULL, '8991389741184', '2024-10-01', 1, '2024-10-02', 1, 0, '1', '3', '2024-10-07', '2024-10-07', '0', '0', '0', '0', '0', 1, 25, NULL, '2024-10-07 09:44:30', '2024-10-07 06:44:30', NULL),
(5, 'bce0244a-a03e-11f0-a586-a2a4c4270ce7', 'LI835525083', 17, NULL, '123-00021', '2025-09-21', 1, '2025-09-21', 1, 3, '1', '4', '2025-09-21', '2025-09-21', 'BATCH-29959', '254', '1', 'Alibaba', 'Head Ache', 1, 32, NULL, '2025-09-21 00:26:45', '2025-09-20 21:26:45', NULL),
(6, 'bce0247c-a03e-11f0-a586-a2a4c4270ce7', 'LI832495583', 17, NULL, '123-00021', '2025-01-15', 1, '2025-01-16', 1, 1, '12345', '1', '2025-01-10', '2025-01-10', 'BATCH001', 'TZ', 'AI001', 'TestManufacturer', 'TestSupplier', 1, 1, NULL, '2025-09-21 09:13:16', '2025-09-21 06:13:16', NULL),
(7, 'bce024ae-a03e-11f0-a586-a2a4c4270ce7', 'LI619431333', 17, NULL, '123-00021', '2025-09-21', 2, '2025-09-21', 1, 2, '32', '5', '2025-09-21', '2025-09-21', 'BATCH-120038', '253', '125', 'SFI', 'BBN', 1, 32, NULL, '2025-09-21 09:29:12', '2025-09-21 06:29:12', NULL),
(8, 'bce024e0-a03e-11f0-a586-a2a4c4270ce7', 'LI533274833', 17, NULL, '123-00021', '2025-09-22', 1, '2025-09-22', 1, 2, '101', '5', '2016-09-01', '2016-09-01', '2010', '255', '103', 'NFS', 'UYTT', 1, 32, NULL, '2025-09-22 11:50:03', '2025-09-22 08:50:03', NULL),
(9, 'bce0251c-a03e-11f0-a586-a2a4c4270ce7', 'LI390264750', 17, NULL, '123-00021', '2025-09-23', 1, '2025-09-23', 2, 1, '1', '4', '2016-09-15', '2016-09-15', '1001', '203', '0130', 'DodiXy', 'Dodi', 1, 32, NULL, '2025-09-23 15:04:05', '2025-09-23 15:04:05', NULL),
(10, 'insemination-uuid-001', 'INS_REF_001', 1, NULL, 'INS001', '2024-01-15', 1, '2024-01-16', 1, 1, 'BULL001', 'Holstein', '2023-12-01', 'US', 'BATCH001', 'INT001', 'AI001', 'Semen Co', 'Supplier Co', 1, 1, NULL, '2025-10-03 09:56:28', '2025-10-03 09:56:28', NULL),
(11, 'insemination-uuid-002', 'INS_REF_001', 1, NULL, 'INS001', '2024-01-15', 1, '2024-01-16', 1, 1, 'BULL001', 'Holstein', '2023-12-01', 'US', 'BATCH001', 'INT001', 'AI001', 'Semen Co', 'Supplier Co', 1, 1, NULL, '2025-10-03 09:58:34', '2025-10-03 09:58:34', NULL),
(12, 'insemination-uuid-003', 'INS_REF_001', 1, NULL, 'INS001', '2024-01-15', 1, '2024-01-16', 1, 1, 'BULL001', 'Holstein', '2023-12-01', 'US', 'BATCH001', 'INT001', 'AI001', 'Semen Co', 'Supplier Co', 1, 1, NULL, '2025-10-03 09:59:03', '2025-10-03 09:59:03', NULL),
(13, 'insemination-uuid-004', 'INS_REF_001', 1, NULL, 'INS001', '2024-01-15', 1, '2024-01-16', 1, 1, 'BULL001', 'Holstein', '2023-12-01', 'US', 'BATCH001', 'INT001', 'AI001', 'Semen Co', 'Supplier Co', 1, 1, NULL, '2025-10-03 09:59:58', '2025-10-03 09:59:58', NULL),
(14, 'insemination-uuid-005', 'INS_REF_001', 1, NULL, 'INS001', '2024-01-15', 1, '2024-01-16', 1, 1, 'BULL001', 'Holstein', '2023-12-01', 'US', 'BATCH001', 'INT001', 'AI001', 'Semen Co', 'Supplier Co', 1, 1, NULL, '2025-10-03 10:00:46', '2025-10-03 10:00:46', NULL),
(15, 'insemination-fresh-1759485785', 'INS_FRESH_1759485785', 1, NULL, 'INS1759485785', '2024-01-15', 1, '2024-01-16', 1, 1, 'BULL001', 'Holstein', '2023-12-01', 'US', 'BATCH001', 'INT001', 'AI001', 'Semen Co', 'Supplier Co', 1, 1, NULL, '2025-10-03 10:03:05', '2025-10-03 10:03:05', NULL),
(16, 'insemination-fresh-1759485834', 'INS_FRESH_1759485834', 1, NULL, 'INS1759485834', '2024-01-15', 1, '2024-01-16', 1, 1, 'BULL001', 'Holstein', '2023-12-01', 'US', 'BATCH001', 'INT001', 'AI001', 'Semen Co', 'Supplier Co', 1, 1, NULL, '2025-10-03 10:03:54', '2025-10-03 10:03:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livestock_insemination_semen_straw_types`
--

CREATE TABLE `livestock_insemination_semen_straw_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_insemination_semen_straw_types`
--

INSERT INTO `livestock_insemination_semen_straw_types` (`id`, `name`, `category`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Conventional', 'AI', '#004b23', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(2, 'Sexed Semen Female', 'AI', '#004b23', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(3, 'Sexed Semen Male', 'AI', '#004b23', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(4, 'Embryo Male', 'EMBRYO', '#004b23', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(5, 'Embryo Female', 'EMBRYO', '#004b23', '2025-09-22 08:47:04', '2025-09-22 08:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `livestock_insemination_services`
--

CREATE TABLE `livestock_insemination_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_insemination_services`
--

INSERT INTO `livestock_insemination_services` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Natural', '#004b23', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(2, 'Artificial Insemination', '#e76f51', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(3, 'Embryo Transfer', '#e76f51', '2025-09-22 08:47:04', '2025-09-22 08:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `livestock_obtained_methods`
--

CREATE TABLE `livestock_obtained_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_obtained_methods`
--

INSERT INTO `livestock_obtained_methods` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Purchased', '#4f5d75', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'Born on farm', '#ff5d73', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(3, 'Gift', '#3c6e71', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4, 'Donation', '#eb5e28', '2024-09-21 20:19:57', '2024-09-21 20:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `livestock_stages`
--

CREATE TABLE `livestock_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `stage_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_stages`
--

INSERT INTO `livestock_stages` (`id`, `livestock_id`, `stage_id`, `start_date`, `end_date`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(2, 2, 2, '2024-09-23 09:55:18', NULL, 6, NULL, 1, '2024-09-23 06:55:18', '2024-09-23 06:55:18'),
(3, 3, 5, '2024-09-24 06:56:51', NULL, 6, NULL, 1, '2024-09-24 03:56:51', '2024-09-24 03:56:51'),
(4, 4, 5, '2024-09-24 07:00:15', NULL, 6, NULL, 1, '2024-09-24 04:00:15', '2024-09-24 04:00:15'),
(5, 5, 12, '2024-09-25 16:39:42', NULL, 11, NULL, 1, '2024-09-25 13:39:42', '2024-09-25 13:39:42'),
(6, 6, 1, '2024-09-25 17:51:45', NULL, 12, NULL, 1, '2024-09-25 14:51:45', '2024-09-25 14:51:45'),
(7, 7, 5, '2024-10-01 06:16:54', NULL, 6, NULL, 1, '2024-10-01 03:16:54', '2024-10-01 03:16:54'),
(10, 10, 12, '2024-10-06 08:59:50', NULL, 26, NULL, 1, '2024-10-06 05:59:50', '2024-10-06 05:59:50'),
(11, 11, 12, '2024-10-06 10:56:28', NULL, 27, NULL, 1, '2024-10-06 07:56:28', '2024-10-06 07:56:28'),
(12, 12, 11, '2024-10-06 11:10:37', NULL, 27, NULL, 1, '2024-10-06 08:10:37', '2024-10-06 08:10:37'),
(13, 13, 2, '2024-10-06 11:32:36', NULL, 8, NULL, 1, '2024-10-06 08:32:36', '2024-10-06 08:32:36'),
(14, 14, 5, '2024-10-07 07:19:19', NULL, 25, NULL, 1, '2024-10-07 04:19:19', '2024-10-07 04:19:19'),
(15, 15, 5, '2024-10-08 07:40:18', NULL, 25, NULL, 1, '2024-10-08 04:40:18', '2024-10-08 04:40:18'),
(16, 16, 2, '2025-09-15 13:10:32', NULL, 32, NULL, 1, '2025-09-15 10:10:32', '2025-09-15 10:10:32'),
(17, 17, 5, '2025-09-15 14:26:08', NULL, 32, NULL, 1, '2025-09-15 11:26:08', '2025-09-15 11:26:08'),
(18, 18, 2, '2025-09-16 07:52:26', NULL, 32, NULL, 1, '2025-09-16 04:52:26', '2025-09-16 04:52:26'),
(19, 19, 2, '2025-09-19 16:02:59', NULL, 32, NULL, 1, '2025-09-19 13:02:59', '2025-09-19 13:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `livestock_statuses`
--

CREATE TABLE `livestock_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_statuses`
--

INSERT INTO `livestock_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Inactive', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, 'Sold', '#d90429', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, 'Accepted', '#3a86ff', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(6, 'In Transit', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(7, 'Delivered', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(8, 'Received', '#540b0e', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `livestock_tags`
--

CREATE TABLE `livestock_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_tags`
--

INSERT INTO `livestock_tags` (`id`, `tag_id`, `livestock_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 6, NULL, 1, '2024-09-23 06:55:18', '2024-09-23 06:55:18'),
(3, 1, 3, 6, NULL, 1, '2024-09-24 03:56:51', '2024-09-24 03:56:51'),
(4, 1, 4, 6, NULL, 1, '2024-09-24 04:00:15', '2024-09-24 04:00:15'),
(5, 1, 5, 11, NULL, 1, '2024-09-25 13:39:42', '2024-09-25 13:39:42'),
(6, 1, 6, 12, NULL, 1, '2024-09-25 14:51:45', '2024-09-25 14:51:45'),
(7, 1, 7, 6, NULL, 1, '2024-10-01 03:16:54', '2024-10-01 03:16:54'),
(10, 1, 10, 26, NULL, 1, '2024-10-06 05:59:50', '2024-10-06 05:59:50'),
(11, 1, 11, 27, NULL, 1, '2024-10-06 07:56:28', '2024-10-06 07:56:28'),
(12, 1, 12, 27, NULL, 1, '2024-10-06 08:10:37', '2024-10-06 08:10:37'),
(13, 1, 13, 8, NULL, 1, '2024-10-06 08:32:36', '2024-10-06 08:32:36'),
(14, 1, 14, 25, NULL, 1, '2024-10-07 04:19:19', '2024-10-07 04:19:19'),
(15, 1, 15, 25, NULL, 1, '2024-10-08 04:40:18', '2024-10-08 04:40:18'),
(16, 1, 16, 32, NULL, 1, '2025-09-15 10:10:32', '2025-09-15 10:10:32'),
(17, 1, 17, 32, NULL, 1, '2025-09-15 11:26:08', '2025-09-15 11:26:08'),
(18, 1, 18, 32, NULL, 1, '2025-09-16 04:52:26', '2025-09-16 04:52:26'),
(19, 1, 19, 32, NULL, 1, '2025-09-19 13:02:59', '2025-09-19 13:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `livestock_types`
--

CREATE TABLE `livestock_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livestock_types`
--

INSERT INTO `livestock_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Cattle', '#4f5d75', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Swine', '#ff5d73', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Goat', '#3c6e71', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, 'Sheep or Lamb', '#eb5e28', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, 'Horse', '#004e98', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(6, 'Chicken', '#022b3a', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(7, 'Turkey', '#00cecb', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(8, 'Duck', '#339989', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(9, 'Other', '#832161', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `quantity` text NOT NULL,
  `withdrawal_period` text NOT NULL,
  `remarks` text NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `disease_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_unit_id` bigint(20) UNSIGNED NOT NULL,
  `withdrawal_period_unit_id` bigint(20) UNSIGNED NOT NULL,
  `medication_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`id`, `uuid`, `quantity`, `withdrawal_period`, `remarks`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `deleted_at`, `farm_id`, `disease_id`, `livestock_id`, `medicine_id`, `quantity_unit_id`, `withdrawal_period_unit_id`, `medication_date`) VALUES
(1, NULL, '10', '12', 'Remarks', 6, NULL, 1, '2024-09-25 06:14:17', '2024-09-25 03:14:17', NULL, NULL, 2, 1, 2, 1, 1, 1, '2024-05-08'),
(2, NULL, '10', '4', 'none', 6, NULL, 1, '2024-09-25 06:34:21', '2024-09-25 03:34:21', NULL, NULL, 2, 2, 4, 4, 1, 2, '2024-09-25'),
(3, NULL, '10', '4', 'Testing', 27, NULL, 1, '2024-10-06 11:35:02', '2024-10-06 08:35:02', NULL, NULL, 18, 5, 11, 3, 1, 1, '2024-10-06'),
(4, NULL, '12', '4', 'none', 25, NULL, 1, '2024-10-07 11:05:53', '2024-10-07 08:05:53', NULL, NULL, 17, 1, 14, 2, 1, 1, '2024-10-07'),
(5, NULL, '4', '2', 'none', 25, NULL, 1, '2024-10-08 09:17:20', '2024-10-08 06:17:20', NULL, NULL, 17, 2, 15, 5, 1, 2, '2024-10-06'),
(6, NULL, '12', '5', 'none', 25, NULL, 1, '2024-10-08 10:50:57', '2024-10-08 07:50:57', NULL, NULL, 17, 4, 14, 3, 1, 1, '2024-10-05'),
(7, NULL, '12', '5', 'none', 25, NULL, 1, '2024-10-08 10:50:58', '2024-10-08 07:50:58', NULL, NULL, 17, 4, 15, 3, 1, 1, '2024-10-05'),
(8, NULL, '20', '4', 'well well', 32, NULL, 1, '2025-09-22 13:32:41', '2025-09-22 10:32:41', NULL, NULL, 21, 1, 17, 2, 1, 2, '2025-09-22'),
(9, NULL, '10', '7', 'Test medication', 32, NULL, 1, '2025-09-23 21:04:46', '2025-09-23 21:04:46', NULL, NULL, 21, 1, 16, 1, 1, 1, '2025-01-22');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `medicine_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `medicine_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Albendazole', 1, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'Fenbendazole', 1, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(3, 'Amoxicillin', 2, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4, 'Tetracycline', 2, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(5, 'Metronidazole', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_quantity_units`
--

CREATE TABLE `medicine_quantity_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicine_quantity_units`
--

INSERT INTO `medicine_quantity_units` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'milligrams', '#004b23', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'grams', '#fb8500', '2024-09-21 20:19:57', '2024-09-21 20:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_types`
--

CREATE TABLE `medicine_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `ordering` varchar(255) NOT NULL,
  `menu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '0000_03_22_191942_create_status_table', 1),
(2, '0000_04_23_052931_create_states_table', 1),
(3, '0000_04_23_055340_create_payment_terms_table', 1),
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000001_create_cache_table', 1),
(6, '0001_01_01_000002_create_jobs_table', 1),
(7, '2024_04_22_041043_create_permission_tables', 1),
(8, '2024_04_22_192013_create_menus_table', 1),
(9, '2024_04_22_192027_create_permission_menus_table', 1),
(10, '2024_04_22_192043_create_system_logs_table', 1),
(11, '2024_04_22_192056_create_system_users_table', 1),
(12, '2024_05_09_162446_create_livestock_types_table', 1),
(13, '2024_05_10_082606_create_milking_statuses_table', 1),
(14, '2024_05_10_082908_create_certificate_types_table', 1),
(15, '2024_05_10_090432_create_legal_statuses_table', 1),
(16, '2024_05_10_094324_create_diseases_table', 1),
(17, '2024_05_10_100444_create_health_statuses_table', 1),
(18, '2024_05_10_101821_create_farmer_types_table', 1),
(19, '2024_05_10_102319_create_tag_statuses_table', 1),
(20, '2024_05_10_103036_create_usage_statuses_table', 1),
(21, '2024_05_10_103229_create_payment_statuses_table', 1),
(22, '2024_05_10_103609_create_tag_allocation_statuses_table', 1),
(23, '2024_05_10_112912_create_tagging_statuses_table', 1),
(24, '2024_05_10_131404_create_milking_sessions_table', 1),
(25, '2024_05_10_134323_create_pregnancy_diagnosis_test_results_table', 1),
(26, '2024_05_10_145114_create_animal_disposal_types_table', 1),
(27, '2024_05_10_150031_create_size_units_table', 1),
(28, '2024_05_10_151100_create_farm_statuses_table', 1),
(29, '2024_05_10_151212_create_farmer_statuses_table', 1),
(30, '2024_05_10_151648_create_weight_units_table', 1),
(31, '2024_05_10_151800_create_identity_card_types_table', 1),
(32, '2024_05_10_151933_create_school_levels_table', 1),
(33, '2024_05_10_152703_create_breeds_table', 1),
(34, '2024_05_10_152941_create_species_table', 1),
(35, '2024_05_10_154038_create_livestock_statuses_table', 1),
(36, '2024_05_10_154223_create_tag_types_table', 1),
(37, '2024_05_10_155358_create_countries_table', 1),
(38, '2024_05_10_155415_create_regions_table', 1),
(39, '2024_05_10_155429_create_districts_table', 1),
(40, '2024_05_10_155611_create_divisions_table', 1),
(41, '2024_05_10_155630_create_wards_table', 1),
(42, '2024_05_10_155653_create_streets_table', 1),
(43, '2024_05_10_155701_create_villages_table', 1),
(44, '2024_05_10_155733_create_hamlets_table', 1),
(45, '2024_05_10_160133_create_genders_table', 1),
(46, '2024_05_10_160245_create_farmers_table', 1),
(47, '2024_05_10_160744_create_farms_table', 1),
(48, '2024_05_10_160857_create_farmer_farms_table', 1),
(49, '2024_05_10_162514_create_livestocks_table', 1),
(50, '2024_05_10_163338_create_currencies_table', 1),
(51, '2024_05_10_204649_create_farm_livestocks_table', 1),
(52, '2024_05_10_204911_create_vaccination_statuses_table', 1),
(53, '2024_05_10_210138_create_stages_table', 1),
(54, '2024_05_10_210314_create_livestock_stages_table', 1),
(55, '2024_05_11_100700_create_slaughter_houses_table', 1),
(56, '2024_05_12_084458_create_health_condition_statuses_table', 1),
(57, '2024_05_12_091301_create_certificate_statuses_table', 1),
(58, '2024_05_12_091442_create_vets_table', 1),
(59, '2024_05_12_091636_create_invoice_statuses_table', 1),
(60, '2024_05_12_091645_create_invoices_table', 1),
(61, '2024_05_12_091816_create_receipts_table', 1),
(62, '2024_05_12_091937_create_certificates_table', 1),
(63, '2024_05_12_094238_create_health_conditions_table', 1),
(64, '2024_05_12_095012_create_medications_table', 1),
(65, '2024_05_12_101435_create_tag_batches_table', 1),
(66, '2024_05_12_102130_create_tags_table', 1),
(67, '2024_05_12_102822_create_tag_allocations_table', 1),
(68, '2024_05_12_182707_create_extension_officers_table', 1),
(69, '2024_05_12_204801_create_vaccines_table', 1),
(70, '2024_05_12_204844_create_vaccinations_table', 1),
(71, '2024_05_12_205323_create_vaccination_doses_table', 1),
(72, '2024_05_13_212558_create_taggings_table', 1),
(73, '2024_05_14_075300_create_vet_farms_table', 1),
(74, '2024_05_15_092825_create_scan_logs_table', 1),
(75, '2024_05_15_105621_create_farm_users_table', 1),
(76, '2024_05_15_151402_create_farm_owners_table', 1),
(77, '2024_05_15_153810_create_attachment_types_table', 1),
(78, '2024_05_15_153817_create_attachments_table', 1),
(79, '2024_05_15_153836_create_farmer_attachments_table', 1),
(80, '2024_05_15_153847_create_livestock_attachments_table', 1),
(81, '2024_05_15_153858_create_vet_attachments_table', 1),
(82, '2024_05_15_203705_create_livestocks_tags_table', 1),
(83, '2024_05_16_091120_create_farm_machine_types_table', 1),
(84, '2024_05_16_145718_create_animal_sale_reasons_table', 1),
(85, '2024_05_17_082557_create_milkings_table', 1),
(86, '2024_05_17_082744_create_extension_officer_farms_table', 1),
(87, '2024_05_17_082830_create_farm_tags_table', 1),
(88, '2024_05_17_083448_create_extension_officer_attachments_table', 1),
(89, '2024_05_17_083513_create_farm_event_categories_table', 1),
(90, '2024_05_17_083520_create_farm_events_table', 1),
(91, '2024_05_17_090701_create_farm_machines_table', 1),
(92, '2024_05_17_095601_create_feeding_types_table', 1),
(93, '2024_05_17_101638_create_farm_event_request_statuses_table', 1),
(94, '2024_05_17_101650_create_farm_event_requests_table', 1),
(95, '2024_05_17_120059_create_farm_warehouses_table', 1),
(96, '2024_05_17_132237_create_feedings_table', 1),
(97, '2024_05_17_132253_create_inseminations_table', 1),
(98, '2024_05_17_132315_create_pregnancy_diagnosis_table', 1),
(99, '2024_05_17_132329_create_calvings_table', 1),
(100, '2024_05_17_132354_create_drying_offs_table', 1),
(101, '2024_05_17_132415_create_weight_gains_table', 1),
(102, '2024_05_17_140652_create_calfs_table', 1),
(103, '2024_05_17_140907_create_calf_condition_types_table', 1),
(104, '2024_05_17_141150_create_calf_conditions_table', 1),
(105, '2024_05_17_141531_create_calf_problem_types_table', 1),
(106, '2024_05_17_141844_create_calf_problems_table', 1),
(107, '2024_05_17_141953_create_calf_reproductive_problem_types_table', 1),
(108, '2024_05_17_143034_create_calf_reproductive_problems_table', 1),
(109, '2024_05_17_144559_create_dewormings_table', 1),
(110, '2024_05_17_145024_create_animal_disposals_table', 1),
(111, '2024_05_17_145609_create_animal_sales_table', 1),
(112, '2024_05_17_150238_create_animal_sale_details_table', 1),
(113, '2024_05_17_205620_create_farm_livestock_types_table', 1),
(114, '2024_07_08_213211_create_milking_methods_table', 1),
(115, '2024_07_08_213251_create_milking_units_table', 1),
(116, '2024_07_08_223214_add_milking_method_to_milkings', 1),
(117, '2024_07_08_223318_add_milking_units_to_milkings', 1),
(118, '2024_07_10_013431_add_column_to_farm_event_requests', 1),
(119, '2024_07_25_115434_create_medicine_types_table', 1),
(120, '2024_07_25_115445_create_medicines_table', 1),
(121, '2024_07_25_115522_create_administration_routes_table', 1),
(122, '2024_07_25_115921_create_withdraw_period_units_table', 1),
(123, '2024_07_25_122724_rename_old_column_in_milkings_table', 1),
(124, '2024_07_25_154012_update_medications_table', 1),
(125, '2024_07_25_160247_create_medicine_quantity_units_table', 1),
(126, '2024_08_01_132543_create_calving_types_table', 1),
(127, '2024_08_01_150522_add_column_to_calving_table', 1),
(128, '2024_08_19_113453_create_personal_access_tokens_table', 1),
(129, '2024_08_19_133558_create_authorization_tokens_table', 1),
(130, '2024_08_21_043645_create_livestock_obtained_methods_table', 1),
(131, '2024_08_21_053640_add_columns_to_livestocks_table', 1),
(132, '2024_09_03_091344_add_column_to_vaccine_table', 1),
(133, '2024_09_03_094123_create_vaccine_statuses_table', 1),
(134, '2024_09_03_101513_create_vaccine_types_table', 1),
(135, '2024_09_03_102649_add_columns_on_vaccine_types_table', 1),
(136, '2024_09_03_103057_add_vaccine_type_columns_on_vaccines_table', 1),
(137, '2024_09_03_105436_create_unit_of_measurements_table', 1),
(138, '2024_09_03_115143_create_vaccine_batches_table', 1),
(139, '2024_09_03_123123_create_vaccine_officer_batches_table', 1),
(140, '2024_09_09_043622_create_vaccine_diseases_table', 1),
(141, '2024_09_11_102058_create_vaccine_schedules_table', 1),
(142, '2024_09_11_152605_add_vaccine_schedule_columns_on_vaccines_table', 1),
(143, '2024_09_11_161715_create_vaccine_dosage_constraints_table', 1),
(144, '2024_09_11_164403_create_vaccine_dosages_table', 1),
(145, '2024_09_11_175100_create_animal_vaccine_dosages_table', 1),
(146, '2024_09_17_134849_create_officer_types_table', 1),
(147, '2024_09_20_102649_add_modify_columns_on_farm_table', 1),
(148, '2024_09_20_102649_add_modify_columns_on_vaccination_doses_table', 1),
(149, '2024_09_20_102649_add_modify_columns_on_vaccinations_table', 1),
(150, '2024_09_20_102649_create_livestock_inseminations_table', 1),
(151, '2024_09_20_153109_create_livestock_heat_types_table', 1),
(152, '2024_09_20_153238_create_livestock_insemination_services_table', 1),
(153, '2024_09_20_165208_create_livestock_insemination_semen_straw_types_table', 1),
(154, '2024_09_21_221410_new_update_medications_table', 1),
(155, '2024_09_21_223000_update_dewormings_table', 1),
(156, '2025_09_19_121128_update_vaccines_table_add_column', 2),
(157, '2025_09_19_140426_update_vaccinations_remove_column', 3),
(158, '2025_09_19_131128_update_vaccines_table_add_column', 4),
(159, '2025_09_20_145042_add_amount_to_feedings_table', 5),
(160, '2025_09_20_161544_add_acidity_to_milkings_table', 6),
(161, '2025_09_21_143203_add_missing_columns_to_calvings_table', 7),
(162, '2025_09_22_134900_add_serial_to_drying_offs_table', 8),
(163, '2025_09_22_143600_add_serial_to_pregnancy_and_insemination_tables', 9),
(164, '2025_09_29_add_sync_fields_to_event_tables', 10),
(165, '2025_09_29_201250_update-farm-users-table-add-column', 11),
(166, '2025_01_15_000000_add_sync_fields_to_farms_table', 12),
(167, '2025_01_15_000001_add_sync_fields_to_livestock_table', 13),
(169, '2025_10_03_104346_add_sync_fields_to_feedings_table', 14),
(170, '2025_10_03_125036_add_sync_fields_to_livestock_inseminations_table', 15),
(171, '2025_01_15_000002_remove_sync_columns_keep_uuid_only', 16),
(172, '2025_10_03_041549_add_sync_fields_to_farms_and_livestocks_tables', 17),
(173, '2025_10_03_162559_add_uuid_to_vaccines_table', 18),
(174, '2025_10_03_165303_add_tag_fields_to_livestocks_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `milkings`
--

CREATE TABLE `milkings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `milking_session_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `lactometer_reading` double NOT NULL,
  `solid` varchar(255) NOT NULL,
  `solid_non_fat` varchar(255) NOT NULL,
  `protein` varchar(255) NOT NULL,
  `corrected_lactometer_reading` varchar(255) NOT NULL,
  `total_solids` varchar(255) NOT NULL,
  `colony_forming_units` varchar(255) NOT NULL,
  `acidity` varchar(10) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `milking_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `milking_method_id` bigint(20) UNSIGNED NOT NULL,
  `milking_unit_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milkings`
--

INSERT INTO `milkings` (`id`, `uuid`, `reference_no`, `livestock_id`, `milking_session_id`, `amount`, `lactometer_reading`, `solid`, `solid_non_fat`, `protein`, `corrected_lactometer_reading`, `total_solids`, `colony_forming_units`, `acidity`, `created_by`, `updated_by`, `milking_status_id`, `created_at`, `updated_at`, `last_modified_at`, `deleted_at`, `milking_method_id`, `milking_unit_id`) VALUES
(1, NULL, 'ML549255664', 2, 1, 15, 1.05, '15', '10', '3.6', '30', '25', '8', NULL, 6, NULL, 1, '2024-09-24 13:13:57', '2024-09-24 13:13:57', NULL, NULL, 1, 1),
(2, NULL, 'ML568139095', 4, 1, 11, 0, '0', '0', '0', '0', '0', '0', NULL, 6, NULL, 1, '2024-09-24 13:41:30', '2024-09-24 13:41:30', NULL, NULL, 1, 1),
(3, NULL, 'ML540356036', 12, 1, 10, 30, '60', '6', '23', '32', '66', '35', NULL, 27, NULL, 1, '2024-10-06 09:20:54', '2024-10-06 09:20:54', NULL, NULL, 1, 1),
(4, NULL, 'ML169406982', 12, 2, 8, 30, '60', '6', '23', '32', '66', '35', NULL, 27, NULL, 1, '2024-10-06 09:24:01', '2024-10-06 09:24:01', NULL, NULL, 1, 1),
(5, NULL, 'ML609129950', 14, 1, 12, 0, '0', '0', '0', '0', '0', '0', NULL, 25, NULL, 1, '2024-10-07 06:03:01', '2024-10-07 06:03:01', NULL, NULL, 1, 1),
(6, NULL, 'ML203115114', 14, 1, 10, 0, '0', '0', '0', '0', '0', '0', NULL, 25, NULL, 1, '2024-10-08 02:30:10', '2024-10-08 02:30:10', NULL, NULL, 2, 2),
(7, NULL, 'ML621660708', 17, 3, 10, 20, '10', '30', '20', '10', '40', '10', '10', 32, NULL, 1, '2025-09-20 12:01:35', '2025-09-20 12:01:35', NULL, NULL, 1, 1),
(8, NULL, 'ML804669625', 17, 3, 30, 10, '21', '10', '10', '20', '31', '30', '30', 32, NULL, 1, '2025-09-20 12:24:15', '2025-09-20 12:24:15', NULL, NULL, 1, 1),
(9, NULL, 'ML804025541', 17, 1, 44, 10, '20', '10', '34', '29', '30', '21', '114', 32, NULL, 1, '2025-09-20 16:52:30', '2025-09-20 16:52:30', NULL, NULL, 1, 1),
(10, NULL, 'ML524925583', 16, 1, 10, 1.03, '8.5', '3.2', '3.1', '1.03', '11.7', '100', '6.8', 32, NULL, 1, '2025-09-23 21:01:37', '2025-09-23 21:01:37', NULL, NULL, 1, 1),
(11, 'milking-uuid-002', 'MILK_REF_001', 1, 1, 15.5, 1.03, '8.5', '8.0', '3.2', '1.030', '12.5', '1000', '6.5', 1, NULL, 1, '2025-10-03 09:58:34', '2025-10-03 09:58:34', NULL, NULL, 1, 1),
(14, 'milking-uuid-003', 'MILK_REF_003', 1, 1, 15.5, 1.03, '8.5', '8.0', '3.2', '1.030', '12.5', '1000', '6.5', 1, NULL, 1, '2025-10-03 09:59:43', '2025-10-03 09:59:43', NULL, NULL, 1, 1),
(20, 'milking-fresh-1759485785', 'MILK_FRESH_1759485785', 1, 1, 15.5, 1.03, '8.5', '8.0', '3.2', '1.030', '12.5', '1000', '6.5', 1, NULL, 1, '2025-10-03 10:03:05', '2025-10-03 10:03:05', NULL, NULL, 1, 1),
(21, 'milking-fresh-1759485834', 'MILK_FRESH_1759485834', 1, 1, 15.5, 1.03, '8.5', '8.0', '3.2', '1.030', '12.5', '1000', '6.5', 1, NULL, 1, '2025-10-03 10:03:54', '2025-10-03 10:03:54', NULL, NULL, 1, 1),
(22, 'milking-test-1759486448', 'MILK_TEST_1759486448', 1, 1, 12.5, 1.03, '8.5', '8.0', '3.2', '1.030', '12.5', '1000', '6.5', 1, NULL, 1, '2025-10-03 10:14:08', '2025-10-03 10:14:08', NULL, NULL, 1, 1),
(23, 'milking-test-1759486490', 'MILK_TEST_1759486490', 1, 1, 12.5, 1.03, '8.5', '8.0', '3.2', '1.030', '12.5', '1000', '6.5', 1, NULL, 1, '2025-10-03 10:14:50', '2025-10-03 10:14:50', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `milking_methods`
--

CREATE TABLE `milking_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milking_methods`
--

INSERT INTO `milking_methods` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'hand', '#004b23', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'pump', '#fb8500', '2024-09-21 20:19:57', '2024-09-21 20:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `milking_sessions`
--

CREATE TABLE `milking_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milking_sessions`
--

INSERT INTO `milking_sessions` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Morning', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Evening', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Night', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Midnight', '#003049', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `milking_statuses`
--

CREATE TABLE `milking_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milking_statuses`
--

INSERT INTO `milking_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Completed', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Cancelled', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `milking_units`
--

CREATE TABLE `milking_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milking_units`
--

INSERT INTO `milking_units` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'litre', '#004b23', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'kg', '#fb8500', '2024-09-21 20:19:57', '2024-09-21 20:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 10),
(4, 'App\\Models\\User', 11),
(4, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 22),
(4, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 25),
(4, 'App\\Models\\User', 26),
(4, 'App\\Models\\User', 27),
(4, 'App\\Models\\User', 28),
(4, 'App\\Models\\User', 29),
(4, 'App\\Models\\User', 30),
(4, 'App\\Models\\User', 32),
(5, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 14),
(5, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 16),
(5, 'App\\Models\\User', 20),
(5, 'App\\Models\\User', 21),
(5, 'App\\Models\\User', 23),
(9, 'App\\Models\\User', 36),
(10, 'App\\Models\\User', 40),
(11, 'App\\Models\\User', 37),
(11, 'App\\Models\\User', 39),
(12, 'App\\Models\\User', 38);

-- --------------------------------------------------------

--
-- Table structure for table `officer_types`
--

CREATE TABLE `officer_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `officer_types`
--

INSERT INTO `officer_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Extension Officer', '#004b23', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'Veterinary', '#fb8500', '2024-09-21 20:19:57', '2024-09-21 20:19:57');

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
-- Table structure for table `payment_statuses`
--

CREATE TABLE `payment_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_statuses`
--

INSERT INTO `payment_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Paid', '#004b23', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'Partial Paid', '#fb8500', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'Pending', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, 'Cancelled', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, 'Expired', '#e76f51', '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `payment_terms`
--

CREATE TABLE `payment_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_terms`
--

INSERT INTO `payment_terms` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '100% upfront', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, '50% upfront (Installment)', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_menus`
--

CREATE TABLE `permission_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'test-token', '08546ff4a27d2e03fe4779f19a7e362b47a6a00c6284724f0cbcdf2c282925f6', '[\"*\"]', NULL, NULL, '2025-09-21 06:12:51', '2025-09-21 06:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `pregnancy_diagnosis`
--

CREATE TABLE `pregnancy_diagnosis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `serial` varchar(250) DEFAULT NULL,
  `test_result_id` bigint(20) UNSIGNED NOT NULL,
  `no_of_months` varchar(255) DEFAULT NULL,
  `test_date` datetime NOT NULL,
  `remarks` text NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `sync_status` enum('pending','synced','conflict','deleted') NOT NULL DEFAULT 'pending',
  `device_id` varchar(255) DEFAULT NULL,
  `original_created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pregnancy_diagnosis`
--

INSERT INTO `pregnancy_diagnosis` (`id`, `uuid`, `reference_no`, `farm_id`, `livestock_id`, `serial`, `test_result_id`, `no_of_months`, `test_date`, `remarks`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `sync_status`, `device_id`, `original_created_at`, `deleted_at`) VALUES
(1, NULL, 'PD82824491', 2, 2, 'TZ0001234834901', 1, '10', '2024-07-01 00:00:00', 'Pregnant', 6, NULL, 1, '2024-09-24 18:35:06', '2024-09-24 15:35:06', NULL, 'pending', NULL, NULL, NULL),
(2, NULL, 'PD389160138', 2, 4, 'TZA024I300247-0002', 2, '4', '2024-09-24 00:00:00', 'none', 6, NULL, 1, '2024-09-24 18:38:32', '2024-09-24 15:38:32', NULL, 'pending', NULL, NULL, NULL),
(3, NULL, 'PD145352641', 2, 2, 'TZ0001234834901', 1, '10', '2024-07-01 00:00:00', 'Pregnant', 6, NULL, 1, '2024-09-25 05:58:10', '2024-09-25 02:58:10', NULL, 'pending', NULL, NULL, NULL),
(4, NULL, 'PD960452529', 18, 12, '123456788990', 2, '4', '2024-10-02 00:00:00', 'Testing', 27, NULL, 1, '2024-10-06 12:25:37', '2024-10-06 09:25:37', NULL, 'pending', NULL, NULL, NULL),
(5, NULL, 'PD81851763', 18, 12, '123456788990', 2, '4', '2024-10-02 00:00:00', 'Testing', 27, NULL, 1, '2024-10-06 12:25:45', '2024-10-06 09:25:45', NULL, 'pending', NULL, NULL, NULL),
(6, NULL, 'PD211894216', 17, 14, '8991389741184', 2, '1', '2024-10-02 00:00:00', 'none', 25, NULL, 1, '2024-10-07 09:06:40', '2024-10-07 06:06:40', NULL, 'pending', NULL, NULL, NULL),
(7, NULL, 'PD647089958', 21, 17, '123-00021', 2, '4', '2025-09-20 00:00:00', 'none', 32, NULL, 1, '2025-09-20 16:08:23', '2025-09-20 13:08:23', NULL, 'pending', NULL, NULL, NULL),
(8, NULL, 'PD286659791', 21, 17, '123-00021', 3, '4', '2025-09-21 00:00:00', 'GOod looking', 32, NULL, 1, '2025-09-20 23:06:30', '2025-09-20 20:06:30', NULL, 'pending', NULL, NULL, NULL),
(9, NULL, 'PD325725750', 21, 17, '123-00021', 1, '4', '2025-09-21 00:00:00', 'eating well', 32, NULL, 1, '2025-09-20 23:36:07', '2025-09-20 20:36:07', NULL, 'pending', NULL, NULL, NULL),
(10, NULL, 'PD707679583', 21, 17, '123-00021', 1, '5', '2025-09-21 00:00:00', 'well and good', 32, NULL, 1, '2025-09-20 23:45:17', '2025-09-20 20:45:17', NULL, 'pending', NULL, NULL, NULL),
(11, NULL, 'PD361632791', 21, 17, '123-00021', 3, '8', '2025-09-21 00:00:00', 'Gh', 32, NULL, 1, '2025-09-20 23:53:45', '2025-09-20 20:53:45', NULL, 'pending', NULL, NULL, NULL),
(12, NULL, 'PD824503916', 21, 17, '123-00021', 2, '10', '2025-09-21 00:00:00', 'were no', 32, NULL, 1, '2025-09-21 13:05:22', '2025-09-21 10:05:22', NULL, 'pending', NULL, NULL, NULL),
(13, NULL, 'PD946241958', 21, 17, '123-00021', 2, '4', '2025-09-22 00:00:00', 'well good', 32, NULL, 1, '2025-09-22 11:48:42', '2025-09-22 08:48:42', NULL, 'pending', NULL, NULL, NULL),
(14, NULL, 'PD614366291', 21, 17, '123-00021', 2, '4', '2025-09-20 00:00:00', 'cvmxcv9r9', 32, NULL, 1, '2025-09-23 14:47:13', '2025-09-23 14:47:13', NULL, 'pending', NULL, NULL, NULL),
(15, NULL, 'PD247296666', 21, 16, '12345', 1, '4', '2025-01-22 00:00:00', 'Test pregnancy', 32, NULL, 1, '2025-09-23 21:05:14', '2025-09-23 21:05:14', NULL, 'pending', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pregnancy_diagnosis_test_results`
--

CREATE TABLE `pregnancy_diagnosis_test_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pregnancy_diagnosis_test_results`
--

INSERT INTO `pregnancy_diagnosis_test_results` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Doubtful', '#004b23', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(2, 'Not Pregnant', '#fb8500', '2025-09-22 08:47:04', '2025-09-22 08:47:04'),
(3, 'Pregnant', '#e76f51', '2025-09-22 08:47:04', '2025-09-22 08:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receipt_number` varchar(255) NOT NULL,
  `referrence_number` varchar(255) NOT NULL,
  `third_party_number` varchar(255) NOT NULL,
  `receipt_date` datetime NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `remarks` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `regionID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `regionID`, `name`, `abbreviation`, `country_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '1', 'Arusha', 'ARU', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, '2', 'Dar es Salaam', 'DAR', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, '3', 'Dodoma', 'DOM', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, '4', 'Iringa', 'IRI', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, '5', 'Kagera', 'KGR', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(6, '16', 'Kaskazini Pemba', 'KZP', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(7, '26', 'Kaskazini Unguja', 'KZU', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(8, '6', 'Katavi', 'KTV', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(9, '7', 'Kigoma', 'KGM', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(10, '8', 'Kilimanjaro', 'KMJ', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(11, '17', 'Kusini Pemba', 'KSP', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(12, '27', 'Kusini Unguja', 'KSU', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(13, '9', 'Lindi', 'LND', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(14, '10', 'Manyara', 'MYR', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(15, '11', 'Mara', 'MAR', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(16, '12', 'Mbeya', 'MBY', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(17, '25', 'Mjini Magharibi', 'MJM', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(18, '13', 'Morogoro', 'MGR', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(19, '14', 'Mtwara', 'MTW', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(20, '15', 'Mwanza', 'MWZ', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(21, '18', 'Pwani', 'PWN', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(22, '19', 'Rukwa', 'RKW', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(23, '20', 'Ruvuma', 'RVM', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(24, '21', 'Shinyanga', 'SHY', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(25, '22', 'Singida', 'SGD', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(26, '23', 'Tabora', 'TBR', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(27, '24', 'Tanga', 'TNG', 1, 1, NULL, '2024-09-21 20:19:39', '2024-09-21 20:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_by`, `updated_by`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', 1, NULL, 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(2, 'admin', 'web', 1, NULL, 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(3, 'system-user', 'web', 1, NULL, 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(4, 'farmer', 'web', 1, NULL, 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(5, 'extension-officer', 'web', 1, NULL, 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(6, 'veterinary', 'web', 1, NULL, 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(7, 'farm-manager', 'web', 1, NULL, 1, '2024-09-21 20:19:39', '2024-09-21 20:19:39'),
(8, 'Farm Manager', 'api', 1, NULL, 1, '2025-09-18 12:35:01', '2025-09-18 12:35:01'),
(9, 'Farm Worker', 'api', 1, NULL, 1, '2025-09-18 12:35:01', '2025-09-18 12:35:01'),
(10, 'Veterinary Assistant', 'api', 1, NULL, 1, '2025-09-18 12:35:01', '2025-09-18 12:35:01'),
(11, 'Feeding Specialist', 'api', 1, NULL, 1, '2025-09-18 12:35:01', '2025-09-18 12:35:01'),
(12, 'Milking Specialist', 'api', 1, NULL, 1, '2025-09-18 12:35:01', '2025-09-18 12:35:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scan_logs`
--

CREATE TABLE `scan_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_no` varchar(255) DEFAULT NULL,
  `scanned_date` date NOT NULL,
  `scanned_time` time NOT NULL,
  `scanned_by` bigint(20) UNSIGNED DEFAULT NULL,
  `scan_response` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scan_logs`
--

INSERT INTO `scan_logs` (`id`, `farm_id`, `tag_no`, `scanned_date`, `scanned_time`, `scanned_by`, `scan_response`, `created_at`, `updated_at`) VALUES
(1, NULL, '25500000000001', '2024-09-23', '10:47:45', 6, 'Tag successfully verified.', '2024-09-23 07:47:45', '2024-09-23 07:47:45'),
(2, NULL, '25500000000001k', '2024-09-23', '10:47:54', 6, 'Tag not found.', '2024-09-23 07:47:54', '2024-09-23 07:47:54'),
(3, NULL, '25500000000001', '2024-09-23', '10:47:58', 6, 'Tag successfully verified.', '2024-09-23 07:47:58', '2024-09-23 07:47:58'),
(4, NULL, '25500000000001', '2024-09-25', '17:06:57', 6, 'Tag successfully verified.', '2024-09-25 14:06:57', '2024-09-25 14:06:57'),
(5, NULL, '8901238910470', '2024-09-25', '17:15:24', 11, 'Tag not found.', '2024-09-25 14:15:24', '2024-09-25 14:15:24'),
(6, NULL, '8901238910470', '2024-09-26', '09:08:41', 6, 'Tag not found.', '2024-09-26 06:08:41', '2024-09-26 06:08:41'),
(7, NULL, '8901238910470', '2024-09-26', '11:00:55', 6, 'Tag not found.', '2024-09-26 08:00:55', '2024-09-26 08:00:55'),
(8, NULL, '8901238910470', '2024-09-26', '11:06:24', 6, 'Tag not found.', '2024-09-26 08:06:24', '2024-09-26 08:06:24'),
(9, NULL, '8901238910470', '2024-09-26', '11:06:32', 6, 'Tag not found.', '2024-09-26 08:06:32', '2024-09-26 08:06:32'),
(10, NULL, '8901238910470', '2024-09-26', '11:07:51', 6, 'Tag not found.', '2024-09-26 08:07:51', '2024-09-26 08:07:51'),
(11, NULL, '8901238910470', '2024-09-26', '11:07:58', 6, 'Tag not found.', '2024-09-26 08:07:58', '2024-09-26 08:07:58'),
(12, NULL, '8901238910470', '2024-09-26', '11:08:19', 6, 'Tag not found.', '2024-09-26 08:08:19', '2024-09-26 08:08:19'),
(13, NULL, '255000000000019', '2024-09-26', '11:28:30', 6, 'Tag not found.', '2024-09-26 08:28:30', '2024-09-26 08:28:30'),
(14, NULL, '25500000000001', '2024-09-26', '11:28:35', 6, 'Tag successfully verified.', '2024-09-26 08:28:35', '2024-09-26 08:28:35'),
(15, NULL, '25500000000001', '2024-10-06', '11:32:48', 8, 'Tag successfully verified.', '2024-10-06 08:32:48', '2024-10-06 08:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `school_levels`
--

CREATE TABLE `school_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_levels`
--

INSERT INTO `school_levels` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Primary Education', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Ordinary Secondary Education', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Advance Secondary Education', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'High Level Education', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `ip_address`, `user_agent`, `payload`, `last_activity`, `user_id`) VALUES
('3Hhd9ek2WsHfVPf3f3crPErMPNZtaxSWNNS4rjkU', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSjA0VTNYSGtWWDRodEZCMVI4UnRIM3lSZEFHUFR2YWZEdmtLZW1neCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2Rhc2hib2FyZC91c2VyIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1758722262, 1),
('3yCozCWPmq5H2qZXz25AQidLWKR1yyh0qaGV50hB', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiREthRFJhZ0U4dGtINTNFM1lLR3cwdXVDdmJzRWI1bDc4Nk1FdEpkZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1758616144, 1),
('50epzPVLSkcBIowhiB3mnCGXDahcSgh6KLxC0NFi', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnJEUXZON0VLQlI0VDdWMHpIWlZNVk5jeTFJOEZGTWR1WmVtR1ZVSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1758615159, NULL),
('63HdhQyrSTd9RO5oaITMIwg9rZCPOHXhuYuOrypY', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRXlXaDVWRUpqZXpjRnBZWjNBVGF2OVcyRHA0SHZvdTQ4RTFVa2ZhYSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2Rhc2hib2FyZC91c2VyIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1758722183, NULL),
('SDrB0rkuhvJ7SoFTv2YazoPUAdUWMXF9uYuwkVhF', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMHB5R0VmeGFveG1RMHBnOVNlNUQ4ZkhyanIzc0tsa0JCSm9nSzJabyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1758722464, NULL),
('tdiKHx2sJlcbXeFAnUcm2LbDXhGHHqrMUWjt94Xu', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibm9LNmJUNmtHMG5semdocGFxNjFqMkVkUGg4a214aVBYT2J5am04TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXNoYm9hcmQvdXNlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1758616271, 1),
('YRxHCLGEuKxBXKHglm3PAzYwY8tmqFyTwLx9MyX4', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzFWU0NuckVhYnZLbzBEd05xcEhSRzdYRnhiNDJyRnVzbG82dVhLcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1758615207, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `size_units`
--

CREATE TABLE `size_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `size_units`
--

INSERT INTO `size_units` (`id`, `name`, `short_code`, `created_at`, `updated_at`) VALUES
(1, 'Acre', 'Acre', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Sq. Meter', '', '2025-10-03 00:11:55', '2025-10-03 00:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `slaughter_houses`
--

CREATE TABLE `slaughter_houses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ward_id` bigint(20) UNSIGNED DEFAULT NULL,
  `street_id` bigint(20) UNSIGNED DEFAULT NULL,
  `village_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

CREATE TABLE `species` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `species`
--

INSERT INTO `species` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Cattle', '#4f5d75', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `livestock_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`id`, `name`, `color`, `livestock_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Calf', '#4f5d75', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Cow', '#bc6c25', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Newborn', '#457b9d', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Heifer', '#000000', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, 'Yearling', '#ffafcc', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(6, 'Mature', '#606c38', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(7, 'Holstein', '#8338ec', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(8, 'Jersey', '#073b4c', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(9, 'Weaning', '#83c5be', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(10, 'Peak Lactaction', '#006d77', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(11, 'Dry Cow', '#0081a7', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(12, 'Bull', '#0081a7', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(13, 'Steer', '#0081a7', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', 'green', '2024-09-21 20:19:37', '2024-09-21 20:19:37'),
(2, 'Pending', 'orange', '2024-09-21 20:19:37', '2024-09-21 20:19:37'),
(3, 'Inactive', 'crimson', '2024-09-21 20:19:37', '2024-09-21 20:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', 'green', '2024-09-21 20:19:37', '2024-09-21 20:19:37'),
(2, 'Pending', 'orange', '2024-09-21 20:19:37', '2024-09-21 20:19:37'),
(3, 'Inactive', 'crimson', '2024-09-21 20:19:37', '2024-09-21 20:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `streets`
--

CREATE TABLE `streets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `ward_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `old_record` text NOT NULL,
  `new_record` text NOT NULL,
  `table` varchar(100) NOT NULL,
  `action` varchar(100) DEFAULT NULL,
  `notify` int(11) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `attended_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_users`
--

CREATE TABLE `system_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_users`
--

INSERT INTO `system_users` (`id`, `name`, `email`, `phone`, `address`, `created_by`, `updated_by`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'Saleh Salim Saleh', 'saleh.salim@gmail.com', '+255754545212', 'Mlandege, Zanzibar', 1, NULL, 1, '2024-09-21 20:19:37', '2024-09-21 20:19:37'),
(2, 'Vallerian Mchau', 'vallermchau@gmail.com', '0756215388', 'Dodoma, Tanzania', 1, 35, 1, '2025-09-24 05:41:33', '2025-09-24 06:36:51'),
(3, 'prince', 'prince@gmail.com', '07546375895', 'Mwenge Dar-es-salaam', 32, NULL, 1, '2025-09-29 21:58:55', '2025-09-29 21:58:55'),
(4, 'Miraji', 'miraji@gmail.com', '0788991828', 'Mwenge, Dar', 32, NULL, 1, '2025-09-29 22:03:20', '2025-09-29 22:03:20'),
(5, 'Vallerian', 'vallerianmchau12345@gmail.com', '0666778899', 'Makumbusho', 32, NULL, 1, '2025-09-29 22:07:11', '2025-09-29 22:07:11'),
(6, 'Vicky', 'vallerianmchau@gmail.com', '0672060708', 'Goba, Dar', 32, NULL, 1, '2025-09-29 22:19:38', '2025-09-29 22:19:38'),
(7, 'baba mkubwa', 'princemchau99@gmail.com', '0778939393', 'Kinzudi, Dar', 32, NULL, 1, '2025-09-29 22:24:46', '2025-09-29 22:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `taggings`
--

CREATE TABLE `taggings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `tagging_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taggings`
--

INSERT INTO `taggings` (`id`, `reference_no`, `livestock_id`, `tag_id`, `farm_id`, `created_by`, `updated_by`, `tagging_status_id`, `created_at`, `updated_at`) VALUES
(2, 'TGG112326038', 2, 1, 2, 6, NULL, 1, '2024-09-23 06:55:18', '2024-09-23 06:55:18'),
(3, 'TGG164157061', 3, 1, 2, 6, NULL, 1, '2024-09-24 03:56:51', '2024-09-24 03:56:51'),
(4, 'TGG432340658', 4, 1, 2, 6, NULL, 1, '2024-09-24 04:00:15', '2024-09-24 04:00:15'),
(5, 'TGG532449061', 5, 1, 4, 11, NULL, 1, '2024-09-25 13:39:42', '2024-09-25 13:39:42'),
(6, 'TGG858514919', 6, 1, 5, 12, NULL, 1, '2024-09-25 14:51:45', '2024-09-25 14:51:45'),
(7, 'TGG187516524', 7, 1, 2, 6, NULL, 1, '2024-10-01 03:16:54', '2024-10-01 03:16:54'),
(10, 'TGG164212872', 10, 1, 16, 26, NULL, 1, '2024-10-06 05:59:50', '2024-10-06 05:59:50'),
(11, 'TGG123761172', 11, 1, 18, 27, NULL, 1, '2024-10-06 07:56:28', '2024-10-06 07:56:28'),
(12, 'TGG531566759', 12, 1, 18, 27, NULL, 1, '2024-10-06 08:10:37', '2024-10-06 08:10:37'),
(13, 'TGG434381007', 13, 1, 19, 8, NULL, 1, '2024-10-06 08:32:36', '2024-10-06 08:32:36'),
(14, 'TGG40654783', 14, 1, 17, 25, NULL, 1, '2024-10-07 04:19:19', '2024-10-07 04:19:19'),
(15, 'TGG47219523', 15, 1, 17, 25, NULL, 1, '2024-10-08 04:40:18', '2024-10-08 04:40:18'),
(16, 'TGG768318916', 16, 1, 21, 32, NULL, 1, '2025-09-15 10:10:32', '2025-09-15 10:10:32'),
(17, 'TGG190560291', 17, 1, 21, 32, NULL, 1, '2025-09-15 11:26:08', '2025-09-15 11:26:08'),
(18, 'TGG695296958', 18, 1, 22, 32, NULL, 1, '2025-09-16 04:52:26', '2025-09-16 04:52:26'),
(19, 'TGG602400875', 19, 1, 23, 32, NULL, 1, '2025-09-19 13:02:59', '2025-09-19 13:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `tagging_statuses`
--

CREATE TABLE `tagging_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tagging_statuses`
--

INSERT INTO `tagging_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Completed', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Cancelled', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_number` varchar(255) NOT NULL,
  `batch_serial_number` varchar(255) DEFAULT NULL,
  `tag_type_id` bigint(20) UNSIGNED NOT NULL,
  `tag_batch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag_number`, `batch_serial_number`, `tag_type_id`, `tag_batch_id`, `created_by`, `updated_by`, `tag_status_id`, `created_at`, `updated_at`) VALUES
(1, '25500000000001', NULL, 1, NULL, 1, 1, 5, '2024-09-23 09:18:47', '2025-09-19 13:02:59'),
(2, '25500000000002', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(3, '25500000000003', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(4, '25500000000004', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(5, '25500000000005', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(6, '25500000000006', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(7, '25500000000007', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(8, '25500000000008', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(9, '25500000000009', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(10, '25500000000010', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:31'),
(11, '25500000000011', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(12, '25500000000012', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(13, '25500000000013', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(14, '25500000000014', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(15, '25500000000015', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(16, '25500000000016', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(17, '25500000000017', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(18, '25500000000018', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(19, '25500000000019', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(20, '25500000000020', NULL, 1, NULL, 1, 1, 4, '2024-09-23 09:18:47', '2024-09-23 09:27:53'),
(21, '25500000000021', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(22, '25500000000022', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(23, '25500000000023', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(24, '25500000000024', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(25, '25500000000025', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(26, '25500000000026', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(27, '25500000000027', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(28, '25500000000028', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(29, '25500000000029', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(30, '25500000000030', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(31, '25500000000031', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(32, '25500000000032', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(33, '25500000000033', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(34, '25500000000034', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(35, '25500000000035', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(36, '25500000000036', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(37, '25500000000037', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(38, '25500000000038', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(39, '25500000000039', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(40, '25500000000040', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(41, '25500000000041', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(42, '25500000000042', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(43, '25500000000043', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(44, '25500000000044', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(45, '25500000000045', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(46, '25500000000046', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(47, '25500000000047', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(48, '25500000000048', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(49, '25500000000049', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(50, '25500000000050', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(51, '25500000000051', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(52, '25500000000052', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(53, '25500000000053', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(54, '25500000000054', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(55, '25500000000055', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(56, '25500000000056', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(57, '25500000000057', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(58, '25500000000058', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(59, '25500000000059', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(60, '25500000000060', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(61, '25500000000061', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(62, '25500000000062', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(63, '25500000000063', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(64, '25500000000064', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(65, '25500000000065', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(66, '25500000000066', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(67, '25500000000067', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(68, '25500000000068', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(69, '25500000000069', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(70, '25500000000070', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(71, '25500000000071', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(72, '25500000000072', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(73, '25500000000073', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(74, '25500000000074', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(75, '25500000000075', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(76, '25500000000076', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(77, '25500000000077', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(78, '25500000000078', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(79, '25500000000079', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(80, '25500000000080', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(81, '25500000000081', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(82, '25500000000082', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(83, '25500000000083', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(84, '25500000000084', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(85, '25500000000085', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(86, '25500000000086', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(87, '25500000000087', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(88, '25500000000088', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(89, '25500000000089', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(90, '25500000000090', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(91, '25500000000091', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(92, '25500000000092', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(93, '25500000000093', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(94, '25500000000094', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(95, '25500000000095', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(96, '25500000000096', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(97, '25500000000097', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(98, '25500000000098', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(99, '25500000000099', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(100, '25500000000100', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(101, '25500000000101', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(102, '25500000000102', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(103, '25500000000103', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(104, '25500000000104', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(105, '25500000000105', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(106, '25500000000106', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(107, '25500000000107', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(108, '25500000000108', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(109, '25500000000109', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(110, '25500000000110', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(111, '25500000000111', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(112, '25500000000112', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(113, '25500000000113', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(114, '25500000000114', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(115, '25500000000115', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(116, '25500000000116', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(117, '25500000000117', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(118, '25500000000118', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(119, '25500000000119', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(120, '25500000000120', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(121, '25500000000121', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(122, '25500000000122', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(123, '25500000000123', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(124, '25500000000124', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(125, '25500000000125', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(126, '25500000000126', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(127, '25500000000127', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(128, '25500000000128', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(129, '25500000000129', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(130, '25500000000130', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(131, '25500000000131', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(132, '25500000000132', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(133, '25500000000133', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(134, '25500000000134', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(135, '25500000000135', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(136, '25500000000136', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(137, '25500000000137', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(138, '25500000000138', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(139, '25500000000139', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(140, '25500000000140', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(141, '25500000000141', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(142, '25500000000142', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(143, '25500000000143', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(144, '25500000000144', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(145, '25500000000145', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(146, '25500000000146', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(147, '25500000000147', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(148, '25500000000148', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(149, '25500000000149', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(150, '25500000000150', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(151, '25500000000151', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(152, '25500000000152', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(153, '25500000000153', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(154, '25500000000154', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(155, '25500000000155', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(156, '25500000000156', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(157, '25500000000157', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(158, '25500000000158', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(159, '25500000000159', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(160, '25500000000160', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(161, '25500000000161', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(162, '25500000000162', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(163, '25500000000163', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(164, '25500000000164', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(165, '25500000000165', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(166, '25500000000166', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(167, '25500000000167', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(168, '25500000000168', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(169, '25500000000169', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(170, '25500000000170', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(171, '25500000000171', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(172, '25500000000172', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(173, '25500000000173', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(174, '25500000000174', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(175, '25500000000175', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(176, '25500000000176', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(177, '25500000000177', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(178, '25500000000178', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(179, '25500000000179', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(180, '25500000000180', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(181, '25500000000181', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(182, '25500000000182', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(183, '25500000000183', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(184, '25500000000184', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(185, '25500000000185', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(186, '25500000000186', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(187, '25500000000187', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(188, '25500000000188', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(189, '25500000000189', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(190, '25500000000190', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(191, '25500000000191', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(192, '25500000000192', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(193, '25500000000193', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(194, '25500000000194', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(195, '25500000000195', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(196, '25500000000196', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(197, '25500000000197', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(198, '25500000000198', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(199, '25500000000199', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(200, '25500000000200', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(201, '25500000000201', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(202, '25500000000202', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(203, '25500000000203', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(204, '25500000000204', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(205, '25500000000205', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(206, '25500000000206', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(207, '25500000000207', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(208, '25500000000208', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(209, '25500000000209', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(210, '25500000000210', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(211, '25500000000211', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(212, '25500000000212', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(213, '25500000000213', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(214, '25500000000214', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(215, '25500000000215', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(216, '25500000000216', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(217, '25500000000217', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(218, '25500000000218', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(219, '25500000000219', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(220, '25500000000220', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(221, '25500000000221', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(222, '25500000000222', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(223, '25500000000223', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(224, '25500000000224', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(225, '25500000000225', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(226, '25500000000226', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(227, '25500000000227', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(228, '25500000000228', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(229, '25500000000229', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(230, '25500000000230', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(231, '25500000000231', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(232, '25500000000232', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(233, '25500000000233', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(234, '25500000000234', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(235, '25500000000235', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(236, '25500000000236', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(237, '25500000000237', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(238, '25500000000238', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(239, '25500000000239', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(240, '25500000000240', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:47', '2024-09-23 09:18:47'),
(241, '25500000000241', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(242, '25500000000242', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(243, '25500000000243', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(244, '25500000000244', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(245, '25500000000245', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(246, '25500000000246', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(247, '25500000000247', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(248, '25500000000248', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(249, '25500000000249', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(250, '25500000000250', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(251, '25500000000251', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(252, '25500000000252', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(253, '25500000000253', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(254, '25500000000254', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(255, '25500000000255', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(256, '25500000000256', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(257, '25500000000257', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(258, '25500000000258', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(259, '25500000000259', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(260, '25500000000260', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(261, '25500000000261', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(262, '25500000000262', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(263, '25500000000263', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(264, '25500000000264', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(265, '25500000000265', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(266, '25500000000266', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(267, '25500000000267', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(268, '25500000000268', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(269, '25500000000269', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(270, '25500000000270', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(271, '25500000000271', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(272, '25500000000272', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(273, '25500000000273', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(274, '25500000000274', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(275, '25500000000275', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(276, '25500000000276', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(277, '25500000000277', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(278, '25500000000278', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(279, '25500000000279', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(280, '25500000000280', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(281, '25500000000281', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(282, '25500000000282', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(283, '25500000000283', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(284, '25500000000284', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(285, '25500000000285', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(286, '25500000000286', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(287, '25500000000287', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(288, '25500000000288', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(289, '25500000000289', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(290, '25500000000290', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(291, '25500000000291', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(292, '25500000000292', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(293, '25500000000293', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(294, '25500000000294', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(295, '25500000000295', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(296, '25500000000296', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(297, '25500000000297', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(298, '25500000000298', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(299, '25500000000299', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(300, '25500000000300', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(301, '25500000000301', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(302, '25500000000302', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(303, '25500000000303', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(304, '25500000000304', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(305, '25500000000305', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(306, '25500000000306', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(307, '25500000000307', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(308, '25500000000308', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(309, '25500000000309', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(310, '25500000000310', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(311, '25500000000311', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(312, '25500000000312', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(313, '25500000000313', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(314, '25500000000314', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(315, '25500000000315', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(316, '25500000000316', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(317, '25500000000317', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(318, '25500000000318', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(319, '25500000000319', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(320, '25500000000320', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(321, '25500000000321', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(322, '25500000000322', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(323, '25500000000323', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(324, '25500000000324', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(325, '25500000000325', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(326, '25500000000326', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(327, '25500000000327', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(328, '25500000000328', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(329, '25500000000329', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(330, '25500000000330', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(331, '25500000000331', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(332, '25500000000332', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(333, '25500000000333', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(334, '25500000000334', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(335, '25500000000335', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(336, '25500000000336', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(337, '25500000000337', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(338, '25500000000338', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(339, '25500000000339', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(340, '25500000000340', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(341, '25500000000341', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(342, '25500000000342', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(343, '25500000000343', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(344, '25500000000344', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(345, '25500000000345', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(346, '25500000000346', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(347, '25500000000347', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(348, '25500000000348', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(349, '25500000000349', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(350, '25500000000350', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(351, '25500000000351', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(352, '25500000000352', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(353, '25500000000353', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(354, '25500000000354', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(355, '25500000000355', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(356, '25500000000356', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(357, '25500000000357', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(358, '25500000000358', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(359, '25500000000359', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(360, '25500000000360', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(361, '25500000000361', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(362, '25500000000362', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(363, '25500000000363', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(364, '25500000000364', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(365, '25500000000365', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(366, '25500000000366', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(367, '25500000000367', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(368, '25500000000368', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(369, '25500000000369', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(370, '25500000000370', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(371, '25500000000371', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(372, '25500000000372', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(373, '25500000000373', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(374, '25500000000374', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(375, '25500000000375', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(376, '25500000000376', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(377, '25500000000377', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(378, '25500000000378', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(379, '25500000000379', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(380, '25500000000380', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(381, '25500000000381', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(382, '25500000000382', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(383, '25500000000383', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(384, '25500000000384', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(385, '25500000000385', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(386, '25500000000386', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(387, '25500000000387', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(388, '25500000000388', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(389, '25500000000389', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(390, '25500000000390', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(391, '25500000000391', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(392, '25500000000392', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(393, '25500000000393', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(394, '25500000000394', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(395, '25500000000395', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(396, '25500000000396', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(397, '25500000000397', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(398, '25500000000398', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(399, '25500000000399', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(400, '25500000000400', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(401, '25500000000401', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(402, '25500000000402', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(403, '25500000000403', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(404, '25500000000404', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(405, '25500000000405', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(406, '25500000000406', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(407, '25500000000407', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(408, '25500000000408', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(409, '25500000000409', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(410, '25500000000410', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(411, '25500000000411', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(412, '25500000000412', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(413, '25500000000413', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(414, '25500000000414', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(415, '25500000000415', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(416, '25500000000416', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(417, '25500000000417', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(418, '25500000000418', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(419, '25500000000419', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(420, '25500000000420', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(421, '25500000000421', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(422, '25500000000422', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(423, '25500000000423', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(424, '25500000000424', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(425, '25500000000425', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(426, '25500000000426', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(427, '25500000000427', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(428, '25500000000428', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(429, '25500000000429', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(430, '25500000000430', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(431, '25500000000431', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(432, '25500000000432', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(433, '25500000000433', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(434, '25500000000434', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(435, '25500000000435', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(436, '25500000000436', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(437, '25500000000437', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(438, '25500000000438', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(439, '25500000000439', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(440, '25500000000440', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(441, '25500000000441', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(442, '25500000000442', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(443, '25500000000443', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(444, '25500000000444', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(445, '25500000000445', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(446, '25500000000446', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(447, '25500000000447', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(448, '25500000000448', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(449, '25500000000449', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(450, '25500000000450', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(451, '25500000000451', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(452, '25500000000452', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(453, '25500000000453', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(454, '25500000000454', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(455, '25500000000455', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(456, '25500000000456', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(457, '25500000000457', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(458, '25500000000458', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(459, '25500000000459', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(460, '25500000000460', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(461, '25500000000461', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(462, '25500000000462', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(463, '25500000000463', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(464, '25500000000464', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(465, '25500000000465', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(466, '25500000000466', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(467, '25500000000467', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(468, '25500000000468', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(469, '25500000000469', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(470, '25500000000470', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(471, '25500000000471', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(472, '25500000000472', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(473, '25500000000473', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(474, '25500000000474', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(475, '25500000000475', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(476, '25500000000476', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(477, '25500000000477', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(478, '25500000000478', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(479, '25500000000479', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(480, '25500000000480', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(481, '25500000000481', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(482, '25500000000482', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(483, '25500000000483', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(484, '25500000000484', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(485, '25500000000485', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(486, '25500000000486', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(487, '25500000000487', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(488, '25500000000488', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(489, '25500000000489', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(490, '25500000000490', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(491, '25500000000491', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(492, '25500000000492', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(493, '25500000000493', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(494, '25500000000494', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(495, '25500000000495', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(496, '25500000000496', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(497, '25500000000497', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(498, '25500000000498', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(499, '25500000000499', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(500, '25500000000500', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(501, '25500000000501', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(502, '25500000000502', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(503, '25500000000503', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(504, '25500000000504', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(505, '25500000000505', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(506, '25500000000506', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(507, '25500000000507', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(508, '25500000000508', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(509, '25500000000509', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(510, '25500000000510', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(511, '25500000000511', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(512, '25500000000512', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(513, '25500000000513', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(514, '25500000000514', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(515, '25500000000515', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(516, '25500000000516', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(517, '25500000000517', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(518, '25500000000518', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(519, '25500000000519', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(520, '25500000000520', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48');
INSERT INTO `tags` (`id`, `tag_number`, `batch_serial_number`, `tag_type_id`, `tag_batch_id`, `created_by`, `updated_by`, `tag_status_id`, `created_at`, `updated_at`) VALUES
(521, '25500000000521', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(522, '25500000000522', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(523, '25500000000523', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(524, '25500000000524', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(525, '25500000000525', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(526, '25500000000526', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(527, '25500000000527', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(528, '25500000000528', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(529, '25500000000529', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(530, '25500000000530', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(531, '25500000000531', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(532, '25500000000532', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(533, '25500000000533', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(534, '25500000000534', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48'),
(535, '25500000000535', NULL, 1, NULL, 1, NULL, 1, '2024-09-23 09:18:48', '2024-09-23 09:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `tag_allocations`
--

CREATE TABLE `tag_allocations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `tag_type_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `approved_quantity` int(11) DEFAULT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `date_requested` datetime NOT NULL,
  `date_allocated` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `usage_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `processed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_allocation_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_allocations`
--

INSERT INTO `tag_allocations` (`id`, `reference_no`, `tag_type_id`, `quantity`, `approved_quantity`, `farm_id`, `date_requested`, `date_allocated`, `remarks`, `usage_status_id`, `created_by`, `updated_by`, `processed_by`, `tag_allocation_status_id`, `created_at`, `updated_at`) VALUES
(1, 'TGL60484447', 1, 10, 10, 1, '2024-09-23 12:26:57', '2024-09-23 00:00:00', 'remarks', NULL, 1, NULL, 1, 1, '2024-09-23 09:26:57', '2024-09-23 09:27:53'),
(2, 'TGL743152458', 1, 10, 10, 2, '2024-09-23 12:27:11', '2024-09-23 00:00:00', 'remarks', NULL, 1, NULL, 1, 1, '2024-09-23 09:27:11', '2024-09-23 09:27:31');

-- --------------------------------------------------------

--
-- Table structure for table `tag_allocation_statuses`
--

CREATE TABLE `tag_allocation_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_allocation_statuses`
--

INSERT INTO `tag_allocation_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Completed', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Cancelled', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `tag_batches`
--

CREATE TABLE `tag_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_serial_number` varchar(255) NOT NULL,
  `tag_type_id` bigint(20) UNSIGNED NOT NULL,
  `series_start` varchar(255) NOT NULL,
  `series_end` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag_statuses`
--

CREATE TABLE `tag_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_statuses`
--

INSERT INTO `tag_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Inactive', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Allocated', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, 'Assigned', '#780000', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `tag_types`
--

CREATE TABLE `tag_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_types`
--

INSERT INTO `tag_types` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Normal Visual Tag', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Barcode Scannable Tag', '#344e41', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Electronic Identification Tag (EID Tga)', '#780000', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, 'Injectable Transponder Tag', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, 'Bolus Tag', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `unit_of_measurements`
--

CREATE TABLE `unit_of_measurements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit_of_measurements`
--

INSERT INTO `unit_of_measurements` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Pieces (Vials or Syringes)', '#004b23', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'Boxes (Cartons)', '#fb8500', '2024-09-21 20:19:57', '2024-09-21 20:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `usage_statuses`
--

CREATE TABLE `usage_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usage_statuses`
--

INSERT INTO `usage_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Completed', '#004b23', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Pending', '#fb8500', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Cancelled', '#e76f51', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `status_id` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `profile`, `profile_id`, `status_id`, `created_by`, `updated_by`, `state_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'saleh.salim@gmail.com', '$2y$12$CZ7oQfYuZ.Wm/Fg8T0Uu6uItlEKSO1ZZuQqGOpgsLaPZfku6i6zXy', 'SystemUser', 1, 1, 1, NULL, 1, 'jPUPiy6AvV7U8zrCs4RfTgYbqSSwXWGCgrNDPLzCyEfFW6LHEeL3814vllha', '2024-09-21 20:19:37', '2025-09-24 13:56:34'),
(2, 'juhudi@farmer.com', '$2y$12$Uc5QIzMUR9qGpgn0PJEHTeI6f6fJqAzqJCzuMPjwyXAYGJOpzAFh6', 'Farmer', 1, 2, NULL, NULL, NULL, NULL, '2024-09-21 19:06:28', '2024-09-21 19:06:28'),
(3, 'honupowe@mailinator.com', '$2y$12$lnQvm48oc0TUPSmGJbEE/ezhTrNqWtD.EZC/ersQbypbDFdT5CfM2', 'Farmer', 2, 1, 1, NULL, NULL, NULL, '2024-09-21 22:49:30', '2024-09-21 22:49:30'),
(4, 'mkulima@farmer.com', '$2y$12$iIhd5IoU2qXXZtqhFW6VOuUoaWeXWS6jVCJKkIQzweMQLVd9.1mgy', 'Farmer', 3, 2, NULL, NULL, NULL, NULL, '2024-09-22 05:11:41', '2024-09-22 05:11:41'),
(5, 'john@gmail.com', '$2y$12$UCoMhQJYBMQiBj.XJkhmK.btXIsvVo8fmg9vGDX761YX.kbQHbZ3C', 'ExtensionOfficer', 1, 1, NULL, NULL, NULL, NULL, '2024-09-23 04:23:27', '2024-09-23 04:23:27'),
(6, 'farmer@farmer.com', '$2y$12$wnnb09dHy9uBi0PE.wuZyuMe8ab9cCkahr/uGNE5XzmSGmTixUmOW', 'Farmer', 4, 1, NULL, NULL, NULL, NULL, '2024-09-23 04:41:20', '2024-09-23 04:41:20'),
(7, 'juma@saidi.com', '$2y$12$0q774xlX1lZRV7FeYa27quKzVQ5w9avHp5aC37PavtQ7E9VH0kq2m', 'Farmer', 5, 1, NULL, NULL, NULL, NULL, '2024-09-23 08:46:33', '2024-09-23 08:46:33'),
(8, 'joel@farmer.com', '$2y$12$Mmew0T4sWwQDRSA.P.tVFusXQ01JfHgUqH5ymhACODvZaUUAHKy.K', 'Farmer', 15, 2, NULL, NULL, NULL, NULL, '2024-09-23 13:53:22', '2024-09-23 13:53:22'),
(9, 'mkulima2323@farmer.com', '$2y$12$lqhZu15winii2UOChjH3u.o5ZFEhOgO5ta/AxW5t7viO.OIaRpdKW', 'Farmer', 25, 2, NULL, NULL, NULL, NULL, '2024-09-25 12:42:01', '2024-09-25 12:42:01'),
(10, 'joel@gmail.com', '$2y$12$hgz1m9OJawSDA47SnZbdIOn0h7VDq0lkwC77G/wlh6XROCK66Bj62', 'Farmer', 29, 2, NULL, NULL, NULL, NULL, '2024-09-25 12:50:54', '2024-09-25 12:50:54'),
(11, 'kvnimrm@gmail.com', '$2y$12$rwpoFp3GIw/xuJCaCgH9pepUd/LaUuNiqfQ3x9xc4Wm3RU/nF7a9K', 'Farmer', 30, 2, NULL, NULL, NULL, NULL, '2024-09-25 13:02:34', '2024-09-25 13:02:34'),
(12, 'ngallah@gmail.com', '$2y$12$/LMWwgY2UZzWfBhsH6wZk.htQaFqSg1x.BK3RsOA.wossuJnBbBOm', 'Farmer', 31, 2, NULL, NULL, NULL, NULL, '2024-09-25 14:26:18', '2024-09-25 14:26:18'),
(13, 'mkulima23@farmer.com', '$2y$12$8e1VPMXA6FfEkdiekxQWpeDnfWUbCADQ3PI/4sTQW.Iwc81KE2cNu', 'Farmer', 32, 2, NULL, NULL, NULL, NULL, '2024-10-03 08:29:52', '2024-10-03 08:29:52'),
(14, 'mwamba@gmail.com', '$2y$12$gSEFguzppPuNsVeBL9BsveP8gU75RZ7iRn25My1cj0YHjxC2o8fZ2', 'ExtensionOfficer', 2, 1, NULL, NULL, NULL, NULL, '2024-10-03 09:28:35', '2024-10-03 09:28:35'),
(15, 'mtabe@officer.com', '$2y$12$/lHSDi3RK0oPFcyrBA0ZDOjpUtLSHRfrBjjfS7er4sbMVwKd8oj2O', 'ExtensionOfficer', 3, 1, NULL, NULL, NULL, NULL, '2024-10-03 09:29:18', '2024-10-03 09:29:18'),
(16, 'lutondwa@gmail.com', '$2y$12$xsS13GqENL/A0u0fdcnECe/pOyvKFs0sNgBPF3z65IayqoTlumKtO', 'ExtensionOfficer', 4, 1, NULL, NULL, NULL, NULL, '2024-10-03 09:31:33', '2024-10-03 09:31:33'),
(17, 'jtondi2001@gmail.com', '$2y$12$AW7i7MVgHECq67fiCh/USuDAiOu8uamn2045IJO4dvrPoY.RPxWTO', 'Farmer', 33, 1, NULL, NULL, NULL, NULL, '2024-10-03 09:35:42', '2024-10-03 09:35:42'),
(18, 'test@farmer.com', '$2y$12$eH1Zy3Edq0O/0rlvNNL/a.6Ls9ki0C95vWD7k37IytdtuEz80lk8O', 'Farmer', 34, 2, NULL, NULL, NULL, NULL, '2024-10-03 09:48:35', '2025-09-23 16:15:32'),
(19, 'mkulima@mwamba.com', '$2y$12$iQ7Ji1bhtnicdfZzX153fOrO6nd05KZlnNKF/qFcO10QqJzBOA6GW', 'Farmer', 35, 1, NULL, NULL, NULL, NULL, '2024-10-03 16:10:26', '2024-10-03 16:10:26'),
(20, 'ngallah@gmail.con', '$2y$12$Wr5kaLOsfymzCdIad3hjDexoGJxJJuWrlgBngfEmog4S36GR7HJPa', 'ExtensionOfficer', 5, 1, NULL, NULL, NULL, NULL, '2024-10-04 11:09:25', '2024-10-04 11:09:25'),
(21, 'miqquee@gmail.com', '$2y$12$6as1.KPLswZyxTe.ygBryeRjzNZ4pEpQUNTYWRc4VA9Oosn/DeP4W', 'ExtensionOfficer', 6, 1, NULL, NULL, NULL, NULL, '2024-10-04 11:35:49', '2024-10-04 11:35:49'),
(22, 'mkulima@shambabora.com', '$2y$12$9yuW1o8CCUEq1.rD4BcMEO43nmb5EBJ809yMuH14r6CdT9dth6Q3m', 'Farmer', 36, 1, NULL, NULL, NULL, NULL, '2024-10-04 11:39:07', '2024-10-04 11:39:07'),
(23, 'joelmanu@gmail.com', '$2y$12$JHijo25nYcM9zl302RrWeeZLxK2o1Df1GZBc1gwfy9rsXaKHJvBkO', 'ExtensionOfficer', 7, 1, NULL, NULL, NULL, NULL, '2024-10-05 08:53:06', '2024-10-05 08:53:06'),
(24, 'juliusmali@gmail.com', '$2y$12$lOfqLZ.4x.GfQm0CWoQMZOB4GFBPfdt4q60Y5q.JK2KFL5DW9ZRx.', 'Farmer', 37, 1, NULL, NULL, NULL, NULL, '2024-10-05 08:59:19', '2024-10-05 08:59:19'),
(25, 'farmer3@farmer.com', '$2y$12$ErQ/qY1yCYxbn2rR9vEln.br85SiATSCFTk9X8yk0NWPZHZMtaK56', 'Farmer', 38, 2, NULL, NULL, NULL, NULL, '2024-10-06 04:42:54', '2024-10-06 04:42:54'),
(26, 'asha@saidi.com', '$2y$12$nTegYVmWuF8VWAhiw5eSEONw61/HkxVMflx6Yb7NEDv2hsH/gdTUq', 'Farmer', 39, 2, NULL, NULL, NULL, NULL, '2024-10-06 05:00:05', '2024-10-06 05:00:05'),
(27, 'miriam@gmail.com', '$2y$12$SUan56962RQkWwHoDpF.r.DYfpqvj0Nk0d3I9LDx/KhHpsJROmbmi', 'Farmer', 40, 2, NULL, NULL, NULL, NULL, '2024-10-06 07:38:13', '2024-10-06 07:38:13'),
(29, 'mgeni@gmail.com', '$2y$12$wO2NLWb.n0brHfUcN0AjV.G0qqwNN9TubLRu01MCC.SVPfvAsAhRu', 'Farmer', 42, 2, NULL, NULL, NULL, NULL, '2024-10-08 10:34:00', '2024-10-08 10:34:00'),
(30, 'valler@gmail.com', '$2y$12$TdYgB14ajf2HU.UDcs0htuih1dVJfNqhihh7rgPvrhyVd/VxXVXie', 'Farmer', 43, 2, NULL, NULL, NULL, NULL, '2025-09-12 11:34:15', '2025-09-12 11:34:15'),
(32, 'valler1@gmail.com', '$2y$12$yQ5vszI0iVevoZbO/QNw..GYDPGL.5.AGhr0fvfzXWgPz3ZEgkJm6', 'Farmer', 45, 2, NULL, NULL, NULL, NULL, '2025-09-12 12:00:13', '2025-09-12 12:00:13'),
(33, 'admin', '$2y$12$LJR5XJZfUxOr4NgIWmZbdOYa5ZwJOKbUNqhFBS3CDIzRs9zOzhgyS', 'SystemUser', 1, 1, NULL, NULL, NULL, NULL, '2025-09-22 19:39:05', '2025-09-22 19:39:05'),
(34, 'user', '$2y$12$t0CFv2qMpKDqNZGcU3SNleO0NkNEyHSGeg85YkmatSCZqntLujTc2', 'RegularUser', 2, 1, NULL, NULL, NULL, NULL, '2025-09-22 19:39:05', '2025-09-22 19:39:05'),
(35, 'Vallerian', '$2y$12$0BYPcSECUACak0mr9OknbOYgOzxNeLV6Mmj/X26Ts9Rg/Chsq7Uvi', 'SystemUser', 2, 1, 1, 35, 1, '4896KIAjkxkm3GUONtXJw2tomiP5BIpDIcCStOug55MMDR2a2FQaIcBxmCOR', '2025-09-24 05:41:33', '2025-09-24 06:38:46'),
(36, 'prince@gmail.com', '$2y$12$rxEbsKUZ7U/xJ3UjPHnmxeAJfFR8GRtaMwaYZw21U5AQ7DMnW4ht2', 'FarmUser', 3, 1, 32, NULL, NULL, NULL, '2025-09-29 21:58:55', '2025-09-29 21:58:55'),
(37, 'miraji@gmail.com', '$2y$12$5/U5qUSNFakoGQd4i7D.QOfHYWoCgnCiVQdH1a5jTbs.y6.80tNrS', 'FarmUser', 4, 1, 32, NULL, NULL, NULL, '2025-09-29 22:03:20', '2025-09-29 22:03:20'),
(38, 'vallerianmchau12345@gmail.com', '$2y$12$LSP7NrEJ/4owFFh/oKfa8eItg3oBDcp41Wakvl9uULBBsL7ajplie', 'FarmUser', 5, 1, 32, NULL, NULL, NULL, '2025-09-29 22:07:12', '2025-09-29 22:07:12'),
(39, 'vallerianmchau@gmail.com', '$2y$12$rIXtwyzFJ3ZiOKYdHhzGaetXu0vtOv3EEKiRdJWfiGeAKgVaJ0dka', 'FarmUser', 6, 1, 32, NULL, NULL, NULL, '2025-09-29 22:19:38', '2025-09-29 22:19:38'),
(40, 'princemchau99@gmail.com', '$2y$12$sHRCy7/ow9L43zeOHhdaO.XvyTvkjz4B5IbryHA1p7BrOi.mCL44m', 'FarmUser', 7, 1, 32, NULL, NULL, NULL, '2025-09-29 22:24:46', '2025-09-29 22:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `vaccinations`
--

CREATE TABLE `vaccinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `vaccination_no` varchar(255) NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `vaccine_id` bigint(20) UNSIGNED NOT NULL,
  `disease_id` bigint(20) UNSIGNED NOT NULL,
  `vet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `extension_officer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `vaccination_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccinations`
--

INSERT INTO `vaccinations` (`id`, `uuid`, `vaccination_no`, `livestock_id`, `vaccine_id`, `disease_id`, `vet_id`, `extension_officer_id`, `created_by`, `updated_by`, `vaccination_status_id`, `created_at`, `updated_at`, `last_modified_at`, `deleted_at`) VALUES
(1, NULL, 'VC420069237', 2, 1, 1, NULL, NULL, 6, NULL, 1, '2024-09-25 02:27:50', '2024-09-25 02:27:50', NULL, NULL),
(2, NULL, 'VC81766366', 2, 1, 1, NULL, NULL, 6, NULL, 1, '2024-09-25 02:59:33', '2024-09-25 02:59:33', NULL, NULL),
(3, NULL, 'VC191798260', 14, 1, 1, NULL, NULL, 25, NULL, 1, '2024-10-07 07:51:42', '2024-10-07 07:51:42', NULL, NULL),
(4, NULL, 'VC677412836', 14, 1, 5, NULL, NULL, 25, NULL, 1, '2024-10-08 05:43:19', '2024-10-08 05:43:19', NULL, NULL),
(5, NULL, 'VC731092276', 15, 1, 5, NULL, NULL, 25, NULL, 1, '2024-10-08 05:43:20', '2024-10-08 05:43:20', NULL, NULL),
(6, NULL, 'VC562732541', 17, 1, 1, NULL, NULL, 1, NULL, 1, '2025-09-21 08:41:04', '2025-09-21 08:41:04', NULL, NULL),
(7, NULL, 'VC739355833', 17, 1, 1, NULL, NULL, 1, NULL, 1, '2025-09-21 09:00:47', '2025-09-21 09:00:47', NULL, NULL),
(8, NULL, 'VC61674375', 17, 1, 1, NULL, NULL, 1, NULL, 1, '2025-09-21 09:14:36', '2025-09-21 09:14:36', NULL, NULL),
(9, NULL, 'VC868564666', 17, 1, 1, NULL, NULL, 32, NULL, 1, '2025-09-21 09:29:14', '2025-09-21 09:29:14', NULL, NULL),
(10, NULL, 'VC846845750', 17, 1, 2, NULL, NULL, 32, NULL, 1, '2025-09-22 11:15:38', '2025-09-22 11:15:38', NULL, NULL),
(11, NULL, 'VC917868708', 17, 2, 1, NULL, NULL, 32, NULL, 1, '2025-09-22 11:24:21', '2025-09-22 11:24:21', NULL, NULL),
(12, NULL, 'VC959642583', 17, 2, 2, NULL, NULL, 32, NULL, 1, '2025-09-23 10:04:55', '2025-09-23 10:04:55', NULL, NULL),
(13, NULL, 'VC741324125', 16, 1, 1, NULL, NULL, 32, NULL, 1, '2025-09-23 21:00:52', '2025-09-23 21:00:52', NULL, NULL),
(14, 'flutter-test-68da2a11a9f63', 'FLUTTER_VAC_68da2a11a9f64', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-09-29 06:41:21', '2025-09-29 06:41:21', '2025-09-29 06:41:21', NULL),
(15, 'vaccination-test-68da2ca189701', 'VAC_TEST_68da2ca189702', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-09-29 06:52:17', '2025-09-29 06:52:17', '2025-09-29 06:52:17', NULL),
(16, 'vaccination-test-68da2f56b6a24', 'VAC_TEST_68da2f56b6a25', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-09-29 07:03:50', '2025-09-29 07:03:50', '2025-09-29 07:03:50', NULL),
(17, 'vaccination-test-68da3034b52d5', 'VAC_TEST_68da3034b52d6', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-09-29 07:07:32', '2025-09-29 07:07:32', '2025-09-29 07:07:32', NULL),
(18, 'vaccination-test-68da315082b14', 'VAC_TEST_68da315082b15', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-09-29 07:12:16', '2025-09-29 07:12:16', '2025-09-29 07:12:16', NULL),
(19, 'vaccination-test-68da3496d2a09', 'VAC_TEST_68da3496d2a0a', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-09-29 07:26:14', '2025-09-29 07:26:14', '2025-09-29 07:26:14', NULL),
(20, 'vaccination-test-68da34a14b77e', 'VAC_TEST_68da34a14b77f', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-09-29 07:26:25', '2025-09-29 07:26:25', '2025-09-29 07:26:25', NULL),
(21, 'vaccination-test-68da358b609f8', 'VAC_TEST_68da358b609f9', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-09-29 07:30:19', '2025-09-29 07:30:19', '2025-09-29 07:30:19', NULL),
(22, 'vaccination-test-68de78c7653d4', 'VAC_TEST_68de78c7653d5', 1, 1, 1, 1, 1, 32, NULL, 1, '2025-10-02 13:06:15', '2025-10-02 13:06:15', '2025-10-02 13:06:15', NULL),
(23, 'vaccination-test-1759486490', 'VACC_TEST_1759486490', 1, 1, 1, 1001, NULL, 1, NULL, 1, '2025-10-03 10:14:50', '2025-10-03 10:14:50', '2025-10-03 10:14:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_doses`
--

CREATE TABLE `vaccination_doses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `vaccination_id` bigint(20) UNSIGNED NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `quantity_administered` varchar(255) NOT NULL,
  `administration_route` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `vaccination_date` datetime NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `next_administration_date` date NOT NULL,
  `vet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `sync_status` enum('pending','synced','conflict','deleted') NOT NULL DEFAULT 'pending',
  `device_id` varchar(255) DEFAULT NULL,
  `original_created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccination_doses`
--

INSERT INTO `vaccination_doses` (`id`, `uuid`, `vaccination_id`, `batch_number`, `quantity_administered`, `administration_route`, `rate`, `vaccination_date`, `remarks`, `next_administration_date`, `vet_id`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `sync_status`, `device_id`, `original_created_at`, `deleted_at`) VALUES
(1, NULL, 1, 'BA-123-98', '14', '1', '6.7', '2024-01-01 00:00:00', 'rEMARKS', '2024-02-01', NULL, 6, NULL, 1, '2024-09-25 02:27:50', '2024-09-25 02:27:50', NULL, 'pending', NULL, NULL, NULL),
(2, NULL, 2, 'BA-123-98', '14', '1', '6.7', '2024-01-01 00:00:00', 'rEMARKS', '2025-01-01', NULL, 6, NULL, 1, '2024-09-25 02:59:33', '2024-09-25 02:59:33', NULL, 'pending', NULL, NULL, NULL),
(3, NULL, 3, 'B101', '12', '1', '6', '2024-10-07 00:00:00', 'none', '2024-11-07', NULL, 25, NULL, 1, '2024-10-07 07:51:42', '2024-10-07 07:51:42', NULL, 'pending', NULL, NULL, NULL),
(4, NULL, 4, 'B1014', '6', '1', '6', '2024-10-01 00:00:00', 'none', '2024-11-01', NULL, 25, NULL, 1, '2024-10-08 05:43:19', '2024-10-08 05:43:19', NULL, 'pending', NULL, NULL, NULL),
(5, NULL, 5, 'B1014', '6', '1', '6', '2024-10-01 00:00:00', 'none', '2024-11-01', NULL, 25, NULL, 1, '2024-10-08 05:43:20', '2024-10-08 05:43:20', NULL, 'pending', NULL, NULL, NULL),
(6, NULL, 6, 'BATCH-001', '5ml', 'Intramuscular', '1 dose', '2025-09-21 00:00:00', 'First vaccination', '2025-12-21', NULL, 1, NULL, 1, '2025-09-21 08:41:04', '2025-09-21 08:41:04', NULL, 'pending', NULL, NULL, NULL),
(7, NULL, 7, 'BATCH-1-001', '5ml', 'Intramuscular', '1 dose', '2025-09-21 00:00:00', 'Vaccination with batch from vaccine_batches table', '2025-12-21', NULL, 1, NULL, 1, '2025-09-21 09:00:47', '2025-09-21 09:00:47', NULL, 'pending', NULL, NULL, NULL),
(8, NULL, 8, 'BATCH-1-001', '5ml', 'Intramuscular', '1 dose', '2025-09-21 00:00:00', 'Vaccination with auto batch name from vaccine_batches', '2025-12-21', NULL, 1, NULL, 1, '2025-09-21 09:14:36', '2025-09-21 09:14:36', NULL, 'pending', NULL, NULL, NULL),
(9, NULL, 9, 'BATCH-1-001', '10', '2', '6', '2025-09-21 00:00:00', 'good', '2025-09-25', NULL, 32, NULL, 1, '2025-09-21 09:29:14', '2025-09-21 09:29:14', NULL, 'pending', NULL, NULL, NULL),
(10, NULL, 10, 'BATCH-1-001', '39', '2', '6', '2025-09-22 00:00:00', 'ok ok', '2025-09-30', NULL, 32, NULL, 1, '2025-09-22 11:15:38', '2025-09-22 11:15:38', NULL, 'pending', NULL, NULL, NULL),
(11, NULL, 11, 'BATCH-2-001', '22', '3', '10', '2025-09-22 00:00:00', 'next again', '2025-09-30', NULL, 32, NULL, 1, '2025-09-22 11:24:21', '2025-09-22 11:24:21', NULL, 'pending', NULL, NULL, NULL),
(12, NULL, 12, 'B101', '345', '1', '6', '2025-09-23 00:00:00', 'check again', '2025-09-27', NULL, 32, NULL, 1, '2025-09-23 10:04:55', '2025-09-23 10:04:55', NULL, 'pending', NULL, NULL, NULL),
(13, NULL, 13, 'BATCH-001', '2', '1', '1', '2025-01-22 00:00:00', 'Test vaccination', '2025-02-22', NULL, 32, NULL, 1, '2025-09-23 21:00:52', '2025-09-23 21:00:52', NULL, 'pending', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_statuses`
--

CREATE TABLE `vaccination_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccines`
--

CREATE TABLE `vaccines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lot` varchar(255) DEFAULT NULL,
  `formulation_type` enum('live-attenuated','inactivated') DEFAULT NULL,
  `dose` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vaccine_status_id` bigint(20) NOT NULL,
  `vaccine_type_id` bigint(20) NOT NULL,
  `vaccine_schedule_id` bigint(20) NOT NULL,
  `farm_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccines`
--

INSERT INTO `vaccines` (`id`, `uuid`, `name`, `lot`, `formulation_type`, `dose`, `created_by`, `updated_by`, `created_at`, `updated_at`, `vaccine_status_id`, `vaccine_type_id`, `vaccine_schedule_id`, `farm_id`) VALUES
(1, 'b3289f0b-b119-4b46-b819-1d7c4e2f8067', 'FMD Vaccine', 'FMD-2025-001', 'inactivated', '2ml', 1, NULL, '2025-09-21 08:44:15', '2025-09-21 08:44:15', 1, 1, 1, 21),
(2, 'bf6d29c9-c0fe-42b2-8aab-f23b8271822f', 'Anthrax Vaccine', 'ANT-2025-001', 'live-attenuated', '1ml', 1, NULL, '2025-09-21 08:44:15', '2025-09-21 08:44:15', 1, 1, 1, 21),
(3, '5bbfba1c-915f-4f70-954c-06bdfe7083ca', 'Test Vaccine', 'TEST001', 'live-attenuated', '1ml', 1, NULL, '2025-10-03 13:28:14', '2025-10-03 13:28:14', 1, 1, 1, 1),
(4, 'test-vaccine-uuid-1759502303', 'Test Vaccine for Deletion', 'LOT1759502303', 'live-attenuated', '5ml', 1, NULL, '2025-10-03 14:38:23', '2025-10-03 14:38:23', 1, 1, 1, 1),
(5, 'test-vaccine-uuid-1759502319', 'Test Vaccine for Deletion', 'LOT1759502319', 'live-attenuated', '5ml', 1, NULL, '2025-10-03 14:38:39', '2025-10-03 14:38:39', 1, 1, 1, 1),
(6, 'test-vaccine-uuid-1759502340', 'Test Vaccine for Deletion', 'LOT1759502340', 'live-attenuated', '5ml', 1, NULL, '2025-10-03 14:39:00', '2025-10-03 14:39:00', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_batches`
--

CREATE TABLE `vaccine_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vaccine_id` bigint(20) NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `quantity` double NOT NULL,
  `quantity_uom_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `expiry_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccine_batches`
--

INSERT INTO `vaccine_batches` (`id`, `vaccine_id`, `batch_number`, `quantity`, `quantity_uom_id`, `created_by`, `expiry_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'BATCH-1-001', 100, 1, 1, '2026-12-31 00:00:00', '2025-09-21 08:56:54', '2025-09-21 08:56:54'),
(2, 2, 'BATCH-2-001', 100, 1, 1, '2026-12-31 00:00:00', '2025-09-21 08:56:54', '2025-09-21 08:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_diseases`
--

CREATE TABLE `vaccine_diseases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vaccine_id` bigint(20) NOT NULL,
  `disease_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccine_diseases`
--

INSERT INTO `vaccine_diseases` (`id`, `vaccine_id`, `disease_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(2, 1, 2, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(3, 1, 3, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(4, 1, 4, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(5, 1, 5, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(6, 2, 1, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(7, 2, 2, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(8, 2, 3, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(9, 2, 4, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07'),
(10, 2, 5, 1, '2025-09-21 09:04:07', '2025-09-21 09:04:07');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_dosages`
--

CREATE TABLE `vaccine_dosages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) NOT NULL,
  `vaccine_id` bigint(20) NOT NULL,
  `vaccine_dosage_constraint_id` bigint(20) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `amount_uom_id` bigint(20) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `complete_dosage_amount` varchar(255) NOT NULL,
  `administration_route_id` bigint(20) NOT NULL,
  `administration_rules` text NOT NULL,
  `next_administration_date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_dosage_constraints`
--

CREATE TABLE `vaccine_dosage_constraints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `livestock_gender` varchar(255) DEFAULT NULL,
  `livestock_stage` varchar(255) DEFAULT NULL,
  `livestock_status` varchar(255) DEFAULT NULL,
  `template_string` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_officer_batches`
--

CREATE TABLE `vaccine_officer_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vaccine_batch_id` bigint(20) NOT NULL,
  `officer_id` bigint(20) NOT NULL,
  `quantity` double NOT NULL,
  `quantity_uom_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_schedules`
--

CREATE TABLE `vaccine_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccine_schedules`
--

INSERT INTO `vaccine_schedules` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Regular', 'orange', '2025-10-02 12:25:53', '2025-10-02 12:25:53');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_statuses`
--

CREATE TABLE `vaccine_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccine_statuses`
--

INSERT INTO `vaccine_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', 'green', '2025-10-02 12:25:53', '2025-10-02 12:25:53');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_types`
--

CREATE TABLE `vaccine_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccine_types`
--

INSERT INTO `vaccine_types` (`id`, `created_at`, `updated_at`, `name`, `color`) VALUES
(1, '2025-10-02 12:25:53', '2025-10-02 12:25:53', 'Standard', 'blue');

-- --------------------------------------------------------

--
-- Table structure for table `vets`
--

CREATE TABLE `vets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registration_no` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_1` varchar(255) NOT NULL,
  `phone_2` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `medical_licence_no` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `identity_card_type_id` bigint(20) UNSIGNED NOT NULL,
  `identity_number` varchar(255) DEFAULT NULL,
  `school_level_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT 1,
  `region_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vet_attachments`
--

CREATE TABLE `vet_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vet_id` bigint(20) UNSIGNED NOT NULL,
  `attachment_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vet_farms`
--

CREATE TABLE `vet_farms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vet_id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `villages`
--

CREATE TABLE `villages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `ward_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wardID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(1, '3483', 'Aghondi', 66, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, '1', 'Akheri', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, '131', 'Alailelai', 98, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(4, '132', 'Alaitolei', 98, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(5, '1226', 'Aleni', 104, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(6, '4022', 'Amani', 88, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(7, '4159', 'Amani', 75, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(8, '3082', 'Amani Makoro', 70, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(9, '2', 'Ambureni', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(10, '133', 'Arash', 98, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(11, '1515', 'Arri', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(12, '188', 'ARUSHA', 2, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(13, '1153', 'Arusha Chini', 83, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(14, '989', 'Asante Nyerere', 34, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(15, '1516', 'Ayalagaya', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(16, '1604', 'Ayamaami', 71, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(17, '1605', 'Ayamohe', 71, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(18, '1517', 'Ayasanda', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(19, '254', 'Azimio', 124, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(20, '1518', 'Babati', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(21, '291', 'Babayu', 5, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(22, '349', 'Babayu', 13, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(23, '3949', 'Baga', 60, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(24, '3909', 'Bagamoyo', 52, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(25, '1974', 'Bagamoyo', 108, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(26, '1519', 'Bagara', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(27, '292', 'Bahi', 5, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(28, '721', 'Bakoba', 8, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(29, '1548', 'Balang\'dalalu', 18, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(30, '2937', 'Baleni', 61, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(31, '1658', 'Balili', 9, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(32, '4198', 'Bambi', 35, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(33, '4179', 'Bandakuu', 32, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(34, '1254', 'Bangalala', 109, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(35, '3', 'Bangata', 1, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(36, '1044', 'Bangwe', 40, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(37, '1095', 'Bangwe', 40, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(38, '2735', 'Bangwe', 110, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(39, '54', 'Baraa', 2, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(40, '159', 'Baraa', 2, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(41, '1746', 'Baraki', 105, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(42, '79', 'Baray', 31, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(43, '1606', 'Bargish', 71, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(44, '1381', 'Barikiwa', 58, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(45, '1079', 'Basanza', 130, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(46, '1607', 'Bashay', 71, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(47, '1520', 'Bashnet', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(48, '1549', 'Bassodesh', 18, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(49, '1550', 'Bassotu', 18, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(50, '722', 'Behendangabo', 8, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(51, '1255', 'Bendera', 109, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(52, '2138', 'Berega', 44, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(53, '467', 'Berege', 85, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(54, '416', 'Bereko', 50, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(55, '2945', 'Beta', 79, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(56, '3083', 'Bethrehemu', 70, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(57, '2299', 'Bigwa', 82, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(58, '2188', 'Bigwa', 82, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(59, '704', 'Biharamulo Mjini', 6, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(60, '956', 'Biharu', 7, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(61, '831', 'Biirabo', 89, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(62, '723', 'Bilele', 8, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(63, '1802', 'Binagi', 123, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(64, '1288', 'Biriri', 113, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(65, '2178', 'Biro', 65, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(66, '2179', 'Biro', 65, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(67, '832', 'Bisheke', 89, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(68, '705', 'Bisibo', 6, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(69, '1691', 'Bisumwa', 10, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(70, '1045', 'Bitale', 40, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(71, '1096', 'Bitale', 40, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(72, '1025', 'Bitare', 38, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(73, '2736', 'Bitoto', 110, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(74, '1026', 'Biturana', 38, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(75, '1521', 'Boay', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(76, '2920', 'Boga', 47, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(77, '2876', 'Bokomnemela', 36, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(78, '3888', 'Bokwa', 41, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(79, '417', 'Bolisa', 50, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(80, '617', 'Boma', 87, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(81, '4000', 'Boma', 77, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(82, '2300', 'Boma', 82, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(83, '1401', 'Boma', 93, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(84, '2189', 'Boma', 82, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(85, '593', 'Bomalang\'ombe', 42, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(86, '1154', 'Bomambuzi', 83, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(87, '1136', 'Bomang\'ombe', 17, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(88, '1803', 'Bomani', 123, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(89, '3171', 'Bombambili', 117, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(90, '1256', 'Bombo', 109, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(91, '1910', 'Bonde la Songwe', 69, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(92, '2016', 'Bonde la Songwe', 69, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(93, '1137', 'Bondeni', 17, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(94, '1155', 'Bondeni', 83, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(95, '1857', 'Bondeni', 55, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(96, '1522', 'Bonga', 3, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(97, '189', 'Bonyokwa', 22, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(98, '2817', 'Bopwe', 132, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(99, '4001', 'Bosha', 77, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(100, '3314', 'Bubiki', 48, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(101, '4133', 'Bububu', 62, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(102, '3678', 'Budushi', 102, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(103, '990', 'Bugaga', 34, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(104, '811', 'Bugandika', 73, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(105, '2635', 'Bugando', 54, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(106, '833', 'Buganguzi', 89, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(107, '787', 'Bugara', 56, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(108, '874', 'Bugarama', 97, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(109, '3256', 'Bugarama', 26, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(110, '764', 'Bugene', 30, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(111, '80', 'Buger', 31, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(112, '2616', 'Bugogwa', 23, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(113, '1709', 'Bugoji', 90, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(114, '788', 'Bugomora', 56, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(115, '2737', 'Bugoro', 110, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(116, '812', 'Bugorora', 73, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(117, '190', 'Buguruni', 22, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(118, '1710', 'Bugwema', 90, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(119, '2738', 'Buhama', 110, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(120, '1046', 'Buhanda', 40, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(121, '1097', 'Buhanda', 40, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(122, '834', 'Buhangaza', 89, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(123, '1711', 'Buhare', 90, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(124, '1692', 'Buhemba', 10, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(125, '724', 'Buhembe', 8, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(126, '957', 'Buhigwe', 7, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(127, '2690', 'Buhingo', 74, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(128, '1080', 'Buhingu', 130, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(129, '2717', 'Buhongwa', 100, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(130, '991', 'Buhoro', 34, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(131, '2665', 'Buhumbi', 64, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(132, '2691', 'Buhunda', 74, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(133, '313', 'Buigiri', 12, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(134, '2666', 'Bujashi', 64, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(135, '1975', 'Bujela', 108, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(136, '1858', 'Bujonde', 55, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(137, '2667', 'Bujora', 64, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(138, '725', 'Bujugo', 8, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(139, '1693', 'Bukabwa', 10, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(140, '2782', 'Bukanda', 127, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(141, '2668', 'Bukandwe', 64, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(142, '3343', 'Bukene', 112, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(143, '3386', 'Bukene', 112, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(144, '3679', 'Bukene', 102, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(145, '2783', 'Bukiko', 127, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(146, '1712', 'Bukima', 90, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(147, '2784', 'Bukindo', 127, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(148, '875', 'Bukiriro', 97, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(149, '3615', 'Bukoko', 20, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(150, '2739', 'Bukokwa', 110, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(151, '3257', 'Bukomela', 26, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(152, '2785', 'Bukongo', 127, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(153, '958', 'Bukuba', 7, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(154, '3791', 'Bukumbi', 131, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(155, '1713', 'Bukumi', 90, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(156, '2786', 'Bukungu', 127, '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(157, '1747', 'Bukura', 105, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(158, '1748', 'Bukwe', 105, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(159, '939', 'Bulamata', 122, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(160, '2692', 'Bulemeji', 74, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(161, '3258', 'Bulige', 26, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(162, '1714', 'Bulinga', 90, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(163, '3259', 'Bulungwa', 26, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(164, '1976', 'Bulyaga', 108, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(165, '2740', 'Bulyaheke', 110, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(166, '835', 'Bulyakashaju', 89, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(167, '3260', 'Bulyan\'hulu', 26, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(168, '836', 'Bumbire', 89, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(169, '3950', 'Bumbuli', 60, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(170, '418', 'Bumbuta', 50, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(171, '1804', 'Bumera', 123, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(172, '618', 'Bumilayinga', 87, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(173, '3315', 'Bunambiyu', 48, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(174, '1659', 'Bunda Mjini', 9, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(175, '1660', 'Bunda Stoo', 9, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(176, '2248', 'Bunduki', 91, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(177, '4199', 'Bungi', 35, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(178, '3910', 'Bungu', 52, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(179, '2190', 'Bungu', 82, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(180, '2301', 'Bungu', 82, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(181, '2904', 'Bungu', 37, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(182, '2636', 'Bungulwa', 54, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(183, '234', 'Bunju', 46, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(184, '1027', 'Bunyambo', 38, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(185, '2637', 'Bupamwa', 54, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(186, '2741', 'Bupandwa', 110, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(187, '3316', 'Bupigi', 48, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(188, '2946', 'Bupu', 79, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(189, '837', 'Bureza', 89, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(190, '1694', 'Buruma', 10, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(191, '838', 'Burungura', 89, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(192, '1028', 'Busagara', 38, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(193, '1859', 'Busale', 55, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(194, '1715', 'Busambara', 90, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(195, '3261', 'Busangi', 26, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(196, '3317', 'Busangwa', 48, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(197, '1772', 'Busawe', 111, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(198, '1695', 'Busegwe', 10, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(199, '4059', 'Bushiri', 103, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(200, '419', 'Busi', 50, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(201, '789', 'Businde', 56, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(202, '1047', 'Businde', 40, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(203, '1098', 'Businde', 40, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(204, '2742', 'Busisi', 110, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(205, '3262', 'Busoka', 26, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(206, '2693', 'Busongo', 74, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(207, '1029', 'Busunzu', 38, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(208, '1696', 'Buswahili', 10, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(209, '2617', 'Buswelu', 23, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(210, '726', 'Butelankuzi', 8, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(211, '1697', 'Butiama', 10, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(212, '1661', 'Butimba', 9, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(213, '2718', 'Butimba', 100, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(214, '1698', 'Butuguri', 10, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(215, '2743', 'Buyagu', 110, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(216, '813', 'Buyango', 73, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(217, '191', 'Buyuni', 22, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(218, '255', 'Buza', 124, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(219, '1048', 'Buzebazeba', 40, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(220, '1099', 'Buzebazeba', 40, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(221, '2744', 'Buzilasoga', 110, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(222, '2618', 'Buzuruga', 23, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(223, '1581', 'Bwagamoyo', 49, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(224, '2191', 'Bwakira chini', 82, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(225, '2302', 'Bwakira chini', 82, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(226, '2303', 'Bwakira juu', 82, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(227, '2192', 'Bwakira juu', 82, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(228, '1257', 'Bwambo', 109, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(229, '814', 'Bwanjai', 73, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(230, '1716', 'Bwasi', 90, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(231, '1582', 'Bwawani', 49, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(232, '1837', 'Bwawani', 14, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(233, '4', 'Bwawani', 1, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(234, '4023', 'Bwembwera', 88, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(235, '4060', 'Bweni', 103, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(236, '765', 'Bweranyange', 30, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(237, '1717', 'Bweri', 90, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(238, '2850', 'Bwilingu', 4, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(239, '1699', 'Bwiregi', 10, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(240, '2787', 'Bwiro', 127, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(241, '2788', 'Bwisya', 127, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(242, '4002', 'Bwiti', 77, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(243, '4073', 'Central', 121, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(244, '4100', 'Central', 121, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(245, '4180', 'Chaani', 32, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(246, '2669', 'Chabula', 64, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(247, '3616', 'Chabutwa', 20, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(248, '3724', 'Chabutwa', 114, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(249, '2085', 'Chagongwe', 16, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(250, '375', 'Chahwa', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(251, '500', 'Chahwa', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(252, '2086', 'Chakwale', 16, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(253, '1227', 'Chala', 104, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(254, '3007', 'Chala', 99, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(255, '1838', 'Chalangwa', 14, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(256, '293', 'Chali', 5, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(257, '3344', 'Chamaguha', 112, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(258, '3387', 'Chamaguha', 112, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(259, '897', 'Chamalendi', 80, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(260, '256', 'Chamazi', 124, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(261, '3263', 'Chambo', 26, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(262, '445', 'Chamkoroma', 51, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(263, '314', 'Chamwino', 12, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(264, '376', 'Chamwino', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(265, '501', 'Chamwino', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(266, '2304', 'Chamwino', 82, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(267, '2193', 'Chamwino', 82, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(268, '350', 'Chandama', 13, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(269, '257', 'Chang\'ombe', 124, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(270, '377', 'Chang\'ombe', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(271, '502', 'Chang\'ombe', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(272, '420', 'Changaa', 50, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(273, '619', 'Changarawe', 87, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(274, '192', 'Chanika', 22, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(275, '766', 'Chanika', 30, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(276, '3855', 'Chanika', 19, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(277, '2364', 'Chanikanguo', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(278, '2087', 'Chanjale', 16, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(279, '3035', 'Chanji', 118, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(280, '2139', 'Chanzuru', 44, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(281, '1583', 'Chapakazi', 49, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(282, '258', 'Charambe', 124, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(283, '2523', 'Chaume', 120, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(284, '2412', 'Chawi', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(285, '2555', 'Chawi', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(286, '4200', 'Cheju', 35, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(287, '3911', 'Chekelei', 52, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(288, '3264', 'Chela', 26, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(289, '351', 'Chemba', 13, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(290, '421', 'Chemchem', 50, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(291, '2970', 'Chemchem', 107, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(292, '3744', 'Chemchem', 119, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(293, '3821', 'Chemchem', 119, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(294, '3745', 'Cheyo', 119, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(295, '3822', 'Cheyo', 119, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(296, '3388', 'Chibe', 112, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(297, '3345', 'Chibe', 112, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(298, '294', 'Chibelela', 5, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(299, '315', 'Chiboli', 12, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(300, '1437', 'Chibula', 106, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(301, '1438', 'Chienjele', 106, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(302, '2745', 'Chifunfu', 110, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(303, '295', 'Chifutuka', 5, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(304, '2088', 'Chigela', 16, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(305, '378', 'Chigongwe', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(306, '503', 'Chigongwe', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(307, '2365', 'Chigugu', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(308, '379', 'Chihanga', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(309, '504', 'Chihanga', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(310, '2485', 'Chihangu', 96, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(311, '2366', 'Chikiropola', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(312, '296', 'Chikola', 5, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(313, '3484', 'Chikola', 66, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(314, '2413', 'Chikongola', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(315, '2524', 'Chikongola', 120, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(316, '2556', 'Chikongola', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(317, '1330', 'Chikonji', 57, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(318, '1459', 'Chikonji', 57, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(319, '2367', 'Chikukwe', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(320, '2368', 'Chikundi', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(321, '2369', 'Chikunja', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(322, '3485', 'Chikuyu', 66, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(323, '2486', 'Chilangala', 96, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(324, '2278', 'Chilombola', 128, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(325, '316', 'Chilonwa', 12, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(326, '1890', 'Chimala', 68, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(327, '2809', 'Chimba', 72, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(328, '2103', 'Ching\'anda', 43, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(329, '2525', 'Chingungwe', 120, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(330, '1439', 'Chinongwe', 106, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(331, '317', 'Chinugulu', 12, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(332, '1402', 'Chiola', 93, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(333, '297', 'Chipanga', 5, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(334, '468', 'Chipogoro', 85, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(335, '1331', 'Chiponda', 57, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(336, '1460', 'Chiponda', 57, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(337, '2468', 'Chipuputa', 95, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(338, '2104', 'Chisano', 43, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(339, '2105', 'Chita', 43, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(340, '446', 'Chitego', 51, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(341, '2487', 'Chitekete', 96, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(342, '469', 'Chitemo', 85, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(343, '1662', 'Chitengule', 9, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(344, '1403', 'Chiumbati Shuleni', 93, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(345, '2370', 'Chiungutwa', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(346, '2371', 'Chiwale', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(347, '3216', 'Chiwana', 125, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(348, '3151', 'Chiwanda', 101, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(349, '2372', 'Chiwata', 67, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(350, '447', 'Chiwe', 51, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(351, '2488', 'Chiwonga', 96, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(352, '1839', 'Chokaa', 14, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(353, '2839', 'Chokocho', 78, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(354, '2921', 'Chole', 47, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(355, '3617', 'Chomachankola', 20, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(356, '1258', 'Chome', 109, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(357, '1206', 'Chomvu', 92, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(358, '3265', 'Chona', 26, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(359, '4074', 'Chongoleani', 121, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(360, '4101', 'Chongoleani', 121, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(361, '767', 'Chonyonyo', 30, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(362, '4145', 'Chukwani', 63, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(363, '4075', 'Chumbageni', 121, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(364, '4102', 'Chumbageni', 121, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(365, '2971', 'Chumbi', 107, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(366, '4160', 'Chumbuni', 75, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(367, '1307', 'Chumo', 45, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(368, '2414', 'Chuno', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(369, '2557', 'Chuno', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(370, '470', 'Chunyu', 85, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(371, '1440', 'Chunyu', 106, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(372, '352', 'Churuku', 13, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(373, '4201', 'Chwaka', 35, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(374, '81', 'Daa', 31, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(375, '594', 'Dabaga', 42, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(376, '318', 'Dabalo', 12, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(377, '1523', 'Dabil', 3, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(378, '2249', 'Dakawa', 91, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(379, '353', 'Dalai', 13, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(380, '4003', 'Daluni', 77, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(381, '55', 'Daraja II', 2, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(382, '160', 'Daraja II', 2, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(383, '1524', 'Dareda', 3, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(384, '1608', 'Daudi', 71, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(385, '1551', 'Dawar', 18, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(386, '3389', 'Didia', 112, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(387, '3346', 'Didia', 112, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(388, '134', 'Digodigo', 98, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(389, '2415', 'Dihimba', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(390, '2558', 'Dihimba', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(391, '2905', 'Dimani', 37, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(392, '4146', 'Dimani', 63, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(393, '1609', 'Dinamu', 71, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(394, '3912', 'Dindira', 52, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(395, '2526', 'Dinduma', 120, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(396, '2416', 'Dinyecha', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(397, '2559', 'Dinyecha', 86, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(398, '2250', 'Diongoya', 91, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(399, '1552', 'Dirma', 18, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(400, '4004', 'Doda', 77, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(401, '2840', 'Dodo', 78, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(402, '546', 'DODOMA', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(403, '380', 'Dodoma Makulu', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(404, '505', 'Dodoma Makulu', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(405, '541', 'Dodoma Makulu', 15, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(406, '4134', 'Dole', 62, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(407, '2251', 'Doma', 91, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(408, '2947', 'Dondo', 79, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(409, '1584', 'Dongo', 49, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(410, '1610', 'Dongobesh', 71, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(411, '1289', 'Donyomurwak', 113, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(412, '1585', 'Dosidosi', 49, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(413, '4005', 'Duga', 77, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(414, '4076', 'Duga', 121, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(415, '4103', 'Duga', 121, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(416, '3951', 'Dule \"B\"', 60, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(417, '3952', 'Dule \'M\'', 60, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(418, '1553', 'Dumbeta', 18, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(419, '2140', 'Dumila', 44, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(420, '2851', 'Dunda', 4, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(421, '3435', 'Dung\'unyi', 21, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(422, '1525', 'Duru', 3, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(423, '2877', 'Dutumi', 36, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(424, '93', 'Eleng\'ata Dapash', 59, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(425, '56', 'Elerai', 2, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(426, '161', 'Elerai', 2, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(427, '1639', 'Emboreet', 115, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(428, '82', 'Endabashi', 31, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(429, '1554', 'Endagaw', 18, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(430, '1611', 'Endagikot', 71, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(431, '1612', 'Endahagichan', 71, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(432, '1526', 'Endakiso', 3, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(433, '83', 'Endamaghang', 31, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(434, '84', 'Endamarariek', 31, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(435, '1613', 'Endamilay', 71, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(436, '1555', 'Endasak', 18, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(437, '1556', 'Endasiwold', 18, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(438, '1640', 'Endiamutu', 115, '2024-09-21 20:19:41', '2024-09-21 20:19:41'),
(439, '1641', 'Endonyongijape', 115, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(440, '135', 'Enduleni', 98, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(441, '94', 'Engarenaibor', 59, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(442, '136', 'Engaresero', 98, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(443, '111', 'Engaruka', 81, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(444, '95', 'Engikaret', 59, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(445, '1586', 'Engusero', 49, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(446, '137', 'Engusero Sambu', 98, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(447, '57', 'Engutoto', 2, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(448, '112', 'Engutoto', 81, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(449, '162', 'Engutoto', 2, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(450, '1614', 'Eshkesh', 71, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(451, '113', 'Esilalei', 81, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(452, '1718', 'Etaro', 90, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(453, '2279', 'Euga', 128, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(454, '138', 'Eyasi', 98, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(455, '354', 'Farkwa', 13, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(456, '2694', 'Fella', 74, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(457, '1911', 'Forest', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(458, '2017', 'Forest', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(459, '3913', 'Foroforo', 52, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(460, '319', 'Fufu', 12, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(461, '4189', 'Fujoni', 33, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(462, '2638', 'Fukalo', 54, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(463, '2852', 'Fukayosi', 4, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(464, '3953', 'Funta', 60, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(465, '2089', 'Gairo', 16, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(466, '471', 'Galigali', 85, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(467, '1527', 'Gallapo', 3, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(468, '4181', 'Gamba', 32, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(469, '85', 'Ganako', 31, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(470, '1557', 'Ganana', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(471, '2818', 'Gando', 132, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(472, '547', 'Gangilonga', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(473, '653', 'Gangilonga', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(474, '1805', 'Ganyange', 123, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(475, '1290', 'Gararagua', 113, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(476, '1558', 'Garawja', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(477, '3954', 'Gare', 60, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(478, '1259', 'Gavao - saweni', 109, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(479, '1559', 'Gehandu', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(480, '1615', 'Gehandu', 71, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(481, '1773', 'Geitasamo', 111, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(482, '96', 'Gelai lumbwa', 59, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(483, '97', 'Gelai Meirugoi', 59, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(484, '1560', 'Gendabi', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(485, '4024', 'Genge', 88, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(486, '815', 'Gera', 73, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(487, '193', 'Gerezani', 22, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(488, '1561', 'Getanuwas', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(489, '1616', 'Geterer', 71, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(490, '1912', 'Ghana', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(491, '2018', 'Ghana', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(492, '1562', 'Gidahababieg', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(493, '1528', 'Gidas', 3, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(494, '1617', 'Gidhimu', 71, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(495, '1563', 'Gisambalang', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(496, '1564', 'Gitting', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(497, '277', 'Goba', 126, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(498, '472', 'Godegode', 85, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(499, '355', 'Goima', 13, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(500, '4006', 'Gombero', 77, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(501, '194', 'Gongolamboto', 22, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(502, '3746', 'Gongoni', 119, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(503, '3823', 'Gongoni', 119, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(504, '1749', 'Goribe', 105, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(505, '1806', 'Gorong\'a', 123, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(506, '3792', 'Goweko', 131, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(507, '839', 'Goziba', 89, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(508, '2695', 'Gulumungu', 74, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(509, '473', 'Gulwe', 85, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(510, '3515', 'Gumanga', 76, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(511, '3172', 'Gumbiro', 117, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(512, '1049', 'Gungu', 40, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(513, '1100', 'Gungu', 40, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(514, '1618', 'Gunyoda', 71, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(515, '1663', 'Guta', 9, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(516, '356', 'Gwandi', 13, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(517, '840', 'Gwanseli', 89, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(518, '976', 'Gwanumpu', 27, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(519, '977', 'Gwarama', 27, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(520, '2194', 'Gwata', 82, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(521, '2305', 'Gwata', 82, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(522, '2878', 'Gwata', 36, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(523, '1807', 'Gwitiryo', 123, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(524, '3914', 'Hale', 52, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(525, '727', 'Hamugembe', 8, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(526, '235', 'Hananasif', 46, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(527, '320', 'Handali', 12, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(528, '321', 'Haneti', 12, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(529, '3130', 'Hanga', 94, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(530, '422', 'Haubi', 50, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(531, '1619', 'Haydarer', 71, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(532, '1620', 'Haydom', 71, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(533, '381', 'Hazina', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(534, '506', 'Hazina', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(535, '1260', 'Hedaru', 109, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(536, '3486', 'Heka', 66, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(537, '2252', 'Hembeti', 91, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(538, '3955', 'Hemtoye', 60, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(539, '1081', 'Herembe', 130, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(540, '992', 'Heru Juu', 34, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(541, '993', 'Heru Ushingo', 34, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(542, '1565', 'Hidet', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(543, '2417', 'Hinju', 86, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(544, '2560', 'Hinju', 86, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(545, '1566', 'Hirbadaw', 18, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(546, '448', 'Hogoro', 51, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(547, '1228', 'Holili', 104, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(548, '382', 'Hombolo Bwawani', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(549, '507', 'Hombolo Bwawani', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(550, '383', 'Hombolo Makulu', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(551, '508', 'Hombolo Makulu', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(552, '2253', 'Homboza', 91, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(553, '423', 'Hondomairo', 50, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(554, '2639', 'Hungumalwa', 54, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(555, '1664', 'Hunyari', 9, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(556, '322', 'Huzi', 12, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(557, '3347', 'Ibadakuli', 112, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(558, '3390', 'Ibadakuli', 112, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(559, '3516', 'Ibaga', 76, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(560, '1860', 'Ibanda', 55, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(561, '3793', 'Ibelamilundi', 131, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(562, '1977', 'Ibighi', 108, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(563, '298', 'Ibihwa', 5, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(564, '912', 'Ibindi', 84, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(565, '3391', 'Ibinzamata', 112, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(566, '3348', 'Ibinzamata', 112, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(567, '3794', 'Ibiri', 131, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(568, '2746', 'Ibisabageni', 110, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(569, '2747', 'Ibondo', 110, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(570, '3618', 'Iborogelo', 20, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(571, '841', 'Ibuga', 89, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(572, '299', 'Ibugule', 5, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(573, '595', 'Ibumu', 42, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(574, '2619', 'Ibungilo', 23, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(575, '728', 'Ibwera', 8, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(576, '3650', 'Ichemba', 29, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(577, '3266', 'Idahina', 26, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(578, '596', 'Idete', 42, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(579, '620', 'Idete', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(580, '2106', 'Idete', 43, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(581, '2696', 'Idetemya', 74, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(582, '2090', 'Idibo', 16, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(583, '323', 'Idifu', 12, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(584, '548', 'Idodi', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(585, '654', 'Idodi', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(586, '3487', 'Idodyandole', 66, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(587, '1913', 'Iduda', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(588, '2019', 'Iduda', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(589, '3318', 'Idukilo', 48, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(590, '621', 'Idunda', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(591, '449', 'Iduo', 51, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(592, '2107', 'Ifakara', 43, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(593, '3747', 'Ifucha', 119, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(594, '3824', 'Ifucha', 119, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(595, '1719', 'Ifulifu', 90, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(596, '1840', 'Ifumbo', 14, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(597, '549', 'Ifunda', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(598, '655', 'Ifunda', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(599, '622', 'Ifwagi', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(600, '3319', 'Igaga', 48, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(601, '3651', 'Igagala', 29, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(602, '1914', 'Igale', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(603, '2020', 'Igale', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(604, '2789', 'Igalla', 127, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(605, '2748', 'Igalula', 110, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(606, '3795', 'Igalula', 131, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(607, '1082', 'Igalula', 130, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(608, '324', 'Igandu', 12, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(609, '1915', 'Iganjo', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(610, '2021', 'Iganjo', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(611, '1916', 'Iganzo', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(612, '2022', 'Iganzo', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(613, '1891', 'Igava', 68, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(614, '1917', 'Igawilo', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(615, '2023', 'Igawilo', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(616, '3436', 'Ighombwe', 21, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(617, '3725', 'Igigwa', 114, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(618, '2108', 'Igima', 43, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(619, '3437', 'Iglansoni', 21, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(620, '2719', 'Igogo', 100, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(621, '2697', 'Igokelo', 74, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(622, '2720', 'Igoma', 100, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(623, '1918', 'Igoma', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(624, '2024', 'Igoma', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(625, '623', 'Igombavanu', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(626, '3652', 'Igombemkulu', 29, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(627, '2640', 'Igongwa', 54, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(628, '3619', 'Igoweko', 20, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(629, '624', 'Igowole', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(630, '3517', 'Iguguno', 76, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(631, '2749', 'Igulumuki', 110, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(632, '3796', 'Igulungu', 131, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(633, '550', 'Igumbilo', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(634, '656', 'Igumbilo', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(635, '3267', 'Igunda', 26, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(636, '1665', 'Igundu', 9, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(637, '3620', 'Igunga', 20, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(638, '3621', 'Igurubi', 20, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(639, '1892', 'Igurusi', 68, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(640, '768', 'Igurwa', 30, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(641, '3680', 'Igusule', 102, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(642, '3268', 'Igwamanoni', 26, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(643, '3653', 'Igwisi', 29, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(644, '1893', 'Ihahi', 68, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(645, '625', 'Ihalimba', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(646, '769', 'Ihanda', 30, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(647, '1919', 'Ihango', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(648, '2025', 'Ihango', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(649, '3438', 'Ihanja', 21, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(650, '626', 'Ihanu', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(651, '770', 'Ihembe', 30, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(652, '597', 'Ihimbo', 42, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(653, '627', 'Ihowanza', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(654, '384', 'Ihumwa', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(655, '509', 'Ihumwa', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(656, '3681', 'Ijanija', 102, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(657, '1920', 'Ijombe', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(658, '2026', 'Ijombe', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(659, '729', 'Ijuganyondo', 8, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(660, '842', 'Ijumbi', 89, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(661, '1861', 'Ikama', 55, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(662, '3532', 'Ikhanoda', 116, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(663, '3571', 'Ikhanoda', 116, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(664, '1862', 'Ikimba', 55, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(665, '3269', 'Ikinda', 26, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(666, '3682', 'Ikindwa', 102, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(667, '940', 'Ikola', 122, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(668, '1863', 'Ikolo', 55, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(669, '1750', 'Ikoma', 105, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(670, '1774', 'Ikoma', 111, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(671, '325', 'Ikombolinga', 12, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(672, '3748', 'Ikomwa', 119, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(673, '3825', 'Ikomwa', 119, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(674, '843', 'Ikondo', 89, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(675, '3797', 'Ikongolo', 131, '2024-09-21 20:19:42', '2024-09-21 20:19:42');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(676, '628', 'Ikongosi', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(677, '326', 'Ikowa', 12, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(678, '3036', 'Ikozi', 118, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(679, '898', 'Ikuba', 80, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(680, '1921', 'Ikukwa', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(681, '2027', 'Ikukwa', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(682, '3439', 'Ikungi', 21, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(683, '1978', 'Ikuti', 108, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(684, '844', 'Ikuza', 89, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(685, '629', 'Ikweha', 87, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(686, '2972', 'Ikwiriri', 107, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(687, '1083', 'Ilagala', 130, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(688, '195', 'Ilala', 22, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(689, '551', 'Ilala', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(690, '657', 'Ilala', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(691, '2790', 'Ilangala', 127, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(692, '941', 'Ilangu', 122, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(693, '5', 'Ilboru', 1, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(694, '3654', 'Ilege', 29, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(695, '899', 'Ilela', 80, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(696, '3037', 'Ilemba', 118, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(697, '1922', 'Ilembo', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(698, '2028', 'Ilembo', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(699, '913', 'Ilembo', 84, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(700, '2620', 'Ilemela', 23, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(701, '1923', 'Ilemi', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(702, '2029', 'Ilemi', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(703, '2750', 'Iligamba', 110, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(704, '1979', 'Ilima', 108, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(705, '300', 'Ilindi', 5, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(706, '6', 'Ilkiding\'a', 1, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(707, '3392', 'Ilola', 112, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(708, '3349', 'Ilola', 112, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(709, '3798', 'Ilolangulu', 131, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(710, '552', 'Ilolompya', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(711, '658', 'Ilolompya', 25, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(712, '1924', 'Ilomba', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(713, '2030', 'Ilomba', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(714, '2280', 'Ilonga', 128, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(715, '3533', 'Ilongero', 116, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(716, '3572', 'Ilongero', 116, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(717, '98', 'Ilorienito', 59, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(718, '2698', 'Ilujamate', 74, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(719, '2641', 'Ilula', 54, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(720, '598', 'Ilula', 42, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(721, '3518', 'Ilunda', 76, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(722, '900', 'Ilunde', 80, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(723, '1925', 'Ilungu', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(724, '2031', 'Ilungu', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(725, '599', 'Image', 42, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(726, '3773', 'Imalamakoye', 129, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(727, '1894', 'Imalilo Songwe', 68, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(728, '7', 'Imbaseni', 1, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(729, '1621', 'Imboru', 71, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(730, '3350', 'Imesela', 112, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(731, '3393', 'Imesela', 112, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(732, '1926', 'Inyala', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(733, '2032', 'Inyala', 69, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(734, '901', 'Inyonga', 80, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(735, '385', 'Ipagala', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(736, '510', 'Ipagala', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(737, '386', 'Ipala', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(738, '511', 'Ipala', 15, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(739, '1864', 'Ipande', 55, '2024-09-21 20:19:42', '2024-09-21 20:19:42'),
(740, '3488', 'Ipande', 66, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(741, '3534', 'Ipembe', 116, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(742, '3573', 'Ipembe', 116, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(743, '474', 'Ipera', 85, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(744, '1865', 'Ipinda', 55, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(745, '3726', 'Ipole', 114, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(746, '1980', 'Iponjola', 108, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(747, '3749', 'Ipuli', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(748, '3826', 'Ipuli', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(749, '942', 'Ipwaga', 122, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(750, '1895', 'Ipwani', 68, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(751, '1866', 'Ipyana', 55, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(752, '2281', 'Iragua', 128, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(753, '1666', 'Iramba', 9, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(754, '2751', 'Irenza', 110, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(755, '703', 'IRINGA', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(756, '327', 'Iringa Mvumi', 12, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(757, '1720', 'Iringo', 90, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(758, '3440', 'Irisya', 21, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(759, '600', 'Irole', 42, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(760, '2791', 'Irugwa', 127, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(761, '3270', 'Isagehe', 26, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(762, '3683', 'Isagenhe', 102, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(763, '3271', 'Isaka', 26, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(764, '553', 'Isakalilo', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(765, '659', 'Isakalilo', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(766, '3622', 'Isakamaliwa', 20, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(767, '630', 'Isalavanu', 87, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(768, '3008', 'Isale', 99, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(769, '2721', 'Isamilo', 100, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(770, '2670', 'Isandula', 64, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(771, '1927', 'Isanga', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(772, '2033', 'Isanga', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(773, '1981', 'Isange', 108, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(774, '3684', 'Isanzu', 102, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(775, '3394', 'Iselamagazi', 112, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(776, '3351', 'Iselamagazi', 112, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(777, '2699', 'Isenengeja', 74, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(778, '943', 'Isengule', 122, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(779, '2642', 'Iseni', 54, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(780, '3750', 'Isevya', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(781, '3827', 'Isevya', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(782, '816', 'Ishozi', 73, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(783, '1567', 'Ishponga', 18, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(784, '817', 'Ishunju', 73, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(785, '3799', 'Isikizya', 131, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(786, '3800', 'Isila', 131, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(787, '790', 'Isingiro', 56, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(788, '2282', 'Isongo', 128, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(789, '1982', 'Isongole', 108, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(790, '3441', 'Isseke', 21, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(791, '3489', 'Isseke', 66, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(792, '1775', 'Issenye', 111, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(793, '3442', 'Issuna', 21, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(794, '3009', 'Isunta', 99, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(795, '1928', 'Isuto', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(796, '2034', 'Isuto', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(797, '1929', 'Isyesye', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(798, '2035', 'Isyesye', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(799, '1030', 'Itaba', 38, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(800, '1930', 'Itagano', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(801, '2036', 'Itagano', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(802, '1983', 'Itagata', 108, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(803, '3535', 'Itaja', 116, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(804, '3574', 'Itaja', 116, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(805, '2091', 'Italagwe', 16, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(806, '1896', 'Itamboleo', 68, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(807, '631', 'Itandula', 87, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(808, '424', 'Itaswi', 50, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(809, '1931', 'Itawa', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(810, '2037', 'Itawa', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(811, '1084', 'Itebula', 130, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(812, '791', 'Iteera', 56, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(813, '1932', 'Itende', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(814, '2038', 'Itende', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(815, '914', 'Itenka', 84, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(816, '1984', 'Itete', 108, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(817, '2180', 'Itete', 65, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(818, '3010', 'Itete', 99, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(819, '3751', 'Itetemia', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(820, '3828', 'Itetemia', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(821, '1841', 'Itewe', 14, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(822, '1933', 'Itewe', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(823, '2039', 'Itewe', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(824, '1934', 'Itezi', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(825, '2040', 'Itezi', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(826, '3490', 'Itigi Majengo', 66, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(827, '3491', 'Itigi Mjini', 66, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(828, '1935', 'Itiji', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(829, '2041', 'Itiji', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(830, '3320', 'Itilima', 48, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(831, '3685', 'Itilo', 102, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(832, '1808', 'Itiryo', 123, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(833, '328', 'Itiso', 12, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(834, '3686', 'Itobo', 102, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(835, '425', 'Itololo', 50, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(836, '3752', 'Itonjanda', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(837, '3829', 'Itonjanda', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(838, '1867', 'Itope', 55, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(839, '3623', 'Itumba', 20, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(840, '2671', 'Itumbili', 64, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(841, '3774', 'Itundu', 129, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(842, '3624', 'Itunduru', 20, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(843, '1868', 'Itunge', 55, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(844, '554', 'Itunundu', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(845, '660', 'Itunundu', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(846, '3395', 'Itwangi', 112, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(847, '3352', 'Itwangi', 112, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(848, '1291', 'Ivaeny', 113, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(849, '1936', 'Iwambi', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(850, '2042', 'Iwambi', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(851, '1937', 'Iwiji', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(852, '2043', 'Iwiji', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(853, '1938', 'Iwindi', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(854, '2044', 'Iwindi', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(855, '475', 'Iwondo', 85, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(856, '1939', 'Iyela', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(857, '2045', 'Iyela', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(858, '3272', 'Iyenze', 26, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(859, '2092', 'Iyogwe', 16, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(860, '387', 'Iyumbu', 15, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(861, '512', 'Iyumbu', 15, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(862, '3443', 'Iyumbu', 21, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(863, '1940', 'Iyunga', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(864, '2046', 'Iyunga', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(865, '1941', 'Iyunga Mapinduzi', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(866, '2047', 'Iyunga Mapinduzi', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(867, '555', 'Izazi', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(868, '661', 'Izazi', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(869, '3038', 'Izia', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(870, '845', 'Izigo', 89, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(871, '730', 'Izimbya', 8, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(872, '1942', 'Iziwa', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(873, '2048', 'Iziwa', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(874, '1943', 'Izyra', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(875, '2049', 'Izyra', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(876, '2819', 'Jadida', 132, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(877, '3889', 'Jaila', 41, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(878, '3217', 'Jakika', 125, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(879, '4206', 'Jambiani', 53, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(880, '1332', 'Jamhuri', 57, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(881, '1461', 'Jamhuri', 57, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(882, '3273', 'Jana', 26, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(883, '959', 'Janda', 7, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(884, '2879', 'Janga', 36, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(885, '357', 'Jangalo', 13, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(886, '196', 'Jangwani', 22, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(887, '2418', 'Jangwani', 86, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(888, '2561', 'Jangwani', 86, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(889, '2938', 'Jibondo', 61, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(890, '2373', 'Jida', 67, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(891, '2672', 'Jinjimili', 64, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(892, '1207', 'Jipe', 92, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(893, '4147', 'Jitimai', 63, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(894, '1568', 'Jorodom', 18, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(895, '2489', 'Julia', 96, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(896, '731', 'Kaagya', 8, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(897, '876', 'Kabanga', 97, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(898, '1667', 'Kabarimu', 9, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(899, '1668', 'Kabasa', 9, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(900, '2673', 'Kabila', 64, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(901, '3753', 'Kabila', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(902, '3830', 'Kabila', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(903, '706', 'Kabindi', 6, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(904, '846', 'Kabirizi', 89, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(905, '3856', 'Kabuku', 19, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(906, '3857', 'Kabuku ndani', 19, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(907, '1985', 'Kabula', 108, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(908, '944', 'Kabungu', 122, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(909, '3011', 'Kabwe', 99, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(910, '3039', 'Kaengesa', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(911, '2752', 'Kafunzo', 110, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(912, '2792', 'Kagera', 127, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(913, '1050', 'Kagera', 40, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(914, '1101', 'Kagera', 40, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(915, '994', 'Kagera Nkanda', 34, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(916, '1031', 'Kagezi', 38, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(917, '847', 'Kagoma', 89, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(918, '732', 'Kagondo', 8, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(919, '1051', 'Kagongo', 40, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(920, '1102', 'Kagongo', 40, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(921, '3274', 'Kagongwa', 26, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(922, '3084', 'Kagugu', 70, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(923, '2753', 'Kagunga', 110, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(924, '1052', 'Kagunga', 40, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(925, '1103', 'Kagunga', 40, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(926, '2793', 'Kagunguli', 127, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(927, '2621', 'Kahama', 23, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(928, '3275', 'Kahama Mjini', 26, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(929, '3687', 'Kahamanhalanga', 102, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(930, '2674', 'Kahangara', 64, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(931, '1156', 'Kahe Magharibi', 83, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(932, '1157', 'Kahe Mashariki', 83, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(933, '733', 'Kahororo', 8, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(934, '2754', 'Kahumulo', 110, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(935, '734', 'Kaibanja', 8, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(936, '1622', 'Kainam', 71, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(937, '792', 'Kaisho', 56, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(938, '960', 'Kajana', 7, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(939, '1869', 'Kajunjumele', 55, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(940, '793', 'Kakanja', 56, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(941, '2794', 'Kakerege', 127, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(942, '915', 'Kakese', 84, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(943, '139', 'Kakesio', 98, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(944, '3754', 'Kakola', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(945, '3831', 'Kakola', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(946, '978', 'Kakonko', 27, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(947, '2795', 'Kakukuru', 127, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(948, '818', 'Kakunyu', 73, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(949, '3012', 'Kala', 99, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(950, '3915', 'Kalalani', 52, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(951, '426', 'Kalamba', 50, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(952, '3040', 'Kalambanzite', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(953, '3492', 'Kalangali', 66, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(954, '2755', 'Kalebezo', 110, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(955, '995', 'Kalela', 34, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(956, '1261', 'Kalemawe', 109, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(957, '556', 'Kalenga', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(958, '662', 'Kalenga', 25, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(959, '2109', 'Kalengakelu', 43, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(960, '707', 'Kalenge', 6, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(961, '1053', 'Kalinzi', 40, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(962, '1104', 'Kalinzi', 40, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(963, '3655', 'Kaliua', 29, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(964, '1944', 'Kalobe', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(965, '2050', 'Kalobe', 69, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(966, '3801', 'Kalola', 131, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(967, '58', 'Kaloleni', 2, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(968, '163', 'Kaloleni', 2, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(969, '1158', 'Kaloleni', 83, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(970, '1587', 'Kaloleni', 49, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(971, '3218', 'Kalulu', 125, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(972, '3041', 'Kalumbaleza', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(973, '3755', 'Kalunde', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(974, '3832', 'Kalunde', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(975, '1085', 'Kalya', 130, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(976, '848', 'Kamachumu', 89, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(977, '771', 'Kamagambo', 30, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(978, '3085', 'Kambarage', 70, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(979, '3353', 'Kambarage', 112, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(980, '3396', 'Kambarage', 112, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(981, '1986', 'Kambasegela', 108, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(982, '1842', 'Kambikatoto', 14, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(983, '3656', 'Kamsekwa', 29, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(984, '902', 'Kamsisi', 80, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(985, '1700', 'Kamugegi', 10, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(986, '794', 'Kamuli', 56, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(987, '2469', 'Kamundi', 95, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(988, '1721', 'Kamunyonge', 90, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(989, '99', 'Kamwanga', 59, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(990, '2110', 'Kamwene', 43, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(991, '877', 'Kanazi', 97, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(992, '3042', 'Kanda', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(993, '1086', 'Kandaga', 130, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(994, '1308', 'Kandawale', 45, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(995, '2675', 'Kandawe', 64, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(996, '1987', 'Kandete', 108, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(997, '3858', 'Kang\'ata', 19, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(998, '2254', 'Kanga', 91, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(999, '2939', 'Kanga', 61, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1000, '2841', 'Kangani', 78, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1001, '708', 'Kaniha', 6, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1002, '916', 'KANOGE', 84, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1003, '3657', 'Kanoge', 29, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1004, '772', 'Kanoni', 30, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1005, '86', 'Kansay', 31, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1006, '735', 'Kanyangereko', 8, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1007, '2700', 'Kanyelele', 74, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1008, '3756', 'Kanyenye', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1009, '3833', 'Kanyenye', 119, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1010, '2984', 'Kanyezi', 28, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1011, '819', 'Kanyigo', 73, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1012, '979', 'Kanyonza', 27, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1013, '3043', 'Kaoze', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1014, '917', 'Kapalala', 84, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1015, '945', 'Kapalamsenga', 122, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1016, '3044', 'Kapenta', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1017, '3775', 'Kapilula', 129, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1018, '736', 'Karabagaine', 8, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1019, '849', 'Karambi', 89, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1020, '1159', 'Karanga', 83, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1021, '1292', 'Karansi', 113, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1022, '87', 'Karatu', 31, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1023, '946', 'Karema', 122, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1024, '197', 'Kariakoo', 22, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1025, '3688', 'Karitu', 102, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1026, '980', 'Kasanda', 27, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1027, '632', 'Kasanga', 87, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1028, '1843', 'Kasanga', 14, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1029, '2195', 'Kasanga', 82, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1030, '2306', 'Kasanga', 82, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1031, '2985', 'Kasanga', 28, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1032, '903', 'Kasansa', 80, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1033, '3045', 'Kasanzama', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1034, '947', 'Kasekese', 122, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1035, '3689', 'Kasela', 102, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1036, '3463', 'Kaselya', 24, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1037, '3046', 'Kasense', 118, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1038, '2756', 'Kasenyi', 110, '2024-09-21 20:19:43', '2024-09-21 20:19:43'),
(1039, '737', 'Kashai', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1040, '738', 'Kasharu', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1041, '850', 'Kasharunga', 89, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1042, '851', 'Kashasha', 89, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1043, '1293', 'Kashashi', 113, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1044, '918', 'Kashaulili', 84, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1045, '820', 'Kashenye', 73, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1046, '3658', 'Kashishi', 29, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1047, '3276', 'Kashishi', 26, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1048, '2141', 'Kasiki', 44, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1049, '1054', 'Kasimbu', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1050, '1105', 'Kasimbu', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1051, '1055', 'Kasingirima', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1052, '1106', 'Kasingirima', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1053, '2757', 'Kasisa', 110, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1054, '3776', 'Kasisi', 129, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1055, '919', 'Kasokola', 84, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1056, '2701', 'Kasololo', 74, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1057, '821', 'Kassambya', 73, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1058, '981', 'Kasuga', 27, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1059, '1669', 'Kasuguti', 9, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1060, '878', 'Kasulo', 97, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1061, '2758', 'Kasungamile', 110, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1062, '709', 'Katahoka', 6, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1063, '3047', 'Katandala', 118, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1064, '982', 'Katanga', 27, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1065, '1229', 'Katangara/Mrere', 104, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1066, '2986', 'Katazi', 28, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1067, '3013', 'Kate', 99, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1068, '739', 'Katerero', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1069, '1569', 'Katesh', 18, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1070, '2987', 'Katete', 28, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1071, '59', 'Kati', 2, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1072, '164', 'Kati', 2, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1073, '2111', 'Katindiuka', 43, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1074, '852', 'Katoke', 89, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1075, '740', 'Katoma', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1076, '741', 'Katoro', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1077, '1056', 'Katubuka', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1078, '1107', 'Katubuka', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1079, '948', 'Katuma', 122, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1080, '920', 'Katumba', 84, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1081, '1870', 'Katumbasongwe', 55, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1082, '2759', 'Katunguru', 110, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1083, '2760', 'Katwe', 110, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1084, '2307', 'Kauzeni', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1085, '2196', 'Kauzeni', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1086, '921', 'Kawajense', 84, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1087, '2880', 'Kawawa', 36, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1088, '236', 'Kawe', 46, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1089, '2622', 'Kawekamo', 23, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1090, '1988', 'Kawetele', 108, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1091, '773', 'Kayanga', 30, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1092, '2623', 'Kayenze', 23, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1093, '3659', 'Kazaroho', 29, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1094, '922', 'Kazima', 84, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1095, '2922', 'Kazimzumbwi', 47, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1096, '2761', 'Kazunzu', 110, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1097, '1087', 'Kazuramimba', 130, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1098, '1776', 'Kebanchabancha', 111, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1099, '427', 'Keikei', 50, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1100, '259', 'Keko', 124, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1101, '1230', 'Kelamfua/Mokala', 104, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1102, '1809', 'Kemambo', 123, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1103, '742', 'Kemondo', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1104, '2842', 'Kendwa', 78, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1105, '1810', 'Kenyamanyori', 123, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1106, '1777', 'Kenyamonta', 111, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1107, '853', 'Kerebe', 89, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1108, '2853', 'Kerege', 4, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1109, '3916', 'Kerenge', 52, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1110, '2283', 'Ketaketa', 128, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1111, '1670', 'Ketare', 9, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1112, '1811', 'Ketare', 123, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1113, '100', 'Ketumbeine', 59, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1114, '879', 'Keza', 97, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1115, '1138', 'KIA', 17, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1116, '4135', 'Kianga', 62, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1117, '1382', 'Kiangara', 58, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1118, '225', 'Kibada', 39, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1119, '2881', 'Kibaha', 36, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1120, '450', 'Kibaigwa', 51, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1121, '476', 'Kibakwe', 85, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1122, '278', 'Kibamba', 126, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1123, '961', 'Kibande', 7, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1124, '854', 'Kibanga', 89, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1125, '904', 'Kibaoni', 80, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1126, '2112', 'Kibaoni', 43, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1127, '1671', 'Kibara', 9, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1128, '795', 'Kibare', 56, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1129, '1812', 'Kibasuka', 123, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1130, '1309', 'Kibata', 45, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1131, '2255', 'Kibati', 91, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1132, '1588', 'Kibaya', 49, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1133, '2093', 'Kibedya', 16, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1134, '633', 'Kibengu', 87, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1135, '2113', 'Kiberege', 43, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1136, '743', 'Kibeta', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1137, '880', 'Kibimba', 97, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1138, '2854', 'Kibindu', 4, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1139, '796', 'Kibingo', 56, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1140, '3890', 'Kibirashi', 41, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1141, '744', 'Kibirizi', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1142, '1057', 'Kibirizi', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1143, '1108', 'Kibirizi', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1144, '2906', 'Kibiti', 37, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1145, '881', 'Kibogora', 97, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1146, '2308', 'Kibogwa', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1147, '2197', 'Kibogwa', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1148, '4202', 'Kiboje', 35, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1149, '2829', 'Kibokoni', 11, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1150, '260', 'Kibondemaji', 124, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1151, '4148', 'Kibondeni', 63, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1152, '774', 'Kibondo', 30, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1153, '1032', 'Kibondo Mjini', 38, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1154, '1160', 'Kiborloni', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1155, '1161', 'Kibosho Kati', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1156, '1162', 'Kibosho Kirima', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1157, '1163', 'Kibosho Magharibi', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1158, '1164', 'Kibosho Mashariki', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1159, '1165', 'Kibosho Okaoni', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1160, '2198', 'Kibuko', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1161, '2309', 'Kibuko', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1162, '2310', 'Kibungo', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1163, '2199', 'Kibungo', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1164, '261', 'Kiburugwa', 124, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1165, '2923', 'Kibuta', 47, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1166, '1383', 'Kibutuka', 58, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1167, '962', 'Kibwigwa', 7, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1168, '2200', 'Kichangani', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1169, '2284', 'Kichangani', 128, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1170, '2311', 'Kichangani', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1171, '4025', 'Kicheba', 88, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1172, '1384', 'Kichonda', 58, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1173, '1058', 'Kidahwe', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1174, '1109', 'Kidahwe', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1175, '3464', 'Kidaru', 24, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1176, '4136', 'Kidatu', 62, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1177, '2114', 'Kidatu', 43, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1178, '3859', 'Kideleko', 19, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1179, '2142', 'Kidete', 44, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1180, '2143', 'Kidodi', 44, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1181, '3219', 'Kidodoma', 125, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1182, '358', 'Kidoka', 13, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1183, '4182', 'Kidombo', 32, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1184, '3757', 'Kidongochekundu', 119, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1185, '3834', 'Kidongochekundu', 119, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1186, '2312', 'Kidugalo', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1187, '2201', 'Kidugalo', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1188, '2940', 'Kiegeani', 61, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1189, '1404', 'Kiegei', 93, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1190, '1208', 'Kifula', 92, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1191, '226', 'Kigamboni', 39, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1192, '996', 'Kigembe', 34, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1193, '1722', 'Kigera', 90, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1194, '1209', 'Kighare', 92, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1195, '237', 'Kigogo', 46, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1196, '1059', 'Kigoma', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1197, '1110', 'Kigoma', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1198, '1130', 'Kigoma', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1199, '1135', 'KIGOMA', 40, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1200, '4026', 'Kigombe', 88, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1201, '997', 'Kigondo', 34, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1202, '4007', 'Kigongoi Magharibi', 77, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1203, '4008', 'Kigongoi Mashariki', 77, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1204, '1210', 'Kigonigoni', 92, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1205, '3086', 'Kigonsera', 70, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1206, '1751', 'Kigunga', 105, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1207, '3802', 'Kigwa', 131, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1208, '301', 'Kigwe', 5, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1209, '3152', 'Kihagara', 101, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1210, '557', 'Kihanga', 25, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1211, '663', 'Kihanga', 25, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1212, '775', 'Kihanga', 30, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1213, '3087', 'Kihangi Mahuka', 70, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1214, '558', 'Kihesa', 25, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1215, '664', 'Kihesa', 25, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1216, '4137', 'Kihinani', 62, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1217, '2202', 'Kihonda', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1218, '2313', 'Kihonda', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1219, '2314', 'Kihonda Maghorofani', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1220, '2203', 'Kihonda Maghorofani', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1221, '559', 'Kihorogota', 25, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1222, '665', 'Kihorogota', 25, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1223, '3088', 'Kihungu', 70, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1224, '1262', 'Kihurio', 109, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1225, '262', 'Kijichi', 124, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1226, '2702', 'Kijima', 74, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1227, '4183', 'Kijini', 32, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1228, '238', 'Kijitonyama', 46, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1229, '4149', 'Kijitoupele', 63, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1230, '3536', 'Kijota', 116, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1231, '3575', 'Kijota', 116, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1232, '1589', 'Kijungu', 49, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1233, '8', 'Kikatiti', 1, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1234, '2256', 'Kikeo', 91, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1235, '3519', 'Kikhonda', 76, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1236, '428', 'Kikilo', 50, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1237, '3444', 'Kikio', 21, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1238, '1310', 'Kikole', 45, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1239, '3089', 'Kikolo', 70, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1240, '388', 'Kikombo', 15, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1241, '513', 'Kikombo', 15, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1242, '745', 'Kikomelo', 8, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1243, '2882', 'Kikongo', 36, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1244, '429', 'Kikore', 50, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1245, '2643', 'Kikubiji', 54, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1246, '855', 'Kikuku', 89, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1247, '797', 'Kikukuru', 56, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1248, '3891', 'Kikunde', 41, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1249, '389', 'Kikuyu kaskazini', 15, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1250, '514', 'Kikuyu kaskazini', 15, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1251, '390', 'Kikuyu kusini', 15, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1252, '515', 'Kikuyu kusini', 15, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1253, '4161', 'Kikwajuni', 75, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1254, '9', 'Kikwe', 1, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1255, '3173', 'Kilagano', 117, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1256, '3277', 'Kilago', 26, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1257, '2315', 'Kilakala', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1258, '263', 'Kilakala', 124, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1259, '2204', 'Kilakala', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1260, '1333', 'Kilangala', 57, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1261, '1462', 'Kilangala', 57, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1262, '2883', 'Kilangalanga', 36, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1263, '2144', 'Kilangali', 44, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1264, '3048', 'Kilangawana', 118, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1265, '963', 'Kilelema', 7, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1266, '1166', 'Kilema Kaskazini', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1267, '1167', 'Kilema Kati', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1268, '1168', 'Kilema Kusini', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1269, '1211', 'Kileo', 92, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1270, '2988', 'Kilesha', 28, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1271, '4162', 'Kilimahewa', 75, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1272, '3090', 'Kilimani', 70, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1273, '391', 'Kilimani', 15, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1274, '430', 'Kilimani', 50, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1275, '516', 'Kilimani', 15, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1276, '2470', 'Kilimanihewa', 95, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1277, '1405', 'Kilimanihewa', 93, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1278, '1169', 'Kilimanjaro', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1279, '1305', 'Kilimanjaro', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1280, '1406', 'Kilimarondo', 93, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1281, '822', 'Kilimilile', 73, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1282, '3892', 'Kilindi', 41, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1283, '2830', 'Kilindi', 11, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1284, '2941', 'Kilindoni', 61, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1285, '1334', 'Kilolambwani', 57, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1286, '1463', 'Kilolambwani', 57, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1287, '3917', 'Kilole', 52, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1288, '3956', 'Kilole', 60, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1289, '3727', 'Kiloleli', 114, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1290, '3321', 'Kiloleli', 48, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1291, '3758', 'Kiloleni', 119, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1292, '3777', 'Kiloleni', 129, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1293, '3835', 'Kiloleni', 119, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1294, '3728', 'Kiloli', 114, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1295, '1212', 'Kilomeni', 92, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1296, '3153', 'Kilosa', 101, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1297, '2181', 'Kilosa Mpepo', 65, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1298, '4027', 'Kilulu', 88, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1299, '3729', 'Kilumbi', 114, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1300, '264', 'Kilungule', 124, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1301, '2924', 'Kiluvya', 47, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1302, '3893', 'Kilwa', 41, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1303, '477', 'Kimagai', 85, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1304, '359', 'Kimaha', 13, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1305, '601', 'Kimala', 42, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1306, '2145', 'Kimamba A', 44, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1307, '2146', 'Kimamba B', 44, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1308, '1385', 'Kimambi', 58, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1309, '60', 'Kimandolu', 2, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1310, '165', 'Kimandolu', 2, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1311, '198', 'Kimanga', 22, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1312, '4061', 'Kimanga', 103, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1313, '2855', 'Kimange', 4, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1314, '2948', 'Kimanzichana', 79, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1315, '279', 'Kimara', 126, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1316, '3894', 'Kimbe', 41, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1317, '227', 'Kimbiji', 39, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1318, '10', 'Kimnyak', 1, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1319, '998', 'Kimobwa', 34, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1320, '1170', 'Kimochi', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1321, '101', 'Kimokouwa', 59, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1322, '798', 'Kimuli', 56, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1323, '856', 'Kimwani', 89, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1324, '3278', 'Kinaga', 26, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1325, '3279', 'Kinamapula', 26, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1326, '3465', 'Kinampanda', 24, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1327, '3520', 'Kinampundu', 76, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1328, '964', 'Kinazi', 7, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1329, '2257', 'Kinda', 91, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1330, '3537', 'Kindai', 116, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1331, '3576', 'Kindai', 116, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1332, '1171', 'Kindi', 83, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1333, '11', 'King\'ori', 1, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1334, '1231', 'Kingachi', 104, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1335, '431', 'Kingale', 50, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1336, '3154', 'Kingerikiti', 101, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1337, '478', 'Kingiti', 85, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1338, '2316', 'Kingo', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1339, '2205', 'Kingo', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1340, '2206', 'Kingolwira', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1341, '2317', 'Kingolwira', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1342, '3625', 'Kining\'inila', 20, '2024-09-21 20:19:44', '2024-09-21 20:19:44');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(1343, '1311', 'Kinjumbi', 45, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1344, '2207', 'Kinole', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1345, '2318', 'Kinole', 82, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1346, '239', 'Kinondoni', 46, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1347, '3493', 'Kintinku', 66, '2024-09-21 20:19:44', '2024-09-21 20:19:44'),
(1348, '3626', 'Kinungu', 20, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1349, '4150', 'Kinuni', 63, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1350, '3538', 'Kinyagigi', 116, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1351, '3577', 'Kinyagigi', 116, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1352, '1989', 'Kinyala', 108, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1353, '360', 'Kinyamsindo', 13, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1354, '634', 'Kinyanambo', 87, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1355, '3521', 'Kinyangiri', 76, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1356, '432', 'Kinyasi', 50, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1357, '2820', 'Kinyasini', 132, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1358, '4184', 'Kinyasini', 32, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1359, '1752', 'Kinyenche', 105, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1360, '199', 'Kinyerezi', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1361, '3539', 'Kinyeto', 116, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1362, '3578', 'Kinyeto', 116, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1363, '3466', 'Kiomboi', 24, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1364, '4077', 'Kiomoni', 121, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1365, '4104', 'Kiomoni', 121, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1366, '4207', 'Kiongoni', 53, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1367, '2907', 'Kiongoroni', 37, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1368, '1813', 'Kiore', 123, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1369, '1060', 'Kipampa', 40, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1370, '1111', 'Kipampa', 40, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1371, '3014', 'Kipande', 99, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1372, '3730', 'Kipanga', 114, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1373, '4185', 'Kipange', 32, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1374, '3091', 'Kipapa', 70, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1375, '1407', 'Kipara Mnero', 93, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1376, '1408', 'Kipara Mtua', 93, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1377, '2949', 'Kiparang\'anda', 79, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1378, '1312', 'Kipatimu', 45, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1379, '200', 'Kipawa', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1380, '3049', 'Kipeta', 118, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1381, '3015', 'Kipili', 99, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1382, '3731', 'Kipili', 114, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1383, '3092', 'Kipololo', 70, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1384, '2973', 'Kipugira', 107, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1385, '4062', 'Kipumbwi', 103, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1386, '3016', 'Kipundu', 99, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1387, '4151', 'Kipungani', 63, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1388, '201', 'Kipunguni', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1389, '3017', 'Kirando', 99, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1390, '1263', 'Kirangare', 109, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1391, '140', 'Kirangi', 98, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1392, '1313', 'Kiranjeranje', 45, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1393, '12', 'Kiranyi', 1, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1394, '4078', 'Kirare', 121, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1395, '4105', 'Kirare', 121, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1396, '1723', 'Kiriba', 90, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1397, '1753', 'Kirogo', 105, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1398, '2208', 'Kiroka', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1399, '2319', 'Kiroka', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1400, '2419', 'Kiromba', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1401, '2562', 'Kiromba', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1402, '2856', 'Kiromo', 4, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1403, '1232', 'Kirongo Samanga', 104, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1404, '1213', 'Kirongwe', 92, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1405, '2942', 'Kirongwe', 61, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1406, '1529', 'Kiru', 3, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1407, '1294', 'Kirua', 113, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1408, '1172', 'Kirua Vunjo Kusini', 83, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1409, '1173', 'Kirua Vunjo Magharibi', 83, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1410, '1174', 'Kirua Vunjo Mashariki', 83, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1411, '2624', 'Kirumba', 23, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1412, '776', 'Kiruruma', 30, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1413, '882', 'Kirushya', 97, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1414, '1233', 'KirwaKeni', 104, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1415, '1214', 'Kirya', 92, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1416, '1778', 'Kisaka', 111, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1417, '2209', 'Kisaki', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1418, '2320', 'Kisaki', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1419, '3540', 'Kisaki', 116, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1420, '3579', 'Kisaki', 116, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1421, '1234', 'Kisale Msaranga', 104, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1422, '2147', 'Kisanga', 44, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1423, '3732', 'Kisanga', 114, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1424, '1530', 'Kisangaji', 3, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1425, '3895', 'Kisangasa', 41, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1426, '1779', 'Kisangura', 111, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1427, '2925', 'Kisarawe', 47, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1428, '228', 'Kisarawe II', 39, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1429, '4152', 'Kisauni', 63, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1430, '2115', 'Kisawasawa', 43, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1431, '1990', 'Kisegese', 108, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1432, '2950', 'Kisegesege', 79, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1433, '2625', 'Kiseke', 23, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1434, '2321', 'Kisemu', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1435, '2210', 'Kisemu', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1436, '2676', 'Kisesa', 64, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1437, '433', 'Kisese', 50, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1438, '857', 'Kishanda', 89, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1439, '746', 'Kishanje', 8, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1440, '3322', 'Kishapu', 48, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1441, '2722', 'Kishili', 100, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1442, '2762', 'Kishinda', 110, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1443, '747', 'Kishogo', 8, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1444, '1991', 'Kisiba', 108, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1445, '2951', 'Kisiju', 79, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1446, '1264', 'Kisima', 109, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1447, '560', 'Kising\'a', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1448, '602', 'Kising\'a', 42, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1449, '666', 'Kising\'a', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1450, '3467', 'Kisiriri', 24, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1451, '3957', 'Kisiwani', 60, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1452, '4028', 'Kisiwani', 88, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1453, '1265', 'Kisiwani', 109, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1454, '1992', 'Kisondela', 108, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1455, '13', 'Kisongo', 1, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1456, '1672', 'Kisorya', 9, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1457, '3280', 'Kisuke', 26, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1458, '202', 'Kisukuru', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1459, '2989', 'Kisumba', 28, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1460, '1754', 'Kisumwa', 105, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1461, '2420', 'Kisungule', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1462, '2563', 'Kisungule', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1463, '2857', 'Kisutu', 4, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1464, '203', 'Kisutu', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1465, '999', 'Kitagata', 34, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1466, '1033', 'Kitahana', 38, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1467, '1724', 'Kitaji', 90, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1468, '2527', 'Kitama 1', 120, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1469, '3093', 'Kitanda', 70, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1470, '3131', 'Kitanda', 94, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1471, '1000', 'Kitanga', 34, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1472, '2490', 'Kitangali', 96, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1473, '3354', 'Kitangili', 112, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1474, '3397', 'Kitangili', 112, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1475, '3627', 'Kitangili', 20, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1476, '3690', 'Kitangili', 102, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1477, '2626', 'Kitangiri', 23, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1478, '561', 'Kitanzini', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1479, '667', 'Kitanzini', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1480, '3494', 'Kitaraka', 66, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1481, '2421', 'Kitaya', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1482, '2564', 'Kitaya', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1483, '1755', 'Kitembe', 105, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1484, '748', 'Kitendaguro', 8, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1485, '2422', 'Kitere', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1486, '2565', 'Kitere', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1487, '2148', 'Kitete', 44, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1488, '3759', 'Kitete', 119, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1489, '3836', 'Kitete', 119, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1490, '1235', 'Kitirima', 104, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1491, '823', 'Kitobo', 73, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1492, '1335', 'Kitomanga', 57, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1493, '1464', 'Kitomanga', 57, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1494, '2952', 'Kitomondo', 79, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1495, '2677', 'Kitongo sima', 64, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1496, '1061', 'Kitongoni', 40, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1497, '1112', 'Kitongoni', 40, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1498, '4190', 'Kitope', 33, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1499, '3094', 'Kitumbalomo', 70, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1500, '3860', 'Kitumbi', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1501, '1336', 'Kitumbikwela', 57, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1502, '1465', 'Kitumbikwela', 57, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1503, '3733', 'Kitunda', 114, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1504, '204', 'Kitunda', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1505, '777', 'Kituntu', 30, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1506, '3445', 'Kituntu', 21, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1507, '3095', 'Kitura', 70, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1508, '1642', 'Kitwai', 115, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1509, '799', 'Kitwe', 56, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1510, '800', 'Kitwechenkura', 56, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1511, '562', 'Kitwiru', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1512, '668', 'Kitwiru', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1513, '2821', 'Kiungoni', 132, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1514, '1175', 'Kiusa', 83, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1515, '14', 'Kiutu', 1, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1516, '2810', 'Kiuyu', 72, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1517, '2822', 'Kiuyu', 132, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1518, '3861', 'Kiva', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1519, '1314', 'Kivinje', 45, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1520, '1215', 'Kivisini', 92, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1521, '205', 'Kivukoni', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1522, '206', 'Kivule', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1523, '4186', 'Kivunge', 32, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1524, '1337', 'Kiwalala', 57, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1525, '1466', 'Kiwalala', 57, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1526, '207', 'Kiwalani', 22, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1527, '2858', 'Kiwangwa', 4, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1528, '2322', 'Kiwanja Cha Ndege', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1529, '2211', 'Kiwanja Cha Ndege', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1530, '392', 'Kiwanja cha Ndege', 15, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1531, '517', 'Kiwanja cha Ndege', 15, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1532, '1338', 'Kiwawa', 57, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1533, '1467', 'Kiwawa', 57, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1534, '4191', 'Kiwengwa', 33, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1535, '563', 'Kiwere', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1536, '669', 'Kiwere', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1537, '1993', 'Kiwira', 108, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1538, '2423', 'Kiyanga', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1539, '2566', 'Kiyanga', 86, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1540, '635', 'Kiyowela', 87, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1541, '3778', 'Kiyungi', 129, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1542, '3918', 'Kizara', 52, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1543, '1034', 'Kizazi', 38, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1544, '3803', 'Kizengi', 131, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1545, '983', 'Kiziguzigu', 27, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1546, '393', 'Kizota', 15, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1547, '518', 'Kizota', 15, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1548, '3174', 'Kizuka', 117, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1549, '3018', 'Kizumbi', 99, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1550, '3355', 'Kizumbi', 112, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1551, '3398', 'Kizumbi', 112, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1552, '3050', 'Kizwite', 118, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1553, '4203', 'Koani', 35, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1554, '3399', 'Kolandoto', 112, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1555, '3356', 'Kolandoto', 112, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1556, '2323', 'Kolero', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1557, '2212', 'Kolero', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1558, '434', 'Kolo', 50, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1559, '1814', 'Komaswa', 123, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1560, '3862', 'Komkonga', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1561, '1643', 'Komolo', 115, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1562, '1756', 'Komuge', 105, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1563, '3660', 'Kona nne', 29, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1564, '2324', 'Konde', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1565, '2811', 'Konde', 72, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1566, '2213', 'Konde', 82, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1567, '435', 'Kondoa Mjini', 50, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1568, '1897', 'Kongolo', 68, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1569, '2678', 'Kongolo', 64, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1570, '2884', 'Kongowe', 36, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1571, '451', 'Kongwa', 51, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1572, '3863', 'Konje', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1573, '2703', 'Koromije', 74, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1574, '1176', 'Korongoni', 83, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1575, '3019', 'Korongwe', 99, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1576, '1757', 'Koryo', 105, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1577, '1701', 'Kukirango', 10, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1578, '1001', 'Kumnyika', 34, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1579, '1002', 'Kumsenga', 34, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1580, '1035', 'Kumsenga', 38, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1581, '1036', 'Kumwambu', 38, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1582, '240', 'Kunduchi', 46, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1583, '1673', 'Kunzugu', 9, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1584, '265', 'Kurasini', 124, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1585, '1003', 'Kurugongo', 34, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1586, '2926', 'Kurui', 47, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1587, '4163', 'Kwaalinatu', 75, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1588, '4029', 'Kwabada', 88, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1589, '3864', 'Kwachaga', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1590, '436', 'Kwadelo', 50, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1591, '4030', 'Kwafungo', 88, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1592, '1004', 'Kwaga', 34, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1593, '3919', 'Kwagunda', 52, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1594, '4164', 'Kwahani', 75, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1595, '3958', 'Kwai', 60, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1596, '4031', 'Kwakifua', 88, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1597, '564', 'Kwakilosa', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1598, '670', 'Kwakilosa', 25, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1599, '1216', 'Kwakoa', 92, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1600, '2885', 'Kwala', 36, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1601, '2831', 'Kwale', 11, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1602, '4009', 'Kwale', 77, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1603, '3865', 'Kwaluguru', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1604, '3866', 'Kwamagome', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1605, '3867', 'Kwamatuku', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1606, '3868', 'Kwamgwe', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1607, '3920', 'Kwamndolwa', 52, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1608, '3869', 'Kwamsisi', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1609, '3921', 'Kwamsisi', 52, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1610, '4165', 'Kwamtipura', 75, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1611, '361', 'Kwamtoro', 13, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1612, '1725', 'Kwangwa', 90, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1613, '3870', 'Kwankonje', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1614, '2528', 'Kwanyama', 120, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1615, '3922', 'Kwashemshi', 52, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1616, '3871', 'Kwasunga', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1617, '3896', 'Kwediboma', 41, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1618, '3872', 'Kwediyamba', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1619, '3873', 'Kwedizinga', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1620, '3959', 'Kwekanga', 60, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1621, '3897', 'Kwekivu', 41, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1622, '3960', 'Kwemashai', 60, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1623, '280', 'Kwembe', 126, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1624, '4032', 'Kwemingoji', 88, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1625, '4033', 'Kwemkabala', 88, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1626, '3961', 'Kwemkomole', 60, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1627, '3962', 'Kwemshasha', 60, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1628, '3874', 'Kwenjugo', 19, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1629, '2258', 'Kweuma', 91, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1630, '4034', 'Kwezitu', 88, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1631, '1815', 'Kwihancha', 123, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1632, '749', 'Kyaitoke', 8, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1633, '824', 'Kyaka', 73, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1634, '1780', 'Kyambahi', 111, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1635, '750', 'Kyamulaile', 8, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1636, '1759', 'Kyang\'ombe', 105, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1637, '1758', 'Kyangasaga', 105, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1638, '1702', 'Kyanyari', 10, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1639, '858', 'Kyebitembe', 89, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1640, '1871', 'Kyela', 55, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1641, '3468', 'Kyengenge', 24, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1642, '801', 'Kyerwa', 56, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1643, '1994', 'Kyimo', 108, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1644, '1623', 'Labay', 71, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1645, '3051', 'Laela', 118, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1646, '3323', 'Lagana', 48, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1647, '1570', 'Laghanga', 18, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1648, '362', 'Lahoda', 13, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1649, '1590', 'Laiseri', 49, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1650, '1571', 'Lalaji', 18, '2024-09-21 20:19:45', '2024-09-21 20:19:45'),
(1651, '363', 'Lalta', 13, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1652, '302', 'Lamaiti', 5, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1653, '1217', 'Lang\'ata', 92, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1654, '1644', 'Langai', 115, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1655, '2259', 'Langali', 91, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1656, '3096', 'Langiro', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1657, '15', 'Laroi', 1, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1658, '114', 'Lashaine', 81, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1659, '2990', 'Legeza Mwendo', 28, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1660, '16', 'Leguruki', 1, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1661, '17', 'Lemanyata', 1, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1662, '61', 'Lemara', 2, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1663, '166', 'Lemara', 2, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1664, '1218', 'Lembeni', 92, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1665, '115', 'Lemooti', 81, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1666, '1591', 'Lengatei', 49, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1667, '18', 'Lengijave', 1, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1668, '452', 'Lenjulu', 51, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1669, '116', 'Lepurko', 81, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1670, '2094', 'Leshata', 16, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1671, '62', 'Levolosi', 2, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1672, '167', 'Levolosi', 2, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1673, '3923', 'Lewa', 52, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1674, '2424', 'Libobe', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1675, '2567', 'Libobe', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1676, '3175', 'Liganga', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1677, '3132', 'Ligera', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1678, '3446', 'Lighwa', 21, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1679, '3220', 'Ligoma', 125, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1680, '3221', 'Ligunga', 125, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1681, '1315', 'Lihimalyao', 45, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1682, '1316', 'Likawage', 45, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1683, '2471', 'Likokona', 95, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1684, '2425', 'Likombe', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1685, '2568', 'Likombe', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1686, '1386', 'Likongowele', 58, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1687, '1441', 'Likunja', 106, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1688, '3133', 'Likuyuseka', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1689, '3176', 'Lilahi', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1690, '3177', 'Lilambo', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1691, '1387', 'Lilombe', 58, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1692, '3134', 'Limamu', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1693, '3097', 'Linda', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1694, '1514', 'LINDI', 57, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1695, '3155', 'Linga', 101, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1696, '1409', 'Lionja', 93, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1697, '2116', 'Lipangalala', 43, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1698, '3156', 'Liparamba', 101, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1699, '3157', 'Lipingo', 101, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1700, '2374', 'Lipumburu', 67, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1701, '2426', 'Lipwidi', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1702, '2569', 'Lipwidi', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1703, '3135', 'Lisimonji', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1704, '923', 'LITAPUNGA', 84, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1705, '3178', 'Litapwasi', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1706, '2529', 'Litehu', 120, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1707, '3098', 'Litembo', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1708, '3179', 'Litisha', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1709, '3136', 'Litola', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1710, '3158', 'Lituhi', 101, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1711, '3099', 'Litumbandyosi', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1712, '3180', 'Lituta', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1713, '3159', 'Liuli', 101, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1714, '1295', 'Livishi', 113, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1715, '1388', 'Liwale \'B\'', 58, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1716, '1389', 'Liwale Mjini', 58, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1717, '208', 'Liwiti', 22, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1718, '3160', 'Liwundi', 101, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1719, '3181', 'Lizaboni', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1720, '1645', 'Loiborsiret', 115, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1721, '1646', 'Loiborsoit', 115, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1722, '329', 'Loje', 12, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1723, '117', 'Lolkisale', 81, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1724, '1339', 'Longa', 57, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1725, '1468', 'Longa', 57, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1726, '102', 'Longido', 59, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1727, '1177', 'Longuo \'B\'', 83, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1728, '1592', 'Loolera', 49, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1729, '3804', 'Loya', 131, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1730, '2530', 'Luagala', 120, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1731, '1844', 'Lualaje', 14, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1732, '2260', 'Luale', 91, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1733, '3357', 'Lubaga', 112, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1734, '3400', 'Lubaga', 112, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1735, '2704', 'Lubili', 74, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1736, '2679', 'Lubugu', 64, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1737, '2261', 'Lubungo', 91, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1738, '1442', 'Luchelegwa', 106, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1739, '2723', 'Luchelele', 100, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1740, '3137', 'Luchili', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1741, '2491', 'Luchingu', 96, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1742, '3138', 'Luegu', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1743, '1995', 'Lufilyo', 108, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1744, '1996', 'Lufingo', 108, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1745, '479', 'Lufu', 85, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1746, '603', 'Lugalo', 42, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1747, '2763', 'Lugata', 110, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1748, '1898', 'Lugelele', 68, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1749, '2859', 'Lugoba', 4, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1750, '3628', 'Lugubu', 20, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1751, '1266', 'Lugulu', 109, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1752, '1899', 'Luhanga', 68, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1753, '3161', 'Luhangarasi', 101, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1754, '2764', 'Luharanyonga', 110, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1755, '565', 'Luhota', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1756, '671', 'Luhota', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1757, '480', 'Luhundwa', 85, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1758, '636', 'Luhunga', 87, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1759, '2325', 'Luhungo', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1760, '2214', 'Luhungo', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1761, '3100', 'Luhuwiko', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1762, '2285', 'Lukande', 128, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1763, '2953', 'Lukanga', 79, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1764, '3101', 'Lukarasi', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1765, '2326', 'Lukobe', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1766, '2215', 'Lukobe', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1767, '2531', 'Lukokoda', 120, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1768, '3963', 'Lukozi', 60, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1769, '2375', 'Lukuledi', 67, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1770, '3222', 'Lukumbule', 125, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1771, '2376', 'Lulindi', 67, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1772, '2149', 'Lumbiji', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1773, '3162', 'Lumeme', 101, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1774, '2117', 'Lumemo', 43, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1775, '2472', 'Lumesule', 95, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1776, '566', 'Lumuli', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1777, '672', 'Lumuli', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1778, '481', 'Lumuma', 85, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1779, '2150', 'Lumuma', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1780, '2216', 'Lundi', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1781, '2327', 'Lundi', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1782, '3281', 'Lunguya', 26, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1783, '3964', 'Lunguza', 60, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1784, '1845', 'Lupa', 14, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1785, '2377', 'Lupaso', 67, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1786, '1997', 'Lupata', 108, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1787, '1998', 'Lupepo', 108, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1788, '482', 'Lupeta', 85, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1789, '2286', 'Lupiro', 128, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1790, '710', 'Lusahunga', 6, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1791, '3052', 'Lusaka', 118, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1792, '4035', 'Lusanga', 88, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1793, '3139', 'Lusewa', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1794, '3965', 'Lushoto', 60, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1795, '3102', 'Lusonga', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1796, '3691', 'Lusu', 102, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1797, '1872', 'Lusungo', 55, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1798, '2680', 'Lutale', 64, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1799, '1999', 'Luteba', 108, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1800, '3805', 'Lutende', 131, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1801, '3924', 'Lutindi', 52, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1802, '3103', 'Luwaita', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1803, '3898', 'Lwande', 41, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1804, '2000', 'Lwangwa', 108, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1805, '2724', 'Lwanhima', 100, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1806, '1945', 'Lwanjilo', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1807, '2051', 'Lwanjilo', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1808, '3053', 'Lwiche', 118, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1809, '3358', 'Lyabukande', 112, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1810, '3401', 'Lyabukande', 112, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1811, '3402', 'Lyabusalu', 112, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1812, '3359', 'Lyabusalu', 112, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1813, '567', 'Lyamgungwe', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1814, '673', 'Lyamgungwe', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1815, '3403', 'Lyamidati', 112, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1816, '3360', 'Lyamidati', 112, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1817, '3054', 'Lyangalile', 118, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1818, '2532', 'Lyenje', 120, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1819, '2644', 'Lyoma', 54, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1820, '2991', 'Lyowa', 28, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1821, '141', 'Maalon', 98, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1822, '1946', 'Maanga', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1823, '2052', 'Maanga', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1824, '1873', 'Mababu', 55, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1825, '3899', 'Mabalanga', 41, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1826, '825', 'Mabale', 73, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1827, '3806', 'Mabama', 131, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1828, '1037', 'Mabamba', 38, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1829, '3875', 'Mabanda', 19, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1830, '2725', 'Mabatini', 100, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1831, '1947', 'Mabatini', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1832, '2053', 'Mabatini', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1833, '4079', 'Mabawa', 121, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1834, '4106', 'Mabawa', 121, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1835, '883', 'Mabawe', 97, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1836, '281', 'Mabibo', 126, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1837, '1267', 'Mabilioni', 109, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1838, '802', 'Mabira', 56, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1839, '568', 'Maboga', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1840, '674', 'Maboga', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1841, '1178', 'Mabogini', 83, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1842, '4080', 'Mabokweni', 121, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1843, '4107', 'Mabokweni', 121, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1844, '2705', 'Mabuki', 74, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1845, '2151', 'Mabula', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1846, '241', 'Mabwepande', 46, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1847, '2152', 'Mabwerebwere', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1848, '1139', 'Machame Kaskazini', 17, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1849, '1140', 'Machame Magharibi', 17, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1850, '1141', 'Machame Mashariki', 17, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1851, '1142', 'Machame Narumu', 17, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1852, '1143', 'Machame Uroki', 17, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1853, '924', 'Machimboni', 84, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1854, '1062', 'Machinjioni', 40, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1855, '1113', 'Machinjioni', 40, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1856, '1781', 'Machochwe', 111, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1857, '4063', 'Madanga', 103, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1858, '2095', 'Madege', 16, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1859, '1900', 'Madibira', 68, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1860, '2427', 'Madimba', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1861, '2570', 'Madimba', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1862, '2153', 'Madoto', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1863, '394', 'Madukani', 15, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1864, '519', 'Madukani', 15, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1865, '637', 'Maduma', 87, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1866, '1531', 'Madunga', 3, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1867, '2832', 'Madungu', 11, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1868, '1948', 'Maendeleo', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1869, '1949', 'Maendeleo', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1870, '2054', 'Maendeleo', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1871, '2055', 'Maendeleo', 69, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1872, '2217', 'Mafiga', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1873, '2328', 'Mafiga', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1874, '2329', 'Mafisa', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1875, '2218', 'Mafisa', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1876, '2927', 'Mafizi', 47, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1877, '4192', 'Mafufuni', 33, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1878, '3055', 'Mafulala', 118, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1879, '859', 'Mafumbo', 89, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1880, '1846', 'Mafyeko', 14, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1881, '2219', 'Magadu', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1882, '2330', 'Magadu', 82, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1883, '3182', 'Magagula', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1884, '925', 'Magamba', 84, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1885, '3966', 'Magamba', 60, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1886, '3925', 'Magamba Kwalukonge', 52, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1887, '1782', 'Magange', 111, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1888, '3324', 'Maganzo', 48, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1889, '4081', 'Magaoni', 121, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1890, '4108', 'Magaoni', 121, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1891, '1532', 'Magara', 3, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1892, '860', 'Magata/Karutanga', 89, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1893, '2954', 'Magawa', 79, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1894, '3140', 'Magazini', 94, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1895, '3692', 'Magengati', 102, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1896, '2428', 'Magengeni', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1897, '2571', 'Magengeni', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1898, '1624', 'Maghang', 71, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1899, '3541', 'Maghojoa', 116, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1900, '3580', 'Maghojoa', 116, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1901, '4036', 'Magila', 88, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1902, '3926', 'Magila Gereza', 52, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1903, '2886', 'Magindu', 36, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1904, '3807', 'Magiri', 131, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1905, '2154', 'Magole', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1906, '3927', 'Magoma', 52, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1907, '4166', 'Magomeni', 75, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1908, '2155', 'Magomeni', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1909, '242', 'Magomeni', 46, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1910, '2429', 'Magomeni', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1911, '2572', 'Magomeni', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1912, '2860', 'Magomeni', 4, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1913, '4037', 'Magoroto', 88, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1914, '2096', 'Magoweko', 16, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1915, '2681', 'Magu mjini', 64, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1916, '2156', 'Magubike', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1917, '1533', 'Magugu', 3, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1918, '2157', 'Maguha', 44, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1919, '569', 'Magulilwa', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1920, '675', 'Magulilwa', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1921, '3928', 'Magunga', 52, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1922, '1593', 'Magungu', 49, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1923, '3104', 'Maguu', 70, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1924, '3183', 'Mahanje', 117, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1925, '2908', 'Mahege', 37, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1926, '1063', 'Mahembe', 40, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1927, '1114', 'Mahembe', 40, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1928, '604', 'Mahenge', 42, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1929, '2287', 'Mahenge Mjini', 128, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1930, '3967', 'Mahezangulu', 60, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1931, '1236', 'Mahida', 104, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1932, '2726', 'Mahina', 100, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1933, '4193', 'Mahonda', 33, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1934, '1901', 'Mahongole', 68, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1935, '2492', 'Mahumbika', 96, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1936, '570', 'Mahuninga', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1937, '676', 'Mahuninga', 25, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1938, '2430', 'Mahurunga', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1939, '2573', 'Mahurunga', 86, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1940, '2533', 'Mahuta', 120, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1941, '2887', 'Mailimoja', 36, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1942, '1534', 'Maisaka', 3, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1943, '2765', 'Maisome', 110, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1944, '330', 'Majeleko', 12, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1945, '19', 'Majengo', 1, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1946, '118', 'Majengo', 81, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1947, '395', 'Majengo', 15, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1948, '520', 'Majengo', 15, '2024-09-21 20:19:46', '2024-09-21 20:19:46'),
(1949, '926', 'Majengo', 84, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1950, '1064', 'Majengo', 40, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1951, '1115', 'Majengo', 40, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1952, '2431', 'Majengo', 86, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1953, '2574', 'Majengo', 86, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1954, '3020', 'Majengo', 99, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1955, '3056', 'Majengo', 118, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1956, '3184', 'Majengo', 117, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1957, '3223', 'Majengo', 125, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1958, '3282', 'Majengo', 26, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1959, '1179', 'Majengo', 83, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1960, '1340', 'Majengo', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1961, '1469', 'Majengo', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1962, '1950', 'Majengo', 69, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1963, '2056', 'Majengo', 69, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1964, '3542', 'Majengo', 116, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1965, '3581', 'Majengo', 116, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1966, '3929', 'Majengo', 52, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1967, '4038', 'Majengo', 88, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1968, '4082', 'Majengo', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1969, '4109', 'Majengo', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1970, '20', 'Maji ya chai', 1, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1971, '3224', 'Majimaji', 125, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1972, '905', 'Majimoto', 80, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1973, '1783', 'Majimoto', 111, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1974, '3495', 'Majiri', 66, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1975, '209', 'Majohe', 22, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1976, '1594', 'Makame', 49, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1977, '303', 'Makanda', 5, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1978, '3496', 'Makanda', 66, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1979, '2001', 'Makandana', 108, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1980, '331', 'Makang\'wa', 12, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1981, '266', 'Makangarawe', 124, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1982, '1443', 'Makanjiro', 106, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1983, '1268', 'Makanya', 109, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1984, '3968', 'Makanya', 60, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1985, '927', 'Makanyagio', 84, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1986, '1390', 'Makata', 58, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1987, '453', 'Makawa', 51, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1988, '3808', 'Makazi', 131, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1989, '1005', 'Makere', 34, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1990, '21', 'Makiba', 1, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1991, '1237', 'Makiidi', 104, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1992, '3447', 'Makilawa', 21, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1993, '3661', 'Makingi', 29, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1994, '3448', 'Makiungu', 21, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1995, '1296', 'Makiwaru', 113, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1996, '1726', 'Makojo', 90, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1997, '1727', 'Makoko', 90, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1998, '396', 'Makole', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(1999, '521', 'Makole', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2000, '4039', 'Makole', 88, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2001, '1341', 'Makonde', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(2002, '1470', 'Makonde', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2003, '2378', 'Makong\'onda', 67, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2004, '2493', 'Makonga', 96, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2005, '243', 'Makongo', 46, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2006, '1847', 'Makongolosi', 14, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2007, '364', 'Makorongo', 13, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2008, '571', 'Makorongoni', 25, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2009, '677', 'Makorongoni', 25, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2010, '4083', 'Makorora', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2011, '4110', 'Makorora', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2012, '2494', 'Makote', 96, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2013, '282', 'Makuburi', 126, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2014, '2495', 'Makukwe', 96, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2015, '3930', 'Makumba', 52, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2016, '244', 'Makumbusho', 46, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2017, '638', 'Makungu', 87, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2018, '3543', 'Makuro', 116, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2019, '3582', 'Makuro', 116, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2020, '3497', 'Makuru', 66, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2021, '283', 'Makurumla', 126, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2022, '2861', 'Makurunge', 4, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2023, '397', 'Makutopora', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2024, '522', 'Makutopora', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2025, '3498', 'Makutupora', 66, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2026, '3931', 'Makuyuni', 52, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2027, '119', 'Makuyuni', 81, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2028, '1180', 'Makuyuni (Himo)', 83, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2029, '1874', 'Makwale', 55, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2030, '142', 'Malambo', 98, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2031, '639', 'Malangali', 87, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2032, '3057', 'Malangali', 118, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2033, '2496', 'Malatu', 96, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2034, '572', 'Malengamakali', 25, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2035, '678', 'Malengamakali', 25, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2036, '3876', 'Malezi', 19, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2037, '3969', 'Malibwi', 60, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2038, '2645', 'Maligisu', 54, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2039, '3970', 'Malindi', 60, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2040, '4167', 'Malindi', 75, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2041, '2002', 'Malindo', 108, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2042, '2182', 'Malinyi', 65, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2043, '1444', 'Malolo', 106, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2044, '2158', 'Malolo', 44, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2045, '3760', 'Malolo', 119, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2046, '3837', 'Malolo', 119, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2047, '483', 'Malolo', 85, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2048, '2534', 'Malopokelo', 120, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2049, '3469', 'Maluga', 24, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2050, '22', 'Malula', 1, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2051, '3283', 'Malunga', 26, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2052, '2646', 'Malya', 54, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2053, '2706', 'Mamaye', 74, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2054, '906', 'Mamba', 80, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2055, '1848', 'Mamba', 14, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2056, '3971', 'Mamba', 60, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2057, '1181', 'Mamba Kaskazini', 83, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2058, '1182', 'Mamba Kusini', 83, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2059, '3693', 'Mambali', 102, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2060, '4153', 'Mambosasa', 63, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2061, '2159', 'Mamboya', 44, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2062, '2993', 'Mambwe Nkoswe', 28, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2063, '2992', 'Mambwekenya', 28, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2064, '1535', 'Mamire', 3, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2065, '1238', 'Mamsera', 104, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2066, '332', 'Manchali', 12, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2067, '1784', 'Manchira', 111, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2068, '1239', 'Manda', 104, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2069, '333', 'Manda', 12, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2070, '1445', 'Mandarawe', 106, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2071, '1317', 'Mandawa', 45, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2072, '1446', 'Mandawa', 106, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2073, '2097', 'Mandege', 16, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2074, '2862', 'Mandera', 4, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2075, '3544', 'Mandewa', 116, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2076, '3583', 'Mandewa', 116, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2077, '1342', 'Mandwanga', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2078, '1471', 'Mandwanga', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2079, '2928', 'Maneromango', 47, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2080, '88', 'Mang\'ola', 31, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2081, '3449', 'Mang\'onyi', 21, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2082, '2118', 'Mang\'ula', 43, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2083, '2119', 'Mang\'ula \"B\"', 43, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2084, '1816', 'Manga', 123, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2085, '2262', 'Mangae', 91, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2086, '2473', 'Mangaka', 95, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2087, '484', 'Mangaliza', 85, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2088, '1391', 'Mangirikiti', 58, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2089, '2432', 'Mangopachanne', 86, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2090, '2575', 'Mangopachanne', 86, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2091, '3972', 'Manolo', 60, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2092, '2647', 'Mantare', 54, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2093, '3932', 'Manundu', 52, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2094, '1674', 'Manyamanyama', 9, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2095, '3499', 'Manyoni Urban', 66, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2096, '4010', 'Manza', 77, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2097, '334', 'Manzase', 12, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2098, '284', 'Manzese', 126, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2099, '1269', 'Maore', 109, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2100, '3284', 'Mapamba', 26, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2101, '3761', 'Mapambano', 119, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2102, '3838', 'Mapambano', 119, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2103, '640', 'Mapanda', 87, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2104, '2909', 'Maparoni', 37, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2105, '4011', 'Mapatano', 77, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2106, '3105', 'Mapera', 70, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2107, '2863', 'Mapinga', 4, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2108, '1902', 'Mapogoro', 68, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2109, '3185', 'Maposeni', 117, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2110, '2497', 'Maputi', 96, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2111, '4012', 'Maramba', 77, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2112, '1410', 'Marambo', 93, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2113, '1625', 'Marang', 71, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2114, '1240', 'Marangu Kitowo', 104, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2115, '1183', 'Marangu Magharibi', 83, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2116, '1184', 'Marangu Mashariki', 83, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2117, '2474', 'Maratani', 95, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2118, '1626', 'Maretadu', 71, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2119, '2379', 'Marika', 67, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2120, '23', 'Maroroni', 1, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2121, '2929', 'Marui', 47, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2122, '751', 'Maruku', 8, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2123, '3225', 'Marumba', 125, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2124, '2930', 'Marumbo', 47, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2125, '4084', 'Marungu', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2126, '4111', 'Marungu', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2127, '24', 'Maruvango', 1, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2128, '1703', 'Masaba', 10, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2129, '3900', 'Masagalu', 41, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2130, '2120', 'Masagati', 43, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2131, '4064', 'Masaika', 103, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2132, '573', 'Masaka', 25, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2133, '679', 'Masaka', 25, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2134, '2931', 'Masaki', 47, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2135, '1572', 'Masakta', 18, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2136, '1144', 'Masama Kati', 17, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2137, '1145', 'Masama Kusini', 17, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2138, '1146', 'Masama Magharibi', 17, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2139, '1147', 'Masama Mashariki', 17, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2140, '1148', 'Masama Rundugai', 17, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2141, '3325', 'Masanga', 48, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2142, '437', 'Masange', 50, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2143, '2160', 'Masanze', 44, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2144, '2003', 'Masebe', 108, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2145, '3404', 'Masekelo', 112, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2146, '3361', 'Masekelo', 112, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2147, '3362', 'Masengwa', 112, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2148, '3405', 'Masengwa', 112, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2149, '3021', 'Mashete', 99, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2150, '3933', 'Mashewa', 52, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2151, '1627', 'Masieda', 71, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2152, '605', 'Masisiwe', 42, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2153, '4085', 'Masiwani', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2154, '4112', 'Masiwani', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2155, '2263', 'Maskati', 91, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2156, '1318', 'Masoko', 45, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2157, '1951', 'Masoko', 69, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2158, '2004', 'Masoko', 108, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2159, '2057', 'Masoko', 69, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2160, '3226', 'Masonya', 125, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2161, '1573', 'Masqaroda', 18, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2162, '1628', 'Masqaroda', 71, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2163, '485', 'Massa', 85, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2164, '2475', 'Masuguru', 95, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2165, '3934', 'Masuguru', 52, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2166, '4040', 'Masuguru', 88, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2167, '2005', 'Masukulu', 108, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2168, '3106', 'Masumuni', 70, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2169, '2994', 'Matai', 28, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2170, '2833', 'Matale', 11, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2171, '103', 'Matale A', 59, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2172, '1447', 'Matambarale', 106, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2173, '3058', 'Matanga', 118, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2174, '3107', 'Matarawe', 70, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2175, '3186', 'Matarawe', 117, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2176, '1785', 'Matare', 111, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2177, '2380', 'Matawale', 67, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2178, '3108', 'Mateka', 70, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2179, '3187', 'Mateka', 117, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2180, '1411', 'Matekwe', 93, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2181, '1875', 'Matema', 55, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2182, '3227', 'Matemanga', 125, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2183, '1065', 'Matendo', 40, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2184, '1116', 'Matendo', 40, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2185, '3188', 'Matetereka', 117, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2186, '25', 'Mateves', 1, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2187, '1343', 'Matimba', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2188, '1472', 'Matimba', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2189, '3189', 'Matimira', 117, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2190, '3109', 'Matiri', 70, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2191, '3190', 'Matogoro', 117, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2192, '486', 'Matomondo', 85, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2193, '3522', 'Matongo', 76, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2194, '1817', 'Matongo', 123, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2195, '454', 'Matongoro', 51, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2196, '1344', 'Matopeni', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2197, '1473', 'Matopeni', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2198, '1595', 'Matui', 49, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2199, '2220', 'Matuli', 82, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2200, '2331', 'Matuli', 82, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2201, '3191', 'Matumbi', 117, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2202, '398', 'Matumbulu', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2203, '523', 'Matumbulu', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2204, '1849', 'Matundasi', 14, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2205, '2006', 'Matwebe', 108, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2206, '1850', 'Matwiga', 14, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2207, '2535', 'Maundo', 120, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2208, '2288', 'Mawasiliano', 128, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2209, '3500', 'Maweni', 66, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2210, '4086', 'Maweni', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2211, '4113', 'Maweni', 121, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2212, '1185', 'Mawenzi', 83, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2213, '1903', 'Mawindi', 68, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2214, '2433', 'Mayanga', 86, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2215, '2576', 'Mayanga', 86, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2216, '3973', 'Mayo', 60, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2217, '4013', 'Mayomboni', 77, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2218, '861', 'Mayondwe', 89, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2219, '487', 'Mazae', 85, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2220, '2332', 'Mazimbu', 82, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2221, '2221', 'Mazimbu', 82, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2222, '3935', 'Mazinde', 52, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2223, '862', 'Mazinga', 89, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2224, '3877', 'Mazingara', 19, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2225, '3059', 'Mazwi', 118, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2226, '399', 'Mbabala', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2227, '524', 'Mbabala', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2228, '267', 'Mbagala', 124, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2229, '268', 'Mbagala Kuu', 124, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2230, '3694', 'Mbagwa', 102, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2231, '3163', 'Mbaha', 101, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2232, '641', 'Mbalamaziwa', 87, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2233, '400', 'Mbalawala', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2234, '525', 'Mbalawala', 15, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2235, '1786', 'Mbalibali', 111, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2236, '1952', 'Mbalizi Road', 69, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2237, '2058', 'Mbalizi Road', 69, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2238, '3164', 'Mbamba bay', 101, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2239, '3110', 'Mbambi', 70, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2240, '3111', 'Mbangamao', 70, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2241, '1345', 'Mbanja', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2242, '1474', 'Mbanja', 57, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2243, '3974', 'Mbaramo', 60, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2244, '4041', 'Mbaramo', 88, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2245, '2707', 'Mbarika', 74, '2024-09-21 20:19:47', '2024-09-21 20:19:47'),
(2246, '3975', 'Mbaru', 60, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2247, '2121', 'Mbasa', 43, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2248, '3228', 'Mbati', 125, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2249, '2434', 'Mbawala', 86, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2250, '2577', 'Mbawala', 86, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2251, '1392', 'Mbaya', 58, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2252, '907', 'Mbede', 80, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2253, '1448', 'Mbekenyera', 106, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2254, '3470', 'Mbelekese', 24, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2255, '2435', 'Mbembaleo', 86, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2256, '2578', 'Mbembaleo', 86, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2257, '3229', 'Mbesa', 125, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2258, '2084', 'MBEYA', 69, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2259, '2955', 'Mbezi', 79, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2260, '285', 'Mbezi', 126, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2261, '245', 'Mbezi Juu', 46, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2262, '2161', 'Mbigiri', 44, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2263, '3192', 'Mbinga Mhalule', 117, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2264, '3112', 'Mbinga Mjini', 70, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2265, '3113', 'Mbinga Mjini B', 70, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2266, '2122', 'Mbingu', 43, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2267, '1818', 'Mbogi', 123, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2268, '3695', 'Mbogwe', 102, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2269, '1186', 'Mbokomu', 83, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2270, '574', 'Mboliboli', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2271, '680', 'Mboliboli', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2272, '4042', 'Mbomole', 88, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2273, '1412', 'Mbondo', 93, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2274, '884', 'Mbuba', 97, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2275, '2910', 'Mbuchi', 37, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2276, '2289', 'Mbuga', 128, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2277, '488', 'Mbuga', 85, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2278, '2727', 'Mbugani', 100, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2279, '3762', 'Mbugani', 119, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2280, '3839', 'Mbugani', 119, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2281, '1851', 'Mbugani', 14, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2282, '1876', 'Mbugani', 55, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2283, '26', 'Mbuguni', 1, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2284, '3114', 'Mbuji', 70, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2285, '2995', 'Mbuluma', 28, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2286, '89', 'Mbulumbulu', 31, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2287, '2162', 'Mbumi', 44, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2288, '286', 'Mburahati', 126, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2289, '3629', 'Mbutu', 20, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2290, '3696', 'Mbutu', 102, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2291, '2222', 'Mbuyuni', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2292, '2333', 'Mbuyuni', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2293, '2381', 'Mbuyuni', 67, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2294, '3976', 'Mbuzii', 60, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2295, '2974', 'Mbwara', 107, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2296, '2888', 'Mbwawa', 36, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2297, '3977', 'Mbwei', 60, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2298, '1449', 'Mbwemkuru (Machang\'anja)', 106, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2299, '4154', 'Mbweni', 63, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2300, '246', 'Mbweni', 46, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2301, '2864', 'Mbwewe', 4, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2302, '210', 'Mchafukoge', 22, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2303, '2823', 'Mchanga Mdogo', 132, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2304, '3230', 'Mchangani', 125, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2305, '1675', 'Mcharo', 9, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2306, '2382', 'Mchauru', 67, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2307, '2498', 'Mchemo', 96, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2308, '3231', 'Mchesi', 125, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2309, '2536', 'Mchichira', 120, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2310, '211', 'Mchikichini', 22, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2311, '3779', 'Mchikichini', 129, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2312, '1346', 'Mchinga', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2313, '1475', 'Mchinga', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2314, '2499', 'Mcholi  I', 96, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2315, '2500', 'Mcholi II', 96, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2316, '2123', 'Mchombe', 43, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2317, '3141', 'Mchomoro', 94, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2318, '1413', 'Mchonda', 93, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2319, '3232', 'Mchoteka', 125, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2320, '2911', 'Mchukwi', 37, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2321, '3233', 'Mchuluka', 125, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2322, '642', 'Mdabulo', 87, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2323, '2537', 'Mdimba Mnyoma', 120, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2324, '2501', 'Mdimba MpeleMpele', 96, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2325, '3878', 'Mdoe', 19, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2326, '1574', 'Measkron', 18, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2327, '2627', 'Mecco', 23, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2328, '3285', 'Mega', 26, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2329, '2264', 'Melela', 91, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2330, '4155', 'Melinne', 63, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2331, '335', 'Membe', 12, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2332, '1241', 'Mengeni', 104, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2333, '1242', 'Mengwe', 104, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2334, '3545', 'Merya', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2335, '3584', 'Merya', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2336, '120', 'Meserani', 81, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2337, '3193', 'Mfaranyaki', 117, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2338, '4138', 'Mfenesini', 62, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2339, '121', 'Mfereji', 81, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2340, '3060', 'Mfinga', 118, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2341, '1187', 'Mfumuni', 83, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2342, '1219', 'Mgagao', 92, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2343, '575', 'Mgama', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2344, '681', 'Mgama', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2345, '3879', 'Mgambo', 19, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2346, '3501', 'Mgandu', 66, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2347, '1088', 'Mganza', 130, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2348, '2265', 'Mgeta', 91, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2349, '2975', 'Mgomba', 107, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2350, '3142', 'Mgombasi', 94, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2351, '3936', 'Mgombezi', 52, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2352, '3471', 'Mgongo', 24, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2353, '3546', 'Mgori', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2354, '3585', 'Mgori', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2355, '3450', 'Mgungira', 21, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2356, '3937', 'Mgwashi', 52, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2357, '3978', 'Mgwashi', 60, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2358, '4043', 'Mhamba', 88, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2359, '2648', 'Mhande', 54, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2360, '2728', 'Mhandu', 100, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2361, '2163', 'Mhenda', 44, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2362, '1270', 'Mhezi', 109, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2363, '4014', 'Mhinduro', 77, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2364, '2266', 'Mhonda', 91, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2365, '3286', 'Mhongolo', 26, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2366, '3115', 'Mhongozi', 70, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2367, '3287', 'Mhungula', 26, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2368, '3061', 'Miangalua', 118, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2369, '269', 'Mianzini', 124, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2370, '270', 'Miburani', 124, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2371, '2943', 'Miburani', 61, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2372, '2124', 'Michenga', 43, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2373, '2538', 'Michenjele', 120, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2374, '2843', 'Michenzani', 78, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2375, '2812', 'Micheweni', 72, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2376, '2476', 'Michiga', 95, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2377, '1188', 'Miembeni', 83, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2378, '752', 'Miembeni', 8, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2379, '3979', 'Migambo', 60, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2380, '3523', 'Miganga', 76, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2381, '576', 'Migoli', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2382, '682', 'Migoli', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2383, '4168', 'Migombani', 75, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2384, '2383', 'Migongo', 67, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2385, '122', 'Migungani', 81, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2386, '1319', 'Miguruwe', 45, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2387, '3697', 'Miguwa', 102, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2388, '2539', 'Mihambwe', 120, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2389, '1676', 'Mihingo', 9, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2390, '1393', 'Mihumo', 58, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2391, '2384', 'Mijelejele', 67, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2392, '3116', 'Mikalanga', 70, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2393, '2477', 'Mikangaula', 95, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2394, '2334', 'Mikese', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2395, '2223', 'Mikese', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2396, '4065', 'Mikinguni', 103, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2397, '247', 'Mikocheni', 46, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2398, '753', 'Mikoni', 8, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2399, '1877', 'Mikoroshoni', 55, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2400, '1347', 'Mikumbi', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2401, '1476', 'Mikumbi', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2402, '2502', 'Mikumbi', 96, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2403, '2164', 'Mikumi', 44, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2404, '3662', 'Milambo', 29, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2405, '3698', 'Milambo Itobo', 102, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2406, '2436', 'Milangominne', 86, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2407, '2579', 'Milangominne', 86, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2408, '3062', 'Milanzi', 118, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2409, '3063', 'Milepa', 118, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2410, '3980', 'Milingano', 60, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2411, '2290', 'Milola', 128, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2412, '1348', 'Milola', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2413, '1477', 'Milola', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2414, '2540', 'Milongodi', 120, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2415, '489', 'Mima', 85, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2416, '212', 'Minazi Mirefu', 22, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2417, '2335', 'Mindu', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2418, '3234', 'Mindu', 125, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2419, '2224', 'Mindu', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2420, '2291', 'Minepa', 128, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2421, '3547', 'Minga', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2422, '3586', 'Minga', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2423, '1349', 'Mingoyo', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2424, '1478', 'Mingoyo', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2425, '1320', 'Mingumbi', 45, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2426, '3451', 'Minyughe', 21, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2427, '826', 'Minziro', 73, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2428, '2865', 'Miono', 4, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2429, '2956', 'Mipeko', 79, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2430, '1350', 'Mipingo', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2431, '1479', 'Mipingo', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2432, '3165', 'Mipotopoto', 101, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2433, '1760', 'Mirare', 105, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2434, '1647', 'Mirerani', 115, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2435, '2729', 'Mirongo', 100, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2436, '1394', 'Mirui', 58, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2437, '1704', 'Mirwa', 10, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2438, '4044', 'Misalai', 88, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2439, '2708', 'Misasi', 74, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2440, '3235', 'Misechela', 125, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2441, '1038', 'Misezero', 38, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2442, '3763', 'Misha', 119, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2443, '3840', 'Misha', 119, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2444, '949', 'Mishamo', 122, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2445, '3734', 'Misheni', 114, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2446, '143', 'Misigiyo', 98, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2447, '3880', 'Misima', 19, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2448, '4045', 'Misozwe', 88, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2449, '2766', 'Mission', 110, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2450, '3194', 'Misufini', 117, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2451, '3452', 'Misughaa', 21, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2452, '2889', 'Misugusugu', 36, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2453, '3548', 'Misuna', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2454, '3587', 'Misuna', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2455, '2709', 'Misungwi', 74, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2456, '928', 'Misunkumilo', 84, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2457, '3809', 'Miswaki', 131, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2458, '1351', 'Mitandi', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2459, '1480', 'Mitandi', 57, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2460, '1321', 'Miteja', 45, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2461, '2437', 'Mitengo', 86, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2462, '2580', 'Mitengo', 86, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2463, '2385', 'Mitesa', 67, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2464, '1297', 'Miti mirefu', 113, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2465, '1322', 'Mitole', 45, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2466, '1414', 'Mitumbati', 93, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2467, '3502', 'Mitundu', 66, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2468, '3549', 'Mitunduruni', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2469, '3588', 'Mitunduruni', 116, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2470, '2541', 'Miuta', 120, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2471, '577', 'Mivinjeni', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2472, '683', 'Mivinjeni', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2473, '3810', 'Miyenze', 131, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2474, '1904', 'Miyombweni', 68, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2475, '401', 'Miyuji', 15, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2476, '526', 'Miyuji', 15, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2477, '3699', 'Mizibaziba', 102, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2478, '2912', 'Mjawa', 37, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2479, '1953', 'Mjele', 69, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2480, '2059', 'Mjele', 69, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2481, '2225', 'Mji Mkuu', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2482, '2336', 'Mji Mkuu', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2483, '2337', 'Mji Mpya', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2484, '1189', 'Mji Mpya', 83, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2485, '2226', 'Mji Mpya', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2486, '229', 'Mjimwema', 39, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2487, '3195', 'Mjimwema', 117, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2488, '3196', 'Mjini', 117, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2489, '3363', 'Mjini', 112, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2490, '3406', 'Mjini', 112, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2491, '3117', 'Mkako', 70, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2492, '2098', 'Mkalama', 16, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2493, '3938', 'Mkalamo', 52, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2494, '4066', 'Mkalamo', 103, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2495, '2996', 'Mkali', 28, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2496, '2957', 'Mkamba', 79, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2497, '2338', 'Mkambalani', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2498, '2227', 'Mkambalani', 82, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2499, '2866', 'Mkange', 4, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2500, '3881', 'Mkata', 19, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2501, '4194', 'Mkataleni', 33, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2502, '965', 'Mkatanga', 7, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2503, '1066', 'Mkigo', 40, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2504, '1117', 'Mkigo', 40, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2505, '578', 'Mkimbizi', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2506, '684', 'Mkimbizi', 25, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2507, '3901', 'Mkindi', 41, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2508, '3663', 'Mkindo', 29, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2509, '2267', 'Mkindo', 91, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2510, '3022', 'Mkinga', 99, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2511, '4015', 'Mkinga', 77, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2512, '3453', 'Mkiwa', 21, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2513, '2844', 'Mkoani', 78, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2514, '1415', 'Mkoka', 93, '2024-09-21 20:19:48', '2024-09-21 20:19:48'),
(2515, '455', 'Mkoka', 51, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2516, '1852', 'Mkola', 14, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2517, '2730', 'Mkolani', 100, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2518, '3735', 'Mkolye', 114, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2519, '1761', 'Mkoma', 105, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2520, '2503', 'Mkoma II', 96, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2521, '2386', 'Mkomaindo', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2522, '3939', 'Mkomazi', 52, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2523, '2976', 'Mkongo', 107, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2524, '3143', 'Mkongo', 94, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2525, '3144', 'Mkongo Gulioni', 94, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2526, '1067', 'Mkongoro', 40, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2527, '1118', 'Mkongoro', 40, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2528, '3197', 'Mkongotema', 117, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2529, '2542', 'Mkonjowano', 120, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2530, '2478', 'Mkonona', 95, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2531, '402', 'Mkonze', 15, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2532, '527', 'Mkonze', 15, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2533, '2543', 'Mkoreha', 120, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2534, '1416', 'Mkotokuyana', 93, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2535, '2997', 'Mkowe', 28, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2536, '2125', 'Mkula', 43, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2537, '2228', 'Mkulazi', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2538, '2339', 'Mkulazi', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2539, '2387', 'Mkululu', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2540, '2504', 'Mkulung\'ulu', 96, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2541, '3940', 'Mkumbara', 52, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2542, '3118', 'Mkumbi', 70, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2543, '2340', 'Mkundi', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2544, '2544', 'Mkundi', 120, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2545, '2229', 'Mkundi', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2546, '2438', 'Mkunwa', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2547, '2581', 'Mkunwa', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2548, '2505', 'Mkunya', 96, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2549, '2958', 'Mkuranga', 79, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2550, '1395', 'Mkutano', 58, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2551, '2388', 'Mkuti', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2552, '2341', 'Mkuyuni', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2553, '2731', 'Mkuyuni', 100, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2554, '2230', 'Mkuyuni', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2555, '2890', 'Mkuza', 36, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2556, '4046', 'Mkuzi', 88, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2557, '4067', 'Mkwaja', 103, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2558, '3023', 'Mkwamba', 99, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2559, '2165', 'Mkwatani', 44, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2560, '579', 'Mkwawa', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2561, '685', 'Mkwawa', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2562, '2506', 'Mkwedu', 96, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2563, '2545', 'Mkwedu', 120, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2564, '3503', 'Mkwese', 66, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2565, '2546', 'Mkwiti', 120, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2566, '2126', 'Mlabani', 43, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2567, '606', 'Mlafu', 42, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2568, '456', 'Mlali', 51, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2569, '2268', 'Mlali', 91, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2570, '3981', 'Mlalo', 60, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2571, '4169', 'Mlandege', 75, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2572, '580', 'Mlandege', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2573, '686', 'Mlandege', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2574, '2891', 'Mlandizi', 36, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2575, '27', 'Mlangarini', 1, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2576, '2913', 'Mlanzi', 37, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2577, '490', 'Mlembule', 85, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2578, '1396', 'Mlembwe', 58, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2579, '581', 'Mlenge', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2580, '687', 'Mlenge', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2581, '3198', 'Mletele', 117, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2582, '2342', 'Mlimani', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2583, '2231', 'Mlimani', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2584, '3882', 'Mlimani', 19, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2585, '2127', 'Mlimba', 43, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2586, '4047', 'Mlingano', 88, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2587, '3236', 'Mlingoti Mashariki', 125, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2588, '3237', 'Mlingotini Magharibi', 125, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2589, '2389', 'Mlingula', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2590, '3982', 'Mlola', 60, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2591, '582', 'Mlowa', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2592, '688', 'Mlowa', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2593, '336', 'Mlowa Barabarani', 12, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2594, '337', 'Mlowa bwawani', 12, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2595, '491', 'Mlunduzi', 85, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2596, '3941', 'Mlungui', 52, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2597, '3811', 'Mmale', 131, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2598, '1450', 'Mnacho', 106, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2599, '1149', 'Mnadani', 17, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2600, '403', 'Mnadani', 15, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2601, '528', 'Mnadani', 15, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2602, '2998', 'Mnamba', 28, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2603, '2479', 'Mnanje', 95, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2604, '1352', 'Mnara', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2605, '1481', 'Mnara', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2606, '2390', 'Mnavira', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2607, '3983', 'Mnazi', 60, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2608, '1353', 'Mnazimmoja', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2609, '1482', 'Mnazimmoja', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2610, '2547', 'Mndumbwe', 120, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2611, '2507', 'Mnekachi', 96, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2612, '438', 'Mnenia', 50, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2613, '1417', 'Mnero Miembeni', 93, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2614, '1418', 'Mnero Ngongo', 93, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2615, '3984', 'Mng\'aro', 60, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2616, '2232', 'Mngazi', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2617, '2343', 'Mngazi', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2618, '2128', 'Mngeta', 43, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2619, '2439', 'Mnima', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2620, '2582', 'Mnima', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2621, '643', 'Mninga', 87, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2622, '3064', 'Mnokola', 118, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2623, '1354', 'Mnolela', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2624, '1483', 'Mnolela', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2625, '2440', 'Mnongodi', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2626, '2583', 'Mnongodi', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2627, '950', 'Mnyagala', 122, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2628, '213', 'Mnyamani', 22, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2629, '2508', 'Mnyambe', 96, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2630, '4087', 'Mnyanjani', 121, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2631, '4114', 'Mnyanjani', 121, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2632, '2548', 'Mnyawa', 120, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2633, '4016', 'Mnyenzani', 77, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2634, '2509', 'Mnyeu', 96, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2635, '3942', 'Mnyuzi', 52, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2636, '4017', 'Moa', 77, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2637, '2129', 'Mofu', 43, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2638, '1575', 'Mogitu', 18, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2639, '3700', 'Mogwa', 102, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2640, '2977', 'Mohoro', 107, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2641, '123', 'Moita', 81, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2642, '63', 'Moivaro', 2, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2643, '168', 'Moivaro', 2, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2644, '28', 'Moivo', 1, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2645, '3736', 'Mole', 114, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2646, '3065', 'Mollo', 118, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2647, '2441', 'Moma', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2648, '2584', 'Moma', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2649, '4156', 'Mombasa', 63, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2650, '3943', 'Mombo', 52, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2651, '3066', 'Momoka', 118, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2652, '2710', 'Mondo', 74, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2653, '3288', 'Mondo', 26, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2654, '3326', 'Mondo', 48, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2655, '365', 'Mondo', 13, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2656, '124', 'Monduli Juu', 81, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2657, '125', 'Monduli Mjini', 81, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2658, '2363', 'MOROGORO', 82, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2659, '1787', 'Morotonga', 111, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2660, '64', 'Moshono', 2, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2661, '169', 'Moshono', 2, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2662, '1788', 'Mosongo', 111, '2024-09-21 20:19:49', '2024-09-21 20:19:49');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(2663, '1243', 'Motamburu Kitendeni', 104, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2664, '304', 'Mpalanga', 5, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2665, '3944', 'Mpale', 52, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2666, '305', 'Mpamantwa', 5, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2667, '3524', 'Mpambala', 76, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2668, '929', 'Mpanda Hotel', 84, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2669, '951', 'Mpanda Ndogo', 122, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2670, '3199', 'Mpandangindo', 117, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2671, '644', 'Mpanga TAZARA', 87, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2672, '2391', 'Mpanyani', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2673, '3119', 'Mpapa', 70, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2674, '4048', 'Mpapayu', 88, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2675, '2442', 'Mpapura', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2676, '2585', 'Mpapura', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2677, '2007', 'Mpata', 108, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2678, '3764', 'Mpela', 119, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2679, '3841', 'Mpela', 119, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2680, '4170', 'Mpendae', 75, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2681, '366', 'Mpendo', 13, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2682, '3120', 'Mpepai', 70, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2683, '3166', 'Mpepo', 101, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2684, '2392', 'Mpeta', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2685, '1397', 'Mpigamiti', 58, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2686, '2393', 'Mpindimbi', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2687, '306', 'Mpinga', 5, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2688, '1271', 'Mpinji', 109, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2689, '1419', 'Mpiruka', 93, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2690, '3200', 'Mpitimbi', 117, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2691, '2008', 'Mpombo', 108, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2692, '2999', 'Mpombwe', 28, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2693, '3737', 'Mpombwe', 114, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2694, '3985', 'Mponde', 60, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2695, '2009', 'Mpuguso', 108, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2696, '3067', 'Mpui', 118, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2697, '404', 'Mpunguzi', 15, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2698, '529', 'Mpunguzi', 15, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2699, '3289', 'Mpunze', 26, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2700, '3145', 'Mputa', 94, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2701, '2510', 'Mpwapwa', 96, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2702, '3068', 'Mpwapwa', 118, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2703, '492', 'Mpwapwa Mjini', 85, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2704, '338', 'Mpwayungu', 12, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2705, '3550', 'Mrama', 116, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2706, '3589', 'Mrama', 116, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2707, '1244', 'Mrao Keryo', 104, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2708, '367', 'Mrijo', 13, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2709, '368', 'Msaada', 13, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2710, '2914', 'Msala', 37, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2711, '405', 'Msalato', 15, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2712, '530', 'Msalato', 15, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2713, '3201', 'Msamala', 117, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2714, '339', 'Msamalo', 12, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2715, '1006', 'Msambara', 34, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2716, '4088', 'Msambweni', 121, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2717, '4115', 'Msambweni', 121, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2718, '3069', 'Msandamuungano', 118, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2719, '2932', 'Msanga', 47, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2720, '340', 'Msanga', 12, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2721, '2443', 'Msangamkuu', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2722, '2586', 'Msangamkuu', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2723, '2892', 'Msangani', 36, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2724, '3551', 'Msange', 116, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2725, '3590', 'Msange', 116, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2726, '1220', 'Msangeni', 92, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2727, '3902', 'Msanja', 41, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2728, '3000', 'Msanzi', 28, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2729, '1190', 'Msaranga', 83, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2730, '3883', 'Msasa', 19, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2731, '248', 'Msasani', 46, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2732, '2010', 'Msasani', 108, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2733, '2867', 'Msata', 4, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2734, '583', 'Mseke', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2735, '689', 'Mseke', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2736, '3202', 'Mshangano', 117, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2737, '1272', 'Mshewa', 109, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2738, '1954', 'Mshewe', 69, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2739, '2060', 'Mshewe', 69, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2740, '1728', 'Mshikamano', 90, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2741, '584', 'Mshindo', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2742, '690', 'Mshindo', 25, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2743, '287', 'Msigani', 126, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2744, '2394', 'Msikisi', 67, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2745, '2444', 'Msimbati', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2746, '2587', 'Msimbati', 86, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2747, '2933', 'Msimbu', 47, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2748, '3146', 'Msindo', 94, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2749, '1273', 'Msindo', 109, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2750, '3525', 'Msingi', 76, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2751, '2099', 'Msingisi', 16, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2752, '1355', 'Msinjahili', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2753, '1484', 'Msinjahili', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2754, '3552', 'Msisi', 116, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2755, '3591', 'Msisi', 116, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2756, '307', 'Msisi', 5, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2757, '3147', 'Msisima', 94, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2758, '1648', 'Msitu wa Tembo', 115, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2759, '2868', 'Msoga', 4, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2760, '2292', 'Msogezi', 128, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2761, '2130', 'Msolwa Station', 43, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2762, '2959', 'Msonga', 79, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2763, '214', 'Msongola', 22, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2764, '2269', 'Msongozi', 91, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2765, '2166', 'Msowero', 44, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2766, '3070', 'Msua', 118, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2767, '2813', 'Msuka', 72, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2768, '3945', 'Mswaha', 52, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2769, '126', 'Mswakini', 81, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2770, '3986', 'Mtae', 60, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2771, '1356', 'Mtama', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2772, '1485', 'Mtama', 57, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2773, '3553', 'Mtamaa', 116, '2024-09-21 20:19:49', '2024-09-21 20:19:49'),
(2774, '3592', 'Mtamaa', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2775, '2893', 'Mtambani', 36, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2776, '2845', 'Mtambile', 78, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2777, '645', 'Mtambula', 87, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2778, '2824', 'Mtambwe', 132, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2779, '457', 'Mtanana', 51, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2780, '1357', 'Mtanda', 57, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2781, '1486', 'Mtanda', 57, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2782, '2395', 'Mtandi', 67, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2783, '1853', 'Mtanila', 14, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2784, '930', 'Mtapenda', 84, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2785, '2445', 'Mtawanya', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2786, '2588', 'Mtawanya', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2787, '2915', 'Mtawanya', 37, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2788, '1089', 'Mtegowanoti', 130, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2789, '3472', 'Mtekente', 24, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2790, '3765', 'Mtendeni', 119, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2791, '3842', 'Mtendeni', 119, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2792, '3024', 'Mtenga', 99, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2793, '493', 'Mtera', 85, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2794, '2270', 'Mtibwa', 91, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2795, '1274', 'Mtii', 109, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2796, '2183', 'Mtimbira', 65, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2797, '4018', 'Mtimbwani', 77, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2798, '2446', 'Mtimbwilimbwi', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2799, '2589', 'Mtimbwilimbwi', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2800, '3238', 'Mtina', 125, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2801, '4049', 'Mtindiro', 88, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2802, '2447', 'Mtiniko', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2803, '2590', 'Mtiniko', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2804, '3554', 'Mtinko', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2805, '3593', 'Mtinko', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2806, '3555', 'Mtipa', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2807, '3594', 'Mtipa', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2808, '3167', 'Mtipwili', 101, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2809, '308', 'Mtitaa', 5, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2810, '607', 'Mtitu', 42, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2811, '127', 'Mto wa Mbu', 81, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2812, '3473', 'Mtoa', 24, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2813, '4139', 'Mtofaani', 62, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2814, '2344', 'Mtombozi', 82, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2815, '2233', 'Mtombozi', 82, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2816, '3946', 'Mtonga', 52, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2817, '2894', 'Mtongani', 36, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2818, '271', 'Mtoni', 124, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2819, '4140', 'Mtoni', 62, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2820, '2448', 'Mtonya', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2821, '2511', 'Mtonya', 96, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2822, '2591', 'Mtonya', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2823, '2512', 'Mtopwa', 96, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2824, '3071', 'Mtowisa', 118, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2825, '1358', 'Mtua', 57, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2826, '1420', 'Mtua', 93, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2827, '1487', 'Mtua', 57, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2828, '2513', 'Mtumachi', 96, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2829, '406', 'Mtumba', 15, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2830, '531', 'Mtumba', 15, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2831, '2167', 'Mtumbatu', 44, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2832, '1359', 'Mtumbya', 57, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2833, '1488', 'Mtumbya', 57, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2834, '2916', 'Mtunda', 37, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2835, '3454', 'Mtunduru', 21, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2836, '3630', 'Mtunguru', 20, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2837, '2514', 'Mtunguru', 96, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2838, '646', 'Mtwango', 87, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2839, '2615', 'MTWARA', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2840, '585', 'Mtwivila', 25, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2841, '691', 'Mtwivila', 25, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2842, '3203', 'Mtyangimbole', 117, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2843, '966', 'Mubanga', 7, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2844, '863', 'Mubunda', 89, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2845, '3556', 'Mudida', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2846, '3595', 'Mudida', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2847, '754', 'Mugajwale', 8, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2848, '1729', 'Mugango', 90, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2849, '885', 'Muganza', 97, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2850, '1007', 'Muganza', 34, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2851, '967', 'Mugera', 7, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2852, '1677', 'Mugeta', 9, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2853, '3557', 'Mughamo', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2854, '3596', 'Mughamo', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2855, '3558', 'Mughanga', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2856, '3597', 'Mughanga', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2857, '3559', 'Mughunga', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2858, '3598', 'Mughunga', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2859, '886', 'Mugoma', 97, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2860, '1789', 'Mugumu', 111, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2861, '984', 'Mugunzu', 27, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2862, '3504', 'Muhalala', 66, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2863, '985', 'Muhange', 27, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2864, '968', 'Muhinda', 7, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2865, '3455', 'Muhintiri', 21, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2866, '3701', 'Muhugi', 102, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2867, '3204', 'Muhukuru', 117, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2868, '1008', 'Muhunga', 34, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2869, '864', 'Muhutwe', 89, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2870, '3239', 'Muhuwesi', 125, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2871, '1039', 'Mukabuye', 38, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2872, '1730', 'Mukendo', 90, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2873, '2796', 'Mukituntu', 127, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2874, '3474', 'Mukulu', 24, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2875, '1576', 'Mulbadaw', 18, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2876, '865', 'Muleba', 89, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2877, '2396', 'Mumbaka', 67, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2878, '969', 'Munanila', 7, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2879, '104', 'Mundarara', 59, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2880, '309', 'Mundemu', 5, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2881, '4141', 'Munduli', 62, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2882, '3456', 'Mungaa', 21, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2883, '1068', 'Mungonya', 40, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2884, '1119', 'Mungonya', 40, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2885, '3560', 'Mungumaji', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2886, '3599', 'Mungumaji', 116, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2887, '970', 'Munyegera', 7, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2888, '971', 'Munzeze', 7, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2889, '1731', 'Murangi', 90, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2890, '1705', 'Muriaza', 10, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2891, '1819', 'Muriba', 123, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2892, '65', 'Muriet', 2, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2893, '170', 'Muriet', 2, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2894, '2797', 'Muriti', 127, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2895, '803', 'Murongo', 56, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2896, '1629', 'Murray', 71, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2897, '1009', 'Murubona', 34, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2898, '1010', 'Murufiti', 34, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2899, '887', 'Murukurazo', 97, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2900, '1040', 'Murungu', 38, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2901, '888', 'Murusagamba', 97, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2902, '1011', 'Murusi', 34, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2903, '2798', 'Murutunguru', 127, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2904, '29', 'Musa', 1, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2905, '1732', 'Musanja', 90, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2906, '866', 'Mushabago', 89, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2907, '827', 'Mushasha', 73, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2908, '1536', 'Mutuka', 3, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2909, '828', 'Mutukula', 73, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2910, '341', 'Muungano', 12, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2911, '1150', 'Muungano', 17, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2912, '1878', 'Muungano', 55, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2913, '2449', 'Muungano', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2914, '2515', 'Muungano', 96, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2915, '2592', 'Muungano', 86, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2916, '3121', 'Muungano', 70, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2917, '3780', 'Muungano', 129, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2918, '4171', 'Muungano', 75, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2919, '972', 'Muyama', 7, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2920, '4208', 'Muyuni', 53, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2921, '3072', 'Muze', 118, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2922, '1012', 'Muzye', 34, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2923, '2271', 'Mvomero', 91, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2924, '2345', 'Mvuha', 82, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2925, '2234', 'Mvuha', 82, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2926, '1360', 'Mvuleni', 57, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2927, '1489', 'Mvuleni', 57, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2928, '2168', 'Mvumi', 44, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2929, '342', 'Mvumi Makulu', 12, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2930, '343', 'Mvumi Misheni', 12, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2931, '3903', 'Mvungwe', 41, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2932, '2767', 'Mwabaluhi', 110, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2933, '2649', 'Mwabomba', 54, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2934, '1537', 'Mwada', 3, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2935, '3073', 'Mwadui', 118, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2936, '3327', 'Mwadui Lohumbo', 48, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2937, '2650', 'Mwagi', 54, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2938, '3702', 'Mwakashanhala', 102, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2939, '3290', 'Mwakata', 26, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2940, '1955', 'Mwakibete', 69, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2941, '2061', 'Mwakibete', 69, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2942, '4019', 'Mwakijembe', 77, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2943, '2651', 'Mwakilyambiti', 54, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2944, '3328', 'Mwakipoya', 48, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2945, '3364', 'Mwakitolyo', 112, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2946, '3407', 'Mwakitolyo', 112, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2947, '1090', 'Mwakizega', 130, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2948, '3291', 'Mwalugulu', 26, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2949, '3365', 'Mwalukwa', 112, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2950, '3408', 'Mwalukwa', 112, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2951, '2682', 'Mwamabanza', 64, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2952, '3505', 'Mwamagembe', 66, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2953, '3631', 'Mwamakona', 20, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2954, '3409', 'Mwamala', 112, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2955, '3632', 'Mwamala', 20, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2956, '3703', 'Mwamala', 102, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2957, '2652', 'Mwamala', 54, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2958, '3366', 'Mwamala', 112, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2959, '3329', 'Mwamalasa', 48, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2960, '3367', 'Mwamalili', 112, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2961, '3410', 'Mwamalili', 112, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2962, '2683', 'Mwamanga', 64, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2963, '908', 'Mwamapuli', 80, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2964, '3330', 'Mwamashele', 48, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2965, '3633', 'Mwamashiga', 20, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2966, '3634', 'Mwamashimba', 20, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2967, '2917', 'Mwambao', 37, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2968, '2846', 'Mwambe', 78, '2024-09-21 20:19:50', '2024-09-21 20:19:50'),
(2969, '1069', 'Mwamgongo', 40, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2970, '1120', 'Mwamgongo', 40, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2971, '931', 'Mwamkulu', 84, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2972, '4157', 'Mwanakwerekwe', 63, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2973, '249', 'Mwananyamala', 46, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2974, '3292', 'Mwanase', 26, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2975, '3293', 'Mwandakulima', 26, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2976, '2960', 'Mwandege', 79, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2977, '30', 'Mwandet', 1, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2978, '1070', 'Mwandiga', 40, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2979, '1121', 'Mwandiga', 40, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2980, '2653', 'Mwandu', 54, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2981, '2654', 'Mwang\'halanga', 54, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2982, '1221', 'Mwanga', 92, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2983, '3526', 'Mwanga', 76, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2984, '1071', 'Mwanga Kaskazini', 40, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2985, '1122', 'Mwanga Kaskazini', 40, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2986, '1072', 'Mwanga Kusini', 40, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2987, '1123', 'Mwanga Kusini', 40, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2988, '1879', 'Mwanganyanga', 55, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2989, '586', 'Mwangata', 25, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2990, '692', 'Mwangata', 25, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2991, '3527', 'Mwangeza', 76, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2992, '3987', 'Mwangoi', 60, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2993, '3704', 'Mwangoye', 102, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2994, '2711', 'Mwaniko', 74, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2995, '1222', 'Mwaniko', 92, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2996, '3561', 'Mwankoko', 116, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2997, '3600', 'Mwankoko', 116, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2998, '2655', 'Mwankulwe', 54, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(2999, '3368', 'Mwantini', 112, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3000, '3411', 'Mwantini', 112, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3001, '3705', 'Mwantundu', 102, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3002, '4142', 'Mwanyanya', 62, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3003, '2808', 'MWANZA', 100, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3004, '2807', 'Mwanza CC', 100, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3005, '4089', 'Mwanzange', 121, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3006, '4116', 'Mwanzange', 121, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3007, '3706', 'Mwanzoli', 102, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3008, '3457', 'Mwaru', 21, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3009, '2961', 'Mwarusembe', 79, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3010, '3707', 'Mwasala', 102, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3011, '1956', 'Mwasanga', 69, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3012, '2062', 'Mwasanga', 69, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3013, '3562', 'Mwasauya', 116, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3014, '3601', 'Mwasauya', 116, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3015, '2978', 'Mwaseni', 107, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3016, '1957', 'Mwasenkwa', 69, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3017, '2063', 'Mwasenkwa', 69, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3018, '3635', 'Mwashikumbili', 20, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3019, '3331', 'Mwasubi', 48, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3020, '3332', 'Mwataga', 48, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3021, '1905', 'Mwatenga', 68, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3022, '3412', 'Mwawaza', 112, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3023, '3369', 'Mwawaza', 112, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3024, '3333', 'Mwaweja', 48, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3025, '2293', 'Mwaya', 128, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3026, '1880', 'Mwaya', 55, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3027, '2131', 'Mwaya', 43, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3028, '973', 'Mwayaya', 7, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3029, '3001', 'Mwazye', 28, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3030, '1820', 'Mwema', 123, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3031, '1275', 'Mwembe', 109, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3032, '4172', 'Mwembe Makumbi', 75, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3033, '2346', 'Mwembesongo', 82, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3034, '2235', 'Mwembesongo', 82, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3035, '2397', 'Mwena', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3036, '3370', 'Mwenge', 112, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3037, '3413', 'Mwenge', 112, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3038, '1361', 'Mwenge', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3039, '1490', 'Mwenge', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3040, '2398', 'Mwenge Mtapika', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3041, '3205', 'Mwengemshindo', 117, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3042, '4068', 'Mwera', 103, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3043, '4143', 'Mwera', 62, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3044, '952', 'Mwese', 122, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3045, '1733', 'Mwigobero', 90, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3046, '1191', 'Mwika Kaskazini', 83, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3047, '1192', 'Mwika Kusini', 83, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3048, '1013', 'Mwilavya', 34, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3049, '3002', 'Mwimbi', 28, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3050, '3766', 'Mwinyi', 119, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3051, '3843', 'Mwinyi', 119, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3052, '1734', 'Mwisenge', 90, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3053, '3636', 'Mwisi', 20, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3054, '310', 'Mwitikira', 5, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3055, '3664', 'Mwongozo', 29, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3056, '1276', 'Myamba', 109, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3057, '3122', 'Myangayanga', 70, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3058, '3025', 'Myula', 99, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3059, '2934', 'Mzenga', 47, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3060, '2272', 'Mziha', 91, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3061, '250', 'Mzimuni', 46, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3062, '215', 'Mzinga', 22, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3063, '2236', 'Mzinga', 82, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3064, '2347', 'Mzinga', 82, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3065, '4090', 'Mzingani', 121, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3066, '4117', 'Mzingani', 121, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3067, '4091', 'Mzizima', 121, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3068, '4118', 'Mzizima', 121, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3069, '2273', 'Mzumbe', 91, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3070, '128', 'Naalarami', 81, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3071, '1649', 'Naberera', 115, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3072, '1362', 'Nachingwea', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3073, '1451', 'Nachingwea', 106, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3074, '1491', 'Nachingwea', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3075, '1421', 'Nachingwea Mjini', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3076, '1363', 'Nachunyu', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3077, '1492', 'Nachunyu', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3078, '1790', 'Nagusi', 111, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3079, '1630', 'Nahasey', 71, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3080, '1364', 'Nahukahuka', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3081, '1493', 'Nahukahuka', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3082, '144', 'Nainokanoka', 98, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3083, '1422', 'Naipanga', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3084, '1423', 'Naipingo', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3085, '1650', 'Naisinyai', 115, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3086, '145', 'Naiyobi', 98, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3087, '2516', 'Nakahako', 96, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3088, '3240', 'Nakapanya', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3089, '2799', 'Nakatunguru', 127, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3090, '3241', 'Nakayaya', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3091, '407', 'Nala', 15, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3092, '532', 'Nala', 15, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3093, '3242', 'Nalasi Magharibi', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3094, '3243', 'Nalasi Mashariki', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3095, '2450', 'Naliendele', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3096, '2593', 'Naliendele', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3097, '2451', 'Nalingu', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3098, '2594', 'Nalingu', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3099, '3148', 'Namabengo', 94, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3100, '2800', 'Namagondo', 127, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3101, '2399', 'Namajani', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3102, '3244', 'Namakambale', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3103, '2400', 'Namalenga', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3104, '105', 'Namanga', 59, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3105, '1365', 'Namangale', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3106, '1494', 'Namangale', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3107, '3026', 'Namanyere', 99, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3108, '1424', 'Namapwia', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3109, '3245', 'Namasakata', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3110, '1425', 'Namatula', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3111, '2401', 'Namatutwe', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3112, '1323', 'Namayuni', 45, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3113, '2549', 'Nambahu', 120, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3114, '2517', 'Nambali', 96, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3115, '1426', 'Nambambo', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3116, '1452', 'Nambilanje', 106, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3117, '1631', 'Nambis', 71, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3118, '1596', 'Namelock', 49, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3119, '1678', 'Namhula', 9, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3120, '1453', 'Namichiga', 106, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3121, '1427', 'Namikango', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3122, '2550', 'Namikupa', 120, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3123, '2801', 'Namilembe', 127, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3124, '3246', 'Namiungo', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3125, '2518', 'Namiyonga', 96, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3126, '1679', 'Nampindi', 9, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3127, '3247', 'Nampungu', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3128, '3123', 'Namswea', 70, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3129, '3149', 'Namtumbo', 94, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3130, '2452', 'Namtumbuka', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3131, '2595', 'Namtumbuka', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3132, '1366', 'Namupa', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3133, '1495', 'Namupa', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3134, '2402', 'Namwanga', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3135, '2132', 'Namwawala', 43, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3136, '3248', 'Namwinyu', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3137, '1454', 'Nandagala', 106, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3138, '3249', 'Nandembo', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3139, '2480', 'Nandete', 95, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3140, '2519', 'Nandwahi', 96, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3141, '1428', 'Nang\'ondo', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3142, '3637', 'Nanga', 20, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3143, '1398', 'Nangando', 58, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3144, '1455', 'Nanganga', 106, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3145, '2403', 'Nanganga', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3146, '1399', 'Nangano', 58, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3147, '1538', 'Nangara', 3, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3148, '1367', 'Nangaru', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3149, '1496', 'Nangaru', 57, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3150, '2481', 'Nangomba', 95, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3151, '2404', 'Nangoo', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3152, '1429', 'Nangowe', 93, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3153, '2453', 'Nanguruwe', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3154, '2520', 'Nanguruwe', 96, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3155, '2596', 'Nanguruwe', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3156, '1577', 'Nangwa', 18, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3157, '2521', 'Nangwala', 96, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3158, '2551', 'Nanhyanga', 120, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3159, '1245', 'Nanjara', 104, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3160, '1324', 'Nanjirinji', 45, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3161, '3250', 'Nanjoka', 125, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3162, '2405', 'Nanjota', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3163, '3074', 'Nankanga', 118, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3164, '1680', 'Nansimo', 9, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3165, '2802', 'Nansio', 127, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3166, '2454', 'Nanyamba', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3167, '2597', 'Nanyamba', 86, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3168, '2482', 'Nanyumbu', 95, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3169, '2483', 'Napacho', 95, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3170, '2406', 'Napupa', 67, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3171, '2552', 'Naputa', 120, '2024-09-21 20:19:51', '2024-09-21 20:19:51'),
(3172, '1539', 'Nar', 3, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3173, '1456', 'Narungombe', 106, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3174, '1298', 'Nasai', 113, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3175, '3708', 'Nata', 102, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3176, '1791', 'Natta', 111, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3177, '2455', 'Naumbu', 86, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3178, '2598', 'Naumbu', 86, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3179, '1368', 'Navanga', 57, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3180, '1497', 'Navanga', 57, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3181, '2294', 'Nawenge', 128, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3182, '3475', 'Ndago', 24, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3183, '2834', 'Ndagoni', 11, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3184, '2944', 'Ndagoni', 61, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3185, '3371', 'Ndala', 112, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3186, '3414', 'Ndala', 112, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3187, '3709', 'Ndala', 102, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3188, '778', 'Ndama', 30, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3189, '2407', 'Ndanda', 67, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3190, '1881', 'Ndandalo', 55, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3191, '2011', 'Ndanto', 108, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3192, '1597', 'Ndedo', 49, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3193, '3372', 'Ndembezi', 112, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3194, '3415', 'Ndembezi', 112, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3195, '3638', 'Ndembezi', 20, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3196, '3767', 'Ndevelwa', 119, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3197, '3844', 'Ndevelwa', 119, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3198, '3206', 'Ndilimalitembo', 117, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3199, '1598', 'Ndirgishi', 49, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3200, '1430', 'Nditi', 93, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3201, '1882', 'Ndobo', 55, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3202, '3334', 'Ndoleleji', 48, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3203, '3884', 'Ndolwa', 19, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3204, '1431', 'Ndomoni', 93, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3205, '3207', 'Ndongosi', 117, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3206, '3812', 'Ndono', 131, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3207, '1369', 'Ndoro', 57, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3208, '1498', 'Ndoro', 57, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3209, '251', 'Ndugumbi', 46, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3210, '3528', 'Nduguti', 76, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3211, '587', 'Nduli', 25, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3212, '693', 'Nduli', 25, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3213, '3476', 'Ndulungu', 24, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3214, '2456', 'Ndumbwe', 86, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3215, '2599', 'Ndumbwe', 86, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3216, '1299', 'Ndumeti', 113, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3217, '1277', 'Ndungu', 109, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3218, '2803', 'Nduruma', 127, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3219, '31', 'Nduruma', 1, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3220, '3904', 'Negero', 41, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3221, '711', 'Nemba', 6, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3222, '1681', 'Neruma', 9, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3223, '1193', 'Ng\'ambo', 83, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3224, '3768', 'Ng\'ambo', 119, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3225, '3845', 'Ng\'ambo', 119, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3226, '608', 'Ng\'ang\'ange', 42, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3227, '1370', 'Ng\'apa', 57, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3228, '1499', 'Ng\'apa', 57, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3229, '494', 'Ng\'hambi', 85, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3230, '2684', 'Ng\'haya', 64, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3231, '458', 'Ng\'humbi', 51, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3232, '2656', 'Ng\'hundi', 54, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3233, '609', 'Ng\'uruhe', 42, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3234, '32', 'Ngabobo', 1, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3235, '4092', 'Ngamiani Kaskazini', 121, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3236, '4119', 'Ngamiani Kaskazini', 121, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3237, '4093', 'Ngamiani Kati', 121, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3238, '4120', 'Ngamiani Kati', 121, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3239, '4094', 'Ngamiani Kusini', 121, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3240, '4121', 'Ngamiani Kusini', 121, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3241, '1883', 'Ngana', 55, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3242, '3251', 'Ngapa', 125, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3243, '889', 'Ngara Mjini', 97, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3244, '2979', 'Ngarambe', 107, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3245, '1300', 'Ngarenairobi', 113, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3246, '33', 'Ngarenanyuki', 1, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3247, '66', 'Ngarenaro', 2, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3248, '171', 'Ngarenaro', 2, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3249, '3294', 'Ngaya', 26, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3250, '867', 'Ngenge', 89, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3251, '2237', 'Ngerengere', 82, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3252, '2348', 'Ngerengere', 82, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3253, '344', 'Nghahelezi', 12, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3254, '345', 'Nghambaku', 12, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3255, '408', 'Nghong\'onha', 15, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3256, '533', 'Nghong\'onha', 15, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3257, '3124', 'Ngima', 70, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3258, '3563', 'Ngimu', 116, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3259, '3602', 'Ngimu', 116, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3260, '3335', 'Ngofila', 48, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3261, '3295', 'Ngogwa', 26, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3262, '2184', 'Ngoheranga', 65, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3263, '146', 'Ngoile', 98, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3264, '3416', 'Ngokolo', 112, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3265, '3373', 'Ngokolo', 112, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3266, '2768', 'Ngoma', 110, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3267, '2804', 'Ngoma', 127, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3268, '459', 'Ngomai', 51, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3269, '4050', 'Ngomeni', 88, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3270, '1884', 'Ngonga', 55, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3271, '1400', 'Ngongowele', 58, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3272, '1651', 'Ngorika', 115, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3273, '2980', 'Ngorongo', 107, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3274, '147', 'Ngorongoro', 98, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3275, '1246', 'Ngoyoni', 104, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3276, '3738', 'Ngoywa', 114, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3277, '2657', 'Ngudu', 54, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3278, '1223', 'Ngujini', 92, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3279, '2658', 'Ngulla', 54, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3280, '3639', 'Ngulu', 20, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3281, '3988', 'Ngulwi', 60, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3282, '3168', 'Ngumbo', 101, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3283, '1432', 'Ngunichile', 93, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3284, '2553', 'Ngunja', 120, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3285, '1091', 'Nguruka', 130, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3286, '4095', 'Nguvumali', 121, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3287, '4122', 'Nguvumali', 121, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3288, '3640', 'Nguvumoja', 20, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3289, '2847', 'Ngwachani', 78, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3290, '3989', 'Ngwelo', 60, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3291, '346', 'Nhinhi', 12, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3292, '2712', 'Nhundulu', 74, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3293, '3665', 'Nhwande', 29, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3294, '2869', 'Nia Njema', 4, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3295, '3027', 'Ninde', 99, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3296, '2457', 'Nitekela', 86, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3297, '2600', 'Nitekela', 86, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3298, '2458', 'Njengwa', 86, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3299, '2601', 'Njengwa', 86, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3300, '1194', 'Njia Panda', 83, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3301, '2962', 'Njianne', 79, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3302, '1325', 'Njinjo', 45, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3303, '1885', 'Njisi', 55, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3304, '2185', 'Njiwa', 65, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3305, '460', 'Njoge', 51, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3306, '1195', 'Njoro', 83, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3307, '1278', 'Njoro', 109, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3308, '1599', 'Njoro', 49, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3309, '1540', 'Nkaiti', 3, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3310, '3529', 'Nkalakala', 76, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3311, '2659', 'Nkalalo', 54, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3312, '3028', 'Nkandasi', 99, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3313, '1821', 'Nkende', 123, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3314, '2805', 'Nkilizya', 127, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3315, '3641', 'Nkinga', 20, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3316, '3710', 'Nkiniziwa', 102, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3317, '3530', 'Nkinto', 76, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3318, '34', 'Nkoanekoli', 1, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3319, '35', 'Nkoanrua', 1, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3320, '36', 'Nkoaranga', 1, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3321, '37', 'Nkoarisambu', 1, '2024-09-21 20:19:52', '2024-09-21 20:19:52');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(3322, '1886', 'Nkokwa', 55, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3323, '3029', 'Nkomolo', 99, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3324, '3990', 'Nkongoi', 60, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3325, '3506', 'Nkonko', 66, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3326, '1457', 'Nkowe', 106, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3327, '409', 'Nkuhungu', 15, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3328, '534', 'Nkuhungu', 15, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3329, '4051', 'Nkumba', 88, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3330, '2012', 'Nkunga', 108, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3331, '2685', 'Nkungulu', 64, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3332, '1854', 'Nkungungu', 14, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3333, '1073', 'Nkungwe', 40, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3334, '1124', 'Nkungwe', 40, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3335, '1887', 'Nkuyu', 55, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3336, '804', 'Nkwenda', 56, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3337, '1958', 'Nonde', 69, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3338, '2064', 'Nonde', 69, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3339, '311', 'Nondwa', 5, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3340, '2100', 'Nongwe', 16, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3341, '106', 'Noondoto', 59, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3342, '1959', 'Nsalaga', 69, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3343, '2065', 'Nsalaga', 69, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3344, '1960', 'Nsalala', 69, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3345, '2066', 'Nsalala', 69, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3346, '3374', 'Nsalala', 112, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3347, '3417', 'Nsalala', 112, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3348, '932', 'Nsemulwa', 84, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3349, '3781', 'Nsenda', 129, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3350, '909', 'Nsenkwa', 80, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3351, '868', 'Nshamba', 89, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3352, '755', 'Nshambya', 8, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3353, '933', 'Nsimbo', 84, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3354, '3813', 'Nsimbo', 131, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3355, '1961', 'Nsoho', 69, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3356, '2067', 'Nsoho', 69, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3357, '3814', 'Nsololo', 131, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3358, '829', 'Nsunga', 73, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3359, '2013', 'Ntaba', 108, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3360, '3769', 'Ntalikwa', 119, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3361, '3846', 'Ntalikwa', 119, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3362, '3030', 'Ntatumbila', 99, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3363, '3075', 'Ntendo', 118, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3364, '890', 'Ntobeye', 97, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3365, '3296', 'Ntobo', 26, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3366, '3642', 'Ntobo', 20, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3367, '3564', 'Ntonge', 116, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3368, '3603', 'Ntonge', 116, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3369, '3031', 'Ntuchi', 99, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3370, '3458', 'Ntuntu', 21, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3371, '3477', 'Ntwike', 24, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3372, '410', 'Ntyuka', 15, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3373, '535', 'Ntyuka', 15, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3374, '986', 'Nyabibuye', 27, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3375, '779', 'Nyabiyonza', 30, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3376, '1762', 'Nyaburongo', 105, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3377, '712', 'Nyabusozi', 6, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3378, '1014', 'Nyachenda', 34, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3379, '3297', 'Nyahanga', 26, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3380, '1763', 'Nyahongo', 105, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3381, '3739', 'Nyahua', 114, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3382, '780', 'Nyaishozi', 30, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3383, '781', 'Nyakabanga', 30, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3384, '869', 'Nyakabango', 89, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3385, '782', 'Nyakahanga', 30, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3386, '713', 'Nyakahura', 6, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3387, '783', 'Nyakakika', 30, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3388, '2769', 'Nyakaliro', 110, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3389, '2770', 'Nyakasasa', 110, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3390, '784', 'Nyakasimbi', 30, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3391, '2771', 'Nyakasungwa', 110, '2024-09-21 20:19:52', '2024-09-21 20:19:52'),
(3392, '870', 'Nyakatanga', 89, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3393, '1735', 'Nyakatende', 90, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3394, '1736', 'Nyakato', 90, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3395, '756', 'Nyakato', 8, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3396, '2628', 'Nyakato', 23, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3397, '805', 'Nyakatuntu', 56, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3398, '757', 'Nyakibimbili', 8, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3399, '891', 'Nyakisasa', 97, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3400, '1015', 'Nyakitonto', 34, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3401, '1822', 'Nyakonga', 123, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3402, '610', 'Nyalumbu', 42, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3403, '2732', 'Nyamagana', 100, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3404, '1764', 'Nyamagaro', 105, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3405, '892', 'Nyamagoma', 97, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3406, '714', 'Nyamahanga', 6, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3407, '1682', 'Nyamakokoto', 9, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3408, '3375', 'Nyamalogo', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3409, '3418', 'Nyamalogo', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3410, '1683', 'Nyamang\'uta', 9, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3411, '2806', 'Nyamanga', 127, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3412, '2629', 'Nyamanoro', 23, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3413, '1737', 'Nyamatare', 90, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3414, '1792', 'Nyamatare', 111, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3415, '2963', 'Nyamato', 79, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3416, '2772', 'Nyamatongo', 110, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3417, '2773', 'Nyamazugo', 110, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3418, '2660', 'Nyambiti', 54, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3419, '1738', 'Nyambono', 90, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3420, '1793', 'Nyambureti', 111, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3421, '2630', 'Nyamhongolo', 23, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3422, '893', 'Nyamiaga', 97, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3423, '1016', 'Nyamidaho', 34, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3424, '715', 'Nyamigogo', 6, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3425, '1684', 'Nyamihyoro', 9, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3426, '2661', 'Nyamilama', 54, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3427, '3298', 'Nyamilangano', 26, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3428, '1706', 'Nyamimange', 10, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3429, '1823', 'Nyamisangura', 123, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3430, '2774', 'Nyamizeze', 110, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3431, '1017', 'Nyamnyusi', 34, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3432, '1794', 'Nyamoko', 111, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3433, '2775', 'Nyampande', 110, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3434, '2776', 'Nyampulukano', 110, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3435, '1739', 'Nyamrandirira', 90, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3436, '1765', 'Nyamtinga', 105, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3437, '987', 'Nyamtukuza', 27, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3438, '974', 'Nyamugali', 7, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3439, '1766', 'Nyamunga', 105, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3440, '1685', 'Nyamuswa', 9, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3441, '1824', 'Nyamwaga', 123, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3442, '3643', 'Nyandekwa', 20, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3443, '3299', 'Nyandekwa', 26, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3444, '2274', 'Nyandira', 91, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3445, '1825', 'Nyandoto', 123, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3446, '588', 'Nyang\'oro', 25, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3447, '694', 'Nyang\'oro', 25, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3448, '758', 'Nyanga', 8, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3449, '1371', 'Nyangamara', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3450, '1500', 'Nyangamara', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3451, '1372', 'Nyangao', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3452, '1501', 'Nyangao', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3453, '2686', 'Nyanguge', 64, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3454, '1707', 'Nyankanga', 10, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3455, '3300', 'Nyankende', 26, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3456, '1018', 'Nyansha', 34, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3457, '1826', 'Nyansincha', 123, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3458, '1795', 'Nyansurura', 111, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3459, '716', 'Nyantakara', 6, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3460, '1827', 'Nyanungu', 123, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3461, '717', 'Nyanza', 6, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3462, '2777', 'Nyanzenda', 110, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3463, '611', 'Nyanzwa', 42, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3464, '1828', 'Nyarero', 123, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3465, '1074', 'Nyarubanda', 40, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3466, '1125', 'Nyarubanda', 40, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3467, '718', 'Nyarubungo', 6, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3468, '1829', 'Nyarukoba', 123, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3469, '1041', 'Nyaruyoba', 38, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3470, '806', 'Nyaruzumbura', 56, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3471, '2408', 'Nyasa', 67, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3472, '2631', 'Nyasaka', 23, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3473, '1740', 'Nyasho', 90, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3474, '3301', 'Nyasubi', 26, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3475, '1686', 'Nyasura', 9, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3476, '1767', 'Nyathorogo', 105, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3477, '2778', 'Nyatukara', 110, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3478, '1687', 'Nyatwali', 9, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3479, '2733', 'Nyegezi', 100, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3480, '1741', 'Nyegina', 90, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3481, '2779', 'Nyehunge', 110, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3482, '1373', 'Nyengedi', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3483, '1502', 'Nyengedi', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3484, '3376', 'Nyida', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3485, '3419', 'Nyida', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3486, '2687', 'Nyigogo', 64, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3487, '3302', 'Nyihogo', 26, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3488, '647', 'Nyololo', 87, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3489, '3125', 'Nyoni', 70, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3490, '1019', 'Nyumbigwa', 34, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3491, '2459', 'Nyundo', 86, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3492, '2602', 'Nyundo', 86, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3493, '3711', 'Nzega Mjini Magharibi', 102, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3494, '3712', 'Nzega Mjini Mashariki', 102, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3495, '3713', 'Nzega Ndogo', 102, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3496, '589', 'Nzihi', 25, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3497, '695', 'Nzihi', 25, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3498, '1962', 'Nzovwe', 69, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3499, '2068', 'Nzovwe', 69, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3500, '3815', 'Nzubuka', 131, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3501, '411', 'Nzuguni', 15, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3502, '536', 'Nzuguni', 15, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3503, '185', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Arusha', 2, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3504, '702', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Iringa', 25, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3505, '1134', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Kigoma', 40, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3506, '1512', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Lindi', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3507, '2083', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Mbeya', 69, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3508, '2362', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Morogoro', 82, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3509, '2613', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Mtwara', 86, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3510, '3433', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Shinyanga', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3511, '3612', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Singida', 116, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3512, '3853', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Tabora', 119, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3513, '184', 'Ofisi ya Mkurugenzi wa Halmashauri ya Jiji la Arusha', 2, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3514, '542', 'Ofisi ya Mkurugenzi wa Halmashauri ya Jiji la Dodoma', 15, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3515, '2082', 'Ofisi ya Mkurugenzi wa Halmashauri ya Jiji la Mbeya', 69, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3516, '4130', 'Ofisi ya Mkurugenzi wa Halmashauri ya Jiji la Tanga', 121, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3517, '701', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Iringa', 25, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3518, '1133', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Kigoma Ujiji', 40, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3519, '1511', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Lindi', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3520, '2360', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Morogoro', 82, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3521, '2614', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Mtwara Mikindani', 86, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3522, '3432', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Shinyanga', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3523, '3613', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Singida', 116, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3524, '3851', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Tabora', 119, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3525, '186', 'Ofisi ya Mkuu wa Mkoa wa Arusha', 2, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3526, '545', 'Ofisi ya Mkuu wa Mkoa wa Dodoma', 15, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3527, '699', 'Ofisi ya Mkuu wa Mkoa wa Iringa', 25, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3528, '896', 'Ofisi ya Mkuu wa Mkoa wa Kagera', 8, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3529, '2827', 'Ofisi ya Mkuu wa Mkoa wa Kaskazini Pemba', 132, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3530, '2828', 'Ofisi ya Mkuu wa Mkoa wa Kaskazini Pemba', 132, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3531, '4196', 'Ofisi ya Mkuu wa Mkoa wa Kaskazini Unguja', 32, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3532, '4197', 'Ofisi ya Mkuu wa Mkoa wa Kaskazini Unguja', 32, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3533, '955', 'Ofisi ya Mkuu wa Mkoa wa Katavi', 84, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3534, '1132', 'Ofisi ya Mkuu wa Mkoa wa Kigoma', 40, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3535, '1306', 'Ofisi ya Mkuu wa Mkoa wa Kilimanjaro', 83, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3536, '2848', 'Ofisi ya Mkuu wa Mkoa wa Kusini Pemba', 78, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3537, '2849', 'Ofisi ya Mkuu wa Mkoa wa Kusini Pemba', 78, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3538, '4210', 'Ofisi ya Mkuu wa Mkoa wa Kusini Unguja', 53, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3539, '4211', 'Ofisi ya Mkuu wa Mkoa wa Kusini Unguja', 53, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3540, '1510', 'Ofisi ya Mkuu wa Mkoa wa Lindi', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3541, '1657', 'Ofisi ya Mkuu wa Mkoa wa Manyara', 3, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3542, '1836', 'Ofisi ya Mkuu wa Mkoa wa Mara', 90, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3543, '2080', 'Ofisi ya Mkuu wa Mkoa wa Mbeya', 69, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3544, '4177', 'Ofisi ya Mkuu wa Mkoa wa Mjini Magharibi', 75, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3545, '4178', 'Ofisi ya Mkuu wa Mkoa wa Mjini Magharibi', 75, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3546, '2361', 'Ofisi ya Mkuu wa Mkoa wa Morogoro', 82, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3547, '2611', 'Ofisi ya Mkuu wa Mkoa wa Mtwara', 86, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3548, '2983', 'Ofisi ya Mkuu wa Mkoa wa Pwani', 36, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3549, '3081', 'Ofisi ya Mkuu wa Mkoa wa Rukwa', 118, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3550, '3430', 'Ofisi ya Mkuu wa Mkoa wa Shinyanga', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3551, '3610', 'Ofisi ya Mkuu wa Mkoa wa Singida', 116, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3552, '3852', 'Ofisi ya Mkuu wa Mkoa wa Tabora', 119, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3553, '4131', 'Ofisi ya Mkuu wa Mkoa wa Tanga', 121, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3554, '187', 'Ofisi ya Mkuu wa Wilaya ya  Arusha', 2, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3555, '544', 'Ofisi ya Mkuu wa Wilaya ya  Dodoma', 15, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3556, '700', 'Ofisi ya Mkuu wa Wilaya ya  Iringa', 25, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3557, '1131', 'Ofisi ya Mkuu wa Wilaya ya  Kigoma', 40, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3558, '1513', 'Ofisi ya Mkuu wa Wilaya ya  Lindi', 57, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3559, '2081', 'Ofisi ya Mkuu wa Wilaya ya  Mbeya', 69, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3560, '2359', 'Ofisi ya Mkuu wa Wilaya ya  Morogoro', 82, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3561, '2612', 'Ofisi ya Mkuu wa Wilaya ya  Mtwara', 86, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3562, '3431', 'Ofisi ya Mkuu wa Wilaya ya Shinyanga', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3563, '3611', 'Ofisi ya Mkuu wa Wilaya ya Singida', 116, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3564, '3850', 'Ofisi ya Mkuu wa Wilaya ya Tabora', 119, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3565, '4129', 'Ofisi ya Mkuu wa Wilaya ya Tanga', 121, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3566, '543', 'Ofisi ya Rais Dodoma Mjini', 15, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3567, '67', 'Olasiti', 2, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3568, '172', 'Olasiti', 2, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3569, '148', 'Olbalbal', 98, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3570, '1600', 'Olboloti', 49, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3571, '3478', 'Old Kiomboi', 24, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3572, '3947', 'Old Korogwe', 52, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3573, '1196', 'Old Moshi Magharibi', 83, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3574, '1197', 'Old Moshi Mashariki', 83, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3575, '3420', 'Old Shinyanga', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3576, '3429', 'Old Shinyanga', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3577, '3377', 'Old Shinyanga', 112, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3578, '90', 'Oldeani', 31, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3579, '149', 'Oldonyo Sambu', 98, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3580, '38', 'Oldonyosambu', 1, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3581, '39', 'Oldonyowas', 1, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3582, '2835', 'Ole', 11, '2024-09-21 20:19:53', '2024-09-21 20:19:53'),
(3583, '1247', 'Olele', 104, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3584, '40', 'Oljoro', 1, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3585, '1652', 'Oljoro No.5', 115, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3586, '1301', 'Olkolili', 113, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3587, '107', 'Olmolog', 59, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3588, '68', 'Olmoti', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3589, '173', 'Olmoti', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3590, '41', 'Olmotonyi', 1, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3591, '150', 'Oloipiri', 98, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3592, '42', 'Oloirien', 1, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3593, '69', 'Oloirien', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3594, '174', 'Oloirien', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3595, '151', 'Ololosokwan', 98, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3596, '152', 'Olorien/Magaiduru', 98, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3597, '43', 'Olturoto', 1, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3598, '44', 'Olturumet', 1, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3599, '108', 'Orbomba', 59, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3600, '153', 'Orgosorok', 98, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3601, '1653', 'Orkesumet', 115, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3602, '1302', 'Ormelili', 113, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3603, '70', 'Osunyai Jr', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3604, '175', 'Osunyai Jr', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3605, '369', 'Ovada', 13, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3606, '3905', 'Pagwi', 41, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3607, '439', 'Pahi', 50, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3608, '4209', 'Paje', 53, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3609, '2734', 'Pamba', 100, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3610, '3378', 'Pandagichiza', 112, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3611, '3421', 'Pandagichiza', 112, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3612, '461', 'Pandambili', 51, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3613, '2825', 'Pandani', 132, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3614, '1326', 'Pande', 45, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3615, '4052', 'Pande Darajani', 88, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3616, '3740', 'Pangale', 114, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3617, '2895', 'Pangani', 36, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3618, '4069', 'Pangani Magharibi', 103, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3619, '4070', 'Pangani Mashariki', 103, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3620, '1374', 'Pangatena', 57, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3621, '1503', 'Pangatena', 57, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3622, '4158', 'Pangawe', 63, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3623, '2964', 'Panzuo', 79, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3624, '2169', 'Parakuyo', 44, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3625, '3032', 'Paramawe', 99, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3626, '370', 'Paranga', 13, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3627, '3208', 'Parangu', 117, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3628, '1601', 'Partimbo', 49, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3629, '4020', 'Parungu Kasera', 77, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3630, '2632', 'Pasiansi', 23, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3631, '1198', 'Pasua', 83, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3632, '1830', 'Pemba', 123, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3633, '2275', 'Pemba', 91, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3634, '230', 'Pembamnazi', 39, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3635, '2870', 'Pera', 4, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3636, '3209', 'Peramiho', 117, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3637, '2896', 'Picha ya Ndege', 36, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3638, '2826', 'Piki', 132, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3639, '154', 'Pinyinyi', 98, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3640, '3076', 'Pito', 118, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3641, '155', 'Piyaya', 98, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3642, '45', 'Poli', 1, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3643, '4096', 'Pongwe', 121, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3644, '4123', 'Pongwe', 121, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3645, '4053', 'Potwe', 88, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3646, '3714', 'Puge', 102, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3647, '216', 'Pugu', 22, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3648, '217', 'Pugu Station', 22, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3649, '3459', 'Puma', 21, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3650, '3422', 'Puni', 112, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3651, '3379', 'Puni', 112, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3652, '495', 'Pwaga', 85, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3653, '1541', 'Qameyu', 3, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3654, '1542', 'Qash', 3, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3655, '91', 'Qurus', 31, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3656, '1768', 'Rabour', 105, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3657, '1433', 'Raha leo', 93, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3658, '1375', 'Rahaleo', 57, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3659, '1504', 'Rahaleo', 57, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3660, '2460', 'Rahaleo', 86, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3661, '2603', 'Rahaleo', 86, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3662, '4173', 'Rahaleo', 75, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3663, '3991', 'Rangwi', 60, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3664, '1769', 'Raranya', 105, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3665, '1376', 'Rasbura', 57, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3666, '1505', 'Rasbura', 57, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3667, '1199', 'Rau', 83, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3668, '1831', 'Regicheri', 123, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3669, '1248', 'Reha', 104, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3670, '2461', 'Reli', 86, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3671, '2604', 'Reli', 86, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3672, '92', 'Rhotia', 31, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3673, '1796', 'Rigicha', 111, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3674, '1797', 'Ring\'wani', 111, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3675, '1543', 'Riroda', 3, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3676, '1770', 'Roche', 105, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3677, '1151', 'Romu', 17, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3678, '2170', 'Ruaha', 44, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3679, '590', 'Ruaha', 25, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3680, '696', 'Ruaha', 25, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3681, '2295', 'Ruaha', 128, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3682, '612', 'Ruaha Mbuyuni', 42, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3683, '1963', 'Ruanda', 69, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3684, '2069', 'Ruanda', 69, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3685, '3126', 'Ruanda', 70, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3686, '1458', 'Ruangwa', 106, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3687, '2918', 'Ruaruke', 37, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3688, '759', 'Rubafu', 8, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3689, '760', 'Rubale', 8, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3690, '2101', 'Rubeho', 16, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3691, '1075', 'Rubuga', 40, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3692, '1126', 'Rubuga', 40, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3693, '2171', 'Rudewa', 44, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3694, '496', 'Rudi', 85, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3695, '988', 'Rugenge', 27, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3696, '785', 'Rugera', 30, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3697, '1042', 'Rugongwe', 38, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3698, '786', 'Rugu', 30, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3699, '871', 'Ruhanga', 89, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3700, '2172', 'Ruhembe', 44, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3701, '1020', 'Ruhita', 34, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3702, '761', 'Ruhunga', 8, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3703, '3210', 'Ruhuwiko', 117, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3704, '1906', 'Ruiwa', 68, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3705, '1907', 'Rujewa', 68, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3706, '762', 'Rukoma', 8, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3707, '807', 'Rukuraijo', 56, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3708, '872', 'Rulanda', 89, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3709, '894', 'Rulenge', 97, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3710, '719', 'Runazi', 6, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3711, '1798', 'Rung\'abure', 111, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3712, '648', 'Rungemba', 87, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3713, '3507', 'Rungwa', 66, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3714, '1021', 'Rungwe Mpya', 34, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3715, '1434', 'Ruponda', 93, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3716, '975', 'Rusaba', 7, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3717, '1022', 'Rusesa', 34, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3718, '1076', 'Rusimbi', 40, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3719, '1127', 'Rusimbi', 40, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3720, '1043', 'Rusohoko', 38, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3721, '1742', 'Rusoli', 90, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3722, '895', 'Rusumo', 97, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3723, '1377', 'Rutamba', 57, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3724, '1506', 'Rutamba', 57, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3725, '873', 'Rutoro', 89, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3726, '808', 'Rutunguru', 56, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3727, '1279', 'Ruvu', 109, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3728, '2897', 'Ruvu', 36, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3729, '1654', 'Ruvu Remit', 115, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3730, '3211', 'Ruvuma', 117, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3731, '3255', 'Ruvuma', 117, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3732, '720', 'Ruziba', 6, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3733, '830', 'Ruzinga', 73, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3734, '809', 'Rwabwere', 56, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3735, '763', 'Rwamishenye', 8, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3736, '1743', 'Rwamlimi', 90, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3737, '3150', 'Rwinga', 94, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3738, '2349', 'Saba Saba', 82, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3739, '2238', 'Saba Saba', 82, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3740, '1832', 'Sabasaba', 123, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3741, '3303', 'Sabasabini', 26, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3742, '649', 'Sadani', 87, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3743, '462', 'Sagara', 51, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3744, '71', 'Sakina', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3745, '176', 'Sakina', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3746, '2919', 'Salale', 37, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3747, '1688', 'Salama', 9, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3748, '440', 'Salanka', 50, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3749, '3380', 'Salawe', 112, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3750, '3423', 'Salawe', 112, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3751, '156', 'Sale', 98, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3752, '2296', 'Sali', 128, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3753, '3003', 'Samazi', 28, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3754, '46', 'Sambasha', 1, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3755, '1280', 'Same', 109, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3756, '157', 'Samunge', 98, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3757, '3381', 'Samuye', 112, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3758, '3424', 'Samuye', 112, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3759, '272', 'Sandali', 124, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3760, '3077', 'Sandulula', 118, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3761, '2633', 'Sangabuye', 23, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3762, '1855', 'Sangambi', 14, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3763, '3508', 'Sanjaranda', 66, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3764, '2133', 'Sanje', 43, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3765, '1964', 'Santilya', 69, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3766, '2070', 'Santilya', 69, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3767, '1632', 'Sanu Baray', 71, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3768, '1303', 'Sanya Juu', 113, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3769, '3509', 'Sanza', 66, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3770, '371', 'Sanzawa', 13, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3771, '650', 'Sao Hill', 87, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3772, '3510', 'Saranda', 66, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3773, '288', 'Saranga', 126, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3774, '3511', 'Sasajila', 66, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3775, '3512', 'Sasilo', 66, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3776, '3666', 'Sasu', 29, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3777, '3906', 'Saunyi', 41, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3778, '1689', 'Sazira', 9, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3779, '1544', 'Secheda', 3, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3780, '1799', 'SEDECO', 111, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3781, '3212', 'Seedfarm', 117, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3782, '47', 'Seela Sing\'isi', 1, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3783, '347', 'Segala', 12, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3784, '3885', 'Segera', 19, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3785, '218', 'Segerea', 22, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3786, '3304', 'Segese', 26, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3787, '463', 'Sejeli', 51, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3788, '3336', 'Seke-Bugoro', 48, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3789, '72', 'Sekei', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3790, '177', 'Sekei', 2, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3791, '129', 'Selela', 81, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3792, '3667', 'Seleli', 29, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3793, '2350', 'Selembala', 82, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3794, '2239', 'Selembala', 82, '2024-09-21 20:19:54', '2024-09-21 20:19:54'),
(3795, '3715', 'Semembela', 102, '2024-09-21 20:19:54', '2024-09-21 20:19:55'),
(3796, '3078', 'Senga', 118, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3797, '2484', 'Sengenya', 95, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3798, '130', 'Sepeko', 81, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3799, '3460', 'Sepuka', 21, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3800, '1888', 'Serengeti', 55, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3801, '441', 'Serya', 50, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3802, '3992', 'Shagayu', 60, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3803, '3337', 'Shagihilu', 48, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3804, '1655', 'Shambarai', 115, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3805, '48', 'Shambarai Burka', 1, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3806, '2462', 'Shangani', 86, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3807, '2605', 'Shangani', 86, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3808, '934', 'Shanwe', 84, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3809, '4174', 'Shaurimoyo', 75, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3810, '3479', 'Shelui', 24, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3811, '2634', 'Shibula', 23, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3812, '3716', 'Shigamba', 102, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3813, '1224', 'Shighatini', 92, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3814, '2713', 'Shilalo', 74, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3815, '3305', 'Shilela', 26, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3816, '2662', 'Shilembo', 54, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3817, '1249', 'Shimbi', 104, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3818, '1250', 'Shimbi Kwadele', 104, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3819, '3434', 'SHINYANGA', 112, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3820, '1200', 'Shirimatunda', 83, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3821, '2688', 'Shishani', 64, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3822, '3816', 'Shitage', 131, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3823, '1965', 'Shizuvi', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3824, '2071', 'Shizuvi', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3825, '3993', 'Shume', 60, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3826, '2965', 'Shungubweni', 79, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3827, '1023', 'Shunguliba', 34, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3828, '953', 'Sibwesa', 122, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3829, '4021', 'Sigaya', 77, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3830, '3717', 'Sigili', 102, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3831, '1545', 'Sigino', 3, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3832, '2134', 'Signal', 43, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3833, '1092', 'Sigunga', 130, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3834, '3741', 'Sikonge', 114, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3835, '1633', 'Silaloda', 71, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3836, '3668', 'Silambo', 29, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3837, '2780', 'Sima', 110, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3838, '1578', 'Simbay', 18, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3839, '3644', 'Simbo', 20, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3840, '1077', 'Simbo', 40, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3841, '1128', 'Simbo', 40, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3842, '2409', 'Sindano', 67, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3843, '1966', 'Sinde', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3844, '2072', 'Sinde', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3845, '3886', 'Sindeni', 19, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3846, '1546', 'Singe', 3, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3847, '3614', 'SINGIDA', 116, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3848, '2351', 'Singisa', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3849, '2240', 'Singisa', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3850, '73', 'Sinoni', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3851, '178', 'Sinoni', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3852, '3033', 'Sintali', 99, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3853, '109', 'Sinya', 59, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3854, '289', 'Sinza', 126, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3855, '1833', 'Sirari', 123, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3856, '1579', 'Sirop', 18, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3857, '1708', 'SiroriSimba', 10, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3858, '3252', 'Sisi kwa sisi', 125, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3859, '1967', 'Sisimba', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3860, '2073', 'Sisimba', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3861, '935', 'SITALIKE', 84, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3862, '3461', 'Siuyu', 21, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3863, '2814', 'Sizini', 72, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3864, '442', 'Soera', 50, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3865, '2186', 'Sofi', 65, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3866, '2898', 'Sofu', 36, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3867, '2899', 'Soga', 36, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3868, '4175', 'Sogea', 75, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3869, '158', 'Soitsambu', 98, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3870, '74', 'Sokon I', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3871, '179', 'Sokon I', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3872, '49', 'Sokon II', 1, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3873, '3425', 'Solwa', 112, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3874, '3382', 'Solwa', 112, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3875, '3513', 'Solya', 66, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3876, '3338', 'Somagedi', 48, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3877, '1327', 'Somanga', 45, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3878, '231', 'Somangila', 39, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3879, '75', 'Sombetini', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3880, '180', 'Sombetini', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3881, '4054', 'Songa', 88, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3882, '3782', 'Songambele', 129, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3883, '1602', 'Songambele', 49, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3884, '464', 'Songambele', 51, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3885, '810', 'Songambele', 56, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3886, '3907', 'Songe', 41, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3887, '372', 'Songolo', 13, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3888, '50', 'Songoro', 1, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3889, '1328', 'Songosongo', 45, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3890, '1304', 'Songu', 113, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3891, '3339', 'Songwa', 48, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3892, '3994', 'Soni', 60, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3893, '3004', 'Sopa', 28, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3894, '1201', 'Soweto', 83, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3895, '373', 'Soya', 13, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3896, '1800', 'Stendi Kuu', 111, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3897, '1281', 'Stesheni', 109, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3898, '1435', 'Stesheni', 93, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3899, '3213', 'Subira', 117, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3900, '1378', 'Sudi', 57, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3901, '1507', 'Sudi', 57, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3902, '1744', 'Suguti', 90, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3903, '1282', 'Suji', 109, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3904, '2689', 'Sukuma', 64, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3905, '2352', 'Sultan Area', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3906, '2241', 'Sultan Area', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3907, '2410', 'Sululu', 67, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3908, '2014', 'Suma', 108, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3909, '3079', 'Sumbawanga', 118, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3910, '2714', 'Sumbugu', 74, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3911, '2663', 'Sumve', 54, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3912, '3005', 'Sundu', 28, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3913, '3995', 'Sunga', 60, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3914, '2276', 'Sungaji', 91, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3915, '3645', 'Sungwizi', 20, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3916, '1093', 'Sunuka', 130, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3917, '1603', 'Sunya', 49, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3918, '443', 'Suruke', 50, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3919, '1834', 'Susuni', 123, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3920, '1968', 'Swaya', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3921, '2015', 'Swaya', 108, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3922, '2074', 'Swaya', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3923, '2781', 'Tabaruka', 110, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3924, '219', 'Tabata', 22, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3925, '3854', 'TABORA', 119, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3926, '1283', 'Tae', 109, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3927, '1771', 'Tai', 105, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3928, '3340', 'Talaga', 48, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3929, '1889', 'Talatala', 55, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3930, '2871', 'Talawanda', 4, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3931, '3646', 'Tambalale', 20, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3932, '2966', 'Tambani', 79, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3933, '3770', 'Tambuka-Reli', 119, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3934, '3847', 'Tambuka-Reli', 119, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3935, '3514', 'Tambukareli', 66, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3936, '412', 'Tambukareli', 15, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3937, '537', 'Tambukareli', 15, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3938, '3996', 'Tamota', 60, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3939, '2554', 'Tandahimba', 120, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3940, '252', 'Tandale', 46, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3941, '1379', 'Tandangongoro', 57, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3942, '1508', 'Tandangongoro', 57, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3943, '273', 'Tandika', 124, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3944, '2463', 'Tandika', 86, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3945, '2606', 'Tandika', 86, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3946, '3214', 'Tanga', 117, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3947, '4132', 'TANGA', 121, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3948, '4055', 'Tanganyika', 88, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3949, '4127', 'Tanganyika', 88, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3950, '4097', 'Tangasisi', 121, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3951, '4124', 'Tangasisi', 121, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3952, '4128', 'Tangasisi', 121, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3953, '2464', 'Tangazo', 86, '2024-09-21 20:19:55', '2024-09-21 20:19:55');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(3954, '2607', 'Tangazo', 86, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3955, '2900', 'Tangini', 36, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3956, '1251', 'Tarakea Motamburu', 104, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3957, '51', 'Tarakwa', 1, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3958, '2353', 'Tawa', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3959, '2242', 'Tawa', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3960, '4187', 'Tazari', 32, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3961, '2277', 'Tchenzema', 91, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3962, '1745', 'Tegeruka', 90, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3963, '2243', 'Tegetero', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3964, '2354', 'Tegetero', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3965, '1969', 'Tembela', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3966, '1970', 'Tembela', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3967, '2075', 'Tembela', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3968, '2076', 'Tembela', 69, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3969, '2411', 'Temeke', 67, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3970, '274', 'Temeke', 124, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3971, '2967', 'Tengelea', 79, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3972, '76', 'Terrat', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3973, '181', 'Terrat', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3974, '1656', 'Terrat', 115, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3975, '444', 'Thawi', 50, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3976, '77', 'Themi', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3977, '182', 'Themi', 2, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3978, '2836', 'Tibirinzi', 11, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3979, '3383', 'Tinde', 112, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3980, '3426', 'Tinde', 112, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3981, '2173', 'Tindiga', 44, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3982, '110', 'Tingatinga', 59, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3983, '4056', 'Tingeni', 88, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3984, '1329', 'Tingi', 45, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3985, '3169', 'Tingi', 101, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3986, '3253', 'Tinginya', 125, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3987, '1024', 'Titye', 34, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3988, '1634', 'Tlawi', 71, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3989, '275', 'Toangoma', 124, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3990, '1225', 'Toloha', 92, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3991, '2244', 'Tomondo', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3992, '2355', 'Tomondo', 82, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3993, '3718', 'Tongi', 102, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3994, '4098', 'Tongoni', 121, '2024-09-21 20:19:55', '2024-09-21 20:19:55'),
(3995, '4125', 'Tongoni', 121, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(3996, '4057', 'Tongwe', 88, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(3997, '954', 'Tongwe', 122, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(3998, '2522', 'Tulindane', 96, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(3999, '3480', 'Tulya', 24, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4000, '1635', 'Tumati', 71, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4001, '374', 'Tumbakose', 13, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4002, '4188', 'Tumbatu', 32, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4003, '2815', 'Tumbe', 72, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4004, '2901', 'Tumbi', 36, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4005, '3771', 'Tumbi', 119, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4006, '3848', 'Tumbi', 119, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4007, '3531', 'Tumuli', 76, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4008, '4071', 'Tungamaa', 103, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4009, '232', 'Tungi', 39, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4010, '2245', 'Tungi', 82, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4011, '2356', 'Tungi', 82, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4012, '3908', 'Tunguli', 41, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4013, '4204', 'Tunguu', 35, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4014, '2357', 'Tununguo', 82, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4015, '2246', 'Tununguo', 82, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4016, '3817', 'Tura', 131, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4017, '1835', 'Turwa', 123, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4018, '3742', 'Tutuo', 114, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4019, '3254', 'Tuwemacho', 125, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4020, '4205', 'Ubago', 35, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4021, '3306', 'Ubagwe', 26, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4022, '4072', 'Ubangaa', 103, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4023, '1908', 'Ubaruku', 68, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4024, '2872', 'Ubenazomozi', 4, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4025, '1252', 'Ubetu Kahe', 104, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4026, '3997', 'Ubiri', 60, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4027, '290', 'Ubungo', 126, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4028, '3719', 'Uchama', 102, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4029, '2135', 'Uchindile', 43, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4030, '3341', 'Uchunga', 48, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4031, '613', 'Udekwa', 42, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4032, '3720', 'Uduka', 102, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4033, '1547', 'Ufana', 3, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4034, '2465', 'Ufukoni', 86, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4035, '2608', 'Ufukoni', 86, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4036, '3669', 'Ufukutwa', 29, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4037, '3818', 'Ufuluma', 131, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4038, '3647', 'Ugaka', 20, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4039, '3783', 'Ugalla', 129, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4040, '936', 'UGALLA', 84, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4041, '1436', 'Ugawaji', 93, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4042, '3721', 'Ugembe', 102, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4043, '3565', 'Ughandi', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4044, '3604', 'Ughandi', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4045, '465', 'Ugogoni', 51, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4046, '3670', 'Ugunga', 29, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4047, '3566', 'Uhamaka', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4048, '3605', 'Uhamaka', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4049, '614', 'Uhambingeto', 42, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4050, '413', 'Uhuru', 15, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4051, '538', 'Uhuru', 15, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4052, '1636', 'Uhuru', 71, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4053, '3127', 'Ukata', 70, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4054, '3342', 'Ukenyenge', 48, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4055, '2715', 'Ukiriguru', 74, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4056, '3784', 'Ukondamoyo', 129, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4057, '220', 'Ukonga', 22, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4058, '615', 'Ukumbi', 42, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4059, '3671', 'Ukumbi Siganga', 29, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4060, '3307', 'Ukune', 26, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4061, '2102', 'Ukwamani', 16, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4062, '616', 'Ukwega', 42, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4063, '591', 'Ulanda', 25, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4064, '697', 'Ulanda', 25, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4065, '2174', 'Ulaya', 44, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4066, '2175', 'Uleling\'ombe', 44, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4067, '3481', 'Ulemo', 24, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4068, '1971', 'Ulenje', 69, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4069, '2077', 'Ulenje', 69, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4070, '3308', 'Ulewe', 26, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4071, '3309', 'Ulowa', 26, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4072, '3006', 'Ulumi', 28, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4073, '2981', 'Umwe', 107, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4074, '78', 'Unga Ltd', 2, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4075, '183', 'Unga Ltd', 2, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4076, '3462', 'Unyahati', 21, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4077, '3567', 'Unyambwa', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4078, '3606', 'Unyambwa', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4079, '3568', 'Unyamikumbi', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4080, '3607', 'Unyamikumbi', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4081, '3569', 'Unyianga', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4082, '3608', 'Unyianga', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4083, '221', 'Upanga Magharibi', 22, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4084, '222', 'Upanga Mashariki', 22, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4085, '651', 'Upendo', 87, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4086, '1856', 'Upendo', 14, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4087, '3170', 'Upolo', 101, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4088, '2297', 'Uponera', 128, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4089, '3819', 'Upuge', 131, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4090, '3785', 'Urambo', 129, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4091, '1202', 'Uru Kaskazini', 83, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4092, '1203', 'Uru Kusini', 83, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4093, '1204', 'Uru Mashariki', 83, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4094, '1205', 'Uru Shimbwe', 83, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4095, '3482', 'Urughu', 24, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4096, '4176', 'Urusi', 75, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4097, '937', 'URUWILA', 84, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4098, '52', 'Usa river', 1, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4099, '2716', 'Usagara', 74, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4100, '4099', 'Usagara', 121, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4101, '4126', 'Usagara', 121, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4102, '3820', 'Usagari', 131, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4103, '3998', 'Usambara', 60, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4104, '3427', 'Usanda', 112, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4105, '3384', 'Usanda', 112, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4106, '2187', 'Usangule', 65, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4107, '3672', 'Usenye', 29, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4108, '910', 'Usevya', 80, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4109, '3310', 'Ushetu', 26, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4110, '1253', 'Ushiri/Ikuini', 104, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4111, '3673', 'Ushokola', 29, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4112, '3674', 'Usimba', 29, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4113, '3675', 'Usinge', 29, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4114, '3786', 'Usisya', 129, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4115, '3787', 'Ussoke', 129, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4116, '3385', 'Usule', 112, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4117, '3428', 'Usule', 112, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4118, '3743', 'Usunga', 114, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4119, '3648', 'Uswaya', 20, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4120, '3570', 'Utemini', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4121, '3609', 'Utemini', 116, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4122, '911', 'Utende', 80, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4123, '2136', 'Utengule', 43, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4124, '1909', 'Utengule Usangu', 68, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4125, '1972', 'Utengule Usongwe', 69, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4126, '2078', 'Utengule Usongwe', 69, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4127, '2982', 'Utete', 107, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4128, '3128', 'Utiri', 70, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4129, '3722', 'Utwigu', 102, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4130, '1094', 'Uvinza', 130, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4131, '938', 'Uwanja wa ndege', 84, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4132, '1801', 'Uwanja wa ndege', 111, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4133, '2247', 'Uwanja wa Taifa', 82, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4134, '2358', 'Uwanja wa Taifa', 82, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4135, '53', 'Uwiro', 1, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4136, '3788', 'Uyogo', 129, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4137, '3311', 'Uyogo', 26, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4138, '1973', 'Uyole', 69, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4139, '2079', 'Uyole', 69, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4140, '3676', 'Uyowa', 29, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4141, '3772', 'Uyui', 119, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4142, '3849', 'Uyui', 119, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4143, '3789', 'Uyumbu', 129, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4144, '2968', 'Vianzi', 79, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4145, '3887', 'Vibaoni', 19, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4146, '2176', 'Vidunda', 44, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4147, '2466', 'Vigaeni', 86, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4148, '2609', 'Vigaeni', 86, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4149, '2298', 'Vigoi', 128, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4150, '2873', 'Vigwaza', 4, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4151, '2935', 'Vihingo', 47, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4152, '233', 'Vijibweni', 39, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4153, '4195', 'Vijibweni', 33, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4154, '2969', 'Vikindu', 79, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4155, '2936', 'Vikumburu', 47, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4156, '497', 'Ving\'hawe', 85, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4157, '223', 'Vingunguti', 22, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4158, '2902', 'Visiga', 36, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4159, '2837', 'Vitongoji', 11, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4160, '414', 'Viwandani', 15, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4161, '539', 'Viwandani', 15, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4162, '2137', 'Viwanjasitini', 43, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4163, '2903', 'Viziwa ziwa', 36, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4164, '1284', 'Vudee', 109, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4165, '3999', 'Vuga', 60, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4166, '3948', 'Vugiri', 52, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4167, '1285', 'Vuje', 109, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4168, '1286', 'Vumari', 109, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4169, '3790', 'Vumilia', 129, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4170, '1287', 'Vunta', 109, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4171, '1380', 'Wailes', 57, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4172, '1509', 'Wailes', 57, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4173, '2664', 'Walla', 54, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4174, '652', 'Wambi', 87, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4175, '3034', 'Wampembe', 99, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4176, '498', 'Wangi', 85, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4177, '2838', 'Wara', 11, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4178, '1580', 'Wareta', 18, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4179, '1690', 'Wariku', 9, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4180, '592', 'Wasa', 25, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4181, '698', 'Wasa', 25, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4182, '253', 'Wazo', 46, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4183, '3723', 'Wela', 102, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4184, '4144', 'Welezo', 62, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4185, '3312', 'Wendele', 26, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4186, '1152', 'Weruweru', 17, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4187, '2816', 'Wingwi', 72, '2024-09-21 20:19:56', '2024-09-21 20:19:56'),
(4188, '3215', 'Wino', 117, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4189, '499', 'Wotta', 85, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4190, '3129', 'Wukiro', 70, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4191, '1637', 'Yaeda Ampa', 71, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4192, '1638', 'Yaeda Chini', 71, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4193, '2874', 'Yombo', 4, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4194, '276', 'Yombo Vituka', 124, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4195, '348', 'Zajilwa', 12, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4196, '312', 'Zanka', 5, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4197, '3649', 'Ziba', 20, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4198, '3080', 'Zimba', 118, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4199, '2875', 'Zinga', 4, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4200, '224', 'Zingiziwa', 22, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4201, '4058', 'Zirai', 88, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4202, '1078', 'Ziwani', 40, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4203, '1129', 'Ziwani', 40, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4204, '2467', 'Ziwani', 86, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4205, '2610', 'Ziwani', 86, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4206, '466', 'Zoissa', 51, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4207, '2177', 'Zombo', 44, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4208, '3313', 'Zongomera', 26, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4209, '3677', 'Zugimlole', 29, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4210, '415', 'Zuzu', 15, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4211, '540', 'Zuzu', 15, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4212, '3483', 'Aghondi', 66, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4213, '1', 'Akheri', 1, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4214, '131', 'Alailelai', 98, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4215, '132', 'Alaitolei', 98, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4216, '1226', 'Aleni', 104, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4217, '4022', 'Amani', 88, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4218, '4159', 'Amani', 75, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4219, '3082', 'Amani Makoro', 70, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4220, '2', 'Ambureni', 1, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4221, '133', 'Arash', 98, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4222, '1515', 'Arri', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4223, '188', 'ARUSHA', 2, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4224, '1153', 'Arusha Chini', 83, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4225, '989', 'Asante Nyerere', 34, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4226, '1516', 'Ayalagaya', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4227, '1604', 'Ayamaami', 71, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4228, '1605', 'Ayamohe', 71, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4229, '1517', 'Ayasanda', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4230, '254', 'Azimio', 124, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4231, '1518', 'Babati', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4232, '291', 'Babayu', 5, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4233, '349', 'Babayu', 13, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4234, '3949', 'Baga', 60, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4235, '3909', 'Bagamoyo', 52, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4236, '1974', 'Bagamoyo', 108, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4237, '1519', 'Bagara', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4238, '292', 'Bahi', 5, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4239, '721', 'Bakoba', 8, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4240, '1548', 'Balang\'dalalu', 18, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4241, '2937', 'Baleni', 61, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4242, '1658', 'Balili', 9, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4243, '4198', 'Bambi', 35, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4244, '4179', 'Bandakuu', 32, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4245, '1254', 'Bangalala', 109, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4246, '3', 'Bangata', 1, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4247, '1044', 'Bangwe', 40, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4248, '1095', 'Bangwe', 40, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4249, '2735', 'Bangwe', 110, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4250, '54', 'Baraa', 2, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4251, '159', 'Baraa', 2, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4252, '1746', 'Baraki', 105, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4253, '79', 'Baray', 31, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4254, '1606', 'Bargish', 71, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4255, '1381', 'Barikiwa', 58, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4256, '1079', 'Basanza', 130, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4257, '1607', 'Bashay', 71, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4258, '1520', 'Bashnet', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4259, '1549', 'Bassodesh', 18, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4260, '1550', 'Bassotu', 18, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4261, '722', 'Behendangabo', 8, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4262, '1255', 'Bendera', 109, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4263, '2138', 'Berega', 44, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4264, '467', 'Berege', 85, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4265, '416', 'Bereko', 50, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4266, '2945', 'Beta', 79, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4267, '3083', 'Bethrehemu', 70, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4268, '2299', 'Bigwa', 82, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4269, '2188', 'Bigwa', 82, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4270, '704', 'Biharamulo Mjini', 6, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4271, '956', 'Biharu', 7, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4272, '831', 'Biirabo', 89, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4273, '723', 'Bilele', 8, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4274, '1802', 'Binagi', 123, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4275, '1288', 'Biriri', 113, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4276, '2178', 'Biro', 65, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4277, '2179', 'Biro', 65, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4278, '832', 'Bisheke', 89, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4279, '705', 'Bisibo', 6, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4280, '1691', 'Bisumwa', 10, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4281, '1045', 'Bitale', 40, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4282, '1096', 'Bitale', 40, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4283, '1025', 'Bitare', 38, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4284, '2736', 'Bitoto', 110, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4285, '1026', 'Biturana', 38, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4286, '1521', 'Boay', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4287, '2920', 'Boga', 47, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4288, '2876', 'Bokomnemela', 36, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4289, '3888', 'Bokwa', 41, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4290, '417', 'Bolisa', 50, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4291, '617', 'Boma', 87, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4292, '4000', 'Boma', 77, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4293, '2300', 'Boma', 82, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4294, '1401', 'Boma', 93, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4295, '2189', 'Boma', 82, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4296, '593', 'Bomalang\'ombe', 42, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4297, '1154', 'Bomambuzi', 83, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4298, '1136', 'Bomang\'ombe', 17, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4299, '1803', 'Bomani', 123, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4300, '3171', 'Bombambili', 117, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4301, '1256', 'Bombo', 109, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4302, '1910', 'Bonde la Songwe', 69, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4303, '2016', 'Bonde la Songwe', 69, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4304, '1137', 'Bondeni', 17, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4305, '1155', 'Bondeni', 83, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4306, '1857', 'Bondeni', 55, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4307, '1522', 'Bonga', 3, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4308, '189', 'Bonyokwa', 22, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4309, '2817', 'Bopwe', 132, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4310, '4001', 'Bosha', 77, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4311, '3314', 'Bubiki', 48, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4312, '4133', 'Bububu', 62, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4313, '3678', 'Budushi', 102, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4314, '990', 'Bugaga', 34, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4315, '811', 'Bugandika', 73, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4316, '2635', 'Bugando', 54, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4317, '833', 'Buganguzi', 89, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4318, '787', 'Bugara', 56, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4319, '874', 'Bugarama', 97, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4320, '3256', 'Bugarama', 26, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4321, '764', 'Bugene', 30, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4322, '80', 'Buger', 31, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4323, '2616', 'Bugogwa', 23, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4324, '1709', 'Bugoji', 90, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4325, '788', 'Bugomora', 56, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4326, '2737', 'Bugoro', 110, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4327, '812', 'Bugorora', 73, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4328, '190', 'Buguruni', 22, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4329, '1710', 'Bugwema', 90, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4330, '2738', 'Buhama', 110, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4331, '1046', 'Buhanda', 40, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4332, '1097', 'Buhanda', 40, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4333, '834', 'Buhangaza', 89, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4334, '1711', 'Buhare', 90, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4335, '1692', 'Buhemba', 10, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4336, '724', 'Buhembe', 8, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4337, '957', 'Buhigwe', 7, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4338, '2690', 'Buhingo', 74, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4339, '1080', 'Buhingu', 130, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4340, '2717', 'Buhongwa', 100, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4341, '991', 'Buhoro', 34, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4342, '2665', 'Buhumbi', 64, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4343, '2691', 'Buhunda', 74, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4344, '313', 'Buigiri', 12, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4345, '2666', 'Bujashi', 64, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4346, '1975', 'Bujela', 108, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4347, '1858', 'Bujonde', 55, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4348, '2667', 'Bujora', 64, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4349, '725', 'Bujugo', 8, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4350, '1693', 'Bukabwa', 10, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4351, '2782', 'Bukanda', 127, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4352, '2668', 'Bukandwe', 64, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4353, '3343', 'Bukene', 112, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4354, '3386', 'Bukene', 112, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4355, '3679', 'Bukene', 102, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4356, '2783', 'Bukiko', 127, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4357, '1712', 'Bukima', 90, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4358, '2784', 'Bukindo', 127, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4359, '875', 'Bukiriro', 97, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4360, '3615', 'Bukoko', 20, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4361, '2739', 'Bukokwa', 110, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4362, '3257', 'Bukomela', 26, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4363, '2785', 'Bukongo', 127, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4364, '958', 'Bukuba', 7, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4365, '3791', 'Bukumbi', 131, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4366, '1713', 'Bukumi', 90, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4367, '2786', 'Bukungu', 127, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4368, '1747', 'Bukura', 105, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4369, '1748', 'Bukwe', 105, '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(4370, '939', 'Bulamata', 122, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4371, '2692', 'Bulemeji', 74, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4372, '3258', 'Bulige', 26, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4373, '1714', 'Bulinga', 90, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4374, '3259', 'Bulungwa', 26, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4375, '1976', 'Bulyaga', 108, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4376, '2740', 'Bulyaheke', 110, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4377, '835', 'Bulyakashaju', 89, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4378, '3260', 'Bulyan\'hulu', 26, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4379, '836', 'Bumbire', 89, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4380, '3950', 'Bumbuli', 60, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4381, '418', 'Bumbuta', 50, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4382, '1804', 'Bumera', 123, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4383, '618', 'Bumilayinga', 87, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4384, '3315', 'Bunambiyu', 48, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4385, '1659', 'Bunda Mjini', 9, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4386, '1660', 'Bunda Stoo', 9, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4387, '2248', 'Bunduki', 91, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4388, '4199', 'Bungi', 35, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4389, '3910', 'Bungu', 52, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4390, '2190', 'Bungu', 82, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4391, '2301', 'Bungu', 82, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4392, '2904', 'Bungu', 37, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4393, '2636', 'Bungulwa', 54, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4394, '234', 'Bunju', 46, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4395, '1027', 'Bunyambo', 38, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4396, '2637', 'Bupamwa', 54, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4397, '2741', 'Bupandwa', 110, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4398, '3316', 'Bupigi', 48, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4399, '2946', 'Bupu', 79, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4400, '837', 'Bureza', 89, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4401, '1694', 'Buruma', 10, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4402, '838', 'Burungura', 89, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4403, '1028', 'Busagara', 38, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4404, '1859', 'Busale', 55, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4405, '1715', 'Busambara', 90, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4406, '3261', 'Busangi', 26, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4407, '3317', 'Busangwa', 48, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4408, '1772', 'Busawe', 111, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4409, '1695', 'Busegwe', 10, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4410, '4059', 'Bushiri', 103, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4411, '419', 'Busi', 50, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4412, '789', 'Businde', 56, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4413, '1047', 'Businde', 40, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4414, '1098', 'Businde', 40, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4415, '2742', 'Busisi', 110, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4416, '3262', 'Busoka', 26, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4417, '2693', 'Busongo', 74, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4418, '1029', 'Busunzu', 38, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4419, '1696', 'Buswahili', 10, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4420, '2617', 'Buswelu', 23, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4421, '726', 'Butelankuzi', 8, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4422, '1697', 'Butiama', 10, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4423, '1661', 'Butimba', 9, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4424, '2718', 'Butimba', 100, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4425, '1698', 'Butuguri', 10, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4426, '2743', 'Buyagu', 110, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4427, '813', 'Buyango', 73, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4428, '191', 'Buyuni', 22, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4429, '255', 'Buza', 124, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4430, '1048', 'Buzebazeba', 40, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4431, '1099', 'Buzebazeba', 40, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4432, '2744', 'Buzilasoga', 110, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4433, '2618', 'Buzuruga', 23, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4434, '1581', 'Bwagamoyo', 49, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4435, '2191', 'Bwakira chini', 82, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4436, '2302', 'Bwakira chini', 82, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4437, '2303', 'Bwakira juu', 82, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4438, '2192', 'Bwakira juu', 82, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4439, '1257', 'Bwambo', 109, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4440, '814', 'Bwanjai', 73, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4441, '1716', 'Bwasi', 90, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4442, '1582', 'Bwawani', 49, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4443, '1837', 'Bwawani', 14, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4444, '4', 'Bwawani', 1, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4445, '4023', 'Bwembwera', 88, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4446, '4060', 'Bweni', 103, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4447, '765', 'Bweranyange', 30, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4448, '1717', 'Bweri', 90, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4449, '2850', 'Bwilingu', 4, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4450, '1699', 'Bwiregi', 10, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4451, '2787', 'Bwiro', 127, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4452, '2788', 'Bwisya', 127, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4453, '4002', 'Bwiti', 77, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4454, '4073', 'Central', 121, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4455, '4100', 'Central', 121, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4456, '4180', 'Chaani', 32, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4457, '2669', 'Chabula', 64, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4458, '3616', 'Chabutwa', 20, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4459, '3724', 'Chabutwa', 114, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4460, '2085', 'Chagongwe', 16, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4461, '375', 'Chahwa', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4462, '500', 'Chahwa', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4463, '2086', 'Chakwale', 16, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4464, '1227', 'Chala', 104, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4465, '3007', 'Chala', 99, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4466, '1838', 'Chalangwa', 14, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4467, '293', 'Chali', 5, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4468, '3344', 'Chamaguha', 112, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4469, '3387', 'Chamaguha', 112, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4470, '897', 'Chamalendi', 80, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4471, '256', 'Chamazi', 124, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4472, '3263', 'Chambo', 26, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4473, '445', 'Chamkoroma', 51, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4474, '314', 'Chamwino', 12, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4475, '376', 'Chamwino', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4476, '501', 'Chamwino', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4477, '2304', 'Chamwino', 82, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4478, '2193', 'Chamwino', 82, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4479, '350', 'Chandama', 13, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4480, '257', 'Chang\'ombe', 124, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4481, '377', 'Chang\'ombe', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4482, '502', 'Chang\'ombe', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4483, '420', 'Changaa', 50, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4484, '619', 'Changarawe', 87, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4485, '192', 'Chanika', 22, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4486, '766', 'Chanika', 30, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4487, '3855', 'Chanika', 19, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4488, '2364', 'Chanikanguo', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4489, '2087', 'Chanjale', 16, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4490, '3035', 'Chanji', 118, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4491, '2139', 'Chanzuru', 44, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4492, '1583', 'Chapakazi', 49, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4493, '258', 'Charambe', 124, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4494, '2523', 'Chaume', 120, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4495, '2412', 'Chawi', 86, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4496, '2555', 'Chawi', 86, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4497, '4200', 'Cheju', 35, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4498, '3911', 'Chekelei', 52, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4499, '3264', 'Chela', 26, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4500, '351', 'Chemba', 13, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4501, '421', 'Chemchem', 50, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4502, '2970', 'Chemchem', 107, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4503, '3744', 'Chemchem', 119, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4504, '3821', 'Chemchem', 119, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4505, '3745', 'Cheyo', 119, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4506, '3822', 'Cheyo', 119, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4507, '3388', 'Chibe', 112, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4508, '3345', 'Chibe', 112, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4509, '294', 'Chibelela', 5, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4510, '315', 'Chiboli', 12, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4511, '1437', 'Chibula', 106, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4512, '1438', 'Chienjele', 106, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4513, '2745', 'Chifunfu', 110, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4514, '295', 'Chifutuka', 5, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4515, '2088', 'Chigela', 16, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4516, '378', 'Chigongwe', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4517, '503', 'Chigongwe', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4518, '2365', 'Chigugu', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4519, '379', 'Chihanga', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4520, '504', 'Chihanga', 15, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4521, '2485', 'Chihangu', 96, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4522, '2366', 'Chikiropola', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4523, '296', 'Chikola', 5, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4524, '3484', 'Chikola', 66, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4525, '2413', 'Chikongola', 86, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4526, '2524', 'Chikongola', 120, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4527, '2556', 'Chikongola', 86, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4528, '1330', 'Chikonji', 57, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4529, '1459', 'Chikonji', 57, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4530, '2367', 'Chikukwe', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4531, '2368', 'Chikundi', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4532, '2369', 'Chikunja', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4533, '3485', 'Chikuyu', 66, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4534, '2486', 'Chilangala', 96, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4535, '2278', 'Chilombola', 128, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4536, '316', 'Chilonwa', 12, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4537, '1890', 'Chimala', 68, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4538, '2809', 'Chimba', 72, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4539, '2103', 'Ching\'anda', 43, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4540, '2525', 'Chingungwe', 120, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4541, '1439', 'Chinongwe', 106, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4542, '317', 'Chinugulu', 12, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4543, '1402', 'Chiola', 93, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4544, '297', 'Chipanga', 5, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4545, '468', 'Chipogoro', 85, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4546, '1331', 'Chiponda', 57, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4547, '1460', 'Chiponda', 57, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4548, '2468', 'Chipuputa', 95, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4549, '2104', 'Chisano', 43, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4550, '2105', 'Chita', 43, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4551, '446', 'Chitego', 51, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4552, '2487', 'Chitekete', 96, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4553, '469', 'Chitemo', 85, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4554, '1662', 'Chitengule', 9, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4555, '1403', 'Chiumbati Shuleni', 93, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4556, '2370', 'Chiungutwa', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4557, '2371', 'Chiwale', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4558, '3216', 'Chiwana', 125, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4559, '3151', 'Chiwanda', 101, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4560, '2372', 'Chiwata', 67, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4561, '447', 'Chiwe', 51, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4562, '2488', 'Chiwonga', 96, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4563, '1839', 'Chokaa', 14, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4564, '2839', 'Chokocho', 78, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4565, '2921', 'Chole', 47, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4566, '3617', 'Chomachankola', 20, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4567, '1258', 'Chome', 109, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4568, '1206', 'Chomvu', 92, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4569, '3265', 'Chona', 26, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4570, '4074', 'Chongoleani', 121, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4571, '4101', 'Chongoleani', 121, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4572, '767', 'Chonyonyo', 30, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4573, '4145', 'Chukwani', 63, '2024-09-21 20:19:58', '2024-09-21 20:19:58'),
(4574, '4075', 'Chumbageni', 121, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4575, '4102', 'Chumbageni', 121, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4576, '2971', 'Chumbi', 107, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4577, '4160', 'Chumbuni', 75, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4578, '1307', 'Chumo', 45, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4579, '2414', 'Chuno', 86, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4580, '2557', 'Chuno', 86, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4581, '470', 'Chunyu', 85, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4582, '1440', 'Chunyu', 106, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4583, '352', 'Churuku', 13, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4584, '4201', 'Chwaka', 35, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4585, '81', 'Daa', 31, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4586, '594', 'Dabaga', 42, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4587, '318', 'Dabalo', 12, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4588, '1523', 'Dabil', 3, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4589, '2249', 'Dakawa', 91, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4590, '353', 'Dalai', 13, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4591, '4003', 'Daluni', 77, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4592, '55', 'Daraja II', 2, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4593, '160', 'Daraja II', 2, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4594, '1524', 'Dareda', 3, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4595, '1608', 'Daudi', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4596, '1551', 'Dawar', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4597, '3389', 'Didia', 112, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4598, '3346', 'Didia', 112, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4599, '134', 'Digodigo', 98, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4600, '2415', 'Dihimba', 86, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4601, '2558', 'Dihimba', 86, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4602, '2905', 'Dimani', 37, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4603, '4146', 'Dimani', 63, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4604, '1609', 'Dinamu', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4605, '3912', 'Dindira', 52, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4606, '2526', 'Dinduma', 120, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4607, '2416', 'Dinyecha', 86, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4608, '2559', 'Dinyecha', 86, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4609, '2250', 'Diongoya', 91, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4610, '1552', 'Dirma', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4611, '4004', 'Doda', 77, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4612, '2840', 'Dodo', 78, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4613, '546', 'DODOMA', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4614, '380', 'Dodoma Makulu', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4615, '505', 'Dodoma Makulu', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4616, '541', 'Dodoma Makulu', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4617, '4134', 'Dole', 62, '2024-09-21 20:19:59', '2024-09-21 20:19:59');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(4618, '2251', 'Doma', 91, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4619, '2947', 'Dondo', 79, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4620, '1584', 'Dongo', 49, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4621, '1610', 'Dongobesh', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4622, '1289', 'Donyomurwak', 113, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4623, '1585', 'Dosidosi', 49, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4624, '4005', 'Duga', 77, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4625, '4076', 'Duga', 121, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4626, '4103', 'Duga', 121, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4627, '3951', 'Dule \"B\"', 60, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4628, '3952', 'Dule \'M\'', 60, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4629, '1553', 'Dumbeta', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4630, '2140', 'Dumila', 44, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4631, '2851', 'Dunda', 4, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4632, '3435', 'Dung\'unyi', 21, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4633, '1525', 'Duru', 3, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4634, '2877', 'Dutumi', 36, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4635, '93', 'Eleng\'ata Dapash', 59, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4636, '56', 'Elerai', 2, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4637, '161', 'Elerai', 2, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4638, '1639', 'Emboreet', 115, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4639, '82', 'Endabashi', 31, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4640, '1554', 'Endagaw', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4641, '1611', 'Endagikot', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4642, '1612', 'Endahagichan', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4643, '1526', 'Endakiso', 3, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4644, '83', 'Endamaghang', 31, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4645, '84', 'Endamarariek', 31, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4646, '1613', 'Endamilay', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4647, '1555', 'Endasak', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4648, '1556', 'Endasiwold', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4649, '1640', 'Endiamutu', 115, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4650, '1641', 'Endonyongijape', 115, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4651, '135', 'Enduleni', 98, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4652, '94', 'Engarenaibor', 59, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4653, '136', 'Engaresero', 98, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4654, '111', 'Engaruka', 81, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4655, '95', 'Engikaret', 59, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4656, '1586', 'Engusero', 49, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4657, '137', 'Engusero Sambu', 98, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4658, '57', 'Engutoto', 2, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4659, '112', 'Engutoto', 81, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4660, '162', 'Engutoto', 2, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4661, '1614', 'Eshkesh', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4662, '113', 'Esilalei', 81, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4663, '1718', 'Etaro', 90, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4664, '2279', 'Euga', 128, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4665, '138', 'Eyasi', 98, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4666, '354', 'Farkwa', 13, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4667, '2694', 'Fella', 74, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4668, '1911', 'Forest', 69, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4669, '2017', 'Forest', 69, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4670, '3913', 'Foroforo', 52, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4671, '319', 'Fufu', 12, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4672, '4189', 'Fujoni', 33, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4673, '2638', 'Fukalo', 54, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4674, '2852', 'Fukayosi', 4, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4675, '3953', 'Funta', 60, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4676, '2089', 'Gairo', 16, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4677, '471', 'Galigali', 85, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4678, '1527', 'Gallapo', 3, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4679, '4181', 'Gamba', 32, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4680, '85', 'Ganako', 31, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4681, '1557', 'Ganana', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4682, '2818', 'Gando', 132, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4683, '547', 'Gangilonga', 25, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4684, '653', 'Gangilonga', 25, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4685, '1805', 'Ganyange', 123, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4686, '1290', 'Gararagua', 113, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4687, '1558', 'Garawja', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4688, '3954', 'Gare', 60, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4689, '1259', 'Gavao - saweni', 109, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4690, '1559', 'Gehandu', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4691, '1615', 'Gehandu', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4692, '1773', 'Geitasamo', 111, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4693, '96', 'Gelai lumbwa', 59, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4694, '97', 'Gelai Meirugoi', 59, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4695, '1560', 'Gendabi', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4696, '4024', 'Genge', 88, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4697, '815', 'Gera', 73, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4698, '193', 'Gerezani', 22, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4699, '1561', 'Getanuwas', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4700, '1616', 'Geterer', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4701, '1912', 'Ghana', 69, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4702, '2018', 'Ghana', 69, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4703, '1562', 'Gidahababieg', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4704, '1528', 'Gidas', 3, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4705, '1617', 'Gidhimu', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4706, '1563', 'Gisambalang', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4707, '1564', 'Gitting', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4708, '277', 'Goba', 126, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4709, '472', 'Godegode', 85, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4710, '355', 'Goima', 13, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4711, '4006', 'Gombero', 77, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4712, '194', 'Gongolamboto', 22, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4713, '3746', 'Gongoni', 119, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4714, '3823', 'Gongoni', 119, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4715, '1749', 'Goribe', 105, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4716, '1806', 'Gorong\'a', 123, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4717, '3792', 'Goweko', 131, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4718, '839', 'Goziba', 89, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4719, '2695', 'Gulumungu', 74, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4720, '473', 'Gulwe', 85, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4721, '3515', 'Gumanga', 76, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4722, '3172', 'Gumbiro', 117, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4723, '1049', 'Gungu', 40, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4724, '1100', 'Gungu', 40, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4725, '1618', 'Gunyoda', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4726, '1663', 'Guta', 9, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4727, '356', 'Gwandi', 13, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4728, '840', 'Gwanseli', 89, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4729, '976', 'Gwanumpu', 27, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4730, '977', 'Gwarama', 27, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4731, '2194', 'Gwata', 82, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4732, '2305', 'Gwata', 82, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4733, '2878', 'Gwata', 36, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4734, '1807', 'Gwitiryo', 123, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4735, '3914', 'Hale', 52, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4736, '727', 'Hamugembe', 8, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4737, '235', 'Hananasif', 46, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4738, '320', 'Handali', 12, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4739, '321', 'Haneti', 12, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4740, '3130', 'Hanga', 94, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4741, '422', 'Haubi', 50, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4742, '1619', 'Haydarer', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4743, '1620', 'Haydom', 71, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4744, '381', 'Hazina', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4745, '506', 'Hazina', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4746, '1260', 'Hedaru', 109, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4747, '3486', 'Heka', 66, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4748, '2252', 'Hembeti', 91, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4749, '3955', 'Hemtoye', 60, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4750, '1081', 'Herembe', 130, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4751, '992', 'Heru Juu', 34, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4752, '993', 'Heru Ushingo', 34, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4753, '1565', 'Hidet', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4754, '2417', 'Hinju', 86, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4755, '2560', 'Hinju', 86, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4756, '1566', 'Hirbadaw', 18, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4757, '448', 'Hogoro', 51, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4758, '1228', 'Holili', 104, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4759, '382', 'Hombolo Bwawani', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4760, '507', 'Hombolo Bwawani', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4761, '383', 'Hombolo Makulu', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4762, '508', 'Hombolo Makulu', 15, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4763, '2253', 'Homboza', 91, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4764, '423', 'Hondomairo', 50, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4765, '2639', 'Hungumalwa', 54, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4766, '1664', 'Hunyari', 9, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4767, '322', 'Huzi', 12, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4768, '3347', 'Ibadakuli', 112, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4769, '3390', 'Ibadakuli', 112, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4770, '3516', 'Ibaga', 76, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4771, '1860', 'Ibanda', 55, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4772, '3793', 'Ibelamilundi', 131, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4773, '1977', 'Ibighi', 108, '2024-09-21 20:19:59', '2024-09-21 20:19:59'),
(4774, '298', 'Ibihwa', 5, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4775, '912', 'Ibindi', 84, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4776, '3391', 'Ibinzamata', 112, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4777, '3348', 'Ibinzamata', 112, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4778, '3794', 'Ibiri', 131, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4779, '2746', 'Ibisabageni', 110, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4780, '2747', 'Ibondo', 110, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4781, '3618', 'Iborogelo', 20, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4782, '841', 'Ibuga', 89, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4783, '299', 'Ibugule', 5, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4784, '595', 'Ibumu', 42, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4785, '2619', 'Ibungilo', 23, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4786, '728', 'Ibwera', 8, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4787, '3650', 'Ichemba', 29, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4788, '3266', 'Idahina', 26, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4789, '596', 'Idete', 42, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4790, '620', 'Idete', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4791, '2106', 'Idete', 43, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4792, '2696', 'Idetemya', 74, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4793, '2090', 'Idibo', 16, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4794, '323', 'Idifu', 12, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4795, '548', 'Idodi', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4796, '654', 'Idodi', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4797, '3487', 'Idodyandole', 66, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4798, '1913', 'Iduda', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4799, '2019', 'Iduda', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4800, '3318', 'Idukilo', 48, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4801, '621', 'Idunda', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4802, '449', 'Iduo', 51, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4803, '2107', 'Ifakara', 43, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4804, '3747', 'Ifucha', 119, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4805, '3824', 'Ifucha', 119, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4806, '1719', 'Ifulifu', 90, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4807, '1840', 'Ifumbo', 14, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4808, '549', 'Ifunda', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4809, '655', 'Ifunda', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4810, '622', 'Ifwagi', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4811, '3319', 'Igaga', 48, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4812, '3651', 'Igagala', 29, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4813, '1914', 'Igale', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4814, '2020', 'Igale', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4815, '2789', 'Igalla', 127, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4816, '2748', 'Igalula', 110, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4817, '3795', 'Igalula', 131, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4818, '1082', 'Igalula', 130, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4819, '324', 'Igandu', 12, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4820, '1915', 'Iganjo', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4821, '2021', 'Iganjo', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4822, '1916', 'Iganzo', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4823, '2022', 'Iganzo', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4824, '1891', 'Igava', 68, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4825, '1917', 'Igawilo', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4826, '2023', 'Igawilo', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4827, '3436', 'Ighombwe', 21, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4828, '3725', 'Igigwa', 114, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4829, '2108', 'Igima', 43, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4830, '3437', 'Iglansoni', 21, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4831, '2719', 'Igogo', 100, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4832, '2697', 'Igokelo', 74, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4833, '2720', 'Igoma', 100, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4834, '1918', 'Igoma', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4835, '2024', 'Igoma', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4836, '623', 'Igombavanu', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4837, '3652', 'Igombemkulu', 29, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4838, '2640', 'Igongwa', 54, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4839, '3619', 'Igoweko', 20, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4840, '624', 'Igowole', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4841, '3517', 'Iguguno', 76, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4842, '2749', 'Igulumuki', 110, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4843, '3796', 'Igulungu', 131, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4844, '550', 'Igumbilo', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4845, '656', 'Igumbilo', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4846, '3267', 'Igunda', 26, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4847, '1665', 'Igundu', 9, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4848, '3620', 'Igunga', 20, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4849, '3621', 'Igurubi', 20, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4850, '1892', 'Igurusi', 68, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4851, '768', 'Igurwa', 30, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4852, '3680', 'Igusule', 102, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4853, '3268', 'Igwamanoni', 26, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4854, '3653', 'Igwisi', 29, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4855, '1893', 'Ihahi', 68, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4856, '625', 'Ihalimba', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4857, '769', 'Ihanda', 30, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4858, '1919', 'Ihango', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4859, '2025', 'Ihango', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4860, '3438', 'Ihanja', 21, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4861, '626', 'Ihanu', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4862, '770', 'Ihembe', 30, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4863, '597', 'Ihimbo', 42, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4864, '627', 'Ihowanza', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4865, '384', 'Ihumwa', 15, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4866, '509', 'Ihumwa', 15, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4867, '3681', 'Ijanija', 102, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4868, '1920', 'Ijombe', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4869, '2026', 'Ijombe', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4870, '729', 'Ijuganyondo', 8, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4871, '842', 'Ijumbi', 89, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4872, '1861', 'Ikama', 55, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4873, '3532', 'Ikhanoda', 116, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4874, '3571', 'Ikhanoda', 116, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4875, '1862', 'Ikimba', 55, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4876, '3269', 'Ikinda', 26, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4877, '3682', 'Ikindwa', 102, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4878, '940', 'Ikola', 122, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4879, '1863', 'Ikolo', 55, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4880, '1750', 'Ikoma', 105, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4881, '1774', 'Ikoma', 111, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4882, '325', 'Ikombolinga', 12, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4883, '3748', 'Ikomwa', 119, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4884, '3825', 'Ikomwa', 119, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4885, '843', 'Ikondo', 89, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4886, '3797', 'Ikongolo', 131, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4887, '628', 'Ikongosi', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4888, '326', 'Ikowa', 12, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4889, '3036', 'Ikozi', 118, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4890, '898', 'Ikuba', 80, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4891, '1921', 'Ikukwa', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4892, '2027', 'Ikukwa', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4893, '3439', 'Ikungi', 21, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4894, '1978', 'Ikuti', 108, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4895, '844', 'Ikuza', 89, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4896, '629', 'Ikweha', 87, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4897, '2972', 'Ikwiriri', 107, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4898, '1083', 'Ilagala', 130, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4899, '195', 'Ilala', 22, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4900, '551', 'Ilala', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4901, '657', 'Ilala', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4902, '2790', 'Ilangala', 127, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4903, '941', 'Ilangu', 122, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4904, '5', 'Ilboru', 1, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4905, '3654', 'Ilege', 29, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4906, '899', 'Ilela', 80, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4907, '3037', 'Ilemba', 118, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4908, '1922', 'Ilembo', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4909, '2028', 'Ilembo', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4910, '913', 'Ilembo', 84, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4911, '2620', 'Ilemela', 23, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4912, '1923', 'Ilemi', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4913, '2029', 'Ilemi', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4914, '2750', 'Iligamba', 110, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4915, '1979', 'Ilima', 108, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4916, '300', 'Ilindi', 5, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4917, '6', 'Ilkiding\'a', 1, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4918, '3392', 'Ilola', 112, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4919, '3349', 'Ilola', 112, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4920, '3798', 'Ilolangulu', 131, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4921, '552', 'Ilolompya', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4922, '658', 'Ilolompya', 25, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4923, '1924', 'Ilomba', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4924, '2030', 'Ilomba', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4925, '2280', 'Ilonga', 128, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4926, '3533', 'Ilongero', 116, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4927, '3572', 'Ilongero', 116, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4928, '98', 'Ilorienito', 59, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4929, '2698', 'Ilujamate', 74, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4930, '2641', 'Ilula', 54, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4931, '598', 'Ilula', 42, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4932, '3518', 'Ilunda', 76, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4933, '900', 'Ilunde', 80, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4934, '1925', 'Ilungu', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4935, '2031', 'Ilungu', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4936, '599', 'Image', 42, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4937, '3773', 'Imalamakoye', 129, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4938, '1894', 'Imalilo Songwe', 68, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4939, '7', 'Imbaseni', 1, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4940, '1621', 'Imboru', 71, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4941, '3350', 'Imesela', 112, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4942, '3393', 'Imesela', 112, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4943, '1926', 'Inyala', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4944, '2032', 'Inyala', 69, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4945, '901', 'Inyonga', 80, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4946, '385', 'Ipagala', 15, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4947, '510', 'Ipagala', 15, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4948, '386', 'Ipala', 15, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4949, '511', 'Ipala', 15, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4950, '1864', 'Ipande', 55, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4951, '3488', 'Ipande', 66, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4952, '3534', 'Ipembe', 116, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4953, '3573', 'Ipembe', 116, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4954, '474', 'Ipera', 85, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4955, '1865', 'Ipinda', 55, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4956, '3726', 'Ipole', 114, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4957, '1980', 'Iponjola', 108, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4958, '3749', 'Ipuli', 119, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4959, '3826', 'Ipuli', 119, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4960, '942', 'Ipwaga', 122, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4961, '1895', 'Ipwani', 68, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4962, '1866', 'Ipyana', 55, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4963, '2281', 'Iragua', 128, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4964, '1666', 'Iramba', 9, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4965, '2751', 'Irenza', 110, '2024-09-21 20:20:00', '2024-09-21 20:20:00'),
(4966, '703', 'IRINGA', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4967, '327', 'Iringa Mvumi', 12, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4968, '1720', 'Iringo', 90, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4969, '3440', 'Irisya', 21, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4970, '600', 'Irole', 42, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4971, '2791', 'Irugwa', 127, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4972, '3270', 'Isagehe', 26, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4973, '3683', 'Isagenhe', 102, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4974, '3271', 'Isaka', 26, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4975, '553', 'Isakalilo', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4976, '659', 'Isakalilo', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4977, '3622', 'Isakamaliwa', 20, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4978, '630', 'Isalavanu', 87, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4979, '3008', 'Isale', 99, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4980, '2721', 'Isamilo', 100, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4981, '2670', 'Isandula', 64, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4982, '1927', 'Isanga', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4983, '2033', 'Isanga', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4984, '1981', 'Isange', 108, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4985, '3684', 'Isanzu', 102, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4986, '3394', 'Iselamagazi', 112, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4987, '3351', 'Iselamagazi', 112, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4988, '2699', 'Isenengeja', 74, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4989, '943', 'Isengule', 122, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4990, '2642', 'Iseni', 54, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4991, '3750', 'Isevya', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4992, '3827', 'Isevya', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4993, '816', 'Ishozi', 73, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4994, '1567', 'Ishponga', 18, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4995, '817', 'Ishunju', 73, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4996, '3799', 'Isikizya', 131, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4997, '3800', 'Isila', 131, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4998, '790', 'Isingiro', 56, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(4999, '2282', 'Isongo', 128, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5000, '1982', 'Isongole', 108, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5001, '3441', 'Isseke', 21, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5002, '3489', 'Isseke', 66, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5003, '1775', 'Issenye', 111, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5004, '3442', 'Issuna', 21, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5005, '3009', 'Isunta', 99, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5006, '1928', 'Isuto', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5007, '2034', 'Isuto', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5008, '1929', 'Isyesye', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5009, '2035', 'Isyesye', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5010, '1030', 'Itaba', 38, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5011, '1930', 'Itagano', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5012, '2036', 'Itagano', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5013, '1983', 'Itagata', 108, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5014, '3535', 'Itaja', 116, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5015, '3574', 'Itaja', 116, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5016, '2091', 'Italagwe', 16, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5017, '1896', 'Itamboleo', 68, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5018, '631', 'Itandula', 87, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5019, '424', 'Itaswi', 50, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5020, '1931', 'Itawa', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5021, '2037', 'Itawa', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5022, '1084', 'Itebula', 130, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5023, '791', 'Iteera', 56, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5024, '1932', 'Itende', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5025, '2038', 'Itende', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5026, '914', 'Itenka', 84, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5027, '1984', 'Itete', 108, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5028, '2180', 'Itete', 65, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5029, '3010', 'Itete', 99, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5030, '3751', 'Itetemia', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5031, '3828', 'Itetemia', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5032, '1841', 'Itewe', 14, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5033, '1933', 'Itewe', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5034, '2039', 'Itewe', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5035, '1934', 'Itezi', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5036, '2040', 'Itezi', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5037, '3490', 'Itigi Majengo', 66, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5038, '3491', 'Itigi Mjini', 66, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5039, '1935', 'Itiji', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5040, '2041', 'Itiji', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5041, '3320', 'Itilima', 48, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5042, '3685', 'Itilo', 102, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5043, '1808', 'Itiryo', 123, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5044, '328', 'Itiso', 12, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5045, '3686', 'Itobo', 102, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5046, '425', 'Itololo', 50, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5047, '3752', 'Itonjanda', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5048, '3829', 'Itonjanda', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5049, '1867', 'Itope', 55, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5050, '3623', 'Itumba', 20, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5051, '2671', 'Itumbili', 64, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5052, '3774', 'Itundu', 129, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5053, '3624', 'Itunduru', 20, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5054, '1868', 'Itunge', 55, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5055, '554', 'Itunundu', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5056, '660', 'Itunundu', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5057, '3395', 'Itwangi', 112, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5058, '3352', 'Itwangi', 112, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5059, '1291', 'Ivaeny', 113, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5060, '1936', 'Iwambi', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5061, '2042', 'Iwambi', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5062, '1937', 'Iwiji', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5063, '2043', 'Iwiji', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5064, '1938', 'Iwindi', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5065, '2044', 'Iwindi', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5066, '475', 'Iwondo', 85, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5067, '1939', 'Iyela', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5068, '2045', 'Iyela', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5069, '3272', 'Iyenze', 26, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5070, '2092', 'Iyogwe', 16, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5071, '387', 'Iyumbu', 15, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5072, '512', 'Iyumbu', 15, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5073, '3443', 'Iyumbu', 21, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5074, '1940', 'Iyunga', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5075, '2046', 'Iyunga', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5076, '1941', 'Iyunga Mapinduzi', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5077, '2047', 'Iyunga Mapinduzi', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5078, '555', 'Izazi', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5079, '661', 'Izazi', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5080, '3038', 'Izia', 118, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5081, '845', 'Izigo', 89, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5082, '730', 'Izimbya', 8, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5083, '1942', 'Iziwa', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5084, '2048', 'Iziwa', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5085, '1943', 'Izyra', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5086, '2049', 'Izyra', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5087, '2819', 'Jadida', 132, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5088, '3889', 'Jaila', 41, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5089, '3217', 'Jakika', 125, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5090, '4206', 'Jambiani', 53, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5091, '1332', 'Jamhuri', 57, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5092, '1461', 'Jamhuri', 57, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5093, '3273', 'Jana', 26, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5094, '959', 'Janda', 7, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5095, '2879', 'Janga', 36, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5096, '357', 'Jangalo', 13, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5097, '196', 'Jangwani', 22, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5098, '2418', 'Jangwani', 86, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5099, '2561', 'Jangwani', 86, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5100, '2938', 'Jibondo', 61, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5101, '2373', 'Jida', 67, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5102, '2672', 'Jinjimili', 64, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5103, '1207', 'Jipe', 92, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5104, '4147', 'Jitimai', 63, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5105, '1568', 'Jorodom', 18, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5106, '2489', 'Julia', 96, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5107, '731', 'Kaagya', 8, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5108, '876', 'Kabanga', 97, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5109, '1667', 'Kabarimu', 9, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5110, '1668', 'Kabasa', 9, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5111, '2673', 'Kabila', 64, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5112, '3753', 'Kabila', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5113, '3830', 'Kabila', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5114, '706', 'Kabindi', 6, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5115, '846', 'Kabirizi', 89, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5116, '3856', 'Kabuku', 19, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5117, '3857', 'Kabuku ndani', 19, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5118, '1985', 'Kabula', 108, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5119, '944', 'Kabungu', 122, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5120, '3011', 'Kabwe', 99, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5121, '3039', 'Kaengesa', 118, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5122, '2752', 'Kafunzo', 110, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5123, '2792', 'Kagera', 127, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5124, '1050', 'Kagera', 40, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5125, '1101', 'Kagera', 40, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5126, '994', 'Kagera Nkanda', 34, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5127, '1031', 'Kagezi', 38, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5128, '847', 'Kagoma', 89, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5129, '732', 'Kagondo', 8, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5130, '1051', 'Kagongo', 40, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5131, '1102', 'Kagongo', 40, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5132, '3274', 'Kagongwa', 26, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5133, '3084', 'Kagugu', 70, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5134, '2753', 'Kagunga', 110, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5135, '1052', 'Kagunga', 40, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5136, '1103', 'Kagunga', 40, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5137, '2793', 'Kagunguli', 127, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5138, '2621', 'Kahama', 23, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5139, '3275', 'Kahama Mjini', 26, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5140, '3687', 'Kahamanhalanga', 102, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5141, '2674', 'Kahangara', 64, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5142, '1156', 'Kahe Magharibi', 83, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5143, '1157', 'Kahe Mashariki', 83, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5144, '733', 'Kahororo', 8, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5145, '2754', 'Kahumulo', 110, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5146, '734', 'Kaibanja', 8, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5147, '1622', 'Kainam', 71, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5148, '792', 'Kaisho', 56, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5149, '960', 'Kajana', 7, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5150, '1869', 'Kajunjumele', 55, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5151, '793', 'Kakanja', 56, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5152, '2794', 'Kakerege', 127, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5153, '915', 'Kakese', 84, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5154, '139', 'Kakesio', 98, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5155, '3754', 'Kakola', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5156, '3831', 'Kakola', 119, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5157, '978', 'Kakonko', 27, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5158, '2795', 'Kakukuru', 127, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5159, '818', 'Kakunyu', 73, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5160, '3012', 'Kala', 99, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5161, '3915', 'Kalalani', 52, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5162, '426', 'Kalamba', 50, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5163, '3040', 'Kalambanzite', 118, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5164, '3492', 'Kalangali', 66, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5165, '2755', 'Kalebezo', 110, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5166, '995', 'Kalela', 34, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5167, '1261', 'Kalemawe', 109, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5168, '556', 'Kalenga', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5169, '662', 'Kalenga', 25, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5170, '2109', 'Kalengakelu', 43, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5171, '707', 'Kalenge', 6, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5172, '1053', 'Kalinzi', 40, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5173, '1104', 'Kalinzi', 40, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5174, '3655', 'Kaliua', 29, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5175, '1944', 'Kalobe', 69, '2024-09-21 20:20:01', '2024-09-21 20:20:01'),
(5176, '2050', 'Kalobe', 69, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5177, '3801', 'Kalola', 131, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5178, '58', 'Kaloleni', 2, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5179, '163', 'Kaloleni', 2, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5180, '1158', 'Kaloleni', 83, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5181, '1587', 'Kaloleni', 49, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5182, '3218', 'Kalulu', 125, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5183, '3041', 'Kalumbaleza', 118, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5184, '3755', 'Kalunde', 119, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5185, '3832', 'Kalunde', 119, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5186, '1085', 'Kalya', 130, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5187, '848', 'Kamachumu', 89, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5188, '771', 'Kamagambo', 30, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5189, '3085', 'Kambarage', 70, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5190, '3353', 'Kambarage', 112, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5191, '3396', 'Kambarage', 112, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5192, '1986', 'Kambasegela', 108, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5193, '1842', 'Kambikatoto', 14, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5194, '3656', 'Kamsekwa', 29, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5195, '902', 'Kamsisi', 80, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5196, '1700', 'Kamugegi', 10, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5197, '794', 'Kamuli', 56, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5198, '2469', 'Kamundi', 95, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5199, '1721', 'Kamunyonge', 90, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5200, '99', 'Kamwanga', 59, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5201, '2110', 'Kamwene', 43, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5202, '877', 'Kanazi', 97, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5203, '3042', 'Kanda', 118, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5204, '1086', 'Kandaga', 130, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5205, '1308', 'Kandawale', 45, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5206, '2675', 'Kandawe', 64, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5207, '1987', 'Kandete', 108, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5208, '3858', 'Kang\'ata', 19, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5209, '2254', 'Kanga', 91, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5210, '2939', 'Kanga', 61, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5211, '2841', 'Kangani', 78, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5212, '708', 'Kaniha', 6, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5213, '916', 'KANOGE', 84, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5214, '3657', 'Kanoge', 29, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5215, '772', 'Kanoni', 30, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5216, '86', 'Kansay', 31, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5217, '735', 'Kanyangereko', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5218, '2700', 'Kanyelele', 74, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5219, '3756', 'Kanyenye', 119, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5220, '3833', 'Kanyenye', 119, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5221, '2984', 'Kanyezi', 28, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5222, '819', 'Kanyigo', 73, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5223, '979', 'Kanyonza', 27, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5224, '3043', 'Kaoze', 118, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5225, '917', 'Kapalala', 84, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5226, '945', 'Kapalamsenga', 122, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5227, '3044', 'Kapenta', 118, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5228, '3775', 'Kapilula', 129, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5229, '736', 'Karabagaine', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5230, '849', 'Karambi', 89, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5231, '1159', 'Karanga', 83, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5232, '1292', 'Karansi', 113, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5233, '87', 'Karatu', 31, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5234, '946', 'Karema', 122, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5235, '197', 'Kariakoo', 22, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5236, '3688', 'Karitu', 102, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5237, '980', 'Kasanda', 27, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5238, '632', 'Kasanga', 87, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5239, '1843', 'Kasanga', 14, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5240, '2195', 'Kasanga', 82, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5241, '2306', 'Kasanga', 82, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5242, '2985', 'Kasanga', 28, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5243, '903', 'Kasansa', 80, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5244, '3045', 'Kasanzama', 118, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5245, '947', 'Kasekese', 122, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5246, '3689', 'Kasela', 102, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5247, '3463', 'Kaselya', 24, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5248, '3046', 'Kasense', 118, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5249, '2756', 'Kasenyi', 110, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5250, '737', 'Kashai', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5251, '738', 'Kasharu', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5252, '850', 'Kasharunga', 89, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5253, '851', 'Kashasha', 89, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5254, '1293', 'Kashashi', 113, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5255, '918', 'Kashaulili', 84, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5256, '820', 'Kashenye', 73, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5257, '3658', 'Kashishi', 29, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5258, '3276', 'Kashishi', 26, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5259, '2141', 'Kasiki', 44, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5260, '1054', 'Kasimbu', 40, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5261, '1105', 'Kasimbu', 40, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5262, '1055', 'Kasingirima', 40, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5263, '1106', 'Kasingirima', 40, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5264, '2757', 'Kasisa', 110, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5265, '3776', 'Kasisi', 129, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5266, '919', 'Kasokola', 84, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5267, '2701', 'Kasololo', 74, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5268, '821', 'Kassambya', 73, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5269, '981', 'Kasuga', 27, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5270, '1669', 'Kasuguti', 9, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5271, '878', 'Kasulo', 97, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5272, '2758', 'Kasungamile', 110, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5273, '709', 'Katahoka', 6, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5274, '3047', 'Katandala', 118, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5275, '982', 'Katanga', 27, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5276, '1229', 'Katangara/Mrere', 104, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5277, '2986', 'Katazi', 28, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5278, '3013', 'Kate', 99, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5279, '739', 'Katerero', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5280, '1569', 'Katesh', 18, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5281, '2987', 'Katete', 28, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5282, '59', 'Kati', 2, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5283, '164', 'Kati', 2, '2024-09-21 20:20:02', '2024-09-21 20:20:02');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(5284, '2111', 'Katindiuka', 43, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5285, '852', 'Katoke', 89, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5286, '740', 'Katoma', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5287, '741', 'Katoro', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5288, '1056', 'Katubuka', 40, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5289, '1107', 'Katubuka', 40, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5290, '948', 'Katuma', 122, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5291, '920', 'Katumba', 84, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5292, '1870', 'Katumbasongwe', 55, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5293, '2759', 'Katunguru', 110, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5294, '2760', 'Katwe', 110, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5295, '2307', 'Kauzeni', 82, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5296, '2196', 'Kauzeni', 82, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5297, '921', 'Kawajense', 84, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5298, '2880', 'Kawawa', 36, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5299, '236', 'Kawe', 46, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5300, '2622', 'Kawekamo', 23, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5301, '1988', 'Kawetele', 108, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5302, '773', 'Kayanga', 30, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5303, '2623', 'Kayenze', 23, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5304, '3659', 'Kazaroho', 29, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5305, '922', 'Kazima', 84, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5306, '2922', 'Kazimzumbwi', 47, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5307, '2761', 'Kazunzu', 110, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5308, '1087', 'Kazuramimba', 130, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5309, '1776', 'Kebanchabancha', 111, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5310, '427', 'Keikei', 50, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5311, '259', 'Keko', 124, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5312, '1230', 'Kelamfua/Mokala', 104, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5313, '1809', 'Kemambo', 123, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5314, '742', 'Kemondo', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5315, '2842', 'Kendwa', 78, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5316, '1810', 'Kenyamanyori', 123, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5317, '1777', 'Kenyamonta', 111, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5318, '853', 'Kerebe', 89, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5319, '2853', 'Kerege', 4, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5320, '3916', 'Kerenge', 52, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5321, '2283', 'Ketaketa', 128, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5322, '1670', 'Ketare', 9, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5323, '1811', 'Ketare', 123, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5324, '100', 'Ketumbeine', 59, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5325, '879', 'Keza', 97, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5326, '1138', 'KIA', 17, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5327, '4135', 'Kianga', 62, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5328, '1382', 'Kiangara', 58, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5329, '225', 'Kibada', 39, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5330, '2881', 'Kibaha', 36, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5331, '450', 'Kibaigwa', 51, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5332, '476', 'Kibakwe', 85, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5333, '278', 'Kibamba', 126, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5334, '961', 'Kibande', 7, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5335, '854', 'Kibanga', 89, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5336, '904', 'Kibaoni', 80, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5337, '2112', 'Kibaoni', 43, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5338, '1671', 'Kibara', 9, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5339, '795', 'Kibare', 56, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5340, '1812', 'Kibasuka', 123, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5341, '1309', 'Kibata', 45, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5342, '2255', 'Kibati', 91, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5343, '1588', 'Kibaya', 49, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5344, '2093', 'Kibedya', 16, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5345, '633', 'Kibengu', 87, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5346, '2113', 'Kiberege', 43, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5347, '743', 'Kibeta', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5348, '880', 'Kibimba', 97, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5349, '2854', 'Kibindu', 4, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5350, '796', 'Kibingo', 56, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5351, '3890', 'Kibirashi', 41, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5352, '744', 'Kibirizi', 8, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5353, '1057', 'Kibirizi', 40, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5354, '1108', 'Kibirizi', 40, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5355, '2906', 'Kibiti', 37, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5356, '881', 'Kibogora', 97, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5357, '2308', 'Kibogwa', 82, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5358, '2197', 'Kibogwa', 82, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5359, '4202', 'Kiboje', 35, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5360, '2829', 'Kibokoni', 11, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5361, '260', 'Kibondemaji', 124, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5362, '4148', 'Kibondeni', 63, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5363, '774', 'Kibondo', 30, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5364, '1032', 'Kibondo Mjini', 38, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5365, '1160', 'Kiborloni', 83, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5366, '1161', 'Kibosho Kati', 83, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5367, '1162', 'Kibosho Kirima', 83, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5368, '1163', 'Kibosho Magharibi', 83, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5369, '1164', 'Kibosho Mashariki', 83, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5370, '1165', 'Kibosho Okaoni', 83, '2024-09-21 20:20:02', '2024-09-21 20:20:02'),
(5371, '2198', 'Kibuko', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5372, '2309', 'Kibuko', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5373, '2310', 'Kibungo', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5374, '2199', 'Kibungo', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5375, '261', 'Kiburugwa', 124, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5376, '2923', 'Kibuta', 47, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5377, '1383', 'Kibutuka', 58, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5378, '962', 'Kibwigwa', 7, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5379, '2200', 'Kichangani', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5380, '2284', 'Kichangani', 128, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5381, '2311', 'Kichangani', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5382, '4025', 'Kicheba', 88, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5383, '1384', 'Kichonda', 58, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5384, '1058', 'Kidahwe', 40, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5385, '1109', 'Kidahwe', 40, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5386, '3464', 'Kidaru', 24, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5387, '4136', 'Kidatu', 62, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5388, '2114', 'Kidatu', 43, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5389, '3859', 'Kideleko', 19, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5390, '2142', 'Kidete', 44, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5391, '2143', 'Kidodi', 44, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5392, '3219', 'Kidodoma', 125, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5393, '358', 'Kidoka', 13, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5394, '4182', 'Kidombo', 32, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5395, '3757', 'Kidongochekundu', 119, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5396, '3834', 'Kidongochekundu', 119, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5397, '2312', 'Kidugalo', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5398, '2201', 'Kidugalo', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5399, '2940', 'Kiegeani', 61, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5400, '1404', 'Kiegei', 93, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5401, '1208', 'Kifula', 92, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5402, '226', 'Kigamboni', 39, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5403, '996', 'Kigembe', 34, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5404, '1722', 'Kigera', 90, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5405, '1209', 'Kighare', 92, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5406, '237', 'Kigogo', 46, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5407, '1059', 'Kigoma', 40, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5408, '1110', 'Kigoma', 40, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5409, '1130', 'Kigoma', 40, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5410, '1135', 'KIGOMA', 40, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5411, '4026', 'Kigombe', 88, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5412, '997', 'Kigondo', 34, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5413, '4007', 'Kigongoi Magharibi', 77, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5414, '4008', 'Kigongoi Mashariki', 77, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5415, '1210', 'Kigonigoni', 92, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5416, '3086', 'Kigonsera', 70, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5417, '1751', 'Kigunga', 105, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5418, '3802', 'Kigwa', 131, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5419, '301', 'Kigwe', 5, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5420, '3152', 'Kihagara', 101, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5421, '557', 'Kihanga', 25, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5422, '663', 'Kihanga', 25, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5423, '775', 'Kihanga', 30, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5424, '3087', 'Kihangi Mahuka', 70, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5425, '558', 'Kihesa', 25, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5426, '664', 'Kihesa', 25, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5427, '4137', 'Kihinani', 62, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5428, '2202', 'Kihonda', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5429, '2313', 'Kihonda', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5430, '2314', 'Kihonda Maghorofani', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5431, '2203', 'Kihonda Maghorofani', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5432, '559', 'Kihorogota', 25, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5433, '665', 'Kihorogota', 25, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5434, '3088', 'Kihungu', 70, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5435, '1262', 'Kihurio', 109, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5436, '262', 'Kijichi', 124, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5437, '2702', 'Kijima', 74, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5438, '4183', 'Kijini', 32, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5439, '238', 'Kijitonyama', 46, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5440, '4149', 'Kijitoupele', 63, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5441, '3536', 'Kijota', 116, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5442, '3575', 'Kijota', 116, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5443, '1589', 'Kijungu', 49, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5444, '8', 'Kikatiti', 1, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5445, '2256', 'Kikeo', 91, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5446, '3519', 'Kikhonda', 76, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5447, '428', 'Kikilo', 50, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5448, '3444', 'Kikio', 21, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5449, '1310', 'Kikole', 45, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5450, '3089', 'Kikolo', 70, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5451, '388', 'Kikombo', 15, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5452, '513', 'Kikombo', 15, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5453, '745', 'Kikomelo', 8, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5454, '2882', 'Kikongo', 36, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5455, '429', 'Kikore', 50, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5456, '2643', 'Kikubiji', 54, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5457, '855', 'Kikuku', 89, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5458, '797', 'Kikukuru', 56, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5459, '3891', 'Kikunde', 41, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5460, '389', 'Kikuyu kaskazini', 15, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5461, '514', 'Kikuyu kaskazini', 15, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5462, '390', 'Kikuyu kusini', 15, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5463, '515', 'Kikuyu kusini', 15, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5464, '4161', 'Kikwajuni', 75, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5465, '9', 'Kikwe', 1, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5466, '3173', 'Kilagano', 117, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5467, '3277', 'Kilago', 26, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5468, '2315', 'Kilakala', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5469, '263', 'Kilakala', 124, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5470, '2204', 'Kilakala', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5471, '1333', 'Kilangala', 57, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5472, '1462', 'Kilangala', 57, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5473, '2883', 'Kilangalanga', 36, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5474, '2144', 'Kilangali', 44, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5475, '3048', 'Kilangawana', 118, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5476, '963', 'Kilelema', 7, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5477, '1166', 'Kilema Kaskazini', 83, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5478, '1167', 'Kilema Kati', 83, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5479, '1168', 'Kilema Kusini', 83, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5480, '1211', 'Kileo', 92, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5481, '2988', 'Kilesha', 28, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5482, '4162', 'Kilimahewa', 75, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5483, '3090', 'Kilimani', 70, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5484, '391', 'Kilimani', 15, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5485, '430', 'Kilimani', 50, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5486, '516', 'Kilimani', 15, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5487, '2470', 'Kilimanihewa', 95, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5488, '1405', 'Kilimanihewa', 93, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5489, '1169', 'Kilimanjaro', 83, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5490, '1305', 'Kilimanjaro', 83, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5491, '1406', 'Kilimarondo', 93, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5492, '822', 'Kilimilile', 73, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5493, '3892', 'Kilindi', 41, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5494, '2830', 'Kilindi', 11, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5495, '2941', 'Kilindoni', 61, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5496, '1334', 'Kilolambwani', 57, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5497, '1463', 'Kilolambwani', 57, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5498, '3917', 'Kilole', 52, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5499, '3956', 'Kilole', 60, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5500, '3727', 'Kiloleli', 114, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5501, '3321', 'Kiloleli', 48, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5502, '3758', 'Kiloleni', 119, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5503, '3777', 'Kiloleni', 129, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5504, '3835', 'Kiloleni', 119, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5505, '3728', 'Kiloli', 114, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5506, '1212', 'Kilomeni', 92, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5507, '3153', 'Kilosa', 101, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5508, '2181', 'Kilosa Mpepo', 65, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5509, '4027', 'Kilulu', 88, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5510, '3729', 'Kilumbi', 114, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5511, '264', 'Kilungule', 124, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5512, '2924', 'Kiluvya', 47, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5513, '3893', 'Kilwa', 41, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5514, '477', 'Kimagai', 85, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5515, '359', 'Kimaha', 13, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5516, '601', 'Kimala', 42, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5517, '2145', 'Kimamba A', 44, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5518, '2146', 'Kimamba B', 44, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5519, '1385', 'Kimambi', 58, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5520, '60', 'Kimandolu', 2, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5521, '165', 'Kimandolu', 2, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5522, '198', 'Kimanga', 22, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5523, '4061', 'Kimanga', 103, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5524, '2855', 'Kimange', 4, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5525, '2948', 'Kimanzichana', 79, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5526, '279', 'Kimara', 126, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5527, '3894', 'Kimbe', 41, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5528, '227', 'Kimbiji', 39, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5529, '10', 'Kimnyak', 1, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5530, '998', 'Kimobwa', 34, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5531, '1170', 'Kimochi', 83, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5532, '101', 'Kimokouwa', 59, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5533, '798', 'Kimuli', 56, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5534, '856', 'Kimwani', 89, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5535, '3278', 'Kinaga', 26, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5536, '3279', 'Kinamapula', 26, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5537, '3465', 'Kinampanda', 24, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5538, '3520', 'Kinampundu', 76, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5539, '964', 'Kinazi', 7, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5540, '2257', 'Kinda', 91, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5541, '3537', 'Kindai', 116, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5542, '3576', 'Kindai', 116, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5543, '1171', 'Kindi', 83, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5544, '11', 'King\'ori', 1, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5545, '1231', 'Kingachi', 104, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5546, '431', 'Kingale', 50, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5547, '3154', 'Kingerikiti', 101, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5548, '478', 'Kingiti', 85, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5549, '2316', 'Kingo', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5550, '2205', 'Kingo', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5551, '2206', 'Kingolwira', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5552, '2317', 'Kingolwira', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5553, '3625', 'Kining\'inila', 20, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5554, '1311', 'Kinjumbi', 45, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5555, '2207', 'Kinole', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5556, '2318', 'Kinole', 82, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5557, '239', 'Kinondoni', 46, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5558, '3493', 'Kintinku', 66, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5559, '3626', 'Kinungu', 20, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5560, '4150', 'Kinuni', 63, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5561, '3538', 'Kinyagigi', 116, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5562, '3577', 'Kinyagigi', 116, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5563, '1989', 'Kinyala', 108, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5564, '360', 'Kinyamsindo', 13, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5565, '634', 'Kinyanambo', 87, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5566, '3521', 'Kinyangiri', 76, '2024-09-21 20:20:03', '2024-09-21 20:20:03'),
(5567, '432', 'Kinyasi', 50, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5568, '2820', 'Kinyasini', 132, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5569, '4184', 'Kinyasini', 32, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5570, '1752', 'Kinyenche', 105, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5571, '199', 'Kinyerezi', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5572, '3539', 'Kinyeto', 116, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5573, '3578', 'Kinyeto', 116, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5574, '3466', 'Kiomboi', 24, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5575, '4077', 'Kiomoni', 121, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5576, '4104', 'Kiomoni', 121, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5577, '4207', 'Kiongoni', 53, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5578, '2907', 'Kiongoroni', 37, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5579, '1813', 'Kiore', 123, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5580, '1060', 'Kipampa', 40, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5581, '1111', 'Kipampa', 40, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5582, '3014', 'Kipande', 99, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5583, '3730', 'Kipanga', 114, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5584, '4185', 'Kipange', 32, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5585, '3091', 'Kipapa', 70, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5586, '1407', 'Kipara Mnero', 93, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5587, '1408', 'Kipara Mtua', 93, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5588, '2949', 'Kiparang\'anda', 79, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5589, '1312', 'Kipatimu', 45, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5590, '200', 'Kipawa', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5591, '3049', 'Kipeta', 118, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5592, '3015', 'Kipili', 99, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5593, '3731', 'Kipili', 114, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5594, '3092', 'Kipololo', 70, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5595, '2973', 'Kipugira', 107, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5596, '4062', 'Kipumbwi', 103, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5597, '3016', 'Kipundu', 99, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5598, '4151', 'Kipungani', 63, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5599, '201', 'Kipunguni', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5600, '3017', 'Kirando', 99, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5601, '1263', 'Kirangare', 109, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5602, '140', 'Kirangi', 98, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5603, '1313', 'Kiranjeranje', 45, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5604, '12', 'Kiranyi', 1, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5605, '4078', 'Kirare', 121, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5606, '4105', 'Kirare', 121, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5607, '1723', 'Kiriba', 90, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5608, '1753', 'Kirogo', 105, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5609, '2208', 'Kiroka', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5610, '2319', 'Kiroka', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5611, '2419', 'Kiromba', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5612, '2562', 'Kiromba', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5613, '2856', 'Kiromo', 4, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5614, '1232', 'Kirongo Samanga', 104, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5615, '1213', 'Kirongwe', 92, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5616, '2942', 'Kirongwe', 61, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5617, '1529', 'Kiru', 3, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5618, '1294', 'Kirua', 113, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5619, '1172', 'Kirua Vunjo Kusini', 83, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5620, '1173', 'Kirua Vunjo Magharibi', 83, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5621, '1174', 'Kirua Vunjo Mashariki', 83, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5622, '2624', 'Kirumba', 23, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5623, '776', 'Kiruruma', 30, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5624, '882', 'Kirushya', 97, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5625, '1233', 'KirwaKeni', 104, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5626, '1214', 'Kirya', 92, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5627, '1778', 'Kisaka', 111, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5628, '2209', 'Kisaki', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5629, '2320', 'Kisaki', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5630, '3540', 'Kisaki', 116, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5631, '3579', 'Kisaki', 116, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5632, '1234', 'Kisale Msaranga', 104, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5633, '2147', 'Kisanga', 44, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5634, '3732', 'Kisanga', 114, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5635, '1530', 'Kisangaji', 3, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5636, '3895', 'Kisangasa', 41, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5637, '1779', 'Kisangura', 111, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5638, '2925', 'Kisarawe', 47, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5639, '228', 'Kisarawe II', 39, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5640, '4152', 'Kisauni', 63, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5641, '2115', 'Kisawasawa', 43, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5642, '1990', 'Kisegese', 108, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5643, '2950', 'Kisegesege', 79, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5644, '2625', 'Kiseke', 23, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5645, '2321', 'Kisemu', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5646, '2210', 'Kisemu', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5647, '2676', 'Kisesa', 64, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5648, '433', 'Kisese', 50, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5649, '857', 'Kishanda', 89, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5650, '746', 'Kishanje', 8, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5651, '3322', 'Kishapu', 48, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5652, '2722', 'Kishili', 100, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5653, '2762', 'Kishinda', 110, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5654, '747', 'Kishogo', 8, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5655, '1991', 'Kisiba', 108, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5656, '2951', 'Kisiju', 79, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5657, '1264', 'Kisima', 109, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5658, '560', 'Kising\'a', 25, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5659, '602', 'Kising\'a', 42, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5660, '666', 'Kising\'a', 25, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5661, '3467', 'Kisiriri', 24, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5662, '3957', 'Kisiwani', 60, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5663, '4028', 'Kisiwani', 88, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5664, '1265', 'Kisiwani', 109, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5665, '1992', 'Kisondela', 108, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5666, '13', 'Kisongo', 1, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5667, '1672', 'Kisorya', 9, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5668, '3280', 'Kisuke', 26, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5669, '202', 'Kisukuru', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5670, '2989', 'Kisumba', 28, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5671, '1754', 'Kisumwa', 105, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5672, '2420', 'Kisungule', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5673, '2563', 'Kisungule', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5674, '2857', 'Kisutu', 4, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5675, '203', 'Kisutu', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5676, '999', 'Kitagata', 34, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5677, '1033', 'Kitahana', 38, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5678, '1724', 'Kitaji', 90, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5679, '2527', 'Kitama 1', 120, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5680, '3093', 'Kitanda', 70, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5681, '3131', 'Kitanda', 94, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5682, '1000', 'Kitanga', 34, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5683, '2490', 'Kitangali', 96, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5684, '3354', 'Kitangili', 112, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5685, '3397', 'Kitangili', 112, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5686, '3627', 'Kitangili', 20, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5687, '3690', 'Kitangili', 102, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5688, '2626', 'Kitangiri', 23, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5689, '561', 'Kitanzini', 25, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5690, '667', 'Kitanzini', 25, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5691, '3494', 'Kitaraka', 66, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5692, '2421', 'Kitaya', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5693, '2564', 'Kitaya', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5694, '1755', 'Kitembe', 105, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5695, '748', 'Kitendaguro', 8, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5696, '2422', 'Kitere', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5697, '2565', 'Kitere', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5698, '2148', 'Kitete', 44, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5699, '3759', 'Kitete', 119, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5700, '3836', 'Kitete', 119, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5701, '1235', 'Kitirima', 104, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5702, '823', 'Kitobo', 73, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5703, '1335', 'Kitomanga', 57, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5704, '1464', 'Kitomanga', 57, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5705, '2952', 'Kitomondo', 79, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5706, '2677', 'Kitongo sima', 64, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5707, '1061', 'Kitongoni', 40, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5708, '1112', 'Kitongoni', 40, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5709, '4190', 'Kitope', 33, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5710, '3094', 'Kitumbalomo', 70, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5711, '3860', 'Kitumbi', 19, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5712, '1336', 'Kitumbikwela', 57, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5713, '1465', 'Kitumbikwela', 57, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5714, '3733', 'Kitunda', 114, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5715, '204', 'Kitunda', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5716, '777', 'Kituntu', 30, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5717, '3445', 'Kituntu', 21, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5718, '3095', 'Kitura', 70, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5719, '1642', 'Kitwai', 115, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5720, '799', 'Kitwe', 56, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5721, '800', 'Kitwechenkura', 56, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5722, '562', 'Kitwiru', 25, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5723, '668', 'Kitwiru', 25, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5724, '2821', 'Kiungoni', 132, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5725, '1175', 'Kiusa', 83, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5726, '14', 'Kiutu', 1, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5727, '2810', 'Kiuyu', 72, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5728, '2822', 'Kiuyu', 132, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5729, '3861', 'Kiva', 19, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5730, '1314', 'Kivinje', 45, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5731, '1215', 'Kivisini', 92, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5732, '205', 'Kivukoni', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5733, '206', 'Kivule', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5734, '4186', 'Kivunge', 32, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5735, '1337', 'Kiwalala', 57, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5736, '1466', 'Kiwalala', 57, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5737, '207', 'Kiwalani', 22, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5738, '2858', 'Kiwangwa', 4, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5739, '2322', 'Kiwanja Cha Ndege', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5740, '2211', 'Kiwanja Cha Ndege', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5741, '392', 'Kiwanja cha Ndege', 15, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5742, '517', 'Kiwanja cha Ndege', 15, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5743, '1338', 'Kiwawa', 57, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5744, '1467', 'Kiwawa', 57, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5745, '4191', 'Kiwengwa', 33, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5746, '563', 'Kiwere', 25, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5747, '669', 'Kiwere', 25, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5748, '1993', 'Kiwira', 108, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5749, '2423', 'Kiyanga', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5750, '2566', 'Kiyanga', 86, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5751, '635', 'Kiyowela', 87, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5752, '3778', 'Kiyungi', 129, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5753, '3918', 'Kizara', 52, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5754, '1034', 'Kizazi', 38, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5755, '3803', 'Kizengi', 131, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5756, '983', 'Kiziguzigu', 27, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5757, '393', 'Kizota', 15, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5758, '518', 'Kizota', 15, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5759, '3174', 'Kizuka', 117, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5760, '3018', 'Kizumbi', 99, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5761, '3355', 'Kizumbi', 112, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5762, '3398', 'Kizumbi', 112, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5763, '3050', 'Kizwite', 118, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5764, '4203', 'Koani', 35, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5765, '3399', 'Kolandoto', 112, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5766, '3356', 'Kolandoto', 112, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5767, '2323', 'Kolero', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5768, '2212', 'Kolero', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5769, '434', 'Kolo', 50, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5770, '1814', 'Komaswa', 123, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5771, '3862', 'Komkonga', 19, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5772, '1643', 'Komolo', 115, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5773, '1756', 'Komuge', 105, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5774, '3660', 'Kona nne', 29, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5775, '2324', 'Konde', 82, '2024-09-21 20:20:04', '2024-09-21 20:20:04'),
(5776, '2811', 'Konde', 72, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5777, '2213', 'Konde', 82, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5778, '435', 'Kondoa Mjini', 50, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5779, '1897', 'Kongolo', 68, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5780, '2678', 'Kongolo', 64, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5781, '2884', 'Kongowe', 36, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5782, '451', 'Kongwa', 51, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5783, '3863', 'Konje', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5784, '2703', 'Koromije', 74, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5785, '1176', 'Korongoni', 83, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5786, '3019', 'Korongwe', 99, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5787, '1757', 'Koryo', 105, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5788, '1701', 'Kukirango', 10, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5789, '1001', 'Kumnyika', 34, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5790, '1002', 'Kumsenga', 34, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5791, '1035', 'Kumsenga', 38, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5792, '1036', 'Kumwambu', 38, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5793, '240', 'Kunduchi', 46, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5794, '1673', 'Kunzugu', 9, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5795, '265', 'Kurasini', 124, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5796, '1003', 'Kurugongo', 34, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5797, '2926', 'Kurui', 47, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5798, '4163', 'Kwaalinatu', 75, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5799, '4029', 'Kwabada', 88, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5800, '3864', 'Kwachaga', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5801, '436', 'Kwadelo', 50, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5802, '4030', 'Kwafungo', 88, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5803, '1004', 'Kwaga', 34, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5804, '3919', 'Kwagunda', 52, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5805, '4164', 'Kwahani', 75, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5806, '3958', 'Kwai', 60, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5807, '4031', 'Kwakifua', 88, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5808, '564', 'Kwakilosa', 25, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5809, '670', 'Kwakilosa', 25, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5810, '1216', 'Kwakoa', 92, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5811, '2885', 'Kwala', 36, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5812, '2831', 'Kwale', 11, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5813, '4009', 'Kwale', 77, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5814, '3865', 'Kwaluguru', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5815, '3866', 'Kwamagome', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5816, '3867', 'Kwamatuku', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5817, '3868', 'Kwamgwe', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5818, '3920', 'Kwamndolwa', 52, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5819, '3869', 'Kwamsisi', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5820, '3921', 'Kwamsisi', 52, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5821, '4165', 'Kwamtipura', 75, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5822, '361', 'Kwamtoro', 13, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5823, '1725', 'Kwangwa', 90, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5824, '3870', 'Kwankonje', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5825, '2528', 'Kwanyama', 120, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5826, '3922', 'Kwashemshi', 52, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5827, '3871', 'Kwasunga', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5828, '3896', 'Kwediboma', 41, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5829, '3872', 'Kwediyamba', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5830, '3873', 'Kwedizinga', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5831, '3959', 'Kwekanga', 60, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5832, '3897', 'Kwekivu', 41, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5833, '3960', 'Kwemashai', 60, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5834, '280', 'Kwembe', 126, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5835, '4032', 'Kwemingoji', 88, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5836, '4033', 'Kwemkabala', 88, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5837, '3961', 'Kwemkomole', 60, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5838, '3962', 'Kwemshasha', 60, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5839, '3874', 'Kwenjugo', 19, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5840, '2258', 'Kweuma', 91, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5841, '4034', 'Kwezitu', 88, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5842, '1815', 'Kwihancha', 123, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5843, '749', 'Kyaitoke', 8, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5844, '824', 'Kyaka', 73, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5845, '1780', 'Kyambahi', 111, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5846, '750', 'Kyamulaile', 8, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5847, '1759', 'Kyang\'ombe', 105, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5848, '1758', 'Kyangasaga', 105, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5849, '1702', 'Kyanyari', 10, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5850, '858', 'Kyebitembe', 89, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5851, '1871', 'Kyela', 55, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5852, '3468', 'Kyengenge', 24, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5853, '801', 'Kyerwa', 56, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5854, '1994', 'Kyimo', 108, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5855, '1623', 'Labay', 71, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5856, '3051', 'Laela', 118, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5857, '3323', 'Lagana', 48, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5858, '1570', 'Laghanga', 18, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5859, '362', 'Lahoda', 13, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5860, '1590', 'Laiseri', 49, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5861, '1571', 'Lalaji', 18, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5862, '363', 'Lalta', 13, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5863, '302', 'Lamaiti', 5, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5864, '1217', 'Lang\'ata', 92, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5865, '1644', 'Langai', 115, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5866, '2259', 'Langali', 91, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5867, '3096', 'Langiro', 70, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5868, '15', 'Laroi', 1, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5869, '114', 'Lashaine', 81, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5870, '2990', 'Legeza Mwendo', 28, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5871, '16', 'Leguruki', 1, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5872, '17', 'Lemanyata', 1, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5873, '61', 'Lemara', 2, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5874, '166', 'Lemara', 2, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5875, '1218', 'Lembeni', 92, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5876, '115', 'Lemooti', 81, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5877, '1591', 'Lengatei', 49, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5878, '18', 'Lengijave', 1, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5879, '452', 'Lenjulu', 51, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5880, '116', 'Lepurko', 81, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5881, '2094', 'Leshata', 16, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5882, '62', 'Levolosi', 2, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5883, '167', 'Levolosi', 2, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5884, '3923', 'Lewa', 52, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5885, '2424', 'Libobe', 86, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5886, '2567', 'Libobe', 86, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5887, '3175', 'Liganga', 117, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5888, '3132', 'Ligera', 94, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5889, '3446', 'Lighwa', 21, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5890, '3220', 'Ligoma', 125, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5891, '3221', 'Ligunga', 125, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5892, '1315', 'Lihimalyao', 45, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5893, '1316', 'Likawage', 45, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5894, '2471', 'Likokona', 95, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5895, '2425', 'Likombe', 86, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5896, '2568', 'Likombe', 86, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5897, '1386', 'Likongowele', 58, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5898, '1441', 'Likunja', 106, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5899, '3133', 'Likuyuseka', 94, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5900, '3176', 'Lilahi', 117, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5901, '3177', 'Lilambo', 117, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5902, '1387', 'Lilombe', 58, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5903, '3134', 'Limamu', 94, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5904, '3097', 'Linda', 70, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5905, '1514', 'LINDI', 57, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5906, '3155', 'Linga', 101, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5907, '1409', 'Lionja', 93, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5908, '2116', 'Lipangalala', 43, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5909, '3156', 'Liparamba', 101, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5910, '3157', 'Lipingo', 101, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5911, '2374', 'Lipumburu', 67, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5912, '2426', 'Lipwidi', 86, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5913, '2569', 'Lipwidi', 86, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5914, '3135', 'Lisimonji', 94, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5915, '923', 'LITAPUNGA', 84, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5916, '3178', 'Litapwasi', 117, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5917, '2529', 'Litehu', 120, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5918, '3098', 'Litembo', 70, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5919, '3179', 'Litisha', 117, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5920, '3136', 'Litola', 94, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5921, '3158', 'Lituhi', 101, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5922, '3099', 'Litumbandyosi', 70, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5923, '3180', 'Lituta', 117, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5924, '3159', 'Liuli', 101, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5925, '1295', 'Livishi', 113, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5926, '1388', 'Liwale \'B\'', 58, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5927, '1389', 'Liwale Mjini', 58, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5928, '208', 'Liwiti', 22, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5929, '3160', 'Liwundi', 101, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5930, '3181', 'Lizaboni', 117, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5931, '1645', 'Loiborsiret', 115, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5932, '1646', 'Loiborsoit', 115, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5933, '329', 'Loje', 12, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5934, '117', 'Lolkisale', 81, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5935, '1339', 'Longa', 57, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5936, '1468', 'Longa', 57, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5937, '102', 'Longido', 59, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5938, '1177', 'Longuo \'B\'', 83, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5939, '1592', 'Loolera', 49, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5940, '3804', 'Loya', 131, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5941, '2530', 'Luagala', 120, '2024-09-21 20:20:05', '2024-09-21 20:20:05');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(5942, '1844', 'Lualaje', 14, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5943, '2260', 'Luale', 91, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5944, '3357', 'Lubaga', 112, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5945, '3400', 'Lubaga', 112, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5946, '2704', 'Lubili', 74, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5947, '2679', 'Lubugu', 64, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5948, '2261', 'Lubungo', 91, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5949, '1442', 'Luchelegwa', 106, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5950, '2723', 'Luchelele', 100, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5951, '3137', 'Luchili', 94, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5952, '2491', 'Luchingu', 96, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5953, '3138', 'Luegu', 94, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5954, '1995', 'Lufilyo', 108, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5955, '1996', 'Lufingo', 108, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5956, '479', 'Lufu', 85, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5957, '603', 'Lugalo', 42, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5958, '2763', 'Lugata', 110, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5959, '1898', 'Lugelele', 68, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5960, '2859', 'Lugoba', 4, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5961, '3628', 'Lugubu', 20, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5962, '1266', 'Lugulu', 109, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5963, '1899', 'Luhanga', 68, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5964, '3161', 'Luhangarasi', 101, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5965, '2764', 'Luharanyonga', 110, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5966, '565', 'Luhota', 25, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5967, '671', 'Luhota', 25, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5968, '480', 'Luhundwa', 85, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5969, '636', 'Luhunga', 87, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5970, '2325', 'Luhungo', 82, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5971, '2214', 'Luhungo', 82, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5972, '3100', 'Luhuwiko', 70, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5973, '2285', 'Lukande', 128, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5974, '2953', 'Lukanga', 79, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5975, '3101', 'Lukarasi', 70, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5976, '2326', 'Lukobe', 82, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5977, '2215', 'Lukobe', 82, '2024-09-21 20:20:05', '2024-09-21 20:20:05'),
(5978, '2531', 'Lukokoda', 120, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5979, '3963', 'Lukozi', 60, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5980, '2375', 'Lukuledi', 67, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5981, '3222', 'Lukumbule', 125, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5982, '2376', 'Lulindi', 67, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5983, '2149', 'Lumbiji', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5984, '3162', 'Lumeme', 101, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5985, '2117', 'Lumemo', 43, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5986, '2472', 'Lumesule', 95, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5987, '566', 'Lumuli', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5988, '672', 'Lumuli', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5989, '481', 'Lumuma', 85, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5990, '2150', 'Lumuma', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5991, '2216', 'Lundi', 82, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5992, '2327', 'Lundi', 82, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5993, '3281', 'Lunguya', 26, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5994, '3964', 'Lunguza', 60, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5995, '1845', 'Lupa', 14, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5996, '2377', 'Lupaso', 67, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5997, '1997', 'Lupata', 108, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5998, '1998', 'Lupepo', 108, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(5999, '482', 'Lupeta', 85, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6000, '2286', 'Lupiro', 128, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6001, '710', 'Lusahunga', 6, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6002, '3052', 'Lusaka', 118, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6003, '4035', 'Lusanga', 88, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6004, '3139', 'Lusewa', 94, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6005, '3965', 'Lushoto', 60, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6006, '3102', 'Lusonga', 70, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6007, '3691', 'Lusu', 102, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6008, '1872', 'Lusungo', 55, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6009, '2680', 'Lutale', 64, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6010, '1999', 'Luteba', 108, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6011, '3805', 'Lutende', 131, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6012, '3924', 'Lutindi', 52, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6013, '3103', 'Luwaita', 70, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6014, '3898', 'Lwande', 41, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6015, '2000', 'Lwangwa', 108, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6016, '2724', 'Lwanhima', 100, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6017, '1945', 'Lwanjilo', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6018, '2051', 'Lwanjilo', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6019, '3053', 'Lwiche', 118, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6020, '3358', 'Lyabukande', 112, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6021, '3401', 'Lyabukande', 112, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6022, '3402', 'Lyabusalu', 112, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6023, '3359', 'Lyabusalu', 112, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6024, '567', 'Lyamgungwe', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6025, '673', 'Lyamgungwe', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6026, '3403', 'Lyamidati', 112, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6027, '3360', 'Lyamidati', 112, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6028, '3054', 'Lyangalile', 118, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6029, '2532', 'Lyenje', 120, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6030, '2644', 'Lyoma', 54, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6031, '2991', 'Lyowa', 28, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6032, '141', 'Maalon', 98, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6033, '1946', 'Maanga', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6034, '2052', 'Maanga', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6035, '1873', 'Mababu', 55, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6036, '3899', 'Mabalanga', 41, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6037, '825', 'Mabale', 73, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6038, '3806', 'Mabama', 131, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6039, '1037', 'Mabamba', 38, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6040, '3875', 'Mabanda', 19, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6041, '2725', 'Mabatini', 100, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6042, '1947', 'Mabatini', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6043, '2053', 'Mabatini', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6044, '4079', 'Mabawa', 121, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6045, '4106', 'Mabawa', 121, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6046, '883', 'Mabawe', 97, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6047, '281', 'Mabibo', 126, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6048, '1267', 'Mabilioni', 109, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6049, '802', 'Mabira', 56, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6050, '568', 'Maboga', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6051, '674', 'Maboga', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6052, '1178', 'Mabogini', 83, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6053, '4080', 'Mabokweni', 121, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6054, '4107', 'Mabokweni', 121, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6055, '2705', 'Mabuki', 74, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6056, '2151', 'Mabula', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6057, '241', 'Mabwepande', 46, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6058, '2152', 'Mabwerebwere', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6059, '1139', 'Machame Kaskazini', 17, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6060, '1140', 'Machame Magharibi', 17, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6061, '1141', 'Machame Mashariki', 17, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6062, '1142', 'Machame Narumu', 17, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6063, '1143', 'Machame Uroki', 17, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6064, '924', 'Machimboni', 84, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6065, '1062', 'Machinjioni', 40, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6066, '1113', 'Machinjioni', 40, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6067, '1781', 'Machochwe', 111, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6068, '4063', 'Madanga', 103, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6069, '2095', 'Madege', 16, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6070, '1900', 'Madibira', 68, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6071, '2427', 'Madimba', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6072, '2570', 'Madimba', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6073, '2153', 'Madoto', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6074, '394', 'Madukani', 15, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6075, '519', 'Madukani', 15, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6076, '637', 'Maduma', 87, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6077, '1531', 'Madunga', 3, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6078, '2832', 'Madungu', 11, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6079, '1948', 'Maendeleo', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6080, '1949', 'Maendeleo', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6081, '2054', 'Maendeleo', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6082, '2055', 'Maendeleo', 69, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6083, '2217', 'Mafiga', 82, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6084, '2328', 'Mafiga', 82, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6085, '2329', 'Mafisa', 82, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6086, '2218', 'Mafisa', 82, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6087, '2927', 'Mafizi', 47, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6088, '4192', 'Mafufuni', 33, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6089, '3055', 'Mafulala', 118, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6090, '859', 'Mafumbo', 89, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6091, '1846', 'Mafyeko', 14, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6092, '2219', 'Magadu', 82, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6093, '2330', 'Magadu', 82, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6094, '3182', 'Magagula', 117, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6095, '925', 'Magamba', 84, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6096, '3966', 'Magamba', 60, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6097, '3925', 'Magamba Kwalukonge', 52, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6098, '1782', 'Magange', 111, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6099, '3324', 'Maganzo', 48, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6100, '4081', 'Magaoni', 121, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6101, '4108', 'Magaoni', 121, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6102, '1532', 'Magara', 3, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6103, '860', 'Magata/Karutanga', 89, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6104, '2954', 'Magawa', 79, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6105, '3140', 'Magazini', 94, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6106, '3692', 'Magengati', 102, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6107, '2428', 'Magengeni', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6108, '2571', 'Magengeni', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6109, '1624', 'Maghang', 71, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6110, '3541', 'Maghojoa', 116, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6111, '3580', 'Maghojoa', 116, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6112, '4036', 'Magila', 88, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6113, '3926', 'Magila Gereza', 52, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6114, '2886', 'Magindu', 36, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6115, '3807', 'Magiri', 131, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6116, '2154', 'Magole', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6117, '3927', 'Magoma', 52, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6118, '4166', 'Magomeni', 75, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6119, '2155', 'Magomeni', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6120, '242', 'Magomeni', 46, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6121, '2429', 'Magomeni', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6122, '2572', 'Magomeni', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6123, '2860', 'Magomeni', 4, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6124, '4037', 'Magoroto', 88, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6125, '2096', 'Magoweko', 16, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6126, '2681', 'Magu mjini', 64, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6127, '2156', 'Magubike', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6128, '1533', 'Magugu', 3, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6129, '2157', 'Maguha', 44, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6130, '569', 'Magulilwa', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6131, '675', 'Magulilwa', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6132, '3928', 'Magunga', 52, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6133, '1593', 'Magungu', 49, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6134, '3104', 'Maguu', 70, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6135, '3183', 'Mahanje', 117, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6136, '2908', 'Mahege', 37, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6137, '1063', 'Mahembe', 40, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6138, '1114', 'Mahembe', 40, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6139, '604', 'Mahenge', 42, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6140, '2287', 'Mahenge Mjini', 128, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6141, '3967', 'Mahezangulu', 60, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6142, '1236', 'Mahida', 104, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6143, '2726', 'Mahina', 100, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6144, '4193', 'Mahonda', 33, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6145, '1901', 'Mahongole', 68, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6146, '2492', 'Mahumbika', 96, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6147, '570', 'Mahuninga', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6148, '676', 'Mahuninga', 25, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6149, '2430', 'Mahurunga', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6150, '2573', 'Mahurunga', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6151, '2533', 'Mahuta', 120, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6152, '2887', 'Mailimoja', 36, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6153, '1534', 'Maisaka', 3, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6154, '2765', 'Maisome', 110, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6155, '330', 'Majeleko', 12, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6156, '19', 'Majengo', 1, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6157, '118', 'Majengo', 81, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6158, '395', 'Majengo', 15, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6159, '520', 'Majengo', 15, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6160, '926', 'Majengo', 84, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6161, '1064', 'Majengo', 40, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6162, '1115', 'Majengo', 40, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6163, '2431', 'Majengo', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6164, '2574', 'Majengo', 86, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6165, '3020', 'Majengo', 99, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6166, '3056', 'Majengo', 118, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6167, '3184', 'Majengo', 117, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6168, '3223', 'Majengo', 125, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6169, '3282', 'Majengo', 26, '2024-09-21 20:20:06', '2024-09-21 20:20:06'),
(6170, '1179', 'Majengo', 83, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6171, '1340', 'Majengo', 57, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6172, '1469', 'Majengo', 57, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6173, '1950', 'Majengo', 69, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6174, '2056', 'Majengo', 69, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6175, '3542', 'Majengo', 116, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6176, '3581', 'Majengo', 116, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6177, '3929', 'Majengo', 52, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6178, '4038', 'Majengo', 88, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6179, '4082', 'Majengo', 121, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6180, '4109', 'Majengo', 121, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6181, '20', 'Maji ya chai', 1, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6182, '3224', 'Majimaji', 125, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6183, '905', 'Majimoto', 80, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6184, '1783', 'Majimoto', 111, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6185, '3495', 'Majiri', 66, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6186, '209', 'Majohe', 22, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6187, '1594', 'Makame', 49, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6188, '303', 'Makanda', 5, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6189, '3496', 'Makanda', 66, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6190, '2001', 'Makandana', 108, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6191, '331', 'Makang\'wa', 12, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6192, '266', 'Makangarawe', 124, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6193, '1443', 'Makanjiro', 106, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6194, '1268', 'Makanya', 109, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6195, '3968', 'Makanya', 60, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6196, '927', 'Makanyagio', 84, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6197, '1390', 'Makata', 58, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6198, '453', 'Makawa', 51, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6199, '3808', 'Makazi', 131, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6200, '1005', 'Makere', 34, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6201, '21', 'Makiba', 1, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6202, '1237', 'Makiidi', 104, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6203, '3447', 'Makilawa', 21, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6204, '3661', 'Makingi', 29, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6205, '3448', 'Makiungu', 21, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6206, '1296', 'Makiwaru', 113, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6207, '1726', 'Makojo', 90, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6208, '1727', 'Makoko', 90, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6209, '396', 'Makole', 15, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6210, '521', 'Makole', 15, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6211, '4039', 'Makole', 88, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6212, '1341', 'Makonde', 57, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6213, '1470', 'Makonde', 57, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6214, '2378', 'Makong\'onda', 67, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6215, '2493', 'Makonga', 96, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6216, '243', 'Makongo', 46, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6217, '1847', 'Makongolosi', 14, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6218, '364', 'Makorongo', 13, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6219, '571', 'Makorongoni', 25, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6220, '677', 'Makorongoni', 25, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6221, '4083', 'Makorora', 121, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6222, '4110', 'Makorora', 121, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6223, '2494', 'Makote', 96, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6224, '282', 'Makuburi', 126, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6225, '2495', 'Makukwe', 96, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6226, '3930', 'Makumba', 52, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6227, '244', 'Makumbusho', 46, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6228, '638', 'Makungu', 87, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6229, '3543', 'Makuro', 116, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6230, '3582', 'Makuro', 116, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6231, '3497', 'Makuru', 66, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6232, '283', 'Makurumla', 126, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6233, '2861', 'Makurunge', 4, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6234, '397', 'Makutopora', 15, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6235, '522', 'Makutopora', 15, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6236, '3498', 'Makutupora', 66, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6237, '3931', 'Makuyuni', 52, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6238, '119', 'Makuyuni', 81, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6239, '1180', 'Makuyuni (Himo)', 83, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6240, '1874', 'Makwale', 55, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6241, '142', 'Malambo', 98, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6242, '639', 'Malangali', 87, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6243, '3057', 'Malangali', 118, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6244, '2496', 'Malatu', 96, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6245, '572', 'Malengamakali', 25, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6246, '678', 'Malengamakali', 25, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6247, '3876', 'Malezi', 19, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6248, '3969', 'Malibwi', 60, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6249, '2645', 'Maligisu', 54, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6250, '3970', 'Malindi', 60, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6251, '4167', 'Malindi', 75, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6252, '2002', 'Malindo', 108, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6253, '2182', 'Malinyi', 65, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6254, '1444', 'Malolo', 106, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6255, '2158', 'Malolo', 44, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6256, '3760', 'Malolo', 119, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6257, '3837', 'Malolo', 119, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6258, '483', 'Malolo', 85, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6259, '2534', 'Malopokelo', 120, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6260, '3469', 'Maluga', 24, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6261, '22', 'Malula', 1, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6262, '3283', 'Malunga', 26, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6263, '2646', 'Malya', 54, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6264, '2706', 'Mamaye', 74, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6265, '906', 'Mamba', 80, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6266, '1848', 'Mamba', 14, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6267, '3971', 'Mamba', 60, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6268, '1181', 'Mamba Kaskazini', 83, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6269, '1182', 'Mamba Kusini', 83, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6270, '3693', 'Mambali', 102, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6271, '4153', 'Mambosasa', 63, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6272, '2159', 'Mamboya', 44, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6273, '2993', 'Mambwe Nkoswe', 28, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6274, '2992', 'Mambwekenya', 28, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6275, '1535', 'Mamire', 3, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6276, '1238', 'Mamsera', 104, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6277, '332', 'Manchali', 12, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6278, '1784', 'Manchira', 111, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6279, '1239', 'Manda', 104, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6280, '333', 'Manda', 12, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6281, '1445', 'Mandarawe', 106, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6282, '1317', 'Mandawa', 45, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6283, '1446', 'Mandawa', 106, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6284, '2097', 'Mandege', 16, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6285, '2862', 'Mandera', 4, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6286, '3544', 'Mandewa', 116, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6287, '3583', 'Mandewa', 116, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6288, '1342', 'Mandwanga', 57, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6289, '1471', 'Mandwanga', 57, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6290, '2928', 'Maneromango', 47, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6291, '88', 'Mang\'ola', 31, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6292, '3449', 'Mang\'onyi', 21, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6293, '2118', 'Mang\'ula', 43, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6294, '2119', 'Mang\'ula \"B\"', 43, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6295, '1816', 'Manga', 123, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6296, '2262', 'Mangae', 91, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6297, '2473', 'Mangaka', 95, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6298, '484', 'Mangaliza', 85, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6299, '1391', 'Mangirikiti', 58, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6300, '2432', 'Mangopachanne', 86, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6301, '2575', 'Mangopachanne', 86, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6302, '3972', 'Manolo', 60, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6303, '2647', 'Mantare', 54, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6304, '3932', 'Manundu', 52, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6305, '1674', 'Manyamanyama', 9, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6306, '3499', 'Manyoni Urban', 66, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6307, '4010', 'Manza', 77, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6308, '334', 'Manzase', 12, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6309, '284', 'Manzese', 126, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6310, '1269', 'Maore', 109, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6311, '3284', 'Mapamba', 26, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6312, '3761', 'Mapambano', 119, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6313, '3838', 'Mapambano', 119, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6314, '640', 'Mapanda', 87, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6315, '2909', 'Maparoni', 37, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6316, '4011', 'Mapatano', 77, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6317, '3105', 'Mapera', 70, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6318, '2863', 'Mapinga', 4, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6319, '1902', 'Mapogoro', 68, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6320, '3185', 'Maposeni', 117, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6321, '2497', 'Maputi', 96, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6322, '4012', 'Maramba', 77, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6323, '1410', 'Marambo', 93, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6324, '1625', 'Marang', 71, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6325, '1240', 'Marangu Kitowo', 104, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6326, '1183', 'Marangu Magharibi', 83, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6327, '1184', 'Marangu Mashariki', 83, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6328, '2474', 'Maratani', 95, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6329, '1626', 'Maretadu', 71, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6330, '2379', 'Marika', 67, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6331, '23', 'Maroroni', 1, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6332, '2929', 'Marui', 47, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6333, '751', 'Maruku', 8, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6334, '3225', 'Marumba', 125, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6335, '2930', 'Marumbo', 47, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6336, '4084', 'Marungu', 121, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6337, '4111', 'Marungu', 121, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6338, '24', 'Maruvango', 1, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6339, '1703', 'Masaba', 10, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6340, '3900', 'Masagalu', 41, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6341, '2120', 'Masagati', 43, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6342, '4064', 'Masaika', 103, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6343, '573', 'Masaka', 25, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6344, '679', 'Masaka', 25, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6345, '2931', 'Masaki', 47, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6346, '1572', 'Masakta', 18, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6347, '1144', 'Masama Kati', 17, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6348, '1145', 'Masama Kusini', 17, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6349, '1146', 'Masama Magharibi', 17, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6350, '1147', 'Masama Mashariki', 17, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6351, '1148', 'Masama Rundugai', 17, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6352, '3325', 'Masanga', 48, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6353, '437', 'Masange', 50, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6354, '2160', 'Masanze', 44, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6355, '2003', 'Masebe', 108, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6356, '3404', 'Masekelo', 112, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6357, '3361', 'Masekelo', 112, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6358, '3362', 'Masengwa', 112, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6359, '3405', 'Masengwa', 112, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6360, '3021', 'Mashete', 99, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6361, '3933', 'Mashewa', 52, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6362, '1627', 'Masieda', 71, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6363, '605', 'Masisiwe', 42, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6364, '4085', 'Masiwani', 121, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6365, '4112', 'Masiwani', 121, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6366, '2263', 'Maskati', 91, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6367, '1318', 'Masoko', 45, '2024-09-21 20:20:07', '2024-09-21 20:20:07'),
(6368, '1951', 'Masoko', 69, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6369, '2004', 'Masoko', 108, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6370, '2057', 'Masoko', 69, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6371, '3226', 'Masonya', 125, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6372, '1573', 'Masqaroda', 18, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6373, '1628', 'Masqaroda', 71, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6374, '485', 'Massa', 85, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6375, '2475', 'Masuguru', 95, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6376, '3934', 'Masuguru', 52, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6377, '4040', 'Masuguru', 88, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6378, '2005', 'Masukulu', 108, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6379, '3106', 'Masumuni', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6380, '2994', 'Matai', 28, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6381, '2833', 'Matale', 11, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6382, '103', 'Matale A', 59, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6383, '1447', 'Matambarale', 106, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6384, '3058', 'Matanga', 118, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6385, '3107', 'Matarawe', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6386, '3186', 'Matarawe', 117, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6387, '1785', 'Matare', 111, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6388, '2380', 'Matawale', 67, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6389, '3108', 'Mateka', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6390, '3187', 'Mateka', 117, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6391, '1411', 'Matekwe', 93, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6392, '1875', 'Matema', 55, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6393, '3227', 'Matemanga', 125, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6394, '1065', 'Matendo', 40, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6395, '1116', 'Matendo', 40, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6396, '3188', 'Matetereka', 117, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6397, '25', 'Mateves', 1, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6398, '1343', 'Matimba', 57, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6399, '1472', 'Matimba', 57, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6400, '3189', 'Matimira', 117, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6401, '3109', 'Matiri', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6402, '3190', 'Matogoro', 117, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6403, '486', 'Matomondo', 85, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6404, '3522', 'Matongo', 76, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6405, '1817', 'Matongo', 123, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6406, '454', 'Matongoro', 51, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6407, '1344', 'Matopeni', 57, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6408, '1473', 'Matopeni', 57, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6409, '1595', 'Matui', 49, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6410, '2220', 'Matuli', 82, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6411, '2331', 'Matuli', 82, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6412, '3191', 'Matumbi', 117, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6413, '398', 'Matumbulu', 15, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6414, '523', 'Matumbulu', 15, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6415, '1849', 'Matundasi', 14, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6416, '2006', 'Matwebe', 108, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6417, '1850', 'Matwiga', 14, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6418, '2535', 'Maundo', 120, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6419, '2288', 'Mawasiliano', 128, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6420, '3500', 'Maweni', 66, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6421, '4086', 'Maweni', 121, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6422, '4113', 'Maweni', 121, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6423, '1185', 'Mawenzi', 83, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6424, '1903', 'Mawindi', 68, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6425, '2433', 'Mayanga', 86, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6426, '2576', 'Mayanga', 86, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6427, '3973', 'Mayo', 60, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6428, '4013', 'Mayomboni', 77, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6429, '861', 'Mayondwe', 89, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6430, '487', 'Mazae', 85, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6431, '2332', 'Mazimbu', 82, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6432, '2221', 'Mazimbu', 82, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6433, '3935', 'Mazinde', 52, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6434, '862', 'Mazinga', 89, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6435, '3877', 'Mazingara', 19, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6436, '3059', 'Mazwi', 118, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6437, '399', 'Mbabala', 15, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6438, '524', 'Mbabala', 15, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6439, '267', 'Mbagala', 124, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6440, '268', 'Mbagala Kuu', 124, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6441, '3694', 'Mbagwa', 102, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6442, '3163', 'Mbaha', 101, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6443, '641', 'Mbalamaziwa', 87, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6444, '400', 'Mbalawala', 15, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6445, '525', 'Mbalawala', 15, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6446, '1786', 'Mbalibali', 111, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6447, '1952', 'Mbalizi Road', 69, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6448, '2058', 'Mbalizi Road', 69, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6449, '3164', 'Mbamba bay', 101, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6450, '3110', 'Mbambi', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6451, '3111', 'Mbangamao', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6452, '1345', 'Mbanja', 57, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6453, '1474', 'Mbanja', 57, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6454, '3974', 'Mbaramo', 60, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6455, '4041', 'Mbaramo', 88, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6456, '2707', 'Mbarika', 74, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6457, '3975', 'Mbaru', 60, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6458, '2121', 'Mbasa', 43, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6459, '3228', 'Mbati', 125, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6460, '2434', 'Mbawala', 86, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6461, '2577', 'Mbawala', 86, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6462, '1392', 'Mbaya', 58, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6463, '907', 'Mbede', 80, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6464, '1448', 'Mbekenyera', 106, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6465, '3470', 'Mbelekese', 24, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6466, '2435', 'Mbembaleo', 86, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6467, '2578', 'Mbembaleo', 86, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6468, '3229', 'Mbesa', 125, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6469, '2084', 'MBEYA', 69, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6470, '2955', 'Mbezi', 79, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6471, '285', 'Mbezi', 126, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6472, '245', 'Mbezi Juu', 46, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6473, '2161', 'Mbigiri', 44, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6474, '3192', 'Mbinga Mhalule', 117, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6475, '3112', 'Mbinga Mjini', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6476, '3113', 'Mbinga Mjini B', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6477, '2122', 'Mbingu', 43, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6478, '1818', 'Mbogi', 123, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6479, '3695', 'Mbogwe', 102, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6480, '1186', 'Mbokomu', 83, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6481, '574', 'Mboliboli', 25, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6482, '680', 'Mboliboli', 25, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6483, '4042', 'Mbomole', 88, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6484, '1412', 'Mbondo', 93, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6485, '884', 'Mbuba', 97, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6486, '2910', 'Mbuchi', 37, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6487, '2289', 'Mbuga', 128, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6488, '488', 'Mbuga', 85, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6489, '2727', 'Mbugani', 100, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6490, '3762', 'Mbugani', 119, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6491, '3839', 'Mbugani', 119, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6492, '1851', 'Mbugani', 14, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6493, '1876', 'Mbugani', 55, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6494, '26', 'Mbuguni', 1, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6495, '3114', 'Mbuji', 70, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6496, '2995', 'Mbuluma', 28, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6497, '89', 'Mbulumbulu', 31, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6498, '2162', 'Mbumi', 44, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6499, '286', 'Mburahati', 126, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6500, '3629', 'Mbutu', 20, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6501, '3696', 'Mbutu', 102, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6502, '2222', 'Mbuyuni', 82, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6503, '2333', 'Mbuyuni', 82, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6504, '2381', 'Mbuyuni', 67, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6505, '3976', 'Mbuzii', 60, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6506, '2974', 'Mbwara', 107, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6507, '2888', 'Mbwawa', 36, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6508, '3977', 'Mbwei', 60, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6509, '1449', 'Mbwemkuru (Machang\'anja)', 106, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6510, '4154', 'Mbweni', 63, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6511, '246', 'Mbweni', 46, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6512, '2864', 'Mbwewe', 4, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6513, '210', 'Mchafukoge', 22, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6514, '2823', 'Mchanga Mdogo', 132, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6515, '3230', 'Mchangani', 125, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6516, '1675', 'Mcharo', 9, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6517, '2382', 'Mchauru', 67, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6518, '2498', 'Mchemo', 96, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6519, '3231', 'Mchesi', 125, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6520, '2536', 'Mchichira', 120, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6521, '211', 'Mchikichini', 22, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6522, '3779', 'Mchikichini', 129, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6523, '1346', 'Mchinga', 57, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6524, '1475', 'Mchinga', 57, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6525, '2499', 'Mcholi  I', 96, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6526, '2500', 'Mcholi II', 96, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6527, '2123', 'Mchombe', 43, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6528, '3141', 'Mchomoro', 94, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6529, '1413', 'Mchonda', 93, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6530, '3232', 'Mchoteka', 125, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6531, '2911', 'Mchukwi', 37, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6532, '3233', 'Mchuluka', 125, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6533, '642', 'Mdabulo', 87, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6534, '2537', 'Mdimba Mnyoma', 120, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6535, '2501', 'Mdimba MpeleMpele', 96, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6536, '3878', 'Mdoe', 19, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6537, '1574', 'Measkron', 18, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6538, '2627', 'Mecco', 23, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6539, '3285', 'Mega', 26, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6540, '2264', 'Melela', 91, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6541, '4155', 'Melinne', 63, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6542, '335', 'Membe', 12, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6543, '1241', 'Mengeni', 104, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6544, '1242', 'Mengwe', 104, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6545, '3545', 'Merya', 116, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6546, '3584', 'Merya', 116, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6547, '120', 'Meserani', 81, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6548, '3193', 'Mfaranyaki', 117, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6549, '4138', 'Mfenesini', 62, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6550, '121', 'Mfereji', 81, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6551, '3060', 'Mfinga', 118, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6552, '1187', 'Mfumuni', 83, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6553, '1219', 'Mgagao', 92, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6554, '575', 'Mgama', 25, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6555, '681', 'Mgama', 25, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6556, '3879', 'Mgambo', 19, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6557, '3501', 'Mgandu', 66, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6558, '1088', 'Mganza', 130, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6559, '2265', 'Mgeta', 91, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6560, '2975', 'Mgomba', 107, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6561, '3142', 'Mgombasi', 94, '2024-09-21 20:20:08', '2024-09-21 20:20:08'),
(6562, '3936', 'Mgombezi', 52, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6563, '3471', 'Mgongo', 24, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6564, '3546', 'Mgori', 116, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6565, '3585', 'Mgori', 116, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6566, '3450', 'Mgungira', 21, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6567, '3937', 'Mgwashi', 52, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6568, '3978', 'Mgwashi', 60, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6569, '4043', 'Mhamba', 88, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6570, '2648', 'Mhande', 54, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6571, '2728', 'Mhandu', 100, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6572, '2163', 'Mhenda', 44, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6573, '1270', 'Mhezi', 109, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6574, '4014', 'Mhinduro', 77, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6575, '2266', 'Mhonda', 91, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6576, '3286', 'Mhongolo', 26, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6577, '3115', 'Mhongozi', 70, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6578, '3287', 'Mhungula', 26, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6579, '3061', 'Miangalua', 118, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6580, '269', 'Mianzini', 124, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6581, '270', 'Miburani', 124, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6582, '2943', 'Miburani', 61, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6583, '2124', 'Michenga', 43, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6584, '2538', 'Michenjele', 120, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6585, '2843', 'Michenzani', 78, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6586, '2812', 'Micheweni', 72, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6587, '2476', 'Michiga', 95, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6588, '1188', 'Miembeni', 83, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6589, '752', 'Miembeni', 8, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6590, '3979', 'Migambo', 60, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6591, '3523', 'Miganga', 76, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6592, '576', 'Migoli', 25, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6593, '682', 'Migoli', 25, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6594, '4168', 'Migombani', 75, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6595, '2383', 'Migongo', 67, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6596, '122', 'Migungani', 81, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6597, '1319', 'Miguruwe', 45, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6598, '3697', 'Miguwa', 102, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6599, '2539', 'Mihambwe', 120, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6600, '1676', 'Mihingo', 9, '2024-09-21 20:20:09', '2024-09-21 20:20:09');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(6601, '1393', 'Mihumo', 58, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6602, '2384', 'Mijelejele', 67, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6603, '3116', 'Mikalanga', 70, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6604, '2477', 'Mikangaula', 95, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6605, '2334', 'Mikese', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6606, '2223', 'Mikese', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6607, '4065', 'Mikinguni', 103, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6608, '247', 'Mikocheni', 46, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6609, '753', 'Mikoni', 8, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6610, '1877', 'Mikoroshoni', 55, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6611, '1347', 'Mikumbi', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6612, '1476', 'Mikumbi', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6613, '2502', 'Mikumbi', 96, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6614, '2164', 'Mikumi', 44, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6615, '3662', 'Milambo', 29, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6616, '3698', 'Milambo Itobo', 102, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6617, '2436', 'Milangominne', 86, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6618, '2579', 'Milangominne', 86, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6619, '3062', 'Milanzi', 118, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6620, '3063', 'Milepa', 118, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6621, '3980', 'Milingano', 60, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6622, '2290', 'Milola', 128, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6623, '1348', 'Milola', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6624, '1477', 'Milola', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6625, '2540', 'Milongodi', 120, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6626, '489', 'Mima', 85, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6627, '212', 'Minazi Mirefu', 22, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6628, '2335', 'Mindu', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6629, '3234', 'Mindu', 125, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6630, '2224', 'Mindu', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6631, '2291', 'Minepa', 128, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6632, '3547', 'Minga', 116, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6633, '3586', 'Minga', 116, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6634, '1349', 'Mingoyo', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6635, '1478', 'Mingoyo', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6636, '1320', 'Mingumbi', 45, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6637, '3451', 'Minyughe', 21, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6638, '826', 'Minziro', 73, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6639, '2865', 'Miono', 4, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6640, '2956', 'Mipeko', 79, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6641, '1350', 'Mipingo', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6642, '1479', 'Mipingo', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6643, '3165', 'Mipotopoto', 101, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6644, '1760', 'Mirare', 105, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6645, '1647', 'Mirerani', 115, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6646, '2729', 'Mirongo', 100, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6647, '1394', 'Mirui', 58, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6648, '1704', 'Mirwa', 10, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6649, '4044', 'Misalai', 88, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6650, '2708', 'Misasi', 74, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6651, '3235', 'Misechela', 125, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6652, '1038', 'Misezero', 38, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6653, '3763', 'Misha', 119, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6654, '3840', 'Misha', 119, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6655, '949', 'Mishamo', 122, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6656, '3734', 'Misheni', 114, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6657, '143', 'Misigiyo', 98, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6658, '3880', 'Misima', 19, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6659, '4045', 'Misozwe', 88, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6660, '2766', 'Mission', 110, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6661, '3194', 'Misufini', 117, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6662, '3452', 'Misughaa', 21, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6663, '2889', 'Misugusugu', 36, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6664, '3548', 'Misuna', 116, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6665, '3587', 'Misuna', 116, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6666, '2709', 'Misungwi', 74, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6667, '928', 'Misunkumilo', 84, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6668, '3809', 'Miswaki', 131, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6669, '1351', 'Mitandi', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6670, '1480', 'Mitandi', 57, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6671, '1321', 'Miteja', 45, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6672, '2437', 'Mitengo', 86, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6673, '2580', 'Mitengo', 86, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6674, '2385', 'Mitesa', 67, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6675, '1297', 'Miti mirefu', 113, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6676, '1322', 'Mitole', 45, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6677, '1414', 'Mitumbati', 93, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6678, '3502', 'Mitundu', 66, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6679, '3549', 'Mitunduruni', 116, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6680, '3588', 'Mitunduruni', 116, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6681, '2541', 'Miuta', 120, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6682, '577', 'Mivinjeni', 25, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6683, '683', 'Mivinjeni', 25, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6684, '3810', 'Miyenze', 131, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6685, '1904', 'Miyombweni', 68, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6686, '401', 'Miyuji', 15, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6687, '526', 'Miyuji', 15, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6688, '3699', 'Mizibaziba', 102, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6689, '2912', 'Mjawa', 37, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6690, '1953', 'Mjele', 69, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6691, '2059', 'Mjele', 69, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6692, '2225', 'Mji Mkuu', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6693, '2336', 'Mji Mkuu', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6694, '2337', 'Mji Mpya', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6695, '1189', 'Mji Mpya', 83, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6696, '2226', 'Mji Mpya', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6697, '229', 'Mjimwema', 39, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6698, '3195', 'Mjimwema', 117, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6699, '3196', 'Mjini', 117, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6700, '3363', 'Mjini', 112, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6701, '3406', 'Mjini', 112, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6702, '3117', 'Mkako', 70, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6703, '2098', 'Mkalama', 16, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6704, '3938', 'Mkalamo', 52, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6705, '4066', 'Mkalamo', 103, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6706, '2996', 'Mkali', 28, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6707, '2957', 'Mkamba', 79, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6708, '2338', 'Mkambalani', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6709, '2227', 'Mkambalani', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6710, '2866', 'Mkange', 4, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6711, '3881', 'Mkata', 19, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6712, '4194', 'Mkataleni', 33, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6713, '965', 'Mkatanga', 7, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6714, '1066', 'Mkigo', 40, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6715, '1117', 'Mkigo', 40, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6716, '578', 'Mkimbizi', 25, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6717, '684', 'Mkimbizi', 25, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6718, '3901', 'Mkindi', 41, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6719, '3663', 'Mkindo', 29, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6720, '2267', 'Mkindo', 91, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6721, '3022', 'Mkinga', 99, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6722, '4015', 'Mkinga', 77, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6723, '3453', 'Mkiwa', 21, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6724, '2844', 'Mkoani', 78, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6725, '1415', 'Mkoka', 93, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6726, '455', 'Mkoka', 51, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6727, '1852', 'Mkola', 14, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6728, '2730', 'Mkolani', 100, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6729, '3735', 'Mkolye', 114, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6730, '1761', 'Mkoma', 105, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6731, '2503', 'Mkoma II', 96, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6732, '2386', 'Mkomaindo', 67, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6733, '3939', 'Mkomazi', 52, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6734, '2976', 'Mkongo', 107, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6735, '3143', 'Mkongo', 94, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6736, '3144', 'Mkongo Gulioni', 94, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6737, '1067', 'Mkongoro', 40, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6738, '1118', 'Mkongoro', 40, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6739, '3197', 'Mkongotema', 117, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6740, '2542', 'Mkonjowano', 120, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6741, '2478', 'Mkonona', 95, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6742, '402', 'Mkonze', 15, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6743, '527', 'Mkonze', 15, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6744, '2543', 'Mkoreha', 120, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6745, '1416', 'Mkotokuyana', 93, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6746, '2997', 'Mkowe', 28, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6747, '2125', 'Mkula', 43, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6748, '2228', 'Mkulazi', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6749, '2339', 'Mkulazi', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6750, '2387', 'Mkululu', 67, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6751, '2504', 'Mkulung\'ulu', 96, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6752, '3940', 'Mkumbara', 52, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6753, '3118', 'Mkumbi', 70, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6754, '2340', 'Mkundi', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6755, '2544', 'Mkundi', 120, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6756, '2229', 'Mkundi', 82, '2024-09-21 20:20:09', '2024-09-21 20:20:09'),
(6757, '2438', 'Mkunwa', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6758, '2581', 'Mkunwa', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6759, '2505', 'Mkunya', 96, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6760, '2958', 'Mkuranga', 79, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6761, '1395', 'Mkutano', 58, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6762, '2388', 'Mkuti', 67, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6763, '2341', 'Mkuyuni', 82, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6764, '2731', 'Mkuyuni', 100, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6765, '2230', 'Mkuyuni', 82, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6766, '2890', 'Mkuza', 36, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6767, '4046', 'Mkuzi', 88, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6768, '4067', 'Mkwaja', 103, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6769, '3023', 'Mkwamba', 99, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6770, '2165', 'Mkwatani', 44, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6771, '579', 'Mkwawa', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6772, '685', 'Mkwawa', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6773, '2506', 'Mkwedu', 96, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6774, '2545', 'Mkwedu', 120, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6775, '3503', 'Mkwese', 66, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6776, '2546', 'Mkwiti', 120, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6777, '2126', 'Mlabani', 43, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6778, '606', 'Mlafu', 42, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6779, '456', 'Mlali', 51, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6780, '2268', 'Mlali', 91, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6781, '3981', 'Mlalo', 60, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6782, '4169', 'Mlandege', 75, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6783, '580', 'Mlandege', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6784, '686', 'Mlandege', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6785, '2891', 'Mlandizi', 36, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6786, '27', 'Mlangarini', 1, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6787, '2913', 'Mlanzi', 37, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6788, '490', 'Mlembule', 85, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6789, '1396', 'Mlembwe', 58, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6790, '581', 'Mlenge', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6791, '687', 'Mlenge', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6792, '3198', 'Mletele', 117, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6793, '2342', 'Mlimani', 82, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6794, '2231', 'Mlimani', 82, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6795, '3882', 'Mlimani', 19, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6796, '2127', 'Mlimba', 43, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6797, '4047', 'Mlingano', 88, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6798, '3236', 'Mlingoti Mashariki', 125, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6799, '3237', 'Mlingotini Magharibi', 125, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6800, '2389', 'Mlingula', 67, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6801, '3982', 'Mlola', 60, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6802, '582', 'Mlowa', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6803, '688', 'Mlowa', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6804, '336', 'Mlowa Barabarani', 12, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6805, '337', 'Mlowa bwawani', 12, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6806, '491', 'Mlunduzi', 85, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6807, '3941', 'Mlungui', 52, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6808, '3811', 'Mmale', 131, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6809, '1450', 'Mnacho', 106, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6810, '1149', 'Mnadani', 17, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6811, '403', 'Mnadani', 15, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6812, '528', 'Mnadani', 15, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6813, '2998', 'Mnamba', 28, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6814, '2479', 'Mnanje', 95, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6815, '1352', 'Mnara', 57, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6816, '1481', 'Mnara', 57, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6817, '2390', 'Mnavira', 67, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6818, '3983', 'Mnazi', 60, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6819, '1353', 'Mnazimmoja', 57, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6820, '1482', 'Mnazimmoja', 57, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6821, '2547', 'Mndumbwe', 120, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6822, '2507', 'Mnekachi', 96, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6823, '438', 'Mnenia', 50, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6824, '1417', 'Mnero Miembeni', 93, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6825, '1418', 'Mnero Ngongo', 93, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6826, '3984', 'Mng\'aro', 60, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6827, '2232', 'Mngazi', 82, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6828, '2343', 'Mngazi', 82, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6829, '2128', 'Mngeta', 43, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6830, '2439', 'Mnima', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6831, '2582', 'Mnima', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6832, '643', 'Mninga', 87, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6833, '3064', 'Mnokola', 118, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6834, '1354', 'Mnolela', 57, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6835, '1483', 'Mnolela', 57, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6836, '2440', 'Mnongodi', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6837, '2583', 'Mnongodi', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6838, '950', 'Mnyagala', 122, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6839, '213', 'Mnyamani', 22, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6840, '2508', 'Mnyambe', 96, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6841, '4087', 'Mnyanjani', 121, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6842, '4114', 'Mnyanjani', 121, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6843, '2548', 'Mnyawa', 120, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6844, '4016', 'Mnyenzani', 77, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6845, '2509', 'Mnyeu', 96, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6846, '3942', 'Mnyuzi', 52, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6847, '4017', 'Moa', 77, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6848, '2129', 'Mofu', 43, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6849, '1575', 'Mogitu', 18, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6850, '3700', 'Mogwa', 102, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6851, '2977', 'Mohoro', 107, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6852, '123', 'Moita', 81, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6853, '63', 'Moivaro', 2, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6854, '168', 'Moivaro', 2, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6855, '28', 'Moivo', 1, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6856, '3736', 'Mole', 114, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6857, '3065', 'Mollo', 118, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6858, '2441', 'Moma', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6859, '2584', 'Moma', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6860, '4156', 'Mombasa', 63, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6861, '3943', 'Mombo', 52, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6862, '3066', 'Momoka', 118, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6863, '2710', 'Mondo', 74, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6864, '3288', 'Mondo', 26, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6865, '3326', 'Mondo', 48, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6866, '365', 'Mondo', 13, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6867, '124', 'Monduli Juu', 81, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6868, '125', 'Monduli Mjini', 81, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6869, '2363', 'MOROGORO', 82, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6870, '1787', 'Morotonga', 111, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6871, '64', 'Moshono', 2, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6872, '169', 'Moshono', 2, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6873, '1788', 'Mosongo', 111, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6874, '1243', 'Motamburu Kitendeni', 104, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6875, '304', 'Mpalanga', 5, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6876, '3944', 'Mpale', 52, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6877, '305', 'Mpamantwa', 5, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6878, '3524', 'Mpambala', 76, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6879, '929', 'Mpanda Hotel', 84, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6880, '951', 'Mpanda Ndogo', 122, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6881, '3199', 'Mpandangindo', 117, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6882, '644', 'Mpanga TAZARA', 87, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6883, '2391', 'Mpanyani', 67, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6884, '3119', 'Mpapa', 70, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6885, '4048', 'Mpapayu', 88, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6886, '2442', 'Mpapura', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6887, '2585', 'Mpapura', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6888, '2007', 'Mpata', 108, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6889, '3764', 'Mpela', 119, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6890, '3841', 'Mpela', 119, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6891, '4170', 'Mpendae', 75, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6892, '366', 'Mpendo', 13, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6893, '3120', 'Mpepai', 70, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6894, '3166', 'Mpepo', 101, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6895, '2392', 'Mpeta', 67, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6896, '1397', 'Mpigamiti', 58, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6897, '2393', 'Mpindimbi', 67, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6898, '306', 'Mpinga', 5, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6899, '1271', 'Mpinji', 109, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6900, '1419', 'Mpiruka', 93, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6901, '3200', 'Mpitimbi', 117, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6902, '2008', 'Mpombo', 108, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6903, '2999', 'Mpombwe', 28, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6904, '3737', 'Mpombwe', 114, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6905, '3985', 'Mponde', 60, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6906, '2009', 'Mpuguso', 108, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6907, '3067', 'Mpui', 118, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6908, '404', 'Mpunguzi', 15, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6909, '529', 'Mpunguzi', 15, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6910, '3289', 'Mpunze', 26, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6911, '3145', 'Mputa', 94, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6912, '2510', 'Mpwapwa', 96, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6913, '3068', 'Mpwapwa', 118, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6914, '492', 'Mpwapwa Mjini', 85, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6915, '338', 'Mpwayungu', 12, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6916, '3550', 'Mrama', 116, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6917, '3589', 'Mrama', 116, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6918, '1244', 'Mrao Keryo', 104, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6919, '367', 'Mrijo', 13, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6920, '368', 'Msaada', 13, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6921, '2914', 'Msala', 37, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6922, '405', 'Msalato', 15, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6923, '530', 'Msalato', 15, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6924, '3201', 'Msamala', 117, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6925, '339', 'Msamalo', 12, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6926, '1006', 'Msambara', 34, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6927, '4088', 'Msambweni', 121, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6928, '4115', 'Msambweni', 121, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6929, '3069', 'Msandamuungano', 118, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6930, '2932', 'Msanga', 47, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6931, '340', 'Msanga', 12, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6932, '2443', 'Msangamkuu', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6933, '2586', 'Msangamkuu', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6934, '2892', 'Msangani', 36, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6935, '3551', 'Msange', 116, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6936, '3590', 'Msange', 116, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6937, '1220', 'Msangeni', 92, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6938, '3902', 'Msanja', 41, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6939, '3000', 'Msanzi', 28, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6940, '1190', 'Msaranga', 83, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6941, '3883', 'Msasa', 19, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6942, '248', 'Msasani', 46, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6943, '2010', 'Msasani', 108, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6944, '2867', 'Msata', 4, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6945, '583', 'Mseke', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6946, '689', 'Mseke', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6947, '3202', 'Mshangano', 117, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6948, '1272', 'Mshewa', 109, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6949, '1954', 'Mshewe', 69, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6950, '2060', 'Mshewe', 69, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6951, '1728', 'Mshikamano', 90, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6952, '584', 'Mshindo', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6953, '690', 'Mshindo', 25, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6954, '287', 'Msigani', 126, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6955, '2394', 'Msikisi', 67, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6956, '2444', 'Msimbati', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6957, '2587', 'Msimbati', 86, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6958, '2933', 'Msimbu', 47, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6959, '3146', 'Msindo', 94, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6960, '1273', 'Msindo', 109, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6961, '3525', 'Msingi', 76, '2024-09-21 20:20:10', '2024-09-21 20:20:10'),
(6962, '2099', 'Msingisi', 16, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6963, '1355', 'Msinjahili', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6964, '1484', 'Msinjahili', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6965, '3552', 'Msisi', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6966, '3591', 'Msisi', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6967, '307', 'Msisi', 5, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6968, '3147', 'Msisima', 94, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6969, '1648', 'Msitu wa Tembo', 115, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6970, '2868', 'Msoga', 4, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6971, '2292', 'Msogezi', 128, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6972, '2130', 'Msolwa Station', 43, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6973, '2959', 'Msonga', 79, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6974, '214', 'Msongola', 22, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6975, '2269', 'Msongozi', 91, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6976, '2166', 'Msowero', 44, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6977, '3070', 'Msua', 118, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6978, '2813', 'Msuka', 72, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6979, '3945', 'Mswaha', 52, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6980, '126', 'Mswakini', 81, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6981, '3986', 'Mtae', 60, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6982, '1356', 'Mtama', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6983, '1485', 'Mtama', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6984, '3553', 'Mtamaa', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6985, '3592', 'Mtamaa', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6986, '2893', 'Mtambani', 36, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6987, '2845', 'Mtambile', 78, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6988, '645', 'Mtambula', 87, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6989, '2824', 'Mtambwe', 132, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6990, '457', 'Mtanana', 51, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6991, '1357', 'Mtanda', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6992, '1486', 'Mtanda', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6993, '2395', 'Mtandi', 67, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6994, '1853', 'Mtanila', 14, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6995, '930', 'Mtapenda', 84, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6996, '2445', 'Mtawanya', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6997, '2588', 'Mtawanya', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6998, '2915', 'Mtawanya', 37, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(6999, '1089', 'Mtegowanoti', 130, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7000, '3472', 'Mtekente', 24, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7001, '3765', 'Mtendeni', 119, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7002, '3842', 'Mtendeni', 119, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7003, '3024', 'Mtenga', 99, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7004, '493', 'Mtera', 85, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7005, '2270', 'Mtibwa', 91, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7006, '1274', 'Mtii', 109, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7007, '2183', 'Mtimbira', 65, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7008, '4018', 'Mtimbwani', 77, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7009, '2446', 'Mtimbwilimbwi', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7010, '2589', 'Mtimbwilimbwi', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7011, '3238', 'Mtina', 125, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7012, '4049', 'Mtindiro', 88, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7013, '2447', 'Mtiniko', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7014, '2590', 'Mtiniko', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7015, '3554', 'Mtinko', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7016, '3593', 'Mtinko', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7017, '3555', 'Mtipa', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7018, '3594', 'Mtipa', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7019, '3167', 'Mtipwili', 101, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7020, '308', 'Mtitaa', 5, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7021, '607', 'Mtitu', 42, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7022, '127', 'Mto wa Mbu', 81, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7023, '3473', 'Mtoa', 24, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7024, '4139', 'Mtofaani', 62, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7025, '2344', 'Mtombozi', 82, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7026, '2233', 'Mtombozi', 82, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7027, '3946', 'Mtonga', 52, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7028, '2894', 'Mtongani', 36, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7029, '271', 'Mtoni', 124, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7030, '4140', 'Mtoni', 62, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7031, '2448', 'Mtonya', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7032, '2511', 'Mtonya', 96, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7033, '2591', 'Mtonya', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7034, '2512', 'Mtopwa', 96, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7035, '3071', 'Mtowisa', 118, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7036, '1358', 'Mtua', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7037, '1420', 'Mtua', 93, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7038, '1487', 'Mtua', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7039, '2513', 'Mtumachi', 96, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7040, '406', 'Mtumba', 15, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7041, '531', 'Mtumba', 15, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7042, '2167', 'Mtumbatu', 44, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7043, '1359', 'Mtumbya', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7044, '1488', 'Mtumbya', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7045, '2916', 'Mtunda', 37, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7046, '3454', 'Mtunduru', 21, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7047, '3630', 'Mtunguru', 20, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7048, '2514', 'Mtunguru', 96, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7049, '646', 'Mtwango', 87, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7050, '2615', 'MTWARA', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7051, '585', 'Mtwivila', 25, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7052, '691', 'Mtwivila', 25, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7053, '3203', 'Mtyangimbole', 117, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7054, '966', 'Mubanga', 7, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7055, '863', 'Mubunda', 89, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7056, '3556', 'Mudida', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7057, '3595', 'Mudida', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7058, '754', 'Mugajwale', 8, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7059, '1729', 'Mugango', 90, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7060, '885', 'Muganza', 97, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7061, '1007', 'Muganza', 34, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7062, '967', 'Mugera', 7, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7063, '1677', 'Mugeta', 9, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7064, '3557', 'Mughamo', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7065, '3596', 'Mughamo', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7066, '3558', 'Mughanga', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7067, '3597', 'Mughanga', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7068, '3559', 'Mughunga', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7069, '3598', 'Mughunga', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7070, '886', 'Mugoma', 97, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7071, '1789', 'Mugumu', 111, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7072, '984', 'Mugunzu', 27, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7073, '3504', 'Muhalala', 66, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7074, '985', 'Muhange', 27, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7075, '968', 'Muhinda', 7, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7076, '3455', 'Muhintiri', 21, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7077, '3701', 'Muhugi', 102, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7078, '3204', 'Muhukuru', 117, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7079, '1008', 'Muhunga', 34, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7080, '864', 'Muhutwe', 89, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7081, '3239', 'Muhuwesi', 125, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7082, '1039', 'Mukabuye', 38, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7083, '1730', 'Mukendo', 90, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7084, '2796', 'Mukituntu', 127, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7085, '3474', 'Mukulu', 24, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7086, '1576', 'Mulbadaw', 18, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7087, '865', 'Muleba', 89, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7088, '2396', 'Mumbaka', 67, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7089, '969', 'Munanila', 7, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7090, '104', 'Mundarara', 59, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7091, '309', 'Mundemu', 5, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7092, '4141', 'Munduli', 62, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7093, '3456', 'Mungaa', 21, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7094, '1068', 'Mungonya', 40, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7095, '1119', 'Mungonya', 40, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7096, '3560', 'Mungumaji', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7097, '3599', 'Mungumaji', 116, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7098, '970', 'Munyegera', 7, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7099, '971', 'Munzeze', 7, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7100, '1731', 'Murangi', 90, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7101, '1705', 'Muriaza', 10, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7102, '1819', 'Muriba', 123, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7103, '65', 'Muriet', 2, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7104, '170', 'Muriet', 2, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7105, '2797', 'Muriti', 127, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7106, '803', 'Murongo', 56, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7107, '1629', 'Murray', 71, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7108, '1009', 'Murubona', 34, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7109, '1010', 'Murufiti', 34, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7110, '887', 'Murukurazo', 97, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7111, '1040', 'Murungu', 38, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7112, '888', 'Murusagamba', 97, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7113, '1011', 'Murusi', 34, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7114, '2798', 'Murutunguru', 127, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7115, '29', 'Musa', 1, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7116, '1732', 'Musanja', 90, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7117, '866', 'Mushabago', 89, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7118, '827', 'Mushasha', 73, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7119, '1536', 'Mutuka', 3, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7120, '828', 'Mutukula', 73, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7121, '341', 'Muungano', 12, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7122, '1150', 'Muungano', 17, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7123, '1878', 'Muungano', 55, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7124, '2449', 'Muungano', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7125, '2515', 'Muungano', 96, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7126, '2592', 'Muungano', 86, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7127, '3121', 'Muungano', 70, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7128, '3780', 'Muungano', 129, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7129, '4171', 'Muungano', 75, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7130, '972', 'Muyama', 7, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7131, '4208', 'Muyuni', 53, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7132, '3072', 'Muze', 118, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7133, '1012', 'Muzye', 34, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7134, '2271', 'Mvomero', 91, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7135, '2345', 'Mvuha', 82, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7136, '2234', 'Mvuha', 82, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7137, '1360', 'Mvuleni', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7138, '1489', 'Mvuleni', 57, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7139, '2168', 'Mvumi', 44, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7140, '342', 'Mvumi Makulu', 12, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7141, '343', 'Mvumi Misheni', 12, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7142, '3903', 'Mvungwe', 41, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7143, '2767', 'Mwabaluhi', 110, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7144, '2649', 'Mwabomba', 54, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7145, '1537', 'Mwada', 3, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7146, '3073', 'Mwadui', 118, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7147, '3327', 'Mwadui Lohumbo', 48, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7148, '2650', 'Mwagi', 54, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7149, '3702', 'Mwakashanhala', 102, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7150, '3290', 'Mwakata', 26, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7151, '1955', 'Mwakibete', 69, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7152, '2061', 'Mwakibete', 69, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7153, '4019', 'Mwakijembe', 77, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7154, '2651', 'Mwakilyambiti', 54, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7155, '3328', 'Mwakipoya', 48, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7156, '3364', 'Mwakitolyo', 112, '2024-09-21 20:20:11', '2024-09-21 20:20:11'),
(7157, '3407', 'Mwakitolyo', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7158, '1090', 'Mwakizega', 130, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7159, '3291', 'Mwalugulu', 26, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7160, '3365', 'Mwalukwa', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7161, '3408', 'Mwalukwa', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7162, '2682', 'Mwamabanza', 64, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7163, '3505', 'Mwamagembe', 66, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7164, '3631', 'Mwamakona', 20, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7165, '3409', 'Mwamala', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7166, '3632', 'Mwamala', 20, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7167, '3703', 'Mwamala', 102, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7168, '2652', 'Mwamala', 54, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7169, '3366', 'Mwamala', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7170, '3329', 'Mwamalasa', 48, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7171, '3367', 'Mwamalili', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7172, '3410', 'Mwamalili', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7173, '2683', 'Mwamanga', 64, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7174, '908', 'Mwamapuli', 80, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7175, '3330', 'Mwamashele', 48, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7176, '3633', 'Mwamashiga', 20, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7177, '3634', 'Mwamashimba', 20, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7178, '2917', 'Mwambao', 37, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7179, '2846', 'Mwambe', 78, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7180, '1069', 'Mwamgongo', 40, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7181, '1120', 'Mwamgongo', 40, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7182, '931', 'Mwamkulu', 84, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7183, '4157', 'Mwanakwerekwe', 63, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7184, '249', 'Mwananyamala', 46, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7185, '3292', 'Mwanase', 26, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7186, '3293', 'Mwandakulima', 26, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7187, '2960', 'Mwandege', 79, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7188, '30', 'Mwandet', 1, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7189, '1070', 'Mwandiga', 40, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7190, '1121', 'Mwandiga', 40, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7191, '2653', 'Mwandu', 54, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7192, '2654', 'Mwang\'halanga', 54, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7193, '1221', 'Mwanga', 92, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7194, '3526', 'Mwanga', 76, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7195, '1071', 'Mwanga Kaskazini', 40, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7196, '1122', 'Mwanga Kaskazini', 40, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7197, '1072', 'Mwanga Kusini', 40, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7198, '1123', 'Mwanga Kusini', 40, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7199, '1879', 'Mwanganyanga', 55, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7200, '586', 'Mwangata', 25, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7201, '692', 'Mwangata', 25, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7202, '3527', 'Mwangeza', 76, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7203, '3987', 'Mwangoi', 60, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7204, '3704', 'Mwangoye', 102, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7205, '2711', 'Mwaniko', 74, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7206, '1222', 'Mwaniko', 92, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7207, '3561', 'Mwankoko', 116, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7208, '3600', 'Mwankoko', 116, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7209, '2655', 'Mwankulwe', 54, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7210, '3368', 'Mwantini', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7211, '3411', 'Mwantini', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7212, '3705', 'Mwantundu', 102, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7213, '4142', 'Mwanyanya', 62, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7214, '2808', 'MWANZA', 100, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7215, '2807', 'Mwanza CC', 100, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7216, '4089', 'Mwanzange', 121, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7217, '4116', 'Mwanzange', 121, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7218, '3706', 'Mwanzoli', 102, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7219, '3457', 'Mwaru', 21, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7220, '2961', 'Mwarusembe', 79, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7221, '3707', 'Mwasala', 102, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7222, '1956', 'Mwasanga', 69, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7223, '2062', 'Mwasanga', 69, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7224, '3562', 'Mwasauya', 116, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7225, '3601', 'Mwasauya', 116, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7226, '2978', 'Mwaseni', 107, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7227, '1957', 'Mwasenkwa', 69, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7228, '2063', 'Mwasenkwa', 69, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7229, '3635', 'Mwashikumbili', 20, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7230, '3331', 'Mwasubi', 48, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7231, '3332', 'Mwataga', 48, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7232, '1905', 'Mwatenga', 68, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7233, '3412', 'Mwawaza', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7234, '3369', 'Mwawaza', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7235, '3333', 'Mwaweja', 48, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7236, '2293', 'Mwaya', 128, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7237, '1880', 'Mwaya', 55, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7238, '2131', 'Mwaya', 43, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7239, '973', 'Mwayaya', 7, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7240, '3001', 'Mwazye', 28, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7241, '1820', 'Mwema', 123, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7242, '1275', 'Mwembe', 109, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7243, '4172', 'Mwembe Makumbi', 75, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7244, '2346', 'Mwembesongo', 82, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7245, '2235', 'Mwembesongo', 82, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7246, '2397', 'Mwena', 67, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7247, '3370', 'Mwenge', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7248, '3413', 'Mwenge', 112, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7249, '1361', 'Mwenge', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7250, '1490', 'Mwenge', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7251, '2398', 'Mwenge Mtapika', 67, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7252, '3205', 'Mwengemshindo', 117, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7253, '4068', 'Mwera', 103, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7254, '4143', 'Mwera', 62, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7255, '952', 'Mwese', 122, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7256, '1733', 'Mwigobero', 90, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7257, '1191', 'Mwika Kaskazini', 83, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7258, '1192', 'Mwika Kusini', 83, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7259, '1013', 'Mwilavya', 34, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7260, '3002', 'Mwimbi', 28, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7261, '3766', 'Mwinyi', 119, '2024-09-21 20:20:12', '2024-09-21 20:20:12');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(7262, '3843', 'Mwinyi', 119, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7263, '1734', 'Mwisenge', 90, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7264, '3636', 'Mwisi', 20, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7265, '310', 'Mwitikira', 5, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7266, '3664', 'Mwongozo', 29, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7267, '1276', 'Myamba', 109, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7268, '3122', 'Myangayanga', 70, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7269, '3025', 'Myula', 99, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7270, '2934', 'Mzenga', 47, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7271, '2272', 'Mziha', 91, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7272, '250', 'Mzimuni', 46, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7273, '215', 'Mzinga', 22, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7274, '2236', 'Mzinga', 82, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7275, '2347', 'Mzinga', 82, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7276, '4090', 'Mzingani', 121, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7277, '4117', 'Mzingani', 121, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7278, '4091', 'Mzizima', 121, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7279, '4118', 'Mzizima', 121, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7280, '2273', 'Mzumbe', 91, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7281, '128', 'Naalarami', 81, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7282, '1649', 'Naberera', 115, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7283, '1362', 'Nachingwea', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7284, '1451', 'Nachingwea', 106, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7285, '1491', 'Nachingwea', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7286, '1421', 'Nachingwea Mjini', 93, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7287, '1363', 'Nachunyu', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7288, '1492', 'Nachunyu', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7289, '1790', 'Nagusi', 111, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7290, '1630', 'Nahasey', 71, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7291, '1364', 'Nahukahuka', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7292, '1493', 'Nahukahuka', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7293, '144', 'Nainokanoka', 98, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7294, '1422', 'Naipanga', 93, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7295, '1423', 'Naipingo', 93, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7296, '1650', 'Naisinyai', 115, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7297, '145', 'Naiyobi', 98, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7298, '2516', 'Nakahako', 96, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7299, '3240', 'Nakapanya', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7300, '2799', 'Nakatunguru', 127, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7301, '3241', 'Nakayaya', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7302, '407', 'Nala', 15, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7303, '532', 'Nala', 15, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7304, '3242', 'Nalasi Magharibi', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7305, '3243', 'Nalasi Mashariki', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7306, '2450', 'Naliendele', 86, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7307, '2593', 'Naliendele', 86, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7308, '2451', 'Nalingu', 86, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7309, '2594', 'Nalingu', 86, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7310, '3148', 'Namabengo', 94, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7311, '2800', 'Namagondo', 127, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7312, '2399', 'Namajani', 67, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7313, '3244', 'Namakambale', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7314, '2400', 'Namalenga', 67, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7315, '105', 'Namanga', 59, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7316, '1365', 'Namangale', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7317, '1494', 'Namangale', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7318, '3026', 'Namanyere', 99, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7319, '1424', 'Namapwia', 93, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7320, '3245', 'Namasakata', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7321, '1425', 'Namatula', 93, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7322, '2401', 'Namatutwe', 67, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7323, '1323', 'Namayuni', 45, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7324, '2549', 'Nambahu', 120, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7325, '2517', 'Nambali', 96, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7326, '1426', 'Nambambo', 93, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7327, '1452', 'Nambilanje', 106, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7328, '1631', 'Nambis', 71, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7329, '1596', 'Namelock', 49, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7330, '1678', 'Namhula', 9, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7331, '1453', 'Namichiga', 106, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7332, '1427', 'Namikango', 93, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7333, '2550', 'Namikupa', 120, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7334, '2801', 'Namilembe', 127, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7335, '3246', 'Namiungo', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7336, '2518', 'Namiyonga', 96, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7337, '1679', 'Nampindi', 9, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7338, '3247', 'Nampungu', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7339, '3123', 'Namswea', 70, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7340, '3149', 'Namtumbo', 94, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7341, '2452', 'Namtumbuka', 86, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7342, '2595', 'Namtumbuka', 86, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7343, '1366', 'Namupa', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7344, '1495', 'Namupa', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7345, '2402', 'Namwanga', 67, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7346, '2132', 'Namwawala', 43, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7347, '3248', 'Namwinyu', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7348, '1454', 'Nandagala', 106, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7349, '3249', 'Nandembo', 125, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7350, '2480', 'Nandete', 95, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7351, '2519', 'Nandwahi', 96, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7352, '1428', 'Nang\'ondo', 93, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7353, '3637', 'Nanga', 20, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7354, '1398', 'Nangando', 58, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7355, '1455', 'Nanganga', 106, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7356, '2403', 'Nanganga', 67, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7357, '1399', 'Nangano', 58, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7358, '1538', 'Nangara', 3, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7359, '1367', 'Nangaru', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7360, '1496', 'Nangaru', 57, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7361, '2481', 'Nangomba', 95, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7362, '2404', 'Nangoo', 67, '2024-09-21 20:20:12', '2024-09-21 20:20:12'),
(7363, '1429', 'Nangowe', 93, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7364, '2453', 'Nanguruwe', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7365, '2520', 'Nanguruwe', 96, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7366, '2596', 'Nanguruwe', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7367, '1577', 'Nangwa', 18, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7368, '2521', 'Nangwala', 96, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7369, '2551', 'Nanhyanga', 120, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7370, '1245', 'Nanjara', 104, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7371, '1324', 'Nanjirinji', 45, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7372, '3250', 'Nanjoka', 125, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7373, '2405', 'Nanjota', 67, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7374, '3074', 'Nankanga', 118, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7375, '1680', 'Nansimo', 9, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7376, '2802', 'Nansio', 127, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7377, '2454', 'Nanyamba', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7378, '2597', 'Nanyamba', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7379, '2482', 'Nanyumbu', 95, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7380, '2483', 'Napacho', 95, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7381, '2406', 'Napupa', 67, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7382, '2552', 'Naputa', 120, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7383, '1539', 'Nar', 3, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7384, '1456', 'Narungombe', 106, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7385, '1298', 'Nasai', 113, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7386, '3708', 'Nata', 102, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7387, '1791', 'Natta', 111, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7388, '2455', 'Naumbu', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7389, '2598', 'Naumbu', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7390, '1368', 'Navanga', 57, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7391, '1497', 'Navanga', 57, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7392, '2294', 'Nawenge', 128, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7393, '3475', 'Ndago', 24, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7394, '2834', 'Ndagoni', 11, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7395, '2944', 'Ndagoni', 61, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7396, '3371', 'Ndala', 112, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7397, '3414', 'Ndala', 112, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7398, '3709', 'Ndala', 102, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7399, '778', 'Ndama', 30, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7400, '2407', 'Ndanda', 67, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7401, '1881', 'Ndandalo', 55, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7402, '2011', 'Ndanto', 108, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7403, '1597', 'Ndedo', 49, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7404, '3372', 'Ndembezi', 112, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7405, '3415', 'Ndembezi', 112, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7406, '3638', 'Ndembezi', 20, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7407, '3767', 'Ndevelwa', 119, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7408, '3844', 'Ndevelwa', 119, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7409, '3206', 'Ndilimalitembo', 117, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7410, '1598', 'Ndirgishi', 49, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7411, '1430', 'Nditi', 93, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7412, '1882', 'Ndobo', 55, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7413, '3334', 'Ndoleleji', 48, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7414, '3884', 'Ndolwa', 19, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7415, '1431', 'Ndomoni', 93, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7416, '3207', 'Ndongosi', 117, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7417, '3812', 'Ndono', 131, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7418, '1369', 'Ndoro', 57, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7419, '1498', 'Ndoro', 57, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7420, '251', 'Ndugumbi', 46, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7421, '3528', 'Nduguti', 76, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7422, '587', 'Nduli', 25, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7423, '693', 'Nduli', 25, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7424, '3476', 'Ndulungu', 24, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7425, '2456', 'Ndumbwe', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7426, '2599', 'Ndumbwe', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7427, '1299', 'Ndumeti', 113, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7428, '1277', 'Ndungu', 109, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7429, '2803', 'Nduruma', 127, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7430, '31', 'Nduruma', 1, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7431, '3904', 'Negero', 41, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7432, '711', 'Nemba', 6, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7433, '1681', 'Neruma', 9, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7434, '1193', 'Ng\'ambo', 83, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7435, '3768', 'Ng\'ambo', 119, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7436, '3845', 'Ng\'ambo', 119, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7437, '608', 'Ng\'ang\'ange', 42, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7438, '1370', 'Ng\'apa', 57, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7439, '1499', 'Ng\'apa', 57, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7440, '494', 'Ng\'hambi', 85, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7441, '2684', 'Ng\'haya', 64, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7442, '458', 'Ng\'humbi', 51, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7443, '2656', 'Ng\'hundi', 54, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7444, '609', 'Ng\'uruhe', 42, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7445, '32', 'Ngabobo', 1, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7446, '4092', 'Ngamiani Kaskazini', 121, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7447, '4119', 'Ngamiani Kaskazini', 121, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7448, '4093', 'Ngamiani Kati', 121, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7449, '4120', 'Ngamiani Kati', 121, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7450, '4094', 'Ngamiani Kusini', 121, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7451, '4121', 'Ngamiani Kusini', 121, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7452, '1883', 'Ngana', 55, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7453, '3251', 'Ngapa', 125, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7454, '889', 'Ngara Mjini', 97, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7455, '2979', 'Ngarambe', 107, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7456, '1300', 'Ngarenairobi', 113, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7457, '33', 'Ngarenanyuki', 1, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7458, '66', 'Ngarenaro', 2, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7459, '171', 'Ngarenaro', 2, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7460, '3294', 'Ngaya', 26, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7461, '867', 'Ngenge', 89, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7462, '2237', 'Ngerengere', 82, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7463, '2348', 'Ngerengere', 82, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7464, '344', 'Nghahelezi', 12, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7465, '345', 'Nghambaku', 12, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7466, '408', 'Nghong\'onha', 15, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7467, '533', 'Nghong\'onha', 15, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7468, '3124', 'Ngima', 70, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7469, '3563', 'Ngimu', 116, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7470, '3602', 'Ngimu', 116, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7471, '3335', 'Ngofila', 48, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7472, '3295', 'Ngogwa', 26, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7473, '2184', 'Ngoheranga', 65, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7474, '146', 'Ngoile', 98, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7475, '3416', 'Ngokolo', 112, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7476, '3373', 'Ngokolo', 112, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7477, '2768', 'Ngoma', 110, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7478, '2804', 'Ngoma', 127, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7479, '459', 'Ngomai', 51, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7480, '4050', 'Ngomeni', 88, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7481, '1884', 'Ngonga', 55, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7482, '1400', 'Ngongowele', 58, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7483, '1651', 'Ngorika', 115, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7484, '2980', 'Ngorongo', 107, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7485, '147', 'Ngorongoro', 98, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7486, '1246', 'Ngoyoni', 104, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7487, '3738', 'Ngoywa', 114, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7488, '2657', 'Ngudu', 54, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7489, '1223', 'Ngujini', 92, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7490, '2658', 'Ngulla', 54, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7491, '3639', 'Ngulu', 20, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7492, '3988', 'Ngulwi', 60, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7493, '3168', 'Ngumbo', 101, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7494, '1432', 'Ngunichile', 93, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7495, '2553', 'Ngunja', 120, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7496, '1091', 'Nguruka', 130, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7497, '4095', 'Nguvumali', 121, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7498, '4122', 'Nguvumali', 121, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7499, '3640', 'Nguvumoja', 20, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7500, '2847', 'Ngwachani', 78, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7501, '3989', 'Ngwelo', 60, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7502, '346', 'Nhinhi', 12, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7503, '2712', 'Nhundulu', 74, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7504, '3665', 'Nhwande', 29, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7505, '2869', 'Nia Njema', 4, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7506, '3027', 'Ninde', 99, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7507, '2457', 'Nitekela', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7508, '2600', 'Nitekela', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7509, '2458', 'Njengwa', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7510, '2601', 'Njengwa', 86, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7511, '1194', 'Njia Panda', 83, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7512, '2962', 'Njianne', 79, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7513, '1325', 'Njinjo', 45, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7514, '1885', 'Njisi', 55, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7515, '2185', 'Njiwa', 65, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7516, '460', 'Njoge', 51, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7517, '1195', 'Njoro', 83, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7518, '1278', 'Njoro', 109, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7519, '1599', 'Njoro', 49, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7520, '1540', 'Nkaiti', 3, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7521, '3529', 'Nkalakala', 76, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7522, '2659', 'Nkalalo', 54, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7523, '3028', 'Nkandasi', 99, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7524, '1821', 'Nkende', 123, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7525, '2805', 'Nkilizya', 127, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7526, '3641', 'Nkinga', 20, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7527, '3710', 'Nkiniziwa', 102, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7528, '3530', 'Nkinto', 76, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7529, '34', 'Nkoanekoli', 1, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7530, '35', 'Nkoanrua', 1, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7531, '36', 'Nkoaranga', 1, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7532, '37', 'Nkoarisambu', 1, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7533, '1886', 'Nkokwa', 55, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7534, '3029', 'Nkomolo', 99, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7535, '3990', 'Nkongoi', 60, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7536, '3506', 'Nkonko', 66, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7537, '1457', 'Nkowe', 106, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7538, '409', 'Nkuhungu', 15, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7539, '534', 'Nkuhungu', 15, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7540, '4051', 'Nkumba', 88, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7541, '2012', 'Nkunga', 108, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7542, '2685', 'Nkungulu', 64, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7543, '1854', 'Nkungungu', 14, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7544, '1073', 'Nkungwe', 40, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7545, '1124', 'Nkungwe', 40, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7546, '1887', 'Nkuyu', 55, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7547, '804', 'Nkwenda', 56, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7548, '1958', 'Nonde', 69, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7549, '2064', 'Nonde', 69, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7550, '311', 'Nondwa', 5, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7551, '2100', 'Nongwe', 16, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7552, '106', 'Noondoto', 59, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7553, '1959', 'Nsalaga', 69, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7554, '2065', 'Nsalaga', 69, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7555, '1960', 'Nsalala', 69, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7556, '2066', 'Nsalala', 69, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7557, '3374', 'Nsalala', 112, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7558, '3417', 'Nsalala', 112, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7559, '932', 'Nsemulwa', 84, '2024-09-21 20:20:13', '2024-09-21 20:20:13'),
(7560, '3781', 'Nsenda', 129, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7561, '909', 'Nsenkwa', 80, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7562, '868', 'Nshamba', 89, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7563, '755', 'Nshambya', 8, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7564, '933', 'Nsimbo', 84, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7565, '3813', 'Nsimbo', 131, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7566, '1961', 'Nsoho', 69, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7567, '2067', 'Nsoho', 69, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7568, '3814', 'Nsololo', 131, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7569, '829', 'Nsunga', 73, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7570, '2013', 'Ntaba', 108, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7571, '3769', 'Ntalikwa', 119, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7572, '3846', 'Ntalikwa', 119, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7573, '3030', 'Ntatumbila', 99, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7574, '3075', 'Ntendo', 118, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7575, '890', 'Ntobeye', 97, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7576, '3296', 'Ntobo', 26, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7577, '3642', 'Ntobo', 20, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7578, '3564', 'Ntonge', 116, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7579, '3603', 'Ntonge', 116, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7580, '3031', 'Ntuchi', 99, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7581, '3458', 'Ntuntu', 21, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7582, '3477', 'Ntwike', 24, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7583, '410', 'Ntyuka', 15, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7584, '535', 'Ntyuka', 15, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7585, '986', 'Nyabibuye', 27, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7586, '779', 'Nyabiyonza', 30, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7587, '1762', 'Nyaburongo', 105, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7588, '712', 'Nyabusozi', 6, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7589, '1014', 'Nyachenda', 34, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7590, '3297', 'Nyahanga', 26, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7591, '1763', 'Nyahongo', 105, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7592, '3739', 'Nyahua', 114, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7593, '780', 'Nyaishozi', 30, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7594, '781', 'Nyakabanga', 30, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7595, '869', 'Nyakabango', 89, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7596, '782', 'Nyakahanga', 30, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7597, '713', 'Nyakahura', 6, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7598, '783', 'Nyakakika', 30, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7599, '2769', 'Nyakaliro', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7600, '2770', 'Nyakasasa', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7601, '784', 'Nyakasimbi', 30, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7602, '2771', 'Nyakasungwa', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7603, '870', 'Nyakatanga', 89, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7604, '1735', 'Nyakatende', 90, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7605, '1736', 'Nyakato', 90, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7606, '756', 'Nyakato', 8, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7607, '2628', 'Nyakato', 23, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7608, '805', 'Nyakatuntu', 56, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7609, '757', 'Nyakibimbili', 8, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7610, '891', 'Nyakisasa', 97, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7611, '1015', 'Nyakitonto', 34, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7612, '1822', 'Nyakonga', 123, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7613, '610', 'Nyalumbu', 42, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7614, '2732', 'Nyamagana', 100, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7615, '1764', 'Nyamagaro', 105, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7616, '892', 'Nyamagoma', 97, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7617, '714', 'Nyamahanga', 6, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7618, '1682', 'Nyamakokoto', 9, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7619, '3375', 'Nyamalogo', 112, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7620, '3418', 'Nyamalogo', 112, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7621, '1683', 'Nyamang\'uta', 9, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7622, '2806', 'Nyamanga', 127, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7623, '2629', 'Nyamanoro', 23, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7624, '1737', 'Nyamatare', 90, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7625, '1792', 'Nyamatare', 111, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7626, '2963', 'Nyamato', 79, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7627, '2772', 'Nyamatongo', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7628, '2773', 'Nyamazugo', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7629, '2660', 'Nyambiti', 54, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7630, '1738', 'Nyambono', 90, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7631, '1793', 'Nyambureti', 111, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7632, '2630', 'Nyamhongolo', 23, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7633, '893', 'Nyamiaga', 97, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7634, '1016', 'Nyamidaho', 34, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7635, '715', 'Nyamigogo', 6, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7636, '1684', 'Nyamihyoro', 9, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7637, '2661', 'Nyamilama', 54, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7638, '3298', 'Nyamilangano', 26, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7639, '1706', 'Nyamimange', 10, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7640, '1823', 'Nyamisangura', 123, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7641, '2774', 'Nyamizeze', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7642, '1017', 'Nyamnyusi', 34, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7643, '1794', 'Nyamoko', 111, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7644, '2775', 'Nyampande', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7645, '2776', 'Nyampulukano', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7646, '1739', 'Nyamrandirira', 90, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7647, '1765', 'Nyamtinga', 105, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7648, '987', 'Nyamtukuza', 27, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7649, '974', 'Nyamugali', 7, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7650, '1766', 'Nyamunga', 105, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7651, '1685', 'Nyamuswa', 9, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7652, '1824', 'Nyamwaga', 123, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7653, '3643', 'Nyandekwa', 20, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7654, '3299', 'Nyandekwa', 26, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7655, '2274', 'Nyandira', 91, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7656, '1825', 'Nyandoto', 123, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7657, '588', 'Nyang\'oro', 25, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7658, '694', 'Nyang\'oro', 25, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7659, '758', 'Nyanga', 8, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7660, '1371', 'Nyangamara', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7661, '1500', 'Nyangamara', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7662, '1372', 'Nyangao', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7663, '1501', 'Nyangao', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7664, '2686', 'Nyanguge', 64, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7665, '1707', 'Nyankanga', 10, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7666, '3300', 'Nyankende', 26, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7667, '1018', 'Nyansha', 34, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7668, '1826', 'Nyansincha', 123, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7669, '1795', 'Nyansurura', 111, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7670, '716', 'Nyantakara', 6, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7671, '1827', 'Nyanungu', 123, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7672, '717', 'Nyanza', 6, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7673, '2777', 'Nyanzenda', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7674, '611', 'Nyanzwa', 42, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7675, '1828', 'Nyarero', 123, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7676, '1074', 'Nyarubanda', 40, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7677, '1125', 'Nyarubanda', 40, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7678, '718', 'Nyarubungo', 6, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7679, '1829', 'Nyarukoba', 123, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7680, '1041', 'Nyaruyoba', 38, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7681, '806', 'Nyaruzumbura', 56, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7682, '2408', 'Nyasa', 67, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7683, '2631', 'Nyasaka', 23, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7684, '1740', 'Nyasho', 90, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7685, '3301', 'Nyasubi', 26, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7686, '1686', 'Nyasura', 9, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7687, '1767', 'Nyathorogo', 105, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7688, '2778', 'Nyatukara', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7689, '1687', 'Nyatwali', 9, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7690, '2733', 'Nyegezi', 100, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7691, '1741', 'Nyegina', 90, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7692, '2779', 'Nyehunge', 110, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7693, '1373', 'Nyengedi', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7694, '1502', 'Nyengedi', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7695, '3376', 'Nyida', 112, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7696, '3419', 'Nyida', 112, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7697, '2687', 'Nyigogo', 64, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7698, '3302', 'Nyihogo', 26, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7699, '647', 'Nyololo', 87, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7700, '3125', 'Nyoni', 70, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7701, '1019', 'Nyumbigwa', 34, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7702, '2459', 'Nyundo', 86, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7703, '2602', 'Nyundo', 86, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7704, '3711', 'Nzega Mjini Magharibi', 102, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7705, '3712', 'Nzega Mjini Mashariki', 102, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7706, '3713', 'Nzega Ndogo', 102, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7707, '589', 'Nzihi', 25, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7708, '695', 'Nzihi', 25, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7709, '1962', 'Nzovwe', 69, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7710, '2068', 'Nzovwe', 69, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7711, '3815', 'Nzubuka', 131, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7712, '411', 'Nzuguni', 15, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7713, '536', 'Nzuguni', 15, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7714, '185', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Arusha', 2, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7715, '702', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Iringa', 25, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7716, '1134', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Kigoma', 40, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7717, '1512', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Lindi', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7718, '2083', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Mbeya', 69, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7719, '2362', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Morogoro', 82, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7720, '2613', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Mtwara', 86, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7721, '3433', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Shinyanga', 112, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7722, '3612', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Singida', 116, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7723, '3853', 'Ofisi ya Mkurugenzi Mtendaji wa Halmashauri ya Wilaya ya Tabora', 119, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7724, '184', 'Ofisi ya Mkurugenzi wa Halmashauri ya Jiji la Arusha', 2, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7725, '542', 'Ofisi ya Mkurugenzi wa Halmashauri ya Jiji la Dodoma', 15, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7726, '2082', 'Ofisi ya Mkurugenzi wa Halmashauri ya Jiji la Mbeya', 69, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7727, '4130', 'Ofisi ya Mkurugenzi wa Halmashauri ya Jiji la Tanga', 121, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7728, '701', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Iringa', 25, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7729, '1133', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Kigoma Ujiji', 40, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7730, '1511', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Lindi', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7731, '2360', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Morogoro', 82, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7732, '2614', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Mtwara Mikindani', 86, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7733, '3432', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Shinyanga', 112, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7734, '3613', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Singida', 116, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7735, '3851', 'Ofisi ya Mkurugenzi wa Halmashauri ya Manispaa ya Tabora', 119, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7736, '186', 'Ofisi ya Mkuu wa Mkoa wa Arusha', 2, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7737, '545', 'Ofisi ya Mkuu wa Mkoa wa Dodoma', 15, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7738, '699', 'Ofisi ya Mkuu wa Mkoa wa Iringa', 25, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7739, '896', 'Ofisi ya Mkuu wa Mkoa wa Kagera', 8, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7740, '2827', 'Ofisi ya Mkuu wa Mkoa wa Kaskazini Pemba', 132, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7741, '2828', 'Ofisi ya Mkuu wa Mkoa wa Kaskazini Pemba', 132, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7742, '4196', 'Ofisi ya Mkuu wa Mkoa wa Kaskazini Unguja', 32, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7743, '4197', 'Ofisi ya Mkuu wa Mkoa wa Kaskazini Unguja', 32, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7744, '955', 'Ofisi ya Mkuu wa Mkoa wa Katavi', 84, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7745, '1132', 'Ofisi ya Mkuu wa Mkoa wa Kigoma', 40, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7746, '1306', 'Ofisi ya Mkuu wa Mkoa wa Kilimanjaro', 83, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7747, '2848', 'Ofisi ya Mkuu wa Mkoa wa Kusini Pemba', 78, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7748, '2849', 'Ofisi ya Mkuu wa Mkoa wa Kusini Pemba', 78, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7749, '4210', 'Ofisi ya Mkuu wa Mkoa wa Kusini Unguja', 53, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7750, '4211', 'Ofisi ya Mkuu wa Mkoa wa Kusini Unguja', 53, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7751, '1510', 'Ofisi ya Mkuu wa Mkoa wa Lindi', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7752, '1657', 'Ofisi ya Mkuu wa Mkoa wa Manyara', 3, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7753, '1836', 'Ofisi ya Mkuu wa Mkoa wa Mara', 90, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7754, '2080', 'Ofisi ya Mkuu wa Mkoa wa Mbeya', 69, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7755, '4177', 'Ofisi ya Mkuu wa Mkoa wa Mjini Magharibi', 75, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7756, '4178', 'Ofisi ya Mkuu wa Mkoa wa Mjini Magharibi', 75, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7757, '2361', 'Ofisi ya Mkuu wa Mkoa wa Morogoro', 82, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7758, '2611', 'Ofisi ya Mkuu wa Mkoa wa Mtwara', 86, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7759, '2983', 'Ofisi ya Mkuu wa Mkoa wa Pwani', 36, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7760, '3081', 'Ofisi ya Mkuu wa Mkoa wa Rukwa', 118, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7761, '3430', 'Ofisi ya Mkuu wa Mkoa wa Shinyanga', 112, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7762, '3610', 'Ofisi ya Mkuu wa Mkoa wa Singida', 116, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7763, '3852', 'Ofisi ya Mkuu wa Mkoa wa Tabora', 119, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7764, '4131', 'Ofisi ya Mkuu wa Mkoa wa Tanga', 121, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7765, '187', 'Ofisi ya Mkuu wa Wilaya ya  Arusha', 2, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7766, '544', 'Ofisi ya Mkuu wa Wilaya ya  Dodoma', 15, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7767, '700', 'Ofisi ya Mkuu wa Wilaya ya  Iringa', 25, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7768, '1131', 'Ofisi ya Mkuu wa Wilaya ya  Kigoma', 40, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7769, '1513', 'Ofisi ya Mkuu wa Wilaya ya  Lindi', 57, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7770, '2081', 'Ofisi ya Mkuu wa Wilaya ya  Mbeya', 69, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7771, '2359', 'Ofisi ya Mkuu wa Wilaya ya  Morogoro', 82, '2024-09-21 20:20:14', '2024-09-21 20:20:14'),
(7772, '2612', 'Ofisi ya Mkuu wa Wilaya ya  Mtwara', 86, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7773, '3431', 'Ofisi ya Mkuu wa Wilaya ya Shinyanga', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7774, '3611', 'Ofisi ya Mkuu wa Wilaya ya Singida', 116, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7775, '3850', 'Ofisi ya Mkuu wa Wilaya ya Tabora', 119, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7776, '4129', 'Ofisi ya Mkuu wa Wilaya ya Tanga', 121, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7777, '543', 'Ofisi ya Rais Dodoma Mjini', 15, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7778, '67', 'Olasiti', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7779, '172', 'Olasiti', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7780, '148', 'Olbalbal', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7781, '1600', 'Olboloti', 49, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7782, '3478', 'Old Kiomboi', 24, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7783, '3947', 'Old Korogwe', 52, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7784, '1196', 'Old Moshi Magharibi', 83, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7785, '1197', 'Old Moshi Mashariki', 83, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7786, '3420', 'Old Shinyanga', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7787, '3429', 'Old Shinyanga', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7788, '3377', 'Old Shinyanga', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7789, '90', 'Oldeani', 31, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7790, '149', 'Oldonyo Sambu', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7791, '38', 'Oldonyosambu', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7792, '39', 'Oldonyowas', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7793, '2835', 'Ole', 11, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7794, '1247', 'Olele', 104, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7795, '40', 'Oljoro', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7796, '1652', 'Oljoro No.5', 115, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7797, '1301', 'Olkolili', 113, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7798, '107', 'Olmolog', 59, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7799, '68', 'Olmoti', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7800, '173', 'Olmoti', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7801, '41', 'Olmotonyi', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7802, '150', 'Oloipiri', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7803, '42', 'Oloirien', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7804, '69', 'Oloirien', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7805, '174', 'Oloirien', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7806, '151', 'Ololosokwan', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7807, '152', 'Olorien/Magaiduru', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7808, '43', 'Olturoto', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7809, '44', 'Olturumet', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7810, '108', 'Orbomba', 59, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7811, '153', 'Orgosorok', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7812, '1653', 'Orkesumet', 115, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7813, '1302', 'Ormelili', 113, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7814, '70', 'Osunyai Jr', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7815, '175', 'Osunyai Jr', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7816, '369', 'Ovada', 13, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7817, '3905', 'Pagwi', 41, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7818, '439', 'Pahi', 50, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7819, '4209', 'Paje', 53, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7820, '2734', 'Pamba', 100, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7821, '3378', 'Pandagichiza', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7822, '3421', 'Pandagichiza', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7823, '461', 'Pandambili', 51, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7824, '2825', 'Pandani', 132, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7825, '1326', 'Pande', 45, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7826, '4052', 'Pande Darajani', 88, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7827, '3740', 'Pangale', 114, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7828, '2895', 'Pangani', 36, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7829, '4069', 'Pangani Magharibi', 103, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7830, '4070', 'Pangani Mashariki', 103, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7831, '1374', 'Pangatena', 57, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7832, '1503', 'Pangatena', 57, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7833, '4158', 'Pangawe', 63, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7834, '2964', 'Panzuo', 79, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7835, '2169', 'Parakuyo', 44, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7836, '3032', 'Paramawe', 99, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7837, '370', 'Paranga', 13, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7838, '3208', 'Parangu', 117, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7839, '1601', 'Partimbo', 49, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7840, '4020', 'Parungu Kasera', 77, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7841, '2632', 'Pasiansi', 23, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7842, '1198', 'Pasua', 83, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7843, '1830', 'Pemba', 123, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7844, '2275', 'Pemba', 91, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7845, '230', 'Pembamnazi', 39, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7846, '2870', 'Pera', 4, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7847, '3209', 'Peramiho', 117, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7848, '2896', 'Picha ya Ndege', 36, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7849, '2826', 'Piki', 132, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7850, '154', 'Pinyinyi', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7851, '3076', 'Pito', 118, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7852, '155', 'Piyaya', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7853, '45', 'Poli', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7854, '4096', 'Pongwe', 121, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7855, '4123', 'Pongwe', 121, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7856, '4053', 'Potwe', 88, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7857, '3714', 'Puge', 102, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7858, '216', 'Pugu', 22, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7859, '217', 'Pugu Station', 22, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7860, '3459', 'Puma', 21, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7861, '3422', 'Puni', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7862, '3379', 'Puni', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7863, '495', 'Pwaga', 85, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7864, '1541', 'Qameyu', 3, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7865, '1542', 'Qash', 3, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7866, '91', 'Qurus', 31, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7867, '1768', 'Rabour', 105, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7868, '1433', 'Raha leo', 93, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7869, '1375', 'Rahaleo', 57, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7870, '1504', 'Rahaleo', 57, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7871, '2460', 'Rahaleo', 86, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7872, '2603', 'Rahaleo', 86, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7873, '4173', 'Rahaleo', 75, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7874, '3991', 'Rangwi', 60, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7875, '1769', 'Raranya', 105, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7876, '1376', 'Rasbura', 57, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7877, '1505', 'Rasbura', 57, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7878, '1199', 'Rau', 83, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7879, '1831', 'Regicheri', 123, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7880, '1248', 'Reha', 104, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7881, '2461', 'Reli', 86, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7882, '2604', 'Reli', 86, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7883, '92', 'Rhotia', 31, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7884, '1796', 'Rigicha', 111, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7885, '1797', 'Ring\'wani', 111, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7886, '1543', 'Riroda', 3, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7887, '1770', 'Roche', 105, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7888, '1151', 'Romu', 17, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7889, '2170', 'Ruaha', 44, '2024-09-21 20:20:15', '2024-09-21 20:20:15');
INSERT INTO `wards` (`id`, `wardID`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(7890, '590', 'Ruaha', 25, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7891, '696', 'Ruaha', 25, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7892, '2295', 'Ruaha', 128, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7893, '612', 'Ruaha Mbuyuni', 42, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7894, '1963', 'Ruanda', 69, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7895, '2069', 'Ruanda', 69, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7896, '3126', 'Ruanda', 70, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7897, '1458', 'Ruangwa', 106, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7898, '2918', 'Ruaruke', 37, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7899, '759', 'Rubafu', 8, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7900, '760', 'Rubale', 8, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7901, '2101', 'Rubeho', 16, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7902, '1075', 'Rubuga', 40, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7903, '1126', 'Rubuga', 40, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7904, '2171', 'Rudewa', 44, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7905, '496', 'Rudi', 85, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7906, '988', 'Rugenge', 27, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7907, '785', 'Rugera', 30, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7908, '1042', 'Rugongwe', 38, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7909, '786', 'Rugu', 30, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7910, '871', 'Ruhanga', 89, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7911, '2172', 'Ruhembe', 44, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7912, '1020', 'Ruhita', 34, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7913, '761', 'Ruhunga', 8, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7914, '3210', 'Ruhuwiko', 117, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7915, '1906', 'Ruiwa', 68, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7916, '1907', 'Rujewa', 68, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7917, '762', 'Rukoma', 8, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7918, '807', 'Rukuraijo', 56, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7919, '872', 'Rulanda', 89, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7920, '894', 'Rulenge', 97, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7921, '719', 'Runazi', 6, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7922, '1798', 'Rung\'abure', 111, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7923, '648', 'Rungemba', 87, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7924, '3507', 'Rungwa', 66, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7925, '1021', 'Rungwe Mpya', 34, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7926, '1434', 'Ruponda', 93, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7927, '975', 'Rusaba', 7, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7928, '1022', 'Rusesa', 34, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7929, '1076', 'Rusimbi', 40, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7930, '1127', 'Rusimbi', 40, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7931, '1043', 'Rusohoko', 38, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7932, '1742', 'Rusoli', 90, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7933, '895', 'Rusumo', 97, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7934, '1377', 'Rutamba', 57, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7935, '1506', 'Rutamba', 57, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7936, '873', 'Rutoro', 89, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7937, '808', 'Rutunguru', 56, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7938, '1279', 'Ruvu', 109, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7939, '2897', 'Ruvu', 36, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7940, '1654', 'Ruvu Remit', 115, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7941, '3211', 'Ruvuma', 117, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7942, '3255', 'Ruvuma', 117, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7943, '720', 'Ruziba', 6, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7944, '830', 'Ruzinga', 73, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7945, '809', 'Rwabwere', 56, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7946, '763', 'Rwamishenye', 8, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7947, '1743', 'Rwamlimi', 90, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7948, '3150', 'Rwinga', 94, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7949, '2349', 'Saba Saba', 82, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7950, '2238', 'Saba Saba', 82, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7951, '1832', 'Sabasaba', 123, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7952, '3303', 'Sabasabini', 26, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7953, '649', 'Sadani', 87, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7954, '462', 'Sagara', 51, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7955, '71', 'Sakina', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7956, '176', 'Sakina', 2, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7957, '2919', 'Salale', 37, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7958, '1688', 'Salama', 9, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7959, '440', 'Salanka', 50, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7960, '3380', 'Salawe', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7961, '3423', 'Salawe', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7962, '156', 'Sale', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7963, '2296', 'Sali', 128, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7964, '3003', 'Samazi', 28, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7965, '46', 'Sambasha', 1, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7966, '1280', 'Same', 109, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7967, '157', 'Samunge', 98, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7968, '3381', 'Samuye', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7969, '3424', 'Samuye', 112, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7970, '272', 'Sandali', 124, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7971, '3077', 'Sandulula', 118, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7972, '2633', 'Sangabuye', 23, '2024-09-21 20:20:15', '2024-09-21 20:20:15'),
(7973, '1855', 'Sangambi', 14, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7974, '3508', 'Sanjaranda', 66, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7975, '2133', 'Sanje', 43, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7976, '1964', 'Santilya', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7977, '2070', 'Santilya', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7978, '1632', 'Sanu Baray', 71, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7979, '1303', 'Sanya Juu', 113, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7980, '3509', 'Sanza', 66, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7981, '371', 'Sanzawa', 13, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7982, '650', 'Sao Hill', 87, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7983, '3510', 'Saranda', 66, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7984, '288', 'Saranga', 126, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7985, '3511', 'Sasajila', 66, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7986, '3512', 'Sasilo', 66, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7987, '3666', 'Sasu', 29, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7988, '3906', 'Saunyi', 41, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7989, '1689', 'Sazira', 9, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7990, '1544', 'Secheda', 3, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7991, '1799', 'SEDECO', 111, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7992, '3212', 'Seedfarm', 117, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7993, '47', 'Seela Sing\'isi', 1, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7994, '347', 'Segala', 12, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7995, '3885', 'Segera', 19, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7996, '218', 'Segerea', 22, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7997, '3304', 'Segese', 26, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7998, '463', 'Sejeli', 51, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(7999, '3336', 'Seke-Bugoro', 48, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8000, '72', 'Sekei', 2, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8001, '177', 'Sekei', 2, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8002, '129', 'Selela', 81, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8003, '3667', 'Seleli', 29, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8004, '2350', 'Selembala', 82, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8005, '2239', 'Selembala', 82, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8006, '3715', 'Semembela', 102, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8007, '3078', 'Senga', 118, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8008, '2484', 'Sengenya', 95, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8009, '130', 'Sepeko', 81, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8010, '3460', 'Sepuka', 21, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8011, '1888', 'Serengeti', 55, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8012, '441', 'Serya', 50, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8013, '3992', 'Shagayu', 60, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8014, '3337', 'Shagihilu', 48, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8015, '1655', 'Shambarai', 115, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8016, '48', 'Shambarai Burka', 1, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8017, '2462', 'Shangani', 86, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8018, '2605', 'Shangani', 86, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8019, '934', 'Shanwe', 84, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8020, '4174', 'Shaurimoyo', 75, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8021, '3479', 'Shelui', 24, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8022, '2634', 'Shibula', 23, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8023, '3716', 'Shigamba', 102, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8024, '1224', 'Shighatini', 92, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8025, '2713', 'Shilalo', 74, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8026, '3305', 'Shilela', 26, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8027, '2662', 'Shilembo', 54, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8028, '1249', 'Shimbi', 104, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8029, '1250', 'Shimbi Kwadele', 104, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8030, '3434', 'SHINYANGA', 112, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8031, '1200', 'Shirimatunda', 83, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8032, '2688', 'Shishani', 64, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8033, '3816', 'Shitage', 131, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8034, '1965', 'Shizuvi', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8035, '2071', 'Shizuvi', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8036, '3993', 'Shume', 60, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8037, '2965', 'Shungubweni', 79, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8038, '1023', 'Shunguliba', 34, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8039, '953', 'Sibwesa', 122, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8040, '4021', 'Sigaya', 77, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8041, '3717', 'Sigili', 102, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8042, '1545', 'Sigino', 3, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8043, '2134', 'Signal', 43, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8044, '1092', 'Sigunga', 130, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8045, '3741', 'Sikonge', 114, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8046, '1633', 'Silaloda', 71, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8047, '3668', 'Silambo', 29, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8048, '2780', 'Sima', 110, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8049, '1578', 'Simbay', 18, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8050, '3644', 'Simbo', 20, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8051, '1077', 'Simbo', 40, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8052, '1128', 'Simbo', 40, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8053, '2409', 'Sindano', 67, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8054, '1966', 'Sinde', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8055, '2072', 'Sinde', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8056, '3886', 'Sindeni', 19, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8057, '1546', 'Singe', 3, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8058, '3614', 'SINGIDA', 116, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8059, '2351', 'Singisa', 82, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8060, '2240', 'Singisa', 82, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8061, '73', 'Sinoni', 2, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8062, '178', 'Sinoni', 2, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8063, '3033', 'Sintali', 99, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8064, '109', 'Sinya', 59, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8065, '289', 'Sinza', 126, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8066, '1833', 'Sirari', 123, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8067, '1579', 'Sirop', 18, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8068, '1708', 'SiroriSimba', 10, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8069, '3252', 'Sisi kwa sisi', 125, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8070, '1967', 'Sisimba', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8071, '2073', 'Sisimba', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8072, '935', 'SITALIKE', 84, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8073, '3461', 'Siuyu', 21, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8074, '2814', 'Sizini', 72, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8075, '442', 'Soera', 50, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8076, '2186', 'Sofi', 65, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8077, '2898', 'Sofu', 36, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8078, '2899', 'Soga', 36, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8079, '4175', 'Sogea', 75, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8080, '158', 'Soitsambu', 98, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8081, '74', 'Sokon I', 2, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8082, '179', 'Sokon I', 2, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8083, '49', 'Sokon II', 1, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8084, '3425', 'Solwa', 112, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8085, '3382', 'Solwa', 112, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8086, '3513', 'Solya', 66, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8087, '3338', 'Somagedi', 48, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8088, '1327', 'Somanga', 45, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8089, '231', 'Somangila', 39, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8090, '75', 'Sombetini', 2, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8091, '180', 'Sombetini', 2, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8092, '4054', 'Songa', 88, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8093, '3782', 'Songambele', 129, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8094, '1602', 'Songambele', 49, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8095, '464', 'Songambele', 51, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8096, '810', 'Songambele', 56, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8097, '3907', 'Songe', 41, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8098, '372', 'Songolo', 13, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8099, '50', 'Songoro', 1, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8100, '1328', 'Songosongo', 45, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8101, '1304', 'Songu', 113, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8102, '3339', 'Songwa', 48, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8103, '3994', 'Soni', 60, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8104, '3004', 'Sopa', 28, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8105, '1201', 'Soweto', 83, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8106, '373', 'Soya', 13, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8107, '1800', 'Stendi Kuu', 111, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8108, '1281', 'Stesheni', 109, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8109, '1435', 'Stesheni', 93, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8110, '3213', 'Subira', 117, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8111, '1378', 'Sudi', 57, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8112, '1507', 'Sudi', 57, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8113, '1744', 'Suguti', 90, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8114, '1282', 'Suji', 109, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8115, '2689', 'Sukuma', 64, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8116, '2352', 'Sultan Area', 82, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8117, '2241', 'Sultan Area', 82, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8118, '2410', 'Sululu', 67, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8119, '2014', 'Suma', 108, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8120, '3079', 'Sumbawanga', 118, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8121, '2714', 'Sumbugu', 74, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8122, '2663', 'Sumve', 54, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8123, '3005', 'Sundu', 28, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8124, '3995', 'Sunga', 60, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8125, '2276', 'Sungaji', 91, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8126, '3645', 'Sungwizi', 20, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8127, '1093', 'Sunuka', 130, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8128, '1603', 'Sunya', 49, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8129, '443', 'Suruke', 50, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8130, '1834', 'Susuni', 123, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8131, '1968', 'Swaya', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8132, '2015', 'Swaya', 108, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8133, '2074', 'Swaya', 69, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8134, '2781', 'Tabaruka', 110, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8135, '219', 'Tabata', 22, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8136, '3854', 'TABORA', 119, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8137, '1283', 'Tae', 109, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8138, '1771', 'Tai', 105, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8139, '3340', 'Talaga', 48, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8140, '1889', 'Talatala', 55, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8141, '2871', 'Talawanda', 4, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8142, '3646', 'Tambalale', 20, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8143, '2966', 'Tambani', 79, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8144, '3770', 'Tambuka-Reli', 119, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8145, '3847', 'Tambuka-Reli', 119, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8146, '3514', 'Tambukareli', 66, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8147, '412', 'Tambukareli', 15, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8148, '537', 'Tambukareli', 15, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8149, '3996', 'Tamota', 60, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8150, '2554', 'Tandahimba', 120, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8151, '252', 'Tandale', 46, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8152, '1379', 'Tandangongoro', 57, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8153, '1508', 'Tandangongoro', 57, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8154, '273', 'Tandika', 124, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8155, '2463', 'Tandika', 86, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8156, '2606', 'Tandika', 86, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8157, '3214', 'Tanga', 117, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8158, '4132', 'TANGA', 121, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8159, '4055', 'Tanganyika', 88, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8160, '4127', 'Tanganyika', 88, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8161, '4097', 'Tangasisi', 121, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8162, '4124', 'Tangasisi', 121, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8163, '4128', 'Tangasisi', 121, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8164, '2464', 'Tangazo', 86, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8165, '2607', 'Tangazo', 86, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8166, '2900', 'Tangini', 36, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8167, '1251', 'Tarakea Motamburu', 104, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8168, '51', 'Tarakwa', 1, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8169, '2353', 'Tawa', 82, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8170, '2242', 'Tawa', 82, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8171, '4187', 'Tazari', 32, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8172, '2277', 'Tchenzema', 91, '2024-09-21 20:20:16', '2024-09-21 20:20:16'),
(8173, '1745', 'Tegeruka', 90, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8174, '2243', 'Tegetero', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8175, '2354', 'Tegetero', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8176, '1969', 'Tembela', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8177, '1970', 'Tembela', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8178, '2075', 'Tembela', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8179, '2076', 'Tembela', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8180, '2411', 'Temeke', 67, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8181, '274', 'Temeke', 124, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8182, '2967', 'Tengelea', 79, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8183, '76', 'Terrat', 2, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8184, '181', 'Terrat', 2, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8185, '1656', 'Terrat', 115, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8186, '444', 'Thawi', 50, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8187, '77', 'Themi', 2, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8188, '182', 'Themi', 2, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8189, '2836', 'Tibirinzi', 11, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8190, '3383', 'Tinde', 112, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8191, '3426', 'Tinde', 112, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8192, '2173', 'Tindiga', 44, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8193, '110', 'Tingatinga', 59, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8194, '4056', 'Tingeni', 88, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8195, '1329', 'Tingi', 45, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8196, '3169', 'Tingi', 101, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8197, '3253', 'Tinginya', 125, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8198, '1024', 'Titye', 34, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8199, '1634', 'Tlawi', 71, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8200, '275', 'Toangoma', 124, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8201, '1225', 'Toloha', 92, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8202, '2244', 'Tomondo', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8203, '2355', 'Tomondo', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8204, '3718', 'Tongi', 102, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8205, '4098', 'Tongoni', 121, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8206, '4125', 'Tongoni', 121, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8207, '4057', 'Tongwe', 88, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8208, '954', 'Tongwe', 122, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8209, '2522', 'Tulindane', 96, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8210, '3480', 'Tulya', 24, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8211, '1635', 'Tumati', 71, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8212, '374', 'Tumbakose', 13, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8213, '4188', 'Tumbatu', 32, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8214, '2815', 'Tumbe', 72, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8215, '2901', 'Tumbi', 36, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8216, '3771', 'Tumbi', 119, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8217, '3848', 'Tumbi', 119, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8218, '3531', 'Tumuli', 76, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8219, '4071', 'Tungamaa', 103, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8220, '232', 'Tungi', 39, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8221, '2245', 'Tungi', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8222, '2356', 'Tungi', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8223, '3908', 'Tunguli', 41, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8224, '4204', 'Tunguu', 35, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8225, '2357', 'Tununguo', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8226, '2246', 'Tununguo', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8227, '3817', 'Tura', 131, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8228, '1835', 'Turwa', 123, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8229, '3742', 'Tutuo', 114, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8230, '3254', 'Tuwemacho', 125, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8231, '4205', 'Ubago', 35, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8232, '3306', 'Ubagwe', 26, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8233, '4072', 'Ubangaa', 103, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8234, '1908', 'Ubaruku', 68, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8235, '2872', 'Ubenazomozi', 4, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8236, '1252', 'Ubetu Kahe', 104, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8237, '3997', 'Ubiri', 60, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8238, '290', 'Ubungo', 126, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8239, '3719', 'Uchama', 102, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8240, '2135', 'Uchindile', 43, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8241, '3341', 'Uchunga', 48, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8242, '613', 'Udekwa', 42, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8243, '3720', 'Uduka', 102, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8244, '1547', 'Ufana', 3, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8245, '2465', 'Ufukoni', 86, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8246, '2608', 'Ufukoni', 86, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8247, '3669', 'Ufukutwa', 29, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8248, '3818', 'Ufuluma', 131, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8249, '3647', 'Ugaka', 20, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8250, '3783', 'Ugalla', 129, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8251, '936', 'UGALLA', 84, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8252, '1436', 'Ugawaji', 93, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8253, '3721', 'Ugembe', 102, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8254, '3565', 'Ughandi', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8255, '3604', 'Ughandi', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8256, '465', 'Ugogoni', 51, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8257, '3670', 'Ugunga', 29, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8258, '3566', 'Uhamaka', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8259, '3605', 'Uhamaka', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8260, '614', 'Uhambingeto', 42, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8261, '413', 'Uhuru', 15, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8262, '538', 'Uhuru', 15, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8263, '1636', 'Uhuru', 71, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8264, '3127', 'Ukata', 70, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8265, '3342', 'Ukenyenge', 48, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8266, '2715', 'Ukiriguru', 74, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8267, '3784', 'Ukondamoyo', 129, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8268, '220', 'Ukonga', 22, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8269, '615', 'Ukumbi', 42, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8270, '3671', 'Ukumbi Siganga', 29, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8271, '3307', 'Ukune', 26, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8272, '2102', 'Ukwamani', 16, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8273, '616', 'Ukwega', 42, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8274, '591', 'Ulanda', 25, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8275, '697', 'Ulanda', 25, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8276, '2174', 'Ulaya', 44, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8277, '2175', 'Uleling\'ombe', 44, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8278, '3481', 'Ulemo', 24, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8279, '1971', 'Ulenje', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8280, '2077', 'Ulenje', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8281, '3308', 'Ulewe', 26, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8282, '3309', 'Ulowa', 26, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8283, '3006', 'Ulumi', 28, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8284, '2981', 'Umwe', 107, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8285, '78', 'Unga Ltd', 2, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8286, '183', 'Unga Ltd', 2, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8287, '3462', 'Unyahati', 21, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8288, '3567', 'Unyambwa', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8289, '3606', 'Unyambwa', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8290, '3568', 'Unyamikumbi', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8291, '3607', 'Unyamikumbi', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8292, '3569', 'Unyianga', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8293, '3608', 'Unyianga', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8294, '221', 'Upanga Magharibi', 22, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8295, '222', 'Upanga Mashariki', 22, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8296, '651', 'Upendo', 87, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8297, '1856', 'Upendo', 14, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8298, '3170', 'Upolo', 101, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8299, '2297', 'Uponera', 128, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8300, '3819', 'Upuge', 131, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8301, '3785', 'Urambo', 129, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8302, '1202', 'Uru Kaskazini', 83, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8303, '1203', 'Uru Kusini', 83, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8304, '1204', 'Uru Mashariki', 83, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8305, '1205', 'Uru Shimbwe', 83, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8306, '3482', 'Urughu', 24, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8307, '4176', 'Urusi', 75, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8308, '937', 'URUWILA', 84, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8309, '52', 'Usa river', 1, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8310, '2716', 'Usagara', 74, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8311, '4099', 'Usagara', 121, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8312, '4126', 'Usagara', 121, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8313, '3820', 'Usagari', 131, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8314, '3998', 'Usambara', 60, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8315, '3427', 'Usanda', 112, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8316, '3384', 'Usanda', 112, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8317, '2187', 'Usangule', 65, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8318, '3672', 'Usenye', 29, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8319, '910', 'Usevya', 80, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8320, '3310', 'Ushetu', 26, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8321, '1253', 'Ushiri/Ikuini', 104, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8322, '3673', 'Ushokola', 29, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8323, '3674', 'Usimba', 29, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8324, '3675', 'Usinge', 29, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8325, '3786', 'Usisya', 129, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8326, '3787', 'Ussoke', 129, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8327, '3385', 'Usule', 112, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8328, '3428', 'Usule', 112, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8329, '3743', 'Usunga', 114, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8330, '3648', 'Uswaya', 20, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8331, '3570', 'Utemini', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8332, '3609', 'Utemini', 116, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8333, '911', 'Utende', 80, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8334, '2136', 'Utengule', 43, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8335, '1909', 'Utengule Usangu', 68, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8336, '1972', 'Utengule Usongwe', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8337, '2078', 'Utengule Usongwe', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8338, '2982', 'Utete', 107, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8339, '3128', 'Utiri', 70, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8340, '3722', 'Utwigu', 102, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8341, '1094', 'Uvinza', 130, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8342, '938', 'Uwanja wa ndege', 84, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8343, '1801', 'Uwanja wa ndege', 111, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8344, '2247', 'Uwanja wa Taifa', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8345, '2358', 'Uwanja wa Taifa', 82, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8346, '53', 'Uwiro', 1, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8347, '3788', 'Uyogo', 129, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8348, '3311', 'Uyogo', 26, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8349, '1973', 'Uyole', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8350, '2079', 'Uyole', 69, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8351, '3676', 'Uyowa', 29, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8352, '3772', 'Uyui', 119, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8353, '3849', 'Uyui', 119, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8354, '3789', 'Uyumbu', 129, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8355, '2968', 'Vianzi', 79, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8356, '3887', 'Vibaoni', 19, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8357, '2176', 'Vidunda', 44, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8358, '2466', 'Vigaeni', 86, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8359, '2609', 'Vigaeni', 86, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8360, '2298', 'Vigoi', 128, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8361, '2873', 'Vigwaza', 4, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8362, '2935', 'Vihingo', 47, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8363, '233', 'Vijibweni', 39, '2024-09-21 20:20:17', '2024-09-21 20:20:17'),
(8364, '4195', 'Vijibweni', 33, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8365, '2969', 'Vikindu', 79, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8366, '2936', 'Vikumburu', 47, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8367, '497', 'Ving\'hawe', 85, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8368, '223', 'Vingunguti', 22, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8369, '2902', 'Visiga', 36, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8370, '2837', 'Vitongoji', 11, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8371, '414', 'Viwandani', 15, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8372, '539', 'Viwandani', 15, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8373, '2137', 'Viwanjasitini', 43, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8374, '2903', 'Viziwa ziwa', 36, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8375, '1284', 'Vudee', 109, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8376, '3999', 'Vuga', 60, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8377, '3948', 'Vugiri', 52, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8378, '1285', 'Vuje', 109, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8379, '1286', 'Vumari', 109, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8380, '3790', 'Vumilia', 129, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8381, '1287', 'Vunta', 109, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8382, '1380', 'Wailes', 57, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8383, '1509', 'Wailes', 57, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8384, '2664', 'Walla', 54, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8385, '652', 'Wambi', 87, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8386, '3034', 'Wampembe', 99, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8387, '498', 'Wangi', 85, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8388, '2838', 'Wara', 11, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8389, '1580', 'Wareta', 18, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8390, '1690', 'Wariku', 9, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8391, '592', 'Wasa', 25, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8392, '698', 'Wasa', 25, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8393, '253', 'Wazo', 46, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8394, '3723', 'Wela', 102, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8395, '4144', 'Welezo', 62, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8396, '3312', 'Wendele', 26, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8397, '1152', 'Weruweru', 17, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8398, '2816', 'Wingwi', 72, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8399, '3215', 'Wino', 117, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8400, '499', 'Wotta', 85, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8401, '3129', 'Wukiro', 70, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8402, '1637', 'Yaeda Ampa', 71, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8403, '1638', 'Yaeda Chini', 71, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8404, '2874', 'Yombo', 4, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8405, '276', 'Yombo Vituka', 124, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8406, '348', 'Zajilwa', 12, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8407, '312', 'Zanka', 5, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8408, '3649', 'Ziba', 20, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8409, '3080', 'Zimba', 118, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8410, '2875', 'Zinga', 4, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8411, '224', 'Zingiziwa', 22, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8412, '4058', 'Zirai', 88, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8413, '1078', 'Ziwani', 40, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8414, '1129', 'Ziwani', 40, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8415, '2467', 'Ziwani', 86, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8416, '2610', 'Ziwani', 86, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8417, '466', 'Zoissa', 51, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8418, '2177', 'Zombo', 44, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8419, '3313', 'Zongomera', 26, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8420, '3677', 'Zugimlole', 29, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8421, '415', 'Zuzu', 15, '2024-09-21 20:20:18', '2024-09-21 20:20:18'),
(8422, '540', 'Zuzu', 15, '2024-09-21 20:20:18', '2024-09-21 20:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `weight_gains`
--

CREATE TABLE `weight_gains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `livestock_id` bigint(20) UNSIGNED NOT NULL,
  `weight` double NOT NULL,
  `weight_gain` double NOT NULL,
  `weight_gain_unit_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weight_gains`
--

INSERT INTO `weight_gains` (`id`, `uuid`, `reference_no`, `farm_id`, `livestock_id`, `weight`, `weight_gain`, `weight_gain_unit_id`, `remarks`, `created_by`, `updated_by`, `state_id`, `created_at`, `updated_at`, `last_modified_at`, `deleted_at`) VALUES
(1, NULL, 'WG640712964', 2, 2, 150, 150, 2, 'Remarks', 6, NULL, 1, '2024-09-25 07:55:50', '2024-09-25 04:55:50', NULL, NULL),
(2, NULL, 'WG469257899', 2, 4, 200, 200, 2, 'none', 6, NULL, 1, '2024-09-25 07:56:17', '2024-09-25 04:56:17', NULL, NULL),
(3, NULL, 'WG792250416', 21, 17, 30, 30, 2, 'none', 32, NULL, 1, '2025-09-22 13:08:36', '2025-09-22 10:08:36', NULL, NULL),
(4, NULL, 'WG689013416', 21, 16, 10, 10, 2, 'none', 32, NULL, 1, '2025-09-30 07:27:51', '2025-09-30 07:27:51', NULL, NULL),
(5, 'weight-fresh-1759485834', 'WGT_FRESH_1759485834', 1, 1, 450.5, 25, 1, 'Monthly weight check', 1, NULL, 1, '2025-10-03 10:03:54', '2025-10-03 10:03:54', NULL, NULL),
(6, 'weight-test-1759486448', 'WGT_TEST_1759486448', 1, 1, 450.5, 25, 1, 'Test weight log', 1, NULL, 1, '2025-10-03 10:14:08', '2025-10-03 10:14:08', NULL, NULL),
(7, 'weight-test-1759486490', 'WGT_TEST_1759486490', 1, 1, 450.5, 25, 1, 'Test weight log', 1, NULL, 1, '2025-10-03 10:14:50', '2025-10-03 10:14:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `weight_units`
--

CREATE TABLE `weight_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weight_units`
--

INSERT INTO `weight_units` (`id`, `name`, `short_code`, `created_at`, `updated_at`) VALUES
(1, 'Tons', 'Tons', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(2, 'Kilograms', 'KG', '2024-09-21 20:19:40', '2024-09-21 20:19:40'),
(3, 'Grams', 'G', '2024-09-21 20:19:40', '2024-09-21 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_period_units`
--

CREATE TABLE `withdraw_period_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_period_units`
--

INSERT INTO `withdraw_period_units` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Days', '#004b23', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(2, 'Weeks', '#fb8500', '2024-09-21 20:19:57', '2024-09-21 20:19:57'),
(3, 'Months', '#e76f51', '2024-09-21 20:19:57', '2024-09-21 20:19:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administration_routes`
--
ALTER TABLE `administration_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_disposals`
--
ALTER TABLE `animal_disposals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `animal_disposals_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `animal_disposals_uuid_unique` (`uuid`),
  ADD KEY `animal_disposals_sync_status_last_modified_at_index` (`last_modified_at`),
  ADD KEY `animal_disposals_uuid_index` (`uuid`);

--
-- Indexes for table `animal_disposal_types`
--
ALTER TABLE `animal_disposal_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_sales`
--
ALTER TABLE `animal_sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `animal_sales_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `animal_sales_batch_no_unique` (`batch_no`);

--
-- Indexes for table `animal_sale_details`
--
ALTER TABLE `animal_sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_sale_reasons`
--
ALTER TABLE `animal_sale_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_vaccine_dosages`
--
ALTER TABLE `animal_vaccine_dosages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_types`
--
ALTER TABLE `attachment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authorization_tokens`
--
ALTER TABLE `authorization_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `calfs`
--
ALTER TABLE `calfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calf_conditions`
--
ALTER TABLE `calf_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calf_condition_types`
--
ALTER TABLE `calf_condition_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calf_problems`
--
ALTER TABLE `calf_problems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calf_problem_types`
--
ALTER TABLE `calf_problem_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calf_reproductive_problems`
--
ALTER TABLE `calf_reproductive_problems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calf_reproductive_problem_types`
--
ALTER TABLE `calf_reproductive_problem_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calvings`
--
ALTER TABLE `calvings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `calvings_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `calvings_uuid_unique` (`uuid`),
  ADD KEY `calvings_sync_status_last_modified_at_index` (`last_modified_at`),
  ADD KEY `calvings_uuid_index` (`uuid`);

--
-- Indexes for table `calving_types`
--
ALTER TABLE `calving_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `certificates_certificate_no_unique` (`certificate_no`);

--
-- Indexes for table `certificate_statuses`
--
ALTER TABLE `certificate_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_types`
--
ALTER TABLE `certificate_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dewormings`
--
ALTER TABLE `dewormings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dewormings_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `dewormings_uuid_unique` (`uuid`),
  ADD KEY `dewormings_sync_status_last_modified_at_index` (`last_modified_at`),
  ADD KEY `dewormings_uuid_index` (`uuid`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drying_offs`
--
ALTER TABLE `drying_offs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drying_offs_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `drying_offs_uuid_unique` (`uuid`),
  ADD KEY `drying_offs_serial_index` (`serial`),
  ADD KEY `drying_offs_sync_status_last_modified_at_index` (`last_modified_at`),
  ADD KEY `drying_offs_uuid_index` (`uuid`);

--
-- Indexes for table `extension_officers`
--
ALTER TABLE `extension_officers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `extension_officers_registration_no_unique` (`registration_no`),
  ADD UNIQUE KEY `extension_officers_phone_1_unique` (`phone_1`),
  ADD UNIQUE KEY `extension_officers_email_unique` (`email`);

--
-- Indexes for table `extension_officer_attachments`
--
ALTER TABLE `extension_officer_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extension_officer_farms`
--
ALTER TABLE `extension_officer_farms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `farmers`
--
ALTER TABLE `farmers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `farmers_farmer_no_unique` (`farmer_no`),
  ADD UNIQUE KEY `farmers_phone_1_unique` (`phone_1`),
  ADD UNIQUE KEY `farmers_email_unique` (`email`);

--
-- Indexes for table `farmer_attachments`
--
ALTER TABLE `farmer_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer_farms`
--
ALTER TABLE `farmer_farms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer_statuses`
--
ALTER TABLE `farmer_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer_types`
--
ALTER TABLE `farmer_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farms`
--
ALTER TABLE `farms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `farms_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `farms_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `farms_regional_reg_no_unique` (`regional_reg_no`);

--
-- Indexes for table `farm_events`
--
ALTER TABLE `farm_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_event_categories`
--
ALTER TABLE `farm_event_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_event_requests`
--
ALTER TABLE `farm_event_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farm_event_requests_farm_event_id_foreign` (`farm_event_id`),
  ADD KEY `farm_event_requests_farm_event_request_status_id_foreign` (`farm_event_request_status_id`);

--
-- Indexes for table `farm_event_request_statuses`
--
ALTER TABLE `farm_event_request_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_livestocks`
--
ALTER TABLE `farm_livestocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_livestock_types`
--
ALTER TABLE `farm_livestock_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_machines`
--
ALTER TABLE `farm_machines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_machine_types`
--
ALTER TABLE `farm_machine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_owners`
--
ALTER TABLE `farm_owners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_statuses`
--
ALTER TABLE `farm_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_tags`
--
ALTER TABLE `farm_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_users`
--
ALTER TABLE `farm_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farm_warehouses`
--
ALTER TABLE `farm_warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedings`
--
ALTER TABLE `feedings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feedings_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `feedings_uuid_unique` (`uuid`),
  ADD KEY `feedings_sync_status_last_modified_at_index` (`sync_status`,`last_modified_at`),
  ADD KEY `feedings_uuid_index` (`uuid`);

--
-- Indexes for table `feeding_types`
--
ALTER TABLE `feeding_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hamlets`
--
ALTER TABLE `hamlets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_conditions`
--
ALTER TABLE `health_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_condition_statuses`
--
ALTER TABLE `health_condition_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_statuses`
--
ALTER TABLE `health_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identity_card_types`
--
ALTER TABLE `identity_card_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inseminations`
--
ALTER TABLE `inseminations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`);

--
-- Indexes for table `invoice_statuses`
--
ALTER TABLE `invoice_statuses`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `legal_statuses`
--
ALTER TABLE `legal_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestocks`
--
ALTER TABLE `livestocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `livestocks_identification_number_unique` (`identification_number`),
  ADD UNIQUE KEY `livestocks_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `livestocks_barcode_tag_id_unique` (`barcode_tag_id`),
  ADD UNIQUE KEY `livestocks_rfid_tag_id_unique` (`rfid_tag_id`);

--
-- Indexes for table `livestock_attachments`
--
ALTER TABLE `livestock_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestock_heat_types`
--
ALTER TABLE `livestock_heat_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestock_inseminations`
--
ALTER TABLE `livestock_inseminations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `livestock_inseminations_uuid_unique` (`uuid`),
  ADD KEY `livestock_inseminations_serial_index` (`serial`);

--
-- Indexes for table `livestock_insemination_semen_straw_types`
--
ALTER TABLE `livestock_insemination_semen_straw_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestock_insemination_services`
--
ALTER TABLE `livestock_insemination_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestock_obtained_methods`
--
ALTER TABLE `livestock_obtained_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestock_stages`
--
ALTER TABLE `livestock_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestock_statuses`
--
ALTER TABLE `livestock_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestock_tags`
--
ALTER TABLE `livestock_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestock_types`
--
ALTER TABLE `livestock_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medications_uuid_unique` (`uuid`),
  ADD KEY `medications_sync_status_last_modified_at_index` (`last_modified_at`),
  ADD KEY `medications_uuid_index` (`uuid`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_quantity_units`
--
ALTER TABLE `medicine_quantity_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_types`
--
ALTER TABLE `medicine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milkings`
--
ALTER TABLE `milkings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `milkings_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `milkings_uuid_unique` (`uuid`),
  ADD KEY `milkings_milking_method_id_foreign` (`milking_method_id`),
  ADD KEY `milkings_milking_unit_id_foreign` (`milking_unit_id`),
  ADD KEY `milkings_sync_status_last_modified_at_index` (`last_modified_at`),
  ADD KEY `milkings_uuid_index` (`uuid`);

--
-- Indexes for table `milking_methods`
--
ALTER TABLE `milking_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milking_sessions`
--
ALTER TABLE `milking_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milking_statuses`
--
ALTER TABLE `milking_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milking_units`
--
ALTER TABLE `milking_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `officer_types`
--
ALTER TABLE `officer_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_terms`
--
ALTER TABLE `payment_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `permission_menus`
--
ALTER TABLE `permission_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pregnancy_diagnosis`
--
ALTER TABLE `pregnancy_diagnosis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pregnancy_diagnosis_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `pregnancy_diagnosis_uuid_unique` (`uuid`),
  ADD KEY `pregnancy_diagnosis_serial_index` (`serial`),
  ADD KEY `pregnancy_diagnosis_sync_status_last_modified_at_index` (`sync_status`,`last_modified_at`),
  ADD KEY `pregnancy_diagnosis_uuid_index` (`uuid`);

--
-- Indexes for table `pregnancy_diagnosis_test_results`
--
ALTER TABLE `pregnancy_diagnosis_test_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receipts_receipt_number_unique` (`receipt_number`),
  ADD UNIQUE KEY `receipts_referrence_number_unique` (`referrence_number`),
  ADD UNIQUE KEY `receipts_third_party_number_unique` (`third_party_number`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`);

--
-- Indexes for table `scan_logs`
--
ALTER TABLE `scan_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_levels`
--
ALTER TABLE `school_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `size_units`
--
ALTER TABLE `size_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slaughter_houses`
--
ALTER TABLE `slaughter_houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_users`
--
ALTER TABLE `system_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_users_email_unique` (`email`),
  ADD UNIQUE KEY `system_users_phone_unique` (`phone`);

--
-- Indexes for table `taggings`
--
ALTER TABLE `taggings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagging_statuses`
--
ALTER TABLE `tagging_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_allocations`
--
ALTER TABLE `tag_allocations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_allocation_statuses`
--
ALTER TABLE `tag_allocation_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_batches`
--
ALTER TABLE `tag_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_statuses`
--
ALTER TABLE `tag_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_types`
--
ALTER TABLE `tag_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_of_measurements`
--
ALTER TABLE `unit_of_measurements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usage_statuses`
--
ALTER TABLE `usage_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `vaccinations`
--
ALTER TABLE `vaccinations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vaccinations_vaccination_no_unique` (`vaccination_no`),
  ADD UNIQUE KEY `vaccinations_uuid_unique` (`uuid`),
  ADD KEY `vaccinations_sync_status_last_modified_at_index` (`last_modified_at`),
  ADD KEY `vaccinations_uuid_index` (`uuid`);

--
-- Indexes for table `vaccination_doses`
--
ALTER TABLE `vaccination_doses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vaccination_doses_uuid_unique` (`uuid`),
  ADD KEY `vaccination_doses_sync_status_last_modified_at_index` (`sync_status`,`last_modified_at`),
  ADD KEY `vaccination_doses_uuid_index` (`uuid`);

--
-- Indexes for table `vaccination_statuses`
--
ALTER TABLE `vaccination_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vaccines_uuid_unique` (`uuid`),
  ADD KEY `vaccines_farm_id_foreign` (`farm_id`);

--
-- Indexes for table `vaccine_batches`
--
ALTER TABLE `vaccine_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_diseases`
--
ALTER TABLE `vaccine_diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_dosages`
--
ALTER TABLE `vaccine_dosages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_dosage_constraints`
--
ALTER TABLE `vaccine_dosage_constraints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_officer_batches`
--
ALTER TABLE `vaccine_officer_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_schedules`
--
ALTER TABLE `vaccine_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_statuses`
--
ALTER TABLE `vaccine_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vets`
--
ALTER TABLE `vets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vets_registration_no_unique` (`registration_no`),
  ADD UNIQUE KEY `vets_phone_1_unique` (`phone_1`),
  ADD UNIQUE KEY `vets_phone_2_unique` (`phone_2`),
  ADD UNIQUE KEY `vets_email_unique` (`email`);

--
-- Indexes for table `vet_attachments`
--
ALTER TABLE `vet_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_farms`
--
ALTER TABLE `vet_farms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weight_gains`
--
ALTER TABLE `weight_gains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weight_gains_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `weight_gains_uuid_unique` (`uuid`),
  ADD KEY `weight_gains_sync_status_last_modified_at_index` (`last_modified_at`),
  ADD KEY `weight_gains_uuid_index` (`uuid`);

--
-- Indexes for table `weight_units`
--
ALTER TABLE `weight_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_period_units`
--
ALTER TABLE `withdraw_period_units`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administration_routes`
--
ALTER TABLE `administration_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `animal_disposals`
--
ALTER TABLE `animal_disposals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `animal_disposal_types`
--
ALTER TABLE `animal_disposal_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `animal_sales`
--
ALTER TABLE `animal_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `animal_sale_details`
--
ALTER TABLE `animal_sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `animal_sale_reasons`
--
ALTER TABLE `animal_sale_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `animal_vaccine_dosages`
--
ALTER TABLE `animal_vaccine_dosages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachment_types`
--
ALTER TABLE `attachment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `authorization_tokens`
--
ALTER TABLE `authorization_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `calfs`
--
ALTER TABLE `calfs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `calf_conditions`
--
ALTER TABLE `calf_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calf_condition_types`
--
ALTER TABLE `calf_condition_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `calf_problems`
--
ALTER TABLE `calf_problems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `calf_problem_types`
--
ALTER TABLE `calf_problem_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `calf_reproductive_problems`
--
ALTER TABLE `calf_reproductive_problems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `calf_reproductive_problem_types`
--
ALTER TABLE `calf_reproductive_problem_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `calvings`
--
ALTER TABLE `calvings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `calving_types`
--
ALTER TABLE `calving_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate_statuses`
--
ALTER TABLE `certificate_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `certificate_types`
--
ALTER TABLE `certificate_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dewormings`
--
ALTER TABLE `dewormings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drying_offs`
--
ALTER TABLE `drying_offs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `extension_officers`
--
ALTER TABLE `extension_officers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `extension_officer_attachments`
--
ALTER TABLE `extension_officer_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extension_officer_farms`
--
ALTER TABLE `extension_officer_farms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmers`
--
ALTER TABLE `farmers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `farmer_attachments`
--
ALTER TABLE `farmer_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `farmer_farms`
--
ALTER TABLE `farmer_farms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmer_statuses`
--
ALTER TABLE `farmer_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `farmer_types`
--
ALTER TABLE `farmer_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `farms`
--
ALTER TABLE `farms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `farm_events`
--
ALTER TABLE `farm_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `farm_event_categories`
--
ALTER TABLE `farm_event_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `farm_event_requests`
--
ALTER TABLE `farm_event_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farm_event_request_statuses`
--
ALTER TABLE `farm_event_request_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `farm_livestocks`
--
ALTER TABLE `farm_livestocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `farm_livestock_types`
--
ALTER TABLE `farm_livestock_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `farm_machines`
--
ALTER TABLE `farm_machines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farm_machine_types`
--
ALTER TABLE `farm_machine_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `farm_owners`
--
ALTER TABLE `farm_owners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `farm_statuses`
--
ALTER TABLE `farm_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `farm_tags`
--
ALTER TABLE `farm_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `farm_users`
--
ALTER TABLE `farm_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `farm_warehouses`
--
ALTER TABLE `farm_warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedings`
--
ALTER TABLE `feedings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `feeding_types`
--
ALTER TABLE `feeding_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hamlets`
--
ALTER TABLE `hamlets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_conditions`
--
ALTER TABLE `health_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_condition_statuses`
--
ALTER TABLE `health_condition_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `health_statuses`
--
ALTER TABLE `health_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `identity_card_types`
--
ALTER TABLE `identity_card_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inseminations`
--
ALTER TABLE `inseminations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_statuses`
--
ALTER TABLE `invoice_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legal_statuses`
--
ALTER TABLE `legal_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `livestocks`
--
ALTER TABLE `livestocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `livestock_attachments`
--
ALTER TABLE `livestock_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livestock_heat_types`
--
ALTER TABLE `livestock_heat_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `livestock_inseminations`
--
ALTER TABLE `livestock_inseminations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `livestock_insemination_semen_straw_types`
--
ALTER TABLE `livestock_insemination_semen_straw_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `livestock_insemination_services`
--
ALTER TABLE `livestock_insemination_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `livestock_obtained_methods`
--
ALTER TABLE `livestock_obtained_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `livestock_stages`
--
ALTER TABLE `livestock_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `livestock_statuses`
--
ALTER TABLE `livestock_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `livestock_tags`
--
ALTER TABLE `livestock_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `livestock_types`
--
ALTER TABLE `livestock_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medicine_quantity_units`
--
ALTER TABLE `medicine_quantity_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine_types`
--
ALTER TABLE `medicine_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `milkings`
--
ALTER TABLE `milkings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `milking_methods`
--
ALTER TABLE `milking_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `milking_sessions`
--
ALTER TABLE `milking_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `milking_statuses`
--
ALTER TABLE `milking_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `milking_units`
--
ALTER TABLE `milking_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `officer_types`
--
ALTER TABLE `officer_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_terms`
--
ALTER TABLE `payment_terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `permission_menus`
--
ALTER TABLE `permission_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pregnancy_diagnosis`
--
ALTER TABLE `pregnancy_diagnosis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pregnancy_diagnosis_test_results`
--
ALTER TABLE `pregnancy_diagnosis_test_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `scan_logs`
--
ALTER TABLE `scan_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `school_levels`
--
ALTER TABLE `school_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `size_units`
--
ALTER TABLE `size_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slaughter_houses`
--
ALTER TABLE `slaughter_houses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `species`
--
ALTER TABLE `species`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stages`
--
ALTER TABLE `stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `streets`
--
ALTER TABLE `streets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_users`
--
ALTER TABLE `system_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `taggings`
--
ALTER TABLE `taggings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tagging_statuses`
--
ALTER TABLE `tagging_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=536;

--
-- AUTO_INCREMENT for table `tag_allocations`
--
ALTER TABLE `tag_allocations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tag_allocation_statuses`
--
ALTER TABLE `tag_allocation_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tag_batches`
--
ALTER TABLE `tag_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_statuses`
--
ALTER TABLE `tag_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tag_types`
--
ALTER TABLE `tag_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unit_of_measurements`
--
ALTER TABLE `unit_of_measurements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usage_statuses`
--
ALTER TABLE `usage_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `vaccinations`
--
ALTER TABLE `vaccinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vaccination_doses`
--
ALTER TABLE `vaccination_doses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vaccination_statuses`
--
ALTER TABLE `vaccination_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccines`
--
ALTER TABLE `vaccines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vaccine_batches`
--
ALTER TABLE `vaccine_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vaccine_diseases`
--
ALTER TABLE `vaccine_diseases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vaccine_dosages`
--
ALTER TABLE `vaccine_dosages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccine_dosage_constraints`
--
ALTER TABLE `vaccine_dosage_constraints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccine_officer_batches`
--
ALTER TABLE `vaccine_officer_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccine_schedules`
--
ALTER TABLE `vaccine_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vaccine_statuses`
--
ALTER TABLE `vaccine_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vets`
--
ALTER TABLE `vets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vet_attachments`
--
ALTER TABLE `vet_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vet_farms`
--
ALTER TABLE `vet_farms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `villages`
--
ALTER TABLE `villages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8423;

--
-- AUTO_INCREMENT for table `weight_gains`
--
ALTER TABLE `weight_gains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `weight_units`
--
ALTER TABLE `weight_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `withdraw_period_units`
--
ALTER TABLE `withdraw_period_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `farm_event_requests`
--
ALTER TABLE `farm_event_requests`
  ADD CONSTRAINT `farm_event_requests_farm_event_id_foreign` FOREIGN KEY (`farm_event_id`) REFERENCES `farm_events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `farm_event_requests_farm_event_request_status_id_foreign` FOREIGN KEY (`farm_event_request_status_id`) REFERENCES `farm_event_request_statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `milkings`
--
ALTER TABLE `milkings`
  ADD CONSTRAINT `milkings_milking_method_id_foreign` FOREIGN KEY (`milking_method_id`) REFERENCES `milking_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `milkings_milking_unit_id_foreign` FOREIGN KEY (`milking_unit_id`) REFERENCES `milking_units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD CONSTRAINT `vaccines_farm_id_foreign` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
