-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2026 at 06:25 AM
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
-- Database: `gilakomputer_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(8, 'Case'),
(7, 'CPU Cooler'),
(9, 'Fan'),
(11, 'Keyboard'),
(10, 'Monitor'),
(5, 'Motherboard'),
(12, 'Mouse'),
(6, 'Power'),
(2, 'Processor'),
(3, 'RAM'),
(4, 'Storage'),
(1, 'VGA');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `reserved` int(11) NOT NULL DEFAULT 0,
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `orderNumber` varchar(191) NOT NULL,
  `customerName` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(191) NOT NULL,
  `postalCode` varchar(191) NOT NULL,
  `shippingMethod` varchar(191) NOT NULL,
  `shippingFee` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'PENDING',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `paidAt` datetime(3) DEFAULT NULL,
  `paymentMethod` varchar(191) DEFAULT NULL,
  `paymentRef` varchar(191) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `orderNumber`, `customerName`, `email`, `phone`, `address`, `city`, `postalCode`, `shippingMethod`, `shippingFee`, `subtotal`, `total`, `status`, `createdAt`, `updatedAt`, `paidAt`, `paymentMethod`, `paymentRef`, `userId`) VALUES
(1, 'GK-1790268317546-262', 'reza', 'rezaray@gmail.com', '08212122121121', 'dwadada', 'dwadwad', '13231', 'regular', 25000, 150000, 175000, 'PENDING', '2026-09-24 16:45:17.570', '2026-09-24 16:45:17.570', NULL, NULL, NULL, NULL),
(2, 'GK-1790892128119-308', 'reza', 'dawa@gmail.com', '0872131312', 'lapung', 'jakarta', '21311', 'regular', 25000, 5200000, 5225000, 'PAID', '2026-10-01 22:02:08.135', '2026-10-01 22:02:28.757', '2026-10-01 22:02:28.668', 'ovo', 'OVO-CF50A7AACED393B6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `orderId`, `productId`, `name`, `quantity`, `unitPrice`) VALUES
(1, 1, 80, 'Essential USB Mouse', 1, 150000),
(2, 2, 2, 'Intel Core i5-14600K', 1, 5200000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'ACTIVE',
  `imageUrl` varchar(191) NOT NULL,
  `specs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`specs`)),
  `categoryId` int(11) NOT NULL,
  `brandId` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `slug`, `description`, `price`, `stock`, `status`, `imageUrl`, `specs`, `categoryId`, `brandId`, `createdAt`, `updatedAt`) VALUES
(1, 'RTX 4060 Ti 16GB', 'rtx-4060-ti-16gb', 'Performa 1440p gaming terbaik di kelasnya', 7500000, 15, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RTX 4060 Ti\",\"VRAM\":\"16GB GDDR6\",\"TDP\":\"165W\"}', 1, NULL, '2026-09-24 16:43:11.773', '2026-10-01 21:34:31.666'),
(2, 'Intel Core i5-14600K', 'i5-14600k', '14 Core untuk gaming dan editing', 5200000, 19, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"14C/20T\",\"Base\":\"3.5GHz\",\"Socket\":\"LGA1700\"}', 2, NULL, '2026-09-24 16:43:11.781', '2026-10-01 22:02:08.121'),
(3, 'RTX 4070 Super 12GB', 'rtx-4070-super-12gb', 'Grafis 1440p untuk gaming dan kreasi visual', 10500000, 8, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RTX 4070 Super\",\"VRAM\":\"12GB GDDR6X\",\"TDP\":\"220W\"}', 1, NULL, '2026-09-24 16:43:11.785', '2026-10-01 21:34:31.691'),
(4, 'Radeon RX 7800 XT 16GB', 'radeon-rx-7800-xt-16gb', 'Performa raster kuat dengan memori besar', 9200000, 7, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RX 7800 XT\",\"VRAM\":\"16GB GDDR6\",\"TDP\":\"263W\"}', 1, NULL, '2026-09-24 16:43:11.790', '2026-10-01 21:34:31.695'),
(5, 'RTX 4060 8GB Dual Fan', 'rtx-4060-8gb-dual-fan', 'GPU efisien untuk gaming 1080p modern', 5200000, 12, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RTX 4060\",\"VRAM\":\"8GB GDDR6\",\"TDP\":\"115W\"}', 1, NULL, '2026-09-24 16:43:11.793', '2026-10-01 21:34:31.699'),
(6, 'Intel Core i7-14700K', 'intel-core-i7-14700k', 'Performa hybrid untuk editing dan multitasking', 6800000, 9, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"20C/28T\",\"Base\":\"3.4GHz\",\"Socket\":\"LGA1700\"}', 2, NULL, '2026-09-24 16:43:11.797', '2026-10-01 21:34:31.704'),
(7, 'AMD Ryzen 7 7800X3D', 'amd-ryzen-7-7800x3d', 'Processor gaming dengan cache ekstra', 6500000, 10, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"8C/16T\",\"Boost\":\"5.0GHz\",\"Socket\":\"AM5\"}', 2, NULL, '2026-09-24 16:43:11.801', '2026-10-01 21:34:31.709'),
(8, 'AMD Ryzen 5 7600', 'amd-ryzen-5-7600', 'Fondasi AM5 seimbang untuk gaming harian', 3300000, 14, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"6C/12T\",\"Boost\":\"5.1GHz\",\"Socket\":\"AM5\"}', 2, NULL, '2026-09-24 16:43:11.805', '2026-10-01 21:34:31.713'),
(9, 'Core i5-12400F', 'core-i5-12400f', 'Value processor untuk build produktif', 2300000, 16, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"6C/12T\",\"Base\":\"2.5GHz\",\"Socket\":\"LGA1700\"}', 2, NULL, '2026-09-24 16:43:11.809', '2026-10-01 21:34:31.718'),
(10, 'Vengeance 32GB DDR5 6000', 'vengeance-32gb-ddr5-6000', 'Kit memori cepat untuk build generasi baru', 1750000, 18, 'ACTIVE', '/products/ram.svg', '{\"Capacity\":\"32GB\",\"Speed\":\"6000MT/s\",\"Type\":\"DDR5\"}', 3, NULL, '2026-09-24 16:43:11.812', '2026-10-01 21:34:31.722'),
(11, 'Fury Beast 16GB DDR5 5200', 'fury-beast-16gb-ddr5-5200', 'Memori DDR5 ringkas untuk kebutuhan harian', 950000, 22, 'ACTIVE', '/products/ram.svg', '{\"Capacity\":\"16GB\",\"Speed\":\"5200MT/s\",\"Type\":\"DDR5\"}', 3, NULL, '2026-09-24 16:43:11.817', '2026-10-01 21:34:31.726'),
(12, 'Ripjaws V 32GB DDR4 3600', 'ripjaws-v-32gb-ddr4-3600', 'Upgrade kapasitas untuk workstation DDR4', 1350000, 20, 'ACTIVE', '/products/ram.svg', '{\"Capacity\":\"32GB\",\"Speed\":\"3600MT/s\",\"Type\":\"DDR4\"}', 3, NULL, '2026-09-24 16:43:11.822', '2026-10-01 21:34:31.729'),
(13, 'NVMe Gen4 2TB Performance', 'nvme-gen4-2tb-performance', 'Storage cepat untuk project besar dan game', 2400000, 11, 'ACTIVE', '/products/storage.svg', '{\"Capacity\":\"2TB\",\"Interface\":\"PCIe 4.0\",\"Read\":\"7400MB/s\"}', 4, NULL, '2026-09-24 16:43:11.826', '2026-10-01 21:34:31.733'),
(14, 'NVMe Gen3 1TB Essential', 'nvme-gen3-1tb-essential', 'Boot drive cepat untuk build seimbang', 950000, 25, 'ACTIVE', '/products/storage.svg', '{\"Capacity\":\"1TB\",\"Interface\":\"PCIe 3.0\",\"Read\":\"3500MB/s\"}', 4, NULL, '2026-09-24 16:43:11.830', '2026-10-01 21:34:31.737'),
(15, 'SATA SSD 1TB Quiet', 'sata-ssd-1tb-quiet', 'Upgrade praktis untuk sistem lama', 850000, 19, 'ACTIVE', '/products/storage.svg', '{\"Capacity\":\"1TB\",\"Interface\":\"SATA III\",\"Read\":\"560MB/s\"}', 4, NULL, '2026-09-24 16:43:11.833', '2026-10-01 21:34:31.741'),
(16, 'B550M WiFi Creator', 'b550m-wifi-creator', 'Motherboard AM4 dengan konektivitas lengkap', 1850000, 8, 'ACTIVE', '/products/motherboard.svg', '{\"Chipset\":\"B550\",\"Socket\":\"AM4\",\"Wireless\":\"WiFi 6\"}', 5, NULL, '2026-09-24 16:43:11.838', '2026-10-01 21:34:31.745'),
(17, 'B650M Pro WiFi', 'b650m-pro-wifi', 'Fondasi AM5 modern untuk upgrade panjang', 2850000, 7, 'ACTIVE', '/products/motherboard.svg', '{\"Chipset\":\"B650\",\"Socket\":\"AM5\",\"Wireless\":\"WiFi 6E\"}', 5, NULL, '2026-09-24 16:43:11.841', '2026-10-01 21:34:31.749'),
(18, 'Z790 DDR5 Creator', 'z790-ddr5-creator', 'Platform Intel premium untuk workstation', 4900000, 5, 'ACTIVE', '/products/motherboard.svg', '{\"Chipset\":\"Z790\",\"Socket\":\"LGA1700\",\"Memory\":\"DDR5\"}', 5, NULL, '2026-09-24 16:43:11.846', '2026-10-01 21:34:31.754'),
(19, '650W Gold Modular', '650w-gold-modular', 'Daya efisien untuk build performa menengah', 1450000, 13, 'ACTIVE', '/products/power.svg', '{\"Wattage\":\"650W\",\"Efficiency\":\"80+ Gold\",\"Modular\":\"Full\"}', 6, NULL, '2026-09-24 16:43:11.851', '2026-10-01 21:34:31.758'),
(20, '750W Gold ATX 3.0', '750w-gold-atx-3', 'Power supply siap untuk GPU generasi baru', 1950000, 10, 'ACTIVE', '/products/power.svg', '{\"Wattage\":\"750W\",\"Efficiency\":\"80+ Gold\",\"Standard\":\"ATX 3.0\"}', 6, NULL, '2026-09-24 16:43:11.855', '2026-10-01 21:34:31.762'),
(21, '850W Platinum Modular', '850w-platinum-modular', 'Cadangan daya stabil untuk workstation besar', 2850000, 6, 'ACTIVE', '/products/power.svg', '{\"Wattage\":\"850W\",\"Efficiency\":\"80+ Platinum\",\"Modular\":\"Full\"}', 6, NULL, '2026-09-24 16:43:11.859', '2026-10-01 21:34:31.765'),
(22, '550W Bronze Quiet', '550w-bronze-quiet', 'Pilihan tenang untuk PC harian hemat daya', 950000, 17, 'ACTIVE', '/products/power.svg', '{\"Wattage\":\"550W\",\"Efficiency\":\"80+ Bronze\",\"Fan\":\"Quiet 120mm\"}', 6, NULL, '2026-09-24 16:43:11.863', '2026-10-01 21:34:31.769'),
(23, 'RTX 4090 24GB Founders', 'rtx-4090-24gb-founders', 'Performa ekstrem untuk 4K, AI, dan rendering berat', 28500000, 3, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RTX 4090\",\"VRAM\":\"24GB GDDR6X\",\"TDP\":\"450W\"}', 1, NULL, '2026-09-24 16:43:11.866', '2026-10-01 21:34:31.773'),
(24, 'RTX 4080 Super 16GB', 'rtx-4080-super-16gb', 'Gaming 4K dengan ray tracing generasi baru', 18500000, 4, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RTX 4080 Super\",\"VRAM\":\"16GB GDDR6X\",\"TDP\":\"320W\"}', 1, NULL, '2026-09-24 16:43:11.872', '2026-10-01 21:34:31.777'),
(25, 'RTX 4070 Ti Super 16GB', 'rtx-4070-ti-super-16gb', 'Kelas atas untuk 1440p dan 4K yang mulus', 13800000, 6, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RTX 4070 Ti Super\",\"VRAM\":\"16GB GDDR6X\",\"TDP\":\"285W\"}', 1, NULL, '2026-09-24 16:43:11.876', '2026-10-01 21:34:31.781'),
(26, 'RTX 4060 Ti 8GB', 'rtx-4060-ti-8gb', 'GPU efisien untuk gaming modern dan streaming', 6500000, 9, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RTX 4060 Ti\",\"VRAM\":\"8GB GDDR6\",\"TDP\":\"160W\"}', 1, NULL, '2026-09-24 16:43:11.880', '2026-10-01 21:34:31.785'),
(27, 'RX 7900 XTX 24GB', 'rx-7900-xtx-24gb', 'Rasterisasi kelas enthusiast dengan VRAM besar', 17200000, 3, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RX 7900 XTX\",\"VRAM\":\"24GB GDDR6\",\"TDP\":\"355W\"}', 1, NULL, '2026-09-24 16:43:11.884', '2026-10-01 21:34:31.788'),
(28, 'RX 7700 XT 12GB', 'rx-7700-xt-12gb', 'Performa 1440p seimbang dengan harga kompetitif', 7200000, 7, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RX 7700 XT\",\"VRAM\":\"12GB GDDR6\",\"TDP\":\"245W\"}', 1, NULL, '2026-09-24 16:43:11.889', '2026-10-01 21:34:31.792'),
(29, 'RX 7600 8GB', 'rx-7600-8gb', 'Pilihan hemat untuk gaming 1080p', 4300000, 11, 'ACTIVE', '/products/vga.svg', '{\"GPU\":\"RX 7600\",\"VRAM\":\"8GB GDDR6\",\"TDP\":\"165W\"}', 1, NULL, '2026-09-24 16:43:11.895', '2026-10-01 21:34:31.796'),
(30, 'Intel Core i9-14900K', 'intel-core-i9-14900k', 'Processor flagship untuk workstation dan kreator', 9800000, 4, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"24C/32T\",\"Base\":\"3.2GHz\",\"Socket\":\"LGA1700\"}', 2, NULL, '2026-09-24 16:43:11.899', '2026-10-01 21:34:31.799'),
(31, 'Intel Core i7-14700', 'intel-core-i7-14700', 'Multitasking kuat tanpa kebutuhan overclocking', 6100000, 7, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"20C/28T\",\"Base\":\"2.1GHz\",\"Socket\":\"LGA1700\"}', 2, NULL, '2026-09-24 16:43:11.903', '2026-10-01 21:34:31.802'),
(32, 'Intel Core i5-14600K', 'intel-core-i5-14600k-seeded', 'Performa gaming dan editing kelas menengah atas', 5200000, 10, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"14C/20T\",\"Base\":\"3.5GHz\",\"Socket\":\"LGA1700\"}', 2, NULL, '2026-09-24 16:43:11.907', '2026-10-01 21:34:31.806'),
(33, 'AMD Ryzen 9 7950X', 'amd-ryzen-9-7950x', '16 core untuk render, compile, dan simulasi berat', 9500000, 4, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"16C/32T\",\"Boost\":\"5.7GHz\",\"Socket\":\"AM5\"}', 2, NULL, '2026-09-24 16:43:11.911', '2026-10-01 21:34:31.809'),
(34, 'AMD Ryzen 9 7900X', 'amd-ryzen-9-7900x', 'Performa workstation AM5 yang fleksibel', 7800000, 5, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"12C/24T\",\"Boost\":\"5.6GHz\",\"Socket\":\"AM5\"}', 2, NULL, '2026-09-24 16:43:11.915', '2026-10-01 21:34:31.813'),
(35, 'AMD Ryzen 5 5600', 'amd-ryzen-5-5600', 'Value gaming populer untuk platform AM4', 1900000, 14, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"6C/12T\",\"Boost\":\"4.4GHz\",\"Socket\":\"AM4\"}', 2, NULL, '2026-09-24 16:43:11.920', '2026-10-01 21:34:31.817'),
(36, 'AMD Ryzen 5 8500G', 'amd-ryzen-5-8500g', 'Processor AM5 dengan grafis terintegrasi', 2800000, 8, 'ACTIVE', '/products/processor.svg', '{\"Cores\":\"6C/12T\",\"Boost\":\"5.0GHz\",\"Socket\":\"AM5\"}', 2, NULL, '2026-09-24 16:43:11.924', '2026-10-01 21:34:31.821'),
(37, 'Vengeance 64GB DDR5 6000', 'vengeance-64gb-ddr5-6000', 'Kapasitas besar untuk editing dan virtual machine', 3300000, 8, 'ACTIVE', '/products/ram.svg', '{\"Capacity\":\"64GB\",\"Speed\":\"6000MT/s\",\"Type\":\"DDR5\"}', 3, NULL, '2026-09-24 16:43:11.928', '2026-10-01 21:34:31.825'),
(38, 'Trident Z5 32GB DDR5 6400', 'trident-z5-32gb-ddr5-6400', 'Memori premium berlatensi rendah', 2100000, 6, 'ACTIVE', '/products/ram.svg', '{\"Capacity\":\"32GB\",\"Speed\":\"6400MT/s\",\"Type\":\"DDR5\"}', 3, NULL, '2026-09-24 16:43:11.932', '2026-10-01 21:34:31.829'),
(39, 'Fury Beast 32GB DDR4 3200', 'fury-beast-32gb-ddr4-3200', 'Upgrade RAM besar untuk platform DDR4', 1250000, 16, 'ACTIVE', '/products/ram.svg', '{\"Capacity\":\"32GB\",\"Speed\":\"3200MT/s\",\"Type\":\"DDR4\"}', 3, NULL, '2026-09-24 16:43:11.936', '2026-10-01 21:34:31.833'),
(40, 'Vengeance 16GB DDR4 3200', 'vengeance-16gb-ddr4-3200', 'Memori harian yang stabil dan terjangkau', 700000, 20, 'ACTIVE', '/products/ram.svg', '{\"Capacity\":\"16GB\",\"Speed\":\"3200MT/s\",\"Type\":\"DDR4\"}', 3, NULL, '2026-09-24 16:43:11.940', '2026-10-01 21:34:31.837'),
(41, 'Kingston Fury 16GB DDR5 5600', 'kingston-fury-16gb-ddr5-5600', 'Memori DDR5 entry-level untuk build modern', 850000, 18, 'ACTIVE', '/products/ram.svg', '{\"Capacity\":\"16GB\",\"Speed\":\"5600MT/s\",\"Type\":\"DDR5\"}', 3, NULL, '2026-09-24 16:43:11.945', '2026-10-01 21:34:31.841'),
(42, 'NVMe Gen4 4TB Creator', 'nvme-gen4-4tb-creator', 'Ruang besar untuk footage dan project kreatif', 4800000, 5, 'ACTIVE', '/products/storage.svg', '{\"Capacity\":\"4TB\",\"Interface\":\"PCIe 4.0\",\"Read\":\"7400MB/s\"}', 4, NULL, '2026-09-24 16:43:11.950', '2026-10-01 21:34:31.845'),
(43, 'NVMe Gen4 1TB Speed', 'nvme-gen4-1tb-speed', 'Storage cepat untuk OS dan game', 1350000, 15, 'ACTIVE', '/products/storage.svg', '{\"Capacity\":\"1TB\",\"Interface\":\"PCIe 4.0\",\"Read\":\"5000MB/s\"}', 4, NULL, '2026-09-24 16:43:11.953', '2026-10-01 21:34:31.852'),
(44, 'NVMe Gen3 2TB Archive', 'nvme-gen3-2tb-archive', 'Kapasitas lega untuk koleksi dan project', 1750000, 10, 'ACTIVE', '/products/storage.svg', '{\"Capacity\":\"2TB\",\"Interface\":\"PCIe 3.0\",\"Read\":\"3500MB/s\"}', 4, NULL, '2026-09-24 16:43:11.957', '2026-10-01 21:34:31.859'),
(45, 'SATA SSD 480GB Basic', 'sata-ssd-480gb-basic', 'Upgrade cepat untuk komputer lama', 550000, 25, 'ACTIVE', '/products/storage.svg', '{\"Capacity\":\"480GB\",\"Interface\":\"SATA III\",\"Read\":\"520MB/s\"}', 4, NULL, '2026-09-24 16:43:11.961', '2026-10-01 21:34:31.865'),
(46, 'HDD 4TB Data Vault', 'hdd-4tb-data-vault', 'Penyimpanan data besar dengan biaya efisien', 1550000, 12, 'ACTIVE', '/products/storage.svg', '{\"Capacity\":\"4TB\",\"Interface\":\"SATA III\",\"Speed\":\"5400RPM\"}', 4, NULL, '2026-09-24 16:43:11.968', '2026-10-01 21:34:31.869'),
(47, 'X670E Creator WiFi', 'x670e-creator-wifi', 'Motherboard AM5 premium untuk workstation', 6200000, 3, 'ACTIVE', '/products/motherboard.svg', '{\"Chipset\":\"X670E\",\"Socket\":\"AM5\",\"Memory\":\"DDR5\",\"Wireless\":\"WiFi 6E\"}', 5, NULL, '2026-09-24 16:43:11.976', '2026-10-01 21:34:31.876'),
(48, 'B760M DDR5 Gaming', 'b760m-ddr5-gaming', 'Platform Intel modern untuk gaming', 2400000, 8, 'ACTIVE', '/products/motherboard.svg', '{\"Chipset\":\"B760\",\"Socket\":\"LGA1700\",\"Memory\":\"DDR5\",\"Wireless\":\"WiFi 6\"}', 5, NULL, '2026-09-24 16:43:11.983', '2026-10-01 21:34:31.881'),
(49, 'B550 Gaming Plus', 'b550-gaming-plus', 'Motherboard AM4 dengan fitur gaming lengkap', 2100000, 7, 'ACTIVE', '/products/motherboard.svg', '{\"Chipset\":\"B550\",\"Socket\":\"AM4\",\"Memory\":\"DDR4\",\"Wireless\":\"None\"}', 5, NULL, '2026-09-24 16:43:11.988', '2026-10-01 21:34:31.888'),
(50, 'H610M Office', 'h610m-office', 'Platform Intel hemat untuk komputer kerja', 1350000, 12, 'ACTIVE', '/products/motherboard.svg', '{\"Chipset\":\"H610\",\"Socket\":\"LGA1700\",\"Memory\":\"DDR4\",\"Wireless\":\"None\"}', 5, NULL, '2026-09-24 16:43:11.996', '2026-10-01 21:34:31.893'),
(51, '1000W Platinum ATX 3.0', '1000w-platinum-atx-3', 'Daya besar untuk GPU dan workstation kelas atas', 3900000, 4, 'ACTIVE', '/products/power.svg', '{\"Wattage\":\"1000W\",\"Efficiency\":\"80+ Platinum\",\"Standard\":\"ATX 3.0\"}', 6, NULL, '2026-09-24 16:43:12.003', '2026-10-01 21:34:31.898'),
(52, '850W Gold ATX 3.0', '850w-gold-atx-3', 'PSU modern untuk build enthusiast', 2550000, 7, 'ACTIVE', '/products/power.svg', '{\"Wattage\":\"850W\",\"Efficiency\":\"80+ Gold\",\"Standard\":\"ATX 3.0\"}', 6, NULL, '2026-09-24 16:43:12.011', '2026-10-01 21:34:31.905'),
(53, '750W Bronze Modular', '750w-bronze-modular', 'Pilihan modular terjangkau untuk gaming', 1350000, 12, 'ACTIVE', '/products/power.svg', '{\"Wattage\":\"750W\",\"Efficiency\":\"80+ Bronze\",\"Modular\":\"Semi\"}', 6, NULL, '2026-09-24 16:43:12.016', '2026-10-01 21:34:31.911'),
(54, '450W Bronze Office', '450w-bronze-office', 'Daya hemat untuk komputer tanpa GPU besar', 650000, 18, 'ACTIVE', '/products/power.svg', '{\"Wattage\":\"450W\",\"Efficiency\":\"80+ Bronze\",\"Modular\":\"None\"}', 6, NULL, '2026-09-24 16:43:12.020', '2026-10-01 21:34:31.918'),
(55, 'Air Cooler Dual Tower 120', 'air-cooler-dual-tower-120', 'Pendingin senyap untuk processor performa tinggi', 950000, 10, 'ACTIVE', '/products/cpu-cooler.svg', '{\"Socket\":\"AM4/AM5/LGA1700\",\"Height\":\"158mm\",\"TDP\":\"250W\"}', 7, NULL, '2026-09-24 16:43:12.027', '2026-10-01 21:34:31.924'),
(56, 'Air Cooler Tower 120', 'air-cooler-tower-120', 'Pendingin tower seimbang untuk gaming harian', 550000, 15, 'ACTIVE', '/products/cpu-cooler.svg', '{\"Socket\":\"AM4/AM5/LGA1700\",\"Height\":\"155mm\",\"TDP\":\"180W\"}', 7, NULL, '2026-09-24 16:43:12.033', '2026-10-01 21:34:31.931'),
(57, 'AIO Liquid Cooler 240', 'aio-liquid-cooler-240', 'Pendingin cair ringkas untuk CPU panas', 1450000, 8, 'ACTIVE', '/products/cpu-cooler.svg', '{\"Socket\":\"AM4/AM5/LGA1700\",\"Radiator\":\"240mm\",\"TDP\":\"280W\"}', 7, NULL, '2026-09-24 16:43:12.042', '2026-10-01 21:34:31.940'),
(58, 'AIO Liquid Cooler 360', 'aio-liquid-cooler-360', 'Pendinginan maksimal untuk workstation', 2200000, 5, 'ACTIVE', '/products/cpu-cooler.svg', '{\"Socket\":\"AM4/AM5/LGA1700\",\"Radiator\":\"360mm\",\"TDP\":\"320W\"}', 7, NULL, '2026-09-24 16:43:12.048', '2026-10-01 21:34:31.947'),
(59, 'Low Profile Cooler 65W', 'low-profile-cooler-65w', 'Pendingin ringkas untuk case kecil', 350000, 12, 'ACTIVE', '/products/cpu-cooler.svg', '{\"Socket\":\"AM4/AM5/LGA1700\",\"Height\":\"55mm\",\"TDP\":\"65W\"}', 7, NULL, '2026-09-24 16:43:12.054', '2026-10-01 21:34:31.955'),
(60, 'Tower Cooler ARGB', 'tower-cooler-argb', 'Pendingin tower dengan pencahayaan ARGB', 700000, 11, 'ACTIVE', '/products/cpu-cooler.svg', '{\"Socket\":\"AM4/AM5/LGA1700\",\"Height\":\"160mm\",\"TDP\":\"220W\"}', 7, NULL, '2026-09-24 16:43:12.066', '2026-10-01 21:34:31.964'),
(61, 'Mid Tower Airflow Mesh', 'mid-tower-airflow-mesh', 'Casing mesh dengan sirkulasi udara lega', 850000, 10, 'ACTIVE', '/products/case.svg', '{\"Form\":\"ATX/mATX\",\"GPUClearance\":\"380mm\",\"CoolerHeight\":\"165mm\"}', 8, NULL, '2026-09-24 16:43:12.071', '2026-10-01 21:34:31.971'),
(62, 'Compact mATX Mesh', 'compact-matx-mesh', 'Casing ringkas untuk build mATX', 650000, 13, 'ACTIVE', '/products/case.svg', '{\"Form\":\"mATX/ITX\",\"GPUClearance\":\"330mm\",\"CoolerHeight\":\"160mm\"}', 8, NULL, '2026-09-24 16:43:12.077', '2026-10-01 21:34:31.979'),
(63, 'Panoramic Glass Mid Tower', 'panoramic-glass-mid-tower', 'Casing showcase dengan panel kaca luas', 1200000, 7, 'ACTIVE', '/products/case.svg', '{\"Form\":\"ATX/mATX\",\"GPUClearance\":\"400mm\",\"CoolerHeight\":\"170mm\"}', 8, NULL, '2026-09-24 16:43:12.084', '2026-10-01 21:34:31.987'),
(64, 'Mini ITX Creator Case', 'mini-itx-creator-case', 'Casing mini untuk workstation hemat ruang', 1550000, 5, 'ACTIVE', '/products/case.svg', '{\"Form\":\"ITX\",\"GPUClearance\":\"320mm\",\"CoolerHeight\":\"145mm\"}', 8, NULL, '2026-09-24 16:43:12.091', '2026-10-01 21:34:31.992'),
(65, 'Full Tower Workstation', 'full-tower-workstation', 'Casing besar untuk banyak storage dan radiator', 2300000, 4, 'ACTIVE', '/products/case.svg', '{\"Form\":\"EATX/ATX\",\"GPUClearance\":\"450mm\",\"CoolerHeight\":\"190mm\"}', 8, NULL, '2026-09-24 16:43:12.098', '2026-10-01 21:34:31.998'),
(66, 'Silent Mid Tower', 'silent-mid-tower', 'Casing peredam suara untuk ruang kerja', 1350000, 6, 'ACTIVE', '/products/case.svg', '{\"Form\":\"ATX/mATX\",\"GPUClearance\":\"370mm\",\"CoolerHeight\":\"165mm\"}', 8, NULL, '2026-09-24 16:43:12.106', '2026-10-01 21:34:32.006'),
(67, 'PWM Fan 120mm 3-Pack', 'pwm-fan-120mm-3-pack', 'Tiga kipas PWM untuk airflow lebih teratur', 450000, 15, 'ACTIVE', '/products/fan.svg', '{\"Size\":\"120mm\",\"Quantity\":\"3\",\"Connector\":\"4-pin PWM\"}', 9, NULL, '2026-09-24 16:43:12.115', '2026-10-01 21:34:32.012'),
(68, 'ARGB Fan 120mm 3-Pack', 'argb-fan-120mm-3-pack', 'Kipas ARGB untuk airflow dan tampilan build', 650000, 12, 'ACTIVE', '/products/fan.svg', '{\"Size\":\"120mm\",\"Quantity\":\"3\",\"Connector\":\"4-pin PWM/3-pin ARGB\"}', 9, NULL, '2026-09-24 16:43:12.120', '2026-10-01 21:34:32.019'),
(69, 'Quiet Fan 140mm 2-Pack', 'quiet-fan-140mm-2-pack', 'Kipas besar yang tenang untuk casing', 500000, 10, 'ACTIVE', '/products/fan.svg', '{\"Size\":\"140mm\",\"Quantity\":\"2\",\"Connector\":\"4-pin PWM\"}', 9, NULL, '2026-09-24 16:43:12.127', '2026-10-01 21:34:32.027'),
(70, 'High Pressure Fan 120mm', 'high-pressure-fan-120mm', 'Kipas tekanan tinggi untuk radiator', 250000, 18, 'ACTIVE', '/products/fan.svg', '{\"Size\":\"120mm\",\"Quantity\":\"1\",\"Connector\":\"4-pin PWM\"}', 9, NULL, '2026-09-24 16:43:12.134', '2026-10-01 21:34:32.033'),
(71, '27 inch 1440p 165Hz', 'monitor-27-1440p-165hz', 'Monitor gaming tajam dengan refresh rate tinggi', 4200000, 7, 'ACTIVE', '/products/monitor.svg', '{\"Size\":\"27 inch\",\"Resolution\":\"2560x1440\",\"Refresh\":\"165Hz\"}', 10, NULL, '2026-09-24 16:43:12.142', '2026-10-01 21:34:32.038'),
(72, '24 inch 1080p 180Hz', 'monitor-24-1080p-180hz', 'Monitor kompetitif cepat untuk gaming esports', 2300000, 10, 'ACTIVE', '/products/monitor.svg', '{\"Size\":\"24 inch\",\"Resolution\":\"1920x1080\",\"Refresh\":\"180Hz\"}', 10, NULL, '2026-09-24 16:43:12.151', '2026-10-01 21:34:32.043'),
(73, '32 inch 4K Creator', 'monitor-32-4k-creator', 'Layar luas dan detail untuk pekerjaan kreatif', 6500000, 4, 'ACTIVE', '/products/monitor.svg', '{\"Size\":\"32 inch\",\"Resolution\":\"3840x2160\",\"Refresh\":\"60Hz\"}', 10, NULL, '2026-09-24 16:43:12.160', '2026-10-01 21:34:32.049'),
(74, '24 inch IPS Office', 'monitor-24-ips-office', 'Monitor IPS nyaman untuk kerja dan belajar', 1650000, 14, 'ACTIVE', '/products/monitor.svg', '{\"Size\":\"24 inch\",\"Resolution\":\"1920x1080\",\"Refresh\":\"75Hz\"}', 10, NULL, '2026-09-24 16:43:12.168', '2026-10-01 21:34:32.056'),
(75, 'Mechanical Keyboard TKL', 'mechanical-keyboard-tkl', 'Keyboard mekanikal ringkas untuk gaming dan kerja', 850000, 12, 'ACTIVE', '/products/keyboard.svg', '{\"Layout\":\"TKL\",\"Switch\":\"Mechanical Red\",\"Connection\":\"USB-C\"}', 11, NULL, '2026-09-24 16:43:12.176', '2026-10-01 21:34:32.060'),
(76, 'Mechanical Keyboard Fullsize', 'mechanical-keyboard-fullsize', 'Keyboard mekanikal lengkap dengan numpad', 1050000, 9, 'ACTIVE', '/products/keyboard.svg', '{\"Layout\":\"Fullsize\",\"Switch\":\"Mechanical Brown\",\"Connection\":\"USB-C\"}', 11, NULL, '2026-09-24 16:43:12.182', '2026-10-01 21:34:32.068'),
(77, 'Slim Wireless Keyboard', 'slim-wireless-keyboard', 'Keyboard wireless minimalis untuk meja kerja', 450000, 15, 'ACTIVE', '/products/keyboard.svg', '{\"Layout\":\"Fullsize\",\"Switch\":\"Membrane\",\"Connection\":\"Wireless\"}', 11, NULL, '2026-09-24 16:43:12.187', '2026-10-01 21:34:32.073'),
(78, 'Gaming Mouse 26K DPI', 'gaming-mouse-26k-dpi', 'Mouse ringan dengan sensor presisi tinggi', 750000, 14, 'ACTIVE', '/products/mouse.svg', '{\"Sensor\":\"26000 DPI\",\"Connection\":\"Wireless/USB\",\"Weight\":\"62g\"}', 12, NULL, '2026-09-24 16:43:12.198', '2026-10-01 21:34:32.080'),
(79, 'Ergonomic Wireless Mouse', 'ergonomic-wireless-mouse', 'Mouse nyaman untuk kerja berjam-jam', 550000, 16, 'ACTIVE', '/products/mouse.svg', '{\"Sensor\":\"4000 DPI\",\"Connection\":\"Wireless\",\"Weight\":\"88g\"}', 12, NULL, '2026-09-24 16:43:12.211', '2026-10-01 21:34:32.086'),
(80, 'Essential USB Mouse', 'essential-usb-mouse', 'Mouse sederhana untuk komputer harian', 150000, 24, 'ACTIVE', '/products/mouse.svg', '{\"Sensor\":\"1600 DPI\",\"Connection\":\"USB\",\"Weight\":\"95g\"}', 12, NULL, '2026-09-24 16:43:12.220', '2026-10-01 22:10:58.876');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(191) NOT NULL,
  `userId` int(11) NOT NULL,
  `expiresAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `passwordHash` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL DEFAULT 'PEMBELI',
  `createdAt` datetime(3) DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('035757cc-ba1c-4bb8-b32c-59f561f3c6d8', '7240279e66e62ba4244c07ccebeb41a4a15c7aa26f1ff5bf566bdaf360f216c6', '2026-09-24 16:42:47.378', '20260924135311_mysql_init', NULL, NULL, '2026-09-24 16:42:46.944', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Brand_name_key` (`name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Category_name_key` (`name`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Inventory_productId_key` (`productId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Order_orderNumber_key` (`orderNumber`),
  ADD UNIQUE KEY `Order_paymentRef_key` (`paymentRef`),
  ADD KEY `Order_email_idx` (`email`),
  ADD KEY `Order_status_idx` (`status`),
  ADD KEY `Order_userId_fkey` (`userId`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderItem_orderId_idx` (`orderId`),
  ADD KEY `OrderItem_productId_idx` (`productId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Product_slug_key` (`slug`),
  ADD KEY `Product_categoryId_idx` (`categoryId`),
  ADD KEY `Product_brandId_idx` (`brandId`),
  ADD KEY `Product_status_idx` (`status`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Session_userId_idx` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `User_role_idx` (`role`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `Inventory_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `OrderItem_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_brandId_fkey` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `Session_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
