-- Consultas do Banco de Dados
-- a) Liste o nome, endereço e nascimento de todos os empregados de maneira ordenada.

select nome, endereco, datanasc
from Empregado
order by nome

-- b) Obtenha a data de nascimento e endereço do empregado João Souza.

select datanasc, endereco
from Empregado
where nome = 'João Souza'

-- c) Selecione todos os atributos do departamento de Pesquisa.

select *
from Departamento
where nome = 'Pesquisa'

-- d) Mostre os nomes dos empregados que estejam em projetos de Mineração de Dados.

select e.nome
from Empregado e, Projeto p, Alocacao a 
where a.codigop = p.codproj
and e.matricula = a.matric
and p.nome = 'Mineração de Dados'

-- e) Mostre a quantidade de empregados para cada projeto.

select p.nome, count(a.matric) as count
from Projeto p, alocacao a
where p.codproj = a.codigop
group by p.nome

-- f) Mostre o nome do empregado que tem o menor salário.

select nome
from Empregado
where salario in (select min(salario) from Empregado)

-- g) Mostre a média dos salários dos empregados por sexo, que sejam maiores de 60 anos e cuja média seja menor que R$2000,00. 

with curr_date as (
	select to_date('1961-10-30', 'yyy-mm-dd') as c_d
)

select sexo, avg(salario)
from Empregado
where extract(year from datanasc) <= (select extract(year from c_d) from curr_date)
group by sexo
having avg(salario) < 2000

-- h) Liste os nomes de departamentos que não possuem gerentes.

select nome
from Departamento
where matgerente is null

-- i) Liste os nomes dos empregados que possuam o sobrenome Silva e que estão alocados em algum projeto. (Utilize subconsulta)

select nome
from Empregado as e
where exists (select matric from Alocacao as a where e.matricula = a.matric and e.nome like '%Silva%')
			  
select nome
from Empregado e, Alocacao a
where e.matricula = a.matric and nome like '%Silva%'

-- j) Obter a lista do nome de todos os projetos que envolvem algum empregado cujo sobrenome é Souza como trabalhador ou como gerente do departamento que controla o projeto.

select p.nome
from Projeto p, Empregado e, Alocacao a
where a.codigop = p.codproj
and a.matric = e.matricula and e.nome like '%Souza%'
union
select p.nome
from Empregado e, Departamento d, Projeto p
where p.depto = d.coddep
and d.matgerente = e.matricula and e.nome like '%Souza%'

-- k) Sugira alguns dados e insira uma tupla para cada tabela. (Considere a ordem em que isto deve acontecer no banco de dados)

insert into Departamento values (6, 'Limpeza', null, '20/03/2002');
insert into Empregado values (1171, 'Maria João', '03/12/1986', 'Rua A - 33 -- RJ', 'F', 2000.00, null, 6);
update Departamento set matgerente = 1171 where coddep = 6;
insert into Projeto values (006, 'Limpeza Salas', 'Segundo Andar', 6);
insert into Alocacao values (1171, 006, 52);

-- l) Faça uma atualização de 10% nos salários dos empregados maiores de 60 anos.

with curr_date as (
	select to_date('1961-10-30', 'yyy-mm-dd') as c_d
)

update Empregado set salario = salario * 1.10
where extract(year from datanasc) <= (select extract(year from c_d) from curr_date)

-- m) Exclua os empregados que não estão alocados em projetos. 

delete from Empregado
where matricula not in (select matric from Alocacao)
