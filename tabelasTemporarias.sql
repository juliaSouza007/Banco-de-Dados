--  JULIA MARTINS SOUZA
--  COLTEC - Banco de Dados
--  TABELAS TEMPORARIAS - SEMANA 9 --

SELECT "JULIA MARTINS SOUZA";

-- EXEMPLO 1
select "Exemplo 1";
use classicmodels,

CREATE TEMPORARY TABLE credits( customerNumber INT PRIMARY KEY, creditLimit DEC(10,2) );

INSERT INTO credits(customerNumber,creditLimit)

SELECT customerNumber, creditLimit FROM customers WHERE creditLimit > 0;

-- EXEMPLO 2
select "Exemplo 2";
use classicmodels,

CREATE TEMPORARY TABLE top_customers SELECT p.customerNumber, c.customerName, ROUND(SUM(p.amount),2) sales FROM payments p INNER JOIN customers c ON c.customerNumber = p.customerNumber GROUP BY p.customerNumber ORDER BY sales DESC LIMIT 10;

SELECT customerNumber, customerName, sales FROM top_customers ORDER BY sales;
