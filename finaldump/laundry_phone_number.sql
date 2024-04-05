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
-- Table structure for table `phone_number`
--

DROP TABLE IF EXISTS `phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_number` (
  `Phone_No` varchar(255) NOT NULL,
  `Laundry_No` int NOT NULL,
  PRIMARY KEY (`Phone_No`),
  KEY `Laundry_No` (`Laundry_No`),
  CONSTRAINT `phone_number_ibfk_1` FOREIGN KEY (`Laundry_No`) REFERENCES `customer` (`Laundry_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_number`
--

LOCK TABLES `phone_number` WRITE;
/*!40000 ALTER TABLE `phone_number` DISABLE KEYS */;
INSERT INTO `phone_number` VALUES ('-8699487525',1),('-7928851375',2),('-9840565340',3),('-8234087186',4),('-9929952655',5),('-8540324018',6),('-8637028346',7),('-8409532479',8),('-9824649153',9),('-7118345615',10),('-7778863747',11),('-8610027291',12),('-7458833593',13),('-9428733396',14),('-7802799898',15),('-8348294147',16),('-8065478649',17),('-8029698891',18),('-8124015450',19),('-9180502403',20),('-9498353410',21),('-9813681227',22),('-8075410829',23),('-9018722145',24),('-9282516812',25),('-7786715459',26),('-8262251864',27),('-7091724310',28),('-8458115545',29),('-8267812120',30),('-7551953904',31),('-9590075423',32),('-8651451432',33),('-7006524970',34),('-7626444667',35),('-8174758400',36),('-7553675007',37),('-8973646495',38),('-9646689354',39),('-9810063357',40),('-8384865758',41),('-7522056771',42),('-7206655089',43),('-7805367230',44),('-8745613700',45),('-8110564866',46),('-7894066775',47),('-8572579140',48),('-7034608180',49),('-9600178138',50),('-7498658825',51),('-7137740244',52),('-7418088597',53),('-9375613021',54),('-9237670942',55),('-9925864924',56),('-9823903366',57),('-7873397637',58),('-9487416190',59),('-7297178357',60),('-7700970564',61),('-9321149692',62),('-9375664717',63),('-8437508824',64),('-9421269501',65),('-9469861172',66),('-7006813471',67),('-9228753622',68),('-7925737203',69),('-9874540821',70);
/*!40000 ALTER TABLE `phone_number` ENABLE KEYS */;
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