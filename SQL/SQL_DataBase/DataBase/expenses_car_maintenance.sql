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
-- Table structure for table `car_maintenance`
--

DROP TABLE IF EXISTS `car_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_maintenance` (
  `Part` text,
  `Date` text,
  `KM` text,
  `Price` text,
  `Car Insurance` text,
  `Start` text,
  `Exprie` text,
  `LPG Start` text,
  `LPG Exprie` text,
  `The Car Price` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_maintenance`
--

LOCK TABLES `car_maintenance` WRITE;
/*!40000 ALTER TABLE `car_maintenance` DISABLE KEYS */;
INSERT INTO `car_maintenance` VALUES ('5w30 engine oil synthetic','25-Nov-2019','206k','PLN 80.00','PLN 900.00','27-Nov-2019','27-Nov-2020','27-Sep-2016','27-Sep-2026','PLN 5,800.00'),('Oil Filter','25-Nov-2019','206k','PLN 20.00','PLN 840.00','27-Nov-2020','27-Nov-2021','','',''),('Air filter ','25-Nov-2019','206k','PLN 30.00','PLN 838.00','27-Nov-2021','27-Nov-2022','','',''),('Cabinet filter ','25-Nov-2019','206k','PLN 20.00','','27-Nov-2022','27-Nov-2023','','',''),('Serves fee','25-Nov-2019','206k','PLN 110.00','','','','','',''),('Wiper Blades','15-Dec-2019','210k','PLN 77.00','','','','','',''),('Spark Plugs','10-Jan-2020','215k','PLN 60.00','','','','','',''),('light bulb','10-Jan-2020','215k','PLN 20.00','','','','','',''),('Serves fee','10-Jan-2020','215k','PLN 50.00','','','','','',''),('OBD 2 scan','10-Jan-2020','215k','PLN 50.00','','','','','',''),('OBD 2 scan','14-Jan-2020','215k','PLN 50.00','','','','','',''),('LPG reducer connector','14-Jan-2020','215k','PLN 120.00','','','','','',''),('Battery 12v 60ah 540a','27-Jan-2020','216k','PLN 330.00','','','','','',''),('Bulb standard 7443','10-Feb-2020','217k','PLN 6.00','','','','','',''),('Serves fee KS and WB  check','17-Jan-2020','218k','PLN 30.00','','','','','',''),('car key repair ','17-Jan-2020','218k','PLN 60.00','','','','','',''),('Car inspection ','18-Feb-2020','218k','PLN 162.00','','','','','',''),('WB F-driver side','18-Mar-2020','219k','PLN 300.00','','','','','',''),('Serves fee','18-Mar-2020','219k','PLN 100.00','','','','','',''),('5w30 engine oil synthetic','11-May-2020','220k','PLN 100.00','','','','','',''),('Oil Filter','11-May-2020','220k','PLN 20.00','','','','','',''),('Air filter ','11-May-2020','220k','PLN 30.00','','','','','',''),('Serves fee','11-May-2020','220k','PLN 50.00','','','','','',''),(' 2 Rear Sway Bar Link','19-Jun-2020','220k','PLN 100.00','','','','','',''),('Serves fee','19-Jun-2020','220k','PLN 50.00','','','','','',''),('OBD 2 scan','19-Jun-2020','220k','PLN 50.00','','','','','',''),('Serves fee Misefire C01','19-Jun-2020','220k','PLN 50.00','','','','','',''),('Headlight bulb','25-Sep-2020','221k','PLN 11.00','','','','','',''),('Car inspection ','18-Feb-2021','222k','PLN 162.00','','','','','',''),('Upper break light ','18-Feb-2021','222k','PLN 6.00','','','','','',''),('Rear disc breaks','25-Feb-2021','222k','PLN 200.00','','','','','',''),('Break Pads','25-Feb-2021','222k','PLN 125.00','','','','','',''),('New Axle Pin Axle 1 ','25-Feb-2021','222k','PLN 70.00','','','','','',''),('Headlight polishing','25-Feb-2021','222k','PLN 120.00','','','','','',''),('Serves fee','25-Feb-2021','222k','PLN 300.00','','','','','',''),('Break bulb x2','25-Feb-2021','222k','PLN 8.54','','','','','',''),('Headlight bulb','25-Feb-2021','222k','PLN 14.00','','','','','',''),('5w30 engine oil synthetic','10-Jun-2021','223k','PLN 100.00','','','','','',''),('Oil Filter','10-Jun-2021','223k','PLN 20.00','','','','','',''),('Air filter ','10-Jun-2021','223k','PLN 30.00','','','','','',''),('Recharge AC','10-Jun-2021','223k','PLN 60.00','','','','','',''),('Serves fee','10-Jun-2021','223k','PLN 50.00','','','','','',''),('Coolant ','5-Mar-2022','223k','PLN 20.00','','','','','',''),('LPG reducer ','17-May-2022','230k','PLN 700.00','','','','','',''),('5w30 engine oil synthetic','16-Jul-2022','233k','PLN 115.00','','','','','',''),('Oil Filter','16-Jul-2022','233k','PLN 20.00','','','','','',''),('Air filter ','16-Jul-2022','233k','PLN 30.00','','','','','',''),('Serves fee','16-Jul-2022','233k','PLN 50.00','','','','','',''),('Coolant ','24-Sep-2022','234k','PLN 81.00','','','','','','');
/*!40000 ALTER TABLE `car_maintenance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-27 20:29:43
