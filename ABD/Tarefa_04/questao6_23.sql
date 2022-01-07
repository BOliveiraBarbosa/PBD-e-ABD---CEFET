-- Criando Tabela CARRO
create table CARRO
(Numero_chassi bigint primary key not null,
 Modelo char(1) not null,
 Fabricante integer not null,
 Preco real not null
)

-- Criando Tabela OPCAO
create table OPCAO
(Numero_chassi bigint not null,
 Nome_opcional char(20) primary key not null,
 Preco real not null
)

-- Criando Tabela VENDA
create table VENDA
(Cod_vendedor integer not null,
 Numero_chassi bigint not null,
 Data date not null,
 Preco_venda real not null
)

-- Criando Tabela VENDEDOR
create table VENDEDOR
(Cod_vendedor integer primary key not null,
 Nome char(20) not null,
 Telefone bigint not null
)

-- Alteração para inserir Chaves Estrangeiras
-- Inserindo Chave Estrangeira na Tabela OPCAo

alter table OPCAO
add foreign key(Numero_chassi) references CARRO(Numero_chassi);

-- Inserindo Chave Estrangeira na Tabela VENDA

alter table VENDA
add foreign key(Cod_vendedor) references VENDEDOR(Cod_vendedor);
add foreign key(Numero_chassi) references CARRO(Numero_chassi);

-- Inserindo Dados na Tabela VENDEDOR
select * from CARRO

insert into CARRO values (123, 'A', 1, 25000);
insert into CARRO values (456, 'A', 1, 30000);
insert into CARRO values (789, 'B', 2, 50000);

-- Inserindo Dados na Tabela OPCAO
select * from OPCAO

insert into OPCAO values (123, 'Item1', 1000);
insert into OPCAO values (123, 'Item2', 3500);

-- Inserindo Dados na Tabela VENDEDOR
select * from VENDEDOR

insert into VENDEDOR values (1, 'Jane Dolores', 967819231);
insert into VENDEDOR values (2, 'Bruno Barbosa', 967819231);

-- Inserindo Dados na Tabela VENDA
select * from VENDA

insert into VENDA values (1, 123, '06/11/2000', 24000);
insert into VENDA values (1, 456, '06/11/2000', 31000);
insert into VENDA values (2, 789, '06/11/2000', 40000);

-- Consultas do Banco de Dados

-- A) Para a vendedora chamada ‘Jane Dolores’, liste as seguintes informações para todos os carros que ela vendeu: Num_chassi, Fabricante, Preco_venda.

select v.Numero_Chassi, c.Fabricante, v.Preco_venda
from VENDEDOR p, VENDA v, CARRO c
where p.nome = 'Jane Dolores'
and V.Cod_vendedor = p.Cod_Vendedor
and c.Numero_chassi = v.Numero_chassi

-- B) Liste o Num_chassi e Modelo dos carros que não possuem opcionais.

select c.Numero_chassi, c.Modelo
from CARRO c, OPCAO o
where c.Numero_chassi - c.Numero_chassi = o.Numero_chassi

-- C) Considere a operação JUNÇÃO NATURAL entre VENDEDOR e VENDA. Qual é o significado de uma junção externa esquerda para essas tabelas (não mude a ordem das relações)? Explique com um exemplo.

select *
from VENDEDOR LEFT OUTER JOIN VENDA
on VENDEDOR.Cod_vendedor = Venda.Cod_vendedor




