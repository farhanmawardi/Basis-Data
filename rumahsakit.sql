-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2025 at 04:07 AM
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
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id_admin` varchar(20) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `waktu_jaga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daftar`
--

CREATE TABLE `daftar` (
  `id_daftar` varchar(20) NOT NULL,
  `id_admin` varchar(20) DEFAULT NULL,
  `id_pasien` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(20) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `spesialis` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat_dokter` text DEFAULT NULL,
  `waktu_kerja` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokter_admin`
--

CREATE TABLE `dokter_admin` (
  `id_data` varchar(20) NOT NULL,
  `id_dokter` varchar(20) DEFAULT NULL,
  `id_admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(20) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `alamat_pasien` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `alamat_pasien`) VALUES
('P001', 'Andi Wijaya', 'L', 'Jl. Cempaka No. 5'),
('P002', 'Rina Wati', 'P', 'Jl. Melati No. 8'),
('P003', 'Dedi Kusuma', 'L', 'Jl. Anggrek No. 12'),
('P004', 'Putri Indah', 'P', 'Jl. Mawar No. 2');

-- --------------------------------------------------------

--
-- Table structure for table `pasien_dokter`
--

CREATE TABLE `pasien_dokter` (
  `id` varchar(20) NOT NULL,
  `id_pasien` varchar(20) DEFAULT NULL,
  `id_dokter` varchar(20) DEFAULT NULL,
  `waktu_periksa` date DEFAULT NULL,
  `resep` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `daftar`
--
ALTER TABLE `daftar`
  ADD PRIMARY KEY (`id_daftar`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `dokter_admin`
--
ALTER TABLE `dokter_admin`
  ADD PRIMARY KEY (`id_data`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `pasien_dokter`
--
ALTER TABLE `pasien_dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `daftar` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daftar`
--
ALTER TABLE `daftar`
  ADD CONSTRAINT `daftar_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dokter_admin`
--
ALTER TABLE `dokter_admin`
  ADD CONSTRAINT `dokter_admin_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dokter_admin_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasien_dokter`
--
ALTER TABLE `pasien_dokter`
  ADD CONSTRAINT `pasien_dokter_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_dokter_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
