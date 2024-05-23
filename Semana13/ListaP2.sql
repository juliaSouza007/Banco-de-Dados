--  JULIA MARTINS SOUZA
--  COLTEC - Banco de Dados
--  LISTA PARA PROVA - SEMANA 13 --

USE a2023952624@teiacoltec.org;
-- BANCO DE DADOS EMPRESA
SELECT "Exercicio 1";
SELECT Nome 
FROM Staff S
INNER JOIN Vendas V ON S.idStaff = V.idVendedor 
	WHERE V.DataVenda LIKE "%/22";
SELECT SLEEP(5);
	
SELECT "Exercicio 2";
SELECT S.Nome, COUNT(V.idVendedor) 
FROM Staff S
INNER JOIN Vendas V ON S.idStaff = V.idVendedor
	WHERE V.DataVenda LIKE "%/24"
	GROUP BY S.Nome;
SELECT SLEEP(5);
	
SELECT "Exercicio 3";
INSERT INTO Vendas VALUES
	(22, 4, '03/03/23', 200),
	(23, 2, '13/06/24', 1200), 
	(24, 77, '11/12/22', 800);
SELECT SLEEP(5);
	
SELECT "Exercicio 4";
SELECT * FROM Produtos
	WHERE ValorUnitario > 1000;
SELECT SLEEP(5);
	
-- BANCO DE DADOS PAISES
SELECT "Exercicio 1";
SELECT DISTINCT Region 
FROM Country;
SELECT SLEEP(5);

SELECT "Exercicio 2";
SELECT P.Name, C.Name, P.LifeExpectancy 
FROM Country P
INNER JOIN City C ON P.Capital = C.ID;
SELECT SLEEP(5);

SELECT "Exercicio 3";
(SELECT Name, Region
 FROM Country
	WHERE GNP = (SELECT MAX(GNP) FROM Country))
 UNION
(SELECT Name, Region
 FROM Country
 	WHERE GNP = (SELECT MIN(GNP) FROM Country));
SELECT SLEEP(5);

SELECT "Exercicio 4";
SELECT Region AS AfricaRegions 
FROM Country
	WHERE Region LIKE "%Africa";
SELECT SLEEP(5);

SELECT "Exercicio 5";
SELECT C.name, S.population, S.gdp
FROM country_stats S 
INNER JOIN countries C ON S.country_id = C.country_id
	WHERE S.year = 2000  
		ORDER BY S.gdp DESC;
SELECT SLEEP(5);

-- TAREFA 3 - CRIAR TABELA
-- =CONCATENAR(B3;"@gmail")

SELECT "JOIN";
SELECT D.nome, U.tipoConta, D.instituicao  
FROM dadosUsuarios D
INNER JOIN Usuarios U ON D.idUser = U.idUser;
SELECT SLEEP(5);

SELECT "Funcao de Agregacao";
SELECT funcao, COUNT(*) AS numFuncionarios
FROM Funcionarios
GROUP BY funcao;
SELECT SLEEP(5);

SELECT "Condicao";
SELECT DISTINCT funcao, salario 
FROM Funcionarios 
	WHERE salario >= 2400;
SELECT SLEEP(5);

SELECT "Calculo";
SELECT MIN(salario)
FROM Funcionarios;
SELECT SLEEP(5);

SELECT "Subconsulta";
SELECT nome, funcao, salario
FROM Funcionarios 
	WHERE salario >= (SELECT AVG(salario) FROM Funcionarios);
SELECT SLEEP(5);

