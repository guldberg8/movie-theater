#Screen 1
DROP PROCEDURE IF EXISTS `user_login`;
DELIMITER $$
CREATE PROCEDURE `user_login`(IN i_username VARCHAR(50), IN i_password VARCHAR(50))
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
END$$
DELIMITER ;


#Screen 3
DROP PROCEDURE IF EXISTS `user_register`;
DELIMITER $$
CREATE PROCEDURE `user_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
    INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
END$$
DELIMITER ;


#Screen 4
DROP PROCEDURE IF EXISTS `customer_only_register`;
DELIMITER $$
CREATE PROCEDURE `customer_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
    INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO Customer (username) VALUES (i_username);
END$$
DELIMITER ;


#Screen 4
DROP PROCEDURE IF EXISTS `customer_add_creditcard`;
DELIMITER $$
CREATE PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(50))
BEGIN
    INSERT INTO CreditCard (creditCardNum, username) VALUES (i_creditCardNum, i_username);
END$$
DELIMITER ;

#Screen 5
DROP PROCEDURE IF EXISTS `manager_only_register`;
DELIMITER $$
CREATE PROCEDURE `manager_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(3), IN i_empZipCode CHAR(50))
BEGIN
    INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO Manager (username, street, city, state, zipcode, companyName) VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName) ;
END$$
DELIMITER ;


#Screen 6
DROP PROCEDURE IF EXISTS `manager_customer_register`;
DELIMITER $$
CREATE PROCEDURE `manager_customer_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(3), IN i_empZipCode CHAR(50))
BEGIN
    INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO Customer (username) VALUES (i_username);
    INSERT INTO Manager (username, street, city, state, zipcode, companyName) VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName);
END$$
DELIMITER ;

#Screen 6
DROP PROCEDURE IF EXISTS `manager_customer_add_creditcard`;
DELIMITER $$
CREATE PROCEDURE `manager_customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(50))
BEGIN
    INSERT INTO creditCard (creditCardNum, username) VALUES (i_creditCardNum, i_username);
END$$
DELIMITER ;

#Screen 13
DROP PROCEDURE IF EXISTS `admin_approve_user`;
DELIMITER $$
CREATE PROCEDURE `admin_approve_user`(IN i_username VARCHAR(50))
BEGIN
    UPDATE User
    SET status = 'Approved'
    WHERE username = i_username;
END$$
DELIMITER ;

#Screen 13
DROP PROCEDURE IF EXISTS `admin_decline_user`;
DELIMITER $$
CREATE PROCEDURE `admin_decline_user`(IN i_username VARCHAR(50))
BEGIN
    UPDATE User
    SET status = 'Declined'
    WHERE username = i_username;
END$$
DELIMITER ;

#Screen 13
DROP PROCEDURE IF EXISTS `admin_filter_user`;
DELIMITER $$
CREATE PROCEDURE `admin_filter_user`(IN i_username VARCHAR(50), IN i_status VARCHAR(10), IN i_sortBy VARCHAR(20), IN i_sortDirection VARCHAR(4))
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
END$$
DELIMITER ;

#Screen 14
DROP procedure IF EXISTS `admin_filter_company`;
DELIMITER $$
CREATE PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity INT, IN i_maxCity INT, IN i_minTheater INT, IN i_maxTheater INT, IN i_minEmployee INT, IN i_maxEmployee INT, IN i_sortBy VARCHAR(20), IN i_sortDirection VARCHAR(4))
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
END$$
DELIMITER ;

#Screen 15
#check for inconsistency with table variable names and order
DROP PROCEDURE IF EXISTS `admin_create_theater`;
DELIMITER $$
CREATE PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(3), IN i_thZipcode CHAR(50), IN i_capacity INT, IN i_manUsername VARCHAR(50))
BEGIN
    INSERT INTO Theater (companyName, theaterName, manager, street, city, state, zipcode, capacity) VALUES (i_comName, i_thName, i_manUsername, i_thStreet, i_thCity, i_thState, i_thZipcode, i_capacity);
END$$
DELIMITER ;

#Screen 16
DROP PROCEDURE IF EXISTS `admin_view_comDetail_emp`;
DELIMITER $$
CREATE PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS `AdComDetailEmp`;
    CREATE TABLE AdComDetailEmp AS
    SELECT firstName as empFirstname, lastName as empLastname
    FROM Manager
    Join User
    ON Manager.username = User.username
    WHERE (companyName = i_comName OR i_comName = "");
END$$
DELIMITER ;

#Screen 16
DROP PROCEDURE IF EXISTS `admin_view_comDetail_th`;
DELIMITER $$
CREATE PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS `AdComDetailTh`;
    CREATE TABLE `AdComDetailTh` AS
    SELECT theaterName as thName, manager as thManagerUsername, city as thCity, state as thState, capacity as thCapacity
    FROM Theater
    WHERE companyName = i_comName;
END$$
DELIMITER ;


#Screen 17
DROP PROCEDURE IF EXISTS `admin_create_mov`;
DELIMITER $$
CREATE PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(50), IN i_movDuration INT, IN i_movReleaseDate DATE)
BEGIN
    INSERT INTO Movie (releaseDate, movieName, duration) values (i_movReleaseDate, i_movName, i_movDuration);
END$$
DELIMITER ;

#Screen 18
DROP procedure IF EXISTS `manager_filter_th`;
DELIMITER $$
CREATE PROCEDURE `manager_filter_th`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_minMovDuration INT, IN i_maxMovDuration INT, IN i_minMovReleaseDate DATE, IN i_maxMovReleaseDate DATE, IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE, IN i_includeNotPlayed BOOLEAN)
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
    SELECT 
		movName, 
        movDuration,
        movReleaseDate, 
        movPlayDate
    FROM ManagerFilterThView
    WHERE 
		(manUsername = i_manUsername OR manUsername is NULL OR i_manUsername = "" OR i_manUsername = '') AND
        (movName = i_movName OR i_movName = "" OR i_movName = '') AND
        (i_minMovDuration is NULL OR movDuration >= i_minMovDuration) AND
        (i_maxMovDuration is NULL OR movDuration <= i_maxMovDuration) AND
        (i_minMovReleaseDate is NULL OR movReleaseDate >= i_minMovReleaseDate) AND 
        (i_maxMovReleaseDate is NULL OR movReleaseDate <= i_maxMovReleaseDate) AND 
        (i_minMovPlayDate is NULL OR movPlayDate >= i_minMovPlayDate) AND
        (i_maxMovPlayDate is NULL OR movPlayDate <= i_maxMovPlayDate) AND
        (i_includeNotPlayed is NULL OR (i_includeNotPLayed AND movPlayDate is NULL))
	UNION
    SELECT
		DISTINCT movName, 
        movDuration,
        movReleaseDate, 
        null as movPlayDate
	FROM 
		ManagerFilterThView
	WHERE
        (movName = i_movName OR i_movName = "" OR i_movName = '') AND
        (i_minMovDuration is NULL OR movDuration >= i_minMovDuration) AND
        (i_maxMovDuration is NULL OR movDuration <= i_maxMovDuration) AND
        (i_minMovReleaseDate is NULL OR movReleaseDate >= i_minMovReleaseDate) AND 
        (i_maxMovReleaseDate is NULL OR movReleaseDate <= i_maxMovReleaseDate) AND 
        (i_minMovPlayDate is NULL OR movPlayDate >= i_minMovPlayDate) AND
        (i_maxMovPlayDate is NULL OR movPlayDate <= i_maxMovPlayDate) AND
        (i_includeNotPlayed is NULL OR (i_includeNotPLayed AND movPlayDate is NULL)) AND
        (movName NOT IN (SELECT movName FROM ManagerFilterThView WHERE manUsername = i_manUsername)); 		
END$$
DELIMITER ;

#Screen 19
DROP PROCEDURE IF EXISTS `manager_schedule_mov`;
DELIMITER $$
CREATE PROCEDURE `manager_schedule_mov`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_movPlayDate DATE)
BEGIN
    INSERT INTO MoviePlay (companyName, theaterName, movieReleaseDate, movieName, playDate) values ((SELECT companyName FROM Theater WHERE manager = i_manUsername), (SELECT theaterName FROM Theater WHERE manager = i_manUsername), i_movReleaseDate, i_movName, i_movPlayDate);
END$$
DELIMITER ;


#Screen 20
DROP PROCEDURE IF EXISTS `customer_filter_mov`;
DELIMITER $$
CREATE PROCEDURE `customer_filter_mov`(IN i_movName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3), IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE)
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
        i_minMovPlayDate is NULL OR i_maxMovPlayDate is NULL);
END$$
DELIMITER ;


#Screen 20
DROP PROCEDURE IF EXISTS `customer_view_mov`;
DELIMITER $$
CREATE PROCEDURE `customer_view_mov`(IN i_creditCardNum CHAR(50), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_movPlayDate DATE)
BEGIN
    INSERT INTO Transaction (creditCardNum, theaterName, companyName, movieReleaseDate, movieName, moviePlayDate) VALUES (i_creditCardNum, i_thName, i_comName, i_movReleaseDate, i_movName, i_movPlayDate);
END$$
DELIMITER ;


#Screen 21
DROP procedure IF EXISTS `customer_view_history`;
DELIMITER $$
CREATE PROCEDURE `customer_view_history`(IN i_cusUsername VARCHAR(50))
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
END$$
DELIMITER ;

#Screen 22
DROP PROCEDURE IF EXISTS `user_filter_th`;
DELIMITER $$
CREATE PROCEDURE `user_filter_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3))
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
END$$
DDELIMITER ;



#Screen 22
DROP PROCEDURE IF EXISTS `user_visit_th`;
DELIMITER $$
CREATE PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_visitDate DATE, IN i_username VARCHAR(50))
BEGIN
    INSERT INTO Visit (theaterName, companyName, visitDate, username)
    VALUES (i_thName, i_comName, i_visitDate, i_username);
END$$
DELIMITER ;

#Screen 23
DROP PROCEDURE IF EXISTS `user_filter_visitHistory`;
DELIMITER $$
CREATE PROCEDURE `user_filter_visitHistory`(IN i_username VARCHAR(50), IN i_minVisitDate DATE, IN i_maxVisitDate DATE)
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
END$$
DELIMITER ;
