-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 21, 2024 at 06:13 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_appmhs`
--

-- --------------------------------------------------------

CREATE TABLE `fakultas` (
  `FakultasID` int NOT NULL,
  `NamaFakultas` varchar(100) NOT NULL,
  `Deskripsi` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `fakultas` (`FakultasID`, `NamaFakultas`, `Deskripsi`) VALUES
(1, 'Fakultas Teknik', 'Fakultas Teknik dan Ilmu Komputer'),
(2, 'Fakultas Ilmu Sosial', 'Fakultas Ilmu Sosial dan Humaniora'),
(3, 'Fakultas Ekonomi', 'Fakultas Ekonomi dan Bisnis'),
(4, 'Fakultas Kedokteran', 'Fakultas Kedokteran dan Ilmu Kesehatan'),
(5, 'Fakultas Hukum', 'Fakultas Hukum dan Ilmu Politik');

CREATE TABLE `mahasiswa` (
  `MahasiswaID` int NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `TanggalLahir` date DEFAULT NULL,
  `JenisKelamin` varchar(10) DEFAULT NULL,
  `KontakDarurat` varchar(50) DEFAULT NULL,
  `ProgramStudiID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `mahasiswa` (`MahasiswaID`, `Nama`, `Alamat`, `TanggalLahir`, `JenisKelamin`, `KontakDarurat`, `ProgramStudiID`) VALUES
(1, 'Akhmad Antoni', 'Jalan desa', '2013-01-29', 'Laki-Laki', '1233', 1),
(2, 'Mahasiswa 2', 'Alamat 2', '1996-07-15', 'Perempuan', 'Kontak 2', 2),
(3, 'Mahasiswa 3', 'Alamat 3', '1997-03-20', 'Laki-Laki', 'Kontak 3', 1),
(4, 'Mahasiswa 4', 'Alamat 4', '1998-09-25', 'Perempuan', 'Kontak 4', 3),
(5, 'Mahasiswa 5', 'Alamat 5', '1999-01-30', 'Laki-Laki', 'Kontak 5', 2);

CREATE TABLE `matakuliah` (
  `MataKuliahID` int NOT NULL,
  `KodeMataKuliah` varchar(20) NOT NULL,
  `NamaMataKuliah` varchar(100) NOT NULL,
  `SKS` int NOT NULL,
  `FakultasID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `matakuliah` (`MataKuliahID`, `KodeMataKuliah`, `NamaMataKuliah`, `SKS`, `FakultasID`) VALUES
(1, 'MK101', 'Pemrograman Dasar', 2, 1),
(2, 'MK102', 'Komunikasi Bisnis', 2, 3),
(3, 'MK103', 'Anatomi Manusia', 4, 4),
(4, 'MK104', 'Hukum Kontrak', 3, 5),
(5, 'MK105', 'Algoritma dan Struktur Data', 4, 1),
(6, 'MK106', 'PBO', 2, 1),
(9, 'MK107', 'Matematika Diskrit', 2, 1),
(10, 'MK108', 'Zilong 1000k', 2, 2),
(11, 'MK109', 'ZILONG PUSH TURET', 1, 1);

CREATE TABLE `nilai` (
  `NilaiID` int NOT NULL,
  `MahasiswaID` int DEFAULT NULL,
  `MataKuliahID` int DEFAULT NULL,
  `Nilai` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `nilai` (`NilaiID`, `MahasiswaID`, `MataKuliahID`, `Nilai`) VALUES
(2, 2, 2, 'B+'),
(3, 3, 3, 'A-'),
(4, 4, 4, 'B'),
(5, 5, 5, 'A'),
(13, 1, 1, 'A'),
(40, 1, 11, 'A'),
(42, 5, 10, 'A');

CREATE TABLE `pengguna` (
  `UserID` int NOT NULL,
  `NamaPengguna` varchar(50) NOT NULL,
  `KataSandi` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Peran` varchar(20) NOT NULL,
  `MahasiswaID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pengguna` (`UserID`, `NamaPengguna`, `KataSandi`, `Email`, `Peran`, `MahasiswaID`) VALUES
(6, '12345', '827ccb0eea8a706c4c34a16891f84e7b', 'user1@email.com', 'Mahasiswa', 1),
(7, 'user2', 'password2', 'user2@email.com', 'Dosen', NULL),
(8, 'admin1', 'adminpass1', 'admin1@email.com', 'Admin', NULL),
(9, 'user3', 'password3', 'user3@email.com', 'Mahasiswa', 2),
(10, 'user4', 'password4', 'user4@email.com', 'Mahasiswa', 3);

CREATE TABLE `perubahandatamahasiswa` (
  `PerubahanID` int NOT NULL,
  `MahasiswaID` int DEFAULT NULL,
  `TanggalPerubahan` date DEFAULT NULL,
  `JenisPerubahan` varchar(50) DEFAULT NULL,
  `DetailPerubahan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `perubahandatamahasiswa` (`PerubahanID`, `MahasiswaID`, `TanggalPerubahan`, `JenisPerubahan`, `DetailPerubahan`) VALUES
(1, 1, '2023-03-15', 'Perubahan Alamat', 'Alamat diubah menjadi Alamat Baru 1'),
(2, 2, '2023-02-20', 'Perubahan Jurusan', 'Jurusan diubah menjadi Jurusan Baru 2'),
(3, 3, '2023-01-10', 'Perubahan Alamat', 'Alamat diubah menjadi Alamat Baru 3'),
(4, 4, '2023-04-05', 'Perubahan Jurusan', 'Jurusan diubah menjadi Jurusan Baru 4'),
(5, 5, '2023-05-25', 'Perubahan Alamat', 'Alamat diubah menjadi Alamat Baru 5');

CREATE TABLE `programstudi` (
  `ProgramStudiID` int NOT NULL,
  `NamaProgram` varchar(100) NOT NULL,
  `FakultasID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `programstudi` (`ProgramStudiID`, `NamaProgram`, `FakultasID`) VALUES
(1, 'Teknik Informatika', 1),
(2, 'Ilmu Komunikasi', 2),
(3, 'Manajemen Bisnis', 3),
(4, 'Kedokteran Umum', 4),
(5, 'Hukum', 5);

CREATE TABLE `riwayatregistrasi` (
  `RegistrasiID` int NOT NULL,
  `MahasiswaID` int DEFAULT NULL,
  `TahunAjaran` int DEFAULT NULL,
  `Semester` varchar(20) DEFAULT NULL,
  `MataKuliahID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `riwayatregistrasi` (`RegistrasiID`, `MahasiswaID`, `TahunAjaran`, `Semester`, `MataKuliahID`) VALUES
(1, 1, 2022, 'Ganjil', 101),
(2, 2, 2022, 'Ganjil', 102),
(3, 3, 2022, 'Ganjil', 103),
(4, 4, 2022, 'Ganjil', 104),
(5, 5, 2022, 'Ganjil', 105);

ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`FakultasID`);

ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`MahasiswaID`),
  ADD KEY `ProgramStudiID` (`ProgramStudiID`);

ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`MataKuliahID`),
  ADD KEY `FakultasID` (`FakultasID`);

ALTER TABLE `nilai`
  ADD PRIMARY KEY (`NilaiID`),
  ADD UNIQUE KEY `MataKuliahID` (`MataKuliahID`),
  ADD KEY `MahasiswaID` (`MahasiswaID`);

ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `MahasiswaID` (`MahasiswaID`);

ALTER TABLE `perubahandatamahasiswa`
  ADD PRIMARY KEY (`PerubahanID`),
  ADD KEY `MahasiswaID` (`MahasiswaID`);

ALTER TABLE `programstudi`
  ADD PRIMARY KEY (`ProgramStudiID`),
  ADD KEY `FakultasID` (`FakultasID`);

ALTER TABLE `riwayatregistrasi`
  ADD PRIMARY KEY (`RegistrasiID`),
  ADD KEY `MahasiswaID` (`MahasiswaID`);

ALTER TABLE `fakultas`
  MODIFY `FakultasID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `mahasiswa`
  MODIFY `MahasiswaID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `matakuliah`
  MODIFY `MataKuliahID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `nilai`
  MODIFY `NilaiID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

ALTER TABLE `pengguna`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `perubahandatamahasiswa`
  MODIFY `PerubahanID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `programstudi`
  MODIFY `ProgramStudiID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `riwayatregistrasi`
  MODIFY `RegistrasiID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`ProgramStudiID`) REFERENCES `programstudi` (`ProgramStudiID`);

ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`FakultasID`) REFERENCES `fakultas` (`FakultasID`);

ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`MahasiswaID`) REFERENCES `mahasiswa` (`MahasiswaID`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`MataKuliahID`) REFERENCES `matakuliah` (`MataKuliahID`);

ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`MahasiswaID`) REFERENCES `mahasiswa` (`MahasiswaID`);

ALTER TABLE `perubahandatamahasiswa`
  ADD CONSTRAINT `perubahandatamahasiswa_ibfk_1` FOREIGN KEY (`MahasiswaID`) REFERENCES `mahasiswa` (`MahasiswaID`);

ALTER TABLE `programstudi`
  ADD CONSTRAINT `programstudi_ibfk_1` FOREIGN KEY (`FakultasID`) REFERENCES `fakultas` (`FakultasID`);

ALTER TABLE `riwayatregistrasi`
  ADD CONSTRAINT `riwayatregistrasi_ibfk_1` FOREIGN KEY (`MahasiswaID`) REFERENCES `mahasiswa` (`MahasiswaID`);
COMMIT;