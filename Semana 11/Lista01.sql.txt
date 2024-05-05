--  JULIA MARTINS SOUZA
--  COLTEC - Banco de Dados
--  LISTA 01 - SEMANA 11 --

SELECT "JULIA MARTINS SOUZA";

-- Tarefa 1

SELECT "Tarefa 1";

-- Criar tabela e inserir dados
-- inserir 2 novas colunas
-- alterar dados das colunas

UPDATE trigonometria
SET erroCos = cosseno - cossaprox
WHERE erroCos = 0

UPDATE trigonometria
SET erroSen = seno - senaprox
WHERE erroSen = 0


-- Tarefa 2

SELECT "Tarefa 2";

-- Criar tabela e inserir dados
-- inserir colunas
-- alterar tabelas

-- Nome - apenas primeiro nome... utilizar a funcao SUBSTRING_INDEX(Coluna, delimitador, numPalavras)
-- SELECT SUBSTRING_INDEX(Nome, " ", 1) FROM DadosPessoais;
-- Se colocar numPalavras negativo, comeca da esquerda para direira

-- Para inserir o email de forma fácil: CONCAT(expression1, expression2, expression3,...)
-- Esse comando irá buscar colunas na tabela e utilizar de parâmetros

-- Para inserir data de nascimento de forma fácil: 
DATE_ADD(date, INTERVAL RAND()value interval) 
-- Esse comando (RAND) sorteia datas aleatórias de acordo com o intervalo escolhido, enquanto DATE_ADD, adciona o intervalo de valores a partir da data escolhida

SELECT "Exercicio 3";

UPDATE DadosPessoais
SET Sobrenome = Nome;

UPDATE DadosPessoais
SET Nome = SUBSTRING_INDEX(Nome, ' ', 1);

UPDATE DadosPessoais
SET Sobrenome = SUBSTRING_INDEX(Sobrenome, ' ', -1);

UPDATE DadosPessoais 
SET Email = CONCAT(Nome, '.', Sobrenome, '@gmail.com');

UPDATE DadosPessoais
SET DataNascimento = DATE_ADD('2006-01-01', INTERVAL RAND()*365*3 DAY);

SELECT "Exercicio 4";

UPDATE Notas N
SET N.BancoDados = 6
WHERE N.ID IN(SELECT D.ID 
              FROM DadosPessoais D
              WHERE D.Nome = 'Clyde');

-- CONSULTAS 

-- EX 05
SELECT "Exercicio 5";

CREATE TEMPORARY TABLE maxNotas (
    Materia VARCHAR(20),
    ID int
);

INSERT INTO maxNotas (Materia, ID) VALUES 
    ('maxBDD', (SELECT ID FROM Notas ORDER BY BancoDados DESC LIMIT 1)),
    ('maxAEDES', (SELECT ID FROM Notas ORDER BY AEDES DESC LIMIT 1)),
    ('maxLabAEDES', (SELECT ID FROM Notas ORDER BY LabAEDES DESC LIMIT 1)),
    ('maxPOO', (SELECT ID FROM Notas ORDER BY POO DESC LIMIT 1));

SELECT N.ID, M.Materia
FROM Notas N
INNER JOIN maxNotas M
ON N.ID = M.ID;

-- EX 06
SELECT "Exercicio 6";

SELECT AVG(BancoDados), AVG(AEDES), AVG(LabAEDES), AVG(POO)
FROM Notas;

-- EX 07
SELECT "Exercicio 7"

SELECT ID, ((BancoDados + AEDES + LabAEDES + POO)/4) AS Media
FROM Notas
ORDER BY ID;

-- OPERACOES 

-- EX 08
SELECT "Exercicio 8";

UPDATE Notas
SET Media = (BancoDados + AEDES + LabAEDES + POO)/4;

-- EX 09
SELECT "Exercicio 9";

UPDATE Notas N
SET N.LabAEDES = 8
WHERE N.ID IN(SELECT D.ID
              FROM DadosPessoais D
              WHERE D.Nome = 'Neil' AND D.Sobrenome = 'Down');

UPDATE Notas N
SET N.Media = (BancoDados + AEDES + LabAEDES + POO)/4
WHERE N.ID IN(SELECT D.ID
              FROM DadosPessoais D
              WHERE D.Nome = 'Neil' AND D.Sobrenome = 'Down');
;

-- EX 10
SELECT "Exercicio 10";

UPDATE DadosPessoais
SET Nome = 'Ana', Sobrenome = 'Logwach'
WHERE Nome = 'Anna' AND Sobrenome = 'Logwatch';

UPDATE DadosPessoais 
SET Email = CONCAT(Nome, '.', Sobrenome, '@gmail.com')
WHERE Nome = 'Ana' AND Sobrenome = 'Logwach';

-- EX 11
SELECT "Exercicio 11"

DELETE FROM Notas
WHERE ID IN (SELECT ID FROM DadosPessoais WHERE Nome = 'Anna' AND Sobrenome = 'Littlical');

DELETE FROM DadosPessoais
WHERE Nome = 'Anna' AND Sobrenome = 'Littlical'

-- Tarefa 3
SELECT "Tarefa 3";

-- criar 3 tabelas com os dados do diagrama de venn

-- EX 03
SELECT "Exercicio 3";

SELECT * FROM tabA 
UNION ALL 
SELECT * FROM tabB 
UNION ALL 
SELECT * FROM tabC;

-- EX 04
SELECT "Exercicio 4";

SELECT * FROM tabA 
UNION
SELECT * FROM tabB 
UNION 
SELECT * FROM tabC
ORDER BY Elementos;

-- EX 05
SELECT "Exercicio 5";

SELECT * FROM tabA WHERE MOD(Elementos, 2) NOT LIKE 0
UNION ALL 
SELECT * FROM tabB WHERE MOD(Elementos, 2) NOT LIKE 0
UNION ALL 
SELECT * FROM tabC WHERE MOD(Elementos, 2) NOT LIKE 0;

-- EX 06
SELECT "Exercicio 6";

SELECT SUM(sumA + sumB + sumC)
FROM
    (SELECT SUM(Elementos) AS sumA FROM tabA) AS A,
    (SELECT SUM(Elementos) AS sumB FROM tabB 
     WHERE Elementos NOT IN (SELECT Elementos FROM tabA)) AS B,
    (SELECT SUM(Elementos) AS sumC FROM tabC
     WHERE Elementos NOT IN (SELECT Elementos FROM tabA) AND Elementos NOT IN (SELECT Elementos FROM tabB)) AS C;

-- EX 07
SELECT "Exercicio 7";

SELECT MAX(Elementos), MIN(Elementos) FROM tabA
UNION
SELECT MAX(Elementos), MIN(Elementos) FROM tabB
UNION
SELECT MAX(Elementos), MIN(Elementos) FROM tabC;

-- EX 08
SELECT "Exercicio 8";

SELECT "(a)";
SELECT * FROM tabA 
UNION
SELECT * FROM tabB 
UNION 
SELECT * FROM tabC;

SELECT "(b)";
SELECT DISTINCT Elementos 
FROM tabA 
WHERE Elementos IN (SELECT Elementos FROM tabB)
  AND Elementos IN (SELECT Elementos FROM tabC);

SELECT "(c)";
SELECT Elementos FROM tabA
WHERE Elementos 
NOT IN(SELECT Elementos FROM tabB);