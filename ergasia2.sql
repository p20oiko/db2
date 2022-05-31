-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2022 at 11:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ergasia2`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(5) NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `descr`) VALUES
(1, 'εκτυπωτής'),
(2, 'φαξ'),
(3, 'pc');

-- --------------------------------------------------------

--
-- Table structure for table `consumables`
--

CREATE TABLE `consumables` (
  `id` int(5) NOT NULL,
  `manufacturer` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `stock` int(5) NOT NULL,
  `stock_lim` int(5) NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `consumables`
--

INSERT INTO `consumables` (`id`, `manufacturer`, `stock`, `stock_lim`, `descr`, `manufacturer_id`) VALUES
(1, 'canon', 2, 2, 'μελάνι μαύρο', '12839'),
(2, 'hp', 7, 2, 'toner', '152346'),
(3, 'canon', 2, 1, 'έγχρωμο μελάνι', '54541');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(5) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `gen` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `family` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amka` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `pos` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `office` int(5) NOT NULL,
  `equipment` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `surname`, `gen`, `family`, `date`, `amka`, `pos`, `office`, `equipment`) VALUES
(1, 'Γιωργος', 'Παπαδοπουλος', 'ανδρας', '2παιδια', '2004-05-12', '22378000434', 'υπαληλος', 1, 4),
(2, 'Σταυρούλα', 'Οικονόμου', 'Γυναίκα', '1παιδι', '2017-05-03', '22110000005', 'υπαληλος', 1, 4),
(3, 'Αντώνης', 'Αντωνίου', 'ανδρας', '4παιδια', '1993-05-13', '21017000453', 'διευθυντής', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(5) NOT NULL,
  `manufacturer` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `invoice` int(10) NOT NULL,
  `features` text COLLATE utf8_unicode_ci NOT NULL,
  `category` int(5) NOT NULL,
  `office` int(5) NOT NULL,
  `consumables` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `manufacturer`, `model`, `date`, `invoice`, `features`, `category`, `office`, `consumables`) VALUES
(1, 'canon', 'mp740', '2009-04-09', 5000, 'ασπρόμαυρος', 1, 1, 1),
(2, 'canon', 'mp960', '2021-05-05', 3000, 'έγχρωμος', 1, 1, 3),
(3, 'hp', 'dx800', '2011-05-11', 500, '', 2, 2, 2),
(4, 'dell', 'rr235', '2015-05-13', 500, '', 3, 1, NULL),
(5, 'dell', 'rt356', '2009-05-07', 400, '', 3, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `id` int(5) NOT NULL,
  `descr` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`id`, `descr`) VALUES
(1, 'γραφείο 1'),
(2, 'γραφείο 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumables`
--
ALTER TABLE `consumables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amka` (`amka`),
  ADD KEY `office` (`office`),
  ADD KEY `equipment` (`equipment`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `office` (`office`),
  ADD KEY `consumables` (`consumables`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`office`) REFERENCES `office` (`id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`equipment`) REFERENCES `equipment` (`id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`office`) REFERENCES `office` (`id`),
  ADD CONSTRAINT `equipment_ibfk_3` FOREIGN KEY (`consumables`) REFERENCES `consumables` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
