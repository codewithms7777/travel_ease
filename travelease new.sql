-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 18, 2025 at 09:41 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelease`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `booking_type` enum('flight','hotel','train','bus','cruise','holiday') COLLATE utf8mb4_general_ci NOT NULL,
  `booking_reference` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_id` int NOT NULL,
  `details` text COLLATE utf8mb4_general_ci,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `travel_date` date DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled','completed') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `payment_status` enum('paid','pending','failed') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `payment_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_reference` (`booking_reference`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `booking_type`, `booking_reference`, `item_id`, `details`, `booking_date`, `travel_date`, `check_in_date`, `check_out_date`, `quantity`, `total_amount`, `status`, `payment_status`, `payment_date`, `created_at`, `updated_at`) VALUES
(3, 7, 'flight', 'BOOK83191765448618', 0, 'Mumbai to Goa Flight', '2025-12-10 23:23:38', '2025-12-18', NULL, NULL, 1, 8500.00, 'confirmed', 'paid', NULL, '2025-12-12 06:37:54', '2025-12-12 06:37:54'),
(5, 5, 'flight', 'BOOK69831765529161', 0, 'Mumbai to Goa Flight', '2025-12-11 21:46:01', '2025-12-19', NULL, NULL, 1, 8500.00, 'confirmed', 'paid', NULL, '2025-12-12 06:37:54', '2025-12-12 06:37:54'),
(6, 5, 'hotel', 'BOOK16101765529161', 0, 'Goa Beach Resort - 3 Nights', '2025-12-11 21:46:01', '2025-12-19', NULL, NULL, 1, 12000.00, 'confirmed', 'paid', NULL, '2025-12-12 06:37:54', '2025-12-12 06:37:54'),
(7, 5, 'bus', 'BUS58761765561098', 2, 'Luxury Seater (LS205) - Delhi to Agra', '2025-12-12 06:38:18', '2026-01-01', NULL, NULL, 1, 500.00, 'confirmed', 'paid', NULL, '2025-12-12 06:38:18', '2025-12-12 06:38:26'),
(8, 5, 'train', 'TRAIN64761765561169', 1, 'Rajdhani Express (12951) - Mumbai Central to New Delhi', '2025-12-12 06:39:29', '2026-01-05', NULL, NULL, 1, 2500.00, 'confirmed', 'paid', NULL, '2025-12-12 06:39:29', '2025-12-12 06:39:32'),
(9, 5, 'flight', 'FLIGHT27681765561209', 1, 'Air India AI101 - Mumbai to Delhi', '2025-12-12 06:40:09', '2025-12-13', NULL, NULL, 1, 8500.00, 'pending', 'pending', NULL, '2025-12-12 06:40:09', '2025-12-12 06:40:09'),
(10, 5, 'flight', 'FLIGHT86551765561216', 1, 'Air India AI101 - Mumbai to Delhi', '2025-12-12 06:40:16', '2025-12-13', NULL, NULL, 2, 17000.00, 'confirmed', 'paid', NULL, '2025-12-12 06:40:16', '2025-12-12 06:40:20'),
(11, 5, 'hotel', 'HOTEL56201765561666', 2, 'Beach Resort Goa - Goa', '2025-12-12 06:47:46', '2025-12-12', '2025-12-13', '2025-12-15', 1, 7000.00, 'confirmed', 'paid', NULL, '2025-12-12 06:47:46', '2025-12-12 06:47:50'),
(12, 5, 'cruise', 'CRUISE50271765561823', 1, 'Royal Caribbean - Symphony of the Seas', '2025-12-12 06:50:23', '2026-02-05', NULL, NULL, 1, 45000.00, 'confirmed', 'paid', NULL, '2025-12-12 06:50:23', '2025-12-12 06:50:27'),
(13, 5, 'holiday', 'HOLIDAY1921176556350', 1, 'Goa Beach Paradise - Goa', '2025-12-12 07:18:20', '2026-11-10', NULL, NULL, 1, 15000.00, 'cancelled', '', NULL, '2025-12-12 07:18:20', '2025-12-15 04:15:56'),
(16, 8, 'holiday', 'HOLIDAY4326176556868', 24, 'Polish History & Culture - Poland', '2025-12-12 08:44:41', '2026-11-11', NULL, NULL, 5, 4999.95, 'confirmed', 'paid', NULL, '2025-12-12 08:44:41', '2025-12-12 08:44:48'),
(17, 8, 'holiday', 'HOLIDAY8561176556956', 12, 'Cherry Blossom Special - Japan', '2025-12-12 08:59:27', '2026-01-01', NULL, NULL, 10, 24999.90, 'confirmed', 'paid', NULL, '2025-12-12 08:59:27', '2025-12-12 08:59:34'),
(18, 7, 'cruise', 'CRUISE94941765617615', 2, 'Carnival Cruise - Mardi Gras', '2025-12-12 22:20:15', '2026-01-01', NULL, NULL, 1, 35000.00, 'confirmed', 'paid', NULL, '2025-12-12 22:20:15', '2025-12-12 22:20:34'),
(19, 7, 'holiday', 'HOLIDAY1485176562732', 30, 'Mumbai Darshan - City Tour Package - India', '2025-12-13 01:02:04', '2026-11-11', NULL, NULL, 5, 14995.00, 'confirmed', 'paid', NULL, '2025-12-13 01:02:04', '2025-12-13 01:02:07'),
(20, 5, 'holiday', 'HOLIDAY4142176571291', 29, 'Moscow & St. Petersburg Imperial Tour - Russia', '2025-12-14 06:18:34', '2027-11-11', NULL, NULL, 2, 4399.98, 'confirmed', 'paid', NULL, '2025-12-14 06:18:34', '2025-12-14 06:18:37'),
(21, 5, 'hotel', 'HOTEL39511765712972', 3, 'Heritage Palace Jaipur - Jaipur', '2025-12-14 06:19:32', '2025-12-14', '2025-12-15', '2025-12-16', 1, 4000.00, 'cancelled', '', NULL, '2025-12-14 06:19:32', '2025-12-14 06:52:01'),
(22, 5, 'hotel', 'HOTEL17571765715623', 2, 'Beach Resort Goa - Goa', '2025-12-14 07:03:43', '2025-12-14', '2025-12-15', '2025-12-16', 1, 3500.00, 'cancelled', '', NULL, '2025-12-14 07:03:43', '2025-12-14 07:04:40'),
(23, 5, 'hotel', 'HOTEL32441765715631', 2, 'Beach Resort Goa - Goa', '2025-12-14 07:03:51', '2025-12-14', '2025-12-15', '2025-12-16', 5, 17500.00, 'cancelled', '', NULL, '2025-12-14 07:03:51', '2025-12-14 07:04:28'),
(24, 5, 'holiday', 'HOLIDAY6878176580012', 26, 'K-Pop & Korean Culture - South Korea', '2025-12-15 06:32:06', '2027-01-01', NULL, NULL, 8, 13599.92, 'confirmed', 'paid', NULL, '2025-12-15 06:32:06', '2025-12-15 06:32:10'),
(25, 5, 'holiday', 'HOLIDAY5339176580678', 20, 'Dubai Luxury Experience - United Arab Emirates', '2025-12-15 08:23:09', '2026-05-05', NULL, NULL, 3, 5399.97, 'confirmed', 'paid', NULL, '2025-12-15 08:23:09', '2025-12-15 08:23:20'),
(26, 5, 'holiday', 'HOLIDAY3186176580969', 30, 'Mumbai Darshan - City Tour Package - India', '2025-12-15 09:11:35', '2026-01-01', NULL, NULL, 1, 2999.00, 'confirmed', 'paid', '2025-12-15 20:17:53', '2025-12-15 09:11:35', '2025-12-15 09:17:53'),
(27, 5, 'holiday', 'HOLIDAY7632176581008', 28, 'Egyptian Pyramids & Nile Cruise - Egypt', '2025-12-15 09:18:07', '2027-01-01', NULL, NULL, 1, 1799.99, 'confirmed', 'paid', '2025-12-15 20:18:26', '2025-12-15 09:18:07', '2025-12-15 09:18:26'),
(28, 5, 'holiday', 'HOLIDAY5853176581012', 28, 'Egyptian Pyramids & Nile Cruise - Egypt', '2025-12-15 09:18:45', '2027-01-01', NULL, NULL, 1, 1799.99, 'pending', 'pending', NULL, '2025-12-15 09:18:45', '2025-12-15 09:18:45'),
(29, 5, 'cruise', 'CRUISE40171765811429', 2, 'Carnival Cruise - Mardi Gras', '2025-12-15 09:40:29', '2026-01-01', NULL, NULL, 1, 35000.00, 'confirmed', 'paid', '2025-12-15 20:42:09', '2025-12-15 09:40:29', '2025-12-15 09:42:09'),
(30, 5, 'cruise', 'CRUISE32571765811564', 3, 'Norwegian Cruise - Wonder of the Seas', '2025-12-15 09:42:44', '2026-01-01', NULL, NULL, 1, 75000.00, 'confirmed', 'paid', '2025-12-15 20:43:03', '2025-12-15 09:42:44', '2025-12-15 09:43:03'),
(31, 5, 'cruise', 'CRUISE26861765811598', 1, 'Royal Caribbean - Symphony of the Seas', '2025-12-15 09:43:18', '2026-01-01', NULL, NULL, 1, 45000.00, 'confirmed', 'paid', '2025-12-15 20:43:25', '2025-12-15 09:43:18', '2025-12-15 09:43:25'),
(32, 5, 'cruise', 'CRUISE93641765811622', 1, 'Royal Caribbean - Symphony of the Seas', '2025-12-15 09:43:42', '2026-01-01', NULL, NULL, 1, 45000.00, 'confirmed', 'paid', '2025-12-15 20:44:06', '2025-12-15 09:43:42', '2025-12-15 09:44:06'),
(33, 5, 'holiday', 'HOLIDAY6167176581169', 25, 'Vietnam Highlights Tour - Vietnam', '2025-12-15 09:44:50', '2026-02-02', NULL, NULL, 1, 1499.99, 'confirmed', 'paid', '2025-12-15 20:49:04', '2025-12-15 09:44:50', '2025-12-15 09:49:04'),
(34, 5, 'hotel', 'HOTEL89481765811967', 2, 'Beach Resort Goa - Goa', '2025-12-15 09:49:27', '2025-12-15', '2025-12-16', '2025-12-17', 1, 7500.00, 'confirmed', 'paid', '2025-12-15 20:50:39', '2025-12-15 09:49:27', '2025-12-15 09:50:39'),
(35, 5, 'holiday', 'HOLIDAY4986176581239', 16, 'Hong Kong City Lights - Hong Kong (Special Administrative Region)', '2025-12-15 09:56:32', '2026-01-01', NULL, NULL, 3, 3899.97, 'confirmed', 'paid', '2025-12-15 20:57:49', '2025-12-15 09:56:32', '2025-12-15 09:57:49'),
(36, 5, 'holiday', 'HOLIDAY7726176581253', 11, 'German Castles & Beer Tour - Germany', '2025-12-15 09:58:50', '2025-12-30', NULL, NULL, 1, 1399.99, 'confirmed', 'paid', '2025-12-15 20:59:54', '2025-12-15 09:58:50', '2025-12-15 09:59:54'),
(37, 5, 'hotel', 'HOTEL57781765812659', 3, 'Heritage Palace Jaipur - Jaipur', '2025-12-15 10:00:59', '2025-12-15', '2025-12-16', '2025-12-17', 5, 20000.00, 'confirmed', 'paid', '2025-12-15 21:01:18', '2025-12-15 10:00:59', '2025-12-15 10:01:18'),
(39, 8, 'hotel', 'HOTEL24411765813216', 2, 'Beach Resort Goa - Goa', '2025-12-15 10:10:16', '2025-12-15', '2025-12-16', '2025-12-17', 2, 15000.00, 'confirmed', 'paid', '2025-12-15 21:10:37', '2025-12-15 10:10:16', '2025-12-15 10:10:37'),
(40, 8, 'holiday', 'HOLIDAY1889176581329', 29, 'Moscow & St. Petersburg Imperial Tour - Russia', '2025-12-15 10:11:32', '2026-02-01', NULL, NULL, 2, 498000.00, 'confirmed', 'paid', '2025-12-15 21:12:11', '2025-12-15 10:11:32', '2025-12-15 10:12:11'),
(52, 8, 'holiday', 'HOLIDAY4717176581907', 5, 'Spanish Fiesta Tour - Spain', '2025-12-15 11:47:56', '2026-03-01', NULL, NULL, 3, 4799.97, 'confirmed', 'paid', '2025-12-15 22:48:25', '2025-12-15 11:47:56', '2025-12-15 11:48:25'),
(53, 8, 'hotel', 'HOTEL93471765819169', 1, 'Grand Hotel Mumbai - Mumbai', '2025-12-15 11:49:29', '2025-12-15', '2025-12-16', '2025-12-17', 2, 10000.00, 'confirmed', 'paid', '2025-12-15 22:50:08', '2025-12-15 11:49:29', '2025-12-15 11:50:08'),
(54, 8, 'cruise', 'CRUISE55631765819234', 2, 'Carnival Cruise - Mardi Gras', '2025-12-15 11:50:34', '2026-02-05', NULL, NULL, 2, 70000.00, 'confirmed', 'paid', '2025-12-15 22:50:48', '2025-12-15 11:50:34', '2025-12-15 11:50:48'),
(55, 8, 'holiday', 'HOLIDAY8416176581927', 17, 'Saudi Heritage Experience - Saudi Arabia', '2025-12-15 11:51:17', '2026-01-05', NULL, NULL, 2, 3199.98, 'confirmed', 'paid', '2025-12-15 22:52:07', '2025-12-15 11:51:17', '2025-12-15 11:52:07'),
(56, 8, 'hotel', 'HOTEL10881765819344', 3, 'Heritage Palace Jaipur - Jaipur', '2025-12-15 11:52:24', '2025-12-15', '2025-12-16', '2025-12-17', 4, 16000.00, 'confirmed', 'paid', '2025-12-15 22:52:50', '2025-12-15 11:52:24', '2025-12-15 11:52:50'),
(57, 8, 'holiday', 'HOLIDAY9417176581944', 12, 'Cherry Blossom Special - Japan', '2025-12-15 11:54:05', '2026-03-05', NULL, NULL, 2, 4999.98, 'confirmed', 'paid', '2025-12-15 22:54:46', '2025-12-15 11:54:05', '2025-12-15 11:54:46'),
(58, 8, 'holiday', 'HOLIDAY9083176582020', 13, 'Greek Island Hopping - Greece', '2025-12-15 12:06:49', '2026-05-01', NULL, NULL, 4, 6799.96, 'confirmed', 'paid', '2025-12-15 23:07:15', '2025-12-15 12:06:49', '2025-12-15 12:07:15'),
(59, 8, 'holiday', 'HOLIDAY6833176582025', 26, 'K-Pop & Korean Culture - South Korea', '2025-12-15 12:07:38', '2026-05-05', NULL, NULL, 1, 1699.99, 'confirmed', 'paid', '2025-12-15 23:07:54', '2025-12-15 12:07:38', '2025-12-15 12:07:54'),
(60, 8, 'flight', 'FLIGHT88821765820293', 4, 'Emirates EM125 - Abu Dhabi to Kolkata', '2025-12-15 12:08:13', '2026-03-02', NULL, NULL, 2, 43000.00, 'confirmed', 'paid', '2025-12-15 23:08:39', '2025-12-15 12:08:13', '2025-12-15 12:08:39'),
(61, 5, 'train', 'TRAIN50261765823107', 3, 'Duronto Express (12259) - Mumbai to Bangalore', '2025-12-15 12:55:07', '2026-08-02', NULL, NULL, 2, 3600.00, 'confirmed', 'paid', '2025-12-15 23:55:36', '2025-12-15 12:55:07', '2025-12-15 12:55:36'),
(62, 5, 'holiday', 'HOLIDAY3200176582319', 12, 'Cherry Blossom Special - Japan', '2025-12-15 12:56:36', '2026-08-05', NULL, NULL, 5, 12499.95, 'confirmed', 'paid', '2025-12-15 23:56:56', '2025-12-15 12:56:36', '2025-12-15 12:56:56'),
(63, 5, 'holiday', 'HOLIDAY1792176582325', 21, 'Australian Alpine Retreat - Australia', '2025-12-15 12:57:38', '2026-03-05', NULL, NULL, 3, 4499.97, 'confirmed', 'paid', '2025-12-15 23:57:47', '2025-12-15 12:57:38', '2025-12-15 12:57:47'),
(64, 5, 'holiday', 'HOLIDAY5830176582415', 24, 'Singapore Tech & Culture - Singapore', '2025-12-15 13:12:33', '2026-05-01', NULL, NULL, 2, 1999.98, 'confirmed', 'paid', '2025-12-16 00:13:02', '2025-12-15 13:12:33', '2025-12-15 13:13:02'),
(65, 5, 'holiday', 'HOLIDAY2347176582558', 4, 'Romantic Paris Getaway - France', '2025-12-15 13:36:21', '2026-03-01', NULL, NULL, 2, 3799.98, 'confirmed', 'paid', '2025-12-16 00:36:55', '2025-12-15 13:36:21', '2025-12-15 13:36:55'),
(66, 5, 'cruise', 'CRUISE49251765825801', 3, 'Norwegian Cruise - Wonder of the Seas', '2025-12-15 13:40:01', '2027-01-01', NULL, NULL, 1, 75000.00, 'confirmed', 'paid', '2025-12-16 00:40:26', '2025-12-15 13:40:01', '2025-12-15 13:40:26'),
(67, 1, 'holiday', 'HOLIDAY2135176588350', 29, 'Moscow & St. Petersburg Imperial Tour - Russia', '2025-12-16 11:11:48', '2026-02-05', NULL, NULL, 1, 249000.00, 'confirmed', 'paid', '2025-12-16 16:42:00', '2025-12-16 11:11:48', '2025-12-16 11:12:00'),
(68, 1, 'flight', 'FLIGHT94881765964624', 4, 'Emirates EM125 - Abu Dhabi to Kolkata', '2025-12-17 09:43:44', '2026-01-01', NULL, NULL, 1, 21500.00, 'confirmed', 'paid', '2025-12-17 15:14:06', '2025-12-17 09:43:44', '2025-12-17 09:44:06'),
(69, 1, 'holiday', 'HOLIDAY3157176598780', 3, 'Himachal Hill Station - India', '2025-12-17 16:10:05', '2026-01-11', NULL, NULL, 2, 44000.00, 'confirmed', 'paid', '2025-12-17 21:40:23', '2025-12-17 16:10:05', '2025-12-17 16:10:23'),
(70, 1, 'train', 'TRAIN84421765991969', 3, 'Duronto Express (12259) - Mumbai to Bangalore', '2025-12-17 17:19:29', '2026-02-01', NULL, NULL, 1, 1800.00, 'confirmed', 'paid', '2025-12-17 22:49:38', '2025-12-17 17:19:29', '2025-12-17 17:19:38'),
(71, 1, 'hotel', 'HOTEL83921765992574', 1, 'Grand Hotel Mumbai - Mumbai', '2025-12-17 17:29:34', '2025-12-17', '2025-12-18', '2025-12-21', 1, 15000.00, 'confirmed', 'paid', '2025-12-17 22:59:43', '2025-12-17 17:29:34', '2025-12-17 17:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
CREATE TABLE IF NOT EXISTS `buses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bus_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bus_number` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `departure_city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `arrival_city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available_seats` int DEFAULT '40',
  `total_seats` int DEFAULT '40',
  `bus_type` enum('sleeper','semi_sleeper','seater','ac','non_ac') COLLATE utf8mb4_general_ci DEFAULT 'seater',
  `status` enum('active','inactive','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `bus_name`, `bus_number`, `departure_city`, `arrival_city`, `departure_time`, `arrival_time`, `departure_date`, `arrival_date`, `price`, `available_seats`, `total_seats`, `bus_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Volvo AC Sleeper', 'VH001', 'Mumbai', 'Pune', '22:00:00', '02:00:00', '2025-12-19', '2025-12-20', 800.00, 30, 40, 'sleeper', 'active', '2025-12-12 04:08:05', '2025-12-12 04:08:05'),
(2, 'Luxury Seater', 'LS205', 'Delhi', 'Agra', '08:00:00', '12:00:00', '2025-12-19', '2025-12-19', 500.00, 34, 40, 'seater', 'active', '2025-12-12 04:08:05', '2025-12-12 06:38:18'),
(3, 'Semi Sleeper AC', 'SS301', 'Bangalore', 'Mysore', '10:00:00', '14:30:00', '2025-12-19', '2025-12-19', 600.00, 25, 40, 'semi_sleeper', 'active', '2025-12-12 04:08:05', '2025-12-12 04:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `cruises`
--

DROP TABLE IF EXISTS `cruises`;
CREATE TABLE IF NOT EXISTS `cruises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cruise_line` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `ship_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `departure_port` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `itinerary_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `departure_date` date NOT NULL,
  `duration_nights` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available_cabins` int DEFAULT '20',
  `total_cabins` int DEFAULT '20',
  `cabin_type` enum('inside','ocean_view','balcony','suite') COLLATE utf8mb4_general_ci DEFAULT 'inside',
  `amenities` text COLLATE utf8mb4_general_ci,
  `description` text COLLATE utf8mb4_general_ci,
  `image_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','inactive','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cruises`
--

INSERT INTO `cruises` (`id`, `cruise_line`, `ship_name`, `departure_port`, `itinerary_type`, `departure_date`, `duration_nights`, `price`, `available_cabins`, `total_cabins`, `cabin_type`, `amenities`, `description`, `image_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Royal Caribbean', 'Symphony of the Seas', 'Mumbai', 'Caribbean', '2025-12-26', 7, 45000.00, 12, 20, 'balcony', 'Pool, Spa, Multiple Restaurants, Entertainment', 'Luxury Caribbean cruise experience', './tour_images/royalc.jpg', 'active', '2025-12-12 04:08:05', '2025-12-15 09:43:42'),
(2, 'Carnival Cruise', 'Mardi Gras', 'Goa', 'Mediterranean', '2026-01-02', 5, 35000.00, 14, 20, 'ocean_view', 'Pool, Casino, Shows, Kids Club', 'Family-friendly Mediterranean cruise', './tour_images/carnivalc.jpeg', 'active', '2025-12-12 04:08:05', '2025-12-15 11:50:34'),
(3, 'Norwegian Cruise', 'Wonder of the Seas', 'Mumbai', 'Alaska', '2026-01-11', 10, 75000.00, 10, 20, 'suite', 'Spa, Fine Dining, Excursions, Balcony', 'Premium Alaska adventure cruise', './tour_images/norwayc.jpg', 'active', '2025-12-12 04:08:05', '2025-12-15 13:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
CREATE TABLE IF NOT EXISTS `flights` (
  `id` int NOT NULL AUTO_INCREMENT,
  `airline` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `flight_number` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `departure_city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `arrival_city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available_seats` int DEFAULT '180',
  `total_seats` int DEFAULT '180',
  `class_type` enum('economy','business','first') COLLATE utf8mb4_general_ci DEFAULT 'economy',
  `status` enum('active','inactive','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `airline`, `flight_number`, `departure_city`, `arrival_city`, `departure_time`, `arrival_time`, `departure_date`, `arrival_date`, `price`, `available_seats`, `total_seats`, `class_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Air India', 'AI101', 'Mumbai', 'Delhi', '08:00:00', '10:30:00', '2025-12-19', '2025-12-19', 9500.00, 147, 180, 'economy', 'active', '2025-12-12 04:08:04', '2025-12-15 06:19:24'),
(2, 'IndiGo', '6E205', 'Mumbai', 'Goa', '09:15:00', '10:30:00', '2025-12-19', '2025-12-19', 4500.00, 120, 180, 'economy', 'active', '2025-12-12 04:08:04', '2025-12-12 04:08:04'),
(3, 'SpiceJet', 'SG301', 'Delhi', 'Bangalore', '14:00:00', '16:45:00', '2025-12-19', '2025-12-19', 7000.00, 100, 180, 'economy', 'active', '2025-12-12 04:08:04', '2025-12-12 06:16:31'),
(4, 'Emirates', 'EM125', 'Abu Dhabi', 'Kolkata', '00:00:00', '01:00:00', '2025-12-19', '2025-12-19', 21500.00, 177, 180, 'business', 'active', '2025-12-15 06:25:13', '2025-12-17 09:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `holiday_packages`
--

DROP TABLE IF EXISTS `holiday_packages`;
CREATE TABLE IF NOT EXISTS `holiday_packages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `destination` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `duration_days` int NOT NULL,
  `duration_nights` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `hotel_category` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meal_plan` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `package_type` enum('honeymoon','family','adventure','beach','hill_station','international') COLLATE utf8mb4_general_ci DEFAULT 'family',
  `includes_flights` tinyint(1) DEFAULT '0',
  `description` text COLLATE utf8mb4_general_ci,
  `itinerary` text COLLATE utf8mb4_general_ci,
  `image_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `available_slots` int DEFAULT '10',
  `total_slots` int DEFAULT '10',
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holiday_packages`
--

INSERT INTO `holiday_packages` (`id`, `package_name`, `destination`, `duration_days`, `duration_nights`, `price`, `hotel_category`, `meal_plan`, `package_type`, `includes_flights`, `description`, `itinerary`, `image_url`, `available_slots`, `total_slots`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Goa Beach Paradise', 'India', 4, 3, 15000.00, 'luxury', 'breakfast', 'beach', 1, 'Perfect beach holiday with luxury resort stay', 'Day 1: Arrival & Beach, Day 2: Water Sports, Day 3: Sightseeing, Day 4: Departure', './tour_images/goa.jpg', 8, 10, 'active', '2025-12-12 04:08:05', '2025-12-15 04:15:56'),
(2, 'Rajasthan Royal Tour', 'India', 7, 6, 35000.00, 'standard', 'half-board', 'family', 1, 'Explore the royal heritage of Rajasthan', 'Visit Jaipur, Udaipur, Jodhpur with heritage hotels', './tour_images/rajasthan.jpeg', 5, 10, 'active', '2025-12-12 04:08:05', '2025-12-13 00:43:49'),
(3, 'Himachal Hill Station', 'India', 5, 4, 22000.00, 'standard', 'breakfast', 'hill_station', 1, 'Mountain adventure with scenic views', 'Manali, Shimla tour with mountain activities', './tour_images/himachal.jpeg', 8, 10, 'active', '2025-12-12 04:08:05', '2025-12-17 16:10:05'),
(4, 'Romantic Paris Getaway', 'France', 7, 6, 1899.99, '4-star', 'Breakfast & Dinner', 'honeymoon', 1, 'Experience the city of love with Eiffel Tower visits, Seine river cruise, and romantic dinners.', 'Day 1: Arrival & Welcome Dinner\nDay 2: Eiffel Tower & Louvre Museum\nDay 3: Seine River Cruise\nDay 4: Versailles Palace\nDay 5: Montmartre & Sacré-Cœur\nDay 6: Free Day Shopping\nDay 7: Departure', './tour_images/france.jpg', 6, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 13:36:21'),
(5, 'Spanish Fiesta Tour', 'Spain', 8, 7, 1599.99, '', 'All Inclusive', 'family', 1, 'Explore Madrid, Barcelona, and experience authentic Spanish culture and cuisine.', 'Day 1: Madrid Arrival\r\nDay 2: Prado Museum & Royal Palace\r\nDay 3: Train to Barcelona\r\nDay 4: Sagrada Familia\r\nDay 5: Park Güell & Gothic Quarter\r\nDay 6: Beach Day\r\nDay 7: Montserrat Day Trip\r\nDay 8: Departure', './tour_images/spain.jpg', 5, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 13:01:55'),
(6, 'American Dream Tour', 'United States', 10, 9, 2999.99, '', 'Breakfast Only', 'adventure', 1, 'New York City, Las Vegas, and Los Angeles - experience the best of America.', 'Day 1: NYC Arrival\r\nDay 2: Statue of Liberty\r\nDay 3: Broadway Show\r\nDay 4: Fly to Las Vegas\r\nDay 5: Grand Canyon Tour\r\nDay 6: Fly to LA\r\nDay 7: Hollywood & Beverly Hills\r\nDay 8: Disneyland\r\nDay 9: Santa Monica Beach\r\nDay 10: Departure', './tour_images/us.jpg', 5, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 13:02:25'),
(7, 'Cappadocia Hot Air Balloon Experience', 'Turkey', 6, 5, 1299.99, '5-star', 'Half Board', 'adventure', 1, 'Magical hot air balloon rides, cave hotels, and ancient historical sites.', 'Day 1: Istanbul Arrival\nDay 2: Hagia Sophia & Blue Mosque\nDay 3: Fly to Cappadocia\nDay 4: Hot Air Balloon Ride\nDay 5: Underground City Tour\nDay 6: Departure', './tour_images/turkey.jpeg', 5, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:42'),
(8, 'Italian Renaissance Tour', 'Italy', 9, 8, 2199.99, '4-star', 'Breakfast & Dinner', 'honeymoon', 1, 'Rome, Florence, and Venice - experience art, history, and romance.', 'Day 1: Rome Arrival\nDay 2: Colosseum & Roman Forum\nDay 3: Vatican City\nDay 4: Train to Florence\nDay 5: Uffizi Gallery\nDay 6: Tuscany Wine Tour\nDay 7: Train to Venice\nDay 8: Gondola Ride\nDay 9: Departure', './tour_images/Italy.jpg', 9, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:42'),
(9, 'Mayan Riviera Adventure', 'Mexico', 7, 6, 1499.99, '5-star', 'All Inclusive', 'beach', 1, 'Beautiful beaches, ancient ruins, and vibrant Mexican culture.', 'Day 1: Cancun Arrival\nDay 2: Chichen Itza Tour\nDay 3: Tulum Ruins\nDay 4: Beach Day\nDay 5: Xcaret Park\nDay 6: Isla Mujeres\nDay 7: Departure', './tour_images/mexico.jpg', 8, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:42'),
(10, 'British Heritage Tour', 'United Kingdom', 8, 7, 1799.99, '4-star', 'Bed & Breakfast', 'family', 1, 'London, Stonehenge, and Edinburgh - explore British history and culture.', 'Day 1: London Arrival\nDay 2: Buckingham Palace\nDay 3: British Museum\nDay 4: Stonehenge & Bath\nDay 5: Train to Edinburgh\nDay 6: Edinburgh Castle\nDay 7: Scottish Highlands\nDay 8: Departure', './tour_images/uk.jpeg', 6, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:42'),
(11, 'German Castles & Beer Tour', 'Germany', 7, 6, 1399.99, '3-star', 'Breakfast Only', 'adventure', 1, 'Explore Neuschwanstein Castle, Berlin Wall, and experience Oktoberfest culture.', 'Day 1: Berlin Arrival\nDay 2: Berlin Wall & Brandenburg Gate\nDay 3: Train to Munich\nDay 4: Neuschwanstein Castle\nDay 5: Munich City Tour\nDay 6: Nuremberg Day Trip\nDay 7: Departure', './tour_images/germany.jpg', 9, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 09:58:50'),
(12, 'Cherry Blossom Special', 'Japan', 10, 9, 2499.99, '', '', 'international', 1, 'Tokyo, Kyoto, and Mount Fuji during cherry blossom season.', 'Day 1: Tokyo Arrival\r\nDay 2: Shibuya & Shinjuku\r\nDay 3: Tokyo Disneyland\r\nDay 4: Bullet Train to Kyoto\r\nDay 5: Fushimi Inari Shrine\r\nDay 6: Osaka Day Trip\r\nDay 7: Mount Fuji Tour\r\nDay 8: Hakone Onsen\r\nDay 9: Free Day\r\nDay 10: Departure', './tour_images/japan.jpg', 5, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 13:01:29'),
(13, 'Greek Island Hopping', 'Greece', 8, 7, 1699.99, '4-star', 'Breakfast Only', 'beach', 1, 'Santorini, Mykonos, and Athens - beautiful sunsets and ancient ruins.', 'Day 1: Athens Arrival\nDay 2: Acropolis Tour\nDay 3: Ferry to Mykonos\nDay 4: Mykonos Beaches\nDay 5: Ferry to Santorini\nDay 6: Oia Sunset\nDay 7: Volcano Tour\nDay 8: Departure', './tour_images/greece.jpg', 3, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 12:06:49'),
(14, 'Great Wall & Forbidden City', 'China', 9, 8, 1899.99, '4-star', 'Full Board', 'international', 1, 'Beijing, Shanghai, and the Great Wall of China.', 'Day 1: Beijing Arrival\nDay 2: Forbidden City\nDay 3: Great Wall Tour\nDay 4: Summer Palace\nDay 5: Fly to Shanghai\nDay 6: The Bund & Yu Garden\nDay 7: Disneyland Shanghai\nDay 8: Zhujiajiao Water Town\nDay 9: Departure', './tour_images/china.jpeg', 5, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 11:20:51'),
(15, 'Thai Beach Paradise', 'Thailand', 7, 6, 999.99, '5-star', 'All Inclusive', 'beach', 1, 'Phuket, Phi Phi Islands, and Bangkok - tropical paradise experience.', 'Day 1: Bangkok Arrival\nDay 2: Grand Palace & Temples\nDay 3: Fly to Phuket\nDay 4: Phi Phi Islands Tour\nDay 5: James Bond Island\nDay 6: Beach Relaxation\nDay 7: Departure', './tour_images/thailand.jpg', 3, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:42'),
(16, 'Hong Kong City Lights', 'Hong Kong (Special Administrative Region)', 5, 4, 1299.99, '4-star', 'Bed & Breakfast', 'family', 1, 'Victoria Peak, Disneyland, and vibrant street markets.', 'Day 1: Arrival\nDay 2: Victoria Peak & Star Ferry\nDay 3: Disneyland Hong Kong\nDay 4: Lantau Island & Big Buddha\nDay 5: Departure', './tour_images/hong kong.jpg', 5, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 09:56:32'),
(17, 'Saudi Heritage Experience', 'Saudi Arabia', 6, 5, 1599.99, '5-star', 'Half Board', 'adventure', 1, 'Modern cities and ancient historical sites in Riyadh and AlUla.', 'Day 1: Riyadh Arrival\nDay 2: Diriyah & National Museum\nDay 3: Fly to AlUla\nDay 4: Hegra Archaeological Site\nDay 5: Elephant Rock & Old Town\nDay 6: Departure', './tour_images/saudiarabia.jpg', 8, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 11:51:17'),
(18, 'Malaysian Twin City Tour', 'Malaysia', 7, 6, 1199.99, '4-star', 'Breakfast Only', 'family', 1, 'Kuala Lumpur city lights and Langkawi island paradise.', 'Day 1: Kuala Lumpur Arrival\nDay 2: Petronas Towers\nDay 3: Batu Caves\nDay 4: Fly to Langkawi\nDay 5: Island Hopping\nDay 6: Cable Car & Sky Bridge\nDay 7: Departure', './tour_images/malaysia.jpg', 4, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 11:04:33'),
(19, 'Canadian Rockies Adventure', 'Canada', 8, 7, 1999.99, '4-star', 'Breakfast Only', 'adventure', 1, 'Banff, Lake Louise, and Vancouver - breathtaking mountain scenery.', 'Day 1: Vancouver Arrival\nDay 2: Stanley Park & Capilano\nDay 3: Fly to Calgary\nDay 4: Banff National Park\nDay 5: Lake Louise & Moraine Lake\nDay 6: Columbia Icefield\nDay 7: Jasper National Park\nDay 8: Departure', './tour_images/canada.jpg', 6, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:42'),
(20, 'Dubai Luxury Experience', 'United Arab Emirates', 5, 4, 1799.99, '5-star', 'All Inclusive', 'family', 1, 'Burj Khalifa, desert safari, and luxury shopping in Dubai.', 'Day 1: Dubai Arrival\nDay 2: Burj Khalifa & Dubai Mall\nDay 3: Desert Safari\nDay 4: Palm Jumeirah & Atlantis\nDay 5: Departure', './tour_images/uae.jpg', 2, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 08:23:10'),
(21, 'Australian Picnics & Barbeques', 'Australia', 7, 6, 1499.99, '', '', 'hill_station', 1, 'Unique island continent, the world\'s sixth-largest country, known for its vast, arid Outback, unique wildlife (kangaroos, platypuses), stunning coastlines (Great Barrier Reef).', 'Day 1: Arrival in Sydney\r\nDay 2: Sydney City Tour\r\nDay 3: Blue Mountains Day Trip\r\nDay 4: Flight to Melbourne\r\nDay 5: Great Ocean Road Tour\r\nDay 6: Gold Coast Leisure Day\r\nDay 7: Departure', './tour_images/australia.jpg', 2, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 13:18:40'),
(22, 'Portuguese Coastal Tour', 'Portugal', 7, 6, 1399.99, '4-star', 'Breakfast Only', 'beach', 1, 'Lisbon, Porto, and Algarve - stunning coastlines and historic cities.', 'Day 1: Lisbon Arrival\nDay 2: Belém Tower & Jerónimos\nDay 3: Sintra Day Trip\nDay 4: Train to Porto\nDay 5: Port Wine Tasting\nDay 6: Douro Valley\nDay 7: Departure', './tour_images/portugal.jpg', 7, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:42'),
(23, 'Dutch Tulip Festival', 'Netherlands', 6, 5, 1299.99, '3-star', 'Bed & Breakfast', 'family', 1, 'Keukenhof gardens, Amsterdam canals, and windmills.', 'Day 1: Amsterdam Arrival\nDay 2: Canal Cruise & Rijksmuseum\nDay 3: Keukenhof Gardens\nDay 4: Zaanse Schans Windmills\nDay 5: Volendam & Marken\nDay 6: Departure', './tour_images/natherlands.jpg', 4, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:42'),
(24, 'Singapore Tech & Culture', 'Singapore', 6, 5, 999.99, '', 'Breakfast Only', 'family', 1, 'Known for its futuristic skyline (Marina Bay Sands, Gardens by the Bay), world-class food scene (hawker centres, Singapore Sling), incredible cleanliness, efficient infrastructure, multicultural diversity (Chinatown, Little India), and status as a global financial hub, seamlessly blending lush greenery with cutting-edge modernity.  ', 'Day 1: Singapore Arrival & Marina Bay\r\nDay 2: Sentosa Island Adventure\r\nDay 3: Cultural Exploration & Clarke Quay\r\nDay 4: Gardens by the Bay & Shopping\r\nDay 5: Wildlife Encounters & Singapore Flyer\r\nDay 6: Jewel Changi Airport & Departure', './tour_images/singapore.jpg', 3, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 13:12:33'),
(25, 'Vietnam Highlights Tour', 'Vietnam', 9, 8, 1499.99, '4-star', 'Breakfast & Dinner', 'adventure', 1, 'Halong Bay cruise, Hanoi, and Ho Chi Minh City.', 'Day 1: Hanoi Arrival\nDay 2: Hanoi City Tour\nDay 3: Halong Bay Cruise\nDay 4: Halong Bay\nDay 5: Fly to Hoi An\nDay 6: Hoi An Ancient Town\nDay 7: Fly to Ho Chi Minh\nDay 8: Mekong Delta\nDay 9: Departure', './tour_images/vietnam.jpeg', 7, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 09:44:50'),
(26, 'K-Pop & Korean Culture', 'South Korea', 7, 6, 1699.99, '', 'Breakfast Only', 'international', 1, 'Seoul city tour, Korean food, and cultural experiences.', 'Day 1: Seoul Arrival\r\nDay 2: Gyeongbokgung Palace\r\nDay 3: DMZ Tour\r\nDay 4: N Seoul Tower & Myeongdong\r\nDay 5: Korean Cooking Class\r\nDay 6: Everland Theme Park\r\nDay 7: Departure', './tour_images/southkorea.jpg', 7, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 13:03:00'),
(27, 'Moroccan Desert Adventure', 'Morocco', 8, 7, 1399.99, '4-star', 'Half Board', 'adventure', 1, 'Marrakech, Sahara Desert, and Atlas Mountains.', 'Day 1: Marrakech Arrival\nDay 2: Jemaa el-Fnaa & Souks\nDay 3: Atlas Mountains Tour\nDay 4: Ait Benhaddou\nDay 5: Sahara Desert Camp\nDay 6: Camel Trek & Berber Villages\nDay 7: Return to Marrakech\nDay 8: Departure', './tour_images/morocco.jpg', 7, 10, 'active', '2025-12-12 08:01:48', '2025-12-13 00:33:43'),
(28, 'Egyptian Pyramids & Nile Cruise', 'Egypt', 8, 7, 1799.99, '5-star', 'All Inclusive', 'adventure', 1, 'Pyramids of Giza, Luxor temples, and Nile River cruise.', 'Day 1: Cairo Arrival\nDay 2: Pyramids & Sphinx\nDay 3: Egyptian Museum\nDay 4: Fly to Luxor\nDay 5: Valley of the Kings\nDay 6: Nile Cruise\nDay 7: Edfu & Kom Ombo\nDay 8: Departure', './tour_images/egypt.jpg', 4, 10, 'active', '2025-12-12 08:01:48', '2025-12-15 09:18:45'),
(29, 'Moscow & St. Petersburg Imperial Tour', 'Russia', 9, 8, 249000.00, '', 'Breakfast & Dinner', 'family', 1, 'Explore two of Russia\'s most iconic cities - the capital Moscow and cultural capital St. Petersburg with their magnificent palaces, cathedrals, and rich history.', 'Day 1: Moscow Arrival & Red Square\r\nDay 2: Kremlin & Armory Museum\r\nDay 3: St. Basil\'s Cathedral & GUM\r\nDay 4: High-speed train to St. Petersburg\r\nDay 5: Hermitage Museum & Winter Palace\r\nDay 6: Peterhof Palace & Fountain Park\r\nDay 7: Catherine Palace & Amber Room\r\nDay 8: Church of Savior on Blood & Canal Cruise\r\nDay 9: Departure from St. Petersburg', './tour_images/russia.jpg', 3, 10, 'active', '2025-12-12 23:51:47', '2025-12-16 11:11:48'),
(30, 'Mumbai Darshan - City Tour Package', 'India', 2, 1, 2999.00, '3-star', 'Breakfast & Dinner', 'family', 1, 'Explore the vibrant city of Mumbai with visits to Gateway of India, Marine Drive, Siddhivinayak Temple, and other iconic landmarks. Perfect weekend getaway to experience Maximum City.', 'Day 1: Arrival & Check-in, Gateway of India, Taj Mahal Palace, Colaba Causeway\nDay 2: Marine Drive, Chowpatty Beach, Haji Ali Dargah, Siddhivinayak Temple, Bandra-Worli Sea Link, Departure', './tour_images/mumbai.jpg', 9, 20, 'active', '2025-12-12 23:55:42', '2025-12-15 09:11:35');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `star_rating` int DEFAULT '3',
  `price_per_night` decimal(10,2) NOT NULL,
  `available_rooms` int DEFAULT '10',
  `total_rooms` int DEFAULT '10',
  `amenities` text COLLATE utf8mb4_general_ci,
  `description` text COLLATE utf8mb4_general_ci,
  `image_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `city`, `address`, `star_rating`, `price_per_night`, `available_rooms`, `total_rooms`, `amenities`, `description`, `image_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Grand Hotel Mumbai', 'Mumbai', 'Marine Drive, Mumbai', 5, 5000.00, 22, 10, 'WiFi, Pool, Spa, Restaurant', 'Luxury hotel with ocean view', './tour_images/mumbaiht.jpg', 'active', '2025-12-12 04:08:05', '2025-12-17 17:29:34'),
(2, 'Beach Resort Goa', 'Goa', 'Calangute Beach, Goa', 4, 7500.00, 26, 10, 'WiFi, Pool, Beach Access, Bar', 'Beachfront resort with modern amenities', './tour_images/goaht.jpg', 'active', '2025-12-12 04:08:05', '2025-12-15 10:10:16'),
(3, 'Heritage Palace Jaipur', 'Jaipur', 'City Center, Jaipur', 4, 4000.00, 11, 10, 'WiFi, Restaurant, Spa, Heritage Tours', 'Traditional Rajasthani architecture', './tour_images/jaipurht.jpg', 'active', '2025-12-12 04:08:05', '2025-12-15 11:52:24');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('credit_card','debit_card','net_banking','upi','wallet') COLLATE utf8mb4_general_ci DEFAULT 'credit_card',
  `transaction_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_status` enum('pending','success','failed','refunded') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `payment_details` text COLLATE utf8mb4_general_ci,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `booking_id` (`booking_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `user_id`, `amount`, `payment_method`, `transaction_id`, `payment_status`, `payment_details`, `payment_date`, `created_at`) VALUES
(1, 7, 5, 500.00, 'debit_card', 'TXN17655611068426', 'success', NULL, '2025-12-12 06:38:26', '2025-12-15 09:17:45'),
(2, 7, 5, 500.00, 'upi', 'TXN17655611387506', 'success', NULL, '2025-12-12 06:38:58', '2025-12-15 09:17:45'),
(3, 8, 5, 2500.00, 'credit_card', 'TXN17655611724651', 'success', NULL, '2025-12-12 06:39:32', '2025-12-15 09:17:45'),
(4, 10, 5, 17000.00, 'credit_card', 'TXN17655612209351', 'success', NULL, '2025-12-12 06:40:20', '2025-12-15 09:17:45'),
(5, 11, 5, 7000.00, 'credit_card', 'TXN17655616704363', 'success', NULL, '2025-12-12 06:47:50', '2025-12-15 09:17:45'),
(6, 12, 5, 45000.00, 'net_banking', 'TXN17655618271230', 'success', NULL, '2025-12-12 06:50:27', '2025-12-15 09:17:45'),
(7, 13, 5, 15000.00, 'debit_card', 'TXN17655635038805', 'success', NULL, '2025-12-12 07:18:23', '2025-12-15 09:17:45'),
(10, 18, 7, 35000.00, 'credit_card', 'TXN17656176345655', 'success', NULL, '2025-12-12 22:20:34', '2025-12-15 09:17:45'),
(11, 19, 7, 14995.00, 'debit_card', 'TXN17656273277026', 'success', NULL, '2025-12-13 01:02:07', '2025-12-15 09:17:45'),
(12, 20, 5, 4399.98, 'debit_card', 'TXN17657129179589', 'refunded', NULL, '2025-12-14 06:18:37', '2025-12-15 09:17:45'),
(13, 21, 5, 4000.00, 'debit_card', 'TXN17657129751307', 'success', NULL, '2025-12-14 06:19:35', '2025-12-15 09:17:45'),
(14, 23, 5, 17500.00, 'debit_card', 'TXN17657156345961', 'success', NULL, '2025-12-14 07:03:54', '2025-12-15 09:17:45'),
(15, 24, 5, 13599.92, 'credit_card', 'TXN17658001304451', 'refunded', NULL, '2025-12-15 06:32:10', '2025-12-15 09:17:45'),
(16, 25, 5, 5399.97, 'debit_card', 'TXN17658068001371', 'success', NULL, '2025-12-15 08:23:20', '2025-12-15 09:17:45'),
(17, 26, 5, 2999.00, 'wallet', 'TXN17658100732100', 'success', '{\"payment_method\":\"wallet\",\"card_number\":\"\",\"card_holder\":\"\",\"expiry_month\":\"\",\"expiry_year\":\"\",\"cvv\":\"\",\"upi_id\":\"\",\"bank_name\":\"\"}', '2025-12-15 09:17:53', '2025-12-15 09:17:53'),
(18, 27, 5, 1799.99, 'wallet', 'TXN17658101063402', 'success', '{\"payment_method\":\"wallet\",\"card_number\":\"\",\"card_holder\":\"\",\"expiry_month\":\"\",\"expiry_year\":\"\",\"cvv\":\"\",\"upi_id\":\"\",\"bank_name\":\"\"}', '2025-12-15 09:18:26', '2025-12-15 09:18:26'),
(19, 29, 5, 35000.00, 'debit_card', 'TXN17658115298530', 'success', '{\"method\":\"debit_card\",\"masked_card\":\"6351\",\"upi_id\":\"\",\"bank\":\"\"}', '2025-12-15 09:42:09', '2025-12-15 09:42:09'),
(20, 30, 5, 75000.00, 'upi', 'TXN17658115838394', 'success', '{\"method\":\"upi\",\"masked_card\":null,\"upi_id\":\"jhbjbsa@ociii\",\"bank\":\"\"}', '2025-12-15 09:43:03', '2025-12-15 09:43:03'),
(21, 31, 5, 45000.00, 'wallet', 'TXN17658116053553', 'success', '{\"method\":\"wallet\",\"masked_card\":null,\"upi_id\":\"\",\"bank\":\"\"}', '2025-12-15 09:43:25', '2025-12-15 09:43:25'),
(22, 32, 5, 45000.00, 'credit_card', 'TXN17658116469624', 'success', '{\"method\":\"credit_card\",\"masked_card\":\"2616\",\"upi_id\":\"\",\"bank\":\"\"}', '2025-12-15 09:44:06', '2025-12-15 09:44:06'),
(23, 33, 5, 1499.99, 'debit_card', 'TXN17658119445850', 'success', '{\"method\":\"debit_card\",\"masked_card\":\"4444\",\"upi_id\":\"\",\"bank\":\"\"}', '2025-12-15 09:49:04', '2025-12-15 09:49:04'),
(24, 34, 5, 7500.00, 'debit_card', 'TXN17658120395757', 'success', '{\"method\":\"debit_card\",\"masked_card\":\"4444\",\"upi_id\":\"\",\"bank\":\"\"}', '2025-12-15 09:50:39', '2025-12-15 09:50:39'),
(25, 35, 5, 3899.97, 'debit_card', 'TXN17658124691123', 'success', '{\"method\":\"debit_card\",\"masked_card\":\"4444\",\"upi_id\":\"\",\"bank\":\"\"}', '2025-12-15 09:57:49', '2025-12-15 09:57:49'),
(26, 36, 5, 1399.99, 'upi', 'TXN17658125949341', 'success', '{\"method\":\"upi\",\"masked_card\":null,\"upi_id\":\"asd@asd\",\"bank\":\"\"}', '2025-12-15 09:59:54', '2025-12-15 09:59:54'),
(27, 37, 5, 20000.00, 'wallet', 'TXN17658126782104', 'success', '{\"method\":\"wallet\",\"masked_card\":null,\"upi_id\":\"\",\"bank\":\"\"}', '2025-12-15 10:01:18', '2025-12-15 10:01:18'),
(44, 61, 5, 3600.00, 'debit_card', 'TXN17658231364504', 'success', '{\"method\":\"debit_card\",\"masked_card\":\"6315\",\"upi_id\":null}', '2025-12-15 12:55:36', '2025-12-15 12:55:36'),
(45, 62, 5, 12499.95, 'credit_card', 'TXN17658232162666', 'success', '{\"method\":\"credit_card\",\"masked_card\":\"6232\",\"upi_id\":null}', '2025-12-15 12:56:56', '2025-12-15 12:56:56'),
(46, 63, 5, 4499.97, 'upi', 'TXN17658232679487', 'success', '{\"method\":\"upi\",\"masked_card\":null,\"upi_id\":\"maha@okic\"}', '2025-12-15 12:57:47', '2025-12-15 12:57:47'),
(47, 64, 5, 1999.98, 'debit_card', 'TXN17658241828145', 'success', '{\"method\":\"debit_card\",\"masked_card\":\"5959\",\"upi_id\":null}', '2025-12-15 13:13:02', '2025-12-15 13:13:02'),
(48, 65, 5, 3799.98, 'upi', 'TXN17658256154419', 'success', '{\"method\":\"upi\",\"masked_card\":null,\"upi_id\":\"mhavir@kae\"}', '2025-12-15 13:36:55', '2025-12-15 13:36:55'),
(49, 66, 5, 75000.00, 'credit_card', 'TXN17658258261261', 'success', '{\"method\":\"credit_card\",\"masked_card\":\"1651\",\"upi_id\":null}', '2025-12-15 13:40:26', '2025-12-15 13:40:26'),
(50, 67, 1, 249000.00, 'upi', 'TXN17658835205637', 'success', '{\"method\":\"upi\",\"masked_card\":null,\"upi_id\":\"mahavir@upi\"}', '2025-12-16 11:12:00', '2025-12-16 11:12:00'),
(51, 68, 1, 21500.00, 'credit_card', 'TXN17659646465976', 'success', '{\"method\":\"credit_card\",\"masked_card\":\"3203\",\"upi_id\":null}', '2025-12-17 09:44:06', '2025-12-17 09:44:06'),
(52, 69, 1, 44000.00, 'credit_card', 'TXN17659878233353', 'success', '{\"method\":\"credit_card\",\"masked_card\":\"2632\",\"upi_id\":null}', '2025-12-17 16:10:23', '2025-12-17 16:10:23'),
(53, 70, 1, 1800.00, 'upi', 'TXN17659919788864', 'success', '{\"method\":\"upi\",\"masked_card\":null,\"upi_id\":\"asdas@asi\"}', '2025-12-17 17:19:38', '2025-12-17 17:19:38'),
(54, 71, 1, 15000.00, 'upi', 'TXN17659925835552', 'success', '{\"method\":\"upi\",\"masked_card\":null,\"upi_id\":\"asdas@asr\"}', '2025-12-17 17:29:43', '2025-12-17 17:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
CREATE TABLE IF NOT EXISTS `trains` (
  `id` int NOT NULL AUTO_INCREMENT,
  `train_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `train_number` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `departure_station` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `arrival_station` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available_seats` int DEFAULT '50',
  `total_seats` int DEFAULT '50',
  `class_type` enum('sleeper','3AC','2AC','1AC','chair_car') COLLATE utf8mb4_general_ci DEFAULT 'sleeper',
  `status` enum('active','inactive','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`id`, `train_name`, `train_number`, `departure_station`, `arrival_station`, `departure_time`, `arrival_time`, `departure_date`, `arrival_date`, `price`, `available_seats`, `total_seats`, `class_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rajdhani Express', '12951', 'Mumbai Central', 'New Delhi', '16:25:00', '08:15:00', '2025-12-19', '2025-12-20', 2500.00, 39, 50, '3AC', 'active', '2025-12-12 04:08:05', '2025-12-12 06:39:29'),
(2, 'Shatabdi Express', '12009', 'Mumbai Central', 'Ahmedabad', '06:10:00', '12:25:00', '2025-12-19', '2025-12-19', 1500.00, 35, 50, 'chair_car', 'active', '2025-12-12 04:08:05', '2025-12-15 07:06:55'),
(3, 'Duronto Express', '12259', 'Mumbai', 'Bangalore', '23:05:00', '14:30:00', '2025-12-19', '2025-12-20', 1800.00, 42, 50, 'sleeper', 'active', '2025-12-12 04:08:05', '2025-12-17 17:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `reset_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`, `password`, `created_at`, `role`, `reset_token`, `token_expiry`) VALUES
(1, 'mahavirsinh', 'ms@gmail.com', '656566', '$2y$10$0RZ3S8z6pIiRvHmBZc649Oq9/LEOoJv1G4gE4agNzUtmzIgIpmtVq', '2025-12-10 20:00:52', 'user', NULL, NULL),
(5, 'mahavirsinh', 'ms@ms.com', '2322353535', '$2y$10$SroeL2Bwkev06PWT5P4S3edOCvF7lGZUiBE1kC07DM8lohXO6Jcaa', '2025-12-10 20:02:27', 'user', 'db1e3c93917051f4844d0ae62debb4def316e7582fa003081d76630b2de65df0', '2025-12-16 11:10:58'),
(7, 'mahavirsinh', 'ms@comail.com', '45454545', '$2y$10$fccOR7kV4.KFEux2dfiBbewLjmEJugRMwi6b76WkOmohQZVpC/tmW', '2025-12-10 22:43:00', 'user', NULL, NULL),
(9, 'Admin User', 'admin@travelease.com', '', '$2y$10$3SO0TwJ4ShPdhPX/O7Bii.rlcvnANdIY7g0Ib5unWgh/p0iQE8TgG', '2025-12-15 06:08:24', 'admin', NULL, NULL),
(10, 'mahavirsinh sodha', 'mahavirsinh2302@gmail.com', '7201807642', '$2y$10$cYl3qP6gZmMTPw.IJQ8p8epFK4svRWs1Mu55d.CBRBv2zbXrvUdkm', '2025-12-16 10:57:54', 'user', '5598676b631d074f655874faa941779ffb1a0b92ae857b82751cb0ceffb4f413', '2025-12-16 11:15:12');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
