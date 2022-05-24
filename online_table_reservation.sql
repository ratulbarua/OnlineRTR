-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 03, 2020 at 09:45 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_food_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `customer_id` int(10) DEFAULT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `customer_contact` int(12) DEFAULT NULL,
  `customer_address` varchar(30) DEFAULT NULL,
  `departure_time` time NOT NULL,
  `d_boy_name` varchar(20) DEFAULT NULL,
  `d_boy_contact` int(12) DEFAULT NULL,
  `d_boy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `food_ordering`
--

CREATE TABLE `food_ordering` (
  `category` varchar(20) DEFAULT NULL,
  `r_name` varchar(20) DEFAULT NULL,
  `r_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `category` varchar(20) DEFAULT NULL,
  `item_name` varchar(20) DEFAULT NULL,
  `price` int(4) DEFAULT NULL,
  `rest_name` varchar(30) DEFAULT NULL,
  `rest_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_cart`
--

CREATE TABLE `order_cart` (
  `item_name` varchar(20) DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `price` int(5) DEFAULT NULL,
  `rest_id` int(10) DEFAULT NULL,
  `u_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `user_id` int(10) DEFAULT NULL,
  `total_bill` int(6) DEFAULT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `o_id` int(5) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurant_name` varchar(30) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `location` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `table_reservation`
--

CREATE TABLE `table_reservation` (
  `reserver_id` int(10) DEFAULT NULL,
  `reserver_name` varchar(20) DEFAULT NULL,
  `restaurant_id` int(10) DEFAULT NULL,
  `restaurant_name` varchar(30) DEFAULT NULL,
  `tables_booked` int(2) DEFAULT NULL,
  `reservation_date` date NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `table_status`
--

CREATE TABLE `table_status` (
  `restaurant_name` varchar(30) DEFAULT NULL,
  `restaurant_id` int(10) DEFAULT NULL,
  `no_of_tables` int(10) DEFAULT NULL,
  `tables_available` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_name` varchar(20) DEFAULT NULL,
  `u_contact` int(12) NOT NULL,
  `u_email` varchar(20) NOT NULL,
  `u_address` varchar(30) DEFAULT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`d_boy_id`),
  ADD KEY `customer_id` (`customer_id`,`customer_contact`);

--
-- Indexes for table `food_ordering`
--
ALTER TABLE `food_ordering`
  ADD KEY `r_id` (`r_id`,`r_name`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD KEY `rest_id` (`rest_id`,`rest_name`);

--
-- Indexes for table `order_cart`
--
ALTER TABLE `order_cart`
  ADD KEY `rest_id` (`rest_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `o_id` (`o_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurant_id`,`restaurant_name`);

--
-- Indexes for table `table_reservation`
--
ALTER TABLE `table_reservation`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `reserver_id` (`reserver_id`);

--
-- Indexes for table `table_status`
--
ALTER TABLE `table_status`
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`u_id`,`u_contact`,`u_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `d_boy_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_reservation`
--
ALTER TABLE `table_reservation`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD CONSTRAINT `delivery_boy_ibfk_1` FOREIGN KEY (`customer_id`,`customer_contact`) REFERENCES `user_details` (`u_id`, `u_contact`);

--
-- Constraints for table `food_ordering`
--
ALTER TABLE `food_ordering`
  ADD CONSTRAINT `food_ordering_ibfk_1` FOREIGN KEY (`r_id`,`r_name`) REFERENCES `restaurants` (`restaurant_id`, `restaurant_name`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`rest_id`,`rest_name`) REFERENCES `restaurants` (`restaurant_id`, `restaurant_name`);

--
-- Constraints for table `order_cart`
--
ALTER TABLE `order_cart`
  ADD CONSTRAINT `order_cart_ibfk_1` FOREIGN KEY (`rest_id`) REFERENCES `restaurants` (`restaurant_id`),
  ADD CONSTRAINT `order_cart_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user_details` (`u_id`);

--
-- Constraints for table `order_status`
--
ALTER TABLE `order_status`
  ADD CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`u_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `order_status` (`order_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`u_id`);

--
-- Constraints for table `table_reservation`
--
ALTER TABLE `table_reservation`
  ADD CONSTRAINT `table_reservation_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`),
  ADD CONSTRAINT `table_reservation_ibfk_2` FOREIGN KEY (`reserver_id`) REFERENCES `user_details` (`u_id`);

--
-- Constraints for table `table_status`
--
ALTER TABLE `table_status`
  ADD CONSTRAINT `table_status_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
