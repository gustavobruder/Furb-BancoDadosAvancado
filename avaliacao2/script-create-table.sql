-- Furb - Banco de Dados Avançado
-- Aluno: Gustavo Baroni Bruder
-- Avaliação 2

-- CREATE TABLE SCRIPTS

CREATE TABLE cargo (
	CD_CARGO integer,
	DS_CARGO varchar(50),
	PRIMARY KEY (CD_CARGO)
);

CREATE TABLE categoria (
	CD_CATEGORIA integer,
	DS_CATEGORIA varchar(50),
	PRIMARY KEY (CD_CATEGORIA)
);

CREATE TABLE cliente (
	CD_CLIENTE  integer,
	NM_CLIENTE  varchar(50),
	DS_EMAIL    varchar(50),
	NR_TELEFONE varchar(15),
	PRIMARY KEY (CD_CLIENTE)
);

CREATE TABLE funcionario (
	CD_FUNCIONARIO integer,
	CD_CARGO       integer,
	NM_FUNCIONARIO varchar(50) ,
	PRIMARY KEY (CD_FUNCIONARIO),
	FOREIGN KEY (CD_CARGO) REFERENCES cargo (CD_CARGO)
);

CREATE TABLE reserva (
	NR_RESERVA     integer AUTO_INCREMENT,
	DT_RESERVA     date,
	DT_ENTRADA     date,
	QT_DIARIAS     integer,
	FL_SITUACAO    char(1),
	CD_CLIENTE     integer,
	NR_QUARTO      integer,
	CD_FUNCIONARIO integer,
	PRIMARY KEY (NR_RESERVA)
);

CREATE TABLE hospedagem (
	CD_HOSPEDAGEM  integer AUTO_INCREMENT,
	DT_ENTRADA     date,
	DT_SAIDA       date,
	FL_SITUACAO    char(1),
	CD_CLIENTE     integer,
	CD_FUNCIONARIO integer,
	NR_QUARTO      integer,
	PRIMARY KEY (CD_HOSPEDAGEM)
);

CREATE TABLE servico (
	CD_SERVICO integer,
	DS_SERVICO varchar(50),
	PRIMARY KEY (CD_SERVICO)
);

CREATE TABLE hospedagem_servico (
	CD_HOSPEDAGEM  integer,
	CD_SERVICO     integer,
	NR_SEQUENCIA   integer,
	DT_SOLICITACAO date,
	PRIMARY KEY (CD_HOSPEDAGEM, CD_SERVICO, NR_SEQUENCIA),
	FOREIGN KEY (CD_HOSPEDAGEM) REFERENCES hospedagem (CD_HOSPEDAGEM),
	FOREIGN KEY (CD_SERVICO)    REFERENCES servico    (CD_SERVICO)
);

CREATE TABLE quarto (
	NR_QUARTO    integer,
	CD_CATEGORIA integer,
	DS_QUARTO    varchar(50),
	NR_OCUPANTES integer,
	PRIMARY KEY (NR_QUARTO),
	FOREIGN KEY (CD_CATEGORIA) REFERENCES categoria (CD_CATEGORIA)
);