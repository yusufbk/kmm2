-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05 Feb 2018 pada 04.42
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_skymedical`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daemons`
--

CREATE TABLE `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gammu`
--

CREATE TABLE `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `gammu`
--

INSERT INTO `gammu` (`Version`) VALUES
(13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `inbox`
--

CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `inbox`
--

INSERT INTO `inbox` (`UpdatedInDB`, `ReceivingDateTime`, `Text`, `SenderNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `RecipientID`, `Processed`) VALUES
('2018-01-29 04:55:37', '2018-01-26 03:20:29', '004B006500730065006D0070006100740061006E0020006D0065006E006A0061006400690020004100670065006E002000700075006C00730061002F0041004C004C0020004F00700065007200610074006F00720020004D004B0049004F0053002C0020004800610072006700610020006D0075007200610068003B0020000A0035003D0034003500300030002C000A00310030003D0039003000300030002C000A00320030003D00310038003000300030002C000A00320035003D00320033003000300030002C000A00350030003D00340035003000300030002C0020000A004B006500740069006B00200044004100460054004100520020004B006900720069006D0020006B00650020003000380035003700370037003700370037003200370035', '+6285724701668', 'Default_No_Compression', '', '+62816124', -1, 'Kesempatan menjadi Agen pulsa/ALL Operator MKIOS, Harga murah; \n5=4500,\n10=9000,\n20=18000,\n25=23000,\n50=45000, \nKetik DAFTAR Kirim ke 085777777275', 1, '', 'true'),
('2018-01-29 04:55:41', '2018-01-29 03:29:28', '0042006100720075002300790075007300750066002000620075006400690023006C002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320023006900620075006E0079006100200079007500730075006600230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070006A0073002300330031002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Baru#yusuf budi#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#31-01-2018', 2, '', 'true'),
('2018-01-29 04:55:41', '2018-01-29 03:42:54', '0042006100720075002300790075007300750066002000620075006400690023006C002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320023006900620075006E0079006100200079007500730075006600230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300610073007500720061006E00730069002300330031002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Baru#yusuf budi#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#asuransi#31-01-2018', 3, '', 'true'),
('2018-01-29 04:55:41', '2018-01-29 04:46:05', '0054006500730074002000670061006D006D0075', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Test gammu', 4, '', 'true'),
('2018-01-29 04:58:32', '2018-01-29 04:58:26', '0043006F006200610020006C006100670069', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Coba lagi', 5, '', 'true'),
('2018-01-29 06:03:59', '2018-01-29 06:00:02', '0042006100720075002300790075007300750066002000620075006400690020006B00750072006E0069006100770061006E0023006C002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320020006E006F006D006F0072002000320030002000610020002F002000320035002000720074002000350020007200770020003100310020006B0065006C00750072006100680061006E002000730075006D0062006500720020006B006500630061006D006100740061006E002000620061006E006A00610072007300610072006900200073007500720061006B00610072007400610023006900620075006E00790061002000790075007300750066002000620075006400690020006B00750072', '+6285725093955', 'Default_No_Compression', '050003AE0201', '+62816124', -1, 'Baru#yusuf budi kurniawan#l#20-12-1997#jalan pajajaran 2 nomor 20 a / 25 rt 5 rw 11 kelurahan sumber kecamatan banjarsari surakarta#ibunya yusuf budi kur', 6, '', 'true'),
('2018-01-29 06:03:59', '2018-01-29 06:00:11', '006E0069006100770061006E00230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070006A0073002300330031002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '050003AE0202', '+62816124', -1, 'niawan#poli spesialis syaraf#bpjs#31-01-2018', 7, '', 'true'),
('2018-01-29 06:06:07', '2018-01-29 06:06:02', '0049006E0066006F00200070006F006C0069002300330031002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Info poli#31-01-2018', 8, '', 'true'),
('2018-01-29 06:07:03', '2018-01-29 06:06:58', '0049006E0066006F00200070006F006C0069002300330031002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Info poli#31-01-2018', 9, '', 'true'),
('2018-01-29 06:11:40', '2018-01-29 06:11:31', '004C0061006D00610023007000610030003000300034002300700061007300690065006E00200031003000230050006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070006A0073002300330031002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Lama#pa0004#pasien 10#Poli spesialis syaraf#bpjs#31-01-2018', 10, '', 'true'),
('2018-01-29 07:26:00', '2018-01-29 07:25:55', '004C0061006D00610023007000610030003000300037002300700061007300690065006E0020003100330023006B006C0069006E0069006B0020006F0062007300670079006E002300620070006A0073002300330030002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Lama#pa0007#pasien 13#klinik obsgyn#bpjs#30-01-2018', 11, '', 'true'),
('2018-01-29 07:29:54', '2018-01-29 07:29:46', '004C0061006D00610023007000610030003000300037002300700061007300690065006E0020003100330023006B006C0069006E0069006B0020006F0062007300670079006E002300620070006A0073002300320038002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Lama#pa0007#pasien 13#klinik obsgyn#bpjs#28-01-2018', 12, '', 'true'),
('2018-01-29 07:31:40', '2018-01-29 07:31:33', '004C0061006D00610023007000610030003000300037002300700061007300690065006E0020003100330023006B006C0069006E0069006B0020006F0062007300670079006E0023007400740074002300320039002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Lama#pa0007#pasien 13#klinik obsgyn#ttt#29-01-2018', 13, '', 'true'),
('2018-01-29 07:35:20', '2018-01-29 07:35:13', '004C0061006D006100230070006100300030002300700061007300690065006E0020003100330023006B006C0069006E0069006B0020006F0062007300670079006E0023007400740074002300320039002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Lama#pa00#pasien 13#klinik obsgyn#ttt#29-01-2018', 14, '', 'true'),
('2018-01-29 07:40:01', '2018-01-29 07:39:55', '004C0061006D006100230070006100300030002300700061007300690065006E0020003100330023006B006C0069006E0069006B0020006F0062007300670079006E0023007400740074', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Lama#pa00#pasien 13#klinik obsgyn#ttt', 15, '', 'true'),
('2018-01-29 07:42:29', '2018-01-29 07:42:22', '0042006100720075002300790075007300750066002000620061007200750023006C002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320023006900620075006E0079006100200079007500730075006600230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070006A0073', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs', 16, '', 'true'),
('2018-01-29 07:43:34', '2018-01-29 07:43:26', '004200610072007500230079007500730075006600200062006100720075002300770061006E006900740061002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320023006900620075006E0079006100200079007500730075006600230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070006A0073002300330030002D00300031002D0033003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Baru#yusuf baru#wanita#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#30-01-3018', 17, '', 'true'),
('2018-01-29 07:46:08', '2018-01-29 07:45:59', '0042006100720075002300790075007300750066002000620061007200750023006C002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320023006900620075006E0079006100200079007500730075006600230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070002300330030002D00300031002D0033003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bp#30-01-3018', 18, '', 'true'),
('2018-01-29 07:47:51', '2018-01-29 07:47:46', '0042006100720075002300790075007300750066002000620061007200750023006C002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320023006900620075006E0079006100200079007500730075006600230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070006A0073002300320038002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#28-01-2018', 19, '', 'true'),
('2018-01-29 07:49:25', '2018-01-29 07:49:18', '0042006100720075002300790075007300750066002000620061007200750023006C002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320023006900620075006E0079006100200079007500730075006600230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070006A0073002300330031002D00300031002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#31-01-2018', 20, '', 'true'),
('2018-01-29 07:52:11', '2018-01-29 07:52:04', '0042006100720075002300790075007300750066002000620061007200750023006C002300320030002D00310032002D00310039003900370023006A0061006C0061006E002000700061006A0061006A006100720061006E002000320023006900620075006E0079006100200079007500730075006600230070006F006C00690020007300700065007300690061006C006900730020007300790061007200610066002300620070006A0073002300300031002D00300032002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#01-02-2018', 21, '', 'true'),
('2018-01-29 07:54:42', '2018-01-29 07:54:34', '0049006E0066006F00200070006F006C0069002300300032002D00300032002D0032003000310038', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Info poli#02-02-2018', 22, '', 'true'),
('2018-01-29 07:55:42', '2018-01-29 07:55:38', '0049006E0066006F00200070006F006C006900230070006F006C0069006B0075', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Info poli#poliku', 23, '', 'true'),
('2018-01-29 07:57:36', '2018-01-29 07:57:32', '0049006E0066006F00200070006F006C0069002300300032002D00300032002D00320030003100380023006700670066007400680068', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Info poli#02-02-2018#ggfthh', 24, '', 'true'),
('2018-01-31 08:59:26', '2018-01-31 08:59:25', '', '085602007066', 'Default_No_Compression', '', '', -1, 'Baru#yusuf 100#wanita#20-12-1997#jalan pajajaran 2#ibunya yusuf 100#klinik bedah#bpjs#31-01-3018', 25, '', 'true'),
('2018-01-31 09:00:38', '2018-01-31 09:00:35', '', '085602007066', 'Default_No_Compression', '', '', -1, 'Baru#yusuf 100#l#20-12-1997#jalan pajajaran 2#ibunya yusuf 100#klinik bedah#bpjs#31-01-3018', 26, '', 'true'),
('2018-01-31 09:01:32', '2018-01-31 09:01:26', '', '085602007066', 'Default_No_Compression', '', '', -1, 'Baru#yusuf 100#l#20-12-1997#jalan pajajaran 2#ibunya yusuf 100#klinik bedah#bpjs#31-01-2018', 27, '', 'true'),
('2018-02-01 02:01:41', '2018-02-01 02:00:12', '', '085602007066', 'Default_No_Compression', '', '', -1, 'hehehe', 28, '', 'true'),
('2018-02-01 02:04:32', '2018-02-01 02:04:31', '', '085602007066', 'Default_No_Compression', '', '', -1, 'coba ini ciba ya', 29, '', 'true'),
('2018-02-01 02:11:33', '2018-02-01 02:11:30', '', '085602007066', 'Default_No_Compression', '', '', -1, 'test masuk apa nggak', 30, '', 'true'),
('2018-02-01 02:22:57', '2018-02-01 02:22:54', '', '085602007066', 'Default_No_Compression', '', '', -1, 'cobacona', 31, '', 'true'),
('2018-02-01 02:49:29', '2018-02-01 02:49:25', '', '085602007066', 'Default_No_Compression', '', '', -1, 'test', 32, '', 'true'),
('2018-02-01 06:55:25', '2018-02-01 06:51:06', '', '085602007066', 'Default_No_Compression', '', '', -1, 'hendrahaqq', 33, '', 'true'),
('2018-02-01 06:55:26', '2018-02-01 06:54:26', '', '085602007066', 'Default_No_Compression', '', '', -1, 'hendra1', 34, '', 'true'),
('2018-02-01 07:28:30', '2018-02-01 06:58:22', '', '085602007066', 'Default_No_Compression', '', '', -1, 'weweweaf', 35, '', 'true'),
('2018-02-02 04:37:27', '2018-02-02 04:37:25', '', '085602007066', 'Default_No_Compression', '', '', -1, 'nyoba', 36, '', 'true');

--
-- Trigger `inbox`
--
DELIMITER $$
CREATE TRIGGER `inbox_timestamp` BEFORE INSERT ON `inbox` FOR EACH ROW BEGIN
    IF NEW.ReceivingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.ReceivingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_gallery`
--

CREATE TABLE `m_gallery` (
  `pk` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_gallery`
--

INSERT INTO `m_gallery` (`pk`, `gambar`, `deskripsi`, `timestamp`) VALUES
(2, 'medic2.jpg', 'hehe', '2017-06-06 02:24:59'),
(3, 'medic3.jpg', 'hoho', '2017-06-06 02:24:59'),
(14, 'Rumah-Sakit2.jpg', 'hihi', '2017-06-15 03:54:09'),
(15, 'poli2.jpg', 'haha', '2017-06-15 03:57:06'),
(16, 'banner1.png', 'hahaha', '2017-06-15 07:59:10'),
(25, 'rs13.png', 'kjh', '2017-06-16 07:54:50'),
(31, 'rs43.png', 'gfjg', '2017-06-16 08:29:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_jadwal_praktek`
--

CREATE TABLE `m_jadwal_praktek` (
  `pk` int(11) NOT NULL,
  `id_session_jadwal` varchar(30) DEFAULT NULL,
  `pembuat_fk` int(11) DEFAULT NULL,
  `tanggal_praktek` date DEFAULT NULL,
  `jam_praktek` time DEFAULT NULL,
  `dokter_fk` int(11) DEFAULT NULL,
  `informasi_tambahan` varchar(250) DEFAULT NULL,
  `total_pasien` int(11) DEFAULT '0',
  `batasan_pasien` int(11) DEFAULT '0',
  `status_terlaksana` varchar(20) DEFAULT NULL,
  `pelayanan_fk` int(11) DEFAULT NULL,
  `rentang_waktu` int(11) NOT NULL DEFAULT '0',
  `perawat_fk` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_jadwal_praktek`
--

INSERT INTO `m_jadwal_praktek` (`pk`, `id_session_jadwal`, `pembuat_fk`, `tanggal_praktek`, `jam_praktek`, `dokter_fk`, `informasi_tambahan`, `total_pasien`, `batasan_pasien`, `status_terlaksana`, `pelayanan_fk`, `rentang_waktu`, `perawat_fk`) VALUES
(19, '08062017-001', 1, '2017-06-15', '10:00:00', 36, '', 3, 10, 'Belum Terlaksana', 14, 0, NULL),
(20, '08062017-002', 1, '2017-06-09', '09:00:00', 46, '', 0, 0, 'Belum Terlaksana', 17, 0, 40),
(24, '13062017-005', 1, '2017-06-13', '16:00:00', 33, '', 0, 100, 'Sudah Terlaksana', 21, 0, 40),
(25, '15062017-004', 1, '2017-06-15', '11:00:00', 48, '', 0, 10, 'Belum Terlaksana', 15, 0, NULL),
(26, '15062017-005', 1, '0000-00-00', '00:00:16', 59, '', 1, 0, 'Belum Terlaksana', 23, 5, NULL),
(30, '13072017-008', 1, '2017-07-13', '02:00:00', 36, 'testing', 0, 0, 'Belum Terlaksana', 17, 0, NULL),
(28, '19062017-007', 1, '2017-09-16', '14:00:00', 83, 'kolom informasi tambahan pada menu tambah jadwal praktek', 100, 130, 'Sedang Terlaksana', 21, 5, 84),
(29, '10072017-008', 1, '2017-07-10', '09:15:00', 52, 'test jadwal praktek', 1, 5, 'Sudah Terlaksana', 21, 0, 40),
(31, '13072017-009', 1, '2017-07-13', '11:00:00', 48, 'Test Info', 0, 0, 'Belum Terlaksana', 15, 0, NULL),
(32, '14072017-010', 1, '2017-07-14', '10:00:00', 36, 'info', 0, 0, 'Belum Terlaksana', 14, 0, 40),
(33, '14072017-011', 1, '2017-07-14', '13:00:00', 46, 'jadwal', 0, 0, 'Belum Terlaksana', 17, 0, NULL),
(34, '23012018-001', 1, '2018-01-23', '10:00:00', 57, 'dfghj', 0, 2, 'Belum Terlaksana', 14, 5, NULL),
(37, '19012018-014', 1, '2018-01-31', '09:45:00', 56, '', 7, 12, 'Belum Terlaksana', 31, 2, NULL),
(36, '19012018-013', 1, '2018-01-20', '09:45:00', 61, '', 0, 10, 'Belum Terlaksana', 14, 4, NULL),
(38, '19012018-015', 1, '2018-01-22', '13:00:00', 33, '', 9, 10, 'Belum Terlaksana', 26, 3, NULL),
(39, '19012018-016', 1, '2018-01-22', '15:00:00', 81, '', 1, 19, 'Belum Terlaksana', 26, 5, NULL),
(41, '19012018-017', 1, '2018-01-26', '13:15:00', 59, '', 15, 90, 'Belum Terlaksana', 20, 1, NULL),
(42, '19012018-018', 1, '2018-01-19', '13:15:00', 57, '', NULL, 11, 'Belum Terlaksana', 28, 0, NULL),
(43, '19012018-019', 1, '2018-01-20', '13:15:00', 33, 'aa', NULL, 5, 'Belum Terlaksana', 26, 3, NULL),
(44, '19012018-020', 1, '2018-01-19', '13:30:00', 62, '', NULL, 9, 'Belum Terlaksana', 31, 2, NULL),
(45, '19012018-021', 1, '2018-01-19', '13:30:00', 54, '', 0, 6, 'Belum Terlaksana', 14, 1, NULL),
(46, '19012018-022', 1, '2018-01-30', '13:30:00', 48, '', 4, 4, 'Belum Terlaksana', 23, 2, NULL),
(47, '19012018-023', 1, '2018-01-30', '14:30:00', 52, '', 4, 5, 'Belum Terlaksana', 23, 2, NULL),
(48, '19012018-024', 1, '2017-12-31', '16:30:00', 48, '', 0, 2, 'Belum Terlaksana', 20, 1, NULL),
(49, '22012018-025', 1, '2018-01-22', '20:00:00', 58, '', 0, 5, 'Belum Terlaksana', 17, 2, NULL),
(50, '23012018-026', 1, '2018-01-23', '13:15:00', 61, '', NULL, 0, 'Belum Terlaksana', 22, 1, NULL),
(51, '24012018-027', 1, '2018-01-24', '18:15:00', 62, '', 2, 5, 'Belum Terlaksana', 17, 1, NULL),
(52, '24012018-028', 1, '2018-01-24', '10:30:00', 33, '', 0, 9, 'Belum Terlaksana', 26, 1, NULL),
(53, '25012018-029', 1, '2018-01-25', '18:00:00', 53, '', 8, 5, 'Belum Terlaksana', 23, 2, NULL),
(54, '25012018-030', 1, '2018-01-25', '17:45:00', 36, '', 6, 8, 'Belum Terlaksana', 26, 2, NULL),
(55, '25012018-031', 1, '2018-01-25', '23:15:00', 48, '', 1, 4, 'Belum Terlaksana', 15, 1, NULL),
(56, '31012018-032', 1, '2018-01-31', '23:45:00', 33, '', 1, 22, 'Belum Terlaksana', 14, 2, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_jadwal_praktek_antrian`
--

CREATE TABLE `m_jadwal_praktek_antrian` (
  `pk` int(11) NOT NULL,
  `jadwal_praktek_fk` int(11) DEFAULT NULL,
  `pasien_fk` int(11) DEFAULT NULL,
  `nomor_registrasi_pasien` varchar(30) DEFAULT NULL,
  `jadwal_kunjung` datetime DEFAULT NULL,
  `realisasi_kunjung` datetime DEFAULT NULL,
  `nomor_urut` int(11) NOT NULL,
  `status_antrian` varchar(30) DEFAULT NULL,
  `status_sms_terkirim` int(11) NOT NULL DEFAULT '0',
  `metode_pembayaran_fk` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_jadwal_praktek_antrian`
--

INSERT INTO `m_jadwal_praktek_antrian` (`pk`, `jadwal_praktek_fk`, `pasien_fk`, `nomor_registrasi_pasien`, `jadwal_kunjung`, `realisasi_kunjung`, `nomor_urut`, `status_antrian`, `status_sms_terkirim`, `metode_pembayaran_fk`) VALUES
(79, 20, 41, 'PA001', '2017-06-09 09:00:00', '2017-06-09 10:58:24', 0, 'Selesai', 0, 0),
(80, 20, 44, 'PA002', '2017-06-09 09:00:00', '2017-06-09 09:33:39', 0, 'Selesai', 0, 0),
(81, 19, 44, 'PA002', '2017-06-15 10:00:00', '2018-01-23 13:34:38', 0, 'Tindakan', 0, 0),
(82, 19, 41, 'PA001', '2017-06-15 10:00:00', '2018-01-23 13:34:35', 0, 'Selesai', 0, 0),
(83, 28, 86, '321456', '2017-09-16 14:05:00', '0000-00-00 00:00:00', 0, 'Selesai', 0, 0),
(84, 28, 49, 'PA003', '2017-09-16 14:10:00', '0000-00-00 00:00:00', 0, 'Selesai', 0, 0),
(85, 32, 44, 'PA002', '2017-07-14 10:00:00', '2018-01-12 10:59:24', 0, 'Tindakan', 0, 0),
(86, 30, 44, '57', '2018-01-10 09:00:00', '2018-01-12 13:39:56', 0, 'Selesai', 0, 0),
(87, 32, 86, 'P002', '2018-01-19 13:39:00', '0000-00-00 00:00:00', 0, 'Diantrikan', 0, 0),
(88, 19, 87, 'df', '2018-01-16 13:44:00', '2018-01-12 13:44:43', 0, 'Selesai', 0, 0),
(89, 39, 91, 'P002', '2018-01-22 13:14:00', NULL, 1, 'Diantrikan', 0, 3),
(90, 50, 92, 'PA0004', '2018-01-23 13:15:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 4),
(91, 50, 93, 'PA0005', '2018-01-23 13:15:00', '0000-00-00 00:00:00', 2, 'Diantrikan', 0, 3),
(104, 53, 101, 'PA0013', '2018-01-25 18:00:00', '0000-00-00 00:00:00', 5, 'Diantrikan', 0, 3),
(93, 51, 89, 'PA001', '2018-01-24 10:00:00', NULL, 2, 'Diantrikan', 0, 3),
(94, 53, 0, '', '2018-01-25 18:00:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 0),
(95, 0, 96, 'PA0008', '2018-01-25 18:00:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 0),
(96, 41, 97, 'PA0009', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 3),
(97, 0, 98, 'PA0010', '2018-01-25 17:45:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 0),
(98, 54, 99, 'PA0011', '2018-01-25 17:45:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 4),
(99, 54, 100, 'PA0012', '2018-01-25 17:45:00', '0000-00-00 00:00:00', 2, 'Diantrikan', 0, 4),
(100, 54, 101, 'PA0013', '2018-01-25 17:45:00', '0000-00-00 00:00:00', 3, 'Diantrikan', 0, 4),
(101, 53, 101, 'PA0013', '2018-01-25 00:00:00', '0000-00-00 00:00:00', 2, 'Diantrikan', 0, 3),
(102, 53, 101, 'PA0013', '2018-01-25 18:00:00', '0000-00-00 00:00:00', 3, 'Diantrikan', 0, 3),
(103, 53, 101, 'PA0013', '2018-01-25 18:00:00', '0000-00-00 00:00:00', 4, 'Diantrikan', 0, 3),
(105, 53, 101, 'PA0013', '2018-01-25 18:00:00', '0000-00-00 00:00:00', 6, 'Diantrikan', 0, 3),
(106, 53, 0, '', '2018-01-25 18:00:00', '0000-00-00 00:00:00', 7, 'Diantrikan', 0, 3),
(107, 53, 95, 'PA0007', '2018-01-25 18:00:00', '0000-00-00 00:00:00', 8, 'Diantrikan', 0, 3),
(108, 54, 96, 'PA0008', '2018-01-25 17:45:00', '0000-00-00 00:00:00', 4, 'Diantrikan', 0, 4),
(109, 54, 96, 'PA0008', '2018-01-25 17:45:00', '0000-00-00 00:00:00', 5, 'Diantrikan', 0, 4),
(110, 54, 97, 'PA0009', '2018-01-25 17:45:00', '0000-00-00 00:00:00', 6, 'Diantrikan', 0, 4),
(111, 55, 93, 'PA0005', '2018-01-25 23:15:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 4),
(112, 41, 0, '', '2018-01-26 00:00:00', '0000-00-00 00:00:00', 2, 'Diantrikan', 0, 4),
(113, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 3, 'Diantrikan', 0, 4),
(114, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 4, 'Diantrikan', 0, 4),
(115, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 5, 'Diantrikan', 0, 4),
(116, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 6, 'Diantrikan', 0, 4),
(117, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 7, 'Diantrikan', 0, 4),
(118, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 8, 'Diantrikan', 0, 4),
(119, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 9, 'Diantrikan', 0, 4),
(120, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 10, 'Diantrikan', 0, 4),
(121, 41, 110, 'PA0022', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 11, 'Diantrikan', 0, 3),
(122, 41, 111, 'PA0023', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 12, 'Diantrikan', 0, 3),
(123, 46, 112, 'PA0024', '2018-01-30 00:00:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 3),
(124, 46, 113, 'PA0025', '2018-01-30 13:30:00', '0000-00-00 00:00:00', 2, 'Diantrikan', 0, 3),
(125, 41, 0, '', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 13, 'Diantrikan', 0, 3),
(126, 41, 93, 'PA0005', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 14, 'Diantrikan', 0, 3),
(127, 46, 89, 'PA0001', '2018-01-30 13:30:00', '0000-00-00 00:00:00', 3, 'Diantrikan', 0, 3),
(128, 37, 0, '', '2018-01-31 09:45:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 3),
(129, 37, 115, 'PA0027', '2018-01-31 09:45:00', '0000-00-00 00:00:00', 2, 'Diantrikan', 0, 3),
(130, 41, 116, 'PA0028', '2018-01-26 13:15:00', '0000-00-00 00:00:00', 15, 'Diantrikan', 0, 3),
(131, 46, 117, 'PA0029', '2018-01-30 13:30:00', '0000-00-00 00:00:00', 4, 'Diantrikan', 0, 3),
(132, 26, 101, '93', '2018-01-26 17:00:00', NULL, 1, 'Diantrikan', 0, 4),
(133, 37, 119, 'PA0031', '2018-01-31 09:45:00', '0000-00-00 00:00:00', 3, 'Diantrikan', 0, 4),
(134, 37, 120, 'PA0032', '2018-01-31 09:45:00', '0000-00-00 00:00:00', 4, 'Diantrikan', 0, 3),
(135, 37, 121, 'PA0033', '2018-01-31 09:45:00', '0000-00-00 00:00:00', 5, 'Diantrikan', 0, 4),
(136, 37, 92, 'PA0004', '2018-01-31 09:45:00', '0000-00-00 00:00:00', 6, 'Diantrikan', 0, 4),
(137, 37, 122, 'PA0034', '2018-01-31 09:45:00', '0000-00-00 00:00:00', 7, 'Diantrikan', 0, 4),
(138, 56, 123, 'PA0035', '2018-01-31 23:45:00', '0000-00-00 00:00:00', 1, 'Diantrikan', 0, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_jenis_pelayanan`
--

CREATE TABLE `m_jenis_pelayanan` (
  `pk` int(11) NOT NULL,
  `jenis_pelayanan` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_jenis_pelayanan`
--

INSERT INTO `m_jenis_pelayanan` (`pk`, `jenis_pelayanan`) VALUES
(1, 'Poli Spesialis'),
(2, 'Poli Umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kontak`
--

CREATE TABLE `m_kontak` (
  `pk` int(11) NOT NULL,
  `nomor_registrasi` varchar(15) DEFAULT NULL,
  `tanggal_registrasi` date DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `golongan_darah` varchar(5) DEFAULT NULL,
  `usia` int(3) DEFAULT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `nama_ibu_kandung` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `approved` varchar(20) NOT NULL,
  `status_login` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_kontak`
--

INSERT INTO `m_kontak` (`pk`, `nomor_registrasi`, `tanggal_registrasi`, `nomor_telepon`, `nama`, `alamat`, `kecamatan`, `kelurahan`, `kota`, `provinsi`, `golongan_darah`, `usia`, `jenis_kelamin`, `nama_ibu_kandung`, `username`, `password`, `email`, `approved`, `status_login`) VALUES
(1, '1', '2017-05-08', '085727663805', 'Admin', 'Jl Slamet Riyadi 26 A', 'Laweyan', 'Sriwedari', 'Surakarta', 'Jawa Tengah', 'A', 27, '', '', 'admin', 'admin', 'admin@amal_sehat.co.id', '', 'admin'),
(33, 'D000001', '2017-06-07', '-', 'dr. Soeharto, Sp.PD', '-', '-', '-', 'SOLO', '-', '', 0, '', '', 'soeharto', '123456', '-', '', 'dokter'),
(34, 'N000001', '2017-06-07', '-', 'Andhi Irawan, AMK', '-', '-', '-', '-', '-', '', 0, '', '', 'andhi', '123456', '-', '', 'perawat'),
(36, 'DR001', '2015-07-06', '0272-112233', 'dr. Test, SpB', 'Solo', '-', '-', '-', 'Jawa Tengah', 'O', 29, '', '', 'test', 'test', 'testing@gmail.com', '1', 'dokter'),
(40, 'PR001', '2015-11-16', '-', 'Perawat coba', 'Solobaru', '-', '-', 'Sukoharjo', 'Jawa Tengah', 'A', 25, '', '', 'coba', 'coba', '-', '1', 'perawat'),
(45, '06062017003', '2017-06-08', '9789789', 'dfgdfhfgh', 'gfhfghfh', 'fghfh', 'fghfh', 'fghfgh', 'fghfgh', 'B', 56, '', '', 'dokter1', 'dokter1', 'adi.pamungkas89@gmail.com', '1', 'dokter'),
(46, 'DR002', '0000-00-00', '-', 'dr. Coba, Sp.Rad', 'Sukoharjo', '-', '-', 'Sukoharjo', 'Jawa Tengah', 'B', 32, '', '', 'test1', 'test1', '-', '1', 'dokter'),
(48, 'DR004', '0000-00-00', '-', 'dr. Umum', 'Wonogiri', '', '', 'Wonofiri', 'Jawa Tengah', 'A', 33, '', '', 'test3', 'test3', '-', '1', 'dokter'),
(89, 'PA0001', '2018-01-15', '07654543534', 'yusuf', 'sumber', 'sumber', 'sumber', 'solo', 'jawa tengah', 'AB', 35, 'L', 'ibu', 'yusuf', 'yusuf', 'yusuf@staff', '1', 'pasien'),
(52, 'D000002', '2017-06-10', '-', 'dr. Suharto, Sp.PD', '-', '-', '-', '-', '-', '', 0, '', '', 'suharto', '123456', '-', '1', 'dokter'),
(53, 'D000003', '2017-06-10', '-', 'dr. Bambang Eko Wiyono, M.Kes.,Sp.OG', '-', '-', '-', '-', '-', '', 0, '', '', 'BAMBANG', '123456', '-', '1', 'dokter'),
(54, 'D000004', '2017-06-10', '-', 'dr. Cakra Bumi Wisnubrata.,Sp.OG', '-', '-', '-', '-', '-', '', 0, '', '', 'CAKRA', '123456', '-', '1', 'dokter'),
(55, 'D000005', '2017-06-10', '-', 'dr. Heru Wibowo Putro, Sp.M', '-', '-', '-', '-', '-', '', 0, '', '', 'HERU', '123456', '-', '1', 'dokter'),
(56, 'D000006', '2017-06-10', '-', 'dr. Ahmad Salimi Jauhari, Sp.OT', '-', '-', '-', '-', '-', '', 0, '', '', 'SALIMI', '123456', '-', '1', 'dokter'),
(57, 'D000007', '2017-06-10', '-', 'dr. Utama, Sp.B', '-', '-', '-', '-', '-', '', 0, '', '', 'UTAMA', '123456', '-', '1', 'dokter'),
(58, 'D000008', '2017-06-10', '-', 'dr. Yosie Arif Sanjaya, Sp. An', '-', '-', '-', '-', '-', '', 0, '', '', 'YOSIE', '123456', '-', '1', 'dokter'),
(59, 'D000009', '2017-06-10', '-', 'dr. Khairunisa Wardani, M.Sc. Sp. A', '-', '-', '-', '-', '-', '', 0, '', '', 'NISA', '123456', '-', '1', 'dokter'),
(60, 'D000010', '0000-00-00', '-', 'dr. Zustain Noor Adhim, M.Kes.,Sp.A', '-', '-', '-', '-', '-', '', 0, '', '', 'ZUSTAIN', '123456', '-', '1', 'dokter'),
(61, 'D000011', '0000-00-00', '-', 'dr. Misna Hati, Sp. S', '-', '-', '--', '-', '-', '', 0, '', '', 'MISNA', '123456', '-', '1', 'dokter'),
(62, 'D000012', '0000-00-00', '-', 'dr. Sukardjo, Sp. THT', '-', '-', '-', '-', '--', '', 0, '', '', 'SUKARDJO', '123456', '-', '1', 'dokter'),
(63, 'D000013', '0000-00-00', '-', 'dr. Diah Hayustiningsih, Sp. THT-KL', '-', '-', '-', '-', '-', '', 0, '', '', 'DIAH', '123456', '-', '1', 'dokter'),
(64, 'D000014', '0000-00-00', '-', 'dr. Endrawati Tri Bowo, M.Sc. Sp. Rad', '-', '-', '-', '-', '-', '', 0, '', '', 'ENDRA', '123456', '-', '1', 'dokter'),
(65, 'D000015', '0000-00-00', '-', 'dr. Iim Mariani Ulfa, M.Sc, Sp.PK', '-', '--', '-', '-', '-', '', 0, '', '', 'MARIANI', '123456', '-', '1', 'dokter'),
(66, 'D000016', '0000-00-00', '-', 'dr. Rosyid Ridlo, MMR', '-', '-', '-', '-', '-', '', 0, '', '', 'ROSYID', '123456', '-', '1', 'dokter'),
(67, 'D000017', '0000-00-00', '-', 'dr. Iis Lisnawati', '-', '-', '-', '-', '-', '', 0, '', '', 'LISNAWATI', '123456', '-', '1', 'dokter'),
(68, 'D000018', '0000-00-00', '-', 'dr. Silvy Tri Ambarwati', '-', '-', '-', '-', '-', '', 0, '', '', 'SILVY', '123456', '-', '1', 'dokter'),
(69, 'D000019', '0000-00-00', '-', 'dr. Saryana', '-', '-', '-', '-', '-', '', 0, '', '', 'SARYANA', '123456', '-', '1', 'dokter'),
(70, 'D000020', '0000-00-00', '-', 'dr. Bagus Aris Madani', '-', '-', '-', '-', '-', '', 0, '', '', 'BAGUS', '123456', '-', '1', 'dokter'),
(71, 'D000021', '0000-00-00', '-', 'dr. Novi Imam Persada', '-', '-', '-', '-', '-', '', 0, '', '', 'IMAM', '123456', '-', '1', 'dokter'),
(72, 'D000022', '0000-00-00', '-', 'dr. Ismi Ratnasari', '-', '-', '-', '-', '-', '', 0, '', '', 'ISMI', '123456', '-', '1', 'dokter'),
(73, 'D000023', '0000-00-00', '-', 'dr. Mohamad Basroni', '-', '-', '-', '-', '-', '', 0, '', '', 'BASRONI', '123456', '-', '1', 'dokter'),
(74, 'D000024', '0000-00-00', '-', 'dr. Dian Kartika Sari', '-', '-', '-', '-', '-', '', 0, '', '', 'DIAN', '123456', '-', '1', 'dokter'),
(75, 'D000025', '0000-00-00', '-', 'dr. Amalia Primayanti', '-', '-', '-', '-', '-', '', 0, '', '', 'AMALIA', '123456', '-', '1', 'dokter'),
(76, 'D000026', '0000-00-00', '-', 'dr. Hafriliantika Ramadhani', '-', '-', '-', '-', '-', '', 0, '', '', 'HAFRILIANTIKA', '123456', '-', '1', 'dokter'),
(77, 'D000027', '0000-00-00', '-', 'dr. Asih Novea Krediastuti', '-', '-', '-', '-', '-', '', 0, '', '', 'NOVEA', '123456', '-', '1', 'dokter'),
(78, 'D000028', '0000-00-00', '-', 'dr. Wildan Syamsudin Fahmi', '-', '-', '-', '-', '-', '', 0, '', '', 'WILDAN', '123456', '-', '1', 'dokter'),
(79, 'D000029', '0000-00-00', '-', 'dr. Rizky Mukti Sejati', '-', '-', '-', '-', '-', '', 0, '', '', 'RIZKY', '123456', '-', '1', 'dokter'),
(80, 'D000030', '0000-00-00', '-', 'dr. Netta Titisari Januar', '-', '-', '-', '-', '-', '', 0, '', '', 'NETTA', '123456', '-', '1', 'dokter'),
(81, 'D000031', '0000-00-00', '-', 'drg. Muchammad Machi', '-', '-', '-', '-', '-', '', 0, '', '', 'MACHI', '123456', '-', '1', 'dokter'),
(82, 'D000032', '0000-00-00', '-', 'drg. Nur Eliyati Rahmah ', '-', '-', '-', '-', '-', '', 0, '', '', 'RAHMAH', '123456', '-', '1', 'dokter'),
(83, 'd000121', '2013-07-01', '08387654311', 'dr. Amal Sehat, Sp.Pd', 'ngerjopuro', 'slogohimo', 'slogohimo', 'wonogiri', 'jawa tengah', 'A', 40, '', '', 'dokter_ganteng', '123456', 'email_coba@yahoo.co.id', '1', 'dokter'),
(84, 'PR0004', '2016-01-01', '08386434520', 'perawat ganteng banget', 'Jl. Ngerjopuro RT.01 RW.02', 'Slogohimo', 'Slogohimo', 'Wonogiri', 'Jawa Tengah', 'O', 30, '', '', 'perawat_ganteng', '123456', 'mas_udi89@yahoo.co.id', '1', 'perawat'),
(91, 'PA0003', '0000-00-00', '', 'MUHAMMAD HENDRA NAILUL HAQQ', 'JALAN PELITA 3 JENGGOT', NULL, NULL, NULL, NULL, NULL, 20, 'L', 'IBU', '', '', NULL, '1', 'pasien'),
(92, 'PA0004', '2018-01-23', '081081081081', 'PASIEN 10', 'JALAN PELITA 3 JENGGOT', NULL, NULL, NULL, NULL, NULL, 20, 'L', 'IBU PASIEN', 'PA0004', 'PA0004', NULL, '1', 'pasien'),
(93, 'PA0005', '2018-01-23', '081081081081', 'PASIEN 11', 'JALAN PISANG', NULL, NULL, NULL, NULL, NULL, 25, 'L', 'IBU PASIEN', 'PA0005', 'PA0005', NULL, '1', 'pasien'),
(94, 'PA0006', '2018-01-24', '081234567890', 'PASIEN 12', 'JALAN PISANG', NULL, NULL, NULL, NULL, NULL, 25, 'L', 'IBU PASIEN 12', 'PA0006', 'PA0006', NULL, '1', 'pasien'),
(95, 'PA0007', '2018-01-25', '081234567890', 'PASIEN 13', 'JALAN PISANG', NULL, NULL, NULL, NULL, NULL, 25, 'L', 'IBU PASIEN 12', 'PA0007', 'PA0007', NULL, '1', 'pasien'),
(96, 'PA0008', '2018-01-25', '081234567890', 'PASIEN 14', 'JALAN PISANG', NULL, NULL, NULL, NULL, NULL, 75, 'L', 'IBU PASIEN 14', 'PA0008', 'PA0008', NULL, '1', 'pasien'),
(97, 'PA0009', '2018-01-25', '081081081081', 'PASIEN 18', 'JALAN PISANG', NULL, NULL, NULL, NULL, NULL, 56, 'P', 'IBU PASIEN 17', 'PA0009', 'PA0009', NULL, '1', 'pasien'),
(98, 'PA0010', '2018-01-25', '088888888880', 'PASIEN 23', 'JALAN JERUK', NULL, NULL, NULL, NULL, NULL, 42, 'P', 'IBU PASIEN 23', 'PA0010', 'PA0010', NULL, '1', 'pasien'),
(99, 'PA0011', '2018-01-25', '081234567890', 'PASIEN 24', 'JALAN JERUK', NULL, NULL, NULL, NULL, NULL, 42, 'P', 'IBU PASIEN 24', 'PA0011', 'PA0011', NULL, '1', 'pasien'),
(100, 'PA0012', '2018-01-25', '081234567890', 'PASIEN 25', 'JALAN JERUK', NULL, NULL, NULL, NULL, NULL, 42, 'P', 'IBU PASIEN 25', 'PA0012', 'PA0012', NULL, '1', 'pasien'),
(101, 'PA0013', '2018-01-25', '081234567890', 'PASIEN 26', 'JALAN JERUK', NULL, NULL, NULL, NULL, NULL, 38, 'P', 'IBU PASIEN 26', 'PA0013', 'PA0013', NULL, '1', 'pasien'),
(102, 'PA0014', '2018-01-25', '081234567890', 'PASIEN 27', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 7, 'P', 'IBU PASIEN 27', 'PA0014', 'PA0014', NULL, '1', 'pasien'),
(103, 'PA0015', '2018-01-25', '081234567890', 'PASIEN 28', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 7, 'P', 'IBU PASIEN 28', 'PA0015', 'PA0015', NULL, '1', 'pasien'),
(104, 'PA0016', '2018-01-25', '081234567890', 'PASIEN 29', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 7, 'P', 'IBU PASIEN 29', 'PA0016', 'PA0016', NULL, '1', 'pasien'),
(105, 'PA0017', '2018-01-25', '089876543210', 'PASIEN 30', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 6, 'P', 'IBU PASIEN 30', 'PA0017', 'PA0017', NULL, '1', 'pasien'),
(106, 'PA0018', '2018-01-25', '081234567890', 'PASIEN 31', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 6, 'P', 'IBU PASIEN 31', 'PA0018', 'PA0018', NULL, '1', 'pasien'),
(107, 'PA0019', '2018-01-26', '081234567890', 'PASIEN 32', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 6, 'P', 'IBU PASIEN 32', 'PA0019', 'PA0019', NULL, '1', 'pasien'),
(108, 'PA0020', '2018-01-26', '081081081081', 'PASIEN 33', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 8, 'P', 'IBU PASIEN 33', 'PA0020', 'PA0020', NULL, '1', 'pasien'),
(109, 'PA0021', '2018-01-26', '089876543210', 'PASIEN 34', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 8, 'P', 'IBU PASIEN 34', 'PA0021', 'PA0021', NULL, '1', 'pasien'),
(110, 'PA0022', '2018-01-26', '081081081081', 'PASIEN 35', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 8, 'P', 'IBU PASIEN 35', 'PA0022', 'PA0022', NULL, '1', 'pasien'),
(111, 'PA0023', '2018-01-26', '088888888880', 'PASIEN 36', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 8, 'P', 'IBU PASIEN 36', 'PA0023', 'PA0023', NULL, '1', 'pasien'),
(112, 'PA0024', '2018-01-26', '089876543210', 'PASIEN 37', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 15, 'P', 'IBU PASIEN 37', 'PA0024', 'PA0024', NULL, '1', 'pasien'),
(113, 'PA0025', '2018-01-26', '081234567890', 'PASIEN 38', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 15, 'P', 'IBU PASIEN 38', 'PA0025', 'PA0025', NULL, '1', 'pasien'),
(114, 'PA0026', '2018-01-26', '081081081081', 'PASIEN 39', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 15, 'P', 'IBU PASIEN 39', 'PA0026', 'PA0026', NULL, '1', 'pasien'),
(115, 'PA0027', '2018-01-26', '088888888880', 'PASIEN 40', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 15, 'P', 'IBU PASIEN 40', 'PA0027', 'PA0027', NULL, '1', 'pasien'),
(116, 'PA0028', '2018-01-26', '081234567890', 'PASIEN 41', 'JALAN NANGKA', NULL, NULL, NULL, NULL, NULL, 15, 'P', 'IBU PASIEN 41', 'PA0028', 'PA0028', NULL, '1', 'pasien'),
(117, 'PA0029', '2018-01-26', '081234567890', 'PASIEN 43 YUSUF BUDI KURNIAWAN', 'JALAN NANGKA JERUK PISANG KELURAHAN DUREN KOTA NAGA INDONESIA', NULL, NULL, NULL, NULL, NULL, 15, 'P', 'IBU PASIEN 43', 'PA0029', 'PA0029', NULL, '1', 'pasien'),
(118, 'PA0030', '0000-00-00', '081987123656', 'aa', '', '', '', '', '', 'O', 0, 'L', 'xx', 'pa0030', 'pa0030', 'a@a.a', '1', 'pasien'),
(119, 'PA0031', '2018-01-29', '+6285725093955', 'YUSUF BUDI', 'JALAN PAJAJARAN 2', NULL, NULL, NULL, NULL, NULL, 20, 'L', 'IBUNYA YUSUF', 'PA0031', 'PA0031', NULL, '1', 'pasien'),
(120, 'PA0032', '2018-01-29', '+6285725093955', 'YUSUF BUDI', 'JALAN PAJAJARAN 2', NULL, NULL, NULL, NULL, NULL, 20, 'L', 'IBUNYA YUSUF', 'PA0032', 'PA0032', NULL, '1', 'pasien'),
(121, 'PA0033', '2018-01-29', '+6285725093955', 'YUSUF BUDI KURNIAWAN', 'JALAN PAJAJARAN 2 NOMOR 20 A / 25 RT 5 RW 11 KELURAHAN SUMBER KECAMATAN BANJARSARI SURAKARTA', NULL, NULL, NULL, NULL, NULL, 20, 'L', 'IBUNYA YUSUF BUDI KURNIAWAN', 'PA0033', 'PA0033', NULL, '1', 'pasien'),
(122, 'PA0034', '2018-01-29', '+6285725093955', 'YUSUF BARU', 'JALAN PAJAJARAN 2', NULL, NULL, NULL, NULL, NULL, 20, 'L', 'IBUNYA YUSUF', 'PA0034', 'PA0034', NULL, '1', 'pasien'),
(123, 'PA0035', '2018-01-31', '085602007066', 'YUSUF 100', 'JALAN PAJAJARAN 2', NULL, NULL, NULL, NULL, NULL, 20, 'L', 'IBUNYA YUSUF 100', 'PA0035', 'PA0035', NULL, '1', 'pasien');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_metode_pembayaran`
--

CREATE TABLE `m_metode_pembayaran` (
  `pk` int(10) NOT NULL,
  `metode_bayar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_metode_pembayaran`
--

INSERT INTO `m_metode_pembayaran` (`pk`, `metode_bayar`) VALUES
(3, 'Asuransi'),
(4, 'BPJS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_pelayanan`
--

CREATE TABLE `m_pelayanan` (
  `pk` int(11) NOT NULL,
  `nama_pelayanan` varchar(100) DEFAULT NULL,
  `id_pelayanan` varchar(25) DEFAULT NULL,
  `deskripsi_pelayanan` varchar(200) DEFAULT NULL,
  `image_pelayanan_head` varchar(70) DEFAULT NULL,
  `image_pelayanan_foot` varchar(70) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `jenis_pelayanan_fk` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_pelayanan`
--

INSERT INTO `m_pelayanan` (`pk`, `nama_pelayanan`, `id_pelayanan`, `deskripsi_pelayanan`, `image_pelayanan_head`, `image_pelayanan_foot`, `image`, `jenis_pelayanan_fk`) VALUES
(26, 'Poliklinik Spesialis Urologi', 'S000007', '', NULL, NULL, '', 1),
(25, 'Poliklinik Spesialis Mata', 'S000006', '', NULL, NULL, '', 1),
(31, 'Poli spesialis Syaraf', 'SPSYRF', 'Pemeriksaan dokter spesialis syaraf', NULL, NULL, 'kerala-home-design-house-plans-indian-budget-models-small-in_house-plan-3d-model_home-decor_modern-h', 1),
(21, 'Poliklinik Spesialis Penyakit Dalam', 'S000002', '', NULL, NULL, '', 1),
(22, 'Poliklinik Spesialis Obstetri Ginekologi', 'S000003', '', NULL, NULL, '', 1),
(23, 'Poliklinik Spesialis Anak', 'S000004', '', NULL, NULL, '', 1),
(17, 'Radiologi', 'RD01', '', NULL, NULL, 'rs12.png', 2),
(15, 'Poli Umum', 'KL01', '', NULL, NULL, 'rs41.png', 2),
(14, 'Klinik Bedah', 'KL02', '', NULL, NULL, 'rs3.png', 1),
(24, 'Poliklinik Spesialis THT', 'S000005', '', NULL, NULL, '', 1),
(20, 'Klinik Obsgyn', 'KL03', '', NULL, NULL, 'rs42.png', 2),
(27, 'Poliklinik Spesialis Bedah Umum', 'S000008', '', NULL, NULL, '', 1),
(28, 'Poliklinik Spesialis Radiologi', 'S000009', '', NULL, NULL, '', 1),
(29, 'Poliklinik Spesialis Orthopedi', 'S000010', '', NULL, NULL, '', 1),
(30, 'Poliklinik Gigi dan Mulut', 'S000011', '', NULL, NULL, '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_perawat_pelayanan`
--

CREATE TABLE `m_perawat_pelayanan` (
  `pk_perawat_pelayanan` int(11) NOT NULL,
  `perawat_fk` int(11) NOT NULL,
  `pelayanan_fk` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_perawat_pelayanan`
--

INSERT INTO `m_perawat_pelayanan` (`pk_perawat_pelayanan`, `perawat_fk`, `pelayanan_fk`) VALUES
(1, 6, 1),
(2, 6, 3),
(3, 12, 2),
(4, 12, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `outbox`
--

CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `outbox`
--

INSERT INTO `outbox` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `SendBefore`, `SendAfter`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `Class`, `TextDecoded`, `ID`, `MultiPart`, `RelativeValidity`, `SenderID`, `SendingTimeOut`, `DeliveryReport`, `CreatorID`) VALUES
('2018-02-01 02:50:36', '2018-02-01 02:50:36', '2018-02-01 02:50:36', '23:59:59', '00:00:00', NULL, '081234567890', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 35, 'false', -1, NULL, '2018-02-01 02:50:36', 'default', 'Gammu'),
('2018-02-01 02:04:32', '2018-02-01 02:04:32', '2018-02-01 02:04:32', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 31, 'false', -1, NULL, '2018-02-01 02:04:32', 'default', 'Gammu'),
('2018-02-01 02:11:33', '2018-02-01 02:11:33', '2018-02-01 02:11:33', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 32, 'false', -1, NULL, '2018-02-01 02:11:33', 'default', 'Gammu'),
('2018-02-01 02:22:57', '2018-02-01 02:22:57', '2018-02-01 02:22:57', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 33, 'false', -1, NULL, '2018-02-01 02:22:57', 'default', 'Gammu'),
('2018-02-01 02:49:29', '2018-02-01 02:49:29', '2018-02-01 02:49:29', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 34, 'false', -1, NULL, '2018-02-01 02:49:29', 'default', 'Gammu'),
('2018-02-01 02:01:41', '2018-02-01 02:01:41', '2018-02-01 02:01:41', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 30, 'false', -1, NULL, '2018-02-01 02:01:41', 'default', 'Gammu'),
('2018-01-31 09:01:32', '2018-01-31 09:01:32', '2018-01-31 09:01:32', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', '050003A70201', -1, 'YUSUF 100 - PA0035 - 2018-01-31 - 23:45:00 - No Urut : 1 - dr. Soeharto, Sp.PD - USERNAME : PA0035 - PASSWORD : PA0035 - SELAMAT ANDA TELAH TERDAFTAR SEB', 29, 'true', -1, NULL, '2018-01-31 09:01:32', 'default', 'Gammu'),
('2018-01-31 08:59:26', '2018-01-31 08:59:26', '2018-01-31 08:59:26', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Jenis Kelamin WANITA tidak tidak diketahui, pastikan jenis kelamin L atau P.', 27, 'false', -1, NULL, '2018-01-31 08:59:26', 'default', 'Gammu'),
('2018-01-31 09:00:38', '2018-01-31 09:00:38', '2018-01-31 09:00:38', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tanggal yang ada masukkan salah, pastikan format tanggal benar (hari-bulan-tahun) atau cek kembali tanggal anda', 28, 'false', -1, NULL, '2018-01-31 09:00:38', 'default', 'Gammu'),
('2018-02-01 02:54:35', '2018-02-01 02:54:35', '2018-02-01 02:54:35', '23:59:59', '00:00:00', NULL, '0433', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 36, 'false', -1, NULL, '2018-02-01 02:54:35', 'default', 'Gammu'),
('2018-02-01 03:01:01', '2018-02-01 03:01:01', '2018-02-01 03:01:01', '23:59:59', '00:00:00', NULL, '087', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 37, 'false', -1, NULL, '2018-02-01 03:01:01', 'default', 'Gammu'),
('2018-02-01 03:02:15', '2018-02-01 03:02:15', '2018-02-01 03:02:15', '23:59:59', '00:00:00', NULL, '098765', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 38, 'false', -1, NULL, '2018-02-01 03:02:15', 'default', 'Gammu'),
('2018-02-01 06:55:26', '2018-02-01 06:55:26', '2018-02-01 06:55:26', '23:59:59', '00:00:00', NULL, '', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 39, 'false', -1, NULL, '2018-02-01 06:55:26', 'default', 'Gammu'),
('2018-02-01 06:55:26', '2018-02-01 06:55:26', '2018-02-01 06:55:26', '23:59:59', '00:00:00', NULL, '09765', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 40, 'false', -1, NULL, '2018-02-01 06:55:26', 'default', 'Gammu'),
('2018-02-01 06:55:26', '2018-02-01 06:55:26', '2018-02-01 06:55:26', '23:59:59', '00:00:00', NULL, '00008', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 41, 'false', -1, NULL, '2018-02-01 06:55:26', 'default', 'Gammu'),
('2018-02-01 06:55:26', '2018-02-01 06:55:26', '2018-02-01 06:55:26', '23:59:59', '00:00:00', NULL, '98765', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 42, 'false', -1, NULL, '2018-02-01 06:55:26', 'default', 'Gammu'),
('2018-02-01 06:55:26', '2018-02-01 06:55:26', '2018-02-01 06:55:26', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 43, 'false', -1, NULL, '2018-02-01 06:55:26', 'default', 'Gammu'),
('2018-02-01 06:55:26', '2018-02-01 06:55:26', '2018-02-01 06:55:26', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 44, 'false', -1, NULL, '2018-02-01 06:55:26', 'default', 'Gammu'),
('2018-02-01 07:28:30', '2018-02-01 07:28:30', '2018-02-01 07:28:30', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 45, 'false', -1, NULL, '2018-02-01 07:28:30', 'default', 'Gammu'),
('2018-02-02 04:37:28', '2018-02-02 04:37:28', '2018-02-02 04:37:28', '23:59:59', '00:00:00', NULL, '085602007066', 'Default_No_Compression', NULL, -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 46, 'false', -1, NULL, '2018-02-02 04:37:28', 'default', 'Gammu');

--
-- Trigger `outbox`
--
DELIMITER $$
CREATE TRIGGER `outbox_timestamp` BEFORE INSERT ON `outbox` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingTimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.SendingTimeOut = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `outbox_multipart`
--

CREATE TABLE `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `outbox_multipart`
--

INSERT INTO `outbox_multipart` (`Text`, `Coding`, `UDH`, `Class`, `TextDecoded`, `ID`, `SequencePosition`) VALUES
(NULL, 'Default_No_Compression', '050003A70202', -1, 'AGAI PASIEN KLINIK BEDAH DI RUMAH SAKIT AMAL SEHAT', 29, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `phones`
--

CREATE TABLE `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '-1',
  `Signal` int(11) NOT NULL DEFAULT '-1',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `phones`
--

INSERT INTO `phones` (`ID`, `UpdatedInDB`, `InsertIntoDB`, `TimeOut`, `Send`, `Receive`, `IMEI`, `Client`, `Battery`, `Signal`, `Sent`, `Received`) VALUES
('', '2018-01-29 09:36:17', '2018-01-29 04:55:33', '2018-01-29 09:36:27', 'yes', 'yes', '354058181016853', 'Gammu 1.31.0, Windows Server 2007, GCC 4.6, MinGW 3.11', 0, 87, 31, 24);

--
-- Trigger `phones`
--
DELIMITER $$
CREATE TRIGGER `phones_timestamp` BEFORE INSERT ON `phones` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.TimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.TimeOut = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sentitems`
--

CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sentitems`
--

INSERT INTO `sentitems` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `DeliveryDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `SenderID`, `SequencePosition`, `Status`, `StatusError`, `TPMR`, `RelativeValidity`, `CreatorID`) VALUES
('2018-01-29 04:55:44', '2018-01-29 04:55:37', '2018-01-29 04:55:44', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285724701668', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 1, '', 1, 'SendingOKNoReport', -1, 15, 255, 'Gammu'),
('2018-01-29 04:55:49', '2018-01-29 04:55:41', '2018-01-29 04:55:49', NULL, '00590055005300550046002000420055004400490020002D00200050004100300030003300310020002D00200032003000310038002D00300031002D003300310020002D002000300039003A00340035003A003000300020002D0020004E006F002000550072007500740020003A002000330020002D002000640072002E002000410068006D00610064002000530061006C0069006D00690020004A006100750068006100720069002C002000530070002E004F00540020002D00200055005300450052004E0041004D00450020003A00200050004100300030003300310020002D002000500041005300530057004F005200440020003A00200050004100300030003300310020002D002000530045004C0041004D0041005400200041004E00440041002000540045004C004100480020', '+6285725093955', 'Default_No_Compression', '050003A70201', '+62816124', -1, 'YUSUF BUDI - PA0031 - 2018-01-31 - 09:45:00 - No Urut : 3 - dr. Ahmad Salimi Jauhari, Sp.OT - USERNAME : PA0031 - PASSWORD : PA0031 - SELAMAT ANDA TELAH ', 2, '', 1, 'SendingOKNoReport', -1, 16, 255, 'Gammu'),
('2018-01-29 04:55:52', '2018-01-29 04:55:41', '2018-01-29 04:55:52', NULL, '00540045005200440041004600540041005200200053004500420041004700410049002000500041005300490045004E00200050004F004C00490020005300500045005300490041004C004900530020005300590041005200410046002000440049002000520055004D00410048002000530041004B0049005400200041004D0041004C002000530045004800410054', '+6285725093955', 'Default_No_Compression', '050003A70202', '+62816124', -1, 'TERDAFTAR SEBAGAI PASIEN POLI SPESIALIS SYARAF DI RUMAH SAKIT AMAL SEHAT', 2, '', 2, 'SendingOKNoReport', -1, 17, 255, 'Gammu'),
('2018-01-29 04:55:58', '2018-01-29 04:55:41', '2018-01-29 04:55:58', NULL, '00590055005300550046002000420055004400490020002D00200050004100300030003300320020002D00200032003000310038002D00300031002D003300310020002D002000300039003A00340035003A003000300020002D0020004E006F002000550072007500740020003A002000340020002D002000640072002E002000410068006D00610064002000530061006C0069006D00690020004A006100750068006100720069002C002000530070002E004F00540020002D00200055005300450052004E0041004D00450020003A00200050004100300030003300320020002D002000500041005300530057004F005200440020003A00200050004100300030003300320020002D002000530045004C0041004D0041005400200041004E00440041002000540045004C004100480020', '+6285725093955', 'Default_No_Compression', '050003A70201', '+62816124', -1, 'YUSUF BUDI - PA0032 - 2018-01-31 - 09:45:00 - No Urut : 4 - dr. Ahmad Salimi Jauhari, Sp.OT - USERNAME : PA0032 - PASSWORD : PA0032 - SELAMAT ANDA TELAH ', 3, '', 1, 'SendingOKNoReport', -1, 18, 255, 'Gammu'),
('2018-01-29 04:56:01', '2018-01-29 04:55:41', '2018-01-29 04:56:01', NULL, '00540045005200440041004600540041005200200053004500420041004700410049002000500041005300490045004E00200050004F004C00490020005300500045005300490041004C004900530020005300590041005200410046002000440049002000520055004D00410048002000530041004B0049005400200041004D0041004C002000530045004800410054', '+6285725093955', 'Default_No_Compression', '050003A70202', '+62816124', -1, 'TERDAFTAR SEBAGAI PASIEN POLI SPESIALIS SYARAF DI RUMAH SAKIT AMAL SEHAT', 3, '', 2, 'SendingOKNoReport', -1, 19, 255, 'Gammu'),
('2018-01-29 04:56:05', '2018-01-29 04:55:41', '2018-01-29 04:56:05', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 4, '', 1, 'SendingOKNoReport', -1, 20, 255, 'Gammu'),
('2018-01-29 04:58:41', '2018-01-29 04:58:32', '2018-01-29 04:58:41', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 5, '', 1, 'SendingOKNoReport', -1, 21, 255, 'Gammu'),
('2018-01-29 06:04:17', '2018-01-29 06:03:47', '2018-01-29 06:04:17', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 7, '', 1, 'SendingOKNoReport', -1, 22, 255, 'Gammu'),
('2018-01-29 06:04:21', '2018-01-29 06:03:47', '2018-01-29 06:04:21', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 6, '', 1, 'SendingOKNoReport', -1, 23, 255, 'Gammu'),
('2018-01-29 06:04:25', '2018-01-29 06:03:49', '2018-01-29 06:04:25', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 9, '', 1, 'SendingOKNoReport', -1, 24, 255, 'Gammu'),
('2018-01-29 06:04:29', '2018-01-29 06:03:49', '2018-01-29 06:04:29', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 8, '', 1, 'SendingOKNoReport', -1, 25, 255, 'Gammu'),
('2018-01-29 06:04:33', '2018-01-29 06:03:51', '2018-01-29 06:04:33', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 10, '', 1, 'SendingOKNoReport', -1, 26, 255, 'Gammu'),
('2018-01-29 06:04:37', '2018-01-29 06:03:51', '2018-01-29 06:04:37', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 11, '', 1, 'SendingOKNoReport', -1, 27, 255, 'Gammu'),
('2018-01-29 06:04:41', '2018-01-29 06:03:55', '2018-01-29 06:04:41', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 12, '', 1, 'SendingOKNoReport', -1, 28, 255, 'Gammu'),
('2018-01-29 06:04:45', '2018-01-29 06:03:55', '2018-01-29 06:04:45', NULL, '005400690070006500200070006500730061006E00200074006900640061006B002000640069006B00650074006100680075006900200061007400610075002000700065006E0075006C006900730061006E002000730061006C006100680020002C002000700061007300740069006B0061006E00200066006F0072006D0061007400200070006500730061006E002000620065006E00610072002000280042004100520055002F004C0041004D0041002F0049004E0046004F00200050004F004C00490029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)', 13, '', 1, 'SendingOKNoReport', -1, 29, 255, 'Gammu'),
('2018-01-29 06:04:50', '2018-01-29 06:03:59', '2018-01-29 06:04:50', NULL, '00590055005300550046002000420055004400490020004B00550052004E0049004100570041004E0020002D00200050004100300030003300330020002D00200032003000310038002D00300031002D003300310020002D002000300039003A00340035003A003000300020002D0020004E006F002000550072007500740020003A002000350020002D002000640072002E002000410068006D00610064002000530061006C0069006D00690020004A006100750068006100720069002C002000530070002E004F00540020002D00200055005300450052004E0041004D00450020003A00200050004100300030003300330020002D002000500041005300530057004F005200440020003A00200050004100300030003300330020002D002000530045004C0041004D0041005400200041', '+6285725093955', 'Default_No_Compression', '050003A70201', '+62816124', -1, 'YUSUF BUDI KURNIAWAN - PA0033 - 2018-01-31 - 09:45:00 - No Urut : 5 - dr. Ahmad Salimi Jauhari, Sp.OT - USERNAME : PA0033 - PASSWORD : PA0033 - SELAMAT A', 14, '', 1, 'SendingOKNoReport', -1, 30, 255, 'Gammu'),
('2018-01-29 06:04:53', '2018-01-29 06:03:59', '2018-01-29 06:04:53', NULL, '004E00440041002000540045004C00410048002000540045005200440041004600540041005200200053004500420041004700410049002000500041005300490045004E00200050004F004C00490020005300500045005300490041004C004900530020005300590041005200410046002000440049002000520055004D00410048002000530041004B0049005400200041004D0041004C002000530045004800410054', '+6285725093955', 'Default_No_Compression', '050003A70202', '+62816124', -1, 'NDA TELAH TERDAFTAR SEBAGAI PASIEN POLI SPESIALIS SYARAF DI RUMAH SAKIT AMAL SEHAT', 14, '', 2, 'SendingOKNoReport', -1, 31, 255, 'Gammu'),
('2018-01-29 06:06:29', '2018-01-29 06:06:07', '2018-01-29 06:06:29', NULL, '0028002000300039003A00340035003A0030003000200020002D002000200032003000310038002D00300031002D0033003100200020002D002000200050006F006C00690020007300700065007300690061006C00690073002000530079006100720061006600200020002D0020002000640072002E002000410068006D00610064002000530061006C0069006D00690020004A006100750068006100720069002C002000530070002E004F005400200029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, '( 09:45:00  -  2018-01-31  -  Poli spesialis Syaraf  -  dr. Ahmad Salimi Jauhari, Sp.OT )', 15, '', 1, 'SendingOKNoReport', -1, 32, 255, 'Gammu'),
('2018-01-29 06:07:35', '2018-01-29 06:07:03', '2018-01-29 06:07:35', NULL, '0028002000300039003A00340035003A0030003000200020002D002000200032003000310038002D00300031002D0033003100200020002D002000200050006F006C00690020007300700065007300690061006C00690073002000530079006100720061006600200020002D0020002000640072002E002000410068006D00610064002000530061006C0069006D00690020004A006100750068006100720069002C002000530070002E004F005400200029', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, '( 09:45:00  -  2018-01-31  -  Poli spesialis Syaraf  -  dr. Ahmad Salimi Jauhari, Sp.OT )', 16, '', 1, 'SendingOKNoReport', -1, 33, 255, 'Gammu'),
('2018-01-29 06:12:12', '2018-01-29 06:11:40', '2018-01-29 06:12:12', NULL, '00500041005300490045004E0020003100300020002D00200050004100300030003000340020002D00200032003000310038002D00300031002D003300310020002D002000300039003A00340035003A003000300020002D0020004E006F002000550072007500740020003A002000310020002D002000640072002E002000410068006D00610064002000530061006C0069006D00690020004A006100750068006100720069002C002000530070002E004F00540020002D002000530045004C0041004D0041005400200041004E00440041002000540045004C00410048002000540045005200440041004600540041005200200053004500420041004700410049002000500041005300490045004E00200050004F004C00490020005300500045005300490041004C0049005300200053', '+6285725093955', 'Default_No_Compression', '050003A70201', '+62816124', -1, 'PASIEN 10 - PA0004 - 2018-01-31 - 09:45:00 - No Urut : 1 - dr. Ahmad Salimi Jauhari, Sp.OT - SELAMAT ANDA TELAH TERDAFTAR SEBAGAI PASIEN POLI SPESIALIS S', 17, '', 1, 'SendingOKNoReport', -1, 34, 255, 'Gammu'),
('2018-01-29 06:12:14', '2018-01-29 06:11:40', '2018-01-29 06:12:14', NULL, '00590041005200410046002000440049002000520055004D00410048002000530041004B0049005400200041004D0041004C002000530045004800410054', '+6285725093955', 'Default_No_Compression', '050003A70202', '+62816124', -1, 'YARAF DI RUMAH SAKIT AMAL SEHAT', 17, '', 2, 'SendingOKNoReport', -1, 35, 255, 'Gammu'),
('2018-01-29 07:30:20', '2018-01-29 07:29:54', '2018-01-29 07:30:20', NULL, '00540061006E006700670061006C002000790061006E006700200061006400610020006D006100730075006B006B0061006E002000730061006C00610068002C002000700061007300740069006B0061006E00200066006F0072006D00610074002000740061006E006700670061006C002000620065006E00610072002000280068006100720069002D00620075006C0061006E002D0074006100680075006E002900200061007400610075002000630065006B0020006B0065006D00620061006C0069002000740061006E006700670061006C00200061006E00640061', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tanggal yang ada masukkan salah, pastikan format tanggal benar (hari-bulan-tahun) atau cek kembali tanggal anda', 18, '', 1, 'SendingOKNoReport', -1, 36, 255, 'Gammu'),
('2018-01-29 07:35:26', '2018-01-29 07:35:20', '2018-01-29 07:35:26', NULL, '004E006F006D006F00720020007200650067006900730074007200610073006900200061006E00640061002000620065006C0075006D0020007400650072006400610066007400610072002C00200063006F00620061002000630065006B0020006B0065006D00620061006C00690020006E006F006D006F00720020007200650067006900730074007200610073006900200061006E00640061002E', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Nomor registrasi anda belum terdaftar, coba cek kembali nomor registrasi anda.', 19, '', 1, 'SendingOKNoReport', -1, 37, 255, 'Gammu'),
('2018-01-29 07:40:32', '2018-01-29 07:40:01', '2018-01-29 07:40:32', NULL, '0046006F0072006D00610074002000700065006E0075006C006900730061006E00200070006500730061006E002000700061007300690065006E0020006C0061006D006100200061006E00640061002000730061006C00610068002000610074006100750020006B007500720061006E0067002C002000630065006B0020006B0065006D00620061006C006900200066006F0072006D0061007400200070006500730061006E00200061006E00640061002E', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Format penulisan pesan pasien lama anda salah atau kurang, cek kembali format pesan anda.', 20, '', 1, 'SendingOKNoReport', -1, 38, 255, 'Gammu'),
('2018-01-29 07:42:38', '2018-01-29 07:42:29', '2018-01-29 07:42:38', NULL, '0046006F0072006D00610074002000700065006E0075006C006900730061006E00200070006500730061006E002000700061007300690065006E0020006200610072007500200061006E00640061002000730061006C00610068002000610074006100750020006B007500720061006E0067002C002000630065006B0020006B0065006D00620061006C006900200066006F0072006D0061007400200070006500730061006E00200061006E00640061002E', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Format penulisan pesan pasien baru anda salah atau kurang, cek kembali format pesan anda.', 21, '', 1, 'SendingOKNoReport', -1, 39, 255, 'Gammu'),
('2018-01-29 07:48:17', '2018-01-29 07:47:51', '2018-01-29 07:48:17', NULL, '00540061006E006700670061006C002000790061006E006700200061006400610020006D006100730075006B006B0061006E002000730061006C00610068002C002000700061007300740069006B0061006E00200066006F0072006D00610074002000740061006E006700670061006C002000620065006E00610072002000280068006100720069002D00620075006C0061006E002D0074006100680075006E002900200061007400610075002000630065006B0020006B0065006D00620061006C0069002000740061006E006700670061006C00200061006E00640061', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Tanggal yang ada masukkan salah, pastikan format tanggal benar (hari-bulan-tahun) atau cek kembali tanggal anda', 22, '', 1, 'SendingOKNoReport', -1, 40, 255, 'Gammu'),
('2018-01-29 07:49:53', '2018-01-29 07:49:25', '2018-01-29 07:49:53', NULL, '00590055005300550046002000420041005200550020002D00200050004100300030003300340020002D00200032003000310038002D00300031002D003300310020002D002000300039003A00340035003A003000300020002D0020004E006F002000550072007500740020003A002000370020002D002000640072002E002000410068006D00610064002000530061006C0069006D00690020004A006100750068006100720069002C002000530070002E004F00540020002D00200055005300450052004E0041004D00450020003A00200050004100300030003300340020002D002000500041005300530057004F005200440020003A00200050004100300030003300340020002D002000530045004C0041004D0041005400200041004E00440041002000540045004C004100480020', '+6285725093955', 'Default_No_Compression', '050003A70201', '+62816124', -1, 'YUSUF BARU - PA0034 - 2018-01-31 - 09:45:00 - No Urut : 7 - dr. Ahmad Salimi Jauhari, Sp.OT - USERNAME : PA0034 - PASSWORD : PA0034 - SELAMAT ANDA TELAH ', 23, '', 1, 'SendingOKNoReport', -1, 41, 255, 'Gammu'),
('2018-01-29 07:49:55', '2018-01-29 07:49:25', '2018-01-29 07:49:55', NULL, '00540045005200440041004600540041005200200053004500420041004700410049002000500041005300490045004E00200050004F004C00490020005300500045005300490041004C004900530020005300590041005200410046002000440049002000520055004D00410048002000530041004B0049005400200041004D0041004C002000530045004800410054', '+6285725093955', 'Default_No_Compression', '050003A70202', '+62816124', -1, 'TERDAFTAR SEBAGAI PASIEN POLI SPESIALIS SYARAF DI RUMAH SAKIT AMAL SEHAT', 23, '', 2, 'SendingOKNoReport', -1, 42, 255, 'Gammu'),
('2018-01-29 07:56:08', '2018-01-29 07:55:42', '2018-01-29 07:56:08', NULL, '004A0061006D0020007000720061006B00740065006B00200070006100640061002000740061006E006700670061006C00200050004F004C0049004B0055002000620065006C0075006D002000740065007200730065006400690061002C002000730069006C00610068006B0061006E00200068007500620075006E0067006900200070006900680061006B002000720075006D00610068002000730061006B00690074', '+6285725093955', 'Default_No_Compression', '', '+62816124', -1, 'Jam praktek pada tanggal POLIKU belum tersedia, silahkan hubungi pihak rumah sakit', 25, '', 1, 'SendingOKNoReport', -1, 44, 255, 'Gammu');

--
-- Trigger `sentitems`
--
DELIMITER $$
CREATE TRIGGER `sentitems_timestamp` BEFORE INSERT ON `sentitems` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sms_inbox`
--

CREATE TABLE `sms_inbox` (
  `pk` int(20) NOT NULL,
  `waktu_terima` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `pesan` text CHARACTER SET utf8mb4 NOT NULL,
  `status_pesan` enum('false','true') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sms_inbox`
--

INSERT INTO `sms_inbox` (`pk`, `waktu_terima`, `no_hp`, `pesan`, `status_pesan`) VALUES
(1, '2018-01-26 04:38:20', '081234567890', 'nyoba', 'true'),
(2, '2018-01-26 04:40:25', '081234567890', 'nyoba lagi', 'true'),
(3, '2018-01-26 04:44:02', '088888888880', 'nyoba 3x', 'true'),
(4, '2018-01-26 06:14:22', '081234567890', 'part 2 iki', 'true'),
(5, '2018-01-26 06:34:59', '081081081081', 'versi 2 lho', 'true'),
(6, '2018-01-26 06:50:45', '081234567890', 'hsdajsdkjsfjnajncnhfehkhfenhnvhghjfhjdhfjehcfjehcjgrgfchjrhgjrhcgjerhjgrehjghrjhcrhjgjrgwehgfhwgejcbwgwjcgjwegcjfgfcnjrgchrgncgrhehhefguwenftunncgccrfgrg 2 bisa plis', 'true'),
(7, '2018-01-26 07:04:42', '081234567890', 'baru#PASIEN 42 yusuf budi kurniawan#p#12-01-2003#Jalan Nangka jeruk pisang kelurahan duren kota naga indonesia#ibu pasien 42# Poliklinik Spesialis Anak#asuransi#30-01-2018', 'true'),
(8, '2018-01-26 07:12:34', '081081081081', 'jjshfjsdhjfjdsfjsdhjfjhdsfhjdsfhjdshjfhjsdfhhjdsfhjhdsfhjhsdjfsjdfhjsdfhjsdhjdfjdshfjsdhfjsdhfjsdhfjhsdjfhjsdfhjsdhjkkskskskskskskskksskskksskksskkswwwwwbagian loro', 'true'),
(9, '2018-01-26 07:16:29', '081234567890', 'baru#PASIEN 43 yusuf budi kurniawan#p#12-01-2003#Jalan Nangka jeruk pisang kelurahan duren kota naga indonesia#ibu pasien 43#Poliklinik Spesialis Anak#asuransi#30-01-2018', 'true'),
(10, '2018-01-29 04:55:37', '+6285724701668', 'Kesempatan menjadi Agen pulsa/ALL Operator MKIOS, Harga murah; \n5=4500,\n10=9000,\n20=18000,\n25=23000,\n50=45000, \nKetik DAFTAR Kirim ke 085777777275', 'true'),
(11, '2018-01-29 04:55:41', '+6285725093955', 'Baru#yusuf budi#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#31-01-2018', 'true'),
(12, '2018-01-29 04:55:41', '+6285725093955', 'Baru#yusuf budi#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#asuransi#31-01-2018', 'true'),
(13, '2018-01-29 04:55:41', '+6285725093955', 'Test gammu', 'true'),
(14, '2018-01-29 04:58:32', '+6285725093955', 'Coba lagi', 'true'),
(15, '2018-01-29 06:03:47', '+6285725093955', '', 'true'),
(16, '2018-01-29 06:03:47', '+6285725093955', '', 'true'),
(17, '2018-01-29 06:03:49', '+6285725093955', '', 'true'),
(18, '2018-01-29 06:03:49', '+6285725093955', '', 'true'),
(19, '2018-01-29 06:03:51', '+6285725093955', '', 'true'),
(20, '2018-01-29 06:03:51', '+6285725093955', '', 'true'),
(21, '2018-01-29 06:03:55', '+6285725093955', '', 'true'),
(22, '2018-01-29 06:03:55', '+6285725093955', '', 'true'),
(23, '2018-01-29 06:03:59', '+6285725093955', 'Baru#yusuf budi kurniawan#l#20-12-1997#jalan pajajaran 2 nomor 20 a / 25 rt 5 rw 11 kelurahan sumber kecamatan banjarsari surakarta#ibunya yusuf budi kurniawan#poli spesialis syaraf#bpjs#31-01-2018', 'true'),
(24, '2018-01-29 06:06:07', '+6285725093955', 'Info poli#31-01-2018', 'true'),
(25, '2018-01-29 06:07:03', '+6285725093955', 'Info poli#31-01-2018', 'true'),
(26, '2018-01-29 06:11:40', '+6285725093955', 'Lama#pa0004#pasien 10#Poli spesialis syaraf#bpjs#31-01-2018', 'true'),
(27, '2018-01-29 07:26:00', '+6285725093955', 'Lama#pa0007#pasien 13#klinik obsgyn#bpjs#30-01-2018', 'true'),
(28, '2018-01-29 07:29:54', '+6285725093955', 'Lama#pa0007#pasien 13#klinik obsgyn#bpjs#28-01-2018', 'true'),
(29, '2018-01-29 07:31:40', '+6285725093955', 'Lama#pa0007#pasien 13#klinik obsgyn#ttt#29-01-2018', 'true'),
(30, '2018-01-29 07:35:20', '+6285725093955', 'Lama#pa00#pasien 13#klinik obsgyn#ttt#29-01-2018', 'true'),
(31, '2018-01-29 07:40:01', '+6285725093955', 'Lama#pa00#pasien 13#klinik obsgyn#ttt', 'true'),
(32, '2018-01-29 07:42:29', '+6285725093955', 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs', 'true'),
(33, '2018-01-29 07:43:34', '+6285725093955', 'Baru#yusuf baru#wanita#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#30-01-3018', 'true'),
(34, '2018-01-29 07:46:08', '+6285725093955', 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bp#30-01-3018', 'true'),
(35, '2018-01-29 07:47:51', '+6285725093955', 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#28-01-2018', 'true'),
(36, '2018-01-29 07:49:25', '+6285725093955', 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#31-01-2018', 'true'),
(37, '2018-01-29 07:52:11', '+6285725093955', 'Baru#yusuf baru#l#20-12-1997#jalan pajajaran 2#ibunya yusuf#poli spesialis syaraf#bpjs#01-02-2018', 'true'),
(38, '2018-01-29 07:54:42', '+6285725093955', 'Info poli#02-02-2018', 'true'),
(39, '2018-01-29 07:55:42', '+6285725093955', 'Info poli#poliku', 'true'),
(40, '2018-01-29 07:57:36', '+6285725093955', 'Info poli#02-02-2018#ggfthh', 'true'),
(41, '2018-01-31 08:59:26', '085602007066', 'Baru#yusuf 100#wanita#20-12-1997#jalan pajajaran 2#ibunya yusuf 100#klinik bedah#bpjs#31-01-3018', 'true'),
(42, '2018-01-31 09:00:38', '085602007066', 'Baru#yusuf 100#l#20-12-1997#jalan pajajaran 2#ibunya yusuf 100#klinik bedah#bpjs#31-01-3018', 'true'),
(44, '2018-02-01 02:01:41', '085602007066', 'hehehe', 'true'),
(60, '2018-02-02 04:37:27', '085602007066', 'nyoba', 'true'),
(46, '2018-02-01 02:11:33', '085602007066', 'test masuk apa nggak', 'true'),
(47, '2018-02-01 02:22:57', '085602007066', 'cobacona', 'true'),
(48, '2018-02-01 02:49:29', '085602007066', 'test', 'true'),
(50, '2018-02-01 02:54:35', '0433', 'NGOPI', 'true');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `m_gallery`
--
ALTER TABLE `m_gallery`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `m_jadwal_praktek`
--
ALTER TABLE `m_jadwal_praktek`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `m_jadwal_praktek_antrian`
--
ALTER TABLE `m_jadwal_praktek_antrian`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `m_jenis_pelayanan`
--
ALTER TABLE `m_jenis_pelayanan`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `m_kontak`
--
ALTER TABLE `m_kontak`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `m_metode_pembayaran`
--
ALTER TABLE `m_metode_pembayaran`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `m_pelayanan`
--
ALTER TABLE `m_pelayanan`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `m_perawat_pelayanan`
--
ALTER TABLE `m_perawat_pelayanan`
  ADD PRIMARY KEY (`pk_perawat_pelayanan`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  ADD KEY `outbox_sender` (`SenderID`);

--
-- Indexes for table `outbox_multipart`
--
ALTER TABLE `outbox_multipart`
  ADD PRIMARY KEY (`ID`,`SequencePosition`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`IMEI`);

--
-- Indexes for table `sentitems`
--
ALTER TABLE `sentitems`
  ADD PRIMARY KEY (`ID`,`SequencePosition`),
  ADD KEY `sentitems_date` (`DeliveryDateTime`),
  ADD KEY `sentitems_tpmr` (`TPMR`),
  ADD KEY `sentitems_dest` (`DestinationNumber`),
  ADD KEY `sentitems_sender` (`SenderID`);

--
-- Indexes for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
  ADD PRIMARY KEY (`pk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `m_gallery`
--
ALTER TABLE `m_gallery`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `m_jadwal_praktek`
--
ALTER TABLE `m_jadwal_praktek`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `m_jadwal_praktek_antrian`
--
ALTER TABLE `m_jadwal_praktek_antrian`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `m_jenis_pelayanan`
--
ALTER TABLE `m_jenis_pelayanan`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_kontak`
--
ALTER TABLE `m_kontak`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `m_metode_pembayaran`
--
ALTER TABLE `m_metode_pembayaran`
  MODIFY `pk` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_pelayanan`
--
ALTER TABLE `m_pelayanan`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `m_perawat_pelayanan`
--
ALTER TABLE `m_perawat_pelayanan`
  MODIFY `pk_perawat_pelayanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
  MODIFY `pk` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
