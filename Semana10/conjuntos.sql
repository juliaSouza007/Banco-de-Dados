--  JULIA MARTINS SOUZA
--  COLTEC - Banco de Dados
--  CONJUNTOS - SEMANA 9 --

SELECT "JULIA MARTINS SOUZA";

-- EXEMPLO 1
select "Exemplo 1";
create conjuntos;
use conjuntos,

create tab1;
INSERT INTO `tab1` (`id`, `valor`) VALUES (1, 1),(2,1),(3,2),(4,3),(5,3),(6,4);

create tab2;
INSERT INTO `tab2` (`id`, `valor`) VALUES (1,0),(2,1),(3,2),(4,3),(5,4),(6,5);

SELECT * FROM tab1 UNION SELECT * FROM tab2;

SELECT * FROM tab1 UNION SELECT * FROM tab2 ORDER BY id;

-- EXEMPLO 2
select "Exemplo 1";
use livraria;

SELECT titulo FROM livro INNER JOIN assunto ON assunto = SIGLA WHERE descricao = 'banco de dados' UNION SELECT titulo FROM livro INNER JOIN editora E ON editora = E.codigo1 WHERE nome LIKE '%mirandela';

-- EXEMPLO 3
select "Exemplo 3";
use conjuntos;

SELECT * FROM tab1 UNION ALL SELECT * FROM tab2 ORDER BY id;

SELECT valor FROM tab1 UNION SELECT valor FROM tab2;

-- EXEMPLO 4
select "Exemplo 4";
use conjuntos;

CREATE TABLE t1 (
    id INT PRIMARY KEY
);

CREATE TABLE t2 LIKE t1;

INSERT INTO t1(id) VALUES(1),(2),(3);

INSERT INTO t2(id) VALUES(2),(3),(4);

SELECT * FROM `t1`;

SELECT * FROM `t2`;

SELECT DISTINCT id FROM t1 INNER JOIN t2 USING(id);

SELECT DISTINCT id FROM t1 WHERE id IN (SELECT id FROM t2);

-- EXEMPLO 5
select "Exemplo 5";
use conjuntos;

SELECT DISTINCT valor FROM tab1 INNER JOIN tab2 USING(valor);

-- EXEMPLO 6
select "Exemplo 6";
use livraria;

SELECT DISTINCT titulo FROM livro INNER JOIN assunto ON assunto = SIGLA WHERE descricao = 'programação' AND titulo IN(SELECT titulo FROM livro INNER JOIN editora E ON editora = E.codigo1 WHERE nome LIKE '%mirandela%');

-- EXEMPLO 7
select "Exemplo 7";
use conjuntos;

SELECT id FROM t1 WHERE id NOT IN (SELECT id FROM t2);

SELECT id FROM t2 WHERE id NOT IN (SELECT id FROM t1);

-- EXEMPLO 8
select "Exemplo 8";
use conjuntos;

SELECT t1.valor as 'valor-tab1', t2.valor as 'valor-tab2' FROM tab1 t1 INNER JOIN tab2 t2 ON t1.id = t2.id;


