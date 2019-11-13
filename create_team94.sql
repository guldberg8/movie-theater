CREATE DATABASE  IF NOT EXISTS `Team94` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Team94`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Team94
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk3` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('cool_class4400');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company` (
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES ('4400 Theater Company'),('AI Theater Company'),('Awesome Theater Company'),('EZ Theater Company');
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditCard`
--

DROP TABLE IF EXISTS `creditCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditCard` (
  `creditCardNum` varchar(16) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`creditCardNum`),
  KEY `fk6_idx` (`username`),
  CONSTRAINT `fk6` FOREIGN KEY (`username`) REFERENCES `customer` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditCard`
--

LOCK TABLES `creditCard` WRITE;
/*!40000 ALTER TABLE `creditCard` DISABLE KEYS */;
INSERT INTO `creditCard` VALUES ('1111111111000000','calcultron'),('1111111100000000','calcultron2'),('1111111110000000','calcultron2'),('1111111111100000','calcwizard'),('2222222222000000','cool_class4400'),('2220000000000000','DNAhelix'),('2222222200000000','does2Much'),('2222222222222200','eeqmcsquare'),('2222222222200000','entropyRox'),('2222222222220000','entropyRox'),('1100000000000000','fullMetal'),('1111111111110000','georgep'),('1111111111111000','georgep'),('1111111111111100','georgep'),('1111111111111110','georgep'),('1111111111111111','georgep'),('2222222222222220','ilikemoney$$'),('2222222222222222','ilikemoney$$'),('9000000000000000','ilikemoney$$'),('1111110000000000','imready'),('1110000000000000','isthisthekrustykrab'),('1111000000000000','isthisthekrustykrab'),('1111100000000000','isthisthekrustykrab'),('1000000000000000','notFullMetal'),('2222222000000000','programerAAL'),('3333333333333300','RitzLover28'),('2222222220000000','thePiGuy3.14'),('2222222222222000','theScienceGuy');
/*!40000 ALTER TABLE `creditCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('calcultron'),('calcultron2'),('calcwizard'),('clarinetbeast'),('cool_class4400'),('DNAhelix'),('does2Much'),('eeqmcsquare'),('entropyRox'),('fullMetal'),('georgep'),('ilikemoney$$'),('imready'),('isthisthekrustykrab'),('notFullMetal'),('programerAAL'),('RitzLover28'),('thePiGuy3.14'),('theScienceGuy');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('calcultron'),('cool_class4400'),('entropyRox'),('fatherAI'),('georgep'),('ghcghc'),('imbatman'),('manager1'),('manager2'),('manager3'),('manager4'),('radioactivePoRa');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manager` (
  `username` varchar(45) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` char(5) DEFAULT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  `theaterName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `fk5_idx` (`companyName`),
  CONSTRAINT `fk4` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `fk5` FOREIGN KEY (`companyName`) REFERENCES `company` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
INSERT INTO `Manager` VALUES ('calcultron','123 Peachtree St','Atlanta','GA','30308','EZ Theater Company','Star Movies'),('entropyRox','200 Cool Place','San Francisco','CA','94016','4400 Theater Company','Cinema Star'),('fatherAI','456 Main St','New York','NY','10001','EZ Theater Company','Main Movies'),('georgep','10 Pearl Dr','Seattle','WA','98105','4400 Theater Company','Jonathan\'s Movies'),('ghcghc','100 Pi St','Pallet Town','KS','31415','AI Theater Company','ML Movies'),('imbatman','800 Color Dr','Austin','TX','78653','Awesome Theater Company','ABC Theater'),('manager1','123 Ferst Drive','Atlanta','GA','30332','4400 Theater Company',NULL),('manager2','456 Ferst Drive','Atlanta','GA','30332','AI Theater Company',NULL),('manager3','789 Ferst Drive','Atlanta','GA','30332','4400 Theater Company',NULL),('manager4','000 Ferst Drive','Atlanta','GA','30332','4400 Theater Company',NULL),('radioactivePoRa','100 Blu St','Sunnyvale','CA','94088','4400 Theater Company','Star Movies');
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `movReleaseDate` date NOT NULL,
  `movName` varchar(45) NOT NULL,
  `duration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`movReleaseDate`,`movName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES ('1927-08-12','George P Burdell\'s Life Story','100'),('1985-08-13','Georgia Tech The Movie','100'),('1987-06-24','Spaceballs','96'),('1998-07-19','The First Pokemon Movie','75'),('2010-03-21','How to Train Your Dragon','98'),('2010-11-26','The King\'s Speech','119'),('2018-12-01','Spider-Man: Into the Spider-Verse','117'),('2019-04-26','Avengers: Endgame','181'),('2019-08-12','4400 The Movie','130'),('2019-09-19','Calculus Returns: A ML Story','314');
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MoviePlay`
--

DROP TABLE IF EXISTS `MoviePlay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MoviePlay` (
  `theaterName` varchar(45) NOT NULL,
  `companyName` varchar(45) NOT NULL,
  `movieReleaseDate` datetime NOT NULL,
  `movieName` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`theaterName`,`date`,`movieName`,`movieReleaseDate`,`companyName`),
  KEY `fk11_idx` (`movieName`),
  KEY `fk12_idx` (`theaterName`,`companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MoviePlay`
--

LOCK TABLES `MoviePlay` WRITE;
/*!40000 ALTER TABLE `MoviePlay` DISABLE KEYS */;
/*!40000 ALTER TABLE `MoviePlay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Theater`
--

DROP TABLE IF EXISTS `Theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Theater` (
  `companyName` varchar(45) NOT NULL,
  `theaterName` varchar(45) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` char(5) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `managerUsername` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`companyName`,`theaterName`),
  KEY `fk10_idx` (`managerUsername`),
  CONSTRAINT `fk10` FOREIGN KEY (`managerUsername`) REFERENCES `manager` (`username`),
  CONSTRAINT `fk9` FOREIGN KEY (`companyName`) REFERENCES `company` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Theater`
--

LOCK TABLES `Theater` WRITE;
/*!40000 ALTER TABLE `Theater` DISABLE KEYS */;
INSERT INTO `Theater` VALUES ('4400 Theater Company','Cinema Star','100 Cool Place','San Francisco','CA','94016',4,NULL),('4400 Theater Company','Jonathan\'s Movies','67 Pearl Dr','Seattle','WA','98101',2,NULL),('4400 Theater Company','Star Movies','4400 Rocks Ave','Boulder','CA','80301',5,NULL),('AI Theater Company','ML Movies','314 Pi St','Pallet Town','KS','31415',3,NULL),('Awesome Theater Company','ABC Theater','880 Color Dr','Austin','TX','73301',5,NULL),('EZ Theater Company','Main Movies','123 Main St','New York','NY','10001',3,NULL),('EZ Theater Company','Star Movies','745 GT St','Atlanta','GA','30332',2,NULL);
/*!40000 ALTER TABLE `Theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction` (
  `creditCard` varchar(16) NOT NULL,
  `theaterName` varchar(45) NOT NULL,
  `companyName` varchar(45) NOT NULL,
  `movieReleaseDate` datetime NOT NULL,
  `movieName` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`creditCard`),
  KEY `fk14_idx` (`theaterName`,`companyName`,`movieReleaseDate`,`movieName`,`date`),
  CONSTRAINT `fk13` FOREIGN KEY (`creditCard`) REFERENCES `creditcard` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `username` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('calcultron','Approved','333333333','Dwight','Schrute'),('calcultron2','Approved','444444444','Jim','Halpert'),('calcwizard','Approved','222222222','Issac','Newton'),('clarinetbeast','Declined','999999999','Squidward','Tentacles'),('cool_class4400','Approved','333333333','A. TA','Washere'),('DNAhelix','Approved','777777777','Rosalind','Franklin'),('does2Much','Approved','1212121212','Carl','Gauss'),('eeqmcsquare','Approved','111111110','Albert','Einstein'),('entropyRox','Approved','999999999','Claude','Shannon'),('fatherAI','Approved','222222222','Alan','Turing'),('fullMetal','Approved','111111100','Edward','Elric'),('gdanger','Declined','555555555','Gary','Danger'),('georgep','Approved','111111111','George P.','Burdell'),('ghcghc','Approved','666666666','Grace','Hopper'),('ilikemoney$$','Approved','111111110','Eugene','Krabs'),('imbatman','Approved','666666666','Bruce','Wayne'),('imready','Approved','777777777','Spongebob','Squarepants'),('isthisthekrustykrab','Approved','888888888','Patrick','Star'),('manager1','Approved','1122112211','Manager','One'),('manager2','Approved','3131313131','Manager','Two'),('manager3','Approved','8787878787','Three','Three'),('manager4','Approved','5755555555','Four','Four'),('notFullMetal','Approved','111111100','Alphonse','Elric'),('programerAAL','Approved','3131313131','Ada','Lovelace'),('radioactivePoRa','Approved','1313131313','Marie','Curie'),('RitzLover28','Approved','444444444','Abby','Normal'),('smith_j','Pending','333333333','John','Smith'),('texasStarKarate','Declined','111111110','Sandy','Cheeks'),('thePiGuy3.14','Approved','1111111111','Archimedes','Syracuse'),('theScienceGuy','Approved','999999999','Bill','Nye');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Team94'
--

--
-- Dumping routines for database 'Team94'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-12 13:05:34
