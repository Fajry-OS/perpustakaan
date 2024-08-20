-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2024 at 08:27 AM
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
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nisn` varchar(16) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan','','') NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `nisn`, `nama_lengkap`, `jenis_kelamin`, `no_telp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'weqwe', 'user', 'Laki-laki', 'sadad', 'dqwda', '2024-08-06 07:09:36', '2024-08-06 07:09:36'),
(3, '121464', 'Adit', 'Laki-laki', '081542', 'Tambun Bekasi', '2024-08-16 11:18:57', '2024-08-16 11:18:57'),
(4, '7646789', 'Sadira', 'Perempuan', '03457', 'Mampang Jakarta Selatan', '2024-08-16 11:19:36', '2024-08-16 11:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `jumlah` varchar(11) NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `tahun_terbit` varchar(5) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `id_kategori`, `judul`, `jumlah`, `penerbit`, `tahun_terbit`, `penulis`, `created_at`, `updated_at`) VALUES
(5, 5, 'WEB PROGRAMMING1', '33', 'asdasd1', '312', 'asdasdea2', '2024-08-06 04:09:01', '2024-08-06 04:09:14'),
(7, 4, 'Elden Ring', '2', 'Au Siapa', '2020', 'dadasadq', '2024-08-07 08:00:03', '2024-08-07 08:00:03'),
(8, 3, 'clann', '33', 'TOHA', '2022', 'asdasdea', '2024-08-07 08:00:21', '2024-08-07 08:01:08'),
(9, 3, 'clann2', '212', 'TOHA', '2020', 'FADIL', '2024-08-07 08:00:39', '2024-08-07 08:00:39');

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id`, `id_peminjaman`, `id_buku`, `id_kategori`) VALUES
(13, 15, 5, 5),
(14, 15, 4, 7),
(15, 16, 4, 7),
(16, 16, 3, 9),
(17, 17, 5, 5),
(18, 17, 3, 9),
(19, 18, 4, 7),
(20, 19, 7, 4),
(21, 19, 8, 3),
(22, 20, 8, 3),
(23, 20, 5, 5),
(24, 21, 5, 5),
(25, 21, 7, 4),
(26, 22, 7, 4),
(27, 22, 5, 5),
(28, 23, 5, 5),
(29, 24, 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengembalian`
--

CREATE TABLE `detail_pengembalian` (
  `id` int(11) NOT NULL,
  `id_pengembalian` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`) VALUES
(3, 'Romance', 'Mengenai kisah drama percintaan', '2024-08-06 02:24:23', '2024-08-06 02:24:23'),
(4, 'Fantasy', 'Salah satu genre sastra yang menonjolkan unsur magis dan supranatural yang tidak ada di dunia nyata ', '2024-08-06 02:26:23', '2024-08-06 02:26:23'),
(5, 'Comedy', 'Karya yang lucu dan pada umumnya bertujuan untuk menghibur dan menimbulkan tawa ', '2024-08-06 02:28:23', '2024-08-06 02:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `keterangan`, `created_at`, `updated_at`) VALUES
(5, 'Administrator', '', '2024-08-06 01:21:02', '2024-08-06 01:21:02'),
(6, 'Admin', '', '2024-08-06 01:21:02', '2024-08-06 01:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `kode_transaksi` varchar(30) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` tinyint(1) NOT NULL DEFAULT 0,
  `id_anggota` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `kode_transaksi`, `tgl_pinjam`, `tgl_kembali`, `status`, `created_at`, `updated_at`, `deleted_at`, `id_anggota`, `id_user`) VALUES
(15, 'P313082024001', '2024-08-14', '2024-08-15', 1, '2024-08-13 03:15:42', '2024-08-13 07:47:58', 1, 1, 2),
(16, 'P313082024016', '2024-08-14', '2024-08-14', 1, '2024-08-13 03:51:07', '2024-08-16 11:20:23', 1, 1, 2),
(17, 'P313082024017', '2024-08-12', '2024-08-14', 1, '2024-08-13 04:20:39', '2024-08-16 11:20:21', 1, 1, 2),
(18, 'P313082024018', '2024-08-14', '2024-08-15', 1, '2024-08-13 04:23:08', '2024-08-19 06:15:42', 1, 1, 2),
(19, 'P313082024019', '2024-08-14', '2024-08-15', 2, '2024-08-13 04:29:35', '2024-08-19 06:16:05', 0, 1, 2),
(20, 'P316082024020', '2024-08-16', '2024-08-20', 2, '2024-08-16 11:20:11', '2024-08-19 06:16:14', 0, 4, 2),
(21, 'P316082024021', '2024-08-16', '2024-08-21', 2, '2024-08-16 11:20:45', '2024-08-19 06:16:29', 0, 3, 2),
(22, 'P320082024022', '2024-08-20', '2024-08-25', 2, '2024-08-20 01:08:16', '2024-08-20 01:09:32', 0, 3, 2),
(23, 'P320082024023', '2024-08-14', '2024-08-21', 2, '2024-08-20 02:21:46', '2024-08-20 02:22:08', 0, 4, 2),
(24, 'P320082024024', '2024-08-14', '2024-08-20', 2, '2024-08-20 03:24:23', '2024-08-20 03:24:45', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `kode_pengembalian` varchar(30) NOT NULL,
  `denda` int(11) NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `terlambat` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `id_peminjaman`, `kode_pengembalian`, `denda`, `tgl_pengembalian`, `terlambat`, `created_at`, `updated_at`) VALUES
(18, 19, 'PGAM19082024001', 500000, '2024-08-20', 5, '2024-08-19 06:16:05', '2024-08-19 06:16:05'),
(19, 20, 'PGAM19082024019', -100000, '2024-08-19', 0, '2024-08-19 06:16:14', '2024-08-19 06:16:14'),
(20, 21, 'PGAM19082024020', -100000, '2024-08-20', 0, '2024-08-19 06:16:29', '2024-08-19 06:16:29'),
(21, 22, 'PGAM20082024021', 300000, '2024-08-28', 3, '2024-08-20 01:09:32', '2024-08-20 01:09:32'),
(22, 23, 'PGAM20082024022', -100000, '2024-08-20', 0, '2024-08-20 02:22:08', '2024-08-20 02:22:08'),
(23, 24, 'PGAM20082024023', -100000, '2024-08-19', 0, '2024-08-20 03:24:45', '2024-08-20 03:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama_lengkap`, `email`, `password`, `created_at`, `deleted_at`) VALUES
(2, 5, 'Fajry Octodira', 'fajry@gmail.com ', '7c222fb2927d828af22f592134e8932480637c0d', '2024-07-29 02:16:37', '2024-08-06 01:22:42'),
(3, 5, 'admin', 'administrator@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2024-07-31 02:27:03', '2024-08-06 03:01:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pengembalian`
--
ALTER TABLE `detail_pengembalian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `detail_pengembalian`
--
ALTER TABLE `detail_pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
