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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Order_ID` int NOT NULL,
  `Type_of_Service` varchar(255) NOT NULL,
  `Hostel_Name` varchar(255) DEFAULT NULL,
  `Total_Quantity` int DEFAULT NULL,
  `Status` varchar(255) NOT NULL,
  `Customer_Laundry_No` int DEFAULT NULL,
  `Hostel_Room_No` varchar(255) DEFAULT NULL,
  `Employee_ID` int DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  KEY `Hostel_Room_No` (`Hostel_Room_No`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `gsj_employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Hostel_Room_No`) REFERENCES `hostel` (`Room_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_chk_1` CHECK ((`Total_Quantity` > 0)),
  CONSTRAINT `order_chk_2` CHECK ((`Status` in (_utf8mb4'Received',_utf8mb4'Processing',_utf8mb4'Completed')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Wash','Ijokha',1,'Completed',NULL,'G-431',2455),(2,'Iron','Hiqom',12,'Received',NULL,'G-132',3065),(3,'DryClean','Duven',11,'Completed',NULL,'C-482',2487),(4,'Wash','Chimair',6,'Received',NULL,'E-174',2371),(5,'Wash','Beauki',2,'Processing',NULL,'I-391',4765),(6,'All','Aibaan',9,'Received',NULL,'B-387',4446),(7,'Wash','Griwiksh',6,'Processing',NULL,'D-460',2776),(8,'DryClean','Chimair',11,'Processing',NULL,'B-194',9949),(9,'All','Aibaan',14,'Received',NULL,'B-159',7924),(10,'All','Hiqom',7,'Processing',NULL,'F-462',2147),(11,'All','Beauki',10,'Completed',NULL,'A-485',2455),(12,'DryClean','Chimair',10,'Processing',NULL,'B-191',3065),(13,'Iron','Aibaan',4,'Received',NULL,'F-456',2487),(14,'DryClean','Chimair',15,'Received',NULL,'E-228',2371),(15,'Wash','Jurqia',1,'Processing',NULL,'I-363',4765),(16,'All','Ijokha',1,'Completed',NULL,'F-111',4446),(17,'DryClean','Emiet',20,'Processing',NULL,'C-365',2776),(18,'All','Beauki',18,'Processing',NULL,'H-399',9949),(19,'Wash','Beauki',11,'Processing',NULL,'I-471',2455),(20,'Iron','Firpeal',1,'Received',NULL,'E-131',3065),(21,'Iron','Griwiksh',17,'Completed',NULL,'H-459',2487),(22,'Wash','Beauki',13,'Completed',NULL,'J-412',2371),(23,'Wash','Emiet',19,'Received',NULL,'A-490',4765),(24,'Wash','Griwiksh',6,'Completed',NULL,'B-461',4446),(25,'DryClean','Aibaan',13,'Processing',NULL,'A-241',2776),(26,'DryClean','Emiet',7,'Processing',NULL,'J-184',9949),(27,'Wash','Hiqom',13,'Processing',NULL,'B-339',7924),(28,'DryClean','Firpeal',6,'Processing',NULL,'D-329',2147),(29,'Iron','Jurqia',15,'Completed',NULL,'F-137',2455),(30,'Iron','Beauki',14,'Received',NULL,'D-270',3065),(31,'Wash','Duven',13,'Received',NULL,'B-297',2487),(32,'All','Beauki',1,'Completed',NULL,'F-322',2371),(33,'Wash','Jurqia',17,'Completed',NULL,'J-369',4765),(34,'Iron','Ijokha',16,'Processing',NULL,'I-475',4446),(35,'DryClean','Chimair',2,'Received',NULL,'A-144',2776),(36,'All','Aibaan',17,'Received',NULL,'G-458',9949),(37,'All','Aibaan',20,'Received',NULL,'J-128',7924),(38,'Wash','Duven',20,'Completed',NULL,'H-227',2147),(39,'All','Emiet',12,'Received',NULL,'J-110',2455),(40,'Wash','Firpeal',10,'Completed',NULL,'B-451',3065),(41,'Iron','Duven',12,'Received',NULL,'G-246',2487),(42,'Wash','Ijokha',13,'Received',NULL,'E-147',2371),(43,'DryClean','Chimair',4,'Completed',NULL,'J-186',4765),(44,'Wash','Griwiksh',14,'Received',NULL,'E-335',4446),(45,'Wash','Emiet',16,'Received',NULL,'G-188',2776),(46,'Wash','Firpeal',11,'Completed',NULL,'C-292',9949),(47,'Iron','Ijokha',14,'Processing',NULL,'J-168',7924),(48,'All','Jurqia',14,'Processing',NULL,'F-348',2147),(49,'All','Emiet',6,'Received',NULL,'B-454',2455),(50,'All','Ijokha',17,'Processing',NULL,'A-162',3065),(51,'All','Hiqom',3,'Processing',NULL,'G-431',2487),(52,'All','Ijokha',10,'Completed',NULL,'G-132',2371),(53,'Iron','Firpeal',3,'Completed',NULL,'C-482',4765),(54,'Wash','Aibaan',8,'Received',NULL,'E-174',4446),(55,'All','Firpeal',5,'Completed',NULL,'I-391',2776),(56,'DryClean','Griwiksh',18,'Completed',NULL,'B-387',9949),(57,'Wash','Emiet',14,'Completed',NULL,'D-460',7924),(58,'Wash','Emiet',15,'Received',NULL,'B-194',2147),(59,'Iron','Chimair',8,'Received',NULL,'B-159',2455),(60,'DryClean','Griwiksh',9,'Received',NULL,'F-462',3065),(61,'Wash','Aibaan',18,'Processing',NULL,'A-485',2487),(62,'Iron','Firpeal',11,'Received',NULL,'B-191',2371),(63,'Iron','Griwiksh',7,'Completed',NULL,'F-456',4765),(64,'Wash','Griwiksh',7,'Received',NULL,'E-228',4446),(65,'All','Duven',20,'Received',NULL,'I-363',2776),(66,'All','Chimair',13,'Completed',NULL,'F-111',9949),(67,'All','Aibaan',5,'Received',NULL,'C-365',7924),(68,'Wash','Hiqom',6,'Completed',NULL,'H-399',2147),(69,'All','Hiqom',6,'Received',NULL,'I-471',2455),(70,'Wash','Firpeal',17,'Completed',NULL,'E-131',3065),(71,'All','Duven',11,'Received',NULL,'H-459',2487),(72,'Iron','Griwiksh',4,'Processing',NULL,'J-412',2371),(73,'DryClean','Hiqom',19,'Processing',NULL,'A-490',4765),(74,'All','Ijokha',7,'Processing',NULL,'B-461',4446),(75,'Wash','Hiqom',5,'Completed',NULL,'A-241',2776);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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
