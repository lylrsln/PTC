-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Des 2024 pada 18.05
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjadwalan2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `dosen_id` int(11) NOT NULL,
  `nama_dosen` varchar(255) NOT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`dosen_id`, `nama_dosen`, `nip`) VALUES
(1, 'PUTRI AYU MAHARANI, S.T., M.Sc.       ', '19940611 202203 2 02'),
(2, 'NAILI SURI INTIZHAMI, S.Kom., M.Kom.', '19950308 202203 2 01'),
(3, 'EKA QADRI NURANTI B., S.Kom., M.Kom.', '19950208 202203 2 01'),
(4, 'MARDHIYYAH RAFRIN, S.T., M.Sc.  ', '19900921 202203 2 01'),
(5, 'MUH. AGUS, S.Kom., M.Kom.  ', '19950821 202203 1 01'),
(6, 'NUR RAHMI, S.Pd., M.Si.  ', '19921006 202203 2 01'),
(7, 'WAHYUNI EKASASMITA, S.Pd., M.Sc.', '19910413 202203 2 01'),
(8, 'AHMAD FAJRI S., S.Si., M.Si.  ', '19950508 202203 1 00'),
(9, 'MIFTAHULKHAIRAH, M.Sc.     ', '19880922 202203 2 00'),
(10, 'NURUL FUADY ADHALIA H, S.Pd., M.Si.     ', '19901210 202203 2 00'),
(13, 'MAR\'ATUTTAHIRAH, S.Pd., M.T.   ', '19940701 202203 2 01'),
(15, 'ROSMIATI, S.Kom., M.Kom. ', '19900328 202203 2 00'),
(16, 'KHAERA TUNNISA, S.Tr.Kom., M.Kom.', '19960506 202203 2 02'),
(17, 'RAKHMADI RAHMAN, M.Kom. ', '19900316 202203 1 00'),
(18, 'AHMAD HUSAIN, S.SI., M.STAT.', '199510192024061001'),
(19, 'MUHAMMAD IKHWAN BURHAN, S.KOM., M.KOM.', '199512292024061002'),
(20, 'NURUL FEBRIANI PUTRI, M.SI.', '199302012024062001'),
(23, 'MUNADRAH, S.T., M.T.', '199507222024062001'),
(24, 'MUHAIMIN HADING, S.T., M.ENG.', '199011282024062002'),
(25, 'ERFIN KURNIAWAN, S.P., M.SI.', '199502042024061003 '),
(26, 'ROZALINA AMRAN, S.T., M.ENG.', '199102242024062001'),
(27, 'SYAHRUL SATAR, S.T.,M.T.', '199802042024061001'),
(28, 'ANAS, S.KOM., M.KOM.', '198904182024061003'),
(29, 'MUHAMMAD ULIAH SHAFAR, S.ARS., M.ARS.', '199606262024061001'),
(30, 'FITRIAGUSTIANI, S.SI, M.SI.', '199108202024062001'),
(31, 'MUH. CHAERIL IKRAMULLAH, S.PD., M.BIOTECH.', '199508282024061002'),
(32, 'PASMAWATI, S.SI., M.SI.', '199311102024062002'),
(33, 'ANDRI DWI UTOMO, S.KOM., M.T.', '199205032024061001'),
(34, 'ANDI TAUFIQURRAHMAN AKBAR, M.KOM.', '199804102024061001'),
(35, 'MUHAMMAD RUSDIN JUMURDIN, S.ARS., M.ARS', '199312192024061001'),
(36, 'ANDI NURFADILLAH ALI, S.TR.KOM., M.KOM.', '199709202024062002'),
(37, 'RADHIANSYAH, M.T.', '199606062024061002'),
(38, 'MUZAKKIR, S.E., M.SI.', '199312162024061001'),
(39, 'NI\'MAH NATSIR, S.T., M.ARS.', '199410152024062003'),
(40, 'MUH ZULFADLI A SUYUTI, S.T., M.KOM.', '199606302024061002'),
(41, 'HUSNUL HATIMAH, M.T.P.', '199608222024062003'),
(42, 'YUSRI PRAYITNA, S.SI., M.T.', '199012062024061001'),
(43, 'NURUL CHAIRUNNISA NOOR, S.T., M.T.', '199511302024062003'),
(44, 'MUHAMMAD SYAFAAT, S.KOM., M.KOM.', '199502042024061001'),
(45, 'FITRI HANDAYANI, M.SI.', '199412072024062001'),
(46, 'SYUKRIKA PUTRI, M.T.', '199601182024062001'),
(47, 'A. INAYAH AULIYAH, M.KOM.', '199707172024062001'),
(48, 'A. SYAHRINALDY SYAHRUDDIN, M.T.', '199201012024061002'),
(49, 'AHMAD TAMSIL YUNUS, M.T.', '199203102024061001'),
(50, 'NUR AZISAH SYAM, S.ST., M.SI.', '199305022024062003'),
(51, 'PRIHATIN, S.P., M.SI.', '19930903202406100'),
(52, 'RISMAN FIRMAN, M.T', '199307102024061004'),
(53, 'RIZKI ARISTYARINI, M.SI.', '199312072024062002'),
(54, 'YANNY FEBRY FITRIANI SOFYAN, S.T., M.T.', '199503072024062002'),
(55, 'FITRAWATY ORISTA EVAR, S.P., M.SI.', '199403122024062002'),
(56, 'ARDI MANGGALA PUTRA, S.TP., M.SI.', '199205142024061004'),
(57, 'IKA RESKIANA ADRIANI, M.SI.', '199410242024062002'),
(58, 'JEFFRY, S.KOM., M.T.', '199211212024061002'),
(59, 'WAKHID YUNENDAR, S.PD., M.PD.', '199201142024061001'),
(60, 'MUHAMMAD IRSAN, S.T., M.T.', '198501212010121003'),
(61, 'DR. ANWAR, S.E., M.AK., AKT.', '197001042005021004'),
(62, 'DR. Ir. ABDULLAH B., M.M.', '19661231 199703 1 03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen_mk`
--

CREATE TABLE `dosen_mk` (
  `dosen_mk_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `prodi_id` int(11) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `tahun_akademik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen_mk`
--

INSERT INTO `dosen_mk` (`dosen_mk_id`, `dosen_id`, `matkul_id`, `prodi_id`, `jurusan`, `tahun_akademik_id`) VALUES
(1, 2, 2, 2, 'Sains\r\n', 1),
(2, 3, 6, 2, 'Sains\r\n', 1),
(3, 1, 1, 1, 'Teknologi Produksi dan Industri', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `nama_ruangan` varchar(100) DEFAULT NULL,
  `nama_matkul` varchar(100) DEFAULT NULL,
  `nama_dosen` varchar(100) DEFAULT NULL,
  `nama_kelas` varchar(100) DEFAULT NULL,
  `tahun_akademik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `hari`, `jam_mulai`, `jam_selesai`, `nama_ruangan`, `nama_matkul`, `nama_dosen`, `nama_kelas`, `tahun_akademik_id`) VALUES
(1, 'Rabu', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Mobile', NULL),
(2, 'Kamis', '16:40:00', '18:10:00', 'R. MAKKAWARU 102', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 B', NULL),
(3, 'Rabu', '07:30:00', '09:00:00', 'R. MALEBBI 202', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(4, 'Senin', '07:30:00', '09:00:00', 'R. MAMASE 206', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 B', NULL),
(5, 'Senin', '13:30:00', '15:00:00', 'R. MALEBBI 202', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(6, 'Selasa', '15:05:00', '16:35:00', 'R. MARESO 103 ', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Mobile', NULL),
(7, 'Selasa', '10:40:00', '12:10:00', 'Ruang Kelas 205', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Mobile', NULL),
(8, 'Kamis', '07:30:00', '09:00:00', 'Ruang Kelas 205', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Visi Komputer', NULL),
(9, 'Jumat', '15:05:00', '16:35:00', 'R. MAMASE 206', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(10, 'Rabu', '15:05:00', '16:35:00', 'Ruang Kelas 205', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Mobile', NULL),
(11, 'Selasa', '13:30:00', '15:00:00', 'R. MAMASE 206', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(12, 'Kamis', '10:40:00', '12:10:00', 'R. MALEBBI 202', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 A', NULL),
(13, 'Selasa', '10:40:00', '12:10:00', 'R. MAKKAWARU 102', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 B', NULL),
(14, 'Rabu', '10:40:00', '12:10:00', 'R. MARESO 103 ', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 A', NULL),
(15, 'Jumat', '16:40:00', '18:10:00', 'R. MALEBBI 202', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Visi Komputer', NULL),
(16, 'Rabu', '10:40:00', '12:10:00', 'R. MAMASE 206', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Visi Komputer', NULL),
(17, 'Selasa', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 B', NULL),
(18, 'Senin', '07:30:00', '09:00:00', 'R. MAKKAWARU 102', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(19, 'Kamis', '16:40:00', '18:10:00', 'R. MAKKAWARU 102', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(20, 'Rabu', '16:40:00', '18:10:00', 'R. MALEBBI 202', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Mobile', NULL),
(21, 'Rabu', '16:40:00', '18:10:00', 'Ruang Kelas 205', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Visi Komputer', NULL),
(22, 'Kamis', '13:30:00', '15:00:00', 'R. MACCA 101', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(23, 'Rabu', '13:30:00', '15:00:00', 'Ruang Kelas 205', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(24, 'Senin', '09:05:00', '10:35:00', 'R. MARESO 103 ', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(25, 'Jumat', '15:05:00', '16:35:00', 'R. MALEBBI 202', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 A', NULL),
(26, 'Rabu', '09:05:00', '10:35:00', 'Ruang Kelas 205', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Mobile', NULL),
(27, 'Jumat', '07:30:00', '09:00:00', 'R. MARESO 103 ', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Visi Komputer', NULL),
(28, 'Kamis', '13:30:00', '15:00:00', 'R. MACCA 101', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Mobile', NULL),
(29, 'Senin', '09:05:00', '10:35:00', 'R. MAMASE 206', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 A', NULL),
(30, 'Senin', '15:05:00', '16:35:00', 'R. MAKKAWARU 102', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Visi Komputer', NULL),
(31, 'Jumat', '15:05:00', '16:35:00', 'Ruang Kelas 205', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(32, 'Jumat', '13:30:00', '15:00:00', 'R. MACCA 101', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 B', NULL),
(33, 'Rabu', '13:30:00', '15:00:00', 'R. MAKKAWARU 102', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(34, 'Kamis', '15:05:00', '16:35:00', 'R. MAKKAWARU 102', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 B', NULL),
(35, 'Selasa', '10:40:00', '12:10:00', 'R. MARESO 103 ', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(36, 'Senin', '07:30:00', '09:00:00', 'R. MAKKAWARU 102', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 A', NULL),
(37, 'Kamis', '07:30:00', '09:00:00', 'Ruang Kelas 205', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 B', NULL),
(38, 'Jumat', '13:30:00', '15:00:00', 'R. MAGETTENG 104 ', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Mobile', NULL),
(39, 'Kamis', '10:40:00', '12:10:00', 'R. MAGETTENG 104 ', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(40, 'Selasa', '16:40:00', '18:10:00', 'R. MALEBBI 202', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Mobile', NULL),
(41, 'Selasa', '09:05:00', '10:35:00', 'R. MAKKAWARU 102', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Mobile', NULL),
(42, 'Rabu', '09:05:00', '10:35:00', 'R. MALEBBI 202', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-AR/VR', NULL),
(43, 'Jumat', '10:40:00', '12:10:00', 'Ruang Kelas 205', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(44, 'Rabu', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 B', NULL),
(45, 'Selasa', '09:05:00', '10:35:00', 'Ruang Kelas 205', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 B', NULL),
(46, 'Senin', '16:40:00', '18:10:00', 'R. MATEPPE 203', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-AR/VR', NULL),
(47, 'Selasa', '07:30:00', '09:00:00', 'R. MAKKAWARU 102', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 B', NULL),
(48, 'Senin', '13:30:00', '15:00:00', 'R. MAMASE 206', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Visi Komputer', NULL),
(49, 'Rabu', '09:05:00', '10:35:00', 'R. MAMASE 206', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 B', NULL),
(50, 'Jumat', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Visi Komputer', NULL),
(51, 'Senin', '07:30:00', '09:00:00', 'R. MATEPPE 203', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Mobile', NULL),
(52, 'Kamis', '13:30:00', '15:00:00', 'Ruang Kelas 205', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(53, 'Rabu', '09:05:00', '10:35:00', 'R. MAKKAWARU 102', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Visi Komputer', NULL),
(54, 'Senin', '16:40:00', '18:10:00', 'R. MAGETTENG 104 ', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(55, 'Selasa', '07:30:00', '09:00:00', 'R. MAMASE 206', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 B', NULL),
(56, 'Rabu', '13:30:00', '15:00:00', 'Ruang Kelas 205', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22 A', NULL),
(57, 'Jumat', '13:30:00', '15:00:00', 'R. MALEBBI 202', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-Visi Komputer', NULL),
(58, 'Rabu', '09:05:00', '10:35:00', 'R. MAGETTENG 104 ', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Mobile', NULL),
(59, 'Selasa', '09:05:00', '10:35:00', 'R. MACCA 101', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22 A', NULL),
(60, 'Selasa', '13:30:00', '15:00:00', 'R. MACCA 101', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(61, 'Senin', '13:30:00', '15:00:00', 'R. MAMASE 206', 'Basis Data', 'Dr. Budi Prasetyo', 'Ilmu Komputer 22-AR/VR', NULL),
(62, 'Rabu', '15:05:00', '16:35:00', 'R. MAMASE 206', 'Pemrograman Dasar', 'Dr. Andi Setiawann', 'Ilmu Komputer 22-Mobile', NULL),
(63, 'Selasa', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(64, 'Selasa', '13:30:00', '15:00:00', 'R. MAKKAWARU 102', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(65, 'Jumat', '13:30:00', '15:00:00', 'R. MATEPPE 203', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22 A', NULL),
(66, 'Jumat', '10:40:00', '12:10:00', 'R. MATEPPE 203', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-AR/VR', NULL),
(67, 'Jumat', '10:40:00', '12:10:00', 'R. MARESO 103 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(68, 'Senin', '09:05:00', '10:35:00', 'Ruang Kelas 205', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(69, 'Rabu', '13:30:00', '15:00:00', 'Ruang Kelas 205', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22 A', NULL),
(70, 'Kamis', '16:40:00', '18:10:00', 'R. MATEPPE 203', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(71, 'Jumat', '16:40:00', '18:10:00', 'R. MAGETTENG 104 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(72, 'Kamis', '16:40:00', '18:10:00', 'R. MAGETTENG 104 ', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(73, 'Kamis', '10:40:00', '12:10:00', 'R. MALEBBI 202', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(74, 'Rabu', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(75, 'Kamis', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(76, 'Senin', '09:05:00', '10:35:00', 'R. MARESO 103 ', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-AR/VR', NULL),
(77, 'Senin', '07:30:00', '09:00:00', 'R. MAMASE 206', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(78, 'Selasa', '15:05:00', '16:35:00', 'R. MAMASE 206', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(79, 'Senin', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-AR/VR', NULL),
(80, 'Jumat', '15:05:00', '16:35:00', 'R. MARESO 103 ', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(81, 'Kamis', '10:40:00', '12:10:00', 'R. MALEBBI 202', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(82, 'Jumat', '13:30:00', '15:00:00', 'R. MAGETTENG 104 ', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(83, 'Rabu', '10:40:00', '12:10:00', 'R. MACCA 101', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(84, 'Kamis', '09:05:00', '10:35:00', 'R. MAGETTENG 104 ', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-AR/VR', NULL),
(85, 'Selasa', '10:40:00', '12:10:00', 'R. MAMASE 206', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(86, 'Senin', '16:40:00', '18:10:00', 'R. MACCA 101', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(87, 'Rabu', '07:30:00', '09:00:00', 'R. MAMASE 206', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(88, 'Rabu', '10:40:00', '12:10:00', 'R. MALEBBI 202', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(89, 'Kamis', '16:40:00', '18:10:00', 'R. MARESO 103 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(90, 'Jumat', '10:40:00', '12:10:00', 'R. MAMASE 206', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(91, 'Senin', '10:40:00', '12:10:00', 'R. MAMASE 206', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(92, 'Senin', '13:30:00', '15:00:00', 'R. MACCA 101', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(93, 'Rabu', '16:40:00', '18:10:00', 'Ruang Kelas 205', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-AR/VR', NULL),
(94, 'Selasa', '10:40:00', '12:10:00', 'R. MAGETTENG 104 ', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 A', NULL),
(95, 'Rabu', '10:40:00', '12:10:00', 'R. MARESO 103 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(96, 'Jumat', '16:40:00', '18:10:00', 'R. MAMASE 206', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(97, 'Senin', '15:05:00', '16:35:00', 'R. MARESO 103 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(98, 'Selasa', '09:05:00', '10:35:00', 'R. MATEPPE 203', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(99, 'Senin', '15:05:00', '16:35:00', 'R. MAGETTENG 104 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(100, 'Jumat', '15:05:00', '16:35:00', 'R. MACCA 101', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(101, 'Selasa', '15:05:00', '16:35:00', 'R. MAKKAWARU 102', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL),
(102, 'Selasa', '10:40:00', '12:10:00', 'Ruang Kelas 205', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 A', NULL),
(103, 'Jumat', '09:05:00', '10:35:00', 'R. MARESO 103 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(104, 'Selasa', '15:05:00', '16:35:00', 'R. MARESO 103 ', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(105, 'Rabu', '09:05:00', '10:35:00', 'R. MARESO 103 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-AR/VR', NULL),
(106, 'Rabu', '10:40:00', '12:10:00', 'R. MAMASE 206', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 A', NULL),
(107, 'Senin', '09:05:00', '10:35:00', 'R. MARESO 103 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22 A', NULL),
(108, 'Selasa', '07:30:00', '09:00:00', 'R. MAMASE 206', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Visi Komputer', NULL),
(109, 'Jumat', '13:30:00', '15:00:00', 'R. MARESO 103 ', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22-AR/VR', NULL),
(110, 'Kamis', '09:05:00', '10:35:00', 'R. MAKKAWARU 102', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(111, 'Senin', '15:05:00', '16:35:00', 'Ruang Kelas 205', 'Jaringan Komputer', 'Prof. Siti Amalia', 'Ilmu Komputer 22 B', NULL),
(112, 'Jumat', '13:30:00', '15:00:00', 'R. MAKKAWARU 102', 'Algoritma dan Struktur Data', 'Prof. Siti Amalia', 'Ilmu Komputer 22-Mobile', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal2`
--

CREATE TABLE `jadwal2` (
  `jadwal_id` int(11) NOT NULL,
  `dosen_id` int(11) DEFAULT NULL,
  `matkul_id` int(11) DEFAULT NULL,
  `waktu_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `ruangan_id` int(11) DEFAULT NULL,
  `tahun_akademik_id` int(11) DEFAULT NULL,
  `prodi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal2`
--

INSERT INTO `jadwal2` (`jadwal_id`, `dosen_id`, `matkul_id`, `waktu_id`, `kelas_id`, `ruangan_id`, `tahun_akademik_id`, `prodi_id`) VALUES
(1, 2, 2, 4, 32, 6, 1, 2),
(2, 3, 6, 20, 28, 6, 1, 2),
(3, 1, 1, 5, 8, 4, 1, 1),
(4, 2, 2, 6, 38, 4, 1, 2),
(5, 3, 6, 5, 31, 4, 1, 2),
(6, 1, 1, 13, 23, 7, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `kelas_id` int(11) NOT NULL,
  `kode_kelas` varchar(20) NOT NULL,
  `nama_kelas` varchar(100) NOT NULL,
  `prodi_id` int(11) NOT NULL,
  `jumlah_mhs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`kelas_id`, `kode_kelas`, `nama_kelas`, `prodi_id`, `jumlah_mhs`) VALUES
(1, 'IK22-MBL', 'Ilmu Komputer 22-Mobile', 1, 50),
(2, 'IK22-AR/VR', 'Ilmu Komputer 22-AR/VR', 1, 50),
(3, 'IK22-A', 'Ilmu Komputer 22 A', 1, 40),
(4, 'IK22-B', 'Ilmu Komputer 22 B', 1, 40),
(5, 'IK22-Viskom', 'Ilmu Komputer 22-Visi Komputer', 1, 40),
(6, 'AR24', 'Arsitektur 24', 8, 10),
(7, 'IK24-A', 'Ilmu Komputer 24 A', 1, 40),
(8, 'IK24-B', 'Ilmu Komputer 24 B', 1, 40),
(9, 'IK24-C', 'Ilmu Komputer 24 C', 1, 40),
(10, 'SI24-A', 'Sistem Informasi 24 A', 2, 40),
(11, 'SI24-B', 'Sistem Informasi 24 B', 2, 40),
(15, 'TS24-AB', 'Teknik Sipil 24-AB', 9, 40),
(16, 'TEM24', 'Teknik Sistem Energi 24', 11, 40),
(17, 'TM23', 'Teknik metalurgi 23', 10, 40),
(18, 'TP24', 'Teknologi Pangan 24', 4, 40),
(19, 'BT24', 'Bioteknologi 24', 5, 40),
(20, 'TP23', 'Teknologi Pangan 23', 4, 40),
(21, 'MA22-A', 'Matematika 22 A', 3, 40),
(22, 'SD23', 'Sains Data 23', 7, 40),
(23, 'IK23-A', 'Ilmu Komputer 23 A', 1, 40),
(24, 'IK23-B', 'Ilmu Komputer 23 B', 1, 40),
(25, 'IK23-C', 'Ilmu Komputer 23 C', 1, 40),
(26, 'SI23-A', 'Sistem Informasi 23 A', 2, 30),
(27, 'SI23-B', 'Sistem Informasi 23 B', 2, 40),
(28, 'SI23-C', 'Sistem Informasi 23 C', 2, 40),
(29, 'MA23-A', 'Matematika 23 A', 3, 40),
(30, 'TPME24', 'Teknologi Pangan, Sistem Energi 24', 11, 30),
(31, 'SI22-CS', 'Sistem Informasi 22- Cyber Security', 2, 40),
(32, 'SI22-Inter', 'Sistem Informasi 22- Interpress', 2, 30),
(33, 'SI22-BD', 'Sistem Informasi 22-Bisnis Digital', 2, 40),
(35, 'TM24', 'Teknik metalurgi 24', 10, 40),
(36, 'SA24', 'Sains aktuaria 24', 6, 40),
(37, 'SI22-A', 'Sistem Informasi 22 A', 2, 40),
(38, 'SI22-B', 'Sistem Informasi 22 B', 2, 40),
(39, 'TE23', 'Teknik Sistem Energi 23', 11, 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `matkul_id` int(11) NOT NULL,
  `nama_matkul` varchar(100) NOT NULL,
  `kode_matkul` varchar(20) NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `prodi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`matkul_id`, `nama_matkul`, `kode_matkul`, `sks`, `semester`, `prodi_id`) VALUES
(1, 'PENGANTAR TEKNOLOGI INFORMASI', '22A0111073', 3, 1, 1),
(2, 'KALKULUS DASAR 1', '22A0111063', 3, 1, 1),
(4, 'PENGANTAR PEMROGRAMAN', '22A0111053', 3, 1, 1),
(5, 'WAWASAN CINTA IPTEK DAN IMTAQ', '22A0111042', 2, 1, 1),
(6, 'BAHASA INDONESIA', '22A0111032', 2, 1, 1),
(7, 'PANCASILA', '22A0111022', 2, 1, 1),
(8, 'AGAMA ISLAM', '22A0111012', 2, 1, 1),
(9, ' ORGANISASI DAN ARSITEKTUR KOMPUTER', '22A0111133', 3, 2, 1),
(10, 'STRUKTUR DATA', '22A0111123', 3, 2, 1),
(11, 'MATEMATIKA DISKRIT', '22A0111113', 3, 2, 1),
(12, 'FISIKA LISTRIK DAN CAHAYA', '22A0111153', 3, 2, 1),
(13, 'KALKULUS DASAR II', '22A0111143', 3, 2, 1),
(14, 'WAWASAN TEKNOLOGI', '22A0111102', 2, 2, 1),
(15, 'PENDIDIKAN KEWARGANEGARAAN', '22A0111092', 2, 2, 1),
(16, 'BHS INGGRIS', '22A0111082', 2, 2, 1),
(17, 'SISTEM BASIS DATA', '22A0112053', 3, 3, 1),
(18, 'SISTEM OPERASI', '22A0112063', 3, 3, 1),
(19, 'JARINGAN KOMPUTER', '22A0112073', 3, 3, 1),
(20, ' PEMROGRAMAN BERORIENTASI OBJEK', '22A0112043', 3, 3, 1),
(21, 'INTERAKSI MANUSIA DAN KOMPUTER', '22A0112013', 3, 3, 1),
(22, 'ALJABAR LINEAR', '22A0112023', 3, 3, 1),
(23, ' TECHNOPRENEURSHIP', '22A0112032', 2, 3, 1),
(26, ' KECERDASAN BUATAN', '22A0112083', 3, 4, 1),
(27, ' PROBABILITAS DAN STATISTIKA', '22A0112093	', 3, 4, 1),
(35, 'RISET TEKNOLOGI INFORMASI', '22A0112112', 2, 4, 1),
(36, 'KEAMANAN DATA DAN INFORMASI', '22A0112123', 3, 4, 1),
(37, 'PEMROGRAMAN WEB', '22A0112133', 3, 4, 1),
(42, 'VISI KOMPUTER', '22A0113123', 3, 5, 1),
(43, 'PENGANTAR SISTEM DIGITAL', '22A0111163', 3, 1, 1),
(44, ' PENGOLAHAN CITRA DIGITAL', '22A0112143', 3, 4, 1),
(45, 'DESAIN DAN ANALISIS ALGORITMA', '22A0112153', 3, 4, 1),
(46, 'PEMBELAJARAN MESIN', '22A0113013', 3, 5, 1),
(47, 'Metodologi Penelitian', '22A0113033', 3, 5, 1),
(48, 'TEKNOLOGI AR/VR', '22A0113163', 3, 5, 1),
(49, 'ETIKA PROFESI', '22A0113042', 2, 5, 1),
(50, 'PEMROGRAMAN MOBILE', '22A0113083', 3, 5, 1),
(51, 'BIG DATA', '22A0113073', 3, 5, 1),
(52, 'PROYEK TEKNOLOGI CERDAS', '22A0113064', 4, 5, 1),
(53, '  IOT DAN CLOUD COMPUTING (IOT)', 'IOT', 3, 5, 1),
(55, 'PEMROSESAN BAHASA ALAMI', 'NLP', 3, 5, 1),
(56, 'SENSOR', 'SNR', 3, 5, 1),
(57, 'KEAMANAN SISTEM INFORMASI', '22B0213073', 3, 5, 2),
(58, 'BISNIS DIGITAL', '22B0213063', 3, 5, 2),
(59, 'COMMUNICATION SKILL', '22B0213033', 3, 5, 2),
(60, 'AUDIT SISTEM INFORMASI', '22B0213083', 3, 5, 2),
(61, 'TEKNOLOGI DAN INFRASTRUKTUR BISNIS DIGITAL ', '22B0213103', 3, 5, 2),
(62, 'KRIPTOGRAFI', '22B0213113', 3, 5, 2),
(65, 'PROYEK SISTEM INFORMASI', '22B0213023', 3, 5, 2),
(66, 'MANAJEMEN PROYEK SISTEM INFORMASI', '22B0213013', 3, 5, 2),
(67, 'SOFTWARE TESTING AND QUALITY ASSURANCE', '22B0213043', 3, 5, 2),
(68, 'ENTERPRISE INFORMATION SYSTEM', '22B0213093', 3, 5, 2),
(69, 'FISIOLOGI DAN TEKNOLOGI PASCAPANEN', '23A0412042', 2, 3, 4),
(70, 'KIMIA PANGAN 1 ', '23A0412013', 3, 3, 4),
(71, 'APLIKASI TEKNIK LABORATORIUM ', '23A0412023', 3, 3, 4),
(72, 'REKAYASA PROSES PANGAN ', '23A0412032', 2, 3, 4),
(73, 'ETIKA PROFESI', '23A0412092', 2, 3, 4),
(74, 'MANAJEMEN INDUSTRI PANGAN ', '23A0412083', 3, 3, 4),
(75, 'PENGETAHUAN BAHAN INDUSTRI PANGAN', '23A0412073', 3, 3, 4),
(76, 'TEKNOLOGI PENGOLAHAN BUAH & SAYUR', '23A0412062', 2, 3, 4),
(77, 'MIKROBIOLOGI PANGAN', '23A0412053', 3, 3, 4),
(78, 'METODE NUMERIK', '22B0213383', 3, 3, 2),
(79, 'TECHNOPRENEUSHIP', '22B0212282', 2, 3, 2),
(81, 'SUPPLY CHAIN MANAGEMENT', '22B0212272', 3, 3, 2),
(82, 'TRANSFORMASI DIGITAL', '22B0212253', 3, 3, 2),
(83, 'RISET TEKNOLOGI INFORMASI', '22B0212212', 2, 3, 2),
(84, 'ANALISIS DAN PERANCANGAN SISTEM', '22B0212233', 3, 3, 2),
(85, 'JARINGAN KOMPUTER', '22B0212223', 3, 3, 2),
(86, 'SISTEM BASIS DATA', '22B0212243', 3, 3, 2),
(89, 'MATEMATIKA BISNIS & TEKNOLOGI', '22B0112133', 3, 3, 3),
(90, 'ANALISIS SUKU BUNGA BERBASIS WEB', '22B0112143', 3, 3, 3),
(91, 'TECHNOPRENEURSHIP', '22B0112063', 2, 3, 3),
(92, 'PERSAMAAN DIFFERENSIAL BIASA', '22B0112053', 3, 3, 3),
(93, 'KALKULUS LANJUT', '22B0112043', 3, 3, 3),
(94, 'MATEMATIKA DISKRIT', '22B0112033', 3, 3, 3),
(95, 'TEORI PELUANG', '22B0112023', 3, 3, 3),
(96, 'ALJABAR LINEAR', '22B0112013', 3, 3, 3),
(97, 'TEORI PELUANG', '23B0612023', 3, 3, 7),
(98, 'PENGANTAR SISTEM BASIS DATA', '23B0612033', 3, 3, 7),
(99, 'STATISTIKA NONPARAMETRIK', '23B0612043', 3, 3, 7),
(100, 'SISTEM OPERASI', '23B0612053', 3, 3, 7),
(101, 'METODE VISUALISASI DATA', '23B0612063', 3, 3, 7),
(102, 'PENGANTAR MACHINE LEARNING', '23B0612073', 3, 3, 7),
(103, 'ANALISIS EKSPLORASI DATA', '23B0612083', 3, 3, 7),
(104, 'ALJABAR MATRIKS', '23B0612013', 3, 3, 7),
(105, 'SISTEM KENDALI', '23A0712083', 3, 3, 11),
(106, 'TERMODINAMIKA', '23A0712072', 2, 3, 11),
(107, 'KONVERSI ENERGI', '23A0712062', 2, 3, 11),
(108, 'DASAR SISTEM TENAGA LISTRIK', '23A0712053', 2, 3, 11),
(109, 'ELEKTRONIKA', '23A0712043', 3, 3, 11),
(110, 'MATERIAL ENERGI', '23A0712032', 2, 3, 11),
(111, 'RANGKAIAN ELEKTRIK 2', '23A0712023', 3, 3, 11),
(112, 'MATEMATIKA TEKNIK', '23A0712013', 3, 3, 11),
(114, 'PANCASILA', '23A0311062', 2, 1, 10),
(115, 'AGAMA KRISTEN PROTESTAN', '22U0111022', 2, 1, 10),
(116, 'AGAMA KATOLIK', '22U0111032', 2, 1, 10),
(117, 'AGAMA HINDU', '22U0111042', 2, 1, 10),
(118, 'AGAMA BUDHA', '22U0311052', 2, 1, 10),
(119, 'WAWASAN CINTA IMTAQ DAN IPTEK', '22U0111082', 2, 1, 10),
(120, 'FISIKA DASAR I', '23A0811093', 3, 1, 10),
(121, 'KIMIA DASAR', '23A0811103', 3, 1, 10),
(122, 'GAMBAR TEKNIK & CAD', '23A0811112', 2, 1, 10),
(123, 'AGAMA ISLAM', '22U0211012', 2, 1, 10),
(124, 'PENGANTAR TEKNOLOGI INFORMASI', '23A0811033', 3, 1, 10),
(125, 'PENGANTAR PEMROGRAMAN', '23A0811013', 3, 1, 10),
(126, 'KALKULUS DASAR 1', '23A0811023', 3, 1, 10),
(127, 'BAHASA INDONESIA', '23A0311072', 2, 1, 10),
(128, 'BIOLOGI DASAR', '24B0911033', 3, 1, 5),
(130, 'BAHASA INDONESIA', '22U0211072', 2, 1, 5),
(131, 'PANCASILA', '22U0211062', 2, 1, 5),
(132, 'WAWASAN CINTA IPTEK DAN IMTAQ', '22U0211082', 2, 1, 5),
(133, 'PENGANTAR TEKNOLOGI INFORMASI', '24B0911013', 3, 1, 5),
(134, 'PENGANTAR DAN ETIKA BIOTEKNOLOGI', '24B0911043', 3, 1, 5),
(135, 'SAINS TERPADU', '22B0211045', 3, 1, 5),
(136, 'STATIKA', '24A1011043', 3, 1, 9),
(137, 'KALKULUS DASAR 1', '24A1011023', 3, 1, 9),
(138, 'FISIKA DASAR I', '24A1011033', 3, 1, 8),
(139, 'MENGGAMBAR ARSITEKTUR', '24A1111033', 3, 1, 8),
(140, 'BAHASA INDONESIA', '23A0211072', 2, 1, 8),
(141, 'BAHAN BANGUNAN (SENI KETUKANGAN)', '24A1111022', 2, 1, 8),
(142, 'TEKNIK KOMUNIKASI & PRESENTASI', '24A1111042', 3, 1, 8),
(143, 'PENGANTAR ARSITEKTUR', '24A1111043', 2, 1, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `prodi_id` int(11) NOT NULL,
  `kode_prodi` varchar(20) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`prodi_id`, `kode_prodi`, `nama_prodi`, `jurusan`) VALUES
(1, 'IK', 'Ilmu Komputer', 'Teknologi Produksi dan Industri'),
(2, 'SI', 'Sistem Informasi', 'Sains\r\n'),
(3, 'MA', 'Matematika', 'Sains'),
(4, 'TP', 'Teknologi Pangan ', 'Teknologi Produksi dan Industri'),
(5, 'BT', 'Bioteknologi', 'Sains'),
(6, 'SA', 'Sains aktuaria', 'Sains'),
(7, 'SD', 'Sains Data', 'Sains'),
(8, 'AR', 'Arsitektur', 'Teknologi Produksi dan Industri'),
(9, 'TS', 'Teknik Sipil', 'Teknologi Produksi dan Industri'),
(10, 'TM', 'Teknik Metalurgi', 'Teknologi Produksi dan Industri'),
(11, 'TE', 'Teknik Sistem Energi', 'Teknologi Produksi dan Industri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `ruangan_id` int(11) NOT NULL,
  `kode_ruangan` varchar(20) NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `lokasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`ruangan_id`, `kode_ruangan`, `nama_ruangan`, `kapasitas`, `lokasi`) VALUES
(1, '101', 'R. MACCA 101', 40, 'Kampus 2 Gedung Pemuda							'),
(2, '102', 'R. MAKKAWARU 102', 50, 'Kampus 2 Gedung Pemuda							'),
(3, '103', 'R. MARESO 103 ', 50, 'Kampus 2 Gedung Pemuda							'),
(4, '104', 'R. MAGETTENG 104 ', 50, 'Kampus 2 Gedung Pemuda							'),
(5, '202', 'R. MALEBBI 202', 70, 'Kampus 2 Gedung Pemuda							'),
(6, '203', 'R. MATEPPE 203', 70, 'Kampus 2 Gedung Pemuda							'),
(7, '205', 'Ruang Kelas 205', 70, 'Kampus 2 Gedung Pemuda							'),
(8, '206', 'R. MAMASE 206', 70, 'Kampus 2 Gedung Pemuda							');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `tahun_akademik_id` int(11) NOT NULL,
  `tahun_akademik_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`tahun_akademik_id`, `tahun_akademik_nama`) VALUES
(1, '2024/2025 GASAL'),
(2, '2024/2025 GENAP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `waktu`
--

CREATE TABLE `waktu` (
  `waktu_id` int(11) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `waktu`
--

INSERT INTO `waktu` (`waktu_id`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(1, 'Senin', '07:30:00', '09:00:00'),
(2, 'Senin', '09:05:00', '10:35:00'),
(3, 'Senin', '10:40:00', '12:10:00'),
(4, 'Senin', '13:30:00', '15:00:00'),
(5, 'Senin', '15:05:00', '16:35:00'),
(6, 'Senin', '16:40:00', '18:10:00'),
(7, 'Selasa', '07:30:00', '09:00:00'),
(8, 'Selasa', '09:05:00', '10:35:00'),
(9, 'Selasa', '10:40:00', '12:10:00'),
(10, 'Selasa', '13:30:00', '15:00:00'),
(11, 'Selasa', '15:05:00', '16:35:00'),
(12, 'Selasa', '16:40:00', '18:10:00'),
(13, 'Rabu', '07:30:00', '09:00:00'),
(14, 'Rabu', '09:05:00', '10:35:00'),
(15, 'Rabu', '10:40:00', '12:10:00'),
(16, 'Rabu', '13:30:00', '15:00:00'),
(17, 'Rabu', '15:05:00', '16:35:00'),
(18, 'Rabu', '16:40:00', '18:10:00'),
(19, 'Kamis', '07:30:00', '09:00:00'),
(20, 'Kamis', '09:05:00', '10:35:00'),
(21, 'Kamis', '10:40:00', '12:10:00'),
(22, 'Kamis', '13:30:00', '15:00:00'),
(23, 'Kamis', '15:05:00', '16:35:00'),
(24, 'Kamis', '16:40:00', '18:10:00'),
(25, 'Jumat', '07:30:00', '09:00:00'),
(26, 'Jumat', '09:05:00', '10:35:00'),
(27, 'Jumat', '10:40:00', '12:10:00'),
(28, 'Jumat', '13:30:00', '15:00:00'),
(29, 'Jumat', '15:05:00', '16:35:00'),
(30, 'Jumat', '16:40:00', '18:10:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`dosen_id`),
  ADD UNIQUE KEY `NIP` (`nip`);

--
-- Indeks untuk tabel `dosen_mk`
--
ALTER TABLE `dosen_mk`
  ADD PRIMARY KEY (`dosen_mk_id`),
  ADD KEY `dosen_id` (`dosen_id`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `prodi_id` (`prodi_id`),
  ADD KEY `tahun_akademik_id` (`tahun_akademik_id`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tahun_akademik` (`tahun_akademik_id`);

--
-- Indeks untuk tabel `jadwal2`
--
ALTER TABLE `jadwal2`
  ADD PRIMARY KEY (`jadwal_id`),
  ADD KEY `dosen_id` (`dosen_id`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `waktu_id` (`waktu_id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `ruangan_id` (`ruangan_id`),
  ADD KEY `tahun_akademik_id` (`tahun_akademik_id`),
  ADD KEY `fk_prodi_id` (`prodi_id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kelas_id`),
  ADD UNIQUE KEY `kode_kelas` (`kode_kelas`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`matkul_id`),
  ADD UNIQUE KEY `kode_matkul` (`kode_matkul`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`prodi_id`),
  ADD UNIQUE KEY `kode_prodi` (`kode_prodi`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`ruangan_id`),
  ADD UNIQUE KEY `kode_ruangan` (`kode_ruangan`);

--
-- Indeks untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`tahun_akademik_id`);

--
-- Indeks untuk tabel `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`waktu_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `dosen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT untuk tabel `dosen_mk`
--
ALTER TABLE `dosen_mk`
  MODIFY `dosen_mk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT untuk tabel `jadwal2`
--
ALTER TABLE `jadwal2`
  MODIFY `jadwal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `kelas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `matkul_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT untuk tabel `prodi`
--
ALTER TABLE `prodi`
  MODIFY `prodi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `ruangan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `tahun_akademik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `waktu`
--
ALTER TABLE `waktu`
  MODIFY `waktu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen_mk`
--
ALTER TABLE `dosen_mk`
  ADD CONSTRAINT `dosen_mk_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`dosen_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dosen_mk_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matakuliah` (`matkul_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dosen_mk_ibfk_3` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dosen_mk_ibfk_4` FOREIGN KEY (`tahun_akademik_id`) REFERENCES `tahun_akademik` (`tahun_akademik_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_tahun_akademik` FOREIGN KEY (`tahun_akademik_id`) REFERENCES `tahun_akademik` (`tahun_akademik_id`);

--
-- Ketidakleluasaan untuk tabel `jadwal2`
--
ALTER TABLE `jadwal2`
  ADD CONSTRAINT `fk_prodi_id` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`),
  ADD CONSTRAINT `jadwal2_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`dosen_id`),
  ADD CONSTRAINT `jadwal2_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matakuliah` (`matkul_id`),
  ADD CONSTRAINT `jadwal2_ibfk_3` FOREIGN KEY (`waktu_id`) REFERENCES `waktu` (`waktu_id`),
  ADD CONSTRAINT `jadwal2_ibfk_4` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`),
  ADD CONSTRAINT `jadwal2_ibfk_5` FOREIGN KEY (`ruangan_id`) REFERENCES `ruangan` (`ruangan_id`),
  ADD CONSTRAINT `jadwal2_ibfk_6` FOREIGN KEY (`tahun_akademik_id`) REFERENCES `tahun_akademik` (`tahun_akademik_id`);

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`);

--
-- Ketidakleluasaan untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
