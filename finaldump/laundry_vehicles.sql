-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: laundry
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `Vehicle_ID` varchar(255) NOT NULL,
  `Route` varchar(255) NOT NULL,
  `Capacity` int DEFAULT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Hostel_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Vehicle_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Hostel_Name` (`Hostel_Name`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `gsj_employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicles_ibfk_2` FOREIGN KEY (`Hostel_Name`) REFERENCES `hostel` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicles_chk_1` CHECK ((`Capacity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES ('GJ-02-AB-3177','4',300,2776,'Griwiksh'),('GJ-02-AB-3178','5',100,2776,'Kyzeel'),('GJ-02-AB-3199','4',300,2455,'Kyzeel'),('GJ-02-AB-3200','4',300,3065,'Lekhag'),('GJ-02-AB-3548','3',100,2147,'Jurqia'),('GJ-02-AB-4177','4',300,3065,'Beauki'),('GJ-02-AB-5261','3',400,2455,'Aibaan'),('GJ-02-AB-5357','3',100,2487,'Chimair'),('GJ-02-AB-5358','1',300,2487,'Griwiksh'),('GJ-02-AB-5514','2',300,4446,'Firpeal'),('GJ-02-AB-5515','4',300,4446,'Jurqia'),('GJ-02-AB-7165','3',300,7924,'Ijokha'),('GJ-02-AB-9086','2',200,2371,'Duven'),('GJ-02-AB-9087','2',200,2371,'Hiqom'),('GJ-02-AB-9336','1',100,4765,'Emiet'),('GJ-02-AB-9337','3',100,4765,'Ijokha'),('GJ-02-AB-9985','1',300,9949,'Hiqom');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17 23:39:13
