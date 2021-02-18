-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2021 at 06:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `super market`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `quantity`) VALUES
(1, 'sweets', 1000),
(2, 'bakers', 500),
(3, 'fruits', 2000),
(4, 'vegetables', 2500);

-- --------------------------------------------------------

--
-- Stand-in structure for view `max_products_by_vendor`
-- (See below for the actual view)
--
CREATE TABLE `max_products_by_vendor` (
`vendor_name` varchar(30)
,`MAX(products_by_vendor.num_products)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `num_of_products_by_vendors`
-- (See below for the actual view)
--
CREATE TABLE `num_of_products_by_vendors` (
`vendor_name` varchar(30)
,`num_products` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `num_products_by_kcompany`
-- (See below for the actual view)
--
CREATE TABLE `num_products_by_kcompany` (
`num_products_by_Kcompany` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `production_date` datetime NOT NULL,
  `quantity` int(50) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `c_id` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `expiration_date`, `production_date`, `quantity`, `price`, `vendor_id`, `c_id`) VALUES
(1, 'apples', '2021-02-17 00:23:35', '2021-03-17 23:32:38', 50, '10', 2, 3),
(2, 'bread', '2021-02-17 23:32:38', '2021-04-15 23:32:38', 70, '20', 3, 2),
(3, 'tomato', '2021-02-12 23:49:35', '2021-02-26 23:49:35', 22, '5', 3, 4),
(4, 'potato', '2021-02-17 23:32:38', '2021-02-23 23:49:35', 80, '3', 1, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_to_be_expired_before_25th_of_feb`
-- (See below for the actual view)
--
CREATE TABLE `products_to_be_expired_before_25th_of_feb` (
`product_name` varchar(30)
,`exd` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `name`, `phone`) VALUES
(1, 'k_company', 6668),
(2, 'sscompany', 9935),
(3, 'pcompany', 8536),
(4, 'ndjff', 64838);

-- --------------------------------------------------------

--
-- Structure for view `max_products_by_vendor`
--
DROP TABLE IF EXISTS `max_products_by_vendor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `max_products_by_vendor`  AS SELECT `products_by_vendor`.`vendor_name` AS `vendor_name`, max(`products_by_vendor`.`num_products`) AS `MAX(products_by_vendor.num_products)` FROM (select `vendor`.`name` AS `vendor_name`,count(`vendor`.`name`) AS `num_products` from (`product` join `vendor` on(`product`.`vendor_id` = `vendor`.`id`)) group by `vendor`.`name`) AS `products_by_vendor` ;

-- --------------------------------------------------------

--
-- Structure for view `num_of_products_by_vendors`
--
DROP TABLE IF EXISTS `num_of_products_by_vendors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `num_of_products_by_vendors`  AS SELECT `vendor`.`name` AS `vendor_name`, count(`vendor`.`name`) AS `num_products` FROM (`product` join `vendor` on(`product`.`vendor_id` = `vendor`.`id`)) GROUP BY `vendor`.`name` ;

-- --------------------------------------------------------

--
-- Structure for view `num_products_by_kcompany`
--
DROP TABLE IF EXISTS `num_products_by_kcompany`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `num_products_by_kcompany`  AS SELECT count(0) AS `num_products_by_Kcompany` FROM (`product` join `vendor` on(`product`.`vendor_id` = `vendor`.`id`)) WHERE `vendor`.`name` = 'k_company' ;

-- --------------------------------------------------------

--
-- Structure for view `products_to_be_expired_before_25th_of_feb`
--
DROP TABLE IF EXISTS `products_to_be_expired_before_25th_of_feb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_to_be_expired_before_25th_of_feb`  AS SELECT `product`.`name` AS `product_name`, `product`.`expiration_date` AS `exd` FROM `product` WHERE `product`.`expiration_date` <= '2021-02-25' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ven_ind` (`vendor_id`),
  ADD KEY `fk_category` (`c_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`c_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
