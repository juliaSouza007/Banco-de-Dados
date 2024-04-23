--  JULIA MARTINS SOUZA
--  09/04/2024 
-- PRIMEIRA PROVA DE BDD - PROVA A--

SELECT "JULIA MARTINS SOUZA";
select sleep(5);

-- aqui defino o banco que estou usando
use Prova1A;

--  1.1
select "Questao 1.1";
CREATE TABLE Departamentos(id INT NOT NULL, departamento VARCHAR(30) NOT NULL, gerente INT NOT NULL);
INSERT INTO Departamentos values(101, 'RH', 5), (102, 'TI', 6), (103, 'Marketing', 6), (104, 'Vendas', 4);
select sleep(2);


--  1.2 
select "Questao 1.2";
SELECT E.nome,S.salario_base,D.departamento FROM empregados E INNER JOIN financeiro S INNER JOIN Departamentos D ON E.id = S.funcionario AND E.dept_ID = D.id ORDER BY salario_base ASC;
select sleep(2);


--  1.3
select "Questao 1.3";
SELECT D.departamentos, SUM(F.salario_base) AS salario_total FROM Departamentos D  INNER JOIN empregados E ON D.id = E.dept_ID INNER JOIN financeiro F ON E.id = F.funcionario GROUP BY D.departamentos;
select sleep(2);


--  1.4 
-- aumento de 20% = valor * 1,20 
-- aumento de 5% = valor * 1,05
-- aumento de 25% = valor * 1,25
select "Questao 1.4";
SELECT E.nome AS nome_do_funcionario, F.salario_base AS salario_base, (F.salario_base * 1.20) AS salario_janeiro, (F.salario_base * 1.05) AS salario_fevereiro, (F.salario_base * 1.25) AS salario_marco, (F.salario_base * (1.20 + 1.05 + 1.25)) AS total_primeiro_trimestre  FROM empregados E INNER JOIN financeiro F ON E.id = F.funcionario;
select sleep(2);

--  1.5
select "Questao 1.5";
SELECT  E.nome, F.salario_base * (1.20 + 1.05 + 1.25) AS salario_total_trimestre FROM Departamentos D INNER JOIN empregados E ON D.gerente = E.id INNER JOIN financeiro F ON E.id = F.funcionario;
select sleep(2);

--  1.6
select "Questao 1.6";
SELECT MAX(F.salario_base * (1.20 + 1.05 + 1.25)) AS Maximo FROM Departamentos D INNER JOIN empregados E ON D.gerente = E.id LEFT JOIN financeiro F ON E.id = F.funcionario;
select sleep(2);

--  1.7
select "Questao 1.7";
SELECT E.nome AS nome_do_gerente, F.salario_base * (1.20 + 1.05 + 1.25) AS salario_total_trimestre FROM Departamentos D INNER JOIN empregados E ON D.gerente = E.id INNER JOIN financeiro F ON E.id = F.funcionario WHERE F.salario_base * (1.20 + 1.05 + 1.25) = (SELECT  MAX(F.salario_base * (1.20 + 1.05 + 1.25)) FROM financeiro F INNER JOIN empregados E ON F.funcionario = E.id INNER JOIN Departamentos D ON E.dept_ID = D.id WHERE D.gerente = E.id);
select sleep(2);

--  1.8
select "Questao 1.8";
SELECT D.departamentos, SUM(F.salario_base) AS salario_total FROM Departamentos D  INNER JOIN empregados E ON D.id = E.dept_ID INNER JOIN financeiro F ON E.id = F.funcionario GROUP BY D.departamentos;
select sleep(2);


-- aqui defino o banco que estou usando
use EmpresaC;

--  2.1
select "Questao 2.1";
SELECT model, speed, hd FROM PC WHERE (cd LIKE '12x' OR cd LIKE '24x') AND price < 600;
select sleep(2);

--  2.2
select "Questao 2.2";
SELECT model, price FROM (SELECT model, price FROM Printer UNION ALL SELECT model, price FROM Laptop UNION SELECT model, price FROM PC) AS All_Products WHERE model IN (SELECT model FROM Product WHERE maker = 'B');
select sleep(2);

--  2.3
select "Questao 2.3";
SELECT DISTINCT maker FROM Product WHERE type LIKE 'PC' AND maker NOT IN (SELECT maker FROM Product WHERE type LIKE 'Laptop' );
select sleep(2);

--  2.4
select "Questao 2.4";
SELECT model, price FROM Printer WHERE price = (SELECT MAX(price) FROM Printer);
select sleep(2);


-- mysql -u usuario -p < JuliaMartinsSouza.sql
