CREATE DATABASE  IF NOT EXISTS `consignment_development` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `consignment_development`;
-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: consignment_development
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `street_address` text,
  `city` text,
  `province` text,
  `postal` text,
  `acct_open_date` datetime DEFAULT NULL,
  `last_trans_date` datetime DEFAULT NULL,
  `trans_type` int(11) DEFAULT NULL,
  `agreement_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Shaun','McArthur','2018-01-01 01:00:00','2018-12-17 00:21:04','519-473-8855','shamca@bell.net',1,'','',NULL,NULL,NULL,'2018-12-16 00:00:00',1,1),(2,'2-Biff','McFarterWooHoo','2018-10-28 21:23:13','2018-12-18 23:52:23','555-555-1212','biff@anus.com',1,'','',NULL,NULL,NULL,'2018-12-18 00:00:00',1,1),(3,'2-Biff','McFarter','2018-10-28 21:23:52','2018-12-16 23:09:01','555-555-1212','biff@anus.com',1,'00 Cynical Blvd','London',NULL,NULL,NULL,'2018-12-16 00:00:00',1,1),(4,'2-Biff','McFarter','2018-10-28 21:25:06','2018-12-16 23:08:27','555-555-1212','biff@anus.com',1,'','',NULL,NULL,NULL,'2018-12-16 00:00:00',1,1),(5,'3-Chiff','McFarter','2018-10-28 21:25:07','2018-10-28 21:25:07','555-555-1212','chiff@anus.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Shaun','McArthur','2018-10-29 00:12:52','2018-12-16 22:53:26','5196436458','',1,'','',NULL,NULL,'2018-12-05 00:00:00','2018-12-16 00:00:00',1,1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-19 17:59:03
