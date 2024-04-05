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
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL,
  `Mode` varchar(255) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  CONSTRAINT `payment_chk_1` CHECK ((`Mode` in (_utf8mb4'Cash',_utf8mb4'Credit',_utf8mb4'Debit',_utf8mb4'Online'))),
  CONSTRAINT `payment_chk_2` CHECK ((`Amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1056441,'Credit',252.96),(1165038,'Credit',395.10),(1215834,'Credit',288.52),(1289379,'Cash',269.40),(1304862,'Online',177.86),(1461813,'Debit',234.77),(1511077,'Debit',49.41),(1579065,'Online',399.82),(1614992,'Online',264.76),(1761583,'Debit',164.06),(1833004,'Debit',84.00),(1934759,'Debit',454.47),(2039553,'Cash',276.21),(2165017,'Online',262.57),(2329351,'Cash',443.62),(2824285,'Cash',386.06),(3451419,'Cash',173.28),(3561336,'Online',15.77),(3605697,'Online',77.93),(3680607,'Debit',357.91),(3743142,'Credit',90.91),(3952504,'Online',336.32),(3969933,'Credit',491.45),(4007299,'Credit',465.06),(4056073,'Credit',106.80),(4088448,'Cash',469.74),(4121189,'Credit',198.33),(4139046,'Online',358.16),(4196797,'Online',132.16),(4335760,'Debit',125.12),(4577317,'Debit',132.92),(4592094,'Cash',312.88),(4718416,'Online',18.82),(4840182,'Debit',118.38),(4844604,'Debit',485.06),(5116555,'Credit',466.12),(5142707,'Cash',296.18),(5197127,'Debit',364.47),(5486680,'Credit',336.92),(5514549,'Online',462.36),(5549214,'Cash',145.34),(5579149,'Cash',339.32),(5821509,'Credit',81.86),(5915204,'Online',176.99),(6002605,'Cash',83.90),(6165087,'Debit',379.72),(6282604,'Credit',327.75),(6337576,'Debit',370.60),(6346557,'Debit',117.81),(6470469,'Online',60.06),(6571421,'Credit',55.03),(6698880,'Cash',110.39),(6846578,'Cash',197.59),(6871828,'Cash',90.99),(7037168,'Cash',359.35),(7152804,'Online',287.76),(7226500,'Online',125.47),(7659671,'Debit',293.35),(7821655,'Online',484.08),(7856305,'Online',75.05),(7946996,'Credit',248.86),(8157002,'Cash',369.84),(8234582,'Cash',265.33),(8345654,'Cash',205.88),(8479340,'Debit',121.19),(8536402,'Credit',225.28),(8947427,'Credit',418.50),(9001392,'Online',247.60),(9051173,'Credit',366.79),(9183450,'Credit',60.58),(9264402,'Debit',234.78),(9266744,'Credit',322.92),(9339768,'Online',37.87),(9416071,'Credit',414.76),(9553736,'Credit',202.04);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17 23:39:14
