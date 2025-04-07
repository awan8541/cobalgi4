-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2021 at 07:40 AM
-- Server version: 5.6.47
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smarxyz1_ojegapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `api_key` varchar(500) NOT NULL,
  `google_api_key` varchar(250) NOT NULL,
  `driver_rate` varchar(5) NOT NULL,
  `paypal_id` varchar(250) NOT NULL,
  `paypal_password` varchar(250) NOT NULL,
  `signature` text NOT NULL,
  `paypal_account` enum('sandbox','live') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'sandbox'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `api_key`, `google_api_key`, `driver_rate`, `paypal_id`, `paypal_password`, `signature`, `paypal_account`) VALUES
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'AIzaSyANmEo6LFoCw_oBOqDoT9PET_W8y8FQeZM', '\r\nAIzaSyA_o1qdk40BWJifn8JnKqEqob3CO_GWiXE', '10', '-', '--', '-', 'sandbox');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `user_type`, `key`) VALUES
(1, 1, '', '5fMaOb0n352251308FGsgKh932965094'),
(2, 1, '', 'S7PrB7Bn43900168pnGv2tUZ26247078'),
(3, 1, '', '0Nx9KIEA01648217RLcF0DfT04554844'),
(4, 1, '', 'FW3A1Abz76557300FCQxJDAW32000407'),
(5, 1, '', 'mQz3fmmK80265042lL5TDn5Q98707214'),
(6, 1, '', 'MhGzI5yt37324416h59JIbwt26290475'),
(7, 1, '', '3FEMo98G31739042o1EtSKkh75012877'),
(8, 1, '', 'S10E4XEs45604261JVwh18A933226020'),
(9, 1, '', 'tXnTtFBk73597539bFexXtng69933343'),
(10, 1, '', '5OlE7GGt325581525mH9Zd5c38594091'),
(11, 1, '', '6Joh0Mfz96079773cwBYTRsK32420001'),
(12, 1, '', 'PkUmFt80229774607dFUxZq028741554'),
(13, 1, '', 'lReamp4q35643621slLtwXiv40866878'),
(14, 1, '', 'CbUaVXaW010568011xH2pgjf00418128');

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `amount` varchar(5) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

CREATE TABLE `rides` (
  `ride_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `driver_id` int(10) NOT NULL,
  `pickup_adress` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `drop_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `pikup_location` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `drop_locatoin` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `distance` varchar(50) NOT NULL,
  `status` enum('PENDING','ACCEPTED','COMPLETED','CANCELLED') DEFAULT 'PENDING',
  `payment_status` varchar(15) NOT NULL,
  `pay_driver` tinyint(1) DEFAULT '0',
  `payment_mode` varchar(25) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `value` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'FARE', '5'),
(2, 'UNIT', '$'),
(3, 'SMTP_HOST', ''),
(4, 'SMTP_PORT', ''),
(5, 'SMTP_USER', ''),
(6, 'SMTP_PASS', ''),
(7, 'FROM', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `country` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `mtype` varchar(2) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `gcm_token` text,
  `avatar` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utype` int(2) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` varchar(5) NOT NULL,
  `color` varchar(20) NOT NULL,
  `vehicle_no` varchar(20) NOT NULL,
  `license` varchar(50) NOT NULL,
  `insurance` varchar(50) NOT NULL,
  `permit` varchar(50) NOT NULL,
  `registration` varchar(50) NOT NULL,
  `vehicle_info` varchar(250) NOT NULL,
  `random` varchar(150) NOT NULL,
  `paypal_id` varchar(100) NOT NULL,
  `is_online` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `mobile`, `country`, `state`, `city`, `mtype`, `latitude`, `longitude`, `gcm_token`, `avatar`, `status`, `reg_date`, `utype`, `brand`, `model`, `year`, `color`, `vehicle_no`, `license`, `insurance`, `permit`, `registration`, `vehicle_info`, `random`, `paypal_id`, `is_online`) VALUES
(1, 'testing', 'najib.azfa@gmail.com', ' e10adc3949ba59abbe56e057f20f883e', '085863031490', 'null', 'null', 'null', '0', '-6.9129978', '106.9484921', 'dY0KsQ24vMQ:APA91bGIkLyEdDEXJ31c341EzR7KGV4P2M_Bc8zaOrrsIdcuMZZoGESWzHRRwnf-ijJBp8Dnu3EVj2YxsHxymlLBvCfgp_kc_zaPBUNT-Pdh_q_Bh5kiEnkz8Tmu4VzLrbUupmed30TN', 'avatar/img_1578998927772.jpg', 1, '2020-01-13 09:24:44', 1, 'Honda', 'Vario', '2020', 'Hitam', '1', 'avatar/img_1580111114877.jpg', 'avatar/img_1578999883317.jpg', 'avatar/img_157898921053.jpg', 'avatar/img_1580111123796.jpg', '', 'kE7zZfUhu6WNKrHP', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rides`
--
ALTER TABLE `rides`
  ADD PRIMARY KEY (`ride_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rides`
--
ALTER TABLE `rides`
  MODIFY `ride_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
