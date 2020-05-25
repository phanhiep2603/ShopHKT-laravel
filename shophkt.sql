-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2020 at 07:28 AM
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
(6, 'Shirts', 'shirts', 0, 'Shirts', 'Shirts Just 4 men by HKTShop', '2020-05-25 02:04:02', '2020-05-25 02:04:02'),
(7, 'Trousers', 'trousers', 0, 'Trousers', 'The best Trousers for men', '2020-05-25 02:06:36', '2020-05-25 02:06:36'),
(8, 'T-Shirts', 't-shirts', 6, 'Tshirts', 'The best T-shirt for men', '2020-05-25 02:07:28', '2020-05-25 02:07:28'),
(9, 'Jeans', 'jeans', 7, 'Jeans', 'The best Jeans for men', '2020-05-25 02:07:47', '2020-05-25 02:07:47'),
(10, 'Jogger', 'jogger', 7, 'Jogger', 'The best Jogger 4 men', '2020-05-25 02:08:08', '2020-05-25 02:08:08');

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

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `note`, `status`, `created_at`, `updated_at`, `date_contact`) VALUES
(7, 'Phan Trần Hoàng Hiệp', 'phanhiep2603@gmail.com', '0908122860', 'the best my choice', '2', '2020-05-25 05:22:21', '2020-05-25 05:23:07', '2020-05-25 12:22:21');

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
(13, '2020_05_18_131512_alter_colum_date_create_in_table_users', 5),
(14, '2020_05_19_103118_create_comments_table', 6),
(15, '2020_05_19_104305_create_comments_table', 7);

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
(42, '2020-05-25 12:16:00', 108.9, 'Cash On Delivery', '3', 'giao hàng đúng lúc', 5, '2020-05-25 05:16:00', '2020-05-25 05:25:22');

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
(42, 1, 65, '28', 10, 42, '2020-05-25 05:16:00', '2020-05-25 05:16:00'),
(43, 1, 25, 'S', 9, 42, '2020-05-25 05:16:00', '2020-05-25 05:16:00');

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
(4, 'OVERSIZED T-SHIRTS', 'oversized-t-shirts', 20, 0, '1', '<p>New product</p>', '<p>Fit: Relaxed fit</p>\r\n\r\n<p>Heavy Weight<br />\r\nRaw edge hem<br />\r\nPoint logo label<br />\r\nImported</p>\r\n\r\n<p>Fabric:&nbsp; 65% Cotton / 35% Poly<br />\r\nModel is 6\' 2\" / 170lbs, wears size L</p>', 'HT005-WHITE-2_700x700.jpg', 'Tshirts', '<p>Description for your choose</p>\r\n\r\n<table style=\"border-collapse:collapse; border-spacing:0px; border:0px; color:rgb(17, 17, 17); float:left; font-family:questrial; font-size:12px; font-stretch:inherit; font-variant-east-asian:inherit; font-variant-numeric:inherit; line-height:inherit; margin:0px 0px 20px; padding:0px; width:505px\">\r\n	<tbody style=\"margin: 0px; padding: 0px; border: 0px; font: inherit;\">\r\n		<tr style=\"margin: 0px; padding: 0px; border-width: 1px 0px; border-top-style: solid; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: rgb(220, 220, 220); border-right-color: initial; border-bottom-color: rgb(220, 220, 220); border-left-color: initial; border-image: initial; font: inherit; text-align: center;\">\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: solid; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: rgb(220, 220, 220); border-image: initial; font: inherit;\">&nbsp;</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\"><strong style=\"border:0px; font-family:inherit; font-size:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; line-height:inherit; margin:0px; padding:0px\">S</strong></td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\"><strong style=\"border:0px; font-family:inherit; font-size:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; line-height:inherit; margin:0px; padding:0px\">M</strong></td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\"><strong style=\"border:0px; font-family:inherit; font-size:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; line-height:inherit; margin:0px; padding:0px\">L</strong></td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\"><strong style=\"border:0px; font-family:inherit; font-size:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; line-height:inherit; margin:0px; padding:0px\">XL</strong></td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\"><strong style=\"border:0px; font-family:inherit; font-size:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; line-height:inherit; margin:0px; padding:0px\">XXL</strong></td>\r\n		</tr>\r\n		<tr style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(220, 220, 220); border-left-color: initial; border-image: initial; font: inherit; text-align: center;\">\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: solid; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: rgb(220, 220, 220); border-image: initial; font: inherit;\"><span style=\"border:0px; font:inherit; margin:0px; padding:0px\"><strong style=\"border:0px; font-family:inherit; font-size:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; line-height:inherit; margin:0px; padding:0px\">CHEST</strong>&nbsp;</span><span style=\"border:0px; font:inherit; margin:0px; padding:0px\">(in.)</span></td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">44</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">46</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">48</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">50</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">52</td>\r\n		</tr>\r\n		<tr style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(220, 220, 220); border-left-color: initial; border-image: initial; font: inherit; text-align: center;\">\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: solid; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: rgb(220, 220, 220); border-image: initial; font: inherit;\"><span style=\"border:0px; font:inherit; margin:0px; padding:0px\"><strong style=\"border:0px; font-family:inherit; font-size:inherit; font-stretch:inherit; font-style:inherit; font-variant:inherit; line-height:inherit; margin:0px; padding:0px\">LENGTH</strong>&nbsp;</span><span style=\"border:0px; font:inherit; margin:0px; padding:0px\">(in.)</span></td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">30</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">31</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">32</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">33</td>\r\n			<td style=\"margin: 0px; padding: 4px; border-width: 0px 1px 0px 0px; border-top-style: initial; border-right-style: solid; border-bottom-style: initial; border-left-style: initial; border-top-color: initial; border-right-color: rgb(220, 220, 220); border-bottom-color: initial; border-left-color: initial; border-image: initial; font: inherit;\">34</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 5, 8, '2020-05-25 02:12:06', '2020-05-25 02:20:21'),
(5, 'SLIT LONG T-SHIRTS - RED', 'slit-long-t-shirts---red', 22, 0, '1', '<p>New products</p>', '<p><strong>Fit: Long Slim</strong></p>\r\n\r\n<ul>\r\n	<li>Crew neck</li>\r\n	<li>Longer back with split sides</li>\r\n	<li>Longline cut</li>\r\n	<li>Cut longer than standard length</li>\r\n	<li>Machine wash cold</li>\r\n	<li>Fabric:&nbsp; 100% Cotton</li>\r\n</ul>\r\n\r\n<p>Model is 6\'\' 1\" / 167lbs, wears size M</p>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 333px; top: 204px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', 'HT002-RED-1_700x700.jpg', 'Tshirts', '<p>Description for your choose</p>\r\n\r\n<table style=\"border-collapse:collapse; border-spacing:0px; border:0px; color:rgb(17, 17, 17); float:left; font-family:questrial; font-size:12px; font-stretch:inherit; font-variant-east-asian:inherit; font-variant-numeric:inherit; line-height:inherit; margin:0px 0px 20px; padding:0px; width:505px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td><strong>S</strong></td>\r\n			<td><strong>M</strong></td>\r\n			<td><strong>L</strong></td>\r\n			<td><strong>XL</strong></td>\r\n			<td><strong>XXL</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>CHEST</strong>&nbsp;(in.)</td>\r\n			<td>44</td>\r\n			<td>46</td>\r\n			<td>48</td>\r\n			<td>50</td>\r\n			<td>52</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>LENGTH</strong>&nbsp;(in.)</td>\r\n			<td>30</td>\r\n			<td>31</td>\r\n			<td>32</td>\r\n			<td>33</td>\r\n			<td>34</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 5, 8, '2020-05-25 02:27:43', '2020-05-25 02:31:22'),
(6, 'SLIT LONG T-SHIRTS - BLACK', 'slit-long-t-shirts---black', 22, 0, '1', '<p>New Product</p>', '<p><strong>Fit: Long Slim</strong></p>\r\n\r\n<ul>\r\n	<li>Crew neck</li>\r\n	<li>Longer back with split sides</li>\r\n	<li>Longline cut</li>\r\n	<li>Cut longer than standard length</li>\r\n	<li>Machine wash cold</li>\r\n	<li>Fabric:&nbsp; 100% Cotton</li>\r\n</ul>\r\n\r\n<p>Model is 6\'\' 1\" / 167lbs, wears size M</p>', 'HT002-BLACK-1_700x700.jpg', 'Tshirts', '<p>Description for your choose</p>\r\n\r\n<table style=\"border-collapse:collapse; border-color:initial; border-spacing:0px; border-style:initial; border-width:0px; color:rgb(17, 17, 17); float:left; font-family:questrial; font-size:12px; font-stretch:inherit; font-variant-east-asian:inherit; font-variant-numeric:inherit; line-height:inherit; margin:0px 0px 20px; padding:0px; width:505px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td><strong>S</strong></td>\r\n			<td><strong>M</strong></td>\r\n			<td><strong>L</strong></td>\r\n			<td><strong>XL</strong></td>\r\n			<td><strong>XXL</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>CHEST</strong>&nbsp;(in.)</td>\r\n			<td>44</td>\r\n			<td>46</td>\r\n			<td>48</td>\r\n			<td>50</td>\r\n			<td>52</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>LENGTH</strong>&nbsp;(in.)</td>\r\n			<td>30</td>\r\n			<td>31</td>\r\n			<td>32</td>\r\n			<td>33</td>\r\n			<td>34</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 5, 8, '2020-05-25 02:30:44', '2020-05-25 02:35:37'),
(7, 'ZIPPER LONG T-SHIRTS', 'zipper-long-t-shirts', 30, 20, '1', '<p>New product</p>', '<p><strong>Fit: Long Relaxed</strong></p>\r\n\r\n<ul>\r\n	<li>Crew neck</li>\r\n	<li>Side zip detail</li>\r\n	<li>Longline cut</li>\r\n	<li>Curved hem</li>\r\n	<li>Cut longer than standard length</li>\r\n	<li>Machine wash cold</li>\r\n	<li>100% Cotton</li>\r\n	<li>Imported</li>\r\n</ul>\r\n\r\n<p>Model is 6\'\' 1\" / 167lbs, wears size M</p>', 'HT001-BLACK-1-2_700x700.jpg', 'Tshirts', '<p>Description for your choose</p>\r\n\r\n<table style=\"border-collapse:collapse; border-color:initial; border-spacing:0px; border-style:initial; border-width:0px; color:rgb(17, 17, 17); float:left; font-family:questrial; font-size:12px; font-stretch:inherit; font-variant-east-asian:inherit; font-variant-numeric:inherit; line-height:inherit; margin:0px 0px 20px; padding:0px; width:505px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td><strong>S</strong></td>\r\n			<td><strong>M</strong></td>\r\n			<td><strong>L</strong></td>\r\n			<td><strong>XL</strong></td>\r\n			<td><strong>XXL</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>CHEST</strong>&nbsp;(in.)</td>\r\n			<td>44</td>\r\n			<td>46</td>\r\n			<td>48</td>\r\n			<td>50</td>\r\n			<td>52</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>LENGTH</strong>&nbsp;(in.)</td>\r\n			<td>30</td>\r\n			<td>31</td>\r\n			<td>32</td>\r\n			<td>33</td>\r\n			<td>34</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 5, 8, '2020-05-25 02:33:56', '2020-05-25 02:35:01'),
(8, 'Long Sleeve Work Shirt - Navy Blue', 'long-sleeve-work-shirt---navy-blue', 20, 0, '1', '<p>New Products</p>', '<p>Generous fit in shoulders and chest<br />\r\n5.25 oz. Twill, 65% Polyester/35% Cotton<br />\r\nThe hardest-working long sleeve work shirt available<br />\r\nMoisture wicking<br />\r\nEasy-care stain release<br />\r\nPencil division in left chest pocket<br />\r\nDoghouse sleeve plackets<br />\r\nNon-break melamine buttons<br />\r\nColors match our Original 874®<br />\r\nNavy Blue<br />\r\nImported</p>', '574_NV_FR.jpg', 'Shirt', '<p>Description for your choose</p>\r\n\r\n<table style=\"border-collapse:collapse; border-color:initial; border-spacing:0px; border-style:initial; border-width:0px; color:rgb(17, 17, 17); float:left; font-family:questrial; font-size:12px; font-stretch:inherit; font-variant-east-asian:inherit; font-variant-numeric:inherit; line-height:inherit; margin:0px 0px 20px; padding:0px; width:505px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td><strong>S</strong></td>\r\n			<td><strong>M</strong></td>\r\n			<td><strong>L</strong></td>\r\n			<td><strong>XL</strong></td>\r\n			<td><strong>XXL</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>CHEST</strong>&nbsp;(in.)</td>\r\n			<td>44</td>\r\n			<td>46</td>\r\n			<td>48</td>\r\n			<td>50</td>\r\n			<td>52</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>LENGTH</strong>&nbsp;(in.)</td>\r\n			<td>30</td>\r\n			<td>31</td>\r\n			<td>32</td>\r\n			<td>33</td>\r\n			<td>34</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 5, 6, '2020-05-25 02:39:02', '2020-05-25 02:39:02'),
(9, 'FLEX Relaxed Fit Long Sleeve Twill Work Shirt - Charcoal Gray', 'flex-relaxed-fit-long-sleeve-twill-work-shirt---charcoal-gray', 25, 0, '1', '<p>New product</p>', '<p>Generous fit across shoulders and in sleeve lengths<br />\r\n4.6 oz. Stretch Twill, 65% Polyester/35% Cotton<br />\r\nFlex fabric for comfort and ease of movement<br />\r\nMoisture wicking<br />\r\nPencil division in left pocket<br />\r\nImproved breathability for all day comfort<br />\r\nCharcoal Gray<br />\r\nImported</p>', 'WL675_CH_FR.jpg', 'Shirt', '<p>Description for your choose</p>\r\n\r\n<table style=\"border-collapse:collapse; border-color:initial; border-spacing:0px; border-style:initial; border-width:0px; color:rgb(17, 17, 17); float:left; font-family:questrial; font-size:12px; font-stretch:inherit; font-variant-east-asian:inherit; font-variant-numeric:inherit; line-height:inherit; margin:0px 0px 20px; padding:0px; width:505px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td><strong>S</strong></td>\r\n			<td><strong>M</strong></td>\r\n			<td><strong>L</strong></td>\r\n			<td><strong>XL</strong></td>\r\n			<td><strong>XXL</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>CHEST</strong>&nbsp;(in.)</td>\r\n			<td>44</td>\r\n			<td>46</td>\r\n			<td>48</td>\r\n			<td>50</td>\r\n			<td>52</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>LENGTH</strong>&nbsp;(in.)</td>\r\n			<td>30</td>\r\n			<td>31</td>\r\n			<td>32</td>\r\n			<td>33</td>\r\n			<td>34</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 5, 6, '2020-05-25 02:40:18', '2020-05-25 02:40:18'),
(10, 'BLACK IAN JEAN', 'black-ian-jean', 65, 0, '1', '<p>New product</p>', '<p><strong>FIT : SLIM TAPERED LEG</strong></p>\r\n\r\n<ul>\r\n	<li>Stretch denim for increased wearability</li>\r\n	<li>Mid-rise</li>\r\n	<li>Five pocket styling</li>\r\n	<li>Skinny tapered leg silhouette</li>\r\n	<li>Belt loops with D-Ring</li>\r\n	<li>Pewter-tone hardware</li>\r\n	<li>Tonal stitching</li>\r\n	<li>Machine wash cold</li>\r\n	<li>Imported</li>\r\n</ul>\r\n\r\n<p>Fabric:&nbsp; 98% Cotton / 2% Spandex<br />\r\nModel is 6\'1\" tall 165 lbs, wears size 32</p>', 'HD000_BLACK-9.jpg', 'Jean', '<p>The best your choice</p>', 5, 9, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(11, 'BLACK NATE ZIPPER PANT', 'black-nate-zipper-pant', 60, 0, '1', '<p>New product</p>', '<p>Stretch 11 oz Twill for increased wearability<br />\r\nCream white string on waist<br />\r\nRipped knee<br />\r\n10\" Zipper on side ankles<br />\r\nFive pocket styling<br />\r\nTapered from the knee down<br />\r\nZip fly &amp; Belt loops with D-Ring<br />\r\nMachine wash cold<br />\r\nImported<br />\r\n98% Cotton 2% Spandex<br />\r\nModel is 6\'2\" tall 170 lbs, wears size 32\".</p>', 'HD012-BLACK-1-1_700x700.jpg', 'Jean', '<p>Description for your choose</p>\r\n\r\n<table style=\"border-collapse:collapse; border-color:initial; border-spacing:0px; border-style:initial; border-width:0px; color:rgb(17, 17, 17); float:left; font-family:questrial; font-size:12px; font-stretch:inherit; font-variant-east-asian:inherit; font-variant-numeric:inherit; line-height:inherit; margin:0px 0px 20px; padding:0px; width:505px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td><strong>S</strong></td>\r\n			<td><strong>M</strong></td>\r\n			<td><strong>L</strong></td>\r\n			<td><strong>XL</strong></td>\r\n			<td><strong>XXL</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>CHEST</strong>&nbsp;(in.)</td>\r\n			<td>44</td>\r\n			<td>46</td>\r\n			<td>48</td>\r\n			<td>50</td>\r\n			<td>52</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>LENGTH</strong>&nbsp;(in.)</td>\r\n			<td>30</td>\r\n			<td>31</td>\r\n			<td>32</td>\r\n			<td>33</td>\r\n			<td>34</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 5, 9, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(12, 'BLACK CAMO CARGO JOGGER', 'black-camo-cargo-jogger', 60, 0, '1', '<p>New product</p>', '<p><strong>Fit: Relax Tapered Leg</strong></p>\r\n\r\n<ul>\r\n	<li>Stretch twill for increased wearability</li>\r\n	<li>Side cargo pocket with snap closure</li>\r\n	<li>Snap closure on back pocket</li>\r\n	<li>Tapered leg silhouette with elasticized cuff ribs</li>\r\n	<li>Elasticized waistband</li>\r\n	<li>Drawstring at waist</li>\r\n	<li>D-Ring</li>\r\n	<li>Machine wash cold</li>\r\n	<li>Imported</li>\r\n	<li>Fabric:&nbsp; 98% Cotton / 2% Spandex</li>\r\n</ul>\r\n\r\n<p>Model is 6\'1\" tall, wears size M</p>', 'HD108-BLK-CAMO-1_700x700.jpg', 'Jogger', '<p>Description for your choose</p>\r\n\r\n<table style=\"border-collapse:collapse; border-color:initial; border-spacing:0px; border-style:initial; border-width:0px; color:rgb(17, 17, 17); float:left; font-family:questrial; font-size:12px; font-stretch:inherit; font-variant-east-asian:inherit; font-variant-numeric:inherit; line-height:inherit; margin:0px 0px 20px; padding:0px; width:505px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td><strong>S</strong></td>\r\n			<td><strong>M</strong></td>\r\n			<td><strong>L</strong></td>\r\n			<td><strong>XL</strong></td>\r\n			<td><strong>XXL</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>CHEST</strong>&nbsp;(in.)</td>\r\n			<td>44</td>\r\n			<td>46</td>\r\n			<td>48</td>\r\n			<td>50</td>\r\n			<td>52</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>LENGTH</strong>&nbsp;(in.)</td>\r\n			<td>30</td>\r\n			<td>31</td>\r\n			<td>32</td>\r\n			<td>33</td>\r\n			<td>34</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 5, 10, '2020-05-25 04:51:51', '2020-05-25 04:51:51');

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
(4, 'HT005-WHITE-1_700x700.jpg', 4, '2020-05-25 02:12:06', '2020-05-25 02:12:06'),
(5, 'HT005-WHITE-3_700x700.jpg', 4, '2020-05-25 02:12:06', '2020-05-25 02:12:06'),
(6, 'HT002-RED-2_700x700.jpg', 5, '2020-05-25 02:27:43', '2020-05-25 02:27:43'),
(7, 'HT002-RED-3_700x700.jpg', 5, '2020-05-25 02:27:43', '2020-05-25 02:27:43'),
(8, 'HT002-BLACK-2_700x700.jpg', 6, '2020-05-25 02:30:44', '2020-05-25 02:30:44'),
(9, 'HT002-BLACK-3_700x700.jpg', 6, '2020-05-25 02:30:44', '2020-05-25 02:30:44'),
(10, 'HT001-BLACK_700x700.jpg', 7, '2020-05-25 02:33:56', '2020-05-25 02:33:56'),
(11, 'HT001-BLACK-2_700x700.jpg', 7, '2020-05-25 02:33:56', '2020-05-25 02:33:56'),
(12, 'IMG_1614_700x700.jpg', 7, '2020-05-25 02:33:56', '2020-05-25 02:33:56'),
(13, '574_NV_BK.jpg', 8, '2020-05-25 02:39:02', '2020-05-25 02:39:02'),
(14, 'WL675_CH_BK.jpg', 9, '2020-05-25 02:40:18', '2020-05-25 02:40:18'),
(15, 'HD000_BLACK-6_700x700.jpg', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(16, 'HD000_BLACK-4_700x700.jpg', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(17, 'HD000_BLACK-3_700x700.jpg', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(18, 'HD012-BLACK-2_dcc73374-0e97-49c2-a631-1d02434fb696_700x700.jpg', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(19, 'HD012-BLACK-3_90ef0cb3-f119-44dc-ba59-a86ce3b117e9_700x700.jpg', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(20, 'HD012-BLACK-5_e4b11f7a-8752-44c0-a567-42e4fd00c1dd_700x700.jpg', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(21, 'HD012-BLACK-7_0db5ce2c-91ad-43d2-9a72-a311be9bbde3_700x700.jpg', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(22, 'HD012-BLACK-8_22728f44-779e-44d2-b22a-9d97e3a88ba2_700x700.jpg', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(23, 'HD108-BLK-CAMO-3_700x700.jpg', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(24, 'HD108-BLK-CAMO-5_700x700.jpg', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(25, 'HD108-BLK-CAMO-7_700x700.jpg', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(26, 'HD108-BLK-CAMO-8_700x700.jpg', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(27, 'HD108-BLK-CAMO-10_700x700.jpg', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51');

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
(10, 'S', 4, '2020-05-25 02:12:06', '2020-05-25 02:12:06'),
(11, 'M', 4, '2020-05-25 02:12:06', '2020-05-25 02:12:06'),
(12, 'L', 4, '2020-05-25 02:12:06', '2020-05-25 02:12:06'),
(13, 'XL', 4, '2020-05-25 02:12:06', '2020-05-25 02:12:06'),
(14, 'XXL', 4, '2020-05-25 02:17:00', '2020-05-25 02:17:00'),
(15, 'S', 5, '2020-05-25 02:27:43', '2020-05-25 02:27:43'),
(16, 'M', 5, '2020-05-25 02:27:43', '2020-05-25 02:27:43'),
(17, 'L', 5, '2020-05-25 02:27:43', '2020-05-25 02:27:43'),
(18, 'XL', 5, '2020-05-25 02:27:43', '2020-05-25 02:27:43'),
(19, 'XXL', 5, '2020-05-25 02:27:43', '2020-05-25 02:27:43'),
(20, 'M', 6, '2020-05-25 02:30:44', '2020-05-25 02:30:44'),
(21, 'M', 6, '2020-05-25 02:30:44', '2020-05-25 02:30:44'),
(22, 'L', 6, '2020-05-25 02:30:44', '2020-05-25 02:30:44'),
(23, 'XL', 6, '2020-05-25 02:30:44', '2020-05-25 02:30:44'),
(24, 'XXL', 6, '2020-05-25 02:30:44', '2020-05-25 02:30:44'),
(25, 'S', 7, '2020-05-25 02:34:21', '2020-05-25 02:34:21'),
(26, 'S', 7, '2020-05-25 02:34:21', '2020-05-25 02:34:21'),
(27, 'L', 7, '2020-05-25 02:34:21', '2020-05-25 02:34:21'),
(28, 'XL', 7, '2020-05-25 02:34:21', '2020-05-25 02:34:21'),
(29, 'XXL', 7, '2020-05-25 02:34:21', '2020-05-25 02:34:21'),
(30, 'S', 8, '2020-05-25 02:39:02', '2020-05-25 02:39:02'),
(31, 'M', 8, '2020-05-25 02:39:02', '2020-05-25 02:39:02'),
(32, 'L', 8, '2020-05-25 02:39:02', '2020-05-25 02:39:02'),
(33, 'XL', 8, '2020-05-25 02:39:02', '2020-05-25 02:39:02'),
(34, 'S', 9, '2020-05-25 02:40:18', '2020-05-25 02:40:18'),
(35, 'M', 9, '2020-05-25 02:40:18', '2020-05-25 02:40:18'),
(36, 'L', 9, '2020-05-25 02:40:18', '2020-05-25 02:40:18'),
(37, 'XXL', 9, '2020-05-25 02:40:18', '2020-05-25 02:40:18'),
(38, '28', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(39, '29', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(40, '30', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(41, '31', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(42, '32', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(43, '33', 10, '2020-05-25 02:42:55', '2020-05-25 02:42:55'),
(44, '28', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(45, '29', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(46, '30', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(47, '31', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(48, '32', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(49, '33', 11, '2020-05-25 04:50:25', '2020-05-25 04:50:25'),
(50, '28', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(51, '29', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(52, '30', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(53, '31', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(54, '32', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51'),
(55, '33', 12, '2020-05-25 04:51:51', '2020-05-25 04:51:51');

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
(5, 'Admin', 'Admin', 'admin@gmail.com', '$2y$10$H3SEZnrw6elget3GuFWhm.kbfscnyYNd0FGKN.wte89F1nN5DRh9m', '0', '123 ABC', '0908122860', 1, 'admin', 'L2mgHEVEIO6bVM3vrwaWSTmPsP2XrxZvKm86tM6b8bg5q83FTAPerKFxD5pc', '2020-05-12 05:25:33', '2020-05-17 07:54:12', NULL, NULL),
(6, 'hoanghiep', 'phan trần hoàng hiệp', 'phanhiep2603@gmail.com', '$2y$10$0q97375ZMf30lXxhfOg3vu0nWY1/tO7xK7sen8ul6g.ZrtVpkQ7BO', '1', '334/64/139 Chu Văn An', '0908122860', 2, 'Offline', 'BQfuyOJ1VE3crDCFdSj6nsOiNShlKttgMKtegoEGXKNJVtnGjzIZI9RlrRwM', '2020-05-12 05:37:39', '2020-05-14 08:50:27', '$2y$10$TVzet1STLcCVWYLacauc7.6mUVbO/sSaC9muJ2O3TMv7mnu/Guyje', '2020-05-14 08:50:11');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
