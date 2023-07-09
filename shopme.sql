-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 09, 2023 at 05:09 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopme`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `region_id` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `street_number` varchar(30) NOT NULL,
  `building_number` varchar(30) NOT NULL,
  `zipcode` char(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `seller_id` (`seller_id`),
  KEY `region_id` (`region_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `buyer_id`, `seller_id`, `region_id`, `city`, `street_number`, `building_number`, `zipcode`, `created_at`, `updated_at`) VALUES
(11, NULL, 1, 1, 'Pnhom Penh', '123', '12d', '12343', '2023-07-04 13:57:45', '2023-07-04 13:57:45'),
(12, NULL, 6, 2, 'siem reap', '243', '12c', '12343', '2023-07-06 09:28:19', '2023-07-06 09:28:19'),
(13, NULL, 10, 15, 'hello', '222', '111', '123456', '2023-07-06 11:59:49', '2023-07-06 11:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `first_name`, `last_name`, `username`, `password`, `created_at`, `updated_at`, `remember_token`, `api_token`, `img_url`) VALUES
(1, 'Eav Long', 'Sok', 'esok', '$2y$10$iaNpkqUnHV2bh0ZufeMqH.IMlt/BEFcU17B2zH8.xmzL2Xu25rmQW', '2023-06-05 16:08:12', '2023-07-09 16:23:37', 'kr8Ki6AtahI4kDcMmtqamvusKJug93xqZV31QewYX0hBqAVm1HQsOS0xd4zE', '126|KTjMd2hQ3qvz0umRAjXBpiyPdBVhpn2WlXs01FHB', 'https://i.imgur.com/RVYIPvq.jpg'),
(2, 'New', 'Account', 'newacc', '$2y$10$JKf501u3NoJF65Bfm8mPw.FiutX5MBuH56GWvWrGit8MlPOve833W', '2023-06-20 02:11:26', '2023-06-20 02:24:08', '5WRHKZohhdQcwT3fAJO586bgFBLGEW5tBKPxrMYYtGSXCrvBNhr7Y8JW8SHz', '20|bNtTl7ARUi3STZ3fgdFULJCRKx0XmzYMqhYiNVK3', NULL),
(3, 'Nate', 'River', 'nateriver', '$2y$10$7/PyW8iVFitQHvtxAr79V.2IHk6HiHoycoyesouwB1KBWd3hVCNiq', '2023-07-06 03:13:26', '2023-07-06 03:13:26', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
CREATE TABLE IF NOT EXISTS `buyer` (
  `buyer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `banned_by` int(11) DEFAULT NULL,
  `banned_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`buyer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyer_id`, `first_name`, `last_name`, `email`, `password`, `img_url`, `date_of_birth`, `status`, `banned_by`, `banned_at`, `created_at`, `updated_at`, `remember_token`, `api_token`) VALUES
(1, 'Eav Long', 'Sok', 'esok@paragoniu.edu.kh', '$2y$10$5Q35kNn4EvbP/BI2VIFNqe5JM33y06WsONw2digOhsUtMgAs.J89m', 'https://i.imgur.com/fNVg2I4.jpg', '2000-01-01', 1, NULL, NULL, '2023-06-04 10:25:05', '2023-07-09 16:25:40', 'S6wHlYqneqWzkHMKnDbsgjpthLwTN3ASJ6jYfBisH4zhPbmXuG66vTZYqB9i', '128|ZTTX8PpcJzB6lzQ47dSrTV48F9Ie22UTVAEnU4tW'),
(2, 'Ly Sing', 'Lim', 'lysing@gmail.com', '$2y$10$dWKIglZJpUZ2v7UNbZ4NO.1ymDpCyonkZefx4keMu33Ma1BjJBrYC', NULL, '2000-07-04', 1, NULL, NULL, '2023-06-12 19:39:17', '2023-06-12 19:39:17', 'aUWzShooExMkgEF6rCYoiukNHiuB9v2S2MD2fMGUzfAodWUowiGcalWSxLc2', NULL),
(3, 'Michael', 'Jackson', 'mj@gmail.com', '$2y$10$vOonRsof4grhS8AeLwwOcOcZy1xbvFX0eSs78SACkQVQBnwzgOXMy', NULL, '2002-12-12', 1, NULL, NULL, '2023-06-12 19:44:57', '2023-06-12 19:44:57', 'kfDAXdszh4ypTX162CCud899iJE5zo250IW3STHCpeUt9GciLWxprKB7jOe4', NULL),
(4, 'New Account', 'Name', 'newaccount@gmail.com', '$2y$10$xDkMqAs8Q9as2yaH1LMHZuAOE6id03TfoP..sldwrHbW.ulXYQs9C', NULL, '2002-01-02', 1, NULL, NULL, '2023-06-17 08:34:52', '2023-06-17 08:34:53', 'mMuFLxN3fqvZLEdy4bKIJm73gkKdKgVNJKSTDVPxAlO6AHCRQAI3eEXS5MUj', '15|obRIykSpgwrqfsHej6ycTvKW5CVmY9suwNC1ArPs'),
(9, 'another', 'account', 'anotheraccount@gmail.com', '$2y$10$7o5Nt4yyTUBu.5WLLH6K3ur/9k./5bE2y2f1ev4Zn1z3mGsIXZHdi', NULL, '2007-07-06', 0, 1, '2023-07-05 17:50:19', '2023-07-02 17:30:59', '2023-07-02 17:30:59', 'p3snLLk0HL9glnXzXP3Oi4LoXAUOQ8G3KiORbBym1KNcCWt1gFeWFQWaEfnX', '85|tWTi0y3OQG2KJhPtp2yZyhtoDnZOErOwrNSliNiI'),
(10, 'hello', 'world', 'helloworld@gmail.com', '$2y$10$4fnoFAH1618LXFC03rxUeOkzTSpnxbMvFdJnAwVfoPZQnJErlF5s.', NULL, '2006-07-05', 1, NULL, NULL, '2023-07-02 17:37:12', '2023-07-02 17:37:12', NULL, '86|zRgx7vxllOoBBcbmxAS1gSHvtyrsOMU7tiKzjpAh'),
(11, 'another', 'test', 'anothertest@gmail.com', '$2y$10$D/1ZnHEv4iHjrwK8j.vcZ.kvJzAQW/NHHfkOZqIDUkF/kAf7PJa5q', NULL, '2023-06-28', 1, NULL, NULL, '2023-07-02 17:41:41', '2023-07-02 17:41:41', NULL, '88|fEcNTLG2AWMfp8d3IvfrxeBsWSEhNO8K4B6PYTyk'),
(12, 'final', 'test', 'finaltest@gmail.com', '$2y$10$FNqEeYZTtrGxmK/0pROicOoP42sx7XJ5.BBAQJx2e.pSqGW9RO99O', NULL, '2023-06-29', 1, NULL, NULL, '2023-07-02 17:43:06', '2023-07-02 17:43:06', NULL, '89|kCvV09xF5OVugWOW9i5Ihj0e2coUluoLhmusunzv'),
(13, 'Eav Long', 'Sok', 'eavlongsok@gmail.com', '$2y$10$4pasvH01LXTiHuNv9AUUV.bizTuutj7g0eu5Qv08l5FEl2PM4r/OK', NULL, '2000-07-26', 1, NULL, NULL, '2023-07-04 06:20:22', '2023-07-04 06:20:22', NULL, '94|4OMWa8JLfQ4NCUsIXtSzcgMqdvk6HIHAGWUiHa5x'),
(14, 'Testing', 'Account', 'testingaccount@gmail.com', '$2y$10$JiGwt4hYqwWfVr1mRMyXMuX2Jyuc40mU6rOIQeYtjJyVJA6jsnGpK', NULL, '2023-07-14', 1, NULL, NULL, '2023-07-04 06:23:26', '2023-07-04 06:23:26', NULL, '96|qYcXZgflfVFnmdsxywemO8WqERI4pSit63BSTyMm'),
(15, 'test', 'account', 'atest@gmail.com', '$2y$10$x14e0aAjRgb0KkQWMsYDNOYgzeKCoug9SP58ZBHTlfZoX9C81bltq', NULL, '2011-07-20', 1, NULL, NULL, '2023-07-04 06:24:52', '2023-07-04 06:24:52', NULL, '97|tL9ofedoKnCQr7fCLh5NkjoEYAodG97OQRd0MJ7x'),
(16, 'another', 'test', 'anothertests@gmail.com', '$2y$10$3Z3HfUOWSuZaGjVEVVy6M.lirqx3UoNBL6g.bf018Eaa2oxjdBHK.', NULL, '2023-07-20', 1, NULL, NULL, '2023-07-04 06:25:46', '2023-07-04 06:25:46', NULL, '98|pNQKXgZAH2PWjKhBY6TQiSaslP1umuiigkuqc3l3');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(15, 'Industrial And Scientific'),
(14, 'Toys And Games'),
(13, 'Sports And Outdoors'),
(12, 'Clothing'),
(16, 'Tools And Home Appliances'),
(17, 'Books And Movies'),
(18, 'Furniture'),
(19, 'Health And Beauty'),
(20, 'Pet Supplies'),
(21, 'Baby Essentials'),
(22, 'Electronics'),
(23, 'Arts');

-- --------------------------------------------------------

--
-- Table structure for table `listing_request`
--

DROP TABLE IF EXISTS `listing_request`;
CREATE TABLE IF NOT EXISTS `listing_request` (
  `list_req_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`list_req_id`),
  KEY `product_id` (`product_id`),
  KEY `approved_by` (`approved_by`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `listing_request`
--

INSERT INTO `listing_request` (`list_req_id`, `product_id`, `approved_by`, `approved_at`, `created_at`) VALUES
(3, 3, 1, '2023-06-13', '2023-06-13 20:43:13'),
(2, 2, 1, '2023-06-13', '2023-06-13 08:45:38'),
(82, 82, 1, '2023-07-06', '2023-07-06 12:02:08'),
(5, 5, NULL, NULL, '2023-06-25 13:41:11'),
(6, 6, NULL, NULL, '2023-06-26 17:27:24'),
(7, 7, NULL, NULL, '2023-06-26 17:29:01'),
(8, 8, NULL, NULL, '2023-06-26 17:30:04'),
(9, 9, NULL, NULL, '2023-06-26 18:58:49'),
(10, 10, 1, '2023-07-03', '2023-06-29 11:22:14'),
(11, 11, 1, '2023-07-03', '2023-06-29 11:24:08'),
(12, 12, 1, '2023-07-03', '2023-06-29 11:26:13'),
(13, 13, 1, '2023-07-03', '2023-06-29 11:27:50'),
(14, 14, 1, '2023-07-03', '2023-06-29 11:28:45'),
(15, 15, 1, '2023-07-03', '2023-06-29 11:30:04'),
(16, 16, 1, '2023-07-03', '2023-06-29 11:33:17'),
(17, 17, 1, '2023-07-03', '2023-06-29 11:34:20'),
(18, 18, 1, '2023-07-03', '2023-06-29 11:35:08'),
(19, 19, 1, '2023-07-03', '2023-06-29 11:35:56'),
(20, 20, 1, '2023-07-03', '2023-06-29 11:36:48'),
(22, 22, 1, '2023-07-03', '2023-06-29 11:38:45'),
(23, 23, 1, '2023-07-03', '2023-06-29 11:39:28'),
(24, 24, 1, '2023-07-03', '2023-06-29 11:41:45'),
(25, 25, 1, '2023-07-03', '2023-06-29 11:43:05'),
(26, 26, 1, '2023-07-03', '2023-06-29 11:46:12'),
(27, 27, 1, '2023-07-03', '2023-06-29 11:47:08'),
(28, 28, 1, '2023-07-03', '2023-06-29 11:49:04'),
(29, 29, 1, '2023-07-03', '2023-06-29 11:50:06'),
(30, 30, 1, '2023-07-03', '2023-06-29 11:50:42'),
(31, 31, 1, '2023-07-03', '2023-06-29 11:51:14'),
(32, 32, 1, '2023-07-03', '2023-06-29 11:51:56'),
(33, 33, 1, '2023-07-03', '2023-06-29 11:52:30'),
(34, 34, 1, '2023-07-06', '2023-06-29 11:53:07'),
(35, 35, 1, '2023-07-06', '2023-06-29 11:53:41'),
(36, 36, 1, '2023-07-06', '2023-06-29 11:54:21'),
(37, 37, 1, '2023-07-06', '2023-06-29 11:54:59'),
(38, 38, 1, '2023-07-06', '2023-06-29 12:09:39'),
(39, 39, 1, '2023-07-06', '2023-06-29 12:10:23'),
(40, 40, NULL, NULL, '2023-06-29 12:13:41'),
(41, 41, 1, '2023-07-06', '2023-06-29 12:14:14'),
(42, 42, 1, '2023-07-06', '2023-06-29 12:14:58'),
(43, 43, 1, '2023-07-06', '2023-06-29 12:17:49'),
(44, 44, 1, '2023-07-06', '2023-06-29 13:21:33'),
(45, 45, 1, '2023-07-06', '2023-06-29 13:22:13'),
(46, 46, 1, '2023-07-06', '2023-06-29 13:22:42'),
(47, 47, 1, '2023-07-06', '2023-06-29 13:23:45'),
(48, 48, 1, '2023-07-06', '2023-06-29 13:25:14'),
(49, 49, 1, '2023-07-06', '2023-06-29 13:26:33'),
(50, 50, NULL, NULL, '2023-06-29 13:26:44'),
(51, 51, 1, '2023-07-06', '2023-06-29 13:29:39'),
(52, 52, 1, '2023-07-06', '2023-06-29 13:30:43'),
(53, 53, 1, '2023-07-06', '2023-06-29 13:31:44'),
(54, 54, 1, '2023-07-06', '2023-06-29 13:32:40'),
(55, 55, 1, '2023-07-06', '2023-06-29 13:33:18'),
(56, 56, 1, '2023-07-06', '2023-06-29 13:34:08'),
(57, 57, 1, '2023-07-06', '2023-06-29 13:35:24'),
(58, 58, 1, '2023-07-06', '2023-06-29 13:36:08'),
(59, 59, 1, '2023-07-06', '2023-06-29 13:36:48'),
(60, 60, 1, '2023-07-06', '2023-06-29 13:37:31'),
(61, 61, 1, '2023-07-06', '2023-06-29 13:38:09'),
(62, 62, 1, '2023-07-06', '2023-06-29 13:39:28'),
(63, 63, 1, '2023-07-06', '2023-06-29 13:41:06'),
(64, 64, 1, '2023-07-06', '2023-06-29 13:41:47'),
(65, 65, 1, '2023-07-06', '2023-06-29 13:42:28'),
(66, 66, 1, '2023-07-06', '2023-06-29 13:43:12'),
(67, 67, 1, '2023-07-06', '2023-06-29 13:43:54'),
(68, 68, 1, '2023-07-06', '2023-06-29 13:44:35'),
(69, 69, NULL, NULL, '2023-06-29 13:45:13'),
(70, 70, 1, '2023-07-06', '2023-06-29 13:47:30'),
(71, 71, 1, '2023-07-06', '2023-06-29 13:48:02'),
(72, 72, 1, '2023-07-06', '2023-06-29 13:48:34'),
(73, 73, 1, '2023-07-06', '2023-06-29 13:49:07'),
(74, 74, 1, '2023-07-06', '2023-06-29 13:49:37'),
(75, 75, 1, '2023-07-06', '2023-06-29 13:50:31'),
(76, 76, NULL, NULL, '2023-06-29 13:52:32'),
(77, 77, NULL, NULL, '2023-06-29 13:53:38'),
(78, 78, NULL, NULL, '2023-06-29 13:54:13'),
(79, 79, NULL, NULL, '2023-06-29 13:55:17'),
(80, 80, NULL, NULL, '2023-06-29 13:55:51'),
(81, 81, 1, '2023-07-06', '2023-07-06 09:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
CREATE TABLE IF NOT EXISTS `logistics` (
  `logistics_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`logistics_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logistics`
--

INSERT INTO `logistics` (`logistics_id`, `first_name`, `last_name`, `username`, `password`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'Eav Long', 'Sok', 'esok', '$2a$10$W/oP88YBcytyINlUs.z0Z.Fsgx3fDvFwnZldXUskAzHx06axZZ4rK', '2023-06-06 02:00:18', '2023-06-06 02:00:18', 'irugEDL3P0PeUzTCbz83ljV6kMMnp4mMUc25a7dUELWey0Z0sHjASBT1htiD');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2023_06_04_155850_create_buyer_table', 1),
(2, '2023_06_04_155905_create_seller_table', 1),
(6, '2023_06_01_164536_create_admins_table', 4),
(7, '2023_06_05_070511_create_logistics_table', 5),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `seller_id` (`seller_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `buyer_id`, `seller_id`, `total_price`, `created_at`) VALUES
(5, 1, 1, '646.97', '2023-07-06 02:08:40'),
(10, 1, 1, '93.96', '2023-07-06 10:56:17'),
(9, 1, 6, '110.00', '2023-07-06 10:07:00'),
(11, 1, 1, '599.99', '2023-07-06 10:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `created_at`) VALUES
(13, 9, 81, 1, '2023-07-06 10:07:00'),
(14, 10, 29, 2, '2023-07-06 10:56:17'),
(9, 5, 32, 1, '2023-07-06 02:08:40'),
(8, 5, 28, 1, '2023-07-06 02:08:40'),
(7, 5, 29, 1, '2023-07-06 02:08:40'),
(15, 10, 32, 2, '2023-07-06 10:56:17'),
(16, 11, 28, 1, '2023-07-06 10:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Admin', 1, '1686656126', 'd70c4b8a7a384d46715ef9c920c73f118ea98e46d2e3ae05b02fcfc79943630d', '[\"*\"]', '2023-06-13 05:36:55', '2023-06-13 04:35:26', '2023-06-13 05:36:55'),
(2, 'App\\Models\\Admin', 1, '1686659856', '4a8018cd8ebc305a5e189df7f4867ba7d18f161f1eff5af6a4a342621fb950ea', '[\"*\"]', '2023-06-13 05:38:34', '2023-06-13 05:37:36', '2023-06-13 05:38:34'),
(3, 'App\\Models\\Seller', 1, '1686662347', '2cdd15a1dd29c52047ca7b758158a8fd9826202024617543edd3c6970a1210a5', '[\"*\"]', NULL, '2023-06-13 06:19:07', '2023-06-13 06:19:07'),
(4, 'App\\Models\\Seller', 1, '1686662716', '12db9c5924ed66ec6c957ef5a5f48aa84c46ae5bdcd8c4eb430b886dc4674de1', '[\"*\"]', NULL, '2023-06-13 06:25:16', '2023-06-13 06:25:16'),
(5, 'App\\Models\\Seller', 1, '1686662811', 'a8d27d96620630462bac110ec2061e1b59ee88f5377591483436e9260848a6fb', '[\"*\"]', '2023-06-13 06:43:13', '2023-06-13 06:26:51', '2023-06-13 06:43:13'),
(6, 'App\\Models\\Admin', 1, '1686664384', 'ab9d097288a4c430d6d942981b555ec8c7694f8ef356bd279bc409ee464ea425', '[\"*\"]', '2023-06-13 06:58:51', '2023-06-13 06:53:04', '2023-06-13 06:58:51'),
(7, 'App\\Models\\Admin', 1, '1686705646', 'b41da553517466b51e7180263f1e7496319292c8b6b8b86b445f05ccd3751b0e', '[\"*\"]', NULL, '2023-06-13 18:20:46', '2023-06-13 18:20:46'),
(8, 'App\\Models\\Admin', 1, '1686705729', '1583a34c29523ba4666efb97607aa450a28cb4e157c68c8a98763805a0a9fd4c', '[\"*\"]', NULL, '2023-06-13 18:22:09', '2023-06-13 18:22:09'),
(9, 'App\\Models\\Admin', 1, '1686709654', '94ad362e8abc4b768d0ae02209304478146091a06566c8f02744304ae7841ed5', '[\"*\"]', '2023-06-23 05:35:01', '2023-06-13 19:27:34', '2023-06-23 05:35:01'),
(10, 'App\\Models\\Seller', 1, '1686820250', '114e91fdadbdf61117109d27d8a362968c887b37f43ef0a3422d32403d7a0cf9', '[\"*\"]', '2023-06-20 01:38:12', '2023-06-15 02:10:50', '2023-06-20 01:38:12'),
(11, 'App\\Models\\Seller', 1, '1687007275', '141adc3c871ba04ef8595b11f8ec607f5ee7f51a20a070891b1393aa57d9577e', '[\"*\"]', NULL, '2023-06-17 06:07:55', '2023-06-17 06:07:55'),
(12, 'App\\Models\\Seller', 1, '1687007304', 'ecb60ac9d800618967dd40f3647511a3598716e0fe18dc638f4e725cb4db2b24', '[\"*\"]', NULL, '2023-06-17 06:08:24', '2023-06-17 06:08:24'),
(13, 'App\\Models\\Seller', 1, '1687007361', '64f6da04267c62514df59e0a19ccc889d15b216dd63c1f5c11e1a6d34aaed68c', '[\"*\"]', NULL, '2023-06-17 06:09:21', '2023-06-17 06:09:21'),
(14, 'App\\Models\\Seller', 1, '1687007412', '3e8a3fd950dea3761106f85bfb2b600756ed8b465b7404817d758b34216f2a2b', '[\"*\"]', NULL, '2023-06-17 06:10:12', '2023-06-17 06:10:12'),
(15, 'App\\Models\\Buyer', 4, '1687016093', 'a0863d40a4d60a3aa8a3a97e4c53191d9fac1487d15bf7f6d0458e4e0d35f08d', '[\"*\"]', NULL, '2023-06-17 08:34:53', '2023-06-17 08:34:53'),
(16, 'App\\Models\\Seller', 2, '1687016559', 'fdc881eaf3bee3d3c0af9f882d2bb71e69804492382bdb5706ec1333c37a5846', '[\"*\"]', NULL, '2023-06-17 08:42:39', '2023-06-17 08:42:39'),
(17, 'App\\Models\\Seller', 3, '1687016802', 'ec56c539fa2527a536cac81b07c7570f4366b1e6fb08345f935e1ee8682ffd35', '[\"*\"]', NULL, '2023-06-17 08:46:42', '2023-06-17 08:46:42'),
(18, 'App\\Models\\Admin', 1, '1687222743', '64512a6e52d278a744ed2889a8ede291139045579abf0ffc3b22b47cc9057829', '[\"*\"]', '2023-06-20 02:22:52', '2023-06-20 00:59:03', '2023-06-20 02:22:52'),
(19, 'App\\Models\\Admin', 2, '1687227086', 'ccc7e5cc6d2e2efe1ab0df40ea2b4728ca7226a050745354d853f643e92c145b', '[\"*\"]', '2023-06-20 02:20:16', '2023-06-20 02:11:26', '2023-06-20 02:20:16'),
(20, 'App\\Models\\Admin', 2, '1687227848', '7834302ed76a1c51298e794dd1fa243c7dc25c54992c0651a10513f0c63f6cb2', '[\"*\"]', '2023-06-23 06:11:44', '2023-06-20 02:24:08', '2023-06-23 06:11:44'),
(21, 'App\\Models\\Buyer', 1, '1687228195', 'ebeba6a309dec2719552b7a0865db48312b5c30e5b1e1e5029f4f7522935d6e1', '[\"*\"]', NULL, '2023-06-19 19:29:55', '2023-06-19 19:29:55'),
(22, 'App\\Models\\Seller', 1, '1687231231', '6d6488a417386d60c2cf3937304e94060dd5c60c97a218de69693a8e7adb357c', '[\"*\"]', '2023-06-19 23:45:58', '2023-06-19 20:20:31', '2023-06-19 23:45:58'),
(23, 'App\\Models\\Seller', 1, '1687243580', 'b3c6348da6c62fa4e566269414a284301276a8824106f2cf4fee7324da0ea1cc', '[\"*\"]', '2023-06-20 00:25:18', '2023-06-19 23:46:20', '2023-06-20 00:25:18'),
(24, 'App\\Models\\Seller', 1, '1687246032', '46b97956665a6d45a91681a876376f290be8188a5c559b3919cfc0cfcc22b77a', '[\"*\"]', '2023-06-20 00:28:03', '2023-06-20 00:27:12', '2023-06-20 00:28:03'),
(25, 'App\\Models\\Seller', 1, '1687248608', 'c1413b2f9c8be3ced09dbeb842db5344bd4f3ab269b59a2cabfbff3503f5620f', '[\"*\"]', NULL, '2023-06-20 01:10:08', '2023-06-20 01:10:08'),
(26, 'App\\Models\\Seller', 1, '1687249597', '1e1bfc1ce1d77f1045fca98821c07f30ebfee74a6b8c99d62802ddf167c49163', '[\"*\"]', NULL, '2023-06-20 01:26:37', '2023-06-20 01:26:37'),
(27, 'App\\Models\\Buyer', 1, '1687249865', '8ecf04f90afdf43cc7915829d9cb9d2f01adbb599ebd7a9683e8e60c96d9f414', '[\"*\"]', '2023-06-21 15:29:01', '2023-06-20 01:31:05', '2023-06-21 15:29:01'),
(28, 'App\\Models\\Seller', 1, '1687250288', '4520fb4f952674e8b8637d85c89158b8cbe7cf21df4003ed0f18ca33205f3d80', '[\"*\"]', NULL, '2023-06-20 01:38:08', '2023-06-20 01:38:08'),
(29, 'App\\Models\\Seller', 1, '1687422139', '868aba16275a8948b0735b9ca47abe3ca746566690deb30f57aa20591477c34d', '[\"*\"]', '2023-06-25 08:33:52', '2023-06-22 01:22:19', '2023-06-25 08:33:52'),
(30, 'App\\Models\\Admin', 1, '1687501311', '78e22b0441996e67864a2397059bb77f21afc5e77fb3e4e11a70b941fc3a3946', '[\"*\"]', '2023-06-23 06:24:46', '2023-06-23 06:21:51', '2023-06-23 06:24:46'),
(31, 'App\\Models\\Seller', 1, '1687501675', '688e117d313eb970c8e551df403361547040852d6023f959129ed83c162b8e13', '[\"*\"]', NULL, '2023-06-22 23:27:55', '2023-06-22 23:27:55'),
(32, 'App\\Models\\Seller', 1, '1687501773', '695376f39bf50c69254a9d93ca83f9c4a0fcd4cb10aa3349516255d7e5fad75d', '[\"*\"]', NULL, '2023-06-22 23:29:33', '2023-06-22 23:29:33'),
(33, 'App\\Models\\Seller', 1, '1687537117', '9ac41915aa4714a1307e90a556494d542fa0b426fb3cab320188da63c11d6aac', '[\"*\"]', NULL, '2023-06-23 09:18:37', '2023-06-23 09:18:37'),
(34, 'App\\Models\\Buyer', 1, '1687589087', '166b0bdb4554a15c0e5ba105f1ffd26dfa256ca0f914a428ede69ea3a35dbf10', '[\"*\"]', NULL, '2023-06-23 23:44:47', '2023-06-23 23:44:47'),
(35, 'App\\Models\\Seller', 1, '1687589824', 'aa9f8c706f960ba939139961c30e57349cfa388412e4d350cfc70689dfc80245', '[\"*\"]', NULL, '2023-06-23 23:57:04', '2023-06-23 23:57:04'),
(36, 'App\\Models\\Buyer', 1, '1687589840', '0e4709e1443eecc056f576935f43c5e4a4b3b814d619f3e012a4451b3f5a2bea', '[\"*\"]', NULL, '2023-06-23 23:57:20', '2023-06-23 23:57:20'),
(37, 'App\\Models\\Seller', 1, '1687590120', '7706760b70e8afdb5d9539079e261a44408cfb19a43aabc3a8d226b59b3f40c4', '[\"*\"]', NULL, '2023-06-24 00:02:00', '2023-06-24 00:02:00'),
(38, 'App\\Models\\Admin', 1, '1687591015', '9146869456cf6049e89ceb78b34fb57ee96ee01acbaa0de6f7b287eaba867c4f', '[\"*\"]', '2023-06-24 07:16:57', '2023-06-24 07:16:56', '2023-06-24 07:16:57'),
(39, 'App\\Models\\Admin', 1, '1687591038', '38d698473ace94e30fb74f5c2530a3cc84d8501c36ea11efd9cf25203e42ddf5', '[\"*\"]', '2023-06-24 07:56:16', '2023-06-24 07:17:18', '2023-06-24 07:56:16'),
(40, 'App\\Models\\Admin', 1, '1687600049', '40ba049399fb85d038dbf6d3ecaabc69f87bc41af1f0ca6c3c4f001d24de03dd', '[\"*\"]', '2023-06-24 10:17:05', '2023-06-24 09:47:29', '2023-06-24 10:17:05'),
(41, 'App\\Models\\Admin', 1, '1687601852', 'b539248903c1756f24a51b6fe22770a8ba935b03a3f931bbbf88e34467701621', '[\"*\"]', '2023-06-25 12:01:53', '2023-06-24 10:17:32', '2023-06-25 12:01:53'),
(42, 'App\\Models\\Admin', 1, '1687613525', 'fa444f671ff266053cc0ed0807bc9be97f5f42d5cd5728bccdc6327342176ab6', '[\"*\"]', '2023-06-25 09:38:50', '2023-06-24 13:32:05', '2023-06-25 09:38:50'),
(43, 'App\\Models\\Admin', 1, '1687694601', 'c04d09c22760215fa849cf607332f7d787a17e565eefdf956b2848154f6e510b', '[\"*\"]', '2023-06-25 12:03:22', '2023-06-25 12:03:21', '2023-06-25 12:03:22'),
(44, 'App\\Models\\Admin', 1, '1687694634', 'c8fd9eed974befdce0e01786f4d922316d428b31afadb7c57afe20750296c0ae', '[\"*\"]', '2023-06-25 12:03:55', '2023-06-25 12:03:54', '2023-06-25 12:03:55'),
(45, 'App\\Models\\Admin', 1, '1687694656', 'e01fa9fec841f171a23616ef8ad4136acab559a309839581559730aa1ceeb2e3', '[\"*\"]', '2023-06-25 12:04:17', '2023-06-25 12:04:16', '2023-06-25 12:04:17'),
(46, 'App\\Models\\Admin', 1, '1687694701', '88cc792bfc927131976fd011fc0061cd9be9221ddc79b05b18c50adf793ac9b8', '[\"*\"]', '2023-06-25 12:05:02', '2023-06-25 12:05:01', '2023-06-25 12:05:02'),
(47, 'App\\Models\\Admin', 1, '1687695734', 'b96805c46940f6b6b44fd026fff8772f34b6cc54dfe88516fbad7f985c1be5a2', '[\"*\"]', '2023-06-25 12:22:15', '2023-06-25 12:22:14', '2023-06-25 12:22:15'),
(48, 'App\\Models\\Admin', 1, '1687695946', '7a961984a480a3bfb6ae633940f75136272904804f59bb3e261f035d82bec254', '[\"*\"]', '2023-06-25 12:25:47', '2023-06-25 12:25:46', '2023-06-25 12:25:47'),
(49, 'App\\Models\\Admin', 1, '1687698013', '44edb009aadaab11460efaee91db9a2ae9684e09cf5fc40b79356b6c0c4c9764', '[\"*\"]', '2023-06-25 13:00:14', '2023-06-25 13:00:13', '2023-06-25 13:00:14'),
(50, 'App\\Models\\Seller', 1, '1687699362', '4aa5235f7fa3bf5d232a9b09b340cb5cb943050216f09487d77ac5f9b44d5fd9', '[\"*\"]', NULL, '2023-06-25 06:22:42', '2023-06-25 06:22:42'),
(51, 'App\\Models\\Buyer', 1, '1687699377', 'bca74decaf285527a34296c7193be2c65d3ce889c3e89eb15b88724fdc48a9cd', '[\"*\"]', NULL, '2023-06-25 06:22:57', '2023-06-25 06:22:57'),
(52, 'App\\Models\\Seller', 1, '1687701443', '84ed97f6f0ec4cc7098e14164fb1c58185ecf72fa24667e1cac82a653c1c5f26', '[\"*\"]', NULL, '2023-06-25 06:57:23', '2023-06-25 06:57:23'),
(53, 'App\\Models\\Buyer', 1, '1687706705', '3d2155c383a4e5fac50cca2114ed9398c5da2aa9a05fd0ec6c61afa123cd63c7', '[\"*\"]', NULL, '2023-06-25 08:25:05', '2023-06-25 08:25:05'),
(54, 'App\\Models\\Seller', 1, '1687707713', 'c3455fcf8bce22af11a3a34e89f4d28b9c55f98d1f95016d0625db33bfbad18f', '[\"*\"]', NULL, '2023-06-25 08:41:53', '2023-06-25 08:41:53'),
(55, 'App\\Models\\Admin', 1, '1687709998', '6c67e276d232d8e84f8593db0f951b58e7f9f691b60f5bdd1da16c891f6013a5', '[\"*\"]', '2023-06-26 10:53:54', '2023-06-25 16:19:58', '2023-06-26 10:53:54'),
(56, 'App\\Models\\Buyer', 1, '1687748915', '6970cca384a401f84b1e7ebfe07d6db673f6c95c4f49e426034264cf9a591896', '[\"*\"]', NULL, '2023-06-25 20:08:35', '2023-06-25 20:08:35'),
(57, 'App\\Models\\Admin', 1, '1687778034', '64186d49a120660e55b4d067a26fd897d19ff103dd678bbbab6eda0d722446dd', '[\"*\"]', '2023-06-26 11:15:08', '2023-06-26 11:13:54', '2023-06-26 11:15:08'),
(58, 'App\\Models\\Buyer', 1, '1687836771', 'd81059f6be8cfc2aadcb053ac8f71bda7349aae6cb52270f59932754a894482a', '[\"*\"]', NULL, '2023-06-26 20:32:51', '2023-06-26 20:32:51'),
(59, 'App\\Models\\Seller', 1, '1687836875', '79af1c1a926bae8447068a2a493f72773c7baa98675f43abbab1f36be7967a85', '[\"*\"]', '2023-07-06 04:04:51', '2023-06-26 20:34:35', '2023-07-06 04:04:51'),
(60, 'App\\Models\\Seller', 1, '1687852645', '917d65153f3d9469f8079f4a6e10e9a0cb27e91b982ea99aef7c225e89fbfb8f', '[\"*\"]', NULL, '2023-06-27 00:57:25', '2023-06-27 00:57:25'),
(61, 'App\\Models\\Admin', 1, '1687853024', '786cf1ee2abfdf2f26a3b708175bca496871aec5c92571eec92d460ad19863da', '[\"*\"]', '2023-06-27 15:42:38', '2023-06-27 08:03:44', '2023-06-27 15:42:38'),
(62, 'App\\Models\\Buyer', 1, '1687854521', '6cc7e8fb70beaac2a91310c20c5d4c6bbcdd0d892adf511731ff1623f25e0e81', '[\"*\"]', NULL, '2023-06-27 01:28:41', '2023-06-27 01:28:41'),
(63, 'App\\Models\\Buyer', 1, '1687854558', '65dd28d800552fec01d5b4876b632dc6a915dbe8a5585f3a963a14cf21fbdf17', '[\"*\"]', NULL, '2023-06-27 01:29:18', '2023-06-27 01:29:18'),
(64, 'App\\Models\\Seller', 1, '1687855254', '45dd508e4d9337ee368996aa1484b689ade835234580982fb6414f0bb9e6d13b', '[\"*\"]', NULL, '2023-06-27 01:40:54', '2023-06-27 01:40:54'),
(65, 'App\\Models\\Buyer', 1, '1687873725', 'c4c5b058f619d3f945156e63415d60eb6d05b59cae75e060ba85c4bc8b0d25a3', '[\"*\"]', NULL, '2023-06-27 06:48:45', '2023-06-27 06:48:45'),
(66, 'App\\Models\\Buyer', 1, '1687881436', '384fbabb32eede1e3084d9edd72786b78494fe593cc82ab922eed43cb773a8b4', '[\"*\"]', NULL, '2023-06-27 08:57:16', '2023-06-27 08:57:16'),
(67, 'App\\Models\\Seller', 1, '1687881447', '8eb93a6ad499453cc515a63ba999b85c9486b62f8fbc24deba6ef5e8e75b2a71', '[\"*\"]', NULL, '2023-06-27 08:57:27', '2023-06-27 08:57:27'),
(68, 'App\\Models\\Admin', 1, '1687937598', 'bb7394067dae9bc547a1761cd01a8bba813155c6c8ac6a95a589b3150843d4a6', '[\"*\"]', '2023-06-28 08:26:35', '2023-06-28 07:33:18', '2023-06-28 08:26:35'),
(69, 'App\\Models\\Admin', 1, '1687940805', 'f1eab18779e206b5906a1092527a4d1105dc26e3f11a18b99600a6d377060e76', '[\"*\"]', '2023-06-29 08:38:50', '2023-06-28 08:26:45', '2023-06-29 08:38:50'),
(70, 'App\\Models\\Buyer', 1, '1688031793', '1aab87754914c4046883a7df5deff0363943b6d2ca1289ad6e88cd06d787682c', '[\"*\"]', NULL, '2023-06-29 09:43:13', '2023-06-29 09:43:13'),
(71, 'App\\Models\\Buyer', 1, '1688046561', '822fc15c5e8c7fca23adc044cfdd761c7a7f94f73ea959c8473741a1f8260a0b', '[\"*\"]', '2023-06-30 16:45:41', '2023-06-29 13:49:21', '2023-06-30 16:45:41'),
(72, 'App\\Models\\Buyer', 1, '1688108133', '4c065ddd3319ded77e3495ef60294e06e420cde66583e9da14d6c928b76e5686', '[\"*\"]', NULL, '2023-06-30 06:55:33', '2023-06-30 06:55:33'),
(73, 'App\\Models\\Buyer', 1, '1688315716', 'f057aaa5bbfc6417b9ab4e86068c18d4703d107e8b3da1443097987d8961536e', '[\"*\"]', NULL, '2023-07-02 16:35:16', '2023-07-02 16:35:16'),
(74, 'App\\Models\\Buyer', 1, '1688315829', '500919366f4f063e35aded4574d8df79a68df5dfb03d1a06aa3275fc814abf15', '[\"*\"]', NULL, '2023-07-02 16:37:09', '2023-07-02 16:37:09'),
(75, 'App\\Models\\Seller', 4, '1688317564', '65a871f340976add7a37de60b4334fc515bf633d659d909e21d25080a75a92a4', '[\"*\"]', NULL, '2023-07-02 17:06:04', '2023-07-02 17:06:04'),
(76, 'App\\Models\\Buyer', 5, '1688317929', '2d2a74459f9e361f39795fbd1ecfa815676a2b31d92d0331cc4e1b6f03f5dd95', '[\"*\"]', NULL, '2023-07-02 17:12:09', '2023-07-02 17:12:09'),
(77, 'App\\Models\\Buyer', 6, '1688318147', '484879b3be00c8aac6f7e24288463157e765e0a6ee852baf536f0c8e8813d833', '[\"*\"]', NULL, '2023-07-02 17:15:47', '2023-07-02 17:15:47'),
(78, 'App\\Models\\Buyer', 6, '1688318147', 'c436239015bf81afbb2ace95994371b6adce589c87dee0267be686a4de395ddf', '[\"*\"]', NULL, '2023-07-02 17:15:47', '2023-07-02 17:15:47'),
(79, 'App\\Models\\Seller', 5, '1688318510', '1e214635c934a0799ee49739dd5d732ad859ff3d137727ea73ebf12027697b4d', '[\"*\"]', NULL, '2023-07-02 17:21:50', '2023-07-02 17:21:50'),
(80, 'App\\Models\\Seller', 5, '1688318510', 'e28691c1dced6669e960c2ce67a99c967398585a58a35d42ffbc5941e0ab7049', '[\"*\"]', NULL, '2023-07-02 17:21:50', '2023-07-02 17:21:50'),
(81, 'App\\Models\\Buyer', 7, '1688318560', 'a88feb91af49a249eb6f72ec3beaa962da02f2dee9ebe54f2f29d47bca9d5982', '[\"*\"]', NULL, '2023-07-02 17:22:40', '2023-07-02 17:22:40'),
(82, 'App\\Models\\Buyer', 7, '1688318560', 'eb78394625f4073189935d2f93096bcfa05965f74abbf7dc21f2a4d24a283ed7', '[\"*\"]', NULL, '2023-07-02 17:22:40', '2023-07-02 17:22:40'),
(83, 'App\\Models\\Buyer', 8, '1688318902', 'a5b48f944b0a714e188cbb95f7bced46ef2985631aa455f92d7a8d7431b7b8dd', '[\"*\"]', NULL, '2023-07-02 17:28:22', '2023-07-02 17:28:22'),
(84, 'App\\Models\\Seller', 6, '1688318966', '1eee3aa1e0e731a379be18ce064a47a9a0d41365d6a792a79dfd85b2c15dfee6', '[\"*\"]', NULL, '2023-07-02 17:29:26', '2023-07-02 17:29:26'),
(85, 'App\\Models\\Buyer', 9, '1688319059', '4567002c415c5fd04d551472e7cad0339c7673e9af6a6708d2edee2bc1507870', '[\"*\"]', NULL, '2023-07-02 17:30:59', '2023-07-02 17:30:59'),
(86, 'App\\Models\\Buyer', 10, '1688319432', 'd01eb1e9f96f92fc823f98986b164f17ac72ea612d1c1ffcefbe2028b85a9eb0', '[\"*\"]', NULL, '2023-07-02 17:37:12', '2023-07-02 17:37:12'),
(87, 'App\\Models\\Seller', 7, '1688319608', '51fb39a15d89ba4e91153b7f03ee7f309837b14dad50c39c296261a29ae69ea5', '[\"*\"]', NULL, '2023-07-02 17:40:08', '2023-07-02 17:40:08'),
(88, 'App\\Models\\Buyer', 11, '1688319701', 'd2b72259072eee87874868d14a4041b0d7ad0da006e5e787d23ed5463bfa5cf7', '[\"*\"]', NULL, '2023-07-02 17:41:41', '2023-07-02 17:41:41'),
(89, 'App\\Models\\Buyer', 12, '1688319786', '0a670ffaefb025f8296894d731cb5f72cd485cbe8ec15d36834fbf67a37f012a', '[\"*\"]', NULL, '2023-07-02 17:43:06', '2023-07-02 17:43:06'),
(90, 'App\\Models\\Seller', 8, '1688319846', '6f6eeb64276f754f547076304e0d2e64c569a60957e71f85351d1489ee83596b', '[\"*\"]', NULL, '2023-07-02 17:44:06', '2023-07-02 17:44:06'),
(91, 'App\\Models\\Buyer', 1, '1688319947', 'd40fbdf37c32ceacb4ab5019a93696fb4a6ff7623818528e4d485f8f4bb65651', '[\"*\"]', NULL, '2023-07-02 17:45:47', '2023-07-02 17:45:47'),
(92, 'App\\Models\\Admin', 1, '1688389076', 'bd50c5034cd122cf50cd9fcfd60b4463ca1e03c25e7f01ac26fda7ff80cc3ef1', '[\"*\"]', '2023-07-05 17:55:43', '2023-07-03 12:57:56', '2023-07-05 17:55:43'),
(93, 'App\\Models\\Buyer', 1, '1688451552', 'b67346f2a9a58476de982fb387529182a98f5a290dc5e3eb2c2a8932ba907091', '[\"*\"]', NULL, '2023-07-04 06:19:12', '2023-07-04 06:19:12'),
(94, 'App\\Models\\Buyer', 13, '1688451622', '62054d1dbe506c4678382f8b44dee27484d2f1a488d5c7b4b3c8899a1eaa8a48', '[\"*\"]', NULL, '2023-07-04 06:20:22', '2023-07-04 06:20:22'),
(95, 'App\\Models\\Seller', 9, '1688451743', '6cddc68f0d2253189322b36807d37efb19fc902e0092d0ab79a4c0ceaf004c8b', '[\"*\"]', NULL, '2023-07-04 06:22:23', '2023-07-04 06:22:23'),
(96, 'App\\Models\\Buyer', 14, '1688451806', 'eb48e3b98b60d2352e885284d14803c1b4f67dfe3c7d3ace62bb205d44bb2fde', '[\"*\"]', NULL, '2023-07-04 06:23:26', '2023-07-04 06:23:26'),
(97, 'App\\Models\\Buyer', 15, '1688451892', 'f30ec720995f4fd5263413314ebb4e97aa4e825ab303dcc3a09a5b4fb631e835', '[\"*\"]', NULL, '2023-07-04 06:24:52', '2023-07-04 06:24:52'),
(98, 'App\\Models\\Buyer', 16, '1688451946', 'a01d083f8d74847405101a69325d8c72c1543c8fe0d1bd1ef70970fb7d5e433b', '[\"*\"]', NULL, '2023-07-04 06:25:46', '2023-07-04 06:25:46'),
(99, 'App\\Models\\Buyer', 1, '1688452119', 'fff2ef9728691085b8506d0924593b299e53f83d1292354c90e1970b3bc8151b', '[\"*\"]', NULL, '2023-07-04 06:28:40', '2023-07-04 06:28:40'),
(100, 'App\\Models\\Seller', 6, '1688452870', '72e149095cb3d017b009a4a5725e234a447c15c9dbaf63eb24ab1791900e63ef', '[\"*\"]', NULL, '2023-07-04 06:41:10', '2023-07-04 06:41:10'),
(101, 'App\\Models\\Admin', 1, '1688551477', 'b5484918b7c7fe5843baf62136148878267aaf11b19bddb05db15d5110f226ce', '[\"*\"]', '2023-07-05 11:08:43', '2023-07-05 10:04:37', '2023-07-05 11:08:43'),
(102, 'App\\Models\\Buyer', 1, '1688580246', '87d563dac9e9169711fb34c67c310bb640292fba31e55bdc4b27d70781ff5728', '[\"*\"]', NULL, '2023-07-05 18:04:06', '2023-07-05 18:04:06'),
(103, 'App\\Models\\Buyer', 1, '1688584090', '88c3a53075b02330fb5228258e8f33487c7dd9c4b3061456ebb513d3bb8fa43b', '[\"*\"]', NULL, '2023-07-05 19:08:10', '2023-07-05 19:08:10'),
(104, 'App\\Models\\Seller', 1, '1688585152', 'eba1f2806a659c90ebd70c7854f7b1dc63be5059d7ff6398d31b8fb9006f5128', '[\"*\"]', NULL, '2023-07-05 19:25:52', '2023-07-05 19:25:52'),
(105, 'App\\Models\\Buyer', 1, '1688585662', '41e7355ef0a025ad00b2f3d976de79a0387c8b2f7223eec318dc5df39947076b', '[\"*\"]', NULL, '2023-07-05 19:34:22', '2023-07-05 19:34:22'),
(106, 'App\\Models\\Admin', 1, '1688608624', 'c00b9dd370a287cb4d3c0823fc92ad7a59acd92e0b7d221bce538e3759d465ab', '[\"*\"]', '2023-07-06 02:25:15', '2023-07-06 01:57:04', '2023-07-06 02:25:15'),
(107, 'App\\Models\\Buyer', 1, '1688610194', '921910fb7f57e955a56df74ddc600122a3038ea1b5ca9de8798a23643ccd8f5a', '[\"*\"]', NULL, '2023-07-06 02:23:14', '2023-07-06 02:23:14'),
(108, 'App\\Models\\Seller', 6, '1688610374', '67b3bdc1f5be130151dfb3dc89268a2a733e61fd9519cbd0c73a8d04791384bb', '[\"*\"]', NULL, '2023-07-06 02:26:14', '2023-07-06 02:26:14'),
(109, 'App\\Models\\Admin', 1, '1688610522', 'f8939ecbdd9c82b2b342d10969e5e1b0cda3147c6ec9dc364a8125c7435356fd', '[\"*\"]', '2023-07-06 02:51:24', '2023-07-06 02:28:42', '2023-07-06 02:51:24'),
(110, 'App\\Models\\Admin', 1, '1688611960', '767de237e3d8d2a12c747cd80c3ca2d142a0bd1ec92f806198298e050d6f488c', '[\"*\"]', '2023-07-06 02:54:57', '2023-07-06 02:52:40', '2023-07-06 02:54:57'),
(111, 'App\\Models\\Buyer', 1, '1688612772', '73e44fbf3533faf1ae3d304742474f92d187ad8723b6599ba0c3dc6a6f97c9ad', '[\"*\"]', NULL, '2023-07-06 03:06:12', '2023-07-06 03:06:12'),
(112, 'App\\Models\\Admin', 1, '1688612795', 'f68770106b0094ba560f0f4a651e7ba5c9daa84462633d3ed3b67bbd08f27e76', '[\"*\"]', '2023-07-06 03:16:48', '2023-07-06 03:06:35', '2023-07-06 03:16:48'),
(113, 'App\\Models\\Admin', 3, '1688613206', '9f623852ee85e70fcdfc4a34cec7343773d9213b55cfc2a8c70b36299bc805ff', '[\"*\"]', NULL, '2023-07-06 03:13:26', '2023-07-06 03:13:26'),
(114, 'App\\Models\\Admin', 1, '1688614834', 'dc79a28d0868ccc3a5a70bc700c3b668d6db34984811cf0fce163cded102abcd', '[\"*\"]', '2023-07-06 05:03:56', '2023-07-06 03:40:34', '2023-07-06 05:03:56'),
(115, 'App\\Models\\Buyer', 1, '1688615518', '262dca4469970fe7d68d311d86f344639d5af2541b9c74b80143a0f7ea2be8ad', '[\"*\"]', NULL, '2023-07-06 03:51:58', '2023-07-06 03:51:58'),
(116, 'App\\Models\\Buyer', 1, '1688619317', '8eef47b148652455e0ec91745ff68b108374c4db881a1f18e1de9edebb10ddce', '[\"*\"]', NULL, '2023-07-06 04:55:17', '2023-07-06 04:55:17'),
(117, 'App\\Models\\Seller', 1, '1688619409', 'aba0be967ab8f994c0be910918da39b5fd201e38e886ce578aa2f33e82126a7f', '[\"*\"]', NULL, '2023-07-06 04:56:49', '2023-07-06 04:56:49'),
(118, 'App\\Models\\Seller', 10, '1688619491', '9cd877481b03129df3d18b03deb12f2128df5d269a177e7404c45d31b5a04eaf', '[\"*\"]', NULL, '2023-07-06 04:58:11', '2023-07-06 04:58:11'),
(119, 'App\\Models\\Seller', 10, '1688619695', '1ab6d258f2b94a8bd042f7a80dd98aeb3dca793b5a5059707966fce545b7c866', '[\"*\"]', NULL, '2023-07-06 05:01:35', '2023-07-06 05:01:35'),
(120, 'App\\Models\\Buyer', 1, '1688619935', '26af891a13d9f189c1a47cd4f38b310fa31745ae822ba4e82b3937acef06a779', '[\"*\"]', NULL, '2023-07-06 05:05:35', '2023-07-06 05:05:35'),
(121, 'App\\Models\\Seller', 1, '1688620042', '3a303685a55bfdef588c93194bac5d18ebb0cee308379a9316696d820b849c4e', '[\"*\"]', '2023-07-09 16:17:18', '2023-07-06 05:07:22', '2023-07-09 16:17:18'),
(122, 'App\\Models\\Admin', 1, '1688918936', '60264e8c60e41d372f06fbf7c54ad855961e0dd0cde1dcf84d8cacf83bd6a7d5', '[\"*\"]', '2023-07-09 16:10:16', '2023-07-09 16:08:56', '2023-07-09 16:10:16'),
(123, 'App\\Models\\Buyer', 1, '1688919139', '28c1fb4bfb606c0da0f65db057c81d9c07bdd9601281e5e776c2d213c86bf0ec', '[\"*\"]', NULL, '2023-07-09 16:12:19', '2023-07-09 16:12:19'),
(124, 'App\\Models\\Seller', 1, '1688919213', '5e8caee6e29b7d7c805f5f448eb912d58e6be11d9bcfce0d855b7788e6079a8d', '[\"*\"]', NULL, '2023-07-09 16:13:33', '2023-07-09 16:13:33'),
(125, 'App\\Models\\Buyer', 1, '1688919732', '8aa3f42e4d8857d75d53ba5c25b8481aa62e04a9ff47815b76349e4bafb56f19', '[\"*\"]', NULL, '2023-07-09 16:22:12', '2023-07-09 16:22:12'),
(126, 'App\\Models\\Admin', 1, '1688919817', 'c6793b6533f69656b76df014e149d6d9a11f7cd5c0659bbad0a79e232401a3e5', '[\"*\"]', '2023-07-09 16:49:06', '2023-07-09 16:23:37', '2023-07-09 16:49:06'),
(127, 'App\\Models\\Seller', 1, '1688919856', 'd0143d91c8c369749eab7889dc61c781f6e90c09f8f189f2b565ba4c9eb0b5e8', '[\"*\"]', NULL, '2023-07-09 16:24:16', '2023-07-09 16:24:16'),
(128, 'App\\Models\\Buyer', 1, '1688919940', '814443ee9f509f9555afa03e3ed6cf25de22b5d902fa32a450fcc35846a274de', '[\"*\"]', NULL, '2023-07-09 16:25:40', '2023-07-09 16:25:40'),
(129, 'App\\Models\\Seller', 1, '1688920648', 'c964a847dae317a5d8a000112f911d5d638162ff892c21759296f964aa46dd94', '[\"*\"]', NULL, '2023-07-09 16:37:28', '2023-07-09 16:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_sold` int(11) DEFAULT '0',
  `product_condition` tinyint(1) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `banned_by` int(11) DEFAULT NULL,
  `banned_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `seller_id` (`seller_id`),
  KEY `banned_by` (`banned_by`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `seller_id`, `product_name`, `category_id`, `price`, `quantity`, `product_sold`, `product_condition`, `product_description`, `is_approved`, `banned_by`, `banned_at`, `created_at`, `updated_at`) VALUES
(14, 1, 'Starry Night', 23, '2599.99', 1, 0, 0, 'Draw by Van Gogh', 1, NULL, NULL, '2023-06-29 11:28:45', '2023-06-29 11:28:45'),
(12, 1, 'Buddha Statue', 23, '1599.99', 2, 0, 0, 'Bring Luck to You', 1, NULL, NULL, '2023-06-29 11:26:13', '2023-06-29 11:26:13'),
(13, 1, 'Frost View', 23, '1759.99', 1, 0, 0, 'Draw by Bob Ross', 1, NULL, NULL, '2023-06-29 11:27:50', '2023-06-29 11:27:50'),
(11, 1, 'Space', 23, '799.99', 3, 0, 1, 'picture by james webb', 1, NULL, NULL, '2023-06-29 11:24:08', '2023-06-29 11:24:08'),
(10, 1, 'Frog Statue', 23, '599.99', 5, 0, 1, 'good for decoration', 1, NULL, NULL, '2023-06-29 11:22:14', '2023-06-29 11:22:14'),
(15, 1, 'Waves', 23, '1099.99', 2, 0, 0, 'From Japan', 1, NULL, NULL, '2023-06-29 11:30:04', '2023-06-29 11:30:04'),
(16, 1, 'Baby Bed', 21, '399.99', 30, 0, 1, 'Bed for Baby', 1, NULL, NULL, '2023-06-29 11:33:17', '2023-07-09 23:13:51'),
(17, 1, 'Baby Wipe', 21, '3.99', 120, 0, 1, 'Good for Baby', 1, NULL, NULL, '2023-06-29 11:34:20', '2023-06-29 11:34:20'),
(18, 1, 'Baby Bottle for Drinking', 21, '2.99', 100, 0, 1, 'Cheap and Durable', 1, NULL, NULL, '2023-06-29 11:35:08', '2023-06-29 11:35:08'),
(19, 1, 'Feeding Chair', 21, '25.99', 40, 0, 1, 'Baby Feeding Chair', 1, 1, '2023-07-06 00:55:15', '2023-06-29 11:35:56', '2023-06-29 11:35:56'),
(20, 1, 'Powder', 21, '5.99', 30, 0, 1, 'Baby Powder', 1, NULL, NULL, '2023-06-29 11:36:48', '2023-06-29 11:36:48'),
(22, 1, 'Batman Comic', 17, '10.99', 30, 0, 1, 'New Series', 1, NULL, NULL, '2023-06-29 11:38:45', '2023-06-29 11:38:45'),
(23, 1, 'Dragon Ball', 17, '15.99', 20, 0, 1, 'Dragon Ball Manga', 1, NULL, NULL, '2023-06-29 11:39:28', '2023-06-29 11:39:28'),
(24, 1, 'Harry Potter', 17, '20.99', 50, 0, 1, 'Harry Potter Series', 1, NULL, NULL, '2023-06-29 11:41:45', '2023-06-29 11:41:45'),
(25, 1, 'Lord of The Ring', 17, '24.99', 40, 0, 1, 'Lord of The Ring Series', 1, NULL, NULL, '2023-06-29 11:43:05', '2023-06-29 11:43:05'),
(26, 1, 'Naruto', 17, '20.99', 30, 0, 1, 'Naruto Manga', 1, NULL, NULL, '2023-06-29 11:46:12', '2023-06-29 11:46:12'),
(27, 1, 'Spider-Man', 17, '22.99', 30, 0, 1, 'Spider-Man Comic', 1, NULL, NULL, '2023-06-29 11:47:08', '2023-06-29 11:47:08'),
(28, 1, 'Air Jordan 1', 12, '599.99', 28, 1, 1, 'Nike Air Jordan 1', 1, NULL, NULL, '2023-06-29 11:49:04', '2023-06-29 11:49:04'),
(29, 1, 'Man Shirt', 12, '20.99', 47, 2, 1, 'Man Shirt', 1, NULL, NULL, '2023-06-29 11:50:06', '2023-06-29 11:50:06'),
(30, 1, 'Man Shoes', 12, '50.99', 30, 0, 1, 'Man Shoes', 1, NULL, NULL, '2023-06-29 11:50:42', '2023-06-29 11:50:42'),
(31, 1, 'Skirt', 12, '19.99', 50, 0, 1, 'Skirt', 1, NULL, NULL, '2023-06-29 11:51:14', '2023-06-29 11:51:14'),
(32, 1, 'Man Trouser', 12, '25.99', 47, 2, 1, 'Man Trouser', 1, NULL, NULL, '2023-06-29 11:51:56', '2023-06-29 11:51:56'),
(33, 1, 'Black T-Shirt', 12, '11.99', 60, 0, 1, 'Black T-Shirt', 1, NULL, NULL, '2023-06-29 11:52:30', '2023-06-29 11:52:30'),
(34, 1, 'Woman Shoes', 12, '15.99', 40, 0, 1, 'Woman Shoes', 1, NULL, NULL, '2023-06-29 11:53:07', '2023-06-29 11:53:07'),
(35, 1, 'Woman Short', 12, '30.99', 40, 0, 1, 'Woman Short', 1, NULL, NULL, '2023-06-29 11:53:41', '2023-06-29 11:53:41'),
(36, 1, 'Woman Shirt', 12, '20.99', 50, 0, 1, 'Woman Shirt', 1, NULL, NULL, '2023-06-29 11:54:21', '2023-06-29 11:54:21'),
(37, 1, 'Apple Watch', 22, '499.99', 30, 0, 1, 'Apple Watch', 1, NULL, NULL, '2023-06-29 11:54:59', '2023-06-29 11:54:59'),
(38, 1, 'Canon AE 1', 22, '799.99', 30, 0, 1, 'Canon AE 1', 1, NULL, NULL, '2023-06-29 12:09:39', '2023-06-29 12:09:39'),
(39, 1, 'Dji Mini 2', 22, '899.99', 20, 0, 1, 'Drone', 1, NULL, NULL, '2023-06-29 12:10:23', '2023-06-29 12:10:23'),
(40, 1, 'Fuji x100v', 22, '799.99', 30, 0, 1, 'Fuji x100v', 0, NULL, NULL, '2023-06-29 12:13:41', '2023-06-29 12:13:41'),
(41, 1, 'GoPro Hero 11', 22, '599.99', 30, 0, 1, 'GoPro Hero 11', 1, NULL, NULL, '2023-06-29 12:14:14', '2023-06-29 12:14:14'),
(42, 1, 'JBL BoomBox 2', 22, '399.99', 20, 0, 1, 'JBL BoomBox 2', 1, NULL, NULL, '2023-06-29 12:14:58', '2023-06-29 12:14:58'),
(43, 1, 'MacBook Pro 16 M1', 22, '1499.99', 20, 0, 1, 'MacBook Pro 16 M1', 1, NULL, NULL, '2023-06-29 12:17:49', '2023-06-29 12:17:49'),
(44, 1, 'Coffee Table', 18, '30.99', 40, 0, 1, 'Coffee Table', 1, NULL, NULL, '2023-06-29 13:21:33', '2023-06-29 13:21:33'),
(45, 1, 'Gamming Chair', 18, '299.99', 40, 0, 1, 'Gamming Chair', 1, NULL, NULL, '2023-06-29 13:22:13', '2023-06-29 13:22:13'),
(46, 1, 'Dinner Chair', 18, '10.99', 50, 0, 1, 'Dinner Chair', 1, NULL, NULL, '2023-06-29 13:22:42', '2023-06-29 13:22:42'),
(47, 1, 'Couple Bed', 18, '399.99', 30, 0, 1, 'Couple Bed', 1, NULL, NULL, '2023-06-29 13:23:45', '2023-06-29 13:23:45'),
(48, 1, 'Glass Table', 18, '299.99', 30, 0, 1, 'Glass Table', 1, NULL, NULL, '2023-06-29 13:25:14', '2023-06-29 13:25:14'),
(49, 1, 'Two Floor Bed', 18, '269.99', 40, 0, 1, 'Two Floor Bed', 1, NULL, NULL, '2023-06-29 13:26:33', '2023-06-29 13:26:33'),
(51, 1, 'Anti-Perspirant', 19, '2.99', 50, 0, 1, 'Anti-Perspirant', 1, NULL, NULL, '2023-06-29 13:29:39', '2023-06-29 13:29:39'),
(52, 1, 'Bleu De Channel', 19, '124.99', 50, 0, 1, 'Bleu De Channel', 1, NULL, NULL, '2023-06-29 13:30:43', '2023-06-29 13:30:43'),
(53, 1, 'Eye Wash', 19, '4.99', 40, 0, 1, 'Eye Wash', 1, NULL, NULL, '2023-06-29 13:31:44', '2023-06-29 13:31:44'),
(54, 1, 'Foam', 19, '1.99', 50, 0, 1, 'Foam', 1, NULL, NULL, '2023-06-29 13:32:40', '2023-06-29 13:32:40'),
(55, 1, 'Vaseline', 19, '2.99', 50, 0, 1, 'Vaseline', 1, NULL, NULL, '2023-06-29 13:33:18', '2023-06-29 13:33:18'),
(56, 1, 'Versace', 19, '119.99', 40, 0, 1, 'Versace', 1, NULL, NULL, '2023-06-29 13:34:08', '2023-06-29 13:34:08'),
(57, 1, 'Arduino', 15, '14.99', 50, 0, 1, 'Arduino', 1, NULL, NULL, '2023-06-29 13:35:24', '2023-06-29 13:35:24'),
(58, 1, 'Digital Multimeter', 15, '10.99', 40, 0, 1, 'Digital Multimeter', 1, NULL, NULL, '2023-06-29 13:36:08', '2023-06-29 13:36:08'),
(59, 1, 'Telescope', 15, '399.99', 30, 0, 1, 'Telescope', 1, NULL, NULL, '2023-06-29 13:36:48', '2023-06-29 13:36:48'),
(60, 1, 'Microscope', 15, '199.99', 30, 0, 1, 'Microscope', 1, NULL, NULL, '2023-06-29 13:37:31', '2023-06-29 13:37:31'),
(61, 1, 'Theodolite', 15, '299.99', 30, 0, 1, 'Theodolite', 1, NULL, NULL, '2023-06-29 13:38:09', '2023-06-29 13:38:09'),
(62, 1, 'Bird Cage', 20, '29.99', 30, 0, 1, 'Bird Cage', 1, NULL, NULL, '2023-06-29 13:39:28', '2023-06-29 13:39:28'),
(63, 1, 'Dog House', 20, '49.99', 30, 0, 1, 'Dog House', 1, NULL, NULL, '2023-06-29 13:41:06', '2023-06-29 13:41:06'),
(64, 1, 'Hamster Wheel', 20, '9.99', 30, 0, 1, 'Hamster Wheel', 1, NULL, NULL, '2023-06-29 13:41:47', '2023-06-29 13:41:47'),
(65, 1, 'Aquarium', 20, '39.99', 30, 0, 1, 'Aquarium', 1, NULL, NULL, '2023-06-29 13:42:28', '2023-06-29 13:42:28'),
(66, 1, 'Basketball', 13, '5.99', 50, 0, 1, 'Basketball', 1, NULL, NULL, '2023-06-29 13:43:12', '2023-06-29 13:43:12'),
(67, 1, 'Football Shoes', 13, '299.99', 50, 0, 1, 'Football Shoes', 1, NULL, NULL, '2023-06-29 13:43:54', '2023-06-29 13:43:54'),
(68, 1, 'GK Glove', 13, '129.99', 40, 0, 1, 'GK Glove', 1, NULL, NULL, '2023-06-29 13:44:35', '2023-06-29 13:44:35'),
(69, 1, 'Football', 13, '4.99', 40, 0, 1, 'Football', 0, NULL, NULL, '2023-06-29 13:45:13', '2023-06-29 13:45:13'),
(70, 1, 'American Football Helmet', 13, '59.99', 30, 0, 1, 'American Football Helmet', 1, NULL, NULL, '2023-06-29 13:47:30', '2023-06-29 13:47:30'),
(71, 1, 'Axe', 16, '30.99', 30, 0, 1, 'Axe', 1, NULL, NULL, '2023-06-29 13:48:02', '2023-06-29 13:48:02'),
(72, 1, 'Plastic Broom', 16, '3.99', 40, 0, 1, 'Plastic Broom', 1, NULL, NULL, '2023-06-29 13:48:34', '2023-06-29 13:48:34'),
(73, 1, 'Chainsaw', 16, '299.99', 30, 0, 1, 'Chainsaw', 1, NULL, NULL, '2023-06-29 13:49:07', '2023-06-29 13:49:07'),
(74, 1, 'Hammer', 16, '6.99', 30, 0, 1, 'Hammer', 1, 1, '2023-07-09 23:10:15', '2023-06-29 13:49:37', '2023-06-29 13:49:37'),
(75, 1, 'Nail Gun', 16, '199.99', 40, 0, 1, 'Nail Gun', 1, NULL, NULL, '2023-06-29 13:50:31', '2023-06-29 13:50:31'),
(76, 1, 'Shovel', 16, '10.99', 30, 0, 1, 'Shovel', 0, NULL, NULL, '2023-06-29 13:52:32', '2023-06-29 13:52:32'),
(77, 1, 'Lego Car', 14, '19.99', 50, 0, 1, 'Lego Car', 0, NULL, NULL, '2023-06-29 13:53:38', '2023-06-29 13:53:38'),
(78, 1, 'RC Car', 14, '129.99', 30, 0, 1, 'RC Car', 0, NULL, NULL, '2023-06-29 13:54:13', '2023-06-29 13:54:13'),
(79, 1, 'RC Helicopter', 14, '189.99', 30, 0, 1, 'RC Helicopter', 0, NULL, NULL, '2023-06-29 13:55:17', '2023-06-29 13:55:17'),
(80, 1, 'Water Gun', 14, '15.99', 50, 0, 1, 'Water Gun', 0, NULL, NULL, '2023-06-29 13:55:51', '2023-06-29 13:55:51'),
(81, 6, 'Logitech G502 Lightspeed Wireless Optical Gaming Mouse', 22, '110.00', 24, 1, 1, 'Logitech G502 Lightspeed Wireless Optical Gaming Mouse', 1, NULL, NULL, '2023-07-06 09:49:37', '2023-07-06 09:49:37'),
(82, 10, 'Iphone', 22, '3.22', 10, 0, 1, 'new apple', 1, NULL, NULL, '2023-07-06 12:02:08', '2023-07-06 12:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_img`
--

DROP TABLE IF EXISTS `product_img`;
CREATE TABLE IF NOT EXISTS `product_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  PRIMARY KEY (`img_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `product_img`
--

INSERT INTO `product_img` (`img_id`, `product_id`, `img_url`) VALUES
(6, 7, 'https://i.imgur.com/TKmNToP.jpg'),
(79, 82, 'https://i.imgur.com/109EZhH.jpg'),
(7, 8, 'https://i.imgur.com/EO3PDmJ.jpg'),
(8, 9, 'https://i.imgur.com/hzOjOj3.jpg'),
(5, 6, 'https://i.imgur.com/CHJwbu4.jpg'),
(9, 10, 'https://i.imgur.com/ljbX9y8.jpg'),
(10, 11, 'https://i.imgur.com/Wi4k25M.jpg'),
(11, 12, 'https://i.imgur.com/gUFwSZd.jpg'),
(12, 13, 'https://i.imgur.com/E5CdaMi.jpg'),
(13, 14, 'https://i.imgur.com/LTcCCsS.jpg'),
(14, 15, 'https://i.imgur.com/fcoEq8V.jpg'),
(15, 16, 'https://i.imgur.com/7eVRKAO.jpg'),
(16, 17, 'https://i.imgur.com/MUXDKX4.jpg'),
(17, 18, 'https://i.imgur.com/Y7eJNRf.jpg'),
(18, 19, 'https://i.imgur.com/3Gudpuh.jpg'),
(19, 20, 'https://i.imgur.com/lkzQcN7.jpg'),
(21, 22, 'https://i.imgur.com/xxPj9NA.jpg'),
(22, 23, 'https://i.imgur.com/mdPsWyR.jpg'),
(23, 24, 'https://i.imgur.com/8RPLMQh.jpg'),
(24, 25, 'https://i.imgur.com/gs2tEBS.jpg'),
(25, 26, 'https://i.imgur.com/FbeUJE1.jpg'),
(26, 27, 'https://i.imgur.com/PBESWsT.jpg'),
(27, 28, 'https://i.imgur.com/VZgmlu4.jpg'),
(28, 29, 'https://i.imgur.com/qe9nRqF.jpg'),
(29, 30, 'https://i.imgur.com/XGb5Tdu.png'),
(30, 31, 'https://i.imgur.com/kwBIomB.jpg'),
(31, 32, 'https://i.imgur.com/SZ9iSWz.jpg'),
(32, 33, 'https://i.imgur.com/4kruurM.jpg'),
(33, 34, 'https://i.imgur.com/oLfAlgW.jpg'),
(34, 35, 'https://i.imgur.com/pRb9nJg.jpg'),
(35, 36, 'https://i.imgur.com/7jLLo1A.jpg'),
(36, 37, 'https://i.imgur.com/DoFtf4t.jpg'),
(37, 38, 'https://i.imgur.com/MHPZn6q.jpg'),
(38, 39, 'https://i.imgur.com/DajlNZI.jpg'),
(39, 41, 'https://i.imgur.com/GjCrVDI.jpg'),
(40, 42, 'https://i.imgur.com/ucocVo0.jpg'),
(41, 43, 'https://i.imgur.com/Mr83Y9H.jpg'),
(42, 44, 'https://i.imgur.com/yRJ0jgp.jpg'),
(43, 45, 'https://i.imgur.com/xefaSwS.jpg'),
(44, 46, 'https://i.imgur.com/niDxXIp.jpg'),
(45, 47, 'https://i.imgur.com/0seMhyg.jpg'),
(46, 48, 'https://i.imgur.com/5yTxfKW.jpg'),
(47, 49, 'https://i.imgur.com/E4ZmAd3.jpg'),
(48, 50, 'https://i.imgur.com/Yf69Bo1.jpg'),
(49, 51, 'https://i.imgur.com/Z0L1YrT.jpg'),
(50, 52, 'https://i.imgur.com/iU6Ecyr.jpg'),
(51, 53, 'https://i.imgur.com/Ib2dlaO.jpg'),
(52, 54, 'https://i.imgur.com/eIAewxY.jpg'),
(53, 55, 'https://i.imgur.com/DIq9MAK.jpg'),
(54, 56, 'https://i.imgur.com/kzRllLo.jpg'),
(55, 57, 'https://i.imgur.com/bKgIFVf.jpg'),
(56, 58, 'https://i.imgur.com/lWpMhNr.jpg'),
(57, 59, 'https://i.imgur.com/Lco1XyC.jpg'),
(58, 60, 'https://i.imgur.com/yNmR6E6.jpg'),
(59, 61, 'https://i.imgur.com/l0M3Wje.jpg'),
(60, 62, 'https://i.imgur.com/C6q3msu.jpg'),
(61, 63, 'https://i.imgur.com/7svt4dp.jpg'),
(62, 64, 'https://i.imgur.com/qqMPQqy.jpg'),
(63, 65, 'https://i.imgur.com/DU5XWSM.jpg'),
(64, 66, 'https://i.imgur.com/auKENui.jpg'),
(65, 67, 'https://i.imgur.com/ha0YrKJ.jpg'),
(66, 68, 'https://i.imgur.com/HU6FO2K.jpg'),
(67, 70, 'https://i.imgur.com/OYYDvP9.jpg'),
(68, 71, 'https://i.imgur.com/GrHLtTM.jpg'),
(69, 72, 'https://i.imgur.com/XCmKNvi.jpg'),
(70, 73, 'https://i.imgur.com/Hb396KQ.jpg'),
(71, 74, 'https://i.imgur.com/g5HrWrM.jpg'),
(72, 75, 'https://i.imgur.com/rcRvU2P.jpg'),
(73, 76, 'https://i.imgur.com/4JrRJPS.jpg'),
(74, 77, 'https://i.imgur.com/lirNU5y.jpg'),
(75, 78, 'https://i.imgur.com/NFSWRA0.jpg'),
(76, 79, 'https://i.imgur.com/z41xhto.jpg'),
(77, 80, 'https://i.imgur.com/ZoneGrW.jpg'),
(78, 81, 'https://i.imgur.com/ZrCP3Y7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(30) NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`) VALUES
(1, 'Phnom Penh'),
(2, 'Siem Reap'),
(3, 'Battambang'),
(4, 'Banteay Meanchey'),
(7, 'Kampong Cham'),
(8, 'Kampong Chhnang'),
(9, 'Kampong Speu'),
(10, 'Kampong Thom'),
(11, 'Kampot'),
(12, 'Kep'),
(13, 'Koh Kong'),
(14, 'Kratié'),
(15, 'Mondulkiri'),
(16, 'Oddar Meanchey'),
(17, 'Pailin'),
(18, 'Preah Vihear'),
(19, 'Pursat'),
(20, 'Prey Veng'),
(21, 'Ratanakiri'),
(22, 'Preah Sihanouk'),
(23, 'Stueng Treng'),
(24, 'Svay Rieng'),
(5, 'Takéo'),
(6, 'Tboung Khmum');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
CREATE TABLE IF NOT EXISTS `seller` (
  `seller_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `banned_by` int(11) DEFAULT NULL,
  `banned_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `first_name`, `last_name`, `email`, `password`, `img_url`, `date_of_birth`, `status`, `banned_by`, `banned_at`, `created_at`, `updated_at`, `remember_token`, `api_token`) VALUES
(1, 'Eav Long', 'Sok', 'esok@paragoniu.edu.kh', '$2y$10$U2UsLnqM15uGaNDK81YueunanNHeqYHvmMXgae3T3Jd4NxDFKUhZm', 'https://i.imgur.com/NWLwuzZ.png', '2000-01-01', 1, NULL, NULL, '2023-06-04 18:47:18', '2023-07-09 16:37:28', 'rLQf4r2MtBKj5iKIwPTL0SE4v3EdZqXtdV4rC8D5IHpu2Z0hedCqEQHWGQhj', '129|pRRtTlM6o59MSb2EARLAqZW6csOj5FYSH5hU8P8O'),
(2, 'My', 'Account', 'myaccount@gmail.com', '$2y$10$OhGeFB4CGeqrFRU2qbbO0.Nm65XdZZsKHTfX4dLdWQbmbQ7QZbuvy', 'https://i.imgur.com/q83rjA0.png', '1999-03-04', 1, NULL, NULL, '2023-06-17 08:42:39', '2023-06-17 08:42:39', 'eqs50udWDnq065aASfFVx95FF0Rw00g84Jn3oMpetOMvHGgMdKWFyaSrTLgB', '16|rBDIqeqy2npXksnFMPru6FOQUgAH1MXLWsIt2ofS'),
(3, 'Some', 'Account', 'yilongma@gmail.com', '$2y$10$SM3v7iSLIhaE2vX96LdbFOA5TPobPPNCRyzw1cI73B7WAEbMzvJdC', 'https://i.imgur.com/q83rjA0.png', '1992-03-03', 1, NULL, NULL, '2023-06-17 08:46:42', '2023-06-17 08:46:42', 'G9lLZCE0atSNI3lGi362jFYwf0iA5ijYQneT1dOhU2ekWKzTV6oftN1HQVd8', '17|Pg1IliYzSWCATXkb0NME6bs3dPAoFn3LjWcqyXwe'),
(4, 'Some', 'Seller', 'hello@gmail.com', '$2y$10$mCpySDD8dZ9pNfJUMbgCw.NpOmo2S.K73gZKJ5EFOlMM3tvMeftjW', NULL, '2003-07-10', 1, NULL, NULL, '2023-07-02 17:06:04', '2023-07-02 17:06:04', 'gY0y5w7Y0EbMJxc10zOPMund2PSiQd9HAsBsrEv0F9gOWhvR2KN2VBsCuhPz', '75|bHRwnoOiZFy1l8RpJQRC2IZBrKkSutz4uqq4LCaW'),
(5, 'test', 'account', 'testingaccount@gmail.com', '$2y$10$wdZBvXAsrwSCzbds5CgI8.FSjn4h44KT5bMekjALf/taVCR9Iq9CK', NULL, '2007-07-04', 1, NULL, NULL, '2023-07-02 17:21:50', '2023-07-02 17:21:50', 'bOOA9hiM6FW2NWGKSDpdeJShKRW4oiSjDclpXgdTF8Y5B7ElwhEILt2hpgrq', '80|0mzVnDHbHtQ5UVwczpzvUNufT6kBAnphz98r5qjt'),
(6, 'test', 'account', 'testaccount@gmail.com', '$2y$10$Q.lNfibg9MkRW15Zl9c.oujwXjUuNaIW4rZHeKSiR6fPJJG2aoUCm', 'https://i.imgur.com/416xpeK.jpg', '1970-01-01', 1, NULL, NULL, '2023-07-02 17:29:26', '2023-07-06 02:28:19', '5qyW9uYYtl7lUnOsVwisrzKvnpuYgz2trDGNHmIfyVgW4f52TWblvaTf4fKu', '108|2nunmYOCnsO0oWA7a6tmxa9xiD13QLJb3qGjmPHY'),
(7, 'test', 'account', 'testaccount123@gmail.com', '$2y$10$Aam3EUvl/sYdAKjSHnOLV.LJ33U10EvuMXBpIMbHq0flX6lNjQ7Nu', NULL, '2004-07-06', 1, NULL, NULL, '2023-07-02 17:40:08', '2023-07-02 17:40:08', NULL, '87|AO0I4qov5XzeX0OAQ23qB5XlIEZXx1sSm3XArEhj'),
(8, 'the final', 'test', 'thefinaltest@gmail.com', '$2y$10$5So0JjzSaNWgxNpH5BsHp.jmyxbYPfHoHE.FA2ySQRS0pNTrG5ub2', NULL, '1992-03-24', 1, NULL, NULL, '2023-07-02 17:44:06', '2023-07-02 17:44:06', NULL, '90|rRkkIIM2Y2J3b9Mwyw4d1BT84JQRui0f4SfV9chX'),
(9, 'Eav Long', 'Sok', 'eavlongsok@gmail.com', '$2y$10$BfezKYAPOig3KRmGM6K49OZ1PSJdijTzVwS9jbswRopwnsHHl2t5K', NULL, '2010-07-19', 1, NULL, NULL, '2023-07-04 06:22:23', '2023-07-04 06:22:23', NULL, '95|N3PcoHHFKl6bOPAHZ4PNOUFqgho8DAPUwmWP2np5'),
(10, 'ly', 'sing', 'lysing123@gmail.com', '$2y$10$kQfXAVLnhbmt6.AFCmeuCO/vulKxXMDezpXFAbCcjQlBCfSakbKGW', 'https://i.imgur.com/nmvztJe.png', '2023-07-06', 1, NULL, NULL, '2023-07-06 04:58:11', '2023-07-06 05:01:35', 'sMrv7yPOpuiq98WpmoWs8FH3rAeK9O7qOPoreYVyCaVIx3QO8OliFKhglGh4', '119|GD8rvVPbCMk2vLSNbsiYZVgaVRm53jmAp6PuLAi0');

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

DROP TABLE IF EXISTS `verification`;
CREATE TABLE IF NOT EXISTS `verification` (
  `ver_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `store_name` varchar(30) NOT NULL,
  `business_info` varchar(255) NOT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ver_id`),
  KEY `seller_id` (`seller_id`),
  KEY `verified_by` (`verified_by`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `verification`
--

INSERT INTO `verification` (`ver_id`, `seller_id`, `store_name`, `business_info`, `verified_by`, `verified_at`, `created_at`) VALUES
(18, 6, 'Logitech', 'Logitech International S.A. is a Swiss multinational manufacturer of computer peripherals and software', 1, '2023-07-06 09:37:18', '2023-07-06 09:28:19'),
(17, 1, 'Among Us', 'our information here', 1, '2023-07-04 14:10:24', '2023-07-04 13:57:45'),
(19, 10, 'paragon', 'sell shirt', 1, '2023-07-06 12:00:31', '2023-07-06 11:59:49');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
