-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: expenses
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `weight_management`
--

DROP TABLE IF EXISTS `weight_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weight_management` (
  `Date` text,
  `Time` text,
  `Weight KG` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weight_management`
--

LOCK TABLES `weight_management` WRITE;
/*!40000 ALTER TABLE `weight_management` DISABLE KEYS */;
INSERT INTO `weight_management` VALUES ('1-Jun-21','7:54 AM',94.1),('1-Jul-21','7:54 AM',90.1),('2-Jul-21','8:49 AM',89.2),('16-Jul-21','8:30 AM',88.9),('28-Jul-21','7:54 AM',87.9),('15-Sep-22','7:30 AM',86.2),('1-May-22','7:30 AM',90),('20-May-22','7:30 AM',86.4),('29-May-22','8:30 AM',85.5),('12-Jun-22','9:00 AM',85.3),('17-Jun-22','9:00 AM',84.7),('24-Jun-22','9:00 AM',83.9),('4-Jul-22','9:00 PM',84.4),('5-Jul-22','9:00 AM',83),('21-Jul-22','8:00 AM',82.7),('25-Jul-22','8:00 AM',82),('29-Jul-22','8:00 AM',81.4),('10-Aug-22','8:00 AM',81.8),('20-Aug-22','8:00 AM',80.5);
/*!40000 ALTER TABLE `weight_management` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-27 20:29:31
