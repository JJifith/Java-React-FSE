USE java_fse;

DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Accounts(
                         accountId INT PRIMARY KEY,
                         customerName VARCHAR(50),
                         balance DECIMAL(10,2)
);

INSERT INTO Accounts VALUES
                         (1,'John',10000),
                         (2,'Alice',8000),
                         (3,'David',12000),
                         (4,'Emma',6000);

CREATE TABLE Employees(
                          employeeId INT PRIMARY KEY,
                          employeeName VARCHAR(50),
                          department VARCHAR(30),
                          salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
                          (1,'Rahul','IT',50000),
                          (2,'Anjali','HR',45000),
                          (3,'Arun','IT',60000),
                          (4,'Neha','Finance',55000);

DROP PROCEDURE IF EXISTS ProcessMonthlyInterest;

DELIMITER //

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN

UPDATE Accounts
SET balance = balance + (balance * 0.01);

END //

DELIMITER ;

CALL ProcessMonthlyInterest();

SELECT * FROM Accounts;

DROP PROCEDURE IF EXISTS UpdateEmployeeBonus;

DELIMITER //

CREATE PROCEDURE UpdateEmployeeBonus(
    IN deptName VARCHAR(30),
    IN bonusPercent DECIMAL(5,2)
)
BEGIN

UPDATE Employees
SET salary = salary + (salary * bonusPercent / 100)
WHERE department = deptName;

END //

DELIMITER ;

CALL UpdateEmployeeBonus('IT',10);

SELECT * FROM Employees;

DROP PROCEDURE IF EXISTS TransferFunds;

DELIMITER //

CREATE PROCEDURE TransferFunds(
    IN fromAccount INT,
    IN toAccount INT,
    IN amount DECIMAL(10,2)
)
BEGIN

DECLARE currentBalance DECIMAL(10,2);

SELECT balance
INTO currentBalance
FROM Accounts
WHERE accountId = fromAccount;

IF currentBalance >= amount THEN

UPDATE Accounts
SET balance = balance - amount
WHERE accountId = fromAccount;

UPDATE Accounts
SET balance = balance + amount
WHERE accountId = toAccount;

SELECT 'Transfer Successful' AS Message;

ELSE

SELECT 'Insufficient Balance' AS Message;

END IF;

END //

DELIMITER ;

CALL TransferFunds(1,2,2000);

SELECT * FROM Accounts;