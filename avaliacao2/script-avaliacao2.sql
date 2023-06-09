-- Furb - Banco de Dados Avançado
-- Aluno: Gustavo Baroni Bruder
-- Avaliação 2

-- 1) OK

CREATE OR REPLACE ROLE 'Gerente';
CREATE OR REPLACE ROLE 'Recepcionista';
CREATE OR REPLACE ROLE 'Atendente Geral';

-- 2) OK

-- Gerente
GRANT SELECT, INSERT, UPDATE, DELETE ON db_avaliacao2.* TO 'Gerente' WITH GRANT OPTION;

-- Recepcionista
GRANT SELECT, INSERT, UPDATE, DELETE ON db_avaliacao2.cliente    TO 'Recepcionista';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_avaliacao2.reserva    TO 'Recepcionista';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_avaliacao2.hospedagem TO 'Recepcionista';

-- Atendente Geral
CREATE OR REPLACE VIEW db_avaliacao2.view_cliente_hospedagem AS
SELECT
	c.NM_CLIENTE,
	h.NR_QUARTO
FROM db_avaliacao2.hospedagem    AS h
INNER JOIN db_avaliacao2.cliente AS c ON h.CD_CLIENTE = c.CD_CLIENTE;

GRANT SELECT ON db_avaliacao2.view_cliente_hospedagem            TO 'Atendente Geral';
GRANT SELECT, INSERT, UPDATE ON db_avaliacao2.hospedagem_servico TO 'Atendente Geral';

-- 3) OK

CREATE OR REPLACE USER 'usr_gerente_1' IDENTIFIED BY 'pwd_gerente_1';
GRANT 'Gerente' TO 'usr_gerente_1';
SET DEFAULT role "Gerente" FOR 'usr_gerente_1';

CREATE OR REPLACE USER 'usr_recepcionista_1' IDENTIFIED BY 'pwd_recepcionista_1';
GRANT 'Recepcionista' TO 'usr_recepcionista_1';
SET DEFAULT role "Recepcionista" FOR 'usr_recepcionista_1';

CREATE OR REPLACE USER 'usr_atendente_geral_1' IDENTIFIED BY 'pwd_atendente_geral_1';
GRANT 'Atendente Geral' TO 'usr_atendente_geral_1';
SET DEFAULT role "Atendente Geral" FOR 'usr_atendente_geral_1';