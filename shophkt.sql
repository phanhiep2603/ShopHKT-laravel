-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 08:34 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shophkt`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `alias`, `parent_id`, `keywords`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Quần', 'quan', 0, 'Quan', 'Quần Nam thời trang', '2020-05-10 09:02:10', '2020-05-12 05:29:20'),
(2, 'Áo', 'ao', 0, 'Ao', 'Áo nam thời trang', '2020-05-12 05:30:07', '2020-05-12 05:30:07'),
(3, 'Quần Jean', 'quan-jean', 1, 'Jean', 'Quần Jean Nam', '2020-05-12 05:31:16', '2020-05-12 05:31:16'),
(4, 'Áo Thun', 'ao-thun', 2, 'T-shirt', 'Áo thun nam', '2020-05-12 05:32:13', '2020-05-12 05:32:13'),
(5, 'Quần Jogger', 'quan-jogger', 1, 'Jogger', 'Quần Jogger', '2020-05-12 05:32:38', '2020-05-12 05:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date_contact` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_10_24_072131_create_contacts_table', 1),
(4, '2017_10_24_072147_create_categories_table', 1),
(5, '2017_10_24_072437_create_products_table', 1),
(6, '2017_10_24_072513_create_product_images_table', 1),
(7, '2017_10_24_072629_create_product_sizes_table', 1),
(8, '2017_10_24_072708_create_orders_table', 1),
(9, '2017_10_24_072720_create_order_details_table', 1),
(10, '2020_05_14_112032_alter_column_code_and_time_code_in_table_users', 2),
(11, '2020_05_16_170105_alter_colum_date_contact_in_table_contacts', 3),
(12, '2020_05_16_170724_alter_colum_date_contact_in_table_contacts', 4),
(13, '2020_05_18_131512_alter_colum_date_create_in_table_users', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_order` datetime NOT NULL,
  `total` double NOT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date_order`, `total`, `payment`, `status`, `note`, `user_id`, `created_at`, `updated_at`) VALUES
(12, '2020-05-17 00:08:54', 471900, 'Cash On Delivery', '3', '', 6, '2020-05-17 17:08:54', '2020-05-17 17:16:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `quantity`, `unit_price`, `size`, `product_id`, `order_id`, `created_at`, `updated_at`) VALUES
(12, 1, 390000, 'M', 2, 12, '2020-05-17 17:08:54', '2020-05-17 17:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `price_new` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `cate_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `alias`, `price`, `price_new`, `status`, `intro`, `content`, `image`, `keywords`, `description`, `user_id`, `cate_id`, `created_at`, `updated_at`) VALUES
(2, 'Polo Academy', 'polo-academy', 400000, 390000, '1', '<h1 style=\"text-align:center\">Polo</h1>', '<h1 style=\"text-align:center\">Academy</h1>', 'aca-polo-gra-1-w.png', 'Ao', '<p><strong>Chi tiết sản phẩm:</strong><br />\r\n<span style=\"color:rgb(72, 72, 72); font-family:pn,sans-serif; font-size:14px\">• 100% Cotton</span><br />\r\n<span style=\"color:rgb(72, 72, 72); font-family:pn,sans-serif; font-size:14px\">• Form áo cơ bản.</span><br />\r\n<span style=\"color:rgb(72, 72, 72); font-family:pn,sans-serif; font-size:14px\">• Họa tiết được thêu trực tiếp lên áo</span></p>', 5, 4, '2020-05-12 05:36:48', '2020-05-13 03:39:40'),
(3, 'aa', 'aa', 67867, 1551515, '1', '<p>aa</p>', '<p>aâ</p>', 'Untitled-2.jpg', 'aa', '<p>aâ</p>', 5, 1, '2020-05-16 12:49:01', '2020-05-17 14:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'aca-polo-gra-1-w.png', 2, '2020-05-12 05:36:48', '2020-05-12 05:36:48'),
(2, 'aca-polo-gra-2-w.png', 2, '2020-05-12 05:36:48', '2020-05-12 05:36:48'),
(3, 'image0.jpeg', 3, '2020-05-16 12:49:01', '2020-05-16 12:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `size`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'M', 2, '2020-05-12 05:38:30', '2020-05-12 05:38:30'),
(2, 'M', 2, '2020-05-12 05:38:45', '2020-05-12 05:38:45'),
(3, 'L', 2, '2020-05-12 05:38:45', '2020-05-12 05:38:45'),
(4, 'S', 2, '2020-05-12 05:38:45', '2020-05-12 05:38:45'),
(5, 'XL', 2, '2020-05-12 05:38:45', '2020-05-12 05:38:45'),
(6, 'S', 3, '2020-05-17 14:43:14', '2020-05-17 14:43:14'),
(7, 'M', 3, '2020-05-17 14:43:14', '2020-05-17 14:43:14'),
(8, 'L', 3, '2020-05-17 14:43:14', '2020-05-17 14:43:14'),
(9, 'XL', 3, '2020-05-17 14:43:14', '2020-05-17 14:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_code` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `password`, `gender`, `address`, `phone`, `level`, `status`, `remember_token`, `created_at`, `updated_at`, `code`, `time_code`) VALUES
(5, 'Admin', 'Admin', 'admin@gmail.com', '$2y$10$H3SEZnrw6elget3GuFWhm.kbfscnyYNd0FGKN.wte89F1nN5DRh9m', '0', '123 ABC', '0908122860', 1, 'admin', 'iUX4TvGwMLftR6X4hLgQR8X6I1izdrLmsDwnCMnoKvDFaxzNk72ExnpJjo8v', '2020-05-12 05:25:33', '2020-05-17 07:54:12', NULL, NULL),
(6, 'hoanghiep', 'phan trần hoàng hiệp', 'phanhiep2603@gmail.com', '$2y$10$0q97375ZMf30lXxhfOg3vu0nWY1/tO7xK7sen8ul6g.ZrtVpkQ7BO', '1', '334/64/139 Chu Văn An', '0908122860', 2, 'Offline', 'nk92vmla0dlRTL9bAOhuK4AT3EIBJ2tgufZlRQ9XyWsSAQfa9Van0XzAS72W', '2020-05-12 05:37:39', '2020-05-14 08:50:27', '$2y$10$TVzet1STLcCVWYLacauc7.6mUVbO/sSaC9muJ2O3TMv7mnu/Guyje', '2020-05-14 08:50:11'),
(7, 'user', 'Hiep', 'phanhiep2603@gmail.com', '$2y$10$C4lmeMNq5RrWdcR17YGXl.PI4598cVacb1.zp8y//RCcMIDKG3Fwa', '1', '334/64/139 Chu Văn An', '0908122860', 2, 'Offline', NULL, '2020-05-16 12:45:40', '2020-05-16 12:45:40', NULL, NULL),
(8, 'hoanghiep123', 'Hoàng Hiệp', 'taoquenroi12111@gmail.com', '$2y$10$pMjyrzxo8PaaCXr7QnBC6O1U0OBrqZq35uH9TxBDweotIrQIlkCK6', '1', '111111', '0912345678', 2, 'Offline', NULL, '2020-05-18 06:18:32', '2020-05-18 06:18:32', NULL, NULL),
(9, 'hoanghiep1', 'Hoàng Hiệp', 'taoquenroi1311@gmail.com', '$2y$10$.21HX3iE1ldb44lHKiVwd.vD8XdSiAU2y0hXIJUv6mkSrIy41XU4K', '1', '1111', '0912345689', 2, 'Offline', NULL, '2020-05-18 06:21:45', '2020-05-18 06:21:45', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_cate_id_foreign` (`cate_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sizes_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_code_index` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
