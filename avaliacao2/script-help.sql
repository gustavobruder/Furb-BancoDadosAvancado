-- Furb - Banco de Dados Avançado
-- Aluno: Gustavo Baroni Bruder
-- Avaliação 2

-- SCRIPTS HELP

-- tabelas enunciado
SELECT * FROM cargo;
SELECT * FROM categoria;
SELECT * FROM cliente;
SELECT * FROM funcionario;
SELECT * FROM reserva;
SELECT * FROM hospedagem;
SELECT * FROM servico;
SELECT * FROM hospedagem_servico;
SELECT * FROM quarto;

-- papeis - usuarios - privilegios
SELECT * FROM mysql.user;
SELECT * FROM mysql.roles_mapping;
SELECT * FROM information_schema.APPLICABLE_ROLES;
SELECT * FROM information_schema.ENABLED_ROLES;

SHOW GRANTS FOR 'Gerente';
SHOW GRANTS FOR 'Recepcionista';
SHOW GRANTS FOR 'Atendente Geral';

SHOW GRANTS FOR 'usr_gerente_1';
SHOW GRANTS FOR 'usr_recepcionista_1';
SHOW GRANTS FOR 'usr_atendente_geral_1';

FLUSH PRIVILEGES;

DROP ROLE IF EXISTS 'Gerente';
DROP ROLE IF EXISTS 'Recepcionista';
DROP ROLE IF EXISTS 'Atendente Geral';

DROP USER IF EXISTS 'usr_gerente_1';
DROP USER IF EXISTS 'usr_recepcionista_1';
DROP USER IF EXISTS 'usr_atendente_geral_1';