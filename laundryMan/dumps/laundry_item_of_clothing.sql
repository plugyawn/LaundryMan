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
-- Table structure for table `item_of_clothing`
--

DROP TABLE IF EXISTS `item_of_clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_of_clothing` (
  `Descr` varchar(255) NOT NULL,
  `Clothing_ID` int DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  KEY `Clothing_ID` (`Clothing_ID`),
  CONSTRAINT `item_of_clothing_ibfk_1` FOREIGN KEY (`Clothing_ID`) REFERENCES `customer` (`Laundry_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_of_clothing`
--

LOCK TABLES `item_of_clothing` WRITE;
/*!40000 ALTER TABLE `item_of_clothing` DISABLE KEYS */;
INSERT INTO `item_of_clothing` VALUES ('Shirt',16,'PowderBlue','Maddox, Miller and Carroll','L',214.86,3),('Full',5,'DarkGreen','Terry, Spencer and Jones','XL',491.07,7),('Full',33,'PowderBlue','Simpson-Rodriguez','L',139.19,2),('Bedsheet',26,'LightSlateGray','Chen, Perez and Potter','XL',247.65,1),('Special',60,'Coral','Jensen, Richardson and Cruz','XXL',191.99,10),('Saree',22,'Yellow','Baldwin Ltd','M',325.64,6),('Special',15,'LightSalmon','Moore, Cortez and Parsons','L',878.46,4),('Pant',53,'Gold','Sanders-King','S',582.94,10),('Bedsheet',23,'Ivory','Jenkins-Hubbard','XL',248.62,2),('Pant',65,'Peru','Knight, Barrett and Fields','XL',219.17,6),('Full',47,'Ivory','Harris and Sons','XXL',382.15,3),('Full',6,'DimGray','Campbell-Copeland','XL',899.71,2),('Tshirt',23,'Coral','Smith-Melendez','XL',195.27,9),('Pant',37,'Salmon','Barnes PLC','XXL',446.07,6),('Pant',44,'MediumSlateBlue','Wade-Quinn','XXL',291.54,4),('Tshirt',20,'MediumSpringGreen','Tucker Ltd','M',540.49,6),('Special',41,'MediumAquaMarine','Walker Ltd','XXL',512.44,8),('Full',22,'DeepPink','Mcintosh-Macias','XXL',378.03,6),('Full',65,'Orchid','Anderson Ltd','XXL',821.96,9),('Bedsheet',66,'Black','Lynch, Miller and Rogers','L',336.01,9);
/*!40000 ALTER TABLE `item_of_clothing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17  7:04:13
