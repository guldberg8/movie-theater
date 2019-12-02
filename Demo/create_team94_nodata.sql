CREATE DATABASE  IF NOT EXISTS `Team94`;

CREATE TABLE `Team94`.`Company` (
  `companyName` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`companyName`)); 

CREATE TABLE `Team94`.`User` (
  `username` VARCHAR(128) NOT NULL,
  `status` VARCHAR(128) NULL,
  `password` VARCHAR(128) NOT NULL,
  `firstName` VARCHAR(128) NULL,
  `lastName` VARCHAR(128) NULL,
  PRIMARY KEY (`username`));

CREATE TABLE `Team94`.`Movie` (
  `releaseDate` DATE NOT NULL,
  `movieName` VARCHAR(128) NOT NULL,
  `duration` VARCHAR(128) NULL,
  PRIMARY KEY (`releaseDate`, `movieName`));

CREATE TABLE `Team94`.`Customer` (
  `username` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk1`
    FOREIGN KEY (`username`)
    REFERENCES `Team94`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `Team94`.`Employee` (
  `username` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk2`
    FOREIGN KEY (`username`)
    REFERENCES `Team94`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `Team94`.`Admin` (
  `username` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk3`
    FOREIGN KEY (`username`)
    REFERENCES `Team94`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `Team94`.`Manager` (
  `username` VARCHAR(128) NOT NULL,
  `companyName` VARCHAR(128) NOT NULL,
  `street` VARCHAR(128) NULL,
  `city` VARCHAR(128) NULL,
  `state` CHAR(2) NULL,
  `zipcode` CHAR(5) NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `manager_address_index` (`zipcode` ASC, `state` ASC, `city` ASC, `street` ASC),
  CONSTRAINT `fk4`
    FOREIGN KEY (`username`)
    REFERENCES `Team94`.`User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk5`
    FOREIGN KEY (`companyName`)
    REFERENCES `Team94`.`Company` (`companyName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `Team94`.`CreditCard` (
  `creditCardNum` CHAR(16) NOT NULL,
  `username` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`creditCardNum`),
  CONSTRAINT `fk6`
    FOREIGN KEY (`username`)
    REFERENCES `Team94`.`Customer` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `Team94`.`Theater` (
  `companyName` VARCHAR(128) NOT NULL,
  `theaterName` VARCHAR(128) NOT NULL,
  `manager` VARCHAR(128) NOT NULL,
  `street` VARCHAR(128) NULL,
  `city` VARCHAR(128) NULL,
  `state` CHAR(2) NULL,
  `zipcode` CHAR(5) NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`companyName`, `theaterName`),
  CONSTRAINT `fk7`
    FOREIGN KEY (`companyName`)
    REFERENCES `Team94`.`Company` (`companyName`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk8`
    FOREIGN KEY (`manager`)
    REFERENCES `Team94`.`Manager` (`username`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE `Team94`.`Visit` (
  `visitID`  INT NOT NULL AUTO_INCREMENT,
  `visitDate` DATE NULL,
  `companyName` VARCHAR(128) NOT NULL,
  `theaterName` VARCHAR(128) NOT NULL,  
  `username` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`visitID`),
  CONSTRAINT `fk9`
    FOREIGN KEY (`companyName`,`theaterName`)
    REFERENCES `Team94`.`Theater` (`companyName`,`theaterName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk10`
    FOREIGN KEY (`username`)
    REFERENCES `Team94`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `Team94`.`MoviePlay` (
  `companyName` VARCHAR(128) NOT NULL,
  `theaterName` VARCHAR(128) NOT NULL,
  `movieReleaseDate` DATE NOT NULL,
  `movieName` VARCHAR(128) NOT NULL,
  `playDate` DATE NOT NULL,
  PRIMARY KEY (`companyName`, `theaterName`, `movieReleaseDate`, `movieName`, `playDate`),
  CONSTRAINT `fk11`
    FOREIGN KEY (`companyName` , `theaterName`)
    REFERENCES `Team94`.`Theater` (`companyName` , `theaterName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk12`
    FOREIGN KEY (`movieReleaseDate`,`movieName`)
    REFERENCES `Team94`.`Movie` (`releaseDate`,`movieName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `Team94`.`Transaction` (
  `creditCardNum` CHAR(16) NOT NULL,
  `companyName` VARCHAR(128) NOT NULL,
  `theaterName` VARCHAR(128) NOT NULL,
  `movieReleaseDate` DATE NOT NULL,
  `movieName` VARCHAR(128) NOT NULL,
  `moviePlayDate` DATE NOT NULL,
  PRIMARY KEY (`creditCardNum`, `companyName`, `theaterName`, `movieReleaseDate`, `movieName`, `moviePlayDate`),
  CONSTRAINT `fk13`
    FOREIGN KEY (`creditCardNum`)
    REFERENCES `Team94`.`CreditCard` (`creditCardNum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk14`
    FOREIGN KEY (`companyName` , `theaterName` , `movieReleaseDate` , `movieName` , `moviePlayDate`)
    REFERENCES `Team94`.`MoviePlay` (`companyName` , `theaterName` , `movieReleaseDate` , `movieName` , `playDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);