-- Furb - Banco de Dados Avançado
-- Aluno: Gustavo Baroni Bruder
-- Avaliação 3

-- a)

CREATE TABLE IF NOT EXISTS log_operacoes_cliente (
	id_log      INTEGER AUTO_INCREMENT NOT NULL,
	dt_operacao DATE                   NOT NULL,
	hr_operacao TIME                   NOT NULL,
	ds_operacao VARCHAR(10)            NOT NULL,
	nm_usuario  VARCHAR(50)            NOT NULL,
	cd_cliente  INT                    NOT NULL,
	vl_antigo   VARCHAR(200),
	vl_novo     VARCHAR(200),
	CONSTRAINT log_operacoes_cliente_pk PRIMARY KEY (ID_LOG)
);

DELIMITER $$
CREATE OR REPLACE TRIGGER trg_log_insert_cliente AFTER INSERT ON db_avaliacao3.cliente
FOR EACH ROW
BEGIN
	INSERT INTO log_operacoes_cliente (dt_operacao, hr_operacao, ds_operacao, nm_usuario, cd_cliente, vl_antigo, vl_novo)
	VALUES (CURDATE(), CURTIME(), 'INSERT', USER(), NEW.cd_cliente,
		NULL,
		CONCAT('{', 'nm_cliente: ', NEW.nm_cliente, ', ds_email: ', NEW.ds_email, ', nr_telefone: ', NEW.nr_telefone, '}'));
END $$

DELIMITER $$
CREATE OR REPLACE TRIGGER trg_log_update_cliente AFTER UPDATE ON db_avaliacao3.cliente
FOR EACH ROW
BEGIN
	INSERT INTO log_operacoes_cliente (dt_operacao, hr_operacao, ds_operacao, nm_usuario, cd_cliente, vl_antigo, vl_novo)
	VALUES (CURDATE(), CURTIME(), 'UPDATE', USER(), NEW.cd_cliente,
		CONCAT('{', 'nm_cliente: ', OLD.nm_cliente, ', ds_email: ', OLD.ds_email, ', nr_telefone: ', OLD.nr_telefone, '}'),
		CONCAT('{', 'nm_cliente: ', NEW.nm_cliente, ', ds_email: ', NEW.ds_email, ', nr_telefone: ', NEW.nr_telefone, '}'));
END $$

DELIMITER $$
CREATE OR REPLACE TRIGGER trg_log_delete_cliente AFTER DELETE ON db_avaliacao3.cliente
FOR EACH ROW
BEGIN
	INSERT INTO log_operacoes_cliente (dt_operacao, hr_operacao, ds_operacao, nm_usuario, cd_cliente, vl_antigo, vl_novo)
	VALUES (CURDATE(), CURTIME(), 'DELETE', USER(), OLD.cd_cliente,
		CONCAT('{', 'nm_cliente: ', OLD.nm_cliente, ', ds_email: ', OLD.ds_email, ', nr_telefone: ', OLD.nr_telefone, '}'),
		NULL);
END $$

-- b)

DELIMITER $$
CREATE OR REPLACE PROCEDURE pcd_listar_disponibilidade_quartos (IN dt_disponibilidade DATE)
BEGIN
	SELECT
		q.nr_quarto
	FROM quarto AS q
	LEFT JOIN reserva AS r ON q.nr_quarto = r.nr_quarto
	WHERE r.nr_quarto IS NULL
		OR dt_disponibilidade NOT BETWEEN r.dt_entrada AND ADDDATE(r.dt_entrada, r.qt_diarias - 1)
	ORDER BY q.nr_quarto ASC;
END $$

CALL pcd_listar_disponibilidade_quartos('2023-05-01');

-- c)

DELIMITER $$
CREATE OR REPLACE PROCEDURE pcd_adicionar_hospedagem (IN cd_cliente INT, IN nr_quarto INT, IN dt_entrada DATE, IN dt_saida DATE)
BEGIN
	DECLARE qtd_reservas INT;

	SELECT COUNT(*) INTO qtd_reservas
	FROM reserva AS r
	WHERE r.cd_cliente = cd_cliente
		AND r.nr_quarto = nr_quarto
		AND r.dt_entrada = dt_entrada
		AND ADDDATE(r.dt_entrada, r.qt_diarias - 1) >= dt_saida;

	IF qtd_reservas > 0 THEN
		INSERT INTO hospedagem (dt_entrada, dt_saida, fl_situacao, cd_cliente, cd_funcionario, nr_quarto)
		VALUES (dt_entrada, dt_saida, 'O', cd_cliente, 1, nr_quarto);
	END IF;
END $$

CALL pcd_adicionar_hospedagem(1, 101, '2023-05-30', '2023-05-31');

-- d)

DELIMITER $$
CREATE OR REPLACE PROCEDURE pcd_adicionar_hospedagem_servico (IN cd_hospedagem INT, IN cd_servico INT)
BEGIN
	DECLARE nr_sequencia INT;

	SELECT COALESCE(MAX(hs.nr_sequencia), 0) INTO nr_sequencia
	FROM hospedagem_servico AS hs
	WHERE hs.cd_hospedagem = cd_hospedagem;

	INSERT INTO hospedagem_servico (cd_hospedagem, cd_servico, nr_sequencia, dt_solicitacao)
	VALUES (cd_hospedagem, cd_servico, nr_sequencia + 1, CURDATE());
END $$

CALL pcd_adicionar_hospedagem_servico(1, 1);

-- e)

DELIMITER $$
CREATE OR REPLACE PROCEDURE pcd_finalizar_hospedagem (IN cd_hospedagem INT)
BEGIN
	UPDATE hospedagem AS h
	SET h.fl_situacao = 'F'
	WHERE h.cd_hospedagem = cd_hospedagem;
END $$

CALL pcd_finalizar_hospedagem(1);