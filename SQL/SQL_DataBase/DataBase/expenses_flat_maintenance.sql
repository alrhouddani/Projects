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
-- Table structure for table `flat_maintenance`
--

DROP TABLE IF EXISTS `flat_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flat_maintenance` (
  `Part` text,
  `Date` text,
  `Price` text,
  `Flat  Insurance` text,
  `Start` text,
  `Exprie` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_maintenance`
--

LOCK TABLES `flat_maintenance` WRITE;
/*!40000 ALTER TABLE `flat_maintenance` DISABLE KEYS */;
INSERT INTO `flat_maintenance` VALUES ('Paint','November 22, 2019','PLN 150.00','PLN 199.00','June 20, 2020','June 20, 2021'),('bathtub leak','February 2, 2020','PLN 150.00','PLN 219.00','June 20, 2021','June 20, 2022'),('Windows shades 3','May 16, 2020','PLN 250.00','PLN 223.00','June 20, 2021','June 20, 2023'),('silicone ','June 20, 2020','PLN 30.00','','',''),('isolation type','June 20, 2020','PLN 17.00','','',''),('kitchen sink','October 23, 2020','PLN 219.00','','',''),('kitchen tap','October 23, 2020','PLN 150.00','','',''),('Toilet tap','October 23, 2020','PLN 92.00','','',''),('invisible silicone','October 23, 2020','PLN 15.00','','',''),('Windows curtains','March 6, 2021','PLN 370.00','','',''),('Cracked window','8 May 2021','PLN 230.00','','',''),('Windows curtains','June 7, 2021','PLN 210.00','','',''),('kitchen tile','October 10, 2021','PLN 300.00','','',''),('Door handles','July 10, 2022','PLN 50.00','','',''),('Toilet lock','July 10, 2022','PLN 120.00','','',''),('Flat paint','September 17, 2022','PLN 340.00','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','',''),('','','','','','');
/*!40000 ALTER TABLE `flat_maintenance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-27 20:29:36
