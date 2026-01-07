-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.11.13-MariaDB-0ubuntu0.24.04.1 - Ubuntu 24.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping database structure for kruu
CREATE DATABASE IF NOT EXISTS `kruu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `kruu`;

-- Dumping structure for table kruu.event
CREATE TABLE IF NOT EXISTS `event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_type_id` int(10) unsigned NOT NULL,
  `count` float NOT NULL DEFAULT 1,
  `raw_text` text DEFAULT NULL,
  `source` enum('text','voice','manual','import') NOT NULL DEFAULT 'manual',
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_event_date` (`date`),
  KEY `idx_event_type_date` (`event_type_id`,`date`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kruu.event: ~0 rows (approximately)

-- Dumping structure for table kruu.event_type
CREATE TABLE IF NOT EXISTS `event_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_description` varchar(20) NOT NULL,
  `color` varchar(20) DEFAULT 'blue',
  `score` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kruu.event_type: ~11 rows (approximately)
INSERT INTO `event_type` (`id`, `code`, `name`, `description`, `unit_description`, `color`, `score`) VALUES
	(1, 'AC', 'Alcohol', 'Drinking beer, wine, and other alcohols', 'drink', 'Tomato', -1),
	(2, 'GZ', 'Marijuana', 'Smoking marijuana', 'puffs', 'Tangerine', -2),
	(3, 'GM', 'Gaming', 'Playing computer games', 'hours', 'Tangerine', 0),
	(4, 'CG', 'Smoking', 'Smoking cigarettes, vaping', 'cigarettes', 'Tomato', -1),
	(5, 'YT', 'Youtube', 'Watching youtube, other non-productive browsing', 'hours', 'Banana', -1),
	(6, 'PN', 'PN', 'PN', 'count', 'Flamingo', -2),
	(7, 'SR', 'Sports', 'Sports and other outdoor activities', 'hours', 'Basil', 2),
	(8, 'PP', 'People', 'Meeting people socially', 'hours', 'Grape', 1),
	(9, 'RD', 'Reading', 'Reading books ', 'hours', 'Sage', 1),
	(10, 'JB', 'Work', 'Work, coding, learning', 'pomodoros', 'Peacock', 1),
	(11, 'SX', 'SX', 'SX', 'count', 'Grape', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
