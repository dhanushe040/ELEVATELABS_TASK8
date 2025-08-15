#FetchEmployeeDetails Procedure
DELIMITER //

CREATE PROCEDURE EmployeeDetails(IN emp_id INT)
BEGIN
    SELECT * FROM empl WHERE EMPid = emp_id;
END //

DELIMITER ;

CALL EmployeeDetails(101);
#101	Rajaram Sundaram	sales	12000.00	284000.00	23666.666667	115000.00	12000.00	38000.00	5



#GetAllEmployeeDetails Procedure
DELIMITER //

CREATE PROCEDURE GetAllEMPDETAILS()
BEGIN
	SELECT *  FROM EMP;
END //

DELIMITER ;

CALL GetAllEMPDETAILS();
/*
101	Rajaram Sundaram	sales	Sales Executive	M	2019-01-10	1980-01-16	12000.00	chennai	C	9988776655
102	Abinaya Krishnamoorthy	sales	Sales Executive	F	2021-02-15	1999-03-22	15000.00	chennai	T	8978675645
103	Naveen Chidambaram	accounts	Manager Manager	M	2023-01-19	1985-04-18	15000.00		R	8698756432
104	Shabeer Salman Khan	accounts	Junior Executive	M	2023-02-26	1990-06-14	10000.00	delhi	C	9089876776
105	Sureshkumar Venkatesan	sales	Sales Manager	M	2016-04-29	1999-07-31	38000.00	chennai	R	9887342312
106	Gayathri Srinivasan	IT	Developer Developer	F	2018-06-30	1980-12-11	60000.00	delhi	R	8923546123
107	Anu Rajagopal	IT	Testing Testing	F	2015-08-23	2003-09-10	12000.00	bangalore	I	7865321986
108	Ashokumar Maheswaran	IT	Testing Testing	M	2023-12-17	2001-06-15	12000.00		I	8900334455
109	Charles Joseph	sales	Sales Manager	M	2024-07-16	2000-05-05	38000.00	delhi	R	8971134231
110	Ashok Narayanan	IT	Developer Developer	M	2024-03-13	1999-08-23	45000.00	bangalore	R	9003276765
111	Annie David	accounts	Manager Manager	F	2024-02-21	1985-07-07	15000.00	delhi	R	9677254321
112	Kavya Rajkumar	sales	Sales Executive	F	2023-05-14	1989-11-27	12000.00	bangalore	I	8220797988
*/


DELIMITER //
CREATE PROCEDURE UPDATELOC(IN LOC VARCHAR(20))
BEGIN
 UPDATE EMP SET LOCATION="BANGALORE"  WHERE LOCATION=LOC;
END//
DELIMITER ;


SET SQL_SAFE_UPDATES=0;
CALL UPDATELOC("COIMBATORE");
SELECT * FROM EMP;


/*
101	Rajaram Sundaram	sales	Sales Executive	M	2019-01-10	1980-01-16	12000.00	chennai	C	9988776655
102	Abinaya Krishnamoorthy	sales	Sales Executive	F	2021-02-15	1999-03-22	15000.00	chennai	T	8978675645
103	Naveen Chidambaram	accounts	Manager Manager	M	2023-01-19	1985-04-18	15000.00		R	8698756432
104	Shabeer Salman Khan	accounts	Junior Executive	M	2023-02-26	1990-06-14	10000.00	delhi	C	9089876776
105	Sureshkumar Venkatesan	sales	Sales Manager	M	2016-04-29	1999-07-31	38000.00	chennai	R	9887342312
106	Gayathri Srinivasan	IT	Developer Developer	F	2018-06-30	1980-12-11	60000.00	delhi	R	8923546123
107	Anu Rajagopal	IT	Testing Testing	F	2015-08-23	2003-09-10	12000.00	BANGALORE	I	7865321986
108	Ashokumar Maheswaran	IT	Testing Testing	M	2023-12-17	2001-06-15	12000.00		I	8900334455
109	Charles Joseph	sales	Sales Manager	M	2024-07-16	2000-05-05	38000.00	delhi	R	8971134231
110	Ashok Narayanan	IT	Developer Developer	M	2024-03-13	1999-08-23	45000.00	BANGALORE	R	9003276765
*/

#GetMinimumSalary Procedure
DELIMITER //
CREATE PROCEDURE MINSALARY(OUT NUM INTEGER)
BEGIN
 SELECT MIN(SALARY) INTO NUM FROM EMP;
END//
DELIMITER ;

CALL MINSALARY(@M);

SELECT @M;
#10000


#CalculateDiscount Function
DELIMITER $$

CREATE FUNCTION calculate_discount(price DECIMAL(10,2), discount_rate DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN price - (price * discount_rate / 100);
END$$

DELIMITER ;


SELECT calculate_discount(1000, 10)AS DIS; 
# 900.00


DELIMITER $$

CREATE FUNCTION CustomerLEVEL(
	credit DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF credit >= 10000  THEN
       SET customerLevel = 'GOLD ';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	
	RETURN (customerLevel);
END$$

DELIMITER ;

SELECT CustomerLEVEL(30000);
#GOLD 
SELECT ENAME,CustomerLEVEL(SALARY) FROM EMP;
/*
Rajaram Sundaram	GOLD 
Abinaya Krishnamoorthy	GOLD 
Naveen Chidambaram	GOLD 
Shabeer Salman Khan	GOLD 
Sureshkumar Venkatesan	GOLD 
Gayathri Srinivasan	PLATINUM
Anu Rajagopal	GOLD 
Ashokumar Maheswaran	GOLD 
Charles Joseph	GOLD 
Ashok Narayanan	GOLD 
*/
