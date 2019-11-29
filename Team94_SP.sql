#Screen 1
DROP PROCEDURE IF EXISTS user_login;
CREATE PROCEDURE `user_login`(IN i_username VARCHAR(50), IN i_password VARCHAR(50))
BEGIN
        
END


#Screen 3
DROP PROCEDURE IF EXISTS user_register;
CREATE PROCEDURE `user_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
        INSERT INTO user (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
END


#Screen 4
DROP PROCEDURE IF EXISTS customer_only_register;
CREATE PROCEDURE `customer_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
        #do you need to select from  user first
        INSERT INTO customer (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
END


#Screen 4
DROP PROCEDURE IF EXISTS customer_add_creditcard;
CREATE PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(50))
BEGIN
        INSERT INTO CreditCard (?, creditCardNum) values (?, i_creditCardNum);
END

#Screen 5
DROP PROCEDURE IF EXISTS manager_only_register;
CREATE PROCEDURE `manager_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(3), IN i_empZipCode CHAR(50))
BEGIN
        INSERT INTO manager (username, password, firstname, lastname, companyName, street, city, state, zipcode) VALUES (i_username, MD5(i_password), i_firstname, i_lastname, i_comName, i_empStreet, i_empCity, i_empState, i_empZipCode);
END


#Screen 6
DROP PROCEDURE IF EXISTS manager_customer_register;
CREATE PROCEDURE `manager_customer_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(3), IN i_empZipCode CHAR(50))
BEGIN
        #do you select from user where status is both
        #what table do values insert into
END

#Screen 6
DROP PROCEDURE IF EXISTS manager_customer_add_creditcard;
CREATE PROCEDURE `manager_customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(50))
BEGIN
        INSERT INTO CreditCard (?, creditCardNum) values (?, i_creditCardNum);
END

#Screen 13
DROP PROCEDURE IF EXISTS admin_approve_user;
CREATE PROCEDURE `admin_approve_user`(IN i_username VARCHAR(50))
BEGIN
        
END

#Screen 13
DROP PROCEDURE IF EXISTS admin_decline_user;
CREATE PROCEDURE `admin_decline_user`(IN i_username VARCHAR(50))
BEGIN
        
END

#Screen 13
#!
DROP PROCEDURE IF EXISTS admin_filter_user;
CREATE PROCEDURE `admin_filter_user`(IN i_username VARCHAR(50), IN i_status, IN i_sortBy, IN i_sortDirection)
BEGIN
        #do all view and filter reuire separate tables?
END

#Screen 14
#!
DROP PROCEDURE IF EXISTS admin_filter_company;
CREATE PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity INT, IN i_minTheater INT, IN i_maxTheater INT, IN i_minEmployee INT, IN i_maxEmployee INT, IN i_sortBy, IN i_sortDirection)
BEGIN
        
END

#Screen 15
#inconsistency with table variable names and order
DROP PROCEDURE IF EXISTS admin_create_theater;
CREATE PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(3), IN i_thZipcode CHAR(50), IN i_capacity INT, IN i_manUsername VARCHAR(50))
BEGIN
        INSERT INTO Theater (companyName, name, manager, street, city, state, zipcode) values ();
END

#Screen 16
DROP PROCEDURE IF EXISTS admin_view_comDetail_emp;
CREATE PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN
        
END

#Screen 16
DROP PROCEDURE IF EXISTS admin_view_comDetail_th;
CREATE PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
        
END


#Screen 17
DROP PROCEDURE IF EXISTS admin_create_mov;
CREATE PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(50), IN i_movDuration INT, IN i_movReleaseDate DATE)
BEGIN
        INSERT INTO Movie (releaseDate, name, duration) values (i_movReleaseDate, i_movName, i_movDuration);
END

#Screen 18
DROP PROCEDURE IF EXISTS manager_filter_th;
CREATE PROCEDURE `manager_filter_th`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_minMovDuration INT, IN i_maxMovDuration INT, IN i_minMovReleaseDate DATE, IN maxMovReleaseDate DATE, IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE, IN i_includeNotPlayed BOOLEAN)
BEGIN
        
END

#Screen 19
DROP PROCEDURE IF EXISTS manager_schedule_mov;
CREATE PROCEDURE `manager_schedule_mov`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_movPlayDate DATE)
BEGIN
        
END


#Screen 20
DROP PROCEDURE IF EXISTS customer_filter_mov;
CREATE PROCEDURE `customer_filter_mov`(IN i_movName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3), IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE)
BEGIN
        
END


#Screen 20
DROP PROCEDURE IF EXISTS customer_view_mov;
CREATE PROCEDURE `customer_view_mov`(IN i_creditCardNum CHAR(50), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_movPlayDate DATE)
BEGIN
        
END


#Screen 21
DROP PROCEDURE IF EXISTS customer_view_history;
CREATE PROCEDURE `customer_view_history`(IN i_cusUsername VARCHAR(50))
BEGIN
        
END


#Screen 22
DROP PROCEDURE IF EXISTS user_filter_th;
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
END



#Screen 22
DROP PROCEDURE IF EXISTS user_visit_th;
CREATE PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_visitDate DATE, IN i_username VARCHAR(50))
BEGIN
    INSERT INTO UserVisitTheater (thName, comName, visitDate, username)
    VALUES (i_thName, i_comName, i_visitDate, i_username);
END



#Screen 23
DROP PROCEDURE IF EXISTS user_filter_visitHistory;
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
END