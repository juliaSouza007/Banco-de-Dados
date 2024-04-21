-- JULIA MARTINS SOUZA --
-- COLTEC - Banco de Dados --
-- ATIVIDADES SEMANA 7 --

-- TAREFA 1 --
USE a2023952624@teiacoltec.org;

-- Criar Tabelas
CREATE TABLE Funcionarios(
    id INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL
);

CREATE TABLE Clientes(
    id INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL
);

-- Preencher Dados
INSERT INTO Funcionarios VALUES
(1, 'Ana', 'Silva'),
(2, 'Breno', 'Oliveira'),
(3, 'Carla', 'Moura'),
(4, 'Daniel', 'Araujo'),
(5, 'Maria', 'Meire');

INSERT INTO Clientes VALUES
(6, 'Andre', 'Silveira'),
(7, 'Bruna', 'Silva'),
(3, 'Carla', 'Moura'),
(8, 'Carlos', 'Moura'),
(4, 'Daniel', 'Araujo'),
(9, 'Maria', 'Freire');

-- Exercício 1
-- ALTER TABLE Funcionarios ADD id INT AFTER Sobrenome;

-- Exercício 2 - Todos das duas tabelas SEM DUPLICADOS
SELECT "Exercício 2";
SELECT Nome,Sobrenome FROM (SELECT Nome,Sobrenome FROM Funcionarios UNION SELECT Nome,Sobrenome FROM Clientes) AS nome_sobrenome_unicos;

-- Exercício 3 - Todos das duas tabelas INCLUINDO OS DUPLICADOS
SELECT "Exercício 3";
SELECT Nome,Sobrenome FROM (SELECT Nome,Sobrenome FROM Funcionarios UNION ALL SELECT Nome,Sobrenome FROM Clientes) AS nome_sobrenome_unicos;

-- Exercício 4
SELECT "Exercício 4";
SELECT C.Nome FROM Clientes C LEFT JOIN Funcionarios F ON C.id = F.id WHERE F.Nome IS NULL;

-- Exercício 5
SELECT "Exercício 5";
SELECT F.Nome,F.Sobrenome FROM Funcionarios F INNER JOIN Clientes C ON C.id = F.id;

-- Exercício 6
SELECT "Exercício 6";
SELECT Nome,Sobrenome FROM (SELECT Nome,Sobrenome FROM Funcionarios UNION SELECT Nome,Sobrenome FROM Clientes) AS nome_sobrenome_unicos WHERE Nome LIKE "M%" OR Nome LIKE "%ire" OR Sobrenome LIKE "M%" OR Sobrenome LIKE "%ire";

-- Fim da Tarefa 1
