-- Criando Tabela VENDEDOR

create table VENDEDOR
(cpf bigint primary key not null,
 Nome varchar(20) not null,
 Ano_inicio date not null,
 Numero_departamento integer not null
)

-- Criando Tabela VIAGEM

create table VIAGEM
(cpf bigint not null,
 Cidade_Origem varchar(20) not null,
 Cidade_Destino varchar(20) not null,
 Data_partida date not null,
 Data_retorno date not null,
 Cod_viagem integer primary key not null
)

-- Criando Tabela DESPESA

create table DESPESA
(Cod_viagem integer not null,
 Num_conta integer primary key not null,
 valor real not null
)

-- Alteração para inserir Chaves Estrangeiras
-- Inserindo Chave Estrangeira na Tabela DESPESA

alter table DESPESA
add foreign key(Cod_viagem) references VIAGEM(Cod_viagem);

-- Inserindo Dados na Tabela VENDEDOR
select * from VENDEDOR

insert into VENDEDOR values (23456789011, 'João', '01/01/2000', 5);
insert into VENDEDOR values (12345678910, 'Maria', '01/01/1994', 2);
insert into VENDEDOR values (14541493705, 'Bruno', '01/01/2001', 2);

-- Inserindo Dados na Tabela VIAGEM
select * from VIAGEM

insert into VIAGEM values (23456789011, 'Rio de Janeiro', 'Pernambuco', '02/03/2020', '03/04/2020', 1);
insert into VIAGEM values (12345678910, 'Rio de Janeiro', 'Pernambuco', '02/03/2020', '03/04/2020', 2);
insert into VIAGEM values (14541493705, 'São Paulo', 'Rio de Janeiro', '06/11/2020', '08/11/2020', 3);
insert into VIAGEM values (23456789011, 'Pernambuco', 'Rio de Janeiro', '03/04/2020', '10/04/2020', 4);

-- Inserindo Dados na Tabela DESPESA
select * from DESPESA

insert into DESPESA values (2, 1, 2500);
insert into DESPESA values (1, 2, 2500);
insert into DESPESA values (3, 3, 1500);
insert into DESPESA values (4, 4, 1500);

-- Consultas do Banco de Dados
-- A) Dê os detalhes (todos os atributos da relação viagem) para as viagens que excederam R$ 2.000 nas despesas.

select v.*
from VIAGEM v, DESPESA d
WHERE v.Cod_viagem = d.Cod_viagem
and d.valor > 2000

-- B) Imprima o CPF dos vendedores que realizaram viagens para Pernambuco
select cpf
from VIAGEM
WHERE Cidade_destino = 'Pernambuco'

-- C)Imprima o total de despesas de viagem contraídas pelo vendedor com CPF = ‘23456789011’

select sum(valor)
from DESPESA D, VIAGEM V
where v.Cod_viagem = d.Cod_viagem
and v.cpf = 23456789011