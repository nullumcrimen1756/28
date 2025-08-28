-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2025 at 08:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gereja`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggaran_pendapatan`
--

CREATE TABLE `anggaran_pendapatan` (
  `id` int(11) NOT NULL,
  `kode_subkategori` varchar(50) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `jumlah` decimal(15,2) NOT NULL DEFAULT 0.00,
  `type` enum('uang-setoran','kelompok','subkategori','keseluruhan') NOT NULL DEFAULT 'subkategori'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggaran_pendapatan`
--

INSERT INTO `anggaran_pendapatan` (`id`, `kode_subkategori`, `bulan`, `jumlah`, `type`) VALUES
(15, '700.02.01', 'All', 190000.00, 'subkategori'),
(16, '700.03.01', 'All', 89000.00, 'subkategori'),
(17, '200.01.01', 'All', 50000.00, 'subkategori'),
(18, '200.01.02', 'All', 300000.00, 'subkategori');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE `jurnal` (
  `id_jurnal` int(11) NOT NULL,
  `nama_jurnal` varchar(100) NOT NULL,
  `kode_jurnal` varchar(10) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`id_jurnal`, `nama_jurnal`, `kode_jurnal`, `deskripsi`) VALUES
(1, 'Pengeluaran Jemaat', 'PJ', NULL),
(2, 'Penerimaan Jemaat', 'PRJ', NULL),
(3, 'Penerimaan Saldo Bank', 'PSB', NULL),
(4, 'Penerimaan GSG', 'PGSG', NULL),
(5, 'JURNAL PENERIMAAN & PENGELUARAN JEMAAT di Bank Mandiri', 'PPJBM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `id_jurnal` int(11) NOT NULL,
  `kode_kategori` varchar(3) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_jurnal`, `kode_kategori`, `nama_kategori`) VALUES
(1, 1, '700', 'Administrasi Gereja'),
(2, 1, '710', 'Operasional Harian'),
(3, 1, '720', 'Pemeliharaan Gedung'),
(4, 1, '730', 'Kegiatan Rohani'),
(5, 1, '740', 'Bantuan Sosial'),
(6, 2, '100', 'Persembahan Rutin'),
(7, 2, '110', 'Persembahan Khusus'),
(8, 2, '120', 'Donasi Jemaat'),
(9, 2, '130', 'Iuran Kegiatan'),
(10, 2, '140', 'Sumbangan Hari Raya'),
(11, 3, '200', 'Transfer Bank'),
(12, 3, '210', 'Bunga Deposito'),
(13, 3, '220', 'Setoran Tunai'),
(14, 3, '230', 'Virtual Account'),
(15, 3, '240', 'QRIS Payment'),
(16, 4, '300', 'Iuran Anggota GSG'),
(17, 4, '310', 'Donasi GSG'),
(18, 4, '320', 'Penjualan Merchandise'),
(19, 4, '330', 'Sponsor Kegiatan'),
(20, 4, '340', 'Event GSG'),
(21, 5, '201', 'Operasional Mandiri'),
(22, 5, '401', 'Pelayanan Mandiri'),
(23, 5, '601', 'Pemeliharaan Mandiri'),
(24, 5, '801', 'Kegiatan Jemaat Mandiri');

-- --------------------------------------------------------

--
-- Table structure for table `subkategori`
--

CREATE TABLE `subkategori` (
  `id_subkategori` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `kode_subkategori` varchar(12) NOT NULL,
  `nama_subkategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subkategori`
--

INSERT INTO `subkategori` (`id_subkategori`, `id_kategori`, `kode_subkategori`, `nama_subkategori`) VALUES
(1, 1, '700.01.01', 'Gaji Pendeta Pimpinan'),
(2, 1, '700.01.02', 'Gaji Pendeta Vikaris'),
(3, 1, '700.02.01', 'ATK Kantor Reguler'),
(4, 1, '700.02.02', 'ATK Kantor Khusus'),
(5, 1, '700.03.01', 'Listrik dan Air'),
(6, 2, '710.01.01', 'Konsumsi Rapat Mingguan'),
(7, 2, '710.01.02', 'Konsumsi Rapat Bulanan'),
(8, 2, '710.02.01', 'Transportasi Lokal'),
(9, 2, '710.02.02', 'Transportasi Luar Kota'),
(10, 2, '710.03.01', 'Dekorasi Standar'),
(11, 3, '720.01.01', 'Cat Gedung Eksterior'),
(12, 3, '720.01.02', 'Cat Gedung Interior'),
(13, 3, '720.02.01', 'Perbaikan Kursi Reguler'),
(14, 3, '720.02.02', 'Perbaikan Kursi Khusus'),
(15, 3, '720.03.01', 'Kebersihan Harian'),
(16, 4, '730.01.01', 'Retret Pemuda'),
(17, 4, '730.01.02', 'Retret Lansia'),
(18, 4, '730.02.01', 'Seminar Keluarga'),
(19, 4, '730.02.02', 'Seminar Pemuridan'),
(20, 4, '730.03.01', 'Konser Rohani'),
(21, 5, '740.01.01', 'Bantuan Pendidikan SD'),
(22, 5, '740.01.02', 'Bantuan Pendidikan SMP'),
(23, 5, '740.02.01', 'Bantuan Kesehatan Umum'),
(24, 5, '740.02.02', 'Bantuan Kesehatan Khusus'),
(25, 5, '740.03.01', 'Bencana Alam Ringan'),
(26, 6, '100.01.01', 'Persembahan Minggu Pagi'),
(27, 6, '100.01.02', 'Persembahan Minggu Sore'),
(28, 6, '100.02.01', 'Persembahan Bulanan'),
(29, 6, '100.02.02', 'Persembahan Syukur'),
(30, 6, '100.03.01', 'Persembahan Natal'),
(31, 7, '110.01.01', 'Persembahan Pembangunan'),
(32, 7, '110.01.02', 'Persembahan Pendidikan'),
(33, 7, '110.02.01', 'Persembahan Sosial'),
(34, 7, '110.02.02', 'Persembahan Kesehatan'),
(35, 7, '110.03.01', 'Persembahan Bencana'),
(36, 11, '200.01.01', 'Transfer dari Bank Mandiri'),
(37, 11, '200.01.02', 'Transfer dari Bank BCA'),
(38, 12, '210.01.01', 'Bunga Deposito Bulanan'),
(39, 12, '210.01.02', 'Bunga Deposito Tahunan'),
(40, 13, '220.01.01', 'Setoran Tunai Mingguan'),
(41, 13, '220.01.02', 'Setoran Tunai Acara Khusus'),
(42, 14, '230.01.01', 'VA Pembayaran SPP Jemaat'),
(43, 14, '230.01.02', 'VA Pembayaran Event Khusus'),
(44, 15, '240.01.01', 'QRIS Persembahan Ibadah Minggu'),
(45, 15, '240.01.02', 'QRIS Donasi Sosial'),
(46, 16, '300.01.01', 'Iuran Anggota Bulanan'),
(47, 16, '300.01.02', 'Iuran Anggota Tahunan'),
(48, 17, '310.01.01', 'Donasi Pribadi Jemaat'),
(49, 17, '310.01.02', 'Donasi Perusahaan'),
(50, 18, '320.01.01', 'Penjualan Kaos GSG'),
(51, 18, '320.01.02', 'Penjualan Merchandise Event'),
(52, 19, '330.01.01', 'Sponsor Bank'),
(53, 19, '330.01.02', 'Sponsor UMKM'),
(54, 20, '340.01.01', 'Event Konser Musik'),
(55, 20, '340.01.02', 'Event Seminar Motivasi'),
(56, 21, '201.01.001', 'ATK dan Keperluan Kantor'),
(57, 21, '201.02.001', 'Listrik dan Air'),
(58, 21, '201.03.01a', 'Internet dan Telepon'),
(59, 21, '201.04.01b', 'Transportasi dan Bensin'),
(60, 22, '401.01.001', 'Kegiatan Pelayanan Minggu'),
(61, 22, '401.02.001', 'Kunjungan / Diakonia'),
(62, 22, '401.03.01c', 'Konseling dan Pendampingan'),
(63, 22, '401.04.01d', 'Pelayanan Musik dan Pujian'),
(64, 23, '601.01.001', 'Perawatan Gedung'),
(65, 23, '601.02.001', 'Perbaikan Peralatan'),
(66, 23, '601.03.01e', 'Kebersihan dan Sanitasi'),
(67, 23, '601.04.01f', 'Landscaping dan Taman'),
(68, 24, '801.01.001', 'Kegiatan Remaja'),
(69, 24, '801.02.001', 'Kegiatan Ibu-ibu'),
(70, 24, '801.03.01g', 'Kegiatan Pemuda'),
(71, 24, '801.04.01h', 'Kegiatan Lansia');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_jurnal` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `no_kwitansi` varchar(50) NOT NULL,
  `uraian` text DEFAULT NULL,
  `jumlah` decimal(15,2) NOT NULL,
  `id_subkategori` int(11) DEFAULT NULL,
  `setoran` decimal(15,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_jurnal`, `tanggal`, `no_kwitansi`, `uraian`, `jumlah`, `id_subkategori`, `setoran`, `created_at`) VALUES
(103, 1, '2025-08-01', 'PJ001', 'Gaji Pendeta Pimpinan', 5000000.00, 1, 0.00, '2025-08-24 18:34:49'),
(104, 1, '2025-08-01', 'PJ002', 'ATK Kantor Reguler', 250000.00, 3, 0.00, '2025-08-24 18:34:49'),
(105, 1, '2025-08-05', 'PJ003', 'Listrik dan Air', 750000.00, 5, 0.00, '2025-08-24 18:34:49'),
(106, 1, '2025-08-10', 'PJ004', 'Konsumsi Rapat Mingguan', 350000.00, 6, 0.00, '2025-08-24 18:34:49'),
(107, 1, '2025-08-15', 'PJ005', 'Transportasi Lokal', 200000.00, 8, 0.00, '2025-08-24 18:34:49'),
(108, 1, '2025-08-20', 'PJ006', 'Cat Gedung Interior', 1200000.00, 12, 0.00, '2025-08-24 18:34:49'),
(109, 1, '2025-08-25', 'PJ007', 'Perbaikan Kursi Reguler', 450000.00, 13, 0.00, '2025-08-24 18:34:49'),
(110, 2, '2025-08-04', 'PRJ001', 'Persembahan Minggu Pagi', 2500000.00, 26, 0.00, '2025-08-24 18:34:49'),
(111, 2, '2025-08-04', 'PRJ002', 'Persembahan Minggu Sore', 1800000.00, 27, 0.00, '2025-08-24 18:34:49'),
(112, 2, '2025-08-11', 'PRJ003', 'Persembahan Minggu Pagi', 2700000.00, 26, 0.00, '2025-08-24 18:34:49'),
(113, 2, '2025-08-11', 'PRJ004', 'Persembahan Minggu Sore', 1900000.00, 27, 0.00, '2025-08-24 18:34:49'),
(114, 2, '2025-08-18', 'PRJ005', 'Persembahan Minggu Pagi', 3000000.00, 26, 0.00, '2025-08-24 18:34:49'),
(115, 2, '2025-08-18', 'PRJ006', 'Persembahan Minggu Sore', 2100000.00, 27, 0.00, '2025-08-24 18:34:49'),
(116, 2, '2025-08-25', 'PRJ007', 'Persembahan Minggu Pagi', 3200000.00, 26, 0.00, '2025-08-24 18:34:49'),
(117, 2, '2025-08-25', 'PRJ008', 'Persembahan Minggu Sore', 2200000.00, 27, 0.00, '2025-08-24 18:34:49'),
(118, 3, '2025-08-05', 'PSB001', 'Transfer dari Bank Mandiri', 5000000.00, 36, 0.00, '2025-08-24 18:34:49'),
(119, 3, '2025-08-12', 'PSB002', 'Bunga Deposito Bulanan', 750000.00, 38, 0.00, '2025-08-24 18:34:49'),
(120, 3, '2025-08-19', 'PSB003', 'Setoran Tunai Mingguan', 3000000.00, 40, 0.00, '2025-08-24 18:34:49'),
(121, 3, '2025-08-26', 'PSB004', 'QRIS Persembahan Ibadah', 1500000.00, 44, 0.00, '2025-08-24 18:34:49'),
(122, 4, '2025-08-07', 'PGSG001', 'Iuran Anggota Bulanan', 2000000.00, 46, 0.00, '2025-08-24 18:34:49'),
(123, 4, '2025-08-14', 'PGSG002', 'Donasi Pribadi Jemaat', 1200000.00, 48, 0.00, '2025-08-24 18:34:49'),
(124, 4, '2025-08-21', 'PGSG003', 'Penjualan Kaos GSG', 800000.00, 50, 0.00, '2025-08-24 18:34:49'),
(125, 4, '2025-08-28', 'PGSG004', 'Sponsor Bank', 2500000.00, 52, 0.00, '2025-08-24 18:34:49'),
(126, 5, '2025-08-03', 'PPJBM001', 'ATK dan Keperluan Kantor', 450000.00, 56, 0.00, '2025-08-24 18:34:49'),
(127, 5, '2025-08-06', 'PPJBM002', 'Listrik dan Air', 550000.00, 57, 0.00, '2025-08-24 18:34:49'),
(128, 5, '2025-08-09', 'PPJBM003', 'Kegiatan Pelayanan Minggu', 300000.00, 60, 0.00, '2025-08-24 18:34:49'),
(129, 5, '2025-08-13', 'PPJBM004', 'Perawatan Gedung', 850000.00, 64, 0.00, '2025-08-24 18:34:49'),
(130, 5, '2025-08-17', 'PPJBM005', 'Kegiatan Remaja', 400000.00, 68, 0.00, '2025-08-24 18:34:49'),
(131, 5, '2025-08-20', 'PPJBM006', 'Kegiatan Ibu-ibu', 350000.00, 69, 0.00, '2025-08-24 18:34:49'),
(132, 5, '2025-08-24', 'PPJBM007', 'Kegiatan Pemuda', 500000.00, 70, 0.00, '2025-08-24 18:34:49'),
(133, 5, '2025-08-27', 'PPJBM008', 'Kegiatan Lansia', 300000.00, 71, 0.00, '2025-08-24 18:34:49'),
(134, 1, '2025-09-01', 'PJ009', 'Gaji Pendeta Pimpinan', 5200000.00, 1, 0.00, '2025-08-28 05:27:47'),
(135, 1, '2025-09-01', 'PJ010', 'ATK Kantor Reguler', 280000.00, 3, 0.00, '2025-08-28 05:27:47'),
(136, 1, '2025-09-05', 'PJ011', 'Listrik dan Air', 820000.00, 5, 0.00, '2025-08-28 05:27:47'),
(137, 1, '2025-09-10', 'PJ012', 'Konsumsi Rapat Mingguan', 380000.00, 6, 0.00, '2025-08-28 05:27:47'),
(138, 1, '2025-09-15', 'PJ013', 'Transportasi Lokal', 220000.00, 8, 0.00, '2025-08-28 05:27:47'),
(139, 1, '2025-09-20', 'PJ014', 'Cat Gedung Interior', 1350000.00, 12, 0.00, '2025-08-28 05:27:47'),
(140, 1, '2025-09-25', 'PJ015', 'Perbaikan Kursi Reguler', 480000.00, 13, 0.00, '2025-08-28 05:27:47'),
(141, 2, '2025-09-01', 'PRJ009', 'Persembahan Minggu Pagi', 2650000.00, 26, 0.00, '2025-08-28 05:27:47'),
(142, 2, '2025-09-01', 'PRJ010', 'Persembahan Minggu Sore', 1950000.00, 27, 0.00, '2025-08-28 05:27:47'),
(143, 2, '2025-09-08', 'PRJ011', 'Persembahan Minggu Pagi', 2850000.00, 26, 0.00, '2025-08-28 05:27:47'),
(144, 2, '2025-09-08', 'PRJ012', 'Persembahan Minggu Sore', 2050000.00, 27, 0.00, '2025-08-28 05:27:47'),
(145, 2, '2025-09-15', 'PRJ013', 'Persembahan Minggu Pagi', 3150000.00, 26, 0.00, '2025-08-28 05:27:47'),
(146, 2, '2025-09-15', 'PRJ014', 'Persembahan Minggu Sore', 2250000.00, 27, 0.00, '2025-08-28 05:27:47'),
(147, 2, '2025-09-22', 'PRJ015', 'Persembahan Minggu Pagi', 3350000.00, 26, 0.00, '2025-08-28 05:27:47'),
(148, 2, '2025-09-22', 'PRJ016', 'Persembahan Minggu Sore', 2350000.00, 27, 0.00, '2025-08-28 05:27:47'),
(149, 2, '2025-09-29', 'PRJ017', 'Persembahan Minggu Pagi', 3450000.00, 26, 0.00, '2025-08-28 05:27:47'),
(150, 2, '2025-09-29', 'PRJ018', 'Persembahan Minggu Sore', 2450000.00, 27, 0.00, '2025-08-28 05:27:47'),
(151, 3, '2025-09-02', 'PSB005', 'Transfer dari Bank Mandiri', 5200000.00, 36, 0.00, '2025-08-28 05:27:47'),
(152, 3, '2025-09-09', 'PSB006', 'Bunga Deposito Bulanan', 820000.00, 38, 0.00, '2025-08-28 05:27:47'),
(153, 3, '2025-09-16', 'PSB007', 'Setoran Tunai Mingguan', 3150000.00, 40, 0.00, '2025-08-28 05:27:47'),
(154, 3, '2025-09-23', 'PSB008', 'QRIS Persembahan Ibadah', 1650000.00, 44, 0.00, '2025-08-28 05:27:47'),
(155, 3, '2025-09-30', 'PSB009', 'Transfer dari Bank BCA', 2800000.00, 37, 0.00, '2025-08-28 05:27:47'),
(156, 4, '2025-09-04', 'PGSG005', 'Iuran Anggota Bulanan', 2150000.00, 46, 0.00, '2025-08-28 05:27:47'),
(157, 4, '2025-09-11', 'PGSG006', 'Donasi Pribadi Jemaat', 1350000.00, 48, 0.00, '2025-08-28 05:27:47'),
(158, 4, '2025-09-18', 'PGSG007', 'Penjualan Kaos GSG', 850000.00, 50, 0.00, '2025-08-28 05:27:47'),
(159, 4, '2025-09-25', 'PGSG008', 'Sponsor Bank', 2650000.00, 52, 0.00, '2025-08-28 05:27:47'),
(160, 5, '2025-09-03', 'PPJBM009', 'ATK dan Keperluan Kantor', 480000.00, 56, 0.00, '2025-08-28 05:27:47'),
(161, 5, '2025-09-06', 'PPJBM010', 'Listrik dan Air', 580000.00, 57, 0.00, '2025-08-28 05:27:47'),
(162, 5, '2025-09-10', 'PPJBM011', 'Kegiatan Pelayanan Minggu', 320000.00, 60, 0.00, '2025-08-28 05:27:47'),
(163, 5, '2025-09-13', 'PPJBM012', 'Perawatan Gedung', 880000.00, 64, 0.00, '2025-08-28 05:27:47'),
(164, 5, '2025-09-17', 'PPJBM013', 'Kegiatan Remaja', 420000.00, 68, 0.00, '2025-08-28 05:27:47'),
(165, 5, '2025-09-20', 'PPJBM014', 'Kegiatan Ibu-ibu', 370000.00, 69, 0.00, '2025-08-28 05:27:47'),
(166, 5, '2025-09-24', 'PPJBM015', 'Kegiatan Pemuda', 520000.00, 70, 0.00, '2025-08-28 05:27:47'),
(167, 5, '2025-09-27', 'PPJBM016', 'Kegiatan Lansia', 320000.00, 71, 0.00, '2025-08-28 05:27:47'),
(168, 1, '2025-10-01', 'PJ016', 'Gaji Pendeta Pimpinan', 5400000.00, 1, 0.00, '2025-08-28 05:27:47'),
(169, 1, '2025-10-01', 'PJ017', 'ATK Kantor Reguler', 300000.00, 3, 0.00, '2025-08-28 05:27:47'),
(170, 1, '2025-10-05', 'PJ018', 'Listrik dan Air', 850000.00, 5, 0.00, '2025-08-28 05:27:47'),
(171, 1, '2025-10-10', 'PJ019', 'Konsumsi Rapat Mingguan', 400000.00, 6, 0.00, '2025-08-28 05:27:47'),
(172, 1, '2025-10-15', 'PJ020', 'Transportasi Lokal', 240000.00, 8, 0.00, '2025-08-28 05:27:47'),
(173, 1, '2025-10-20', 'PJ021', 'Cat Gedung Interior', 1450000.00, 12, 0.00, '2025-08-28 05:27:47'),
(174, 1, '2025-10-25', 'PJ022', 'Perbaikan Kursi Reguler', 500000.00, 13, 0.00, '2025-08-28 05:27:47'),
(175, 2, '2025-10-06', 'PRJ019', 'Persembahan Minggu Pagi', 2800000.00, 26, 0.00, '2025-08-28 05:27:47'),
(176, 2, '2025-10-06', 'PRJ020', 'Persembahan Minggu Sore', 2100000.00, 27, 0.00, '2025-08-28 05:27:47'),
(177, 2, '2025-10-13', 'PRJ021', 'Persembahan Minggu Pagi', 3000000.00, 26, 0.00, '2025-08-28 05:27:47'),
(178, 2, '2025-10-13', 'PRJ022', 'Persembahan Minggu Sore', 2200000.00, 27, 0.00, '2025-08-28 05:27:47'),
(179, 2, '2025-10-20', 'PRJ023', 'Persembahan Minggu Pagi', 3300000.00, 26, 0.00, '2025-08-28 05:27:47'),
(180, 2, '2025-10-20', 'PRJ024', 'Persembahan Minggu Sore', 2400000.00, 27, 0.00, '2025-08-28 05:27:47'),
(181, 2, '2025-10-27', 'PRJ025', 'Persembahan Minggu Pagi', 3500000.00, 26, 0.00, '2025-08-28 05:27:47'),
(182, 2, '2025-10-27', 'PRJ026', 'Persembahan Minggu Sore', 2500000.00, 27, 0.00, '2025-08-28 05:27:47'),
(183, 3, '2025-10-07', 'PSB010', 'Transfer dari Bank Mandiri', 5500000.00, 36, 0.00, '2025-08-28 05:27:47'),
(184, 3, '2025-10-14', 'PSB011', 'Bunga Deposito Bulanan', 850000.00, 38, 0.00, '2025-08-28 05:27:47'),
(185, 3, '2025-10-21', 'PSB012', 'Setoran Tunai Mingguan', 3300000.00, 40, 0.00, '2025-08-28 05:27:47'),
(186, 3, '2025-10-28', 'PSB013', 'QRIS Persembahan Ibadah', 1800000.00, 44, 0.00, '2025-08-28 05:27:47'),
(187, 3, '2025-10-31', 'PSB014', 'Transfer dari Bank BCA', 3000000.00, 37, 0.00, '2025-08-28 05:27:47'),
(188, 4, '2025-10-02', 'PGSG009', 'Iuran Anggota Bulanan', 2300000.00, 46, 0.00, '2025-08-28 05:27:47'),
(189, 4, '2025-10-09', 'PGSG010', 'Donasi Pribadi Jemaat', 1450000.00, 48, 0.00, '2025-08-28 05:27:47'),
(190, 4, '2025-10-16', 'PGSG011', 'Penjualan Kaos GSG', 900000.00, 50, 0.00, '2025-08-28 05:27:47'),
(191, 4, '2025-10-23', 'PGSG012', 'Sponsor Bank', 2800000.00, 52, 0.00, '2025-08-28 05:27:47'),
(192, 4, '2025-10-30', 'PGSG013', 'Donasi Perusahaan', 3200000.00, 49, 0.00, '2025-08-28 05:27:47'),
(193, 5, '2025-10-04', 'PPJBM017', 'ATK dan Keperluan Kantor', 500000.00, 56, 0.00, '2025-08-28 05:27:47'),
(194, 5, '2025-10-08', 'PPJBM018', 'Listrik dan Air', 600000.00, 57, 0.00, '2025-08-28 05:27:47'),
(195, 5, '2025-10-12', 'PPJBM019', 'Kegiatan Pelayanan Minggu', 350000.00, 60, 0.00, '2025-08-28 05:27:47'),
(196, 5, '2025-10-15', 'PPJBM020', 'Perawatan Gedung', 920000.00, 64, 0.00, '2025-08-28 05:27:47'),
(197, 5, '2025-10-19', 'PPJBM021', 'Kegiatan Remaja', 450000.00, 68, 0.00, '2025-08-28 05:27:47'),
(198, 5, '2025-10-22', 'PPJBM022', 'Kegiatan Ibu-ibu', 390000.00, 69, 0.00, '2025-08-28 05:27:47'),
(199, 5, '2025-10-26', 'PPJBM023', 'Kegiatan Pemuda', 550000.00, 70, 0.00, '2025-08-28 05:27:47'),
(200, 5, '2025-10-29', 'PPJBM024', 'Kegiatan Lansia', 340000.00, 71, 0.00, '2025-08-28 05:27:47'),
(201, 1, '2025-11-01', 'PJ023', 'Gaji Pendeta Pimpinan', 5600000.00, 1, 0.00, '2025-08-28 05:27:47'),
(202, 1, '2025-11-01', 'PJ024', 'ATK Kantor Reguler', 320000.00, 3, 0.00, '2025-08-28 05:27:47'),
(203, 1, '2025-11-05', 'PJ025', 'Listrik dan Air', 880000.00, 5, 0.00, '2025-08-28 05:27:47'),
(204, 1, '2025-11-10', 'PJ026', 'Konsumsi Rapat Mingguan', 420000.00, 6, 0.00, '2025-08-28 05:27:47'),
(205, 1, '2025-11-15', 'PJ027', 'Transportasi Lokal', 260000.00, 8, 0.00, '2025-08-28 05:27:47'),
(206, 1, '2025-11-20', 'PJ028', 'Cat Gedung Interior', 1550000.00, 12, 0.00, '2025-08-28 05:27:47'),
(207, 1, '2025-11-25', 'PJ029', 'Perbaikan Kursi Reguler', 520000.00, 13, 0.00, '2025-08-28 05:27:47'),
(208, 1, '2025-11-30', 'PJ030', 'Gaji Pendeta Vikaris', 3800000.00, 2, 0.00, '2025-08-28 05:27:47'),
(209, 2, '2025-11-03', 'PRJ027', 'Persembahan Minggu Pagi', 2950000.00, 26, 0.00, '2025-08-28 05:27:47'),
(210, 2, '2025-11-03', 'PRJ028', 'Persembahan Minggu Sore', 2250000.00, 27, 0.00, '2025-08-28 05:27:47'),
(211, 2, '2025-11-10', 'PRJ029', 'Persembahan Minggu Pagi', 3150000.00, 26, 0.00, '2025-08-28 05:27:47'),
(212, 2, '2025-11-10', 'PRJ030', 'Persembahan Minggu Sore', 2350000.00, 27, 0.00, '2025-08-28 05:27:47'),
(213, 2, '2025-11-17', 'PRJ031', 'Persembahan Minggu Pagi', 3450000.00, 26, 0.00, '2025-08-28 05:27:47'),
(214, 2, '2025-11-17', 'PRJ032', 'Persembahan Minggu Sore', 2550000.00, 27, 0.00, '2025-08-28 05:27:47'),
(215, 2, '2025-11-24', 'PRJ033', 'Persembahan Minggu Pagi', 3650000.00, 26, 0.00, '2025-08-28 05:27:47'),
(216, 2, '2025-11-24', 'PRJ034', 'Persembahan Minggu Sore', 2650000.00, 27, 0.00, '2025-08-28 05:27:47'),
(217, 3, '2025-11-04', 'PSB015', 'Transfer dari Bank Mandiri', 5800000.00, 36, 0.00, '2025-08-28 05:27:47'),
(218, 3, '2025-11-11', 'PSB016', 'Bunga Deposito Bulanan', 880000.00, 38, 0.00, '2025-08-28 05:27:47'),
(219, 3, '2025-11-18', 'PSB017', 'Setoran Tunai Mingguan', 3450000.00, 40, 0.00, '2025-08-28 05:27:47'),
(220, 3, '2025-11-25', 'PSB018', 'QRIS Persembahan Ibadah', 1950000.00, 44, 0.00, '2025-08-28 05:27:47'),
(221, 3, '2025-11-30', 'PSB019', 'Transfer dari Bank BCA', 3200000.00, 37, 0.00, '2025-08-28 05:27:47'),
(222, 4, '2025-11-06', 'PGSG014', 'Iuran Anggota Bulanan', 2450000.00, 46, 0.00, '2025-08-28 05:27:47'),
(223, 4, '2025-11-13', 'PGSG015', 'Donasi Pribadi Jemaat', 1550000.00, 48, 0.00, '2025-08-28 05:27:47'),
(224, 4, '2025-11-20', 'PGSG016', 'Penjualan Kaos GSG', 950000.00, 50, 0.00, '2025-08-28 05:27:47'),
(225, 4, '2025-11-27', 'PGSG017', 'Sponsor Bank', 2950000.00, 52, 0.00, '2025-08-28 05:27:47'),
(226, 4, '2025-11-30', 'PGSG018', 'Sponsor UMKM', 1800000.00, 53, 0.00, '2025-08-28 05:27:47'),
(227, 5, '2025-11-05', 'PPJBM025', 'ATK dan Keperluan Kantor', 520000.00, 56, 0.00, '2025-08-28 05:27:47'),
(228, 5, '2025-11-09', 'PPJBM026', 'Listrik dan Air', 620000.00, 57, 0.00, '2025-08-28 05:27:47'),
(229, 5, '2025-11-14', 'PPJBM027', 'Kegiatan Pelayanan Minggu', 380000.00, 60, 0.00, '2025-08-28 05:27:47'),
(230, 5, '2025-11-18', 'PPJBM028', 'Perawatan Gedung', 950000.00, 64, 0.00, '2025-08-28 05:27:47'),
(231, 5, '2025-11-21', 'PPJBM029', 'Kegiatan Remaja', 480000.00, 68, 0.00, '2025-08-28 05:27:47'),
(232, 5, '2025-11-24', 'PPJBM030', 'Kegiatan Ibu-ibu', 410000.00, 69, 0.00, '2025-08-28 05:27:47'),
(233, 5, '2025-11-27', 'PPJBM031', 'Kegiatan Pemuda', 580000.00, 70, 0.00, '2025-08-28 05:27:47'),
(234, 5, '2025-11-30', 'PPJBM032', 'Kegiatan Lansia', 360000.00, 71, 0.00, '2025-08-28 05:27:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggaran_pendapatan`
--
ALTER TABLE `anggaran_pendapatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`id_jurnal`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `id_jurnal` (`id_jurnal`);

--
-- Indexes for table `subkategori`
--
ALTER TABLE `subkategori`
  ADD PRIMARY KEY (`id_subkategori`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_jurnal` (`id_jurnal`),
  ADD KEY `id_subkategori` (`id_subkategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggaran_pendapatan`
--
ALTER TABLE `anggaran_pendapatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `subkategori`
--
ALTER TABLE `subkategori`
  MODIFY `id_subkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`id_jurnal`) REFERENCES `jurnal` (`id_jurnal`);

--
-- Constraints for table `subkategori`
--
ALTER TABLE `subkategori`
  ADD CONSTRAINT `subkategori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_jurnal`) REFERENCES `jurnal` (`id_jurnal`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_subkategori`) REFERENCES `subkategori` (`id_subkategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
