-- Criando Tabela Empregado
create table Empregado
(matricula integer primary key not null,
 nome varchar(20) not null,
 datanasc date not null,
 endereco varchar(200) not null,
 sexo char(1) not null,
 salario real not null,
 supervisor integer null,
 depto integer not null
)

-- Criando Tabela Departamento
create table Departamento
(coddep integer primary key not null,
 nome varchar(20) not null,
 matgerente integer null,
 datainicio date not null
)

-- Criando Tabela Projeto
create table Projeto
(codproj integer primary key not null,
 nome varchar(20) not null,
 local varchar(200) not null,
 depto integer not null
)

-- Criando Tabela Alocacao
create table Alocacao
(matric integer not null,
 codigop integer not null,
 horas real null,
 primary key (matric, codigop)
)

-- Alteração para inserir Chaves Estrangeiras
-- Inserindo Chave Estrangeira na Tabela Empregado
alter table Empregado
add foreign key(depto) references Departamento(coddep);

alter table Empregado
add foreign key(supervisor) references Empregado(matricula);

-- Inserindo Chave Estrangeira na Tabela Departamento
alter table Departamento
add foreign key(matgerente) references Empregado(matricula);

-- Inserindo Chave Estrangeira na Tabela Projeto
alter table Projeto
add foreign key(depto) references Departamento(coddep);

-- Inserindo Chave Estrangeira na Tabela Alocacao
alter table Alocacao
add foreign key(matric) references Empregado(matricula);

alter table Alocacao
add foreign key(codigop) references Projeto(codproj);
