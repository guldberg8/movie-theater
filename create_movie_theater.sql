CREATE DATABASE  IF NOT EXISTS `movie_theater` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movie_theater`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: movie_theater
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
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company` (
  `name` varchar(45) NOT NULL,
  `#Theater` int(11) DEFAULT NULL,
  `#CityCovered` int(11) DEFAULT NULL,
  `#Employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*Start nathan additions*/
DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `username` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `#CreditCard` int(11) NULL,
  PRIMARY KEY (`username`));

DROP TABLE IF EXISTS `Movie`;
CREATE TABLE `Movie` (
  `releaseDate` DATE NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NULL,
  PRIMARY KEY (`releaseDate`, `name`));

DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `username` VARCHAR(45) NOT NULL,
  `#MovieSeened` INT(11) NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk1`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk2`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk3`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

DROP TABLE IF EXISTS `Manager`;
CREATE TABLE `Manager` (
  `username` VARCHAR(45) NOT NULL,
  `companyName` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` CHAR(2) NULL,
  `zipcode` CHAR(5) NULL,
  PRIMARY KEY (`username`),
  INDEX `fk5_idx` (`companyName` ASC),
  CONSTRAINT `fk4`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk5`
    FOREIGN KEY (`companyName`)
    REFERENCES `movie_theater`.`Company` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
/** end Nathan additions **/


--
-- Table structure for table `creditCard`
--

DROP TABLE IF EXISTS `creditCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditCard` (
  `creditCardNum` int(11) NOT NULL,
  PRIMARY KEY (`creditCardNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditCard`
--
--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MoviePlay`
--

DROP TABLE IF EXISTS `MoviePlay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MoviePlay` (
  `date` int(11) DEFAULT NULL
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
  `companyName` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `manager` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `zipcode` CHAR(5) NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`companyName`, `name`),
  CONSTRAINT `fk9`
    FOREIGN KEY (`companyName`)
    REFERENCES `movie_theater`.`Company` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Theater`
--

LOCK TABLES `Theater` WRITE;
/*!40000 ALTER TABLE `Theater` DISABLE KEYS */;
/*!40000 ALTER TABLE `Theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'movie_theater'
--

--
-- Dumping routines for database 'movie_theater'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-24 14:15:50


