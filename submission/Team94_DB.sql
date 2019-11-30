CREATE DATABASE  IF NOT EXISTS `Team94` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Team94`;
-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: Team94
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `username` varchar(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk3` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `companyName` varchar(128) NOT NULL,
  PRIMARY KEY (`companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Table structure for table `CreditCard`
--

DROP TABLE IF EXISTS `CreditCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CreditCard` (
  `creditCardNum` char(16) NOT NULL,
  `username` varchar(128) NOT NULL,
  PRIMARY KEY (`creditCardNum`),
  KEY `fk6` (`username`),
  CONSTRAINT `fk6` FOREIGN KEY (`username`) REFERENCES `Customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CreditCard`
--

LOCK TABLES `CreditCard` WRITE;
/*!40000 ALTER TABLE `CreditCard` DISABLE KEYS */;
INSERT INTO `CreditCard` VALUES ('1111111111000000','calcultron'),('1111111100000000','calcultron2'),('1111111110000000','calcultron2'),('1111111111100000','calcwizard'),('2222222222000000','cool_class4400'),('2220000000000000','DNAhelix'),('2222222200000000','does2Much'),('2222222222222200','eeqmcsquare'),('2222222222200000','entropyRox'),('2222222222220000','entropyRox'),('1100000000000000','fullMetal'),('1111111111110000','georgep'),('1111111111111000','georgep'),('1111111111111100','georgep'),('1111111111111110','georgep'),('1111111111111111','georgep'),('2222222222222220','ilikemoney$$'),('2222222222222222','ilikemoney$$'),('9000000000000000','ilikemoney$$'),('1111110000000000','imready'),('1110000000000000','isthisthekrustykrab'),('1111000000000000','isthisthekrustykrab'),('1111100000000000','isthisthekrustykrab'),('1000000000000000','notFullMetal'),('2222222000000000','programerAAL'),('3333333333333300','RitzLover28'),('2222222220000000','thePiGuy3.14'),('2222222222222000','theScienceGuy');
/*!40000 ALTER TABLE `CreditCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `username` varchar(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk1` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `username` varchar(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk2` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manager` (
  `username` varchar(128) NOT NULL,
  `companyName` varchar(128) NOT NULL,
  `street` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` char(5) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `manager_address_index` (`zipcode`,`state`,`city`,`street`),
  KEY `fk5` (`companyName`),
  CONSTRAINT `fk4` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk5` FOREIGN KEY (`companyName`) REFERENCES `Company` (`companyName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
INSERT INTO `Manager` VALUES ('calcultron','EZ Theater Company','123 Peachtree St','Atlanta','GA','30308'),('entropyRox','4400 Theater Company','200 Cool Place','San Francisco','CA','94016'),('fatherAI','EZ Theater Company','456 Main St','New York','NY','10001'),('georgep','4400 Theater Company','10 Pearl Dr','Seattle','WA','98105'),('ghcghc','AI Theater Company','100 Pi St','Pallet Town','KS','31415'),('imbatman','Awesome Theater Company','800 Color Dr','Austin','TX','78653'),('manager1','4400 Theater Company','123 Ferst Drive','Atlanta','GA','30332'),('manager2','AI Theater Company','456 Ferst Drive','Atlanta','GA','30332'),('manager3','4400 Theater Company','789 Ferst Drive','Atlanta','GA','30332'),('manager4','4400 Theater Company','000 Ferst Drive','Atlanta','GA','30332'),('radioactivePoRa','4400 Theater Company','100 Blu St','Sunnyvale','CA','94088');
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie` (
  `releaseDate` date NOT NULL,
  `movieName` varchar(128) NOT NULL,
  `duration` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`releaseDate`,`movieName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MoviePlay` (
  `companyName` varchar(128) NOT NULL,
  `theaterName` varchar(128) NOT NULL,
  `movieReleaseDate` date NOT NULL,
  `movieName` varchar(128) NOT NULL,
  `playDate` date NOT NULL,
  PRIMARY KEY (`companyName`,`theaterName`,`movieReleaseDate`,`movieName`,`playDate`),
  KEY `fk12` (`movieReleaseDate`,`movieName`),
  CONSTRAINT `fk11` FOREIGN KEY (`companyName`, `theaterName`) REFERENCES `Theater` (`companyName`, `theaterName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk12` FOREIGN KEY (`movieReleaseDate`, `movieName`) REFERENCES `Movie` (`releaseDate`, `movieName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MoviePlay`
--

LOCK TABLES `MoviePlay` WRITE;
/*!40000 ALTER TABLE `MoviePlay` DISABLE KEYS */;
INSERT INTO `MoviePlay` VALUES ('4400 Theater Company','Cinema Star','1927-08-12','George P Burdell\'s Life Story','2010-05-20'),('EZ Theater Company','Main Movies','1927-08-12','George P Burdell\'s Life Story','2019-07-14'),('EZ Theater Company','Main Movies','1927-08-12','George P Burdell\'s Life Story','2019-10-22'),('4400 Theater Company','Cinema Star','1985-08-13','Georgia Tech The Movie','2019-09-30'),('Awesome Theater Company','ABC Theater','1985-08-13','Georgia Tech The Movie','1985-08-13'),('4400 Theater Company','Cinema Star','1987-06-24','Spaceballs','2000-02-02'),('AI Theater Company','ML Movies','1987-06-24','Spaceballs','2010-04-02'),('AI Theater Company','ML Movies','1987-06-24','Spaceballs','2023-01-23'),('EZ Theater Company','Main Movies','1987-06-24','Spaceballs','1999-06-24'),('Awesome Theater Company','ABC Theater','1998-07-19','The First Pokemon Movie','2018-07-19'),('4400 Theater Company','Cinema Star','2010-03-21','How to Train Your Dragon','2010-04-02'),('EZ Theater Company','Main Movies','2010-03-21','How to Train Your Dragon','2010-03-22'),('EZ Theater Company','Main Movies','2010-03-21','How to Train Your Dragon','2010-03-23'),('EZ Theater Company','Star Movies','2010-03-21','How to Train Your Dragon','2010-03-25'),('4400 Theater Company','Cinema Star','2010-11-26','The King\'s Speech','2019-12-20'),('EZ Theater Company','Main Movies','2010-11-26','The King\'s Speech','2019-12-20'),('AI Theater Company','ML Movies','2018-12-01','Spider-Man: Into the Spider-Verse','2019-09-30'),('4400 Theater Company','Cinema Star','2019-08-12','4400 The Movie','2019-09-12'),('Awesome Theater Company','ABC Theater','2019-08-12','4400 The Movie','2019-10-12'),('EZ Theater Company','Star Movies','2019-08-12','4400 The Movie','2019-08-12'),('AI Theater Company','ML Movies','2019-09-19','Calculus Returns: A ML Story','2019-10-10'),('AI Theater Company','ML Movies','2019-09-19','Calculus Returns: A ML Story','2019-12-30');
/*!40000 ALTER TABLE `MoviePlay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Theater`
--

DROP TABLE IF EXISTS `Theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Theater` (
  `companyName` varchar(128) NOT NULL,
  `theaterName` varchar(128) NOT NULL,
  `manager` varchar(128) NOT NULL,
  `street` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` char(5) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`companyName`,`theaterName`),
  KEY `fk8` (`manager`),
  CONSTRAINT `fk7` FOREIGN KEY (`companyName`) REFERENCES `Company` (`companyName`) ON UPDATE CASCADE,
  CONSTRAINT `fk8` FOREIGN KEY (`manager`) REFERENCES `Manager` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Theater`
--

LOCK TABLES `Theater` WRITE;
/*!40000 ALTER TABLE `Theater` DISABLE KEYS */;
INSERT INTO `Theater` VALUES ('4400 Theater Company','Cinema Star','entropyRox','100 Cool Place','San Francisco','CA','94016',4),('4400 Theater Company','Jonathan\'s Movies','georgep','67 Pearl Dr','Seattle','WA','98101',2),('4400 Theater Company','Star Movies','calcultron','4400 Rocks Ave','Boulder','CA','80301',5),('AI Theater Company','ML Movies','ghcghc','314 Pi St','Pallet Town','KS','31415',3),('Awesome Theater Company','ABC Theater','imbatman','880 Color Dr','Austin','TX','73301',5),('EZ Theater Company','Main Movies','fatherAI','123 Main St','New York','NY','10001',3),('EZ Theater Company','Star Movies','radioactivePoRa','745 GT St','Atlanta','GA','30332',2);
/*!40000 ALTER TABLE `Theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction` (
  `creditCardNum` char(16) NOT NULL,
  `companyName` varchar(128) NOT NULL,
  `theaterName` varchar(128) NOT NULL,
  `movieReleaseDate` date NOT NULL,
  `movieName` varchar(128) NOT NULL,
  `moviePlayDate` date NOT NULL,
  PRIMARY KEY (`creditCardNum`,`companyName`,`theaterName`,`movieReleaseDate`,`movieName`,`moviePlayDate`),
  KEY `fk14` (`companyName`,`theaterName`,`movieReleaseDate`,`movieName`,`moviePlayDate`),
  CONSTRAINT `fk13` FOREIGN KEY (`creditCardNum`) REFERENCES `CreditCard` (`creditCardNum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk14` FOREIGN KEY (`companyName`, `theaterName`, `movieReleaseDate`, `movieName`, `moviePlayDate`) REFERENCES `MoviePlay` (`companyName`, `theaterName`, `movieReleaseDate`, `movieName`, `playDate`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES ('1111111111111111','4400 Theater Company','Cinema Star','2010-03-21','How to Train Your Dragon','2010-04-02'),('1111111111111111','EZ Theater Company','Main Movies','2010-03-21','How to Train Your Dragon','2010-03-22'),('1111111111111111','EZ Theater Company','Main Movies','2010-03-21','How to Train Your Dragon','2010-03-23'),('1111111111111100','EZ Theater Company','Star Movies','2010-03-21','How to Train Your Dragon','2010-03-25');
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `username` varchar(128) NOT NULL,
  `status` varchar(128) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('calcultron','Approved','77c9749b451ab8c713c48037ddfbb2c4','Dwight','Schrute'),('calcultron2','Approved','8792b8cf71d27dc96173b2ac79b96e0d','Jim','Halpert'),('calcwizard','Approved','0d777e9e30b918e9034ab610712c90cf','Issac','Newton'),('clarinetbeast','Declined','c8c605999f3d8352d7bb792cf3fdb25b','Squidward','Tentacles'),('cool_class4400','Approved','77c9749b451ab8c713c48037ddfbb2c4','A. TA','Washere'),('DNAhelix','Approved','ca94efe2a58c27168edf3d35102dbb6d','Rosalind','Franklin'),('does2Much','Approved','00cedcf91beffa9ee69f6cfe23a4602d','Carl','Gauss'),('eeqmcsquare','Approved','7c5858f7fcf63ec268f42565be3abb95','Albert','Einstein'),('entropyRox','Approved','c8c605999f3d8352d7bb792cf3fdb25b','Claude','Shannon'),('fatherAI','Approved','0d777e9e30b918e9034ab610712c90cf','Alan','Turing'),('fullMetal','Approved','d009d70ae4164e8989725e828db8c7c2','Edward','Elric'),('gdanger','Declined','3665a76e271ada5a75368b99f774e404','Gary','Danger'),('georgep','Approved','bbb8aae57c104cda40c93843ad5e6db8','George P.','Burdell'),('ghcghc','Approved','9f0863dd5f0256b0f586a7b523f8cfe8','Grace','Hopper'),('ilikemoney$$','Approved','7c5858f7fcf63ec268f42565be3abb95','Eugene','Krabs'),('imbatman','Approved','9f0863dd5f0256b0f586a7b523f8cfe8','Bruce','Wayne'),('imready','Approved','ca94efe2a58c27168edf3d35102dbb6d','Spongebob','Squarepants'),('isthisthekrustykrab','Approved','134fb0bf3bdd54ee9098f4cbc4351b9a','Patrick','Star'),('manager1','Approved','e58cce4fab03d2aea056398750dee16b','Manager','One'),('manager2','Approved','ba9485f02fc98cdbd2edadb0aa8f6390','Manager','Two'),('manager3','Approved','6e4fb18b49aa3219bef65195dac7be8c','Three','Three'),('manager4','Approved','d61dfee83aa2a6f9e32f268d60e789f5','Four','Four'),('notFullMetal','Approved','d009d70ae4164e8989725e828db8c7c2','Alphonse','Elric'),('programerAAL','Approved','ba9485f02fc98cdbd2edadb0aa8f6390','Ada','Lovelace'),('radioactivePoRa','Approved','e5d4b739db1226088177e6f8b70c3a6f','Marie','Curie'),('RitzLover28','Approved','8792b8cf71d27dc96173b2ac79b96e0d','Abby','Normal'),('smith_j','Pending','77c9749b451ab8c713c48037ddfbb2c4','John','Smith'),('texasStarKarate','Declined','7c5858f7fcf63ec268f42565be3abb95','Sandy','Cheeks'),('thePiGuy3.14','Approved','e11170b8cbd2d74102651cb967fa28e5','Archimedes','Syracuse'),('theScienceGuy','Approved','c8c605999f3d8352d7bb792cf3fdb25b','Bill','Nye');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visit`
--

DROP TABLE IF EXISTS `Visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Visit` (
  `visitID` int(11) NOT NULL AUTO_INCREMENT,
  `visitDate` date DEFAULT NULL,
  `companyName` varchar(128) NOT NULL,
  `theaterName` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  PRIMARY KEY (`visitID`),
  KEY `fk9` (`companyName`,`theaterName`),
  KEY `fk10` (`username`),
  CONSTRAINT `fk10` FOREIGN KEY (`username`) REFERENCES `User` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk9` FOREIGN KEY (`companyName`, `theaterName`) REFERENCES `Theater` (`companyName`, `theaterName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visit`
--

LOCK TABLES `Visit` WRITE;
/*!40000 ALTER TABLE `Visit` DISABLE KEYS */;
INSERT INTO `Visit` VALUES (1,'2010-03-22','EZ Theater Company','Main Movies','georgep'),(2,'2010-03-22','EZ Theater Company','Main Movies','calcwizard'),(3,'2010-03-25','EZ Theater Company','Star Movies','calcwizard'),(4,'2010-03-25','EZ Theater Company','Star Movies','imready'),(5,'2010-03-20','AI Theater Company','ML Movies','calcwizard');
/*!40000 ALTER TABLE `Visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Team94'
--
/*!50003 DROP PROCEDURE IF EXISTS `admin_approve_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_approve_user`(IN i_username VARCHAR(50))
BEGIN
    UPDATE User
    SET status = 'Approved'
    WHERE username = i_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(50), IN i_movDuration INT, IN i_movReleaseDate DATE)
BEGIN
    INSERT INTO Movie (releaseDate, movieName, duration) values (i_movReleaseDate, i_movName, i_movDuration);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_theater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(3), IN i_thZipcode CHAR(50), IN i_capacity INT, IN i_manUsername VARCHAR(50))
BEGIN
    INSERT INTO Theater (companyName, theaterName, manager, street, city, state, zipcode, capacity) VALUES (i_comName, i_thName, i_manUsername, i_thStreet, i_thCity, i_thState, i_thZipcode, i_capacity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_decline_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_decline_user`(IN i_username VARCHAR(50))
BEGIN
    UPDATE User
    SET status = 'Declined'
    WHERE username = i_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity INT, IN i_maxCity INT, IN i_minTheater INT, IN i_maxTheater INT, IN i_minEmployee INT, IN i_maxEmployee INT, IN i_sortBy VARCHAR(20), IN i_sortDirection VARCHAR(4))
BEGIN
    DROP VIEW IF EXISTS `AdFilterComView`; 
    CREATE VIEW `AdFilterComView` AS 
    SELECT
        Company.companyName as comName,
        COUNT(DISTINCT Theater.city) as numCityCover,
        COUNT(DISTINCT Theater.theaterName) As numTheater,
        COUNT(DISTINCT Manager.username) as numEmployee
    FROM
        Company
    LEFT JOIN Theater ON Company.companyName = Theater.companyName
    LEFT JOIN Manager ON Company.companyName = Manager.companyName
    GROUP BY Company.companyName;
    
    DROP TABLE IF EXISTS `AdFilterCom`;
    CREATE TABLE `AdFilterCom` AS
    SELECT *
    FROM AdFilterComView
    WHERE 
		(comName = i_comName OR i_comName = "" OR i_comName = "ALL") AND
        (i_minCity is NULL OR numCityCover>=i_minCity) AND
        (i_maxCity is NULL OR numCityCover<=i_maxCity) AND
        (i_minTheater is NULL OR numTheater >= i_minTheater) AND
        (i_maxTheater is NULL OR numTheater <= i_maxTheater) AND
		(i_minEmployee is NULL OR numEmployee >= i_minEmployee) AND
        (i_maxEmployee is NULL OR numEmployee <= i_maxEmployee)
    ORDER BY 
        (CASE WHEN (i_sortBy='numCityCover') AND (i_sortDirection='ASC') THEN numCityCover END) ASC,
        (CASE WHEN (i_sortBy='numCityCover') THEN numCityCover END) DESC,
        (CASE WHEN (i_sortBy='numTheater') AND (i_sortDirection='ASC') THEN numTheater END) ASC,
        (CASE WHEN (i_sortBy='numTheater') THEN numTheater END) DESC,
        (CASE WHEN (i_sortBy='numEmployee') AND (i_sortDirection='ASC') THEN numEmployee END) ASC,
        (CASE WHEN (i_sortBy='numEmployee') THEN numEmployee END) DESC,
        (CASE WHEN (i_sortDirection='ASC') THEN comName END) ASC,
        comName DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_user`(IN i_username VARCHAR(50), IN i_status VARCHAR(10), IN i_sortBy VARCHAR(20), IN i_sortDirection VARCHAR(4))
BEGIN
    DROP VIEW IF EXISTS `AdFilterUserView`; 
    CREATE VIEW `AdFilterUserView` AS 
    SELECT
        User.username as username,
        COUNT(CreditCard.creditCardNum) As creditCardCount,
        IF(Admin.username IS NULL, IF(Manager.username IS NULL,
        IF(Customer.username IS NULL, CONVERT("User",CHAR), CONVERT("Customer",CHAR)),
        IF(Customer.username IS NULL, CONVERT("Manager",CHAR), CONVERT("CustomerManager",CHAR))),
        IF(Customer.username IS NULL, CONVERT("Admin",CHAR), CONVERT("CustomerAdmin",CHAR))) As userType,
        User.status as status
    FROM
        User
    LEFT JOIN CreditCard ON User.username = CreditCard.username
    LEFT JOIN Admin ON User.username = Admin.username
    LEFT JOIN Manager ON User.username = Manager.username
    LEFT JOIN Customer ON User.username = Customer.username
    GROUP BY User.username;
      
    DROP TABLE IF EXISTS `AdFilterUser`;
    CREATE TABLE `AdFilterUser` AS
    SELECT *
    FROM AdFilterUserView
    WHERE
		((username = i_username) OR (i_username = "") OR (i_username = '')) AND
        ((status = i_status) OR (i_status = "ALL") OR (i_status = "") OR (i_status = 'ALL') OR (i_status = ''))
    ORDER BY 
        (CASE WHEN (i_sortBy='creditCardCount') AND (i_sortDirection='ASC') THEN creditCardCount END) ASC,
        (CASE WHEN (i_sortBy='creditCardCount') THEN creditCardCount END) DESC,
        (CASE WHEN (i_sortBy='userType') AND (i_sortDirection='ASC') THEN userType END) ASC,
        (CASE WHEN (i_sortBy='userType') THEN userType END) DESC,
        (CASE WHEN (i_sortBy='status') AND (i_sortDirection='ASC') THEN status END) ASC,
        (CASE WHEN (i_sortBy='status') THEN status END) DESC,
        username DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_emp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS `AdComDetailEmp`;
    CREATE TABLE AdComDetailEmp AS
    SELECT firstName as empFirstname, lastName as empLastname
    FROM Manager
    Join User
    ON Manager.username = User.username
    WHERE (companyName = i_comName OR i_comName = "");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS `AdComDetailTh`;
    CREATE TABLE `AdComDetailTh` AS
    SELECT theaterName as thName, manager as thManagerUsername, city as thCity, state as thState, capacity as thCapacity
    FROM Theater
    WHERE companyName = i_comName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(50))
BEGIN
    INSERT INTO CreditCard (creditCardNum, username) VALUES (i_creditCardNum, i_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_filter_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_filter_mov`(IN i_movName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3), IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE)
BEGIN
    DROP TABLE IF EXISTS `CosFilterMovie`;
    CREATE TABLE `CosFilterMovie` AS
    SELECT 
		MoviePlay.movieName as movName, 
        MoviePlay.theaterName as thName, 
        Theater.street as thStreet,
        Theater.city as thCity,
        Theater.state as thState,
        Theater.zipcode as thZipcode,
        MoviePlay.companyName as comName, 
        MoviePlay.playDate as movPlayDate,
        MoviePlay.movieReleaseDate as movReleaseDate
    FROM MoviePlay
    LEFT JOIN Theater ON MoviePlay.theaterName = Theater.theaterName
    WHERE 
		(movieName = i_movName OR i_movName = "" OR i_movName = "ALL") AND
        (MoviePlay.companyName = i_comName OR i_comName = "" OR i_comName = "ALL") AND
        (city = i_city OR i_city = "" OR i_city="ALL") AND
        (state = i_state OR i_state = "" OR i_state = "ALL") AND
        ((playDate BETWEEN i_minMovPlayDate and i_maxMovPlayDate) OR 
        (i_minMovPlayDate is NULL) OR
        (i_maxMovPlayDate is NULL));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
    INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO Customer (username) VALUES (i_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_history`(IN i_cusUsername VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS `CosViewHistory`;
    CREATE TABLE `CosViewHistory` AS
    SELECT
        Transaction.movieName as movName,
        Transaction.theaterName as thName,
        Transaction.companyName as comName,
        Transaction.creditCardNum as creditCardNum,
        Transaction.moviePlayDate as movPlayDate,
        CreditCard.username as username
    FROM
        Transaction
    LEFT JOIN CreditCard ON Transaction.creditCardNum = CreditCard.creditCardNum
    WHERE (CreditCard.username = i_cusUsername OR i_cusUsername = "");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_mov`(IN i_creditCardNum CHAR(50), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_movPlayDate DATE)
BEGIN
    INSERT INTO Transaction (creditCardNum, theaterName, companyName, movieReleaseDate, movieName, moviePlayDate) VALUES (i_creditCardNum, i_thName, i_comName, i_movReleaseDate, i_movName, i_movPlayDate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(50))
BEGIN
    INSERT INTO creditCard (creditCardNum, username) VALUES (i_creditCardNum, i_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(3), IN i_empZipCode CHAR(50))
BEGIN
    INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO Customer (username) VALUES (i_username);
    INSERT INTO Manager (username, street, city, state, zipcode, companyName) VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_filter_th`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_minMovDuration INT, IN i_maxMovDuration INT, IN i_minMovReleaseDate DATE, IN i_maxMovReleaseDate DATE, IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE, IN i_includeNotPlayed BOOLEAN)
BEGIN
    DROP VIEW IF EXISTS `ManagerFilterThView`; 
    CREATE VIEW `ManagerFilterThView` AS 
        SELECT
        Movie.movieName as movName,
        Movie.duration as movDuration,
        Movie.releaseDate as movReleaseDate,
        MoviePlay.playDate as movPlayDate,
        Theater.manager as manUsername
    FROM
        Movie
    LEFT JOIN MoviePlay ON Movie.movieName = MoviePlay.movieName
    LEFT JOIN Theater ON MoviePlay.theaterName = Theater.theaterName;
    
	DROP TABLE IF EXISTS `ManFilterTh`;
    CREATE TABLE `ManFilterTh` AS
    SELECT movName, movDuration, movReleaseDate, movPlayDate
    FROM ManagerFilterThView
    WHERE 
		(manUsername = i_manUsername OR manUsername is NULL OR i_manUsername = "" OR i_manUsername = '') AND
        (movName = i_movName OR i_movName = "" OR i_movName = '') AND
        (i_minMovDuration is NULL OR movDuration >= i_minMovDuration) AND
        (i_maxMovDuration is NULL OR movDuration <= i_maxMovDuration) AND
        (i_minMovReleaseDate is NULL OR movReleaseDate <= i_minMovReleaseDate) AND 
        (i_maxMovReleaseDate is NULL OR movReleaseDate <= i_maxMovReleaseDate) AND 
        (i_minMovPlayDate is NULL OR movPlayDate <= i_minMovPlayDate) AND
        (i_maxMovPlayDate is NULL OR movPlayDate <= i_maxMovPlayDate) AND
        (i_includeNotPlayed is NULL OR (i_includeNotPLayed AND movReleaseDate is NULL AND movPlayDate is NULL));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(3), IN i_empZipCode CHAR(50))
BEGIN
    INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO Manager (username, street, city, state, zipcode, companyName) VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_schedule_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_schedule_mov`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_movPlayDate DATE)
BEGIN
    INSERT INTO MoviePlay (companyName, theaterName, movieReleaseDate, movieName, playDate) values ((SELECT companyName FROM Theater WHERE manager = i_manUsername), (SELECT theaterName FROM Theater WHERE manager = i_manUsername), i_movReleaseDate, i_movName, i_movPlayDate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3))
BEGIN
    DROP TABLE IF EXISTS UserFilterTh;
    CREATE TABLE UserFilterTh AS
    SELECT theaterName as thName, street as thStreet, city as thCity, state as thState, zipcode as thZipcode, companyName as comName
    FROM Theater
    WHERE
        (theaterName = i_thName OR i_thName = "ALL") AND
        (companyName = i_comName OR i_comName = "ALL") AND
        (city = i_city OR i_city = "") AND
        (state = i_state OR i_state = "ALL");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_visitHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_visitHistory`(IN i_username VARCHAR(50), IN i_minVisitDate DATE, IN i_maxVisitDate DATE)
BEGIN
    DROP TABLE IF EXISTS UserVisitHistory;
    CREATE TABLE UserVisitHistory AS
    SELECT theaterName as thName, street as thStreet, city as thCity, state as thState, zipcode as thZipcode, companyName as comName, visitDate
    FROM Visit
        NATURAL JOIN
       Theater
    WHERE
        (username = i_username) AND
        (i_minVisitDate IS NULL OR visitDate >= i_minVisitDate) AND
        (i_maxVisitDate IS NULL OR visitDate <= i_maxVisitDate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login`(IN i_username VARCHAR(50), IN i_password VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS UserLogin;
    CREATE TABLE UserLogin
    SELECT 
        User.username, 
        status, 
        IF(Customer.username is NULL, 0,1) as isCustomer,
        IF(Admin.username is NULL, 0,1) as isAdmin,
        IF(Manager.username is NULL, 0,1) as isManager
    FROM User
    LEFT JOIN Admin ON User.username = Admin.username
    LEFT JOIN Manager ON User.username = Manager.username
    LEFT JOIN Customer ON User.username = Customer.username
    WHERE User.username = i_username AND User.password = MD5(i_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
    INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_visit_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_visitDate DATE, IN i_username VARCHAR(50))
BEGIN
    INSERT INTO Visit (theaterName, companyName, visitDate, username)
    VALUES (i_thName, i_comName, i_visitDate, i_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-30  2:19:35
