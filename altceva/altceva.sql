-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2014 at 10:55 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `altceva`
--
CREATE DATABASE IF NOT EXISTS `altceva` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `altceva`;

-- --------------------------------------------------------

--
-- Table structure for table `nelo_admin`
--

DROP TABLE IF EXISTS `nelo_admin`;
CREATE TABLE IF NOT EXISTS `nelo_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(255) CHARACTER SET latin1 NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'admin',
  `access_id` int(1) NOT NULL DEFAULT '0',
  `f_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `l_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `designation` varchar(255) CHARACTER SET latin1 NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nelo_admin`
--

INSERT INTO `nelo_admin` (`id`, `pass`, `username`, `access_id`, `f_name`, `l_name`, `email`, `designation`, `last_login`, `status`) VALUES
(1, 'f787115df2d72b62f4cec447f99e12c5', 'Gabi', 1, 'Gabriel', 'Jicman', 'ghostm3z@gmail.com', 'Administrator', '2014-06-10 08:52:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_adminmenu`
--

DROP TABLE IF EXISTS `nelo_adminmenu`;
CREATE TABLE IF NOT EXISTS `nelo_adminmenu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `url` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `parent_id` int(4) DEFAULT '0',
  `status` enum('Y','N') CHARACTER SET latin1 DEFAULT 'Y',
  `ord` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=75 ;

--
-- Dumping data for table `nelo_adminmenu`
--

INSERT INTO `nelo_adminmenu` (`id`, `name`, `url`, `parent_id`, `status`, `ord`) VALUES
(6, 'SETARI GENERALE', '#', 0, 'Y', 9),
(31, 'Setari globale', 'setari_globale.php', 6, 'Y', 1),
(33, 'MANAGER HOTEL', '#', 0, 'Y', 2),
(34, 'Editeaza camere', 'lista_camere.php', 33, 'Y', 1),
(35, 'Editeaza tip camere', 'tip_camere.php', 33, 'Y', 2),
(36, 'Editeaza preturi', 'editare_preturi.php', 63, 'Y', 4),
(37, 'MANAGER REZERVARI', '#', 0, 'Y', 4),
(39, 'Lista rezervarilor', 'lista_rezervarilor.php', 37, 'Y', 2),
(43, 'Modalitati de plata', 'modalitati_plata.php', 6, 'Y', 4),
(44, 'Continut Emailuri', 'continut_email.php', 6, 'Y', 5),
(59, 'Editeaza capacitate', 'admin_capacitate.php', 33, 'Y', 3),
(61, 'Setari aditionale plata', 'setari_plata.php', 63, 'Y', 6),
(63, 'MANAGER PRETURI', '#', 0, 'Y', 3),
(66, 'Detalii hotel', 'admin_detalii_hotel.php', 33, 'Y', 0),
(70, 'Calendar', 'vizualizare_calendar.php', 37, 'Y', 5),
(71, 'Baza de date clienti', 'bd_clienti.php', 37, 'Y', 4),
(72, 'Editeaza meniuri', 'admin_meniuri.php', 6, 'Y', 6),
(73, 'MANAGER LIMBI', '#', 0, 'Y', 6),
(74, 'Editeaza traduceri', 'manager_limbi.php', 73, 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_camere`
--

DROP TABLE IF EXISTS `nelo_camere`;
CREATE TABLE IF NOT EXISTS `nelo_camere` (
  `room_ID` int(10) NOT NULL AUTO_INCREMENT,
  `roomtype_id` int(10) DEFAULT NULL,
  `room_no` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `capacity_id` int(10) DEFAULT NULL,
  `no_of_child` int(11) NOT NULL DEFAULT '0',
  `extra_bed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`room_ID`),
  KEY `roomtype_id` (`roomtype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nelo_camere`
--

INSERT INTO `nelo_camere` (`room_ID`, `roomtype_id`, `room_no`, `capacity_id`, `no_of_child`, `extra_bed`) VALUES
(1, 0, '1', 0, 0, 0),
(4, 1, '4', 2, 0, 0),
(5, 1, '5', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_capacitate`
--

DROP TABLE IF EXISTS `nelo_capacitate`;
CREATE TABLE IF NOT EXISTS `nelo_capacitate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nelo_capacitate`
--

INSERT INTO `nelo_capacitate` (`id`, `title`, `capacity`) VALUES
(1, 'Camera single', 12),
(2, 'Capacitate camera single', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_clienti`
--

DROP TABLE IF EXISTS `nelo_clienti`;
CREATE TABLE IF NOT EXISTS `nelo_clienti` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `surname` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `title` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `street_addr` text CHARACTER SET latin1,
  `city` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `province` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `zip` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `additional_comments` text CHARACTER SET latin1,
  `ip` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `existing_client` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nelo_clienti`
--

INSERT INTO `nelo_clienti` (`client_id`, `first_name`, `surname`, `title`, `street_addr`, `city`, `province`, `zip`, `country`, `phone`, `fax`, `email`, `additional_comments`, `ip`, `existing_client`) VALUES
(1, 'Gabriel', 'Jicman', 'Mr.', 'Strada Test, nr. 1', 'Iasi', 'Iasi', '700723', 'Romania', '40748952120', '', 'ghostm3z@gmail.com', 'Test', '::1', 1),
(2, 'Jicman', 'Gabriel', 'Mr.', 'Strada Test, nr. 1', 'Iasi', 'Iasi', '600632', 'Romania', '40748952120', '', 'gabriel.jicman@gmail.com', 'Test', '::1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_configurari`
--

DROP TABLE IF EXISTS `nelo_configurari`;
CREATE TABLE IF NOT EXISTS `nelo_configurari` (
  `conf_id` int(11) NOT NULL AUTO_INCREMENT,
  `conf_key` varchar(100) CHARACTER SET latin1 NOT NULL,
  `conf_value` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`conf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Configurarile generale ale hotelului' AUTO_INCREMENT=32 ;

--
-- Dumping data for table `nelo_configurari`
--

INSERT INTO `nelo_configurari` (`conf_id`, `conf_key`, `conf_value`) VALUES
(1, 'conf_hotel_name', 'Hotel Testare'),
(2, 'conf_hotel_streetaddr', 'Strada Test, nr. 1'),
(3, 'conf_hotel_city', 'Iasi'),
(4, 'conf_hotel_state', 'Iasi'),
(5, 'conf_hotel_country', 'Romania'),
(6, 'conf_hotel_zipcode', '700723'),
(7, 'conf_hotel_phone', '+40 748 952 120'),
(8, 'conf_hotel_fax', ''),
(9, 'conf_hotel_email', 'ghostm3z@gmail.com'),
(13, 'conf_currency_symbol', 'lei'),
(14, 'conf_currency_code', 'LEI'),
(20, 'conf_tax_amount', '24'),
(21, 'conf_dateformat', 'dd/mm/yy'),
(22, 'conf_booking_exptime', '1000'),
(25, 'conf_enabled_deposit', '1'),
(26, 'conf_hotel_timezone', 'Africa/Cairo'),
(27, 'conf_booking_turn_off', '0'),
(28, 'conf_min_night_booking', '1'),
(30, 'conf_notification_email', 'ghostm3z@gmail.com'),
(31, 'conf_price_with_tax', '1');

-- --------------------------------------------------------

--
-- Table structure for table `nelo_continut_mailuri`
--

DROP TABLE IF EXISTS `nelo_continut_mailuri`;
CREATE TABLE IF NOT EXISTS `nelo_continut_mailuri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_name` varchar(500) CHARACTER SET latin1 NOT NULL,
  `email_subject` varchar(500) CHARACTER SET latin1 NOT NULL,
  `email_text` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nelo_continut_mailuri`
--

INSERT INTO `nelo_continut_mailuri` (`id`, `email_name`, `email_subject`, `email_text`) VALUES
(1, 'Confirmation Email', 'Email de confirmare', '<p><strong>Exemplu text de confirmare</strong></p>\r\n'),
(2, 'Cancellation Email ', 'Email de anulare', '<p><strong>Exemplu text de anulare</strong></p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `nelo_facturare`
--

DROP TABLE IF EXISTS `nelo_facturare`;
CREATE TABLE IF NOT EXISTS `nelo_facturare` (
  `booking_id` int(10) NOT NULL,
  `client_name` varchar(500) CHARACTER SET latin1 NOT NULL,
  `client_email` varchar(500) CHARACTER SET latin1 NOT NULL,
  `invoice` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nelo_facturare`
--

INSERT INTO `nelo_facturare` (`booking_id`, `client_name`, `client_email`, `invoice`) VALUES
(1401188744, 'Gabriel Jicman', 'ghostm3z@gmail.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Detalii de rezervare</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">NumÄƒrul rezervÄƒrii</td><td align="left" style="background:#ffffff;" colspan="3">1401188744</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Numele clientului</td><td align="left" style="background:#ffffff;" colspan="3">Gabriel Jicman</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Data sosirii</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Data plecare</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">NopÅ£i totalÄƒ</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Camere totalÄƒ</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">27/05/2014</td><td align="center" style="background:#ffffff;">30/05/2014</td><td align="center" style="background:#ffffff;">3</td><td align="center" style="background:#ffffff;">2</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4">&nbsp;</td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">NumÄƒrul de camerÄƒ</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Tip de camerÄƒ</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Max ocupare</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total brut</td></tr><tr><td align="center" style="background:#ffffff;">2</td><td align="center" style="background:#ffffff;">Camera single (Capacitate camera single)</td><td align="center" style="background:#ffffff;">2 AdulÅ£i</td><td align="right" style="background:#ffffff;">lei0.00</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Totalul general</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Plata Ã®n avans(<span style="font-size: 10px;">7.00% din totalul general</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Detalii platÄƒ</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">OpÅ£iune de platÄƒ</td><td align="left" style="background:#ffffff;">Manual: Pay On Arival</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">TranzacÅ£ie ID</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1401190172, 'Jicman Gabriel', 'gabriel.jicman@gmail.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Detaliile rezervarii</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">NumÄƒrul rezervÄƒrii</td><td align="left" style="background:#ffffff;" colspan="3">1401190172</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Numele clientului</td><td align="left" style="background:#ffffff;" colspan="3">Jicman Gabriel</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Data sosirii</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Data plecarii</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Nr. nopti</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Nr. camere</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">28/05/2014</td><td align="center" style="background:#ffffff;">30/05/2014</td><td align="center" style="background:#ffffff;">2</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4">&nbsp;</td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">NumÄƒrul de camerÄƒ</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Tipul camerei</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Max ocupare</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total brut</td></tr><tr><td align="center" style="background:#ffffff;">1</td><td align="center" style="background:#ffffff;">Camera single (Capacitate camera single)</td><td align="center" style="background:#ffffff;">2 AdulÅ£i</td><td align="right" style="background:#ffffff;">lei0.00</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Totalul general</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Plata Ã®n avans(<span style="font-size: 10px;">7.00% din totalul general</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Detalii platÄƒ</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">OpÅ£iune de platÄƒ</td><td align="left" style="background:#ffffff;">Credit Card</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">NumÄƒrul cardului de credit</td><td align="left" style="background:#ffffff;">#####0285</td></tr></table>'),
(1401191712, 'Gabriel Jicman', 'ghostm3z@gmail.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Detaliile rezervarii</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">NumÄƒrul rezervÄƒrii</td><td align="left" style="background:#ffffff;" colspan="3">1401191712</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Numele clientului</td><td align="left" style="background:#ffffff;" colspan="3">Gabriel Jicman</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Data sosirii</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Data plecarii</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Nr. nopti</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Nr. camere</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">28/05/2014</td><td align="center" style="background:#ffffff;">30/05/2014</td><td align="center" style="background:#ffffff;">2</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4">&nbsp;</td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">NumÄƒrul de camerÄƒ</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Tipul camerei</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Max ocupare</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total brut</td></tr><tr><td align="center" style="background:#ffffff;">1</td><td align="center" style="background:#ffffff;">Camera single (Capacitate camera single)</td><td align="center" style="background:#ffffff;">2 AdulÅ£i</td><td align="right" style="background:#ffffff;">lei0.00</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Totalul general</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Plata Ã®n avans(<span style="font-size: 10px;">7.00% din totalul general</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Detalii platÄƒ</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">OpÅ£iune de platÄƒ</td><td align="left" style="background:#ffffff;">Manual: Plata la livrare</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">TranzacÅ£ie ID</td><td align="left" style="background:#ffffff;">NA</td></tr></table>'),
(1402352804, 'Gabriel Jicman', 'ghostm3z@gmail.com', '<table style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tbody><tr><td align="left" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;" colspan="4">Detaliile rezervarii</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">NumÄƒrul rezervÄƒrii</td><td align="left" style="background:#ffffff;" colspan="3">1402352804</td></tr>\r\n		<tr><td align="left" style="background:#ffffff;">Numele clientului</td><td align="left" style="background:#ffffff;" colspan="3">Gabriel Jicman</td></tr>	\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Data sosirii</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Data plecarii</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Nr. nopti</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Nr. camere</td></tr>\r\n		<tr><td align="center" style="background:#ffffff;">12/06/2014</td><td align="center" style="background:#ffffff;">21/06/2014</td><td align="center" style="background:#ffffff;">9</td><td align="center" style="background:#ffffff;">1</td></tr>\r\n		<tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4">&nbsp;</td></tr>\r\n		<tr><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">NumÄƒrul de camerÄƒ</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Tipul camerei</td><td align="center" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Max ocupare</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Total brut</td></tr><tr><td align="center" style="background:#ffffff;">1</td><td align="center" style="background:#ffffff;">Camera single (Capacitate camera single)</td><td align="center" style="background:#ffffff;">2 AdulÅ£i</td><td align="right" style="background:#ffffff;">lei0.00</td></tr><tr height="8px;"><td align="left" style="background:#ffffff;" colspan="4"></td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Sub Total</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Totalul general</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr><tr><td colspan="3" align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Plata Ã®n avans(<span style="font-size: 10px;">8.00% din totalul general</span>)</td><td align="right" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">lei0.00</td></tr></tbody></table><br /><table  style="font-family:Verdana, Geneva, sans-serif; font-size: 12px; background:#999999; width:700px; border:none;" cellpadding="4" cellspacing="1"><tr><td align="left" colspan="2" style="font-weight:bold; font-variant:small-caps; background:#eeeeee;">Detalii platÄƒ</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps;background:#ffffff;">OpÅ£iune de platÄƒ</td><td align="left" style="background:#ffffff;">Manual: Plata la livrare</td></tr><tr><td align="left" width="30%" style="font-weight:bold; font-variant:small-caps; background:#ffffff;">TranzacÅ£ie ID</td><td align="left" style="background:#ffffff;">NA</td></tr></table>');

-- --------------------------------------------------------

--
-- Table structure for table `nelo_informatii_cc`
--

DROP TABLE IF EXISTS `nelo_informatii_cc`;
CREATE TABLE IF NOT EXISTS `nelo_informatii_cc` (
  `booking_id` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cardholder_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `card_type` varchar(50) CHARACTER SET latin1 NOT NULL,
  `card_number` blob NOT NULL,
  `expiry_date` varchar(10) CHARACTER SET latin1 NOT NULL,
  `ccv2_no` int(4) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nelo_informatii_cc`
--

INSERT INTO `nelo_informatii_cc` (`booking_id`, `cardholder_name`, `card_type`, `card_number`, `expiry_date`, `ccv2_no`) VALUES
('1401190172', 'Jicman Gabriel', 'Visa', 0xde311c2fd1759d6eee747501c1f0b66e448e, '23/13', 2322);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_language`
--

DROP TABLE IF EXISTS `nelo_language`;
CREATE TABLE IF NOT EXISTS `nelo_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_title` varchar(255) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `lang_file` varchar(255) NOT NULL,
  `lang_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `nelo_language`
--

INSERT INTO `nelo_language` (`id`, `lang_title`, `lang_code`, `lang_file`, `lang_default`) VALUES
(1, 'English', 'en', 'english.php', 0),
(15, 'Romana', 'ro', 'romanian.php', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_metode_plata`
--

DROP TABLE IF EXISTS `nelo_metode_plata`;
CREATE TABLE IF NOT EXISTS `nelo_metode_plata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `gateway_code` varchar(50) CHARACTER SET latin1 NOT NULL,
  `account` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `nelo_metode_plata`
--

INSERT INTO `nelo_metode_plata` (`id`, `gateway_name`, `gateway_code`, `account`, `enabled`) VALUES
(1, 'Paypal', 'pp', 'gabriel_jicman@yahoo.com', 1),
(2, 'Manual', 'poa', NULL, 1),
(3, 'Carte de credit', 'cc', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_monezi`
--

DROP TABLE IF EXISTS `nelo_monezi`;
CREATE TABLE IF NOT EXISTS `nelo_monezi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(10) NOT NULL,
  `currency_symbl` varchar(10) NOT NULL,
  `exchange_rate` decimal(20,6) NOT NULL,
  `default_c` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nelo_monezi`
--

INSERT INTO `nelo_monezi` (`id`, `currency_code`, `currency_symbl`, `exchange_rate`, `default_c`) VALUES
(1, 'RON', 'LEI', '1.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_oferte_speciale`
--

DROP TABLE IF EXISTS `nelo_oferte_speciale`;
CREATE TABLE IF NOT EXISTS `nelo_oferte_speciale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `room_type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `price_deduc` decimal(10,2) NOT NULL,
  `min_stay` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nelo_planuri_tarifare`
--

DROP TABLE IF EXISTS `nelo_planuri_tarifare`;
CREATE TABLE IF NOT EXISTS `nelo_planuri_tarifare` (
  `plan_id` int(10) NOT NULL AUTO_INCREMENT,
  `roomtype_id` int(10) DEFAULT NULL,
  `capacity_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `sun` decimal(10,2) DEFAULT '0.00',
  `mon` decimal(10,2) DEFAULT '0.00',
  `tue` decimal(10,2) DEFAULT '0.00',
  `wed` decimal(10,2) DEFAULT '0.00',
  `thu` decimal(10,2) DEFAULT '0.00',
  `fri` decimal(10,2) DEFAULT '0.00',
  `sat` decimal(10,2) DEFAULT '0.00',
  `default_plan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plan_id`),
  KEY `priceplan` (`roomtype_id`,`capacity_id`,`start_date`,`end_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `nelo_planuri_tarifare`
--

INSERT INTO `nelo_planuri_tarifare` (`plan_id`, `roomtype_id`, `capacity_id`, `start_date`, `end_date`, `sun`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `default_plan`) VALUES
(1, 1, 1, '0000-00-00', '0000-00-00', '30.00', '30.00', '30.00', '30.00', '30.00', '30.00', '30.00', 1),
(3, 1, 2, '0000-00-00', '0000-00-00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_plati_avansate`
--

DROP TABLE IF EXISTS `nelo_plati_avansate`;
CREATE TABLE IF NOT EXISTS `nelo_plati_avansate` (
  `month_num` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(255) CHARACTER SET latin1 NOT NULL,
  `deposit_percent` decimal(10,2) NOT NULL,
  PRIMARY KEY (`month_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `nelo_plati_avansate`
--

INSERT INTO `nelo_plati_avansate` (`month_num`, `month`, `deposit_percent`) VALUES
(1, 'January', '3.00'),
(2, 'February', '4.00'),
(3, 'March', '5.00'),
(4, 'April', '6.00'),
(5, 'May', '7.00'),
(6, 'June', '8.00'),
(7, 'July', '9.00'),
(8, 'August', '10.00'),
(9, 'September', '11.00'),
(10, 'October', '12.00'),
(11, 'November', '13.00'),
(12, 'December', '14.00');

-- --------------------------------------------------------

--
-- Table structure for table `nelo_rezervari`
--

DROP TABLE IF EXISTS `nelo_rezervari`;
CREATE TABLE IF NOT EXISTS `nelo_rezervari` (
  `booking_id` int(10) unsigned NOT NULL,
  `booking_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date NOT NULL DEFAULT '0000-00-00',
  `client_id` int(10) unsigned DEFAULT NULL,
  `child_count` int(2) NOT NULL DEFAULT '0',
  `extra_guest_count` int(2) NOT NULL DEFAULT '0',
  `discount_coupon` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `total_cost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `payment_success` tinyint(1) NOT NULL DEFAULT '0',
  `payment_txnid` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `paypal_email` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `special_id` int(10) unsigned NOT NULL DEFAULT '0',
  `special_requests` text CHARACTER SET latin1,
  `is_block` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `block_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `booking_time` (`discount_coupon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nelo_rezervari`
--

INSERT INTO `nelo_rezervari` (`booking_id`, `booking_time`, `start_date`, `end_date`, `client_id`, `child_count`, `extra_guest_count`, `discount_coupon`, `total_cost`, `payment_amount`, `payment_type`, `payment_success`, `payment_txnid`, `paypal_email`, `special_id`, `special_requests`, `is_block`, `is_deleted`, `block_name`) VALUES
(1401188744, '2014-05-27 14:05:44', '2014-05-27', '2014-05-30', 1, 0, 0, NULL, '0.00', '0.00', 'poa', 1, NULL, NULL, 0, 'Vreau si o camera cu vedere la ocean.', 0, 1, NULL),
(1401190172, '2014-05-27 14:29:32', '2014-05-28', '2014-05-30', 2, 0, 0, NULL, '0.00', '0.00', 'cc', 1, NULL, NULL, 0, 'Test', 0, 1, NULL),
(1401191712, '2014-05-27 14:55:12', '2014-05-28', '2014-05-30', 1, 0, 0, NULL, '0.00', '0.00', 'poa', 1, NULL, NULL, 0, '', 0, 1, NULL),
(1402352804, '2014-06-10 01:26:44', '2014-06-12', '2014-06-21', 1, 0, 0, NULL, '0.00', '0.00', 'poa', 1, NULL, NULL, 0, 'Test', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_rezervari_site`
--

DROP TABLE IF EXISTS `nelo_rezervari_site`;
CREATE TABLE IF NOT EXISTS `nelo_rezervari_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookings_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `nelo_rezervari_site`
--

INSERT INTO `nelo_rezervari_site` (`id`, `bookings_id`, `room_id`, `room_type_id`) VALUES
(1, 1401188744, 4, 1),
(2, 1401188744, 5, 1),
(3, 1401190172, 4, 1),
(4, 1401191712, 5, 1),
(6, 1402352804, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nelo_tip_camera`
--

DROP TABLE IF EXISTS `nelo_tip_camera`;
CREATE TABLE IF NOT EXISTS `nelo_tip_camera` (
  `roomtype_ID` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `description` text CHARACTER SET latin1,
  `img` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`roomtype_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nelo_tip_camera`
--

INSERT INTO `nelo_tip_camera` (`roomtype_ID`, `type_name`, `description`, `img`) VALUES
(1, 'Camera single', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
