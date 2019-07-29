-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2019 at 08:30 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_apotik`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_obat`
--

CREATE TABLE `jenis_obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(200) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_obat`
--

INSERT INTO `jenis_obat` (`id`, `nama_obat`, `updated_at`, `created_at`) VALUES
(1, 'Sirup', '2019-06-28 13:43:29', '2019-06-28 13:35:31'),
(2, 'Pil', '2019-06-29 14:45:50', '2019-06-29 14:45:50'),
(3, 'tablet', '2019-07-29 01:52:07', '2019-07-29 01:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama_karyawan` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama_karyawan`, `alamat`, `notelp`, `updated_at`, `created_at`) VALUES
(1, 'Lilik', 'Narmada, Tana Tepong', '081909122091', '2019-06-28 15:42:35', '2019-06-28 15:23:51'),
(2, 'Panny', 'Sumbawa Besar', '08124125512', '2019-06-29 14:47:23', '2019-06-29 14:47:23'),
(3, 'Suef', 'sumbawa', '08124123', '2019-07-29 01:58:50', '2019-07-27 14:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `nama_pembeli` varchar(100) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `nama_pembeli`, `karyawan_id`, `tanggal`, `updated_at`, `created_at`) VALUES
(28, 'Robert', 1, '2019-07-29', '2019-07-29 03:35:10', '2019-07-29 03:35:10'),
(29, 'NAruto', 2, '2019-07-29', '2019-07-29 04:49:36', '2019-07-29 04:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `penjualandetail`
--

CREATE TABLE `penjualandetail` (
  `id` int(11) NOT NULL,
  `penjualan_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualandetail`
--

INSERT INTO `penjualandetail` (`id`, `penjualan_id`, `produk_id`, `karyawan_id`, `jumlah`, `updated_at`, `created_at`) VALUES
(17, 28, 5, 1, 4, '2019-07-29 03:35:34', '2019-07-29 03:35:34'),
(18, 28, 5, 1, 4, '2019-07-29 04:44:02', '2019-07-29 04:44:02'),
(19, 29, 2, 2, 3, '2019-07-29 04:55:13', '2019-07-29 04:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama`, `qty`, `harga`, `id_jenis`, `updated_at`, `created_at`) VALUES
(1, 'Obh Flu', 11, 12000, 1, '2019-06-28 14:23:47', '2019-06-28 13:55:40'),
(2, 'Bodrex', 20, 5000, 2, '2019-06-29 14:46:39', '2019-06-29 14:46:39'),
(3, 'Negatal', 20, 20000, 1, '2019-07-28 14:13:55', '2019-07-28 14:13:55'),
(5, 'Paracetamol', 4, 3000, 3, '2019-07-29 02:50:30', '2019-07-29 02:50:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Donny Kurniawan', 'donyacm25@gmail.com', NULL, '$2y$10$G2sOJ80HbrpmbuV9bJn2Qu0NNBuMjSsNA4HAPNITvUKcrbTZ5NeV2', 'B2Qw5jZFt9xvU12Hal98BqWfKK6t2nXobBUAoWtkrnZoqNA0ruur1JloKVUb', NULL, '2019-07-19 23:55:51', '2019-07-19 23:55:51'),
(4, 'Lilik Nurhayati', 'lilik@gmail.com', NULL, '$2y$10$I160mZ.9LffFgwstIIAyuOD99ocw0Re52m7umAQroEMnyMmxELIgu', 'tKkymqvDG1qSHxsmqEGW46zWOJ63cWeRc3y1n9wlnVfe25VQnmlpIgbi4yvw', NULL, '2019-07-27 01:14:18', '2019-07-27 01:14:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_obat`
--
ALTER TABLE `jenis_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualandetail`
--
ALTER TABLE `penjualandetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_obat`
--
ALTER TABLE `jenis_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `penjualandetail`
--
ALTER TABLE `penjualandetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
