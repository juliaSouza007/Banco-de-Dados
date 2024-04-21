--  JULIA MARTINS
--  COLTEC - Bandco de Dados
--  ATIVIDADES SEMANA 3--

-- aqui defino o banco que estou usando
use Prova1A;

--  1. 
select "Tarefa 1";
describe descontos;
select * from descontos;
select * from empregados;
select * from pagamentos;
select codigo_empregado, valor from pagamentos;
select codigo_empregado, valor from pagamentos;

--  2. 
select "Tarefa 2";
select codigo_empregado AS codigo, valor from pagamentos;
select codigo_empregado as codigo, valor as 'valor em reais' from pagamentos;

--  3. 
select "Tarefa 3";
select count(nome) from empregados;
select sum(valor) from pagamentos;

--  4. 
select "Tarefa 4";
select * from pagamentos where valor>400;
select codigo_empregado as codigo, valor from pagamentos where valor>400;
select sum(valor) from pagamentos where codigo_empregado=1;
select codigo_empregado as codigo, valor from descontos where valor>=30;
