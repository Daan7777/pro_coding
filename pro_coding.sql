-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for pro_coding
DROP DATABASE IF EXISTS `pro_coding`;
CREATE DATABASE IF NOT EXISTS `pro_coding` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pro_coding`;

-- Dumping structure for table pro_coding.codes
DROP TABLE IF EXISTS `codes`;
CREATE TABLE IF NOT EXISTS `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime NOT NULL,
  `entered` datetime DEFAULT NULL,
  `used` datetime DEFAULT NULL,
  `gemeente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `id` (`id`),
  KEY `codes_gemeente_id_foreign` (`gemeente_id`),
  CONSTRAINT `codes_gemeente_id_foreign` FOREIGN KEY (`gemeente_id`) REFERENCES `gemeentes` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table pro_coding.codes: ~2 rows (approximately)
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;
INSERT INTO `codes` (`id`, `code`, `created_at`, `valid_from`, `valid_to`, `entered`, `used`, `gemeente_id`) VALUES
	(1, '12345678', '2022-02-09 13:21:13', '2022-02-09 13:20:37', '2022-03-11 13:20:38', '2022-02-09 15:01:12', NULL, 1),
	(2, '87654321', '2022-02-09 13:24:53', '2022-02-09 13:24:48', '2022-02-09 13:24:51', '2022-02-10 10:20:44', NULL, 1);
/*!40000 ALTER TABLE `codes` ENABLE KEYS */;

-- Dumping structure for table pro_coding.gemeentes
DROP TABLE IF EXISTS `gemeentes`;
CREATE TABLE IF NOT EXISTS `gemeentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `naam` (`naam`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table pro_coding.gemeentes: ~1 rows (approximately)
/*!40000 ALTER TABLE `gemeentes` DISABLE KEYS */;
INSERT INTO `gemeentes` (`id`, `naam`) VALUES
	(1, 'Schagen');
/*!40000 ALTER TABLE `gemeentes` ENABLE KEYS */;

-- Dumping structure for table pro_coding.kandidaten
DROP TABLE IF EXISTS `kandidaten`;
CREATE TABLE IF NOT EXISTS `kandidaten` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nummer` int(11) DEFAULT NULL,
  `achternaam` varchar(30) NOT NULL,
  `voorletters` varchar(30) NOT NULL,
  `voornaam` varchar(30) NOT NULL,
  `geslacht` enum('MALE','FEMALE') NOT NULL,
  `woonplaats_id` int(11) NOT NULL,
  `partij_id` int(11) NOT NULL,
  `stemmen` int(11) NOT NULL DEFAULT '0',
  `slogan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `kandidaten_woonplaats_id_foreign` (`woonplaats_id`),
  KEY `kandidaten_partij_id_foreign` (`partij_id`),
  CONSTRAINT `kandidaten_partij_id_foreign` FOREIGN KEY (`partij_id`) REFERENCES `partijen` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `kandidaten_woonplaats_id_foreign` FOREIGN KEY (`woonplaats_id`) REFERENCES `plaatsen` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=latin1;

-- Dumping data for table pro_coding.kandidaten: ~205 rows (approximately)
/*!40000 ALTER TABLE `kandidaten` DISABLE KEYS */;
INSERT INTO `kandidaten` (`id`, `nummer`, `achternaam`, `voorletters`, `voornaam`, `geslacht`, `woonplaats_id`, `partij_id`, `stemmen`, `slogan`) VALUES
	(1, 1, 'de Nijs-Visser', 'P.', 'Puck', 'FEMALE', 2, 1, 0, NULL),
	(2, 2, 'Wiskerke', 'J.', 'Co', 'MALE', 1, 1, 0, NULL),
	(3, 3, 'Burger-de Graaf', 'D.', 'Debby', 'FEMALE', 3, 1, 0, NULL),
	(4, 4, 'Glashouwer', 'B.J.', 'Boudien', 'FEMALE', 4, 1, 0, NULL),
	(5, 5, 'Vonk', 'W.', 'Wim', 'MALE', 5, 1, 0, NULL),
	(6, 6, 'van Oerle', 'M.', 'Menno', 'MALE', 1, 1, 0, NULL),
	(7, 7, 'Sanders', 'M.A.J.', 'Marcel', 'MALE', 1, 1, 0, NULL),
	(8, 8, 'van Bergen', 'R.A.J.C.', 'Richard', 'MALE', 2, 1, 0, NULL),
	(9, 9, 'Slijkhuis', 'S.T.', 'Tim', 'MALE', 1, 1, 0, NULL),
	(10, 10, 'Bakker', 'R.M.', 'Ruud', 'MALE', 4, 1, 0, NULL),
	(11, 11, 'Kleimeer', 'A.T.', 'Arco', 'MALE', 2, 1, 0, NULL),
	(12, 12, 'Bloom', 'S.G.M.', 'Sonja', 'FEMALE', 5, 1, 0, NULL),
	(13, 13, 'van Tol', 'Y.A.', 'Youri', 'MALE', 1, 1, 0, NULL),
	(14, 14, 'Huits', 'P.H.M.', 'Peter', 'MALE', 6, 1, 0, NULL),
	(15, 15, 'Visser', 'J.J.', 'Johan', 'MALE', 7, 1, 0, NULL),
	(16, 16, 'Boon', 'P.N.S.', 'Peter', 'MALE', 6, 1, 0, NULL),
	(17, 17, 'Schouten', 'G.E.K.', 'Gerard', 'MALE', 3, 1, 0, NULL),
	(18, 18, 'Niesten-Vork', 'W.M.', 'WI', 'FEMALE', 1, 1, 0, NULL),
	(19, 19, 'van de Giesen-Ruiter', 'E.G.', 'Els', 'FEMALE', 4, 1, 0, NULL),
	(20, 20, 'van Kampen', 'J.C.J.', 'Hans', 'MALE', 1, 1, 0, NULL),
	(21, 21, 'de Wit', 'C.W.', 'Kees', 'MALE', 3, 1, 0, NULL),
	(22, 22, 'Tams-Ferwerda', 'H.', 'Hillie', 'FEMALE', 8, 1, 0, NULL),
	(23, 23, 'Komproe', 'H.A.C.', 'Hedwig', 'MALE', 3, 1, 0, NULL),
	(24, 24, 'de Groot', 'L.W.M.', 'Leo', 'MALE', 1, 1, 0, NULL),
	(25, 25, 'Joling', 'W.', 'Willem', 'MALE', 1, 1, 0, NULL),
	(26, 26, 'Ruijs', 'C.', 'Calvin', 'MALE', 9, 1, 0, NULL),
	(27, 27, 'Beemsterboer', 'J.N.J.J.', 'Jos', 'MALE', 8, 1, 0, NULL),
	(28, 28, 'van Noort-Zonneveld', 'J.G.J.M.', 'Coby', 'FEMALE', 10, 1, 0, NULL),
	(29, 29, 'Boersen-Bergen', 'C.M.', 'Nel', 'FEMALE', 1, 1, 0, NULL),
	(30, 30, 'Wolters', 'B.J.', 'Ben', 'MALE', 4, 1, 0, NULL),
	(31, 31, 'Blankendaal', 'C.W.', 'Cora', 'FEMALE', 8, 1, 0, NULL),
	(32, 32, 'van Duin', 'B.G.', 'Bart', 'MALE', 2, 1, 0, NULL),
	(33, 33, 'Prij', 'J.', 'Jan', 'MALE', 1, 1, 0, NULL),
	(34, 34, 'Rijbroek-Hijink', 'C.J.', 'Cindy', 'FEMALE', 5, 1, 0, NULL),
	(35, 35, 'Broersen', 'N.J.', 'Koos', 'MALE', 6, 1, 0, NULL),
	(36, 36, 'Vrijhof', 'J.', 'Jelle', 'MALE', 1, 1, 0, NULL),
	(37, 37, 'Kleverlaan', 'P.C.', 'Piet', 'MALE', 4, 1, 0, NULL),
	(38, 38, 'de Groot', 'W.B.', 'WI', 'MALE', 2, 1, 0, NULL),
	(39, 39, 'de Wit', 'A.N.M.', 'Adrie', 'MALE', 3, 1, 0, NULL),
	(40, 40, 'Pronk', 'J.A.', 'Jan', 'MALE', 1, 1, 0, NULL),
	(41, 41, 'van Zanten', 'H.', 'Henk', 'MALE', 1, 1, 0, NULL),
	(42, 42, 'Rustenburg', 'D.P.W.', 'Daniel', 'MALE', 1, 1, 0, NULL),
	(43, 43, 'van Duin-Scholten', 'P.A.M.', 'Paula', 'FEMALE', 2, 1, 0, NULL),
	(44, 44, 'Rob', 'D.C.', 'Daphne', 'FEMALE', 1, 1, 0, NULL),
	(45, 45, 'Boersen', 'S.P.T.', 'Sam', 'MALE', 1, 1, 0, NULL),
	(46, 46, 'Slijkerman', 'G.J.', 'Gert-Jan', 'MALE', 3, 1, 0, NULL),
	(47, 47, 'van der Veek', 'S.J.A.', 'Sigge', 'MALE', 7, 1, 0, NULL),
	(48, 48, 'Lensink', 'S.M.', 'Sander', 'MALE', 1, 1, 0, NULL),
	(49, 49, 'Broersen', 'H.C.', 'Bram', 'MALE', 6, 1, 0, NULL),
	(50, 50, 'Beemsterboer', 'J.C.J.', 'Jelle', 'MALE', 6, 1, 0, NULL),
	(51, 1, 'Vriend', 'P.F.J.', 'Perry', 'MALE', 3, 2, 0, NULL),
	(52, 2, 'Groot', 'A.S.', 'Andre', 'MALE', 1, 2, 0, NULL),
	(53, 3, 'Mulder-Keij', 'M.C.M.', 'Marga', 'FEMALE', 8, 2, 0, NULL),
	(54, 4, 'Wijnker', 'M.A.F.', 'Marianne', 'FEMALE', 4, 2, 0, NULL),
	(55, 5, 'Quint', 'C.H.J.', 'Cor', 'MALE', 1, 2, 0, NULL),
	(56, 6, 'Cooper-Limmen', 'G.E.M.', 'Truus', 'FEMALE', 1, 2, 0, NULL),
	(57, 7, 'Roozendaal', 'L.G.M.', 'Louis', 'MALE', 8, 2, 0, NULL),
	(58, 8, 'van de Wateringen', 'A.P.L.', 'Arthur', 'MALE', 1, 2, 0, NULL),
	(59, 9, 'Schouten', 'A.', 'Ton', 'MALE', 1, 2, 0, NULL),
	(60, 10, 'Wang', 'C.C.', 'Cietjong', 'MALE', 1, 2, 0, NULL),
	(61, 11, 'VVissink', 'B.H.', 'Ben', 'MALE', 3, 2, 0, NULL),
	(62, 12, 'Bloembergen', 'G.R.', 'Gjalt', 'MALE', 1, 2, 0, NULL),
	(63, 13, 'Bosman-van Kessel', 'I.B.M.', 'Ivonne', 'FEMALE', 6, 2, 0, NULL),
	(64, 14, 'Dam', 'D.', 'Dick', 'MALE', 4, 2, 0, NULL),
	(65, 15, 'van Dipten', 'L.M.', 'Leen', 'MALE', 1, 2, 0, NULL),
	(66, 16, 'Drieenhuizen', 'P.T.', 'Piet', 'MALE', 11, 2, 0, NULL),
	(67, 17, 'de Haan', 'G.H.', 'Ger', 'MALE', 11, 2, 0, NULL),
	(68, 18, 'Mensingh-de Ruigh', 'C.M.', 'Connie', 'FEMALE', 1, 2, 0, NULL),
	(69, 19, 'Mulder', 'W.E.', 'Nil', 'MALE', 8, 2, 0, NULL),
	(70, 20, '1', 'G.J.', 'Gerard', 'MALE', 3, 2, 0, NULL),
	(71, 21, 'Schravemade-Vriend', 'J.M.M.', 'Sabine', 'FEMALE', 2, 2, 0, NULL),
	(72, 22, 'Vriend-van der Helm', 'M.A.J.', 'Ria', 'FEMALE', 3, 2, 0, NULL),
	(73, 23, 'van de Wateringen', 'E.J.M.', 'Ellen', 'FEMALE', 1, 2, 0, NULL),
	(74, 24, 'Wit', 'J.', 'Jaap', 'MALE', 3, 2, 0, NULL),
	(75, 1, 'van Wijk - Ligthart', 'A.M.', 'Angelique', 'FEMALE', 5, 3, 0, NULL),
	(76, 2, 'Stam', 'W.J.', 'Willem-Jan', 'MALE', 1, 3, 0, NULL),
	(77, 3, 'Takes', 'R.A.J.', 'Roel', 'MALE', 1, 3, 0, NULL),
	(78, 4, 'Parton', 'J.', 'Jur', 'MALE', 2, 3, 0, NULL),
	(79, 5, 'Vlam', 'P.J.', 'Peter', 'MALE', 2, 3, 0, NULL),
	(80, 6, 'Stoelinga-Souman', 'H.M.I.N.', 'Heleen', 'FEMALE', 1, 3, 0, NULL),
	(81, 7, 'van de Sande', 'W.M.', 'Willem', 'MALE', 1, 3, 0, NULL),
	(82, 8, 'Blok', 'C.', 'Claudio', 'MALE', 1, 3, 0, NULL),
	(83, 9, 'Bos', 'A.', 'Alie', 'FEMALE', 12, 3, 0, NULL),
	(84, 10, 'Buis', 'E.', 'Eva', 'FEMALE', 1, 3, 0, NULL),
	(85, 11, 'Ligthart', 'A.A.N.P.', 'Arjan', 'MALE', 5, 3, 0, NULL),
	(86, 12, 'Baltus', 'M.M.', 'Martien', 'MALE', 1, 3, 0, NULL),
	(87, 13, 'Bakker', 'V.A.', 'Volkert', 'MALE', 5, 3, 0, NULL),
	(88, 14, 'Groot', 'J.P.', 'Jeroen', 'MALE', 5, 3, 0, NULL),
	(89, 15, 'van der Ploeg', 'T.A.', 'Thomas', 'MALE', 11, 3, 0, NULL),
	(90, 16, 'Marees', 'P.J.', 'Piet', 'MALE', 13, 3, 0, NULL),
	(91, 17, 'Bouwes', 'J.', 'Jan', 'MALE', 1, 3, 0, NULL),
	(92, 1, 'Dignum', 'L.', 'Lars', 'MALE', 2, 4, 0, NULL),
	(93, 2, 'Kruijer', 'S.C.', 'Simco', 'MALE', 1, 4, 0, NULL),
	(94, 3, 'Kruijer', 'J.P.', 'Jack', 'MALE', 5, 4, 0, NULL),
	(95, 4, 'Streefkerk', 'M.', 'Marijn', 'MALE', 1, 4, 0, NULL),
	(96, 5, 'Zut', 'R.P.', 'Ron', 'MALE', 6, 4, 0, NULL),
	(97, 6, 'Tesselaar', 'M.', 'Maaike', 'FEMALE', 1, 4, 0, NULL),
	(98, 7, 'Kroger', 'J.T.', 'Hans', 'MALE', 5, 4, 0, NULL),
	(99, 8, 'Rampen - van de Put', 'C.H.T.', 'Carla', 'FEMALE', 5, 4, 0, NULL),
	(100, 9, 'de Vries', 'W.', 'Wietse', 'MALE', 6, 4, 0, NULL),
	(101, 10, 'van Egmond', 'D.', 'Dirk', 'MALE', 11, 4, 0, NULL),
	(102, 11, 'Taams', 'P.D.', 'Petra', 'FEMALE', 8, 4, 0, NULL),
	(103, 12, 'Haver', 'L.J.', 'Lars', 'MALE', 4, 4, 0, NULL),
	(104, 13, 'van Emmerik', 'P.J.', 'Patrick', 'MALE', 1, 4, 0, NULL),
	(105, 14, 'Raap', 'A.', 'Andrea', 'FEMALE', 3, 4, 0, NULL),
	(106, 15, 'van der Salm', 'H.C.', 'Harry', 'MALE', 12, 4, 0, NULL),
	(107, 16, 'Rijs', 'H.', 'Henk', 'MALE', 9, 4, 0, NULL),
	(108, 17, 'Kramer', 'I.W.A.', 'Irene', 'FEMALE', 7, 4, 0, NULL),
	(109, 18, 'Zutt', 'K.P.', 'Koen', 'MALE', 14, 4, 0, NULL),
	(110, 19, 'de Vries', 'J.J.', 'Jacob Jan', 'MALE', 2, 4, 0, NULL),
	(111, 20, 'van Diepen - Rampen', 'M.M.', 'Thildy', 'FEMALE', 3, 4, 0, NULL),
	(112, 21, 'Helvrich', 'R.', 'Ronald', 'MALE', 1, 4, 0, NULL),
	(113, 22, 'Kat', 'J.K.', 'Jodie', 'FEMALE', 4, 4, 0, NULL),
	(114, 23, 'Otto', 'S.M.T.J.', 'Sjef', 'MALE', 11, 4, 0, NULL),
	(115, 24, 'Don', 'P.J.', 'Peter Jaap', 'MALE', 6, 4, 0, NULL),
	(116, 25, 'de Graaf', 'M.C.', 'Margreet', 'FEMALE', 1, 4, 0, NULL),
	(117, 26, 'van der Ham', 'W.', 'Willem', 'MALE', 11, 4, 0, NULL),
	(118, 27, 'Nieman', 'J.G.', 'Hans', 'MALE', 2, 4, 0, NULL),
	(119, 28, 'Kaandorp', 'S.', 'Sander', 'MALE', 14, 4, 0, NULL),
	(120, 29, 'Raap - Zwart', 'C.', 'Nel', 'FEMALE', 8, 4, 0, NULL),
	(121, 30, 'Cappon', 'W.L.', 'Rens', 'MALE', 8, 4, 0, NULL),
	(122, 1, 'van Vuuren', 'V.C.', 'Vera', 'FEMALE', 12, 5, 0, NULL),
	(123, 2, 'Muntjewerf', 'S.', 'Samuel', 'MALE', 1, 5, 0, NULL),
	(124, 3, 'van Musscher', 'M.G.', 'Mirjam', 'FEMALE', 9, 5, 0, NULL),
	(125, 4, 'Wagemaker', 'A.H.', 'Helga', 'FEMALE', 7, 5, 0, NULL),
	(126, 5, 'Heddes', 'J.J.', 'Hans', 'MALE', 1, 5, 0, NULL),
	(127, 6, 'Piket', 'H.C.P.M.', 'Harry', 'MALE', 6, 5, 0, NULL),
	(128, 7, 'Schrijver', 'J.C.', 'Jan', 'MALE', 8, 5, 0, NULL),
	(129, 8, 'Juckenack', 'S.E.B.', 'Sabine', 'FEMALE', 10, 5, 0, NULL),
	(130, 9, 'Blonk', 'B.', 'Ben', 'MALE', 10, 5, 0, NULL),
	(131, 10, 'Numan', 'R.', 'Roosje', 'FEMALE', 1, 5, 0, NULL),
	(132, 11, 'van der Jagt', 'M.C.', 'Martin', 'MALE', 1, 5, 0, NULL),
	(133, 12, 'Talsma-Hoejenbos', 'K.M.', 'Marlene', 'FEMALE', 11, 5, 0, NULL),
	(134, 13, 'van der Wal', 'P.', 'Pieter', 'MALE', 1, 5, 0, NULL),
	(135, 14, 'Janssen-de Koning', 'J.W.', 'Marianne', 'FEMALE', 6, 5, 0, NULL),
	(136, 15, 'van der Zee', 'P.', 'Philip', 'MALE', 9, 5, 0, NULL),
	(137, 16, 'de Groen', 'M.A.M.', 'Marga', 'FEMALE', 1, 5, 0, NULL),
	(138, 17, 'Muntjewerf', 'J.', 'Jan', 'MALE', 1, 5, 0, NULL),
	(139, 18, 'van Dijk', 'J.J.H.', 'Jolijn', 'FEMALE', 11, 5, 0, NULL),
	(140, 19, 'Mud', 'R.', 'Rienk', 'MALE', 1, 5, 0, NULL),
	(141, 20, 'Paarlberg', 'J.', 'Jannie', 'FEMALE', 1, 5, 0, NULL),
	(142, 21, 'Klant', 'R.J.', 'Rolf', 'MALE', 10, 5, 0, NULL),
	(143, 22, 'van Mourik', 'M.G.', 'Bertie', 'FEMALE', 6, 5, 0, NULL),
	(144, 23, 'Goudsmit', 'J.', 'Jaap', 'MALE', 1, 5, 0, NULL),
	(145, 24, 'Zoon', 'R.B.', 'Ruud', 'MALE', 1, 5, 0, NULL),
	(146, 25, 'Moussault', 'M.A.J.', 'Marc', 'MALE', 1, 5, 0, NULL),
	(147, 26, 'van Vliet', 'F.', 'Erik', 'MALE', 11, 5, 0, NULL),
	(148, 27, 'Leijen', 'M.A.', 'Marjan', 'FEMALE', 2, 5, 0, NULL),
	(149, 1, 'Riteco', 'L.A.J.', 'Lambert', 'MALE', 1, 6, 0, NULL),
	(150, 2, 'Menkveld', 'J.W.', 'Joke', 'FEMALE', 11, 6, 0, NULL),
	(151, 3, 'Sintenie', 'B.W.', 'Ben', 'MALE', 5, 6, 0, NULL),
	(152, 4, 'Bijlsma', 'A.J.J.', 'Andre', 'MALE', 1, 6, 0, NULL),
	(153, 5, 'Groen', 'K.D.', 'Kelly', 'FEMALE', 1, 6, 0, NULL),
	(154, 6, 'Rot', 'G.', 'Gerrit', 'MALE', 1, 6, 0, NULL),
	(155, 7, 'Komen - de Leeuw', 'S.J.', 'Sandra', 'FEMALE', 2, 6, 0, NULL),
	(156, 8, 'Bart', 'J.', 'Jacob', 'MALE', 8, 6, 0, NULL),
	(157, 9, 'Brus', 'I.D.G.M.', 'Isabelle', 'FEMALE', 9, 6, 0, NULL),
	(158, 10, 'Mazurel', 'M.J.', 'Maureen', 'FEMALE', 1, 6, 0, NULL),
	(159, 11, 'Ismael', 'M.', 'Mo', 'MALE', 1, 6, 0, NULL),
	(160, 12, 'van der Geest - Donkers', 'J.E.B.', 'Hans', 'MALE', 8, 6, 0, NULL),
	(161, 13, 'Kleemans', 'A.H.M.', 'Lineke', 'FEMALE', 1, 6, 0, NULL),
	(162, 14, 'Maarschall', 'R.', 'Ruud', 'MALE', 10, 6, 0, NULL),
	(163, 15, 'Bakker', 'R.P.', 'Ruud', 'MALE', 1, 6, 0, NULL),
	(164, 1, 'Jansen', 'F.N.J.', 'Frans', 'MALE', 1, 7, 0, NULL),
	(165, 2, 'Struijf', 'M.', 'Margriet', 'FEMALE', 1, 7, 0, NULL),
	(166, 3, 'Vogel', 'H.', 'Harry', 'MALE', 2, 7, 0, NULL),
	(167, 4, 'Horn', 'J.G.', 'Hans', 'MALE', 7, 7, 0, NULL),
	(168, 5, 'Toorenent-Jonker', 'J.A.', 'Hanneke', 'FEMALE', 8, 7, 0, NULL),
	(169, 6, 'Frowijn-Druijven', 'M.M.A.', 'Margreet', 'FEMALE', 1, 7, 0, NULL),
	(170, 7, 'Vlietstra-Wouterse', 'E.M.M.', 'Liesbeth', 'FEMALE', 1, 7, 0, NULL),
	(171, 8, 'Veenvliet', 'C.', 'Kees', 'MALE', 1, 7, 0, NULL),
	(172, 9, 'Jansen', 'J.C.', 'Jaap', 'MALE', 1, 7, 0, NULL),
	(173, 10, 'van Opbergen-Velthuizen', 'J.', 'Jolanda', 'FEMALE', 1, 7, 0, NULL),
	(174, 11, 'van Drimmelen', 'A.A.J.', 'Harry', 'MALE', 9, 7, 0, NULL),
	(175, 12, 'Meijer-van den Broek', 'M.S.', 'Marijke', 'FEMALE', 1, 7, 0, NULL),
	(176, 13, 'de Winter', 'P.H.', 'Paul', 'MALE', 10, 7, 0, NULL),
	(177, 14, 'Velt', 'N.A.', 'Nick', 'MALE', 9, 7, 0, NULL),
	(178, 1, 'Rijnders', 'W.P.', 'Wim', 'MALE', 11, 8, 0, NULL),
	(179, 2, 'Smit-Kiekebos', 'U.L.M.', 'Ursula', 'FEMALE', 4, 8, 0, NULL),
	(180, 3, 'van der Harst', 'G.L.', 'Leo', 'MALE', 7, 8, 0, NULL),
	(181, 4, 'Pouw', 'A.M.M.', 'Jeanne', 'FEMALE', 5, 8, 0, NULL),
	(182, 5, 'de Boer', 'H.', 'Henk', 'MALE', 1, 8, 0, NULL),
	(183, 6, 'Piket', 'G.P.', 'Galina', 'FEMALE', 2, 8, 0, NULL),
	(184, 7, 'Rezelman', 'S.', 'Sander', 'MALE', 1, 8, 0, NULL),
	(185, 8, 'Muntjewerf', 'J.J.P.', 'Jeroen', 'MALE', 1, 8, 0, NULL),
	(186, 9, 'Komen-van Dijk', 'M.', 'Margreet', 'FEMALE', 1, 8, 0, NULL),
	(187, 10, 'Rezelman', 'B.G.C.', 'Bjarne', 'MALE', 1, 8, 0, NULL),
	(188, 11, 'Loeve', 'C.P.', 'Nel', 'FEMALE', 1, 8, 0, NULL),
	(189, 12, 'Komen', 'R.G.', 'Ronald', 'MALE', 1, 8, 0, NULL),
	(190, 13, 'Hoogeboom', 'W.G.', 'Wilma', 'FEMALE', 1, 8, 0, NULL),
	(191, 1, 'Bredewold', 'H.P.', 'Merieke', 'FEMALE', 1, 9, 0, NULL),
	(192, 2, 'Freijsen-Vacano', 'J.H.', 'Jacqueline', 'FEMALE', 1, 9, 0, NULL),
	(193, 3, 'Verloop', 'M.C.', 'Margreet', 'FEMALE', 1, 9, 0, NULL),
	(194, 4, 'Steijger', 'L.', 'Linda', 'FEMALE', 1, 9, 0, NULL),
	(195, 5, 'Steijger', 'S.', 'Suzanne', 'FEMALE', 1, 9, 0, NULL),
	(196, 6, 'Hartman', 'F.', 'Emma', 'FEMALE', 1, 9, 0, NULL),
	(197, 7, 'Visscher-Spakman', 'M.', 'Marjolein', 'FEMALE', 1, 9, 0, NULL),
	(198, 8, 'Bloem-van der Wel', 'H.E.', 'Hilda', 'FEMALE', 1, 9, 0, NULL),
	(199, 9, 'Sedney', 'R.D.', 'Rudi', 'MALE', 1, 9, 0, NULL),
	(200, 10, 'Cornelisse', 'M.', 'Marcel', 'MALE', 1, 9, 0, NULL),
	(201, 11, 'Melchers', 'M.I.P.', 'Ingrid', 'FEMALE', 1, 9, 0, NULL),
	(202, 12, 'Hogenes', 'R.C.M.', 'Rob', 'MALE', 1, 9, 0, NULL),
	(203, 13, 'Wit', 'P.', 'Piet', 'MALE', 1, 9, 0, NULL),
	(204, 14, 'Obradovio', 'S.', 'Nina', 'FEMALE', 1, 9, 0, NULL),
	(205, 15, 'Stam', 'G.M.', 'GailIli', 'FEMALE', 1, 9, 0, NULL);
/*!40000 ALTER TABLE `kandidaten` ENABLE KEYS */;

-- Dumping structure for table pro_coding.misbruik
DROP TABLE IF EXISTS `misbruik`;
CREATE TABLE IF NOT EXISTS `misbruik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `misbruik_code_id_foreign` (`code_id`),
  CONSTRAINT `misbruik_code_id_foreign` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pro_coding.misbruik: ~0 rows (approximately)
/*!40000 ALTER TABLE `misbruik` DISABLE KEYS */;
/*!40000 ALTER TABLE `misbruik` ENABLE KEYS */;

-- Dumping structure for table pro_coding.partijen
DROP TABLE IF EXISTS `partijen`;
CREATE TABLE IF NOT EXISTS `partijen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(50) DEFAULT NULL,
  `gemeente_id` int(11) NOT NULL,
  `slogan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `partijen_gemeente_id_foreign` (`gemeente_id`),
  CONSTRAINT `partijen_gemeente_id_foreign` FOREIGN KEY (`gemeente_id`) REFERENCES `gemeentes` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table pro_coding.partijen: ~9 rows (approximately)
/*!40000 ALTER TABLE `partijen` DISABLE KEYS */;
INSERT INTO `partijen` (`id`, `naam`, `gemeente_id`, `slogan`) VALUES
	(1, 'CDA', 1, 'Voor de volgende generatie!'),
	(2, 'Seniorenpartij', 1, 'Voor iedereen!'),
	(3, 'VVD', 1, 'Samen sterker verder!'),
	(4, 'JessLokaal', 1, 'Een nuchtere kijk op onze toekomst!'),
	(5, 'Partij van de Arbeid', 1, 'Socialer, groener en eerlijker!'),
	(6, 'GroenLinks', 1, 'Samen verandering mogelijk maken!'),
	(7, 'D66', 1, 'Laat iedereen vrij, maar niemand vallen!'),
	(8, 'Socialistische Partij', 1, 'Menselijke waardigheid, gelijkwaardigheid en solidariteit!'),
	(9, 'Wens4u', 1, 'Samen voor Elkaar!');
/*!40000 ALTER TABLE `partijen` ENABLE KEYS */;

-- Dumping structure for table pro_coding.plaatsen
DROP TABLE IF EXISTS `plaatsen`;
CREATE TABLE IF NOT EXISTS `plaatsen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(50) NOT NULL,
  `gemeente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `plaatsen_gemeente_id_foreign` (`gemeente_id`),
  CONSTRAINT `plaatsen_gemeente_id_foreign` FOREIGN KEY (`gemeente_id`) REFERENCES `gemeentes` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table pro_coding.plaatsen: ~14 rows (approximately)
/*!40000 ALTER TABLE `plaatsen` DISABLE KEYS */;
INSERT INTO `plaatsen` (`id`, `naam`, `gemeente_id`) VALUES
	(1, 'Schagen', 1),
	(2, 'Warmenhuizen', 1),
	(3, '\'t Zand', 1),
	(4, 'Waarland', 1),
	(5, 'Schagerbrug', 1),
	(6, 'Tuitjenhorn', 1),
	(7, 'Burgerbrug', 1),
	(8, 'Sint Maarten', 1),
	(9, 'Dirkshorn', 1),
	(10, 'Petten', 1),
	(11, 'Callantsoog', 1),
	(12, 'Sint Maartensvlotbrug', 1),
	(13, 'Oudesluis', 1),
	(14, 'Sint Maartensbrug', 1);
/*!40000 ALTER TABLE `plaatsen` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
