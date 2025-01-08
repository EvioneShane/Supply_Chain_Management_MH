-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 07:57 AM
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
-- Database: `sourcecodester_scm_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(50) NOT NULL,
  `area_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `area_name`, `area_code`) VALUES
(1, 'Cebu City', ' CC'),
(2, 'Compostela', 'CMPS'),
(3, 'Danao City', 'DNCY'),
(4, 'Liloan', 'LL'),
(5, 'Mandaue', 'MDUE');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(25) NOT NULL,
  `cat_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_details`) VALUES
(1, 'Smartphone (Samsung)', 'Android'),
(2, 'Smartphone (iPhone)', 'IOS'),
(3, 'Smartphone (Redmi)', 'Android'),
(4, 'Smartphone (Vivo)', 'Android'),
(5, 'Smartphone (Realme)', 'Android'),
(6, 'Smartphone (Google)', ''),
(7, 'Accessories', 'Smartphone Accessories'),
(8, 'Smartphone (Huawei)', 'Android'),
(9, 'Smartphone (Oppo)', 'Android'),
(10, 'Smartphone (Honor)', 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `dist_id` int(11) NOT NULL,
  `dist_name` varchar(25) NOT NULL,
  `dist_email` varchar(50) DEFAULT NULL,
  `dist_phone` varchar(10) NOT NULL,
  `dist_address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`dist_id`, `dist_name`, `dist_email`, `dist_phone`, `dist_address`) VALUES
(1, 'Nishant Shah', 'nishant45@gmail.com', '8980769792', '787 M.L. Quezon St. Cabancalan, Mandaue City'),
(2, 'Rahul Pandey', 'rahul431@gmail.com', '9099432197', 'Mactan, Lapu Lapu City, Cebu'),
(3, 'Pawan Panchal', 'pawan.rocks@gmail.com', '7878025437', 'V. Padriga St, Cebu City, 6000 Cebu City'),
(4, 'Pushpak Patel', 'pushpak@gmail.com', '9012376544', 'M.C. Briones St, Mandaue City, Cebu'),
(5, 'Haniket Patel', 'hanipatel@gmail.com', '8980745372', 'Upland, National Road, Danao City, Cebu');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total_amount` int(20) NOT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `order_id`, `retailer_id`, `dist_id`, `date`, `total_amount`, `comments`) VALUES
(1, 2, 4, 3, '2015-04-28', 1097394, ''),
(2, 1, 2, 5, '2015-04-28', 2053640, ''),
(3, 3, 1, 1, '2015-04-28', 1371777, ''),
(4, 4, 5, 4, '2015-04-28', 1885840, ''),
(16, 9, 1, 1, '2025-01-07', 27980, ''),
(17, 8, 1, 4, '2025-01-07', 126000, ''),
(18, 5, 5, 1, '2025-01-07', 2068870, ''),
(19, 7, 3, 2, '2025-01-07', 209950, ''),
(20, 10, 6, 1, '2025-01-07', 92000, ''),
(21, 11, 6, 2, '2025-01-07', 74989, ''),
(22, 14, 6, 4, '2025-01-07', 299980, ''),
(23, 6, 1, 1, '2025-01-07', 153990, ''),
(24, 15, 1, 5, '2025-01-08', 178480, ''),
(25, 16, 6, 3, '2025-01-08', 32799, '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `invoice_items_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`invoice_items_id`, `invoice_id`, `product_id`, `quantity`) VALUES
(1, 1, 4, 20),
(2, 1, 5, 5),
(3, 1, 7, 10),
(4, 1, 9, 10),
(5, 1, 12, 6),
(6, 1, 14, 5),
(7, 2, 1, 20),
(8, 2, 2, 15),
(9, 2, 5, 10),
(10, 2, 8, 5),
(11, 2, 10, 8),
(12, 2, 11, 10),
(13, 2, 13, 2),
(14, 2, 15, 3),
(15, 3, 1, 2),
(16, 3, 2, 4),
(17, 3, 3, 3),
(18, 3, 4, 8),
(19, 3, 5, 10),
(20, 3, 6, 12),
(21, 3, 8, 4),
(22, 3, 11, 10),
(23, 3, 13, 3),
(24, 3, 14, 5),
(25, 3, 15, 6),
(26, 4, 2, 12),
(27, 4, 4, 30),
(28, 4, 8, 4),
(29, 4, 11, 20),
(30, 4, 14, 8),
(49, 16, 1, 2),
(50, 17, 3, 12),
(51, 18, 1, 1),
(52, 18, 2, 3),
(53, 18, 3, 5),
(54, 18, 4, 15),
(55, 18, 6, 30),
(56, 18, 8, 45),
(57, 18, 12, 20),
(58, 18, 14, 5),
(59, 19, 1, 5),
(60, 19, 2, 2),
(61, 20, 3, 4),
(62, 20, 4, 2),
(63, 21, 1, 1),
(64, 21, 11, 3),
(65, 21, 12, 1),
(66, 22, 1, 1),
(67, 22, 11, 3),
(68, 22, 12, 10),
(69, 23, 1, 1),
(70, 23, 2, 2),
(71, 24, 1, 2),
(72, 24, 2, 2),
(73, 24, 3, 1),
(74, 25, 7, 1),
(75, 25, 8, 1),
(76, 25, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `man_id` int(11) NOT NULL,
  `man_name` varchar(25) NOT NULL,
  `man_email` varchar(50) DEFAULT NULL,
  `man_phone` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`man_id`, `man_name`, `man_email`, `man_phone`, `username`, `password`) VALUES
(1, 'Suresh Kumar', 'suresh@gmail.com', '9890234510', 'suresh', 'suresh123'),
(2, 'Ankit Pandya', 'ankitp@gmail.com', '8980956231', 'ankit', 'ankit123'),
(3, 'Paawan Shah', 'paawanshah@gmail.com', '9934672300', 'paawan', 'paawan123'),
(5, 'Krupal Joshi', 'krupal12@yahoo.co.in', '7634507610', 'krupal', 'krupal123');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `retailer_id` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `total_amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `retailer_id`, `approved`, `status`, `total_amount`) VALUES
(1, '2015-04-28', 2, 1, 1, 4780),
(2, '2015-04-28', 4, 1, 1, 5120),
(3, '2015-04-28', 1, 1, 1, 8892),
(4, '2015-04-28', 5, 1, 1, 7889),
(5, '2015-04-28', 5, 1, 1, 8920),
(6, '2020-12-07', 1, 1, 1, 50),
(7, '2025-01-07', 3, 1, 1, 117),
(8, '2025-01-07', 1, 1, 1, 480),
(9, '2025-01-07', 1, 1, 1, 27980),
(10, '2025-01-07', 6, 1, 1, 244),
(11, '2025-01-07', 6, 1, 1, 14462),
(14, '2025-01-07', 6, 1, 1, 15470),
(15, '2025-01-08', 1, 1, 1, 178480),
(16, '2025-01-08', 6, 1, 1, 32799);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_id`, `pro_id`, `quantity`) VALUES
(1, 1, 1, 20),
(3, 1, 5, 10),
(4, 1, 8, 5),
(5, 1, 10, 8),
(6, 1, 11, 10),
(7, 1, 13, 2),
(8, 1, 15, 3),
(9, 2, 4, 20),
(10, 2, 5, 5),
(11, 2, 7, 10),
(12, 2, 9, 10),
(13, 2, 12, 6),
(14, 2, 14, 5),
(15, 3, 1, 2),
(16, 3, 2, 4),
(17, 3, 3, 3),
(18, 3, 4, 8),
(19, 3, 5, 10),
(20, 3, 6, 12),
(21, 3, 8, 4),
(22, 3, 11, 10),
(23, 3, 13, 3),
(24, 3, 14, 5),
(25, 3, 15, 6),
(26, 4, 2, 12),
(27, 4, 4, 30),
(28, 4, 8, 4),
(29, 4, 11, 20),
(30, 4, 14, 8),
(31, 5, 1, 1),
(32, 5, 2, 3),
(33, 5, 3, 5),
(34, 5, 4, 15),
(35, 5, 6, 30),
(36, 5, 8, 45),
(37, 5, 12, 20),
(38, 5, 14, 5),
(39, 6, 1, 1),
(40, 6, 2, 2),
(41, 7, 1, 5),
(42, 7, 2, 2),
(43, 8, 3, 12),
(44, 9, 1, 2),
(45, 10, 3, 4),
(46, 10, 4, 2),
(47, 11, 1, 1),
(48, 11, 11, 3),
(49, 11, 12, 1),
(50, 14, 1, 1),
(51, 14, 11, 3),
(52, 14, 12, 10),
(53, 15, 1, 2),
(54, 15, 2, 2),
(55, 15, 3, 1),
(56, 16, 7, 1),
(57, 16, 8, 1),
(58, 16, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(25) NOT NULL,
  `pro_desc` text DEFAULT NULL,
  `pro_price` int(18) NOT NULL,
  `unit` int(11) NOT NULL,
  `pro_cat` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `pro_name`, `pro_desc`, `pro_price`, `unit`, `pro_cat`, `quantity`) VALUES
(1, 'Samsung A16', 'A big screen, massive 5000mAh battery1, and a designed-to-shine triple camera setup—streamlined into a one-piece, ultra-slim, 3D curved-edge body, which is only 190g light and 8.4mm thin2. Beautifully combines shiny pearls with a vivid blue. Fingerprint-proof frosted matte finish.', 13990, 2, 1, 6),
(2, 'iPhone 15 Pro Max', 'Powerful A-series chip, premium build quality, excellent camera system, long battery life.', 70000, 2, 2, 3),
(3, 'Google Pixel 9 Pr', 'Best-in-class camera with advanced AI, clean Android experience, smooth performance.', 10500, 2, 6, 1),
(4, 'Samsung Galaxy A54 5G', 'Balanced performance, good cameras, stylish design, 5G connectivity.', 25000, 2, 1, 14),
(5, ' iPhone 14', 'Reliable performance, solid cameras, compact design, iOS ecosystem.', 45000, 2, 2, 30),
(6, 'Google Pixel 8', 'Excellent camera performance, clean Android experience, competitive price.', 11000, 2, 6, 44),
(7, 'Redmi Note 13 Pro 5G', 'Powerful processor, large battery, good cameras for the price.', 15000, 2, 3, 60),
(8, 'Samsung Galaxy A14 5G', 'Affordable 5G phone, decent performance, good battery life.', 13000, 2, 1, 34),
(9, 'Realme C53', 'Budget-friendly option, large display, decent battery life.', 7000, 2, 5, NULL),
(10, 'Realme Note 60x', ' budget-friendly smartphone offering decent performance, suitable for everyday tasks and social media browsing.    ', 4799, 2, 5, 57),
(11, 'OPPO Find X8', ' A premium flagship smartphone featuring advanced camera systems and high-end specifications, perfect for photography enthusiasts.   ', 12000, 2, 9, 54),
(12, 'Samsung Galaxy A15 5G', 'This mid-range device offers good performance with 5G capabilities, great for multitasking and daily use.  ', 24999, 2, 1, 63),
(13, 'vivo V29e 5G', 'A smartphone known for its outstanding camera features and AI enhancements for stunning photo quality, optimized for selfies. ', 24999, 2, 4, 20),
(14, 'Airpods', 'Active Noise Cancellation and Charging Case (USB-C) Connectivity Bluetooth 5.3 wireless technology', 480, 2, 7, 14),
(15, 'Tempered glass', 'provide tougher protection from scratches, impact absorption, and a smooth touch. However, they are thicker and are visible on your screen.', 150, 2, 7, 100),
(16, 'Phone Charger', 'Crystal Series A47 Fast Charge Wall Charger 65W GaN.', 600, 2, 7, 50);

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

CREATE TABLE `retailer` (
  `retailer_id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `address` varchar(200) NOT NULL,
  `area_id` int(11) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`retailer_id`, `username`, `password`, `address`, `area_id`, `phone`, `email`) VALUES
(1, 'Karl', 'karl123', 'P Cabatingan St, Poblacion, Compostela 6003, Cebu', 2, '9978454323', 'karlj@gmail.com'),
(2, 'nayan', 'nayan123', 'National High Way, A. C. Cortes Ave, Mandaue City, Cebu', 5, '9898906523', 'nayan@gmail.com'),
(3, 'James', 'nishit123', 'National Highway, Brgy. Catadman, Sabang, Danao City', 3, '8980941941', 'nishit@gmail.com'),
(4, 'dharmil', 'dharmil123', 'GCA Building, 13 Gov. M. Cuenco Ave, Cebu City, 6000 Cebu\r\n', 1, '7865340091', 'dharmil123@gmail.com'),
(5, 'rajesh', 'rajesh123', 'Central Nautical Hwy, Liloan, Cebu, Philippines', 4, '7898902365', 'rajesh123@gmail.com'),
(6, 'yvonne', 'yvonne123', 'Bonifacio Ext. Danao City', 3, '8912345676', 'asfg@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(20) NOT NULL,
  `unit_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit_name`, `unit_details`) VALUES
(2, 'PCS', 'Pieces');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`dist_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `retailer_id` (`retailer_id`),
  ADD KEY `dist_id` (`dist_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`invoice_items_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`man_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `retailer_id` (`retailer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `pro_cat` (`pro_cat`);

--
-- Indexes for table `retailer`
--
ALTER TABLE `retailer`
  ADD PRIMARY KEY (`retailer_id`),
  ADD KEY `area_code` (`area_id`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `area_id_2` (`area_id`),
  ADD KEY `area_id_3` (`area_id`),
  ADD KEY `area_id_4` (`area_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `dist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `invoice_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `man_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `retailer`
--
ALTER TABLE `retailer`
  MODIFY `retailer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`retailer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`dist_id`) REFERENCES `distributor` (`dist_id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`pro_id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`retailer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`pro_id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `unit` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`pro_cat`) REFERENCES `categories` (`cat_id`) ON UPDATE CASCADE;

--
-- Constraints for table `retailer`
--
ALTER TABLE `retailer`
  ADD CONSTRAINT `retailer_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
