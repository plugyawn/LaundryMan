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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Laundry_No` int NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Roll_No` varchar(255) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Course` varchar(255) DEFAULT NULL,
  `Branch` varchar(255) DEFAULT NULL,
  `Room_No` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Laundry_No`),
  UNIQUE KEY `Roll_No` (`Roll_No`),
  KEY `Room_No` (`Room_No`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Room_No`) REFERENCES `hostel` (`Room_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_chk_1` CHECK (((`Age` >= 18) and (`Age` <= 30)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Elizabeth','Matthew','Keith','21588857',26,'Male','PHD','CHEM','G-431'),(2,'Katherine','Cindy','Shea','17433665',21,'Female','MA','PHY','G-132'),(3,'Andrew','Angela','Harrison','23556997',27,'Female','POSTDOC','BIO','C-482'),(4,'Rachel','John','Hernandez','23245109',22,'Female','MA','EE','E-174'),(5,'Amber','Erin','Newman','18381071',26,'Female','BTECH','CSE','I-391'),(6,'Joel','Amy','Long','19143700',22,'Female','MTECH','CSE','B-387'),(7,'Evelyn','Alicia','Bowman','20213904',26,'Female','MSC','PHY','D-460'),(8,'Lori','Shelby','Thomas','20156661',22,'Male','POSTDOC','BIO','B-194'),(9,'Emily','Briana','Barron','18547163',25,'Female','BTECH','CHEM','B-159'),(10,'Lisa','James','Lyons','20231630',27,'Male','POSTDOC','BIO','F-462'),(11,'Cynthia','Curtis','Ortiz','22008207',25,'Female','BTECH','BIO','A-485'),(12,'Katelyn','Kevin','Ray','17199489',28,'Male','MA','PHY','B-191'),(13,'Erin','Austin','Lowery','18104395',21,'Male','MA','CHEM','F-456'),(14,'David','Jeffrey','Howe','19434034',20,'Female','MA','CHEM','E-228'),(15,'Ashley','Laura','Barton','19502794',21,'Female','POSTDOC','PHY','I-363'),(16,'Heather','Kristin','Zhang','20400252',24,'Male','MA','CSE','F-111'),(17,'Stephanie','Martin','Huynh','19065716',28,'Female','MSC','EE','C-365'),(18,'William','Krystal','Rivera','18850752',27,'Female','PHD','COG','H-399'),(19,'Cynthia','Michael','Williams','18351470',22,'Male','BTECH','PHY','I-471'),(20,'Ashley','Erica','Rodriguez','17888015',29,'Male','MA','EE','E-131'),(21,'Sharon','Melanie','Morrison','23656966',20,'Male','PHD','CE','H-459'),(22,'James','Austin','Williams','22215216',27,'Female','BTECH','CSE','J-412'),(23,'Barbara','David','Kelly','18410673',26,'Female','MTECH','ME','A-490'),(24,'Scott','Kenneth','Foster','20029982',28,'Female','MSC','CL','B-461'),(25,'John','James','Wiggins','20826493',22,'Male','MSC','EE','A-241'),(26,'Amber','Ashley','English','19811088',26,'Female','MA','CHEM','J-184'),(27,'Mitchell','Scott','Smith','17487104',23,'Female','PHD','ME','B-339'),(28,'Aaron','Tammy','Carr','20189814',21,'Female','BTECH','CE','D-329'),(29,'Colleen','Joanna','Strickland','18328281',26,'Female','PHD','CHEM','F-137'),(30,'James','James','Norris','22346719',30,'Male','PHD','COG','D-270'),(31,'Jean','Richard','Schmidt','22869938',27,'Female','MTECH','EE','B-297'),(32,'Richard','Karen','Figueroa','22047895',20,'Female','POSTDOC','PHY','F-322'),(33,'Trevor','Christopher','Guzman','18445286',29,'Male','BTECH','BIO','J-369'),(34,'Jonathan','David','Cannon','18134348',21,'Female','MSC','CSE','I-475'),(35,'Kaylee','Ashley','Johnson','17256859',25,'Female','PHD','COG','A-144'),(36,'Shawn','Tiffany','Compton','19399078',19,'Male','MTECH','COG','G-458'),(37,'Matthew','Lisa','Wagner','22332532',23,'Male','PHD','CE','J-128'),(38,'Kaylee','David','Wallace','22535356',21,'Female','POSTDOC','CSE','H-227'),(39,'Jesus','Jessica','Cunningham','22061996',28,'Female','MA','PHY','J-110'),(40,'Robin','Michael','Johnson','22694049',21,'Male','MA','CHEM','B-451'),(41,'James','Seth','Travis','19554428',30,'Female','PHD','EE','G-246'),(42,'Joanne','Anna','Moore','22949180',29,'Female','MSC','PHY','E-147'),(43,'Samuel','Derek','Wood','17247867',21,'Male','PHD','PHY','J-186'),(44,'Joel','Joseph','Jacobs','23399601',19,'Female','BTECH','CE','E-335'),(45,'Misty','Darryl','Ramos','18577013',26,'Male','PHD','BIO','G-188'),(46,'Michelle','Timothy','Wallace','22025634',20,'Female','MA','COG','C-292'),(47,'Tammy','Erica','Hale','18186081',29,'Male','MTECH','ME','J-168'),(48,'James','Katherine','Patton','23981694',19,'Female','MSC','EE','F-348'),(49,'Kathleen','Holly','Thomas','21533999',29,'Female','BTECH','CE','B-454'),(50,'Michael','Joy','Gonzales','19763028',30,'Male','MA','EE','A-162'),(51,'Lindsey','Todd','Mills','19128208',28,'Female','BTECH','PHY','G-431'),(52,'Virginia','Cheryl','Wolfe','17905732',29,'Female','MA','EE','G-132'),(53,'Christopher','Drew','Banks','19119577',22,'Male','BTECH','BIO','C-482'),(54,'Debbie','Valerie','Jones','20934869',28,'Female','POSTDOC','ME','E-174'),(55,'Richard','Kelly','Calhoun','18108544',29,'Female','MSC','EE','I-391'),(56,'Sabrina','Victoria','Murphy','23008221',27,'Female','PHD','BIO','B-387'),(57,'Amanda','Richard','Rivas','21543515',29,'Female','MA','COG','D-460'),(58,'Timothy','Philip','White','18953786',19,'Female','MA','PHY','B-194'),(59,'Renee','Billy','Martinez','21930800',26,'Male','MA','PHY','B-159'),(60,'Albert','Lori','Bowman','21252845',20,'Male','POSTDOC','CSE','F-462'),(61,'Andrea','Hunter','Dunn','20547728',23,'Female','MA','CSE','A-485'),(62,'Russell','Courtney','Gonzalez','17434229',26,'Female','MTECH','PHY','B-191'),(63,'Jessica','Robin','Walter','19382599',25,'Male','MSC','PHY','F-456'),(64,'Donna','Melissa','Smith','23466899',28,'Female','MA','CSE','E-228'),(65,'Christopher','David','Long','22443404',18,'Female','MSC','EE','I-363'),(66,'Jessica','Amanda','Chandler','18991207',23,'Male','BTECH','PHY','F-111'),(67,'John','Jacqueline','Potts','21225753',29,'Female','POSTDOC','CL','C-365'),(68,'James','Amber','Stokes','19304113',21,'Male','MSC','COG','H-399'),(69,'Nicole','Garrett','Wood','22198512',25,'Male','BTECH','EE','I-471'),(70,'Kenneth','Brandon','Simmons','17241672',24,'Female','MTECH','PHY','E-131');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
