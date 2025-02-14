-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 05:05 AM
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
(1, 0, 279, NULL, 3, 'Website Visit', '0.1', '2025-02-14 02:36:46', NULL);

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

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

INSERT INTO `users` (`id`, `image`, `chat_id`, `name`, `email`, `email_verified_at`, `password`, `contact`, `country`, `refferal_code`, `ref_refferal_code`, `wallet_address`, `balance`, `fixed_balance`, `refferal_balance`, `website_visit_balance`, `community_joined`, `remember_token`, `banned`, `banned_day`, `banned_remarks`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Admin', 'admin@gmail.com', '2025-02-14 03:35:22', '$2y$12$oHWN0HLlomKGtI9bp503POf.uujhNJmq6bS3M8f3u0PAcrHZYLzEq', '019698854778', 'BD', '12311', NULL, NULL, 0.1, 0.1, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, '2025-02-14 02:36:46');

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
(238, 'Visit Website & Scroll 5 Second!', 'website_logo/NowZG1728284211.png', 'Visit and wait 5 seconds then close to the page!', 'https://www.cpmrevenuegate.com/xv66v6nwh?key=30009fbabf1b9f1e42743d9ea16e35e0', '5', '2024-10-07 08:56:51', '2024-10-17 09:30:43'),
(278, 'Visit Website & Scroll 5 Second!', 'website_logo/SSwKS1729224965.png', 'Visit and wait 5 seconds then close to the page!', 'https://168523.shop/ccf4ed742d3710077e6d/5b7f7da260/?placementName=Link1', '5', '2024-10-17 22:16:05', NULL),
(279, 'Visit Website & Scroll 5 Second!', 'website_logo/NAJtz1729224966.png', 'Visit and wait 5 seconds then close to the page!', 'https://168523.shop/ccf4ed742d3710077e6d/5b7f7da260/?placementName=Link1', '5', '2024-10-17 22:16:06', NULL);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `with_draws`
--
ALTER TABLE `with_draws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
