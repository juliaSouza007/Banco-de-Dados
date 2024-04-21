--  JULIA MARTINS SOUZA --
--  COLTEC - Banco de Dados --
--  ATIVIDADES SEMANA 6 (EXTRA) --
 
USE world;
-- Exercício 1
select "Exercício 1";
select C.Name,T.Name from Country C inner join City T ON Continent = "South America" and T.ID = C.Capital;

-- Exercício 2
select "Exercício 2";
select C.Name,L.Language from Country C inner join CountryLanguage L ON Region = "Caribbean" and L.CountryCode = C.Code;

-- Exercício 3
select "Exercício 3a";
select C.Name,C.Code,L.Language from Country C inner join CountryLanguage L ON IsOfficial = "T" and C.Code = L.CountryCode;
select "Exercício 3b";
select C.Name,C.Code,count(L.Language) as num from Country C inner join CountryLanguage L ON C.Code = L.CountryCode where L.IsOfficial like "T" group by L.CountryCode order by num DESC;

-- Exercício 4
select "Exercício 4a";
select C.Name,C.Code,count(L.Language) as num from Country C inner join CountryLanguage L ON C.Code = L.CountryCode where L.IsOfficial like "T" group by L.CountryCode having num >= 3;
select "Exercício 4b";
select C.Name,C.Code,count(L.Language) as num from Country C inner join CountryLanguage L ON C.Code = L.CountryCode where L.IsOfficial like "T" group by L.CountryCode having num >= 3 order by num DESC;
select "Exercício 4c";
select C.Name,C.Code,count(L.Language) as num from Country C inner join CountryLanguage L ON C.Code = L.CountryCode group by L.CountryCode having num >= 3 order by num DESC;

-- Exercício 5
select "Exercício 5";
select C.Name,T.Name from Country C inner join City T ON Continent = "South America" and T.ID = C.Capital;

-- Fim dos exercícios
