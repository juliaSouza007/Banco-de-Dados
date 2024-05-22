--  JULIA MARTINS SOUZA
--  COLTEC - Banco de Dados
--  LISTA PARA PROVA - SEMANA 13 --

-- BANCO DE DADOS EMPRESA
SELECT "Exercicio 1";
SELECT Nome 
FROM Staff S
INNER JOIN Vendas V ON S.idStaff = V.idVendedor 
	WHERE V.DataVenda LIKE "%/22";
	
SELECT "Exercicio 2";
SELECT S.Nome, COUNT(V.idVendedor) 
FROM Staff S
INNER JOIN Vendas V ON S.idStaff = V.idVendedor
	WHERE V.DataVenda LIKE "%/24"
	GROUP BY S.Nome;
	
SELECT "Exercicio 3";
INSERT INTO Vendas VALUES
	(22, 4, '03/03/23', 200),
	(23, 2, '13/06/24', 1200), 
	(24, 77, '11/12/22', 800);
	
SELECT "Exercicio 4";
SELECT * FROM Produtos
	WHERE ValorUnitario > 1000;
	
-- BANCO DE DADOS PAISES
SELECT "Exercicio 1";
SELECT DISTINCT Region 
FROM Country;

SELECT "Exercicio 2";
SELECT P.Name, P.LifeExpectancy, C.Name
FROM Country P 
INNER JOIN City C ON P.Capital = C.ID;

SELECT 'Exercicio 3";

