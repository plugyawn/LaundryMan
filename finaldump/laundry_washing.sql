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
-- Table structure for table `washing`
--

DROP TABLE IF EXISTS `washing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `washing` (
  `Order_ID` int NOT NULL,
  `Machine_ID` int NOT NULL,
  `Duration` int DEFAULT NULL,
  PRIMARY KEY (`Order_ID`,`Machine_ID`),
  KEY `Machine_ID` (`Machine_ID`),
  CONSTRAINT `washing_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `washing_ibfk_2` FOREIGN KEY (`Machine_ID`) REFERENCES `smart_laundry` (`Machine_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `washing_chk_1` CHECK ((`Duration` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washing`
--

LOCK TABLES `washing` WRITE;
/*!40000 ALTER TABLE `washing` DISABLE KEYS */;
INSERT INTO `washing` VALUES (1,7,81),(2,2,60),(2,4,106),(4,4,26),(4,8,35),(4,9,68),(5,7,72),(6,7,59),(9,8,101),(10,3,79),(10,10,35),(12,9,83),(13,8,41),(14,4,103),(16,9,29),(17,5,24),(18,8,76),(19,4,105),(20,1,107),(22,4,92),(23,1,32),(23,3,79),(23,8,112),(24,2,46),(24,3,89),(24,4,96),(24,7,105),(25,8,75),(27,2,70),(27,3,82),(27,5,34),(27,9,46),(28,5,85),(32,3,120),(32,7,70),(33,9,10),(34,6,101),(37,9,64),(38,5,44),(38,10,48),(40,1,86),(41,7,58),(43,1,28),(46,2,25),(46,5,33),(50,6,71),(50,8,109),(51,4,97),(52,3,41),(52,6,14),(53,6,25),(54,1,54),(55,8,116),(55,9,45),(56,1,47),(56,4,10),(57,9,15),(59,3,37),(59,9,98),(60,5,91),(62,5,105),(63,5,51),(66,8,25),(67,7,119),(68,8,36),(70,9,34),(72,8,42),(73,8,31);
/*!40000 ALTER TABLE `washing` ENABLE KEYS */;
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
