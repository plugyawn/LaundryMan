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
-- Table structure for table `places_order`
--

DROP TABLE IF EXISTS `places_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places_order` (
  `Order_ID` int DEFAULT NULL,
  `Customer_Laundry_No` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Feedback` varchar(255) DEFAULT NULL,
  KEY `Order_ID` (`Order_ID`),
  KEY `Customer_Laundry_No` (`Customer_Laundry_No`),
  CONSTRAINT `places_order_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `places_order_ibfk_2` FOREIGN KEY (`Customer_Laundry_No`) REFERENCES `customer` (`Laundry_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `places_order_chk_1` CHECK (((`Rating` >= 1) and (`Rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_order`
--

LOCK TABLES `places_order` WRITE;
/*!40000 ALTER TABLE `places_order` DISABLE KEYS */;
INSERT INTO `places_order` VALUES (68,46,5,'Average'),(63,37,5,'Fair'),(11,35,2,'Average'),(1,31,4,'Average'),(62,2,1,'Average'),(6,46,4,'Average'),(55,51,1,'Average'),(41,21,1,'Poor'),(1,28,1,'Poor'),(5,33,4,'Fair'),(28,69,3,'Fair'),(70,64,4,'Excellent'),(70,4,3,'Average'),(32,42,3,'Fair'),(27,62,5,'Average'),(56,8,2,'Poor'),(11,53,1,'Excellent'),(74,65,1,'Excellent'),(32,58,5,'Poor'),(59,27,4,'Average'),(17,11,1,'Good'),(33,56,4,'Poor'),(72,52,3,'Poor'),(24,31,2,'Fair'),(38,8,5,'Good'),(27,61,4,'Fair'),(37,23,4,'Fair'),(27,45,3,'Average'),(68,38,5,'Good'),(43,17,4,'Fair'),(3,23,2,'Average'),(14,39,2,'Fair'),(40,48,1,'Good'),(58,58,5,'Fair'),(16,31,4,'Poor'),(41,49,2,'Poor'),(35,56,2,'Good'),(23,1,3,'Fair'),(2,43,2,'Poor'),(37,58,4,'Excellent'),(13,49,2,'Poor'),(6,10,3,'Average'),(74,56,3,'Poor'),(59,35,5,'Excellent'),(45,24,1,'Poor'),(1,44,1,'Fair'),(73,52,1,'Average'),(34,31,5,'Fair'),(29,16,2,'Fair'),(43,17,1,'Good'),(1,63,1,'Excellent'),(58,46,4,'Excellent'),(40,40,3,'Fair'),(63,5,5,'Good'),(4,37,2,'Poor'),(3,54,2,'Average'),(27,60,2,'Average'),(30,69,5,'Excellent'),(43,2,1,'Good'),(52,64,5,'Excellent'),(29,8,1,'Excellent'),(55,22,3,'Good'),(51,16,3,'Excellent'),(29,6,4,'Fair'),(14,6,2,'Poor'),(60,44,3,'Poor'),(35,14,2,'Good'),(55,38,5,'Excellent'),(34,51,4,'Good'),(44,31,3,'Fair');
/*!40000 ALTER TABLE `places_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17  7:04:14
