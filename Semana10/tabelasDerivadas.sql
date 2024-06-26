--  JULIA MARTINS SOUZA
--  COLTEC - Banco de Dados
--  TABELAS DERIVADAS - SEMANA 9 --

SELECT "JULIA MARTINS SOUZA";

-- EXEMPLO 1
select "Exemplo 1";
use classicmodels,

SELECT productName, sales FROM (SELECT productCode, ROUND(SUM(quantityOrdered * priceEach)) sales FROM orderdetails INNER JOIN orders USING (orderNumber) WHERE YEAR(shippedDate) = 2003 GROUP BY productCode ORDER BY sales DESC LIMIT 5) top5products2003 INNER JOIN products USING (productCode);

-- EXEMPLO 2
select "Exemplo 2";
use classicmodels,

SELECT customerNumber, ROUND(SUM(quantityOrdered * priceEach)) sales, (CASE WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver' WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold' WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum' END) customerGroup FROM orderdetails INNER JOIN orders USING (orderNumber) WHERE YEAR(shippedDate) = 2003 GROUP BY customerNumber;


