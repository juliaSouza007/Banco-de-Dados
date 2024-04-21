--  JULIA MARTINS SOUZA --
--  COLTEC - Banco de Dados --
--  ATIVIDADES SEMANA 6 --

-- PARTE 1 --

-- Exemplo 1
select "Exemplo 1";
select lastName,firstName from employees where officeCode IN (select officeCode from offices where country = 'USA');

-- Exemplo 2
select "Exemplo 2";
select customerNumber,checkNumber,amount from payments where amount = (select max(amount) from payments);

-- Exemplo 3
select "Exemplo 3";
select customerNumber,checkNumber,amount from payments where amount > (select avg(amount) from payments);

-- Exemplo 4
select "Exemplo 4";
select customerName from customers where customerNumber NOT IN (select distinct customerNumber from orders);

-- Exemplo 5
select "Exemplo 5";
select MAX(items),MIN(items),FLOOR(AVG(items)) from (select orderNumber, count(orderNumber) AS items from orderdetails group by orderNumber) AS lineitems;

-- Exemplo 6
select "Exemplo 6";
select productname,buyprice from products p1 where buyprice > (select AVG(buyprice) from products where productline = p1.productline);

-- Exemplo 7
select "Exemplo 7";
-- Igual ao exemplo 6

-- Exemplo 8
select "Exemplo 8";
select customerNumber,customerName from customers where EXISTS (select orderNumber, SUM(priceEach * quantityOrdered) from orderdetails INNER JOIN orders using (orderNumber) where customerNumber = customers.customerNumber group by orderNumber HAVING SUM(priceEach * quantityOrdered) > 60000);

-- Sem banco de dados livraria (exemplos 9 a 12)

-- Exemplo 13
select "Exemplo 13";
-- Fim da Parte 1
