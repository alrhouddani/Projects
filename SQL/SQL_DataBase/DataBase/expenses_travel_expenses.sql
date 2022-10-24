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
-- Table structure for table `travel_expenses`
--

DROP TABLE IF EXISTS `travel_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_expenses` (
  `Year` int DEFAULT NULL,
  `Date` text,
  `Petrol` text,
  `LPG` text,
  `Office/Home` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_expenses`
--

LOCK TABLES `travel_expenses` WRITE;
/*!40000 ALTER TABLE `travel_expenses` DISABLE KEYS */;
INSERT INTO `travel_expenses` VALUES (2019,'27-Sep-19','PLN 40.00','PLN 116.00','Office'),(2019,'4-Oct-19','PLN 80.00','PLN 20.00','Office'),(2019,'7-Oct-19','PLN 0.00','PLN 70.00','Office'),(2019,'13-Oct-19','PLN 0.00','PLN 95.00','Office'),(2019,'20-Oct-19','PLN 20.00','PLN 65.00','Office'),(2019,'27-Oct-19','PLN 0.00','PLN 95.00','Office'),(2019,'2-Nov-19','PLN 60.00','PLN 65.00','Office'),(2019,'11-Nov-19','PLN 12.00','PLN 88.00','Office'),(2019,'17-Nov-19','PLN 100.00','PLN 100.00','Office'),(2019,'24-Nov-19','PLN 0.00','PLN 95.00','Office'),(2019,'1-Dec-19','PLN 0.00','PLN 96.00','Office'),(2019,'8-Dec-19','PLN 100.00','PLN 0.00','Office'),(2019,'15-Dec-19','PLN 0.00','PLN 127.00','Office'),(2019,'22-Dec-19','PLN 100.00','PLN 100.00','Office'),(2020,'30-Dec-19','PLN 0.00','PLN 100.00','Office'),(2020,'5-Jan-20','PLN 35.00','PLN 65.00','Office'),(2020,'12-Jan-20','PLN 109.00','PLN 90.00','Office'),(2020,'26-Jan-20','PLN 70.00','PLN 120.00','Office'),(2020,'2-Feb-20','PLN 18.00','PLN 82.00','Office'),(2020,'8-Feb-20','PLN 100.00','PLN 100.00','Office'),(2020,'18-Feb-20','PLN 20.00','PLN 100.00','Office'),(2020,'23-Feb-20','PLN 20.00','PLN 83.00','Office'),(2020,'1-Mar-20','PLN 50.00','PLN 80.00','Office'),(2020,'8-Mar-20','PLN 109.00','PLN 63.00','Office'),(2020,'15-Mar-20','PLN 0.00','PLN 0.00','Home '),(2020,'22-Mar-20','PLN 0.00','PLN 0.00','Home '),(2020,'29-Mar-20','PLN 0.00','PLN 0.00','Home '),(2020,'4-Apr-20','PLN 0.00','PLN 0.00','Home '),(2020,'12-Apr-20','PLN 0.00','PLN 0.00','Home '),(2020,'23-Apr-20','PLN 26.00','PLN 0.00','Home '),(2020,'3-May-20','PLN 0.00','PLN 0.00','Home '),(2020,'12-May-20','PLN 131.00','PLN 41.00','Home '),(2020,'17-May-20','PLN 0.00','PLN 0.00','Home '),(2020,'23-May-20','PLN 0.00','PLN 0.00','Home '),(2020,'1-Jun-20','PLN 0.00','PLN 0.00','Home '),(2020,'8-Jun-20','PLN 0.00','PLN 0.00','Home '),(2020,'12-Jun-20','PLN 25.00','PLN 0.00','Home '),(2020,'16-Jun-20','PLN 50.00','PLN 0.00','Home '),(2020,'1-Jul-20','PLN 80.00','PLN 0.00','Home '),(2020,'12-Jul-20','PLN 0.00','PLN 0.00','Home '),(2020,'19-Jul-20','PLN 0.00','PLN 0.00','Home '),(2020,'24-Jul-20','PLN 40.00','PLN 0.00','Home '),(2020,'1-Aug-20','PLN 20.00','PLN 0.00','Home '),(2020,'7-Aug-20','PLN 52.00','PLN 0.00','Home '),(2020,'16-Aug-20','PLN 100.00','PLN 40.00','Home '),(2020,'22-Aug-20','PLN 0.00','PLN 0.00','Home '),(2020,'1-Sep-20','PLN 0.00','PLN 0.00','Home '),(2020,'6-Sep-20','PLN 0.00','PLN 0.00','Home '),(2020,'13-Sep-20','PLN 20.00','PLN 0.00','Home '),(2020,'20-Sep-20','PLN 80.00','PLN 0.00','Home '),(2020,'1-Oct-20','PLN 20.00','PLN 0.00','Home '),(2020,'11-Oct-20','PLN 60.00','PLN 0.00','Home '),(2020,'18-Oct-20','PLN 0.00','PLN 0.00','Home '),(2020,'25-Oct-20','PLN 25.00','PLN 0.00','Home '),(2020,'1-Nov-20','PLN 40.00','PLN 0.00','Home '),(2020,'6-Nov-20','PLN 100.00','PLN 0.00','Home '),(2020,'15-Nov-20','PLN 0.00','PLN 0.00','Home '),(2020,'25-Nov-20','PLN 20.00','PLN 0.00','Home '),(2020,'6-Dec-20','PLN 50.00','PLN 0.00','Home '),(2020,'18-Dec-20','PLN 35.00','PLN 0.00','Home '),(2020,'23-Dec-20','PLN 50.00','PLN 0.00','Home '),(2020,'30-Dec-20','PLN 0.00','PLN 0.00','Home '),(2021,'7-Jan-21','PLN 90.58','PLN 0.00','Home '),(2021,'16-Jan-21','PLN 0.00','PLN 0.00','Home '),(2021,'23-Jan-21','PLN 0.00','PLN 0.00','Home '),(2021,'30-Jan-21','PLN 0.00','PLN 0.00','Home '),(2021,'2-Feb-21','PLN 88.76','PLN 0.00','Home '),(2021,'12-Feb-21','PLN 40.00','PLN 0.00','Home '),(2021,'18-Feb-21','PLN 30.00','PLN 20.00','Home '),(2021,'26-Feb-21','PLN 40.00','PLN 0.00','Home '),(2021,'3-Mar-21','PLN 20.00','PLN 0.00','Home '),(2021,'6-Mar-21','PLN 100.00','PLN 0.00','Home '),(2021,'13-Mar-21','PLN 20.00','PLN 30.00','Home '),(2021,'31-Mar-21','PLN 0.00','PLN 0.00','Home '),(2021,'1-Apr-21','PLN 0.00','PLN 20.00','Home '),(2021,'8-Apr-21','PLN 50.00','PLN 45.00','Home '),(2021,'15-Apr-21','PLN 40.00','PLN 20.00','Home '),(2021,'30-Apr-21','PLN 0.00','PLN 0.00','Home '),(2021,'6-May-21','PLN 40.00','PLN 0.00','Home '),(2021,'8-May-21','PLN 140.00','PLN 40.00','Home '),(2021,'9-May-21','PLN 50.00','PLN 0.00','Home '),(2021,'31-May-21','PLN 0.00','PLN 0.00','Home '),(2021,'9-Jun-21','PLN 120.00','PLN 80.00','Home '),(2021,'18-Jun-21','PLN 0.00','PLN 0.00','Home '),(2021,'20-Jun-21','PLN 0.00','PLN 0.00','Home '),(2021,'30-Jun-21','PLN 0.00','PLN 0.00','Home '),(2021,'7-Jul-21','PLN 50.00','PLN 80.00','Home '),(2021,'21-Jul-21','PLN 0.00','PLN 0.00','Home '),(2021,'21-Jul-21','PLN 0.00','PLN 0.00','Home '),(2021,'21-Jul-21','PLN 0.00','PLN 0.00','Home '),(2021,'9-Aug-21','PLN 70.00','PLN 80.00','Home '),(2021,'9-Aug-21','PLN 0.00','PLN 0.00','Home '),(2021,'9-Aug-21','PLN 0.00','PLN 0.00','Home '),(2021,'9-Aug-21','PLN 0.00','PLN 0.00','Home '),(2021,'1-Sep-21','PLN 0.00','PLN 0.00','Home '),(2021,'1-Sep-21','PLN 0.00','PLN 0.00','Home '),(2021,'1-Sep-21','PLN 0.00','PLN 0.00','Home '),(2021,'1-Sep-21','PLN 0.00','PLN 0.00','Home '),(2021,'19-Oct-21','PLN 102.00','PLN 0.00','Home '),(2021,'19-Oct-21','PLN 0.00','PLN 0.00','Home '),(2021,'19-Oct-21','PLN 0.00','PLN 0.00','Home '),(2021,'19-Oct-21','PLN 0.00','PLN 0.00','Home '),(2021,'6-Nov-21','PLN 0.00','PLN 0.00','Home '),(2021,'12-Nov-21','PLN 100.00','PLN 0.00','Home '),(2021,'12-Nov-21','PLN 0.00','PLN 0.00','Home '),(2021,'12-Nov-21','PLN 0.00','PLN 0.00','Home '),(2021,'17-Dec-21','PLN 100.00','PLN 0.00','Home '),(2021,'17-Dec-21','PLN 0.00','PLN 0.00','Home '),(2021,'17-Dec-21','PLN 0.00','PLN 0.00','Home '),(2021,'30-Dec-21','PLN 56.00','PLN 0.00','Home '),(2022,'1-Jan-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Jan-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Jan-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Jan-22','PLN 0.00','PLN 0.00','Home '),(2022,'4-Feb-22','PLN 56.00','PLN 0.00','Home '),(2022,'17-Feb-22','PLN 200.00','PLN 80.00','Home '),(2022,'17-Feb-22','PLN 0.00','PLN 0.00','Home '),(2022,'17-Feb-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Mar-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Mar-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Mar-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Mar-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Apr-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Apr-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Apr-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-Apr-22','PLN 0.00','PLN 0.00','Home '),(2022,'17-May-22','PLN 40.00','PLN 0.00','Home '),(2022,'1-May-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-May-22','PLN 0.00','PLN 0.00','Home '),(2022,'1-May-22','PLN 0.00','PLN 0.00','Home '),(2022,'7-Jun-22','PLN 200.00','PLN 138.00','Home '),(2022,'8-Jun-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Jun-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Jun-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Jul-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Jul-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Jul-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Jul-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Aug-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Aug-22','PLN 0.00','PLN 0.00','Home '),(2022,'8-Aug-22','PLN 0.00','PLN 0.00','Home '),(2022,'28-Aug-22','PLN 0.00','PLN 50.00','Home '),(2022,'16-Sep-22','PLN 120.00','PLN 84.00','Home '),(2022,'16-Sep-22','PLN 0.00','PLN 0.00','Home '),(2022,'16-Sep-22','PLN 0.00','PLN 0.00','Home '),(2022,'16-Sep-22','PLN 0.00','PLN 0.00','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home '),(2022,'','','','Home ');
/*!40000 ALTER TABLE `travel_expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-27 20:29:12
