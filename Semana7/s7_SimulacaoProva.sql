-- JULIA MARTINS SOUZA --
-- COLTEC - Banco de Dados --
-- ATIVIDADES SEMANA 7 --
-- SIMULAÇÃO DE PROVA --

-- BDD _ EMPRESA INFO --
USE EmpresaC;
-- Exercício 1
SELECT "Exercício 1";
SELECT model,speed,hd FROM PC WHERE price<500;

-- Exercício 2
SELECT "Exercício 2 - Diferentes";
SELECT DISTINCT type FROM Printer;

-- Exercício 3
SELECT "Exercício 3";
SELECT L.speed,P.Maker FROM Laptop L INNER JOIN Product P ON L.model = P.model WHERE hd>=10;

-- BDD _ COMPANY --
USE company;
-- Exercício 4
SELECT "Exercício 4";
SELECT FIRST_NAME,SALARY FROM employees HAVING SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME LIKE 'Partners');

-- Exercício 5
SELECT "Exercício 5";
SELECT FIRST_NAME,SALARY FROM employees HAVING SALARY > (SELECT AVG(SALARY) FROM employees);

-- Exercício 6
SELECT "Exercício 6";
SELECT FIRST_NAME,LAST_NAME FROM employees WHERE JOB_ID LIKE 'IT%';

-- BDD _ WORLD --
USE world;
-- Exercício 7
SELECT "Exercício 7";
SELECT Name, HeadOfState FROM Country ORDER BY Population DESC LIMIT 1;

-- Exercício 8
SELECT "Exercício 8";
SELECT C.Code,count(L.Language) AS num FROM Country C INNER JOIN CountryLanguage L ON C.Code = L.CountryCode WHERE L.IsOfficial LIKE "T" GROUP BY L.CountryCode ORDER BY num DESC;

-- Exercício 9
SELECT "Exercício 9";
SELECT count(L.Language) AS num FROM Country C INNER JOIN CountryLanguage L ON C.Code = L.CountryCode WHERE L.IsOfficial LIKE "T" GROUP BY L.CountryCode ORDER BY num DESC LIMIT 1;

-- BDD _ NORTHWIND2024 --
USE northwind2024,
-- Exercício 10
SELECT "Exercício 10";
SELECT CustomerID,CompanyName,City,Country FROM Customers WHERE Country LIKE 'Germany' AND City LIKE 'Berlin';

-- Exercício 11
SELECT "Exercício 11";
SELECT CustomerID FROM Customers WHERE City IN ('Berlin','Stuttgart');

-- Exercício 12
SELECT "Exercício 12";
SELECT CustomerID FROM Customers WHERE Country NOT IN ('Germany');

-- BDD _ TITANIC --
USE titanic;
-- Exercício 13
SELECT "Exercício 13";
SELECT count(Survived=1) FROM passengers;

-- Exercício 14
SELECT "Exercício 14";
SELECT count(PassengerId) FROM passengers GROUP BY Pclass;

-- Exercício 15
SELECT "Exercício 15";
SELECT count(PassengerId) FROM passengers;

-- BDD _ FLIGHT --
USE flight;
-- Exercício 16
SELECT "Exercício 16";
SELECT * FROM airport;

-- Exercício 17
SELECT "Exercício 17";
SELECT flight_num FROM flight WHERE dept_airport LIKE 'LHR';

-- Exercício 18
SELECT "Exercício 18";
SELECT f.flight_num FROM flight f INNER JOIN airport a ON f.dept_airport=a.code WHERE a.city LIKE "London";

-- BDD _ EMPLOYEES --
USE employees;
-- Exercício 19
SELECT "Exercício 19";
SELECT emp_no FROM salaries WHERE emp_no BETWEEN 1001 AND 1010;

-- Exercício 20
SELECT "Exercício 20";
SELECT count(emp_no) FROM dept_emp WHERE dept_no IN('d005','d007');

-- Exercício 21 - Errada
--SELECT "Exercício 21 - Errada";
--SELECT count(emp_no) FROM employees ORDER BY gender LIKE 'M' UNION (SELECT count(emp_no) FROM employees ORDER BY gender LIKE 'F');

-- Fim da simulação de prova
