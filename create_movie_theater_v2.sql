CREATE DATABASE  IF NOT EXISTS `movie_theater`;

CREATE TABLE `movie_theater`.`Company` (
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`)); 

CREATE TABLE `movie_theater`.`User` (
  `username` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  PRIMARY KEY (`username`));

CREATE TABLE `movie_theater`.`Movie` (
  `releaseDate` DATE NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NULL,
  PRIMARY KEY (`releaseDate`, `name`));

CREATE TABLE `movie_theater`.`Customer` (
  `username` VARCHAR(45) NOT NULL,
  `#MovieSeened` INT(11) NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk1`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Employee` (
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk2`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Admin` (
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk3`
    FOREIGN KEY (`username`)
    REFERENCES `movie_theater`.`User` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Manager` (
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
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`CreditCard` (
  `creditCardNum` CHAR(12) NOT NULL,
  `customerName` VARCHAR(45) NULL,
  PRIMARY KEY (`creditCardNum`),
  INDEX `fk6_idx` (`customerName` ASC),
  CONSTRAINT `fk6`
    FOREIGN KEY (`customerName`)
    REFERENCES `movie_theater`.`Customer` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `movie_theater`.`Theater` (
  `companyName` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `manager` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` CHAR(2) NULL,
  `zipcode` CHAR(5) NULL,
  PRIMARY KEY (`companyName`, `name`),
  INDEX `fk8_idx` (`manager` ASC),
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
  `companyName` VARCHAR(45) NOT NULL,
  `theaterName` VARCHAR(45) NOT NULL,  
  `user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk9_idx` (`theaterName` ASC, `companyName` ASC),
  INDEX `fk10_idx` (`user` ASC),
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
  `companyName` VARCHAR(45) NOT NULL,
  `theaterName` VARCHAR(45) NOT NULL,
  `movieReleaseDate` DATE NOT NULL,
  `movieName` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`companyName`, `theaterName`, `movieReleaseDate`, `movieName`, `date`),
  INDEX `fk11_idx` (`movieName` ASC, `movieReleaseDate` ASC),
  INDEX `fk12_idx` (`companyName` ASC, `theaterName` ASC),
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
  `companyName` VARCHAR(45) NOT NULL,
  `theaterName` VARCHAR(45) NOT NULL,
  `movieReleaseDate` DATE NOT NULL,
  `movieName` VARCHAR(45) NOT NULL,
  `moviePlayDate` DATE NOT NULL,
  PRIMARY KEY (`creditCard`, `companyName`, `theaterName`, `movieReleaseDate`, `movieName`, `moviePlayDate`),
  INDEX `fk13_idx` (`creditCard` ASC),
  INDEX `fk14_idx` (`companyName` ASC, `theaterName` ASC, `movieReleaseDate` ASC, `movieName` ASC, `moviePlayDate` ASC),
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