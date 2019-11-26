

DROP PROCEDURE IF EXISTS user_register;
DELIMITER $$
CREATE PROCEDURE `user_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
		INSERT INTO user (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS user_filter_th;
DELIMITER $$
CREATE PROCEDURE `user_filter_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3))
BEGIN
    DROP TABLE IF EXISTS UserFilterTh;
    CREATE TABLE UserFilterTh
	SELECT thName, thStreet, thCity, thState, thZipcode, comName 
    FROM Theater
    WHERE 
		(thName = i_thName OR i_thName = "ALL") AND
        (comName = i_comName OR i_comName = "ALL") AND
        (thCity = i_city OR i_city = "") AND
        (thState = i_state OR i_state = "ALL");
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS user_visit_th;
DELIMITER $$
CREATE PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_visitDate DATE, IN i_username VARCHAR(50))
BEGIN
    INSERT INTO UserVisitTheater (thName, comName, visitDate, username)
    VALUES (i_thName, i_comName, i_visitDate, i_username);
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS user_filter_visitHistory;
DELIMITER $$
CREATE PROCEDURE `user_filter_visitHistory`(IN i_username VARCHAR(50), IN i_minVisitDate DATE, IN i_maxVisitDate DATE)
BEGIN
    DROP TABLE IF EXISTS UserVisitHistory;
    CREATE TABLE UserVisitHistory
	SELECT thName, thStreet, thCity, thState, thZipcode, comName, visitDate
    FROM UserVisitTheater
		NATURAL JOIN
        Theater
	WHERE
		(username = i_username) AND
        (i_minVisitDate IS NULL OR visitDate >= i_minVisitDate) AND
        (i_maxVisitDate IS NULL OR visitDate <= i_maxVisitDate);
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS user_login;
DELIMITER $$
CREATE PROCEDURE `user_login`(IN i_username VARCHAR(50), IN i_password VARCHAR(50))
BEGIN
	DROP TABLE IF EXISTS UserLogin
	CREATE TABLE UserLogin
	SELECT username, status, isCustomer, isAdmin, isManager
	FROM User
	WHERE (username = i_username) AND (password = i_password)
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS customer_only_register;
DELIMITER $$
CREATE PROCEDURE `customer_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
	INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname)
	INSERT INTO Customer (username) VALUES (i_username)
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS customer_add_creditcard;
DELIMITER $$
CREATE PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(16))
BEGIN
        INSERT INTO creditCard (creditCardNum, username) VALUES (i_creditCardNum, i_username)
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS manager_only_register;
DELIMITER $$
CREATE PROCEDURE `manager_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(2), IN i_empZipCode CHAR(5))
BEGIN
	INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname)
        INSERT INTO Manager (username, street, city, state, zipcode, companyName) VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName) 
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS manager_customer_register;
DELIMITER $$
CREATE PROCEDURE `manager_customer_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(2), IN i_empZipCode CHAR(5))
BEGIN
	INSERT INTO User (username, password, firstname, lastname) VALUES (i_username, i_password, i_firstname, i_lastname) 
	INSERT INTO Customer (username) VALUES (i_username)
	INSERT INTO MANAGER (username, street, city, state, zipcode, companyName, theaterName) VALUES (i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName, NULL)
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS manager_customer_add_creditcard;
DELIMITER $$
CREATE PROCEDURE `manager_customer_add_creditcardn`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(15))
BEGIN
        INSERT INTO creditCard (creditCardNum, username) VALUES (i_creditCardNum, i_username)
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS admin_filter_user;
DELIMITER $$
CREATE PROCEDURE `admin_filter_user`(IN i_username VARCHAR(50), IN i_status ??, IN i_sortBy ??, IN i_sortDirection ASC)
BEGIN
        
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS admin_approve_user;
DELIMITER $$
CREATE PROCEDURE `admin_approve_user`(IN i_username VARCHAR(50))
BEGIN
        UPDATE User (username, password, firstName, lastName)
	SET status = 'Approved'
	WHERE username = i_username
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS admin_decline_user;
DELIMITER $$
CREATE PROCEDURE `admin_decline_user`(IN i_username VARCHAR(50))
BEGIN
	UPDATE User (username, password, firstName, lastName)
	SET status = 'Declined'
	WHERE username = i_username
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS admin_filter_company;
DELIMITER $$
CREATE PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity INT, IN i_maxCity INT, i_minTheater INT, IN i_maxTheater INT, IN i_minEmployee INT, IN i_maxEmployee INT, IN i_sortBy ??, IN i_sortDirection ASC)
BEGIN
        
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS admin_create_theater;
DELIMITER $$
CREATE PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(2), IN i_thZipcode CHAR(5), IN i_capacity INT, IN i_managerUsername VARCHAR(50))
BEGIN
        INSERT INTO Theater (companyName, theaterName, street, city, state, zipcode, capacity, managerUsername) VALUES (i_comName, i_thName, i_thStreet, i_thCity, i_thState, i_thZipcode, i_capacity, NULL)
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS admin_view_comDetail_emp;
DELIMITER $$
CREATE PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN
        DROP TABLE IF EXISTS AdminViewComDetailEmp
	CREATE TABLE AdminViewComDetailEmp
	
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS admin_view_comDetail_th;
DELIMITER $$
CREATE PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
       DROP TABLE IF EXISTS AdminViewComDetailTh
       CREATE TABLE AdminViewComDetailTh
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS admin_create_mov;
DELIMITER $$
CREATE PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(50), IN i_movDuration VARCHAR(50), IN i_movReleaseDate VARCHAR(50))
BEGIN
        INSERT INTO Movie (movReleaseDate, movName, duration) VALUES (i_movReleaseDate, i_movName, i_movDuration)
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS manager_filter_th;
DELIMITER $$
CREATE PROCEDURE `manager_filter_th`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_minMovDuration INT, IN i_maxMovDuration INT, IN i_minMovReleaseDate DATE, IN i_maxMovReleaseDate DATE, IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE, IN i_includeNotPlayed BOOLEAN)
BEGIN
        
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS manager_schedule_mov;
DELIMITER $$
CREATE PROCEDURE `manager_schedule_mov`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_movPlayDate DATE)
BEGIN
        
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS customer_filter_mov;
DELIMITER $$
CREATE PROCEDURE `customer_filter_mov`(IN i_movName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(50), IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE)
BEGIN
        
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS customer_view_mov;
DELIMITER $$
CREATE PROCEDURE `customer_view_mov`(IN i_creditCardNum CHAR(15), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_movPlayDate DATE)
BEGIN
      INSERT INTO Transaction (creditCard, theaterName, companyName, movieReleaseDate, movieName, date) VALUES (i_creditCardNum, i_thName, i_comName, i_movReleaseDate, i_movName, i_movPlayDate)  
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS customer_view_history;
DELIMITER $$
CREATE PROCEDURE `customer_view_history`(IN i_cusUsername VARCHAR(50))
BEGIN
       
END$$
DELIMITER ;






