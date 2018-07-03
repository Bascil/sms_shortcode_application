-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2018 at 03:46 PM
-- Server version: 5.6.39
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wiretech_secondary`
--

-- --------------------------------------------------------

--
-- Table structure for table `message_table`
--

CREATE TABLE `message_table` (
  `id` int(11) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `adm` varchar(5) NOT NULL,
  `fee_balance` varchar(6) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `date_posted` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_table`
--

INSERT INTO `message_table` (`id`, `student_name`, `adm`, `fee_balance`, `phone_number`, `date_posted`) VALUES
(1, 'Basil Ndonga', '4567', '13000', '+254728986084', '2018-06-20 11:14:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message_table`
--
ALTER TABLE `message_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message_table`
--
ALTER TABLE `message_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
