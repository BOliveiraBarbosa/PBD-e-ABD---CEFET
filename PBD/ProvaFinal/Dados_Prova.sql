-- Inseridno dados na Tabela Departamento
select * from Departamento

insert into Departamento values (1, 'Informatica', null, '01/01/2010');
insert into Departamento values (2, 'Pesquisa', null, '06/08/2005');
insert into Departamento values (3, 'Engenharia', null, '10/08/2000');
insert into Departamento values (4, 'Recursos Humanos', null, '07/05/2015');
insert into Departamento values (5, 'Marketing', null, '05/04/2019');

-- Update nos dados da Tabela Departamento

update Departamento set matgerente = 1164 where coddep = 1;
update Departamento set matgerente = 1163 where coddep = 3;
update Departamento set matgerente = 1167 where coddep = 4;
update Departamento set matgerente = 1169 where coddep = 2;

-- Inserindo Dados na Tabela Empregado
select * from Empregado

insert into Empregado values (1163, 'claudia oliveira', '12/08/1974', 'Rua A - 1 -- RJ', 'F', 5558.00, null, 4);
insert into Empregado values (1164, 'Jorge Vila Verde', '29/01/1986', 'Rua M - 25 -- RJ', 'M', 1550.00, 1163, 1);
insert into Empregado values (1165, 'Moacir Silva', '08/11/1981', 'Rua F - 57 -- RJ', 'M', 1550.00, 1164, 1);
insert into Empregado values (1166, 'Ana Paula Sorte', '22/06/1979', 'Rua F - 23 -- RJ', 'F', 2200.00, 1163, 4);
insert into Empregado values (1167, 'Caio Silva', '15/08/1977', 'Rua l - 100 -- RJ', 'M', 3400.00, 1163,3);
insert into Empregado values (1168, 'João Souza', '20/12/1988', 'Rua M - 25 -- RJ', 'M', 2560.00, null, 5);
insert into Empregado values (1169, 'Jorge Souza', '24/12/1983', 'Rua B - 6 -- RJ', 'M', 4150.00, null, 2);

-- Inserindo Dados na Tabela Projeto
select * from Projeto

insert into Projeto values (001, 'Mineração de Dados', 'Sala 03 - Segundo Andar', 1);
insert into Projeto values (002, 'IA', 'Sala 05 - Terceiro Andar', 1);
insert into Projeto values (003, 'IOT', 'Sala 05 - Primeiro Andar', 2);
insert into Projeto values (004, 'Gerêrencia IA', 'Sala 05 - Terceiro Andar', 4);
insert into Projeto values (005, 'Estrutura', 'Sala 02 - Segundo Andar', 3)

-- Inserindo Dados na tabela Alocacao
select * from Alocacao

insert into Alocacao values (1164, 001, 21);
insert into Alocacao values (1165, 002, 40);
insert into Alocacao values (1166, 004, 15);
insert into Alocacao values (1169, 002, 23);
insert into Alocacao values (1165, 001, 17);