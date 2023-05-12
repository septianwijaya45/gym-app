-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 11, 2023 at 10:14 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbdiva`
--

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int UNSIGNED NOT NULL,
  `bannable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bannable_id` bigint UNSIGNED NOT NULL,
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(27, 'Connellyberg'),
(39, 'Corenemouth'),
(42, 'Corwinview'),
(41, 'Doyleview'),
(44, 'East Aric'),
(9, 'East Augustine'),
(55, 'East Haileestad'),
(8, 'East Noemy'),
(38, 'East Russell'),
(58, 'East Ruthberg'),
(56, 'East Travonborough'),
(22, 'Gislasonville'),
(47, 'Grimesport'),
(32, 'Hellerstad'),
(21, 'Herminiabury'),
(40, 'Jacobshaven'),
(51, 'Jeanneburgh'),
(12, 'Joeberg'),
(3, 'Johnsonland'),
(37, 'Jordynfort'),
(7, 'Kulasstad'),
(48, 'Lake Ford'),
(54, 'Larsonhaven'),
(19, 'Laurianneton'),
(20, 'Madisonshire'),
(17, 'Marcelport'),
(4, 'Mraztown'),
(49, 'New Dagmar'),
(36, 'New Hopestad'),
(45, 'New Idella'),
(34, 'New Kayleighland'),
(5, 'North Aglae'),
(43, 'North Dorothyborough'),
(10, 'North Kobetown'),
(1, 'O\'Connerchester'),
(11, 'Okunevamouth'),
(16, 'Port Adonis'),
(6, 'Port Aidan'),
(53, 'Port Liam'),
(35, 'Port Marianna'),
(25, 'Port Martinburgh'),
(33, 'Port Monica'),
(18, 'Port Nayeli'),
(46, 'Reillyside'),
(15, 'Robelport'),
(60, 'Sawaynside'),
(14, 'Schmittchester'),
(57, 'South Citlalliton'),
(26, 'South Eladiohaven'),
(24, 'South Isac'),
(29, 'South Patsy'),
(30, 'Stephanieport'),
(13, 'Stiedemannside'),
(52, 'Timmothyland'),
(2, 'Waylonmouth'),
(23, 'West Dewittbury'),
(50, 'West Donny'),
(31, 'West Vivienneland'),
(59, 'Willland'),
(28, 'Wintheisershire');

-- --------------------------------------------------------

--
-- Table structure for table `city_managers`
--

CREATE TABLE `city_managers` (
  `user_id` bigint UNSIGNED NOT NULL,
  `city_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city_managers`
--

INSERT INTO `city_managers` (`user_id`, `city_id`) VALUES
(14, 4),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10),
(38, 21),
(39, 22),
(40, 23),
(41, 24),
(42, 25),
(43, 26),
(44, 27),
(45, 28),
(46, 29),
(47, 30),
(82, 39),
(65, 41),
(66, 42),
(67, 43),
(68, 44),
(69, 45),
(70, 46),
(71, 47),
(72, 48),
(73, 49),
(74, 50);

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gym_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coaches`
--

INSERT INTO `coaches` (`id`, `name`, `gym_id`) VALUES
(1, 'Mrs. Sabryna Beatty IIIs', 28),
(3, 'Ms. Aiyana Stanton Jr.', 3),
(6, 'pelatih', 1),
(7, 'Ms. Coralie Mayert', 11),
(8, 'Erna Kovacek', 12),
(11, 'Ms. Fleta Ferry', 15),
(13, 'Myron Jenkins', 22),
(15, 'Waino Turner', 24),
(17, 'babi', 1),
(18, 'test', 3),
(19, 'test', 3);

-- --------------------------------------------------------

--
-- Table structure for table `coach_training_session`
--

CREATE TABLE `coach_training_session` (
  `coach_id` bigint UNSIGNED NOT NULL,
  `training_session_id` bigint UNSIGNED NOT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` bigint UNSIGNED NOT NULL,
  `week_id` bigint UNSIGNED NOT NULL,
  `training_day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `muscle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exercise_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sets` int DEFAULT NULL,
  `repetitions` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `gyms`
--

CREATE TABLE `gyms` (
  `id` bigint UNSIGNED NOT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_manager_id` bigint UNSIGNED NOT NULL,
  `city_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gyms`
--

INSERT INTO `gyms` (`id`, `cover_image`, `created_at`, `updated_at`, `name`, `city_manager_id`, `city_id`) VALUES
(1, 'b02cc9e0114d3d20723aa30f29c0e1b8.png', '2023-04-05 11:18:40', '2023-04-05 11:18:40', 'Ipsum nihil.', 17, 11),
(3, 'b66c55435309ccb1e76415d55e59414f.png', '2023-04-05 11:18:43', '2023-04-05 11:18:43', 'Ipsum veniam quis.', 19, 13),
(4, '2abb99ff3892e0fec54f6d240b6df953.png', '2023-04-05 11:18:44', '2023-04-05 11:18:44', 'Quaerat saepe consectetur.', 20, 14),
(8, '026ac2366d25a92f64478ad8e6482be4.png', '2023-04-05 11:18:53', '2023-04-05 11:18:53', 'Voluptatem quibusdam nobis.', 14, 18),
(9, '3138aed9ae79a6c9935b1906a3e15775.png', '2023-04-05 11:18:56', '2023-04-05 11:18:56', 'Maxime accusantium.', 16, 19),
(10, 'b1d611b2e5c82cef5352716f88fd5070.png', '2023-04-05 11:18:58', '2023-04-05 11:18:58', 'Facilis asperiores.', 18, 20),
(11, '2143bdd55b7528ea18be6c1e2d48c729.png', '2023-04-07 14:08:15', '2023-04-07 14:08:15', 'Eaque omnis.', 19, 31),
(12, '5bcecf9b9684b666569515302719e7fc.png', '2023-04-07 14:08:16', '2023-04-07 14:08:16', 'Et in.', 14, 32),
(15, '8766c928c31c63f95c0069215e08b939.png', '2023-04-07 14:08:20', '2023-04-07 14:08:20', 'Suscipit eligendi et.', 20, 35),
(16, 'a7dfedda2b04c00eaad86456303b075d.png', '2023-04-07 14:08:24', '2023-04-07 14:08:24', 'Atque illo officia.', 16, 36),
(17, 'bb78f8872d67602444de8469a83fd8ea.png', '2023-04-07 14:08:30', '2023-04-07 14:08:30', 'Nisi accusantium sed.', 18, 37),
(20, '93730e27aa8a45657cf754663e3cb331.png', '2023-04-07 14:08:37', '2023-04-07 14:08:37', 'Occaecati magni voluptas.', 17, 40),
(22, 'cd081db1bdf31215d629bb01b642b318.png', '2023-04-16 16:02:51', '2023-04-16 16:02:51', 'Earum adipisci aut.', 18, 52),
(24, '203745102488fe767b6c6356cc1e1ecd.png', '2023-04-16 16:02:53', '2023-04-16 16:02:53', 'Assumenda necessitatibus.', 20, 54),
(26, '7c5dc4721154bf99b9b08d52ccc88977.png', '2023-04-16 16:02:57', '2023-04-16 16:02:57', 'Reiciendis officiis aliquam.', 16, 56),
(28, 'e7ac6814618a7d01c6802435de6605f9.png', '2023-04-16 16:03:03', '2023-04-16 16:03:03', 'Eum doloremque.', 19, 58),
(29, 'eef00c1b5e44006cf7c54948d0f142fa.png', '2023-04-16 16:03:06', '2023-04-16 16:03:06', 'Id id quis.', 14, 59),
(30, '2c25c9e09b64a2849841e80c004c0a24.png', '2023-04-16 16:03:10', '2023-04-16 16:03:10', 'Doloremque et.', 17, 60);

-- --------------------------------------------------------

--
-- Table structure for table `gym_managers`
--

CREATE TABLE `gym_managers` (
  `user_id` bigint UNSIGNED NOT NULL,
  `gym_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gym_managers`
--

INSERT INTO `gym_managers` (`user_id`, `gym_id`) VALUES
(23, 8),
(24, 9),
(25, 10),
(48, 16),
(49, 17),
(52, 20),
(75, 26),
(77, 28),
(78, 29),
(79, 30);

-- --------------------------------------------------------

--
-- Table structure for table `gym_members`
--

CREATE TABLE `gym_members` (
  `user_id` bigint UNSIGNED NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gym_members`
--

INSERT INTO `gym_members` (`user_id`, `gender`, `date_of_birth`, `last_login`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'male', '1989-12-05', '2023-04-05 11:18:13', 'R3co8iO6nm', '2023-04-05 11:18:26', '2023-04-05 11:18:26'),
(3, 'female', '1970-10-14', '2023-04-05 11:18:14', 'ApMW4uVNWs', '2023-04-05 11:18:26', '2023-04-05 11:18:26'),
(4, 'male', '1988-11-08', '2023-04-05 11:18:16', 'cOJYN3ydgp', '2023-04-05 11:18:26', '2023-04-05 11:18:26'),
(5, 'male', '2011-08-07', '2023-04-05 11:18:18', '60egPT46Co', '2023-04-05 11:18:26', '2023-04-05 11:18:26'),
(6, 'female', '1972-01-06', '2023-04-05 11:18:20', '52hMtwOBp4', '2023-04-05 11:18:26', '2023-04-05 11:18:26'),
(8, 'male', '1990-06-06', '2023-04-05 11:18:22', 'RjKqxLBss9', '2023-04-05 11:18:26', '2023-04-05 11:18:26'),
(9, 'female', '2001-04-03', '2023-04-05 11:18:24', 'WkR61Tc2fF', '2023-04-05 11:18:26', '2023-04-05 11:18:26'),
(10, 'male', '2009-11-05', '2023-04-05 11:18:25', 'ANqZxAwmoY', '2023-04-05 11:18:26', '2023-04-05 11:18:26'),
(27, 'male', '2023-04-19', NULL, NULL, NULL, NULL),
(28, 'male', '2006-04-29', '2023-04-07 14:07:31', 'FNrSUuNm9W', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(29, 'female', '2000-08-22', '2023-04-07 14:07:34', 'SIxc4Qhev5', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(30, 'female', '1976-06-22', '2023-04-07 14:07:35', 'tAu79uXVnE', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(31, 'male', '2007-09-30', '2023-04-07 14:07:36', 'h3YcnYwdgw', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(32, 'male', '1989-02-04', '2023-04-07 14:07:38', 'e7IHFryrP8', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(33, 'female', '1974-07-10', '2023-04-07 14:07:40', 'Wh6YIUQIui', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(34, 'female', '1986-08-20', '2023-04-07 14:07:41', 'Jx8XXna2xs', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(35, 'male', '1970-07-29', '2023-04-07 14:07:43', 'T3xXiqXSjq', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(36, 'female', '2006-06-04', '2023-04-07 14:07:44', 'BWDVKK0RnA', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(37, 'male', '1983-02-26', '2023-04-07 14:07:45', 'mqbzlkbULv', '2023-04-07 14:07:46', '2023-04-07 14:07:46'),
(54, 'male', '2023-02-08', NULL, NULL, NULL, NULL),
(55, 'male', '1974-07-29', '2023-04-16 16:02:21', 'UXTdHZ8B0P', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(56, 'male', '2015-09-18', '2023-04-16 16:02:23', 'JjF2cznj4K', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(57, 'female', '1972-05-21', '2023-04-16 16:02:24', '8Mr3FY3V4g', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(58, 'female', '2002-11-30', '2023-04-16 16:02:26', 'FlNYblmoRy', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(59, 'female', '1977-06-18', '2023-04-16 16:02:27', '7oZN4fyizO', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(60, 'male', '1970-03-26', '2023-04-16 16:02:28', 'Xo4wsiK8gx', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(61, 'male', '2020-09-16', '2023-04-16 16:02:29', 'TUDYSFJX09', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(62, 'male', '1974-10-09', '2023-04-16 16:02:30', '2xEUH6z36l', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(63, 'male', '1970-03-04', '2023-04-16 16:02:32', 'x2PRaIcp0h', '2023-04-16 16:02:34', '2023-04-16 16:02:34'),
(64, 'female', '2002-01-13', '2023-04-16 16:02:33', 'bfjoMlza5t', '2023-04-16 16:02:35', '2023-04-16 16:02:35'),
(80, 'male', '2023-04-08', NULL, NULL, NULL, NULL),
(81, 'male', '2023-04-08', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gym_member_training_session`
--

CREATE TABLE `gym_member_training_session` (
  `gym_member_id` bigint UNSIGNED NOT NULL,
  `training_session_id` bigint UNSIGNED NOT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2017_03_04_000000_create_bans_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2022_02_25_174201_create_permission_tables', 1),
(9, '2022_02_25_215500_create_users_table', 1),
(10, '2022_02_25_215516_create_gyms_table', 1),
(11, '2022_02_25_215618_create_training_sessions_table', 1),
(12, '2022_02_25_215626_create_training_packages_table', 1),
(13, '2022_02_25_220002_create_coaches_table', 1),
(14, '2022_02_25_220106_create_gym_managers_table', 1),
(15, '2022_02_25_220113_create_city_managers_table', 1),
(16, '2022_02_25_230821_add_city_manager_id_column_to_gyms_table', 1),
(17, '2022_02_27_072917_create_coach_training_session_table', 1),
(18, '2022_02_27_171538_add_gym_id_column_to_training_sessions_table', 1),
(19, '2022_03_01_194651_create_gym_members_table', 1),
(20, '2022_03_01_205242_create_gym_member_training_session_table', 1),
(21, '2022_03_01_210213_create_package_purchase_table', 1),
(22, '2022_03_03_045518_add_role_column_to_users_table', 1),
(23, '2022_03_03_233137_add_gym_id_to_gym_managers_table', 1),
(24, '2022_03_04_161350_add_id_column_to_package_purchase_table', 1),
(25, '2022_03_04_162801_add_purchased_at_column_to_package_purchase_table', 1),
(26, '2022_03_05_152226_create_cities_table', 1),
(27, '2022_03_05_152922_add_city_id_column_to_gyms_table', 1),
(28, '2022_03_05_160805_add_city_id_column_to_city_managers_table', 1),
(29, '2022_03_05_205047_add_id_column_to_gym_member_training_session_table', 1),
(30, '2022_03_06_172703_create_jobs_table', 1),
(31, '2022_03_07_164641_add_id_column_to_coach_training_session_table', 1),
(32, '2022_03_09_143235_add_banned_at_column_to_users_table', 1),
(33, '2022_03_11_210138_add_remember_token_column_to_users_table', 1),
(34, '2023_02_05_185642_create_quotes_table', 2),
(35, '2023_02_16_181820_create_programs_table', 2),
(36, '2023_02_16_182149_create_weeks_table', 2),
(37, '2023_02_16_182815_create_exercises_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 53),
(1, 'App\\Models\\User', 82),
(1, 'App\\Models\\User', 84);

-- --------------------------------------------------------

--
-- Table structure for table `package_purchase`
--

CREATE TABLE `package_purchase` (
  `gym_member_id` bigint UNSIGNED NOT NULL,
  `gym_id` bigint UNSIGNED NOT NULL,
  `package_id` bigint UNSIGNED NOT NULL,
  `amount_paid` double NOT NULL,
  `id` bigint UNSIGNED NOT NULL,
  `purchased_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'create gym manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(2, 'create city manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(3, 'create gym', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(4, 'create city', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(5, 'create coach', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(6, 'create package', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(7, 'create session', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(8, 'edit gym manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(9, 'edit city manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(10, 'edit gym', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(11, 'edit city', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(12, 'edit coach', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(13, 'edit package', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(14, 'edit session', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(15, 'delete gym manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(16, 'delete city manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(17, 'delete gym', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(18, 'delete city', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(19, 'delete coach', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(20, 'delete package', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(21, 'delete session', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(22, 'show gym manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(23, 'show city manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(24, 'show gym', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(25, 'show city', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(26, 'show coach', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(27, 'show package', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(28, 'show session', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(29, 'show attendance', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(30, 'ban gym manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(31, 'unban gym manager', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(32, 'buy package', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58'),
(33, 'assign coach', 'web', '2023-04-05 11:18:58', '2023-04-05 11:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'No name given yet',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `number_of_weeks` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint UNSIGNED NOT NULL,
  `quote` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'cityManager', 'web', '2023-04-05 11:18:59', '2023-04-05 11:18:59'),
(2, 'gymManager', 'web', '2023-04-05 11:18:59', '2023-04-05 11:18:59'),
(3, 'admin', 'web', '2023-04-05 11:18:59', '2023-04-05 11:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(3, 1),
(5, 1),
(7, 1),
(8, 1),
(10, 1),
(12, 1),
(14, 1),
(15, 1),
(17, 1),
(19, 1),
(21, 1),
(22, 1),
(24, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(7, 2),
(14, 2),
(21, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(32, 2),
(33, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3);

-- --------------------------------------------------------

--
-- Table structure for table `training_packages`
--

CREATE TABLE `training_packages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `sessions_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `training_packages`
--

INSERT INTO `training_packages` (`id`, `name`, `price`, `sessions_number`) VALUES
(1, 'Prof. Dean Kuphal MD', 35139, 29),
(2, 'Mrs. Marielle Howe', 25139, 19),
(3, 'Bridie Shanahan', 20751, 19),
(4, 'Adrien Mayer III', 47891, 20),
(5, 'Dolly Marquardt', 29553, 49),
(6, 'Sadye Watsica Sr.', 7811, 33),
(7, 'Prof. Donny Hayes DDS', 6981, 35),
(8, 'Amy Kozey', 20180, 23),
(9, 'Prof. Jamaal Langosh', 35601, 28),
(10, 'Santiago Deckow', 11970, 18),
(11, 'Naomie Purdy DDS', 2258, 24),
(12, 'Stone Emmerich', 38438, 37),
(13, 'Theresia Marvin Jr.', 5411, 38),
(14, 'Ezekiel Weimann Jr.', 32230, 25),
(15, 'Hilda Stroman PhD', 22605, 48),
(16, 'Dr. Kaylie Zieme PhD', 7425, 11),
(17, 'Prof. Melisa Muller Sr.', 23064, 44),
(18, 'Sid Schuster', 29566, 22),
(19, 'Mr. Giovani Yost', 30937, 48),
(20, 'Chaim Schmitt', 20149, 37),
(21, 'Chet Greenholt', 12114, 29),
(22, 'Kenyatta Spencer', 22341, 43),
(23, 'Madalyn Grant', 44672, 32),
(24, 'Blanca Ziemann', 48141, 30),
(25, 'Dillan McCullough III', 40122, 32),
(26, 'Shakira Runolfsdottir', 4670, 12),
(27, 'Harrison Goyette PhD', 1013, 31),
(28, 'Prof. Arlo Tillman', 41554, 40),
(29, 'Mrs. Mabelle Stoltenberg II', 13052, 24),
(30, 'Prof. Magali Renner V', 30421, 21);

-- --------------------------------------------------------

--
-- Table structure for table `training_sessions`
--

CREATE TABLE `training_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starts_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finishes_at` timestamp NULL DEFAULT NULL,
  `gym_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `training_sessions`
--

INSERT INTO `training_sessions` (`id`, `name`, `starts_at`, `finishes_at`, `gym_id`) VALUES
(1, 'Yesenia Wiza', '2022-03-06 23:24:24', '2022-03-07 02:24:24', 1),
(3, 'Eleanore Frami', '2022-03-20 22:07:39', '2022-03-21 00:07:39', 4),
(4, 'Dax Wiza', '2022-03-06 05:28:43', '2022-03-06 07:28:43', 9),
(5, 'Miss Twila Funk III', '2022-03-16 01:52:53', '2022-03-16 04:52:53', 3),
(10, 'Elsie Terry', '2022-03-05 23:54:47', '2022-03-06 02:54:47', 8),
(11, 'Prof. Bridget Hartmann II', '2022-03-16 09:54:38', '2022-03-16 11:54:38', 8),
(12, 'Magali Thompson', '2022-03-01 09:20:03', '2022-03-01 10:20:03', 10),
(15, 'Daija Lubowitz', '2022-03-07 16:08:23', '2022-03-07 18:08:23', 9),
(16, 'Jamar Wehner', '2022-03-27 01:41:34', '2022-03-27 02:41:34', 1),
(17, 'Katheryn Conn', '2022-03-13 04:24:16', '2022-03-13 07:24:16', 4),
(19, 'Grady Haag', '2022-03-30 12:42:11', '2022-03-30 13:42:11', 3),
(21, 'Orville Russel', '2022-03-12 21:26:11', '2022-03-13 00:26:11', 3),
(22, 'Jean Brakus', '2022-03-28 21:02:18', '2022-03-28 23:02:18', 9),
(24, 'Orrin Okuneva DDS', '2022-03-11 09:47:30', '2022-03-11 11:47:30', 1),
(26, 'Katlynn Cummerata', '2022-03-23 00:06:47', '2022-03-23 01:06:47', 8),
(28, 'Ms. Burdette Bode DDS', '2022-03-28 11:19:33', '2022-03-28 13:19:33', 10),
(29, 'Wanda Hackett', '2022-03-20 19:44:05', '2022-03-20 21:44:05', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `avatar_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomer_tlf` bigint DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `avatar_image`, `created_at`, `updated_at`, `email`, `name`, `nomer_tlf`, `password`, `email_verified_at`, `stripe_id`, `role`, `banned_at`, `remember_token`) VALUES
(2, '80061c76ff4f72c5c6687059c81d3577.png', '2023-04-05 11:18:14', '2023-04-05 11:18:14', 'lonnie46@example.net', 'Bradford Wuckert V', 28802158522190, '$2y$10$GchiOqgy4USYU5y8ZjEo3ubfArY1GWu7eJeS0BLaOiBgiCIwPIfsW', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(3, '38559e0b9254509d6c991a1aa8fafe15.png', '2023-04-05 11:18:16', '2023-04-05 11:18:16', 'wiley45@example.org', 'Dr. Jeramie Metz DVM', 20707232024501, '$2y$10$nbvIEJbdJNX5hwYHjyD4COEPUWysekPagik3K0GyGBG0I1VtQy9hS', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(4, 'e0cc25a608e3102b07f10cd838c720a5.png', '2023-04-05 11:18:18', '2023-04-05 11:18:18', 'hadley.simonis@example.org', 'Jamil Goyette', 28503213290217, '$2y$10$Z3222sMhRiUilh78HZmzeOyUwU0CnnNmwr0JBsYQ6pqXer0bmNzzm', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(5, 'abc05486eadc744417d47f218a4ac150.png', '2023-04-05 11:18:20', '2023-04-05 11:18:20', 'hobart93@example.com', 'Autumn Boyle', 28912072664414, '$2y$10$lUcNanI1vSEy/sedcStknuxieIsa9QeUIrpFb5vE2sT/TEKCDxdUC', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(6, 'f6fb9fbf16f4df8cbc2c4b679d385233.png', '2023-04-05 11:18:21', '2023-04-05 11:18:21', 'vgreenholt@example.org', 'Mr. Demond Becker IV', 22209010872381, '$2y$10$6pUByfMdwFNX.vNinp4IVOv2ZnijM2UuEz91S8vL4PUPN/DDSxr6.', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(8, 'bc0216b66effce9f17c7847ebec7d55d.png', '2023-04-05 11:18:24', '2023-04-05 11:18:24', 'harvey.fiona@example.net', 'Americo Schmidt', 28410182253921, '$2y$10$ubOnhvTB9uU7ufpmLlKr3.jnHQF/VJp1brxAz35QS2UlHu81pG1rO', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(9, '7480ab1006872e37be5f651fcf941da4.png', '2023-04-05 11:18:25', '2023-04-05 11:18:25', 'mkuphal@example.org', 'Aditya Luettgen', 20710207366642, '$2y$10$tb8wKJphX8XGM/GbnThEOOughVhpndA8RhDE6531XOnD8Rngxr0Xi', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(10, 'df63a87ab8a987561eb79bb7ca0afb0f.png', '2023-04-05 11:18:26', '2023-04-05 11:18:26', 'cara.sporer@example.net', 'Shemar Harris DDS', 20712234770762, '$2y$10$OPeOKcMi3Spt2dXlwYhFse3j088ApJgpMFeV7SNYYN3mgTFmRhN5u', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(14, '2de8f54977dd0c8c55b006291e330552.png', '2023-04-05 11:18:32', '2023-04-05 11:18:32', 'marcellus.powlowski@example.org', 'Leo Kirlin', 21601222489486, '$2y$10$GFyAkZSL4pfETeYMCPSBnOrrrkB06dXA9LO6UB85N/5Yfi6KEox.W', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(16, 'b9bb978963f144018acecbb3ba1871d3.png', '2023-04-05 11:18:34', '2023-04-05 11:18:34', 'ntorp@example.com', 'Reymundo Cassin', 22207264756979, '$2y$10$yvsVRuoDhTaaUKd4sYq2o.25mexqYXiOKs/E/fpi910KW5Sauag2G', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(17, '684546acdf5175753b6cdec3eb5f7fcd.png', '2023-04-05 11:18:35', '2023-04-05 11:18:35', 'sunny.jones@example.org', 'Dr. Jonathan Wilderman', 21809017353979, '$2y$10$4LC5wR8kFhrP/wupFVzvde0NXt4mLVlZJ1cMMDAZBGGK.gMNLELfW', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(18, '68f984e45f91ec05f705c2ab9d7197ac.png', '2023-04-05 11:18:37', '2023-04-05 11:18:37', 'juwan72@example.net', 'Norbert Homenick', 27304089660190, '$2y$10$f.dmWHqnrsGTfKMu3VJqM.LgCBFSfTblBGm24WpZ6nUj5ve4KEbxi', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(19, '54caae638b274007ffee079106bba0d5.png', '2023-04-05 11:18:38', '2023-04-05 11:18:38', 'phoebe39@example.com', 'Layla Heller Sr.', 21204152621390, '$2y$10$gdbSj3oVq6EV.yTNh3quxOHHcQCzS4/a6XLgn2E18F3uCioTqrcrW', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(20, '638989a1eeedb2ad39e3568131d7d74f.png', '2023-04-05 11:18:39', '2023-04-05 11:18:39', 'santos.treutel@example.org', 'Jolie Kohler', 27711181446973, '$2y$10$mMEHkAIMUsTwmZjcDHEXgujKOWsECdztz0I8XPArApHQf6NtcuZXq', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(21, 'd389855370f9c63f988a68da5014b24f.png', '2023-04-05 11:18:47', '2023-04-05 11:18:47', 'vida86@example.com', 'Dulce Runte', 28612095319406, '$2y$10$qIG302/CyGwzIZCQ51zWgukCGUXHrzhNwp9cHAo3rSAyst9a7Tjmm', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(22, '7ae595cb0a46dde934d6d6d30a03e15f.png', '2023-04-05 11:18:49', '2023-04-05 11:18:49', 'sidney.legros@example.com', 'Dr. Russell Hahn', 27309085922551, '$2y$10$6uOzoBF5EgnanZ8d9thgs.RNtS4SnHW.NV7C2fLmDkeAlucYY.Uu2', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(23, 'a603e8cdc5ad0ea47e209d660abc165f.png', '2023-04-05 11:18:52', '2023-04-05 11:18:52', 'aubrey40@example.com', 'Ashly West MD', 28806108841899, '$2y$10$ka2LLA8uxhYbmcy2PsFec.uTRAJyLxpMYkUCRV1kCMyr6RvpzAs92', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(24, 'c4da535a5eeb1d44a92a9c38fd224735.png', '2023-04-05 11:18:54', '2023-04-05 11:18:54', 'jany.ritchie@example.com', 'Jessy Wintheiser', 29207091710192, '$2y$10$4prmqFMirciDreZNb2OvV.mWnn3ijtxxPbZ88wDrSNbnogmL22LB.', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(25, '36a410e4137c66731f936177354b51a6.png', '2023-04-05 11:18:57', '2023-04-05 11:18:57', 'cole.tillman@example.com', 'Aliyah Corkery', 28705178061802, '$2y$10$zax4g4Nvpv1Hm0xdosgHOezK9Mvmu52WHMC3SzmKUBJ6YC/4ntFRW', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(26, NULL, '2023-04-05 11:19:30', '2023-04-05 11:19:30', 'admin@gmail.com', 'admin', NULL, '$2y$10$szXYRcSonVV8HAV6xUxjYeKKxH.sHPPs7ostYTpiPUa41A2gGX7NO', NULL, NULL, 'admin', NULL, NULL),
(27, 'blank-profile-picture.png', '2023-04-05 11:39:08', '2023-04-05 11:39:08', 'member@gmail.com', 'member', 12345678901234, '$2y$10$W2Xj7wbWiMFVBq5JWZBcrONLKEXilc8sAIpdefFa4lyWzIWmx2iuO', NULL, NULL, 'gym_member', NULL, NULL),
(28, '50f80ff5d0abe630a8ecfddb3fad5776.png', '2023-04-07 14:07:34', '2023-04-07 14:07:34', 'armand26@example.com', 'Beulah Stiedemann', 29604111837403, '$2y$10$Jz3uHEAqWozzaeFaxFgN7ejrvqNzvwoM3R50f27Gm9uVQM4vgqCbK', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(29, '5742a4938967b434c889ec7914c221c7.png', '2023-04-07 14:07:35', '2023-04-07 14:07:35', 'dakota.romaguera@example.com', 'Nyah Heaney', 29003138050720, '$2y$10$9VSSKGv3PkaV5HP6Xaf6S.CfqC3zhUuVikxlzIdjiI1S/mMyBvTea', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(30, 'b648882dddf31be850f0690f91c3ee58.png', '2023-04-07 14:07:36', '2023-04-07 14:07:36', 'alivia34@example.com', 'Julius Prohaska', 20404145415113, '$2y$10$kRC.mV94eNaOzlU02RFweuvjJDSY0MDhzqbTRchY3.ksDYb6QGnEe', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(31, 'f750ab37313509df6b5135522a214d92.png', '2023-04-07 14:07:38', '2023-04-07 14:07:38', 'velva14@example.org', 'Alivia Kuhlman', 29112062940044, '$2y$10$/g9nFmJ/FWJu5r.AQ6YJdOM0yQdg4Mdv8PNSC6HY2LU0SEyHcFxyu', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(32, '8bc06dab9b80585ab0462143201e39b3.png', '2023-04-07 14:07:40', '2023-04-07 14:07:40', 'ntoy@example.com', 'Dr. Freddie Treutel V', 27105226396477, '$2y$10$SiFKIl3zjfxRrXm9xMvr.uWFz2oLd7UDjydkQsbLgAUYG2eIuiHj2', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(33, '454e381c5a01790bfb2565ce8eef4f03.png', '2023-04-07 14:07:41', '2023-04-07 14:07:41', 'adriel19@example.com', 'Mr. Sylvan Bayer I', 21605307608951, '$2y$10$sHIwfaeQYh4yOYjKjPfmquvmVaWEQAqeIzuxl64.Qr7xkJR5mVOca', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(34, 'fb0a576f77c2d3c43c4d1b1727f59de9.png', '2023-04-07 14:07:43', '2023-04-07 14:07:43', 'bernhard.amos@example.com', 'Mollie Abbott', 27412197269489, '$2y$10$9QALgsAKrBsyRgvgxmo9MuPxO5xh7TzE9LSV8tWGOmXPFms1xW4H6', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(35, 'cabebc53dbdd69f53bc0df6c28ee725d.png', '2023-04-07 14:07:44', '2023-04-07 14:07:44', 'kamryn14@example.org', 'Dr. Walter Lehner II', 22211245217549, '$2y$10$NKKsIe.Z5qgtA.Be6kov3OMEpK0tyQDIQEyJpRZbCDO1Es5BzOYtq', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(36, 'e0623c67abbed220e18dfd631b761dd5.png', '2023-04-07 14:07:45', '2023-04-07 14:07:45', 'brau@example.com', 'Dr. Benjamin Volkman DVM', 27110100130612, '$2y$10$5OhWHuMOqQpcrDf.RP/xAuoWj8OIj4Gf7l.RhHIKZV6uvZevGe3be', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(37, '923e80a55fec4d56c5aca61ae80cdc8d.png', '2023-04-07 14:07:46', '2023-04-07 14:07:46', 'mueller.heath@example.net', 'Reyna Windler', 27812220875204, '$2y$10$yPHeJQvceMcQtFFi2dnhpebW.JegoTD.UMsqW0mYy0Amb6tNje37y', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(38, 'fb53c08f1714c28707e55d66ccbb9b68.png', '2023-04-07 14:07:51', '2023-04-07 14:07:51', 'williamson.cecilia@example.net', 'Mr. Dashawn Dooley', 20304191310608, '$2y$10$.qyu3bFRBfI4qTQye6H2oef9lZfl7UUrFK5SwElrjm2o4Mr9NfTOK', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(39, 'f2b6d07774882212dd72922bd6a4c4c4.png', '2023-04-07 14:07:54', '2023-04-07 14:07:54', 'glover.ryleigh@example.net', 'Travon Jacobs DDS', 27005128909692, '$2y$10$4TLxDHrqiIh4i9wYjoXhZehyqVPVm/wXihXljEDyWO5o6fXSP.1N6', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(40, '608f7ab3e9224a46a8d950e3e7efb65f.png', '2023-04-07 14:07:55', '2023-04-07 14:07:55', 'abdullah01@example.net', 'Paolo Hilpert', 20512165596586, '$2y$10$JFMnRr8Dv9gasHDoqZtZFeQCZyI.YCPj3yoqLQLXeqw9xMHHjvbJG', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(41, '12093114c04afb22974a4fa293d095af.png', '2023-04-07 14:07:57', '2023-04-07 14:07:57', 'wuckert.raphaelle@example.org', 'Mitchell Feest', 20306279098500, '$2y$10$XuVcJkOTcJsS0.PZXcILG.JLZ6u0XVyr43m52Y6wdcy6nioTc6AB2', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(42, '3b473495758ad83f0cdb2f6810c9a9ba.png', '2023-04-07 14:08:00', '2023-04-07 14:08:00', 'emard.lorna@example.com', 'Mr. Richard Prohaska', 22208073930797, '$2y$10$cYPzQz.EgLN89HPzV0rx8ueg0e0pZumpxz4SzTBk1KLMLJFjYh2pq', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(43, '417d81f2259a9ddbc82f7a6af629774a.png', '2023-04-07 14:08:05', '2023-04-07 14:08:05', 'everette47@example.net', 'Lura Stokes', 28608151230941, '$2y$10$5KKTNHsTzNylNZwpid8d8ObhNZW3zm1JBOTLA61KGQ6uQ8xC8Cdu6', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(44, 'f6a3adcf4f2f69b1248c04a219357489.png', '2023-04-07 14:08:07', '2023-04-07 14:08:07', 'rterry@example.org', 'Mr. Ted Marks I', 20909126088028, '$2y$10$Allb15PWEEOTyrcUNQ.3KuShIRCkwKHfHhxsSZYY9ory216v6MwSq', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(45, '3453c3772de9f46861b93b4677ec1436.png', '2023-04-07 14:08:08', '2023-04-07 14:08:08', 'xmaggio@example.org', 'Dean Beier', 27201200646308, '$2y$10$1tC4MI..TI8/YWxPAC/UEO93FklV9STpjoO2xRLdlrClqycVoUzey', '2022-03-14 17:00:00', NULL, 'coaches', NULL, NULL),
(46, 'c3057dfacb00ab44b9a6d2e6098ee7d3.png', '2023-04-07 14:08:10', '2023-04-07 14:08:10', 'lesch.gregoria@example.org', 'Jaylon Stroman', 21201300846358, '$2y$10$pX1LecUqCa7X931pHyJjnOAyKAbfGjDNvpzuccsmHuh8U/.iB5jGq', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(47, '8bd50726ea61f8b6340f5664cecc1720.png', '2023-04-07 14:08:11', '2023-04-07 14:08:11', 'rroob@example.org', 'Wilber Vandervort', 28407255774379, '$2y$10$jJWgpzRJr4m1XHlxu3sQzuYl.FjFIO6owZzpLFoQckkZUoa6zuTiS', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(48, '48b74824fda34ef8444f57812f6cc86b.png', '2023-04-07 14:08:23', '2023-04-07 14:08:23', 'stokes.sandy@example.com', 'Prof. Greta Denesik', 28710015302450, '$2y$10$iAWY0US23q1h0EJ95OpwkevKMC1JEMSM/PkYdaYa3bKthrlWBnGM2', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(49, '2ece2cff84c927724a50152ef4424f67.png', '2023-04-07 14:08:25', '2023-04-07 14:08:25', 'bkreiger@example.com', 'Aisha Kub', 21112319885354, '$2y$10$HLWdREvuERqtUz8AYbNjt.qjkEdmRw7NHA6uoLhsWg3ZJipDi0XaO', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(50, 'e4d4e2276e6ea6528ab2db27475fcd4e.png', '2023-04-07 14:08:31', '2023-04-07 14:08:31', 'bgerhold@example.com', 'Jacky Erdman', 29504222408674, '$2y$10$beJN8saCcZE4UKn9qiELWO/0zU9qAUTsC2Wc9OEQXx8.4pQqEYSGC', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(51, '28f067fa881653170fb066bf2cc233ed.png', '2023-04-07 14:08:34', '2023-04-07 14:08:34', 'tprohaska@example.com', 'Bud Blick II', 27906309241534, '$2y$10$D1zHnwcaibkOABcenbuL9Om5W/3dpHX6M9AOzhyK41N/DyI0osdUW', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(52, '433abe514b034afbec8a68a78c6dad9b.png', '2023-04-07 14:08:36', '2023-04-07 14:08:36', 'kkub@example.org', 'Felix Durgan', 21107173534734, '$2y$10$vSaUPZZOqEIjoinfXsdFaOW/1G01eloEeipU2WX1QZ2Oc3kWpvxRu', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(53, NULL, '2023-04-07 14:09:15', '2023-04-07 14:09:15', 'alif@gmail.com', 'alif', NULL, '$2y$10$joDsW8LWuYEpiv85EBtIDuV4sNc3L.iw7yIO/iqG7pjfSD6cUUUBq', NULL, NULL, 'admin', NULL, NULL),
(54, 'blank-profile-picture.png', '2023-04-07 14:11:18', '2023-04-07 14:11:18', 'joki@gmail.com', 'joki', 3502072708000001, '$2y$10$Nv6jou1.6JVol.TN9f7vb.TDiGquaSONG.LRhGbNjFrVQ8as1T7xy', '2023-04-07 21:22:56', NULL, 'gym_member', NULL, NULL),
(55, '2a9657894116ca83f08b103643f6b0fc.png', '2023-04-16 16:02:23', '2023-04-16 16:02:23', 'tbednar@example.com', 'Nayeli Boyer', 21108282628821, '$2y$10$slMgL3BNLz1CBqIQ2E4GrObGeSpKthN9rdpGszuRUDYBwaeSWhRK6', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(56, '791fca86a1d2c88893614f9d822d196d.png', '2023-04-16 16:02:24', '2023-04-16 16:02:24', 'alexandro60@example.org', 'Triston Hilpert', 27201242769720, '$2y$10$95YJd8TOqI8aNJmIv0/RjO/yb4kezRaUW.lzaXDe0v1kMrDSlTccG', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(57, '2f65e67c3ef81e611f5eeb2fa14e1a4f.png', '2023-04-16 16:02:26', '2023-04-16 16:02:26', 'katarina.jenkins@example.net', 'Omer Steuber', 28803153631820, '$2y$10$4SQr3VNbCfca6NVsjndTY.w6maslMUtZdkM5zRCvXzBJu7ym5mZ2G', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(58, 'ec4c3896f4baf3145e5ba1e40208b5e7.png', '2023-04-16 16:02:27', '2023-04-16 16:02:27', 'jaylin68@example.com', 'Dr. Miller Bednar III', 29103109752401, '$2y$10$FQRhjMQReyWtz.n.puJS3urTEW2ZLcTc/C.Nc3vEDQQtvzWpsX/oy', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(59, '06bdb564b595760f2a386a64ca9c16f3.png', '2023-04-16 16:02:28', '2023-04-16 16:02:28', 'pwintheiser@example.net', 'Nasir Witting Sr.', 21410204202846, '$2y$10$8P0r9NiTrbwIvlRH94yQAORPOojH8JgXKvI2v9Uf0VexPRgHwXAMK', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(60, 'acccc41b0d01857c5f61b395b257f87e.png', '2023-04-16 16:02:29', '2023-04-16 16:02:29', 'xweber@example.net', 'Kaley Goldner PhD', 21706172916881, '$2y$10$.81QgpBgXDRxz2hOqxcELOrXyxvJK0eMfywu3vu2llSOfs7Gjhp/S', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(61, 'e5cbe9cc9b766b9292a571c8f42c329c.png', '2023-04-16 16:02:30', '2023-04-16 16:02:30', 'acasper@example.net', 'Cora Turner DDS', 21006164473805, '$2y$10$ZYFzvFmSlVqOCXu1Og11vulALM3utqsynBqZa4v0btj5X6UikSoam', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(62, '61efb43fca68b9aa5ceb0e6a117622eb.png', '2023-04-16 16:02:32', '2023-04-16 16:02:32', 'sister46@example.com', 'Trenton Ward', 21303269184878, '$2y$10$r4ANutOB3GQa1cKagX/guu1BGaANTjNd8nIxCYhcQwtALY54ln3zy', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(63, '43ae9ce6c91f89186ef75b766a7bc9e5.png', '2023-04-16 16:02:33', '2023-04-16 16:02:33', 'jdickinson@example.net', 'Jordon Auer', 28111147644861, '$2y$10$A9vABGGlnzlV1tNa3aj0uuh4lM7ppm0KLrdLWZVgYEZOnK8WTY67.', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(64, '39ea7bd6b67cac0a8479ee3da35bdef0.png', '2023-04-16 16:02:34', '2023-04-16 16:02:34', 'barrett68@example.com', 'Dr. Julie Bartoletti', 29912054705739, '$2y$10$UFxgUVgMycrUDWuhpiafweXN61FY1Y2AbGFuYxO7AivW7dr47BSi2', '2022-03-14 17:00:00', NULL, 'gym_member', NULL, NULL),
(65, '137b7c5b069c22ca5720944b5badf522.png', '2023-04-16 16:02:36', '2023-04-16 16:02:36', 'fboyle@example.net', 'Mrs. Sydni Wilderman', 21004266532834, '$2y$10$FSvUrXDkK.TDMp5Eqp3BsujtrgaWXsQI/lC5K7ua73ZFKZMIyuEVG', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(66, 'fe419a85f2ddf8f8f7be3a0821eb5661.png', '2023-04-16 16:02:37', '2023-04-16 16:02:37', 'jaskolski.giovanna@example.net', 'Dr. Imani Bashirian', 20903027178079, '$2y$10$./tCmhUZvJppepkrlfiMFeyIBQyCHf3c70QPuwWfGiR4vdciaRN6G', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(67, 'c0638365e7d5aebffd3facec5178fd50.png', '2023-04-16 16:02:38', '2023-04-16 16:02:38', 'colleen13@example.org', 'Mr. Judson Beatty', 21708026814684, '$2y$10$sPhK9/PON.H38fWFW87Pi.eu28JkUEIBAWBmt1GHXBK8G479fJpqK', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(68, '0c59b512248f81cd467c7ed5d8cb994a.png', '2023-04-16 16:02:39', '2023-04-16 16:02:39', 'zbauch@example.com', 'Bettye Walker', 28803064992972, '$2y$10$HoWVEjwj/EWgXDCGjRbUmeDv0FKbgsncDpt.VgdlZ40KaYEaTLhTS', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(69, '3fd2aa9fe9d2f91c8d8356a948cacd10.png', '2023-04-16 16:02:41', '2023-04-16 16:02:41', 'carmine67@example.org', 'Price Feil I', 21607250672513, '$2y$10$PbtAeiUrytNTJ94.raXNqujW9dHDSkMka9DBaAld/JXF.1L3OBSTC', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(70, 'a1d29b92e58e7db0bdce2c7afac40a7c.png', '2023-04-16 16:02:42', '2023-04-16 16:02:42', 'joe.wintheiser@example.com', 'Rashawn Lind Sr.', 27207244243481, '$2y$10$U9tFbeoh.JIbLZc.sSYeXep1jxG54cieoCs4/QXjEEkjYIl4iQaIe', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(71, '76e2cd6c002e629aee1c0cb0d2831982.png', '2023-04-16 16:02:44', '2023-04-16 16:02:44', 'preston.keebler@example.com', 'Gregory Nitzsche', 21507172301995, '$2y$10$nNJjFskUT/.2Tyx.mhsh/u7jHkpdheO0.6HfgVhpR/MZluhzVtIx6', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(72, '822910bcd3f3a0dcd19e08b21b9c9a24.png', '2023-04-16 16:02:46', '2023-04-16 16:02:46', 'west.glennie@example.org', 'Bartholome Koepp', 27606145665496, '$2y$10$NwIFMysG1LhruuLjDw2eMOGlbE0ggEf8C6oanIXo4VD3KZBGhmrW6', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(73, 'a80db34829f68e65cc1525c975acd877.png', '2023-04-16 16:02:47', '2023-04-16 16:02:47', 'cryan@example.net', 'Miss Twila Witting', 21304213747166, '$2y$10$d5B2w.p9mpQnSKfHclUL8O.HrcgGHaPXXIJgz7fm64vxEsLoSlc3i', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(74, 'ec7dd14891e181ed79898789d492055b.png', '2023-04-16 16:02:48', '2023-04-16 16:02:48', 'lonny67@example.com', 'Dr. Kellen Botsford', 21608234122112, '$2y$10$zC0alDCJqrN62ib.m7JxkOIiK6d7JZ0J1qbW2hfx1Dl2cv3vIk1NW', '2022-03-14 17:00:00', NULL, 'city_manager', NULL, NULL),
(75, '16fb6b621a966fe916973a5cb320c9c3.png', '2023-04-16 16:02:56', '2023-04-16 16:02:56', 'heidenreich.lilly@example.net', 'Prof. Lucius Morissette', 29704085292807, '$2y$10$53gDCgauYBnHh8djePIGf.ekxysytAK0JX2pc9WXdmJcHNFnror.S', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(76, '7c7a649a5b83a3b24765b339b7679bce.png', '2023-04-16 16:02:58', '2023-04-16 16:02:58', 'cassin.eloisa@example.com', 'Ms. Maya Ankunding MD', 20906151097478, '$2y$10$LZvvNCiqos0xUEi2W0SuWedbzt12xljGHI/ziAy9f7fhUQJx8Bcwa', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(77, '2fefe0d5f04a69a370db92f91e23941e.png', '2023-04-16 16:03:02', '2023-04-16 16:03:02', 'nikita.bednar@example.com', 'Kole Haley', 22008156419860, '$2y$10$CFWrs4aCN2WYU18et5W7vuuUY0..SXCm5rhKyjgdY9FqcpjcZHrea', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(78, '0f39c8bedd218cff3ab75a9b81065b67.png', '2023-04-16 16:03:05', '2023-04-16 16:03:05', 'stanton.bailey@example.net', 'Ross Schamberger', 27910109320902, '$2y$10$avUhWd3hyhhfcKzf2BJXRe.gkdd9dshVW7PMoF94F5VmOxLK0CyAK', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(79, '3b7d39de6f4d6d581b72485f8572c450.png', '2023-04-16 16:03:09', '2023-04-16 16:03:09', 'alexie44@example.org', 'Prof. Daphnee Schamberger DVM', 29810024850637, '$2y$10$88QgLdEkAvJ5QsOb6ATZ3.JhXgcjmbfCH1IDUOFfJFK4piaDm0R7m', '2022-03-14 17:00:00', NULL, 'gym_manager', NULL, NULL),
(80, 'blank-profile-picture.png', '2023-04-16 16:18:52', '2023-04-16 16:18:52', 'mama@gmail.com', 'alif', 8573675228022, '$2y$10$NEp.jj0hEq5fn29Mgpnv9.a7DC0uuLnblaA0oESKBAAi1Q1FnrIE6', NULL, NULL, 'gym_member', NULL, NULL),
(81, 'img-643c87531bcae.jpg', '2023-04-16 16:40:03', '2023-04-16 16:40:03', 'diva@gmail.com', 'diva', 8223000018812, '$2y$10$gxsKLPfN6jQ9eh0AbhgzF.fOY3VnPb2F1ASnrr38VI/p6sMyKL7MS', NULL, NULL, 'gym_member', NULL, NULL),
(82, 'blank-profile-picture.png', '2023-04-16 18:52:04', '2023-04-16 18:52:04', 'test!@gmail.com', 'test', 8129, '$2y$10$WzjMaPVQRQsVTIRGk9SZTOToSUos6v.Yyk/9yIPJGDEdPA6I1jfbC', NULL, NULL, 'city_manager', NULL, NULL),
(83, 'blank-profile-picture.png', '2023-05-03 07:10:02', '2023-05-03 07:10:02', 'aaaa@gmail.com', 'sgfds', 81234567, '$2y$10$mRygK/saWLwphw0ifEoOmOY6ebDOuy7615.FiwCObu990Ds8pqIVu', NULL, NULL, 'city_manager', NULL, NULL),
(84, 'blank-profile-picture.png', '2023-05-03 07:34:46', '2023-05-03 07:34:46', 'aaa@gmail.com', 'aan', 8127282281, '$2y$10$pjQcgSSKihfs57jk3subHOYiVUz.kRPSu0LX/9K0KoSUakATtUKDS', NULL, NULL, 'city_manager', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

CREATE TABLE `weeks` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `program_id` bigint UNSIGNED NOT NULL,
  `week_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bans_bannable_type_bannable_id_index` (`bannable_type`,`bannable_id`),
  ADD KEY `bans_created_by_type_created_by_id_index` (`created_by_type`,`created_by_id`),
  ADD KEY `bans_expired_at_index` (`expired_at`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_name_unique` (`name`);

--
-- Indexes for table `city_managers`
--
ALTER TABLE `city_managers`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `city_managers_city_id_foreign` (`city_id`);

--
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coaches_gym_id_foreign` (`gym_id`);

--
-- Indexes for table `coach_training_session`
--
ALTER TABLE `coach_training_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coach_training_session_coach_id_foreign` (`coach_id`),
  ADD KEY `coach_training_session_training_session_id_foreign` (`training_session_id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercises_week_id_foreign` (`week_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gyms`
--
ALTER TABLE `gyms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gyms_city_manager_id_foreign` (`city_manager_id`),
  ADD KEY `gyms_city_id_foreign` (`city_id`);

--
-- Indexes for table `gym_managers`
--
ALTER TABLE `gym_managers`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gym_managers_gym_id_foreign` (`gym_id`);

--
-- Indexes for table `gym_members`
--
ALTER TABLE `gym_members`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `gym_member_training_session`
--
ALTER TABLE `gym_member_training_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gym_member_training_session_gym_member_id_foreign` (`gym_member_id`),
  ADD KEY `gym_member_training_session_training_session_id_foreign` (`training_session_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- Indexes for table `package_purchase`
--
ALTER TABLE `package_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_purchase_gym_member_id_foreign` (`gym_member_id`),
  ADD KEY `package_purchase_gym_id_foreign` (`gym_id`),
  ADD KEY `package_purchase_package_id_foreign` (`package_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
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
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `training_packages`
--
ALTER TABLE `training_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_sessions`
--
ALTER TABLE `training_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_sessions_gym_id_foreign` (`gym_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `weeks`
--
ALTER TABLE `weeks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weeks_program_id_foreign` (`program_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `coach_training_session`
--
ALTER TABLE `coach_training_session`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gyms`
--
ALTER TABLE `gyms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `gym_member_training_session`
--
ALTER TABLE `gym_member_training_session`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `package_purchase`
--
ALTER TABLE `package_purchase`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `training_packages`
--
ALTER TABLE `training_packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `training_sessions`
--
ALTER TABLE `training_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `weeks`
--
ALTER TABLE `weeks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city_managers`
--
ALTER TABLE `city_managers`
  ADD CONSTRAINT `city_managers_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `city_managers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coaches`
--
ALTER TABLE `coaches`
  ADD CONSTRAINT `coaches_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coach_training_session`
--
ALTER TABLE `coach_training_session`
  ADD CONSTRAINT `coach_training_session_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coach_training_session_training_session_id_foreign` FOREIGN KEY (`training_session_id`) REFERENCES `training_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_week_id_foreign` FOREIGN KEY (`week_id`) REFERENCES `weeks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gyms`
--
ALTER TABLE `gyms`
  ADD CONSTRAINT `gyms_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gyms_city_manager_id_foreign` FOREIGN KEY (`city_manager_id`) REFERENCES `city_managers` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `gym_managers`
--
ALTER TABLE `gym_managers`
  ADD CONSTRAINT `gym_managers_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gym_managers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gym_members`
--
ALTER TABLE `gym_members`
  ADD CONSTRAINT `gym_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gym_member_training_session`
--
ALTER TABLE `gym_member_training_session`
  ADD CONSTRAINT `gym_member_training_session_gym_member_id_foreign` FOREIGN KEY (`gym_member_id`) REFERENCES `gym_members` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gym_member_training_session_training_session_id_foreign` FOREIGN KEY (`training_session_id`) REFERENCES `training_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_purchase`
--
ALTER TABLE `package_purchase`
  ADD CONSTRAINT `package_purchase_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_purchase_gym_member_id_foreign` FOREIGN KEY (`gym_member_id`) REFERENCES `gym_members` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_purchase_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `training_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `training_sessions`
--
ALTER TABLE `training_sessions`
  ADD CONSTRAINT `training_sessions_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weeks`
--
ALTER TABLE `weeks`
  ADD CONSTRAINT `weeks_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
