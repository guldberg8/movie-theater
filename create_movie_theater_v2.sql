CREATE DATABASE  IF NOT EXISTS `movie_theater`;

CREATE TABLE `movie_theater`.`Company` (
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`name`)); 

CREATE TABLE `movie_theater`.`User` (
  `username` VARCHAR(128) NOT NULL,
  `status` VARCHAR(128) NULL,
  `password` VARCHAR(128) NOT NULL,
  `firstName` VARCHAR(128) NULL,
  `lastName` VARCHAR(128) NULL,
  PRIMARY KEY (`username`));

CREATE TABLE `movie_theater`.`Movie` (
  `releaseDate` DATE NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `duration` VARCHAR(128) NULL,
  PRIMARY KEY (`releaseDate`, `name`));

CREATE TABLE `movie_theater`.`Customer` (
  `username` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk1`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Employee` (
  `username` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk2`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Admin` (
  `username` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk3`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Manager` (
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
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk5`
    FOREIGN KEY (`companyName`)
    REFERENCES `movie_theater`.`Company` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`CreditCard` (
  `creditCardNum` CHAR(12) NOT NULL,
  `customerName` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`creditCardNum`),
  CONSTRAINT `fk6`
    FOREIGN KEY (`customerName`)
    REFERENCES `movie_theater`.`Customer` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Theater` (
  `companyName` VARCHAR(128) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `manager` VARCHAR(128) NOT NULL,
  `street` VARCHAR(128) NULL,
  `city` VARCHAR(128) NULL,
  `state` CHAR(2) NULL,
  `zipcode` CHAR(5) NULL,
  PRIMARY KEY (`companyName`, `name`),
  CONSTRAINT `fk7`
    FOREIGN KEY (`companyName`)
    REFERENCES `movie_theater`.`Company` (`name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk8`
    FOREIGN KEY (`manager`)
    REFERENCES `movie_theater`.`Manager` (`username`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Visit` (
  `ID`  INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `companyName` VARCHAR(128) NOT NULL,
  `theaterName` VARCHAR(128) NOT NULL,  
  `user` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk9`
    FOREIGN KEY (`companyName`,`theaterName`)
    REFERENCES `movie_theater`.`Theater` (`companyName`,`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk10`
    FOREIGN KEY (`user`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`MoviePlay` (
  `companyName` VARCHAR(128) NOT NULL,
  `theaterName` VARCHAR(128) NOT NULL,
  `movieReleaseDate` DATE NOT NULL,
  `movieName` VARCHAR(128) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`companyName`, `theaterName`, `movieReleaseDate`, `movieName`, `date`),
  CONSTRAINT `fk11`
    FOREIGN KEY (`companyName` , `theaterName`)
    REFERENCES `movie_theater`.`Theater` (`companyName` , `name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk12`
    FOREIGN KEY (`movieReleaseDate`,`movieName`)
    REFERENCES `movie_theater`.`Movie` (`releaseDate`,`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Transaction` (
  `creditCard` CHAR(12) NOT NULL,
  `companyName` VARCHAR(128) NOT NULL,
  `theaterName` VARCHAR(128) NOT NULL,
  `movieReleaseDate` DATE NOT NULL,
  `movieName` VARCHAR(128) NOT NULL,
  `moviePlayDate` DATE NOT NULL,
  PRIMARY KEY (`creditCard`, `companyName`, `theaterName`, `movieReleaseDate`, `movieName`, `moviePlayDate`),
  CONSTRAINT `fk13`
    FOREIGN KEY (`creditCard`)
    REFERENCES `movie_theater`.`CreditCard` (`creditCardNum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk14`
    FOREIGN KEY (`companyName` , `theaterName` , `movieReleaseDate` , `movieName` , `moviePlayDate`)
    REFERENCES `movie_theater`.`MoviePlay` (`companyName` , `theaterName` , `movieReleaseDate` , `movieName` , `date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);