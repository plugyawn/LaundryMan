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
-- Table structure for table `hostel`
--

DROP TABLE IF EXISTS `hostel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel` (
  `Name` varchar(255) NOT NULL,
  `Room_No` varchar(255) NOT NULL,
  PRIMARY KEY (`Room_No`),
  KEY `Hostel_idx` (`Name`),
  CONSTRAINT `hostel_chk_1` CHECK (regexp_like(`Room_No`,_utf8mb4'^[A-L]-[1-4][0-9]{2}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel`
--

LOCK TABLES `hostel` WRITE;
/*!40000 ALTER TABLE `hostel` DISABLE KEYS */;
INSERT INTO `hostel` VALUES ('Aibaan','A-144'),('Aibaan','A-162'),('Aibaan','A-241'),('Aibaan','A-485'),('Aibaan','A-490'),('Beauki','B-159'),('Beauki','B-191'),('Beauki','B-194'),('Beauki','B-297'),('Beauki','B-339'),('Beauki','B-387'),('Beauki','B-451'),('Beauki','B-454'),('Beauki','B-461'),('Chimair','C-292'),('Chimair','C-365'),('Chimair','C-482'),('Duven','D-270'),('Duven','D-329'),('Duven','D-460'),('Emiet','E-147'),('Emiet','E-174'),('Emiet','E-228'),('Emiet','E-335'),('Firpeal','F-111'),('Firpeal','F-137'),('Firpeal','F-322'),('Firpeal','F-348'),('Firpeal','F-456'),('Firpeal','F-462'),('Griwiksh','G-132'),('Griwiksh','G-188'),('Griwiksh','G-246'),('Griwiksh','G-431'),('Griwiksh','G-458'),('Hiqom','H-227'),('Hiqom','H-399'),('Ijokha','I-363'),('Ijokha','I-391'),('Ijokha','I-471'),('Ijokha','I-475'),('Jurqia','J-110'),('Jurqia','J-128'),('Jurqia','J-168'),('Jurqia','J-184'),('Jurqia','J-186'),('Jurqia','J-369'),('Jurqia','J-412'),('Kyzeel','E-131'),('Lekhag','H-459');
/*!40000 ALTER TABLE `hostel` ENABLE KEYS */;
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
