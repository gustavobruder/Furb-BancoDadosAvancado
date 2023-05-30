-- Furb - Banco de Dados Avançado
-- Aluno: Gustavo Baroni Bruder
-- Avaliação 3

-- a) TESTES

INSERT INTO cliente (nm_cliente, ds_email, nr_telefone) VALUES
('Cliente 6','cliente6@provedor.com.br','47444440000');

INSERT INTO cliente (nm_cliente, ds_email, nr_telefone) VALUES
('Cliente 7','cliente7@provedor.com.br','47333330000'),
('Cliente 8','cliente8@provedor.com.br','47222220000'),
('Cliente 9','cliente9@provedor.com.br','47111110000');

UPDATE cliente SET
	nm_cliente  = 'Cliente 6 Editado',
	ds_email    = 'cliente6@editado.com.br',
	nr_telefone = '47000000000'
WHERE cd_cliente = 6;

UPDATE cliente SET nm_cliente  = 'Cliente 6 Alterado'       WHERE cd_cliente = 6;
UPDATE cliente SET ds_email    = 'cliente6@alterado.com.br' WHERE cd_cliente = 6;
UPDATE cliente SET nr_telefone = '47000000001'              WHERE cd_cliente = 6;

DELETE FROM cliente WHERE cd_cliente = 6;
DELETE FROM cliente WHERE cd_cliente IN (7, 8);

-- b) TESTES

INSERT INTO reserva (DT_RESERVA, DT_ENTRADA, QT_DIARIAS, FL_SITUACAO, CD_CLIENTE, NR_QUARTO, CD_FUNCIONARIO)
VALUES ('2023-01-01', '2023-05-02', 2, 'A', 1, 101, 1);

CALL pcd_listar_disponibilidade_quartos('2023-05-01');

-- c) TESTES

CALL pcd_adicionar_hospedagem(1, 101, '2023-05-29', '2023-05-30');

-- d) TESTES

CALL pcd_adicionar_hospedagem_servico(1, 1);

-- e) TESTES

CALL pcd_hospedagem_finalizar(1);