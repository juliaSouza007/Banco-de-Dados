-- JULIA MARTINS SOUZA --
-- COLTEC - Banco de Dados --
-- ATIVIDADES SEMANA 5 --

USE world;
-- Exercício 1
select "Exercício 1";
select Code,Name from Country order by Code ASC limit 10;

-- Exercício 2
select "Exercício 2";
select Code,Name from Country order by Code DESC limit 10;

-- Exercício 3
select "Exercício 3";
select Code,Name from Country where Name like 'United%';

-- Exercício 4
select "Exercício 4";
select count(Name) from Country;

-- Exercício 5
select "Exercício 5";
select CountryCode,Language from CountryLanguage order by CountryCode ASC limit 10;

-- Exercício 6
select "Exercício 6";
select CountryCode,Language from CountryLanguage order by CountryCode ASC limit 20;

-- Exercício 7
select "Exercício 7";
select CountryCode,Language from CountryLanguage where IsOfficial like 'T%' order by CountryCode ASC limit 20;

-- Exercício 8
select "Exercício 8";
select CountryCode,count(Language) as num from CountryLanguage where IsOfficial like 'T%' group by CountryCode having num>=2;

-- Exercício 9
select "Exercício 9";
select Region from Country;

-- Exercício 10
select "Exercício 10";
select Code,Name,LifeExpectancy from Country where Region like 'Nordic%' group by Code;

-- Exercício 11
select "Exercício 11";
select Name,SurfaceArea from Country order by SurfaceArea DESC limit 10;

-- Exercício 12
select "Exercício 12";
select Code,SurfaceArea from Country order by SurfaceArea ASC limit 5;

-- Exercício 13
select "Exercício 13";
select Name,Code,SurfaceArea from Country where Region like '%Europe' order by SurfaceArea ASC limit 5;

-- Exercício 14
select "Exercício 14";
select Code,Population from Country order by Population DESC limit 5;

-- Exercício 15
select "Exercício 15";
select Name,SurfaceArea from Country where Name in ('Germany','France','England','Portugal','Spain','Italy') order by SurfaceArea;

-- Exercício 16
select "Exercício 16";
-- Tentativa com erro: select count(*) from Country where Continent like ('Asia%','%America','%Europe','%Oceania','%Africa');

-- Exercício 17
select "Exercício 17";
select count(*) from City;

-- Exercício 18
select "Exercício 18";
select Name,Population from City where CountryCode like 'bra%';

-- Exercício 19
select "Exercício 19";
select count(*) from City where CountryCode like 'bra%';

-- Exercício 20
select "Exercício 20";
-- Não sei como resolver esse exercício

-- Fim dos exercícios
