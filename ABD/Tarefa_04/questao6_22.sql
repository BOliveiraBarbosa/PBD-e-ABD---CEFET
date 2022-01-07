-- Criando Tabela T1
create table T1
(P integer not null,
 Q char(1) not null,
 R integer not null
)

-- Criando Tabela T2
create table T2
(A integer not null,
 B char(1) not null,
 C integer not null
)

-- Inserindo dados na Tabela T1
select * from T1

insert into T1 values (10, 'a', 5);
insert into T1 values (15, 'b', 8);
insert into T1 values (25, 'a', 6);

-- Inserindo dados na Tabela T2
select * from T2

insert into T2 values (10, 'b', 6);
insert into T2 values (25, 'c', 3);
insert into T2 values (10, 'b', 5);

-- Resultados Operações

-- A
select *
from T1 INNER JOIN T2
on T1.P = T2.A

-- B
select *
from T1 INNER JOIN T2
on T1.Q = T2.B

-- C
select *
from T1 LEFT OUTER JOIN T2
on T1.P = T2.A

-- D
select *
from T1 RIGHT OUTER JOIN T2
on T1.Q = T2.B

-- E
select * from T1
UNION
select * from T2

-- F
select *
from T1 INNER JOIN T2
on T1.P = T2.A and T1.R = T2.C
