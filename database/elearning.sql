-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: 11 Agu 2020 pada 09.56
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_admin`
--

CREATE TABLE `m_admin` (
  `id` int(6) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('admin','guru','siswa') NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `kon_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_admin`
--

INSERT INTO `m_admin` (`id`, `username`, `password`, `level`, `email`, `pass`, `kon_id`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'putradiki530@gmail.com', 'ccc', 0),
(3, 'guru2', '21232f297a57a5a743894a0e4a801fc3', 'guru', NULL, NULL, 2),
(5, 'guru5', '21232f297a57a5a743894a0e4a801fc3', 'guru', NULL, NULL, 5),
(8, 'siswa3', '21232f297a57a5a743894a0e4a801fc3', 'siswa', NULL, NULL, 3),
(10, 'siswa5', '21232f297a57a5a743894a0e4a801fc3', 'siswa', NULL, NULL, 5),
(11, 'siswa6', '21232f297a57a5a743894a0e4a801fc3', 'siswa', NULL, NULL, 6),
(13, 'siswa8', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 8),
(15, 'guru6', '202cb962ac59075b964b07152d234b70', 'guru', NULL, NULL, 6),
(16, '', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 22),
(17, '', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 22),
(18, '', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 21),
(19, 'siswa', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 20),
(20, 'siswa', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 22),
(21, 'siswa', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 22),
(22, 'siswa', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 22),
(23, 'siswa22', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 22),
(24, '22', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 22),
(25, '23', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 23),
(26, '23', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 23),
(27, '2811', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 23),
(28, '12344', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 24),
(29, '12344', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 25),
(30, '12343', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 26),
(31, '1', '2', 'siswa', NULL, NULL, 21),
(32, '1', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 27),
(33, '1', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 27),
(34, '1', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 27),
(35, '2811', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 28),
(36, '2811', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 28),
(37, '2811', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 28),
(38, '2811', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 28),
(39, '2811', '202cb962ac59075b964b07152d234b70', 'siswa', NULL, NULL, 28),
(40, '1123', '202cb962ac59075b964b07152d234b70', 'guru', NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_guru`
--

CREATE TABLE `m_guru` (
  `id` int(6) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_guru`
--

INSERT INTO `m_guru` (`id`, `nama`, `nip`, `email`) VALUES
(2, 'Ir. Joko Widodo ok', '123', '123@gmail.com'),
(5, 'rahim sterling', '1234', 'rs@gmail.com'),
(6, 'marcus rashford', '1233', 'mr@gmail.com'),
(7, 'prabo waw', '1123', '1123@gmail.com'),
(8, 'robert lewandowski', '1223', 'saputradicky700@gmail.com');

--
-- Trigger `m_guru`
--
DELIMITER $$
CREATE TRIGGER `hapus_guru` AFTER DELETE ON `m_guru` FOR EACH ROW BEGIN
DELETE FROM m_admin WHERE m_admin.level = 'guru' AND m_admin.kon_id = OLD.id;
DELETE FROM m_soal WHERE m_soal.id_guru = OLD.id;
DELETE FROM tr_guru_mapel WHERE tr_guru_mapel.id_guru = OLD.id;
DELETE FROM tr_guru_tes WHERE tr_guru_tes.id_guru = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_mapel`
--

CREATE TABLE `m_mapel` (
  `id` int(6) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_mapel`
--

INSERT INTO `m_mapel` (`id`, `nama`) VALUES
(1, 'Bahasa Indonesia  (9A)'),
(3, 'Matematika  (9B)'),
(4, 'IPA  (9A)'),
(5, 'MTk ok');

--
-- Trigger `m_mapel`
--
DELIMITER $$
CREATE TRIGGER `hapus_mapel` AFTER DELETE ON `m_mapel` FOR EACH ROW BEGIN
DELETE FROM m_soal WHERE m_soal.id_mapel = OLD.id;
DELETE FROM tr_guru_mapel WHERE tr_guru_mapel.id_mapel = OLD.id;
DELETE FROM tr_guru_tes WHERE tr_guru_tes.id_mapel = OLD.id;
DELETE FROM tr_siswa_mapel WHERE tr_siswa_mapel.id_mapel = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_materi`
--

CREATE TABLE `m_materi` (
  `id` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_materi`
--

INSERT INTO `m_materi` (`id`, `id_guru`, `id_mapel`, `nama`, `file`) VALUES
(1, 2, 1, 'materi jo', 'Screenshot_(1).png'),
(2, 5, 3, 'ss', 'exports.xlsx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_siswa`
--

CREATE TABLE `m_siswa` (
  `id` int(6) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nis` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_siswa`
--

INSERT INTO `m_siswa` (`id`, `nama`, `nis`, `kelas`, `email`) VALUES
(3, 'Puan Maharani', '11090673', '8 a', 'puan@gmail.com'),
(5, 'Anisa Pohan', '12090675', 'Teknik Informatika', ''),
(24, 'diki', '12344', 'Sistem Informasi', 'saputradicky705@gmail.com'),
(25, 'rendi22', '12344', '8 a', '4scardstd@gmail.com'),
(26, 'diki', '12343', '8 a', 'saputradicky705@gmail.com'),
(27, 'rendi', '1', 'Sistem Informasi', 'saputradicky705@gmail.com'),
(28, 'diki', '2811', '8 a', 'saputradicky705@gmail.com'),
(29, 'wadadididaw', '555', '6b', 'dickyosprint@gmail.com');

--
-- Trigger `m_siswa`
--
DELIMITER $$
CREATE TRIGGER `hapus_siswa` AFTER DELETE ON `m_siswa` FOR EACH ROW BEGIN
DELETE FROM tr_ikut_ujian WHERE tr_ikut_ujian.id_user = OLD.id;
DELETE FROM tr_siswa_mapel WHERE tr_siswa_mapel.id_siswa = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_soal`
--

CREATE TABLE `m_soal` (
  `id` int(6) NOT NULL,
  `id_guru` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL,
  `bobot` int(2) NOT NULL,
  `gambar` varchar(150) NOT NULL,
  `soal` longtext NOT NULL,
  `opsi_a` longtext NOT NULL,
  `opsi_b` longtext NOT NULL,
  `opsi_c` longtext NOT NULL,
  `opsi_d` longtext NOT NULL,
  `opsi_e` longtext NOT NULL,
  `jawaban` varchar(5) NOT NULL,
  `tgl_input` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_soal`
--

INSERT INTO `m_soal` (`id`, `id_guru`, `id_mapel`, `bobot`, `gambar`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `jawaban`, `tgl_input`) VALUES
(11, 5, 3, 1, '', '2+3 = ...', '1', '2', '3', '4', '5', 'E', '2015-08-27 18:28:12'),
(12, 5, 3, 1, '', '1, 3, ..., ...., 9, 11', '4, 5', '4, 6', '5, 7', '6, 7', '1, 5', 'C', '2015-08-27 18:29:06'),
(13, 5, 3, 1, '', '(2 + 3) * 4 = ....', '20', '21', '22', '23', '24', 'A', '2015-08-27 18:29:34'),
(14, 5, 3, 1, '', '(90 / 10 ) - 5 = ...', '1', '2', '3', '4', '5', 'D', '2015-08-27 18:30:03'),
(15, 5, 3, 1, '', 'Akar dari 81 adalah ...', '7', '8', '9', '10', '11', 'C', '2015-08-27 18:30:27'),
(23, 2, 1, 5, 'Screenshot_(3).png', 'siapakah?', 'a', 'd', 'fr', 'd', 'fs', 'B', '2020-07-30 09:39:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_guru_mapel`
--

CREATE TABLE `tr_guru_mapel` (
  `id` int(6) NOT NULL,
  `id_guru` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_guru_mapel`
--

INSERT INTO `tr_guru_mapel` (`id`, `id_guru`, `id_mapel`) VALUES
(4, 5, 3),
(6, 5, 1),
(8, 5, 4),
(9, 6, 5),
(10, 2, 1),
(11, 2, 3),
(12, 2, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_guru_tes`
--

CREATE TABLE `tr_guru_tes` (
  `id` int(6) NOT NULL,
  `id_guru` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jumlah_soal` int(6) NOT NULL,
  `waktu` int(6) NOT NULL,
  `jenis` enum('acak','set') NOT NULL,
  `detil_jenis` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_guru_tes`
--

INSERT INTO `tr_guru_tes` (`id`, `id_guru`, `id_mapel`, `nama_ujian`, `jumlah_soal`, `waktu`, `jenis`, `detil_jenis`) VALUES
(4, 2, 1, 'asas', 2, 1, 'acak', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_ikut_ujian`
--

CREATE TABLE `tr_ikut_ujian` (
  `id` int(6) NOT NULL,
  `id_tes` int(6) NOT NULL,
  `id_user` int(6) NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(6) NOT NULL,
  `nilai` int(6) NOT NULL,
  `nilai_bobot` int(6) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_ikut_ujian`
--

INSERT INTO `tr_ikut_ujian` (`id`, `id_tes`, `id_user`, `list_soal`, `list_jawaban`, `jml_benar`, `nilai`, `nilai_bobot`, `tgl_mulai`, `tgl_selesai`, `status`) VALUES
(2, 4, 3, '24,23', '24:B,23:B', 2, 100, 8, '2020-07-30 10:20:49', '2020-07-30 10:21:49', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tr_siswa_mapel`
--

CREATE TABLE `tr_siswa_mapel` (
  `id` int(6) NOT NULL,
  `id_siswa` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tr_siswa_mapel`
--

INSERT INTO `tr_siswa_mapel` (`id`, `id_siswa`, `id_mapel`) VALUES
(5, 3, 3),
(8, 5, 3),
(9, 5, 4),
(10, 3, 1),
(11, 3, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_admin`
--
ALTER TABLE `m_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_guru`
--
ALTER TABLE `m_guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_mapel`
--
ALTER TABLE `m_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_materi`
--
ALTER TABLE `m_materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_siswa`
--
ALTER TABLE `m_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_soal`
--
ALTER TABLE `m_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_guru_mapel`
--
ALTER TABLE `tr_guru_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_guru_tes`
--
ALTER TABLE `tr_guru_tes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_ikut_ujian`
--
ALTER TABLE `tr_ikut_ujian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_siswa_mapel`
--
ALTER TABLE `tr_siswa_mapel`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_admin`
--
ALTER TABLE `m_admin`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `m_guru`
--
ALTER TABLE `m_guru`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `m_mapel`
--
ALTER TABLE `m_mapel`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `m_materi`
--
ALTER TABLE `m_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_siswa`
--
ALTER TABLE `m_siswa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `m_soal`
--
ALTER TABLE `m_soal`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tr_guru_mapel`
--
ALTER TABLE `tr_guru_mapel`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tr_guru_tes`
--
ALTER TABLE `tr_guru_tes`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tr_ikut_ujian`
--
ALTER TABLE `tr_ikut_ujian`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tr_siswa_mapel`
--
ALTER TABLE `tr_siswa_mapel`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
