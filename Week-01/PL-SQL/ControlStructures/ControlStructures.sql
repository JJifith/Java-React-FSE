USE java_fse;

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
                           customerId INT PRIMARY KEY,
                           customerName VARCHAR(50),
                           age INT,
                           balance DECIMAL(10,2),
                           loanInterest DECIMAL(5,2),
                           isVIP BOOLEAN DEFAULT FALSE,
                           loanDueDays INT
);


INSERT INTO Customers VALUES
                          (1,'John',65,12000,9.5,FALSE,20),
                          (2,'Alice',45,8000,10.0,FALSE,15),
                          (3,'David',72,18000,8.5,FALSE,40),
                          (4,'Emma',61,9000,9.0,FALSE,10);

-- =========================================
-- Scenario 1
-- Apply 1% Discount for Customers Above 60
-- =========================================

DROP PROCEDURE IF EXISTS ApplySeniorDiscount;

DELIMITER //

CREATE PROCEDURE ApplySeniorDiscount()
BEGIN

    DECLARE done INT DEFAULT FALSE;
    DECLARE cId INT;
    DECLARE cAge INT;

    DECLARE customerCursor CURSOR FOR
SELECT customerId, age
FROM Customers;

DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

OPEN customerCursor;

customer_loop: LOOP

        FETCH customerCursor INTO cId, cAge;

        IF done THEN
            LEAVE customer_loop;
END IF;

        IF cAge > 60 THEN

UPDATE Customers
SET loanInterest = loanInterest - 1
WHERE customerId = cId;

END IF;

END LOOP;

CLOSE customerCursor;

END //

DELIMITER ;

CALL ApplySeniorDiscount();

-- =========================================
-- Scenario 2
-- Promote Customers to VIP
-- =========================================

DROP PROCEDURE IF EXISTS PromoteVIP;

DELIMITER //

CREATE PROCEDURE PromoteVIP()
BEGIN

    DECLARE done INT DEFAULT FALSE;
    DECLARE cId INT;
    DECLARE cBalance DECIMAL(10,2);

    DECLARE customerCursor CURSOR FOR
SELECT customerId, balance
FROM Customers;

DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

OPEN customerCursor;

vip_loop: LOOP

        FETCH customerCursor INTO cId, cBalance;

        IF done THEN
            LEAVE vip_loop;
END IF;

        IF cBalance > 10000 THEN

UPDATE Customers
SET isVIP = TRUE
WHERE customerId = cId;

END IF;

END LOOP;

CLOSE customerCursor;

END //

DELIMITER ;

CALL PromoteVIP();

-- =========================================
-- Scenario 3
-- Loan Reminder
-- =========================================

DROP PROCEDURE IF EXISTS LoanReminder;

DELIMITER //

CREATE PROCEDURE LoanReminder()
BEGIN

    DECLARE done INT DEFAULT FALSE;
    DECLARE cName VARCHAR(100);
    DECLARE dueDays INT;

    DECLARE loanCursor CURSOR FOR
SELECT customerName, loanDueDays
FROM Customers
WHERE loanDueDays <= 30;

DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

OPEN loanCursor;

reminder_loop: LOOP

        FETCH loanCursor INTO cName, dueDays;

        IF done THEN
            LEAVE reminder_loop;
END IF;

SELECT CONCAT(
               'Reminder: ',
               cName,
               ' has a loan due in ',
               dueDays,
               ' days.'
       ) AS Reminder;

END LOOP;

CLOSE loanCursor;

END //

DELIMITER ;

CALL LoanReminder();


SELECT * FROM Customers;