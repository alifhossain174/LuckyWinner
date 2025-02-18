-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2025 at 05:29 AM
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
-- Database: `lucky_winner`
--

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `website_id` int(11) DEFAULT NULL COMMENT 'visitied website id',
  `reward_id` varchar(255) DEFAULT NULL,
  `earning_from` tinyint(4) DEFAULT NULL COMMENT '1=>Refferel, 2=> Daily Minning, 3=> Website Visit, 4=> Refferal Bonus From Admin, 5=> Tap Bonus, 6=>Package Refferel',
  `title` varchar(255) DEFAULT NULL,
  `points` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `user_id`, `website_id`, `reward_id`, `earning_from`, `title`, `points`, `created_at`, `updated_at`) VALUES
(1, 0, 279, NULL, 3, 'Website Visit', '0.1', '2025-02-14 02:36:46', NULL),
(2, 0, 238, NULL, 3, 'Website Visit', '0.1', '2025-02-18 00:48:31', NULL);

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
-- Table structure for table `giveaways`
--

CREATE TABLE `giveaways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `started_at` varchar(255) DEFAULT NULL,
  `end_at` varchar(255) DEFAULT NULL,
  `prize_amount` double DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Ads View; 2=>Refer',
  `eligibility_count` double NOT NULL DEFAULT 1 COMMENT 'Needed Ads View or Referral Count',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>Inactive; 1=>Active; 2=>Expired',
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `giveaways`
--

INSERT INTO `giveaways` (`id`, `title`, `description`, `started_at`, `end_at`, `prize_amount`, `type`, `eligibility_count`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(4, 'Aliquam non molestia', 'Dolore deserunt nihi', '2025-02-20 00:00', '2025-02-28 23:59', 36, 2, 1, 1, '1739850446YbLic', '2025-02-18 02:47:26', '2025-02-18 02:47:26'),
(5, 'Elit dolor alias ve', 'Mollitia ad cum fugi', '2025-02-17 12:00', '2025-02-26 12:00', 91, 1, 86, 1, '1739849069v0h10', '2025-02-18 02:24:29', '2025-02-18 02:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `giveaway_members`
--

CREATE TABLE `giveaway_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `giveaway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prize_money` double NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Pending; 1=>Winner; 2=>Declared',
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_28_221129_create_packages_table', 2),
(6, '2023_02_28_225358_create_package_requests_table', 3),
(8, '2022_10_07_190158_create_payment_types_table', 3),
(9, '2021_01_11_173737_create_payments_table', 3),
(10, '2023_03_01_000508_create_withdraws_table', 4),
(11, '2023_03_03_151703_create_earnings_table', 5),
(12, '2023_03_03_192953_create_quizzes_table', 6),
(13, '2023_03_03_201526_create_fb_ad_networks_table', 7),
(16, '2023_04_03_225524_create_jobs_table', 8),
(17, '2023_05_10_222128_create_websites_table', 9),
(18, '2023_05_23_145445_create_user_refferal_bonuses_table', 10),
(19, '2023_08_07_232717_create_account_status_submits_table', 1),
(20, '2024_03_11_233559_create_tasks_table', 11),
(21, '2024_03_12_001907_create_task_submissions_table', 12),
(22, '2024_03_12_002211_create_task_images_table', 13),
(23, '2024_06_03_111050_create_sliders_table', 14),
(24, '2014_10_12_100000_create_password_reset_tokens_table', 15),
(25, '2024_08_25_001306_create_daily_rewards_table', 15),
(26, '2024_08_31_023927_create_referal_histories_table', 16),
(28, '2025_02_17_173325_create_giveaways_table', 17),
(29, '2025_02_17_204320_create_giveaway_members_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `ponts_per_day` double NOT NULL DEFAULT 0,
  `ponts_per_hour` double NOT NULL DEFAULT 0,
  `amount_bdt` double NOT NULL DEFAULT 0,
  `amount_usd` double NOT NULL DEFAULT 0,
  `validity` double NOT NULL DEFAULT 0 COMMENT 'In Days',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `image`, `title`, `description`, `ponts_per_day`, `ponts_per_hour`, `amount_bdt`, `amount_usd`, `validity`, `created_at`, `updated_at`) VALUES
(59, 'package_images/3xHSp1729276021.png', 'Beginner Package', 'Package for beginner', 15, 0, 0, 200, 10, '2024-10-18 08:27:01', '2024-10-18 08:29:47'),
(60, 'package_images/dBquG1729276217.png', 'Mid Level Package', 'Package for Mid Level Miners', 25, 0, 0, 500, 7, '2024-10-18 08:30:17', NULL),
(61, 'package_images/LtzM51729276264.png', 'Senior Level Package', 'Package for Senior Level Miners', 50, 0, 0, 1000, 7, '2024-10-18 08:31:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_requests`
--

CREATE TABLE `package_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `package_title` varchar(255) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `package_ponts_per_day` double NOT NULL DEFAULT 0,
  `package_ponts_per_hour` double NOT NULL DEFAULT 0,
  `package_amount_bdt` double NOT NULL DEFAULT 0 COMMENT '1 TRX = 8.5 BDT',
  `package_amount_usd` double NOT NULL DEFAULT 0 COMMENT '1 TRX = 0.075 USD',
  `package_validity` double NOT NULL DEFAULT 0 COMMENT 'In Days',
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_info` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_requests`
--

INSERT INTO `package_requests` (`id`, `user_id`, `package_id`, `package_title`, `description`, `package_ponts_per_day`, `package_ponts_per_hour`, `package_amount_bdt`, `package_amount_usd`, `package_validity`, `payment_method`, `payment_info`, `transaction_id`, `status`, `created_at`, `updated_at`) VALUES
(12, 1087, 60, 'Mid Level Package', 'Package for Mid Level Miners', 25, 0, 0, 500, 0, 'Binance', '5214587489654', NULL, '1', '2024-10-19 09:18:22', '2024-10-24 23:31:47'),
(13, 1087, 59, 'Beginner Package', 'Package for beginner', 15, 0, 0, 200, 0, 'Binance', '01968547854788', NULL, '1', '2024-10-18 10:39:05', '2024-10-18 00:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `chat_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `refferal_code` varchar(255) DEFAULT NULL,
  `ref_refferal_code` varchar(255) DEFAULT NULL,
  `wallet_address` varchar(255) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `fixed_balance` double NOT NULL DEFAULT 0,
  `refferal_balance` double NOT NULL DEFAULT 0,
  `website_visit_balance` double NOT NULL DEFAULT 0,
  `community_joined` varchar(255) DEFAULT NULL,
  `total_ad_showed` double DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `banned` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>Not Banned; 1=>Banned',
  `banned_day` date DEFAULT NULL,
  `banned_remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `image`, `chat_id`, `name`, `email`, `email_verified_at`, `password`, `contact`, `country`, `refferal_code`, `ref_refferal_code`, `wallet_address`, `balance`, `fixed_balance`, `refferal_balance`, `website_visit_balance`, `community_joined`, `total_ad_showed`, `remember_token`, `banned`, `banned_day`, `banned_remarks`, `created_at`, `updated_at`) VALUES
(1, NULL, '654987', 'Super Admin', 'admin@gmail.com', '2025-02-14 03:35:22', '$2y$12$oHWN0HLlomKGtI9bp503POf.uujhNJmq6bS3M8f3u0PAcrHZYLzEq', '45214587847425', 'UAE', '12311', NULL, '2342342344', 36.2, 36.2, 0, 0.1, '1', 0, NULL, 0, NULL, NULL, NULL, '2025-02-18 00:48:31'),
(2, NULL, '4564567', 'Normal user', 'user@gmail.com', '2025-02-14 03:35:22', '$2y$12$oHWN0HLlomKGtI9bp503POf.uujhNJmq6bS3M8f3u0PAcrHZYLzEq', '019698854778', 'BD', '12312', '12311', NULL, 0.1, 0.1, 0, 0, '1', 0, NULL, 0, NULL, NULL, NULL, '2025-02-14 02:36:46');

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

CREATE TABLE `websites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `link` varchar(1200) DEFAULT NULL,
  `visiting_seconds` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `title`, `logo`, `description`, `link`, `visiting_seconds`, `created_at`, `updated_at`) VALUES
(27, 'Visit Website & Scroll 5 Second!', 'website_logo/SSwKS1729224965.png', 'Visit and wait 5 seconds then close to the page!', 'https://168523.shop/ccf4ed742d3710077e6d/5b7f7da260/?placementName=Link1', '5', '2024-10-17 22:16:05', NULL),
(28, 'Visit Website & Scroll 5 Second!', 'website_logo/NAJtz1729224966.png', 'Visit and wait 5 seconds then close to the page!', 'https://168523.shop/ccf4ed742d3710077e6d/5b7f7da260/?placementName=Link1', '5', '2024-10-17 22:16:06', NULL),
(29, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 10:56:51', '2024-10-17 11:32:19'),
(30, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 10:56:51', '2024-10-17 11:30:43'),
(31, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 10:56:51', '2024-10-17 11:30:23'),
(32, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 10:56:51', '2024-10-17 11:29:59'),
(33, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 10:56:51', '2024-10-17 11:29:39'),
(34, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 10:56:51', '2024-10-17 11:29:11'),
(35, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 10:56:51', '2024-10-17 11:28:48'),
(36, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 10:56:51', '2024-10-17 11:28:29'),
(37, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 10:56:51', '2024-10-17 11:28:06'),
(38, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 10:56:51', '2024-10-17 11:27:44'),
(39, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 10:56:51', '2024-10-07 11:11:21'),
(40, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 10:56:51', '2024-10-17 14:20:15'),
(129, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(130, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(131, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(132, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(133, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(134, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(135, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(136, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(137, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(138, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(139, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(140, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(141, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(142, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(143, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(144, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(145, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(146, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(147, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(148, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(149, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(150, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(151, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(152, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(153, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(154, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(155, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(156, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(157, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(158, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(159, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(160, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(161, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(162, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(163, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(164, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(165, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(166, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(167, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(168, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(169, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(170, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(171, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(172, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(173, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(174, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(175, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(176, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(177, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(178, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(179, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(180, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(181, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(182, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(183, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(184, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(185, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(186, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(187, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(188, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(189, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(190, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(191, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(192, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(193, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(194, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(195, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(196, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(197, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(198, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(199, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(200, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(201, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(202, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(203, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(204, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(205, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(206, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(207, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(208, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(209, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(210, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(211, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(212, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(213, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(214, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(215, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(216, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(217, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(218, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(219, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(220, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(221, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(222, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(223, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(224, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(225, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(226, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(227, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/j2xmtv6fj?key=5cbc311bb69ad864cda3bc7ea6d5c7b7', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:23'),
(228, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/dbs7u6rp?key=cf8a285d44c2a365add8804d99e17157', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:59'),
(229, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/r597gk0g?key=85edc577a83907595a1fdc096219d339', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:39'),
(230, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/x6nid44fu?key=b4630a86505b306e99c8e434a9a4d57f', '5', '2024-10-07 08:56:51', '2024-10-17 09:29:11'),
(231, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xi65zen8?key=2459893f436a12983fc6c3d9ee403b34', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:48'),
(232, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/v7ateg1a4?key=85d9bec44b128847e1b8e5465ad6530b', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:29'),
(233, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/uviehwzh?key=82d52fc82cf0882a273dcc758a3ebab9', '5', '2024-10-07 08:56:51', '2024-10-17 09:28:06'),
(234, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/f41zcqsk?key=bec57f14140f1a35767516884003f111', '5', '2024-10-07 08:56:51', '2024-10-17 09:27:44'),
(235, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(236, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/kgd0ycg4q5?key=76ea84969a484458de45c534d21d9412', '5', '2024-10-07 08:56:51', '2024-10-07 09:11:21'),
(237, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/a20gtfgc6i?key=40c3b936329ab338f88c4ca5b71003d1', '5', '2024-10-07 08:56:51', '2024-10-17 09:32:19'),
(238, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `web_settings`
--

CREATE TABLE `web_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `minimum_withdraw_points_limit` double NOT NULL DEFAULT 0,
  `withdraw_date` text DEFAULT NULL,
  `usdt_to_bdt` double NOT NULL DEFAULT 0,
  `refer_challange_start_from` timestamp NULL DEFAULT NULL,
  `refer_challange_end_at` timestamp NULL DEFAULT NULL,
  `refferal_bonus` varchar(255) DEFAULT NULL,
  `show_ad_after_tap` int(11) NOT NULL DEFAULT 50,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_settings`
--

INSERT INTO `web_settings` (`id`, `minimum_withdraw_points_limit`, `withdraw_date`, `usdt_to_bdt`, `refer_challange_start_from`, `refer_challange_end_at`, `refferal_bonus`, `show_ad_after_tap`, `created_at`, `updated_at`) VALUES
(1, 500, '2025-12-30', 120, '2024-10-15 20:00:00', '2024-10-21 21:00:00', '10000,5000,2500,1000,500,300,300,300,300,300,200,200,200,200,200,200,200,200,200,200', 0, '2023-03-22 13:00:22', '2025-02-17 17:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `with_draws`
--

CREATE TABLE `with_draws` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `points` double NOT NULL DEFAULT 0,
  `trx` double NOT NULL DEFAULT 0,
  `current_referals` varchar(255) DEFAULT NULL,
  `payment_title` varchar(255) DEFAULT NULL,
  `user_wallet_address` varchar(15) DEFAULT NULL,
  `admin_wallet_address` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `terminal` int(11) DEFAULT 1,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `with_draws`
--

INSERT INTO `with_draws` (`id`, `user_id`, `points`, `trx`, `current_referals`, `payment_title`, `user_wallet_address`, `admin_wallet_address`, `transaction_id`, `status`, `terminal`, `created_at`, `updated_at`) VALUES
(1, 1, 100, 100, '5', 'qweqwe', 'q123123123', 'qwew1231', '123123213', '1', 1, NULL, '2025-02-17 17:47:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `giveaways`
--
ALTER TABLE `giveaways`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `giveaway_members`
--
ALTER TABLE `giveaway_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giveaway_id` (`giveaway_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_requests`
--
ALTER TABLE `package_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indexes for table `websites`
--
ALTER TABLE `websites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_settings`
--
ALTER TABLE `web_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `with_draws`
--
ALTER TABLE `with_draws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `giveaways`
--
ALTER TABLE `giveaways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `giveaway_members`
--
ALTER TABLE `giveaway_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `package_requests`
--
ALTER TABLE `package_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `web_settings`
--
ALTER TABLE `web_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `with_draws`
--
ALTER TABLE `with_draws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
