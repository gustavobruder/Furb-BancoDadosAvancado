-- Furb - Banco de Dados Avançado
-- Aluno: Gustavo Baroni Bruder
-- Avaliação 3

-- INSERÇÃO DE DADOS NAS ESTRUTURAS

INSERT INTO cargo (ds_cargo) VALUES ('Gerente');

INSERT INTO cargo (ds_cargo) VALUES ('Recepcionista');
INSERT INTO cargo (ds_cargo) VALUES ('Atendente Geral');
INSERT INTO cargo (ds_cargo) VALUES ('Estagiário');

INSERT INTO funcionario (cd_cargo, nm_funcionario)
VALUES (1,'João Gerente Fonseca');
INSERT INTO funcionario (cd_cargo, nm_funcionario)
VALUES (2,'Maria Recepcionista da Silva');
INSERT INTO funcionario (cd_cargo, nm_funcionario)
VALUES (3,'Carlos Atendente Geral Costa');
INSERT INTO funcionario (cd_cargo, nm_funcionario)
VALUES (4,'Luiza Estagiária Souza');

INSERT INTO servico (ds_servico) VALUES ('Restaurante');
INSERT INTO servico (ds_servico) VALUES ('Bar');
INSERT INTO servico (ds_servico) VALUES ('Lavanderia');
INSERT INTO servico (ds_servico) VALUES ('Translado');
INSERT INTO servico (ds_servico) VALUES ('Lan house');

INSERT INTO categoria (ds_categoria) VALUES ('Standart Solteiro');
INSERT INTO categoria (ds_categoria) VALUES ('Standart Casal');
INSERT INTO categoria (ds_categoria) VALUES ('Master Solteiro');
INSERT INTO categoria (ds_categoria) VALUES ('Master Casal');
INSERT INTO categoria (ds_categoria) VALUES ('Deluxe Casal');

INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)

VALUES (101,1,'Corredor amarelo, face norte',1);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (103,1,'Corredor amarelo, face norte',1);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (105,1,'Corredor amarelo, face norte',1);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (102,2,'Corredor verde, face sul',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (104,2,'Corredor verde, face sul',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (106,2,'Corredor verde, face sul',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (201,3,'Corredor amarelo, face norte',1);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (203,3,'Corredor amarelo, face norte',1);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (205,3,'Corredor amarelo, face norte',1);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (202,4,'Corredor verde, face sul',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (204,4,'Corredor verde, face sul',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (206,4,'Corredor verde, face sul',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (301,5,'Corredor amarelo, face norte',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (303,5,'Corredor amarelo, face norte',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (302,5,'Corredor verde, face sul',2);
INSERT INTO quarto (nr_quarto, cd_categoria, ds_quarto, nr_ocupantes)
VALUES (304,5,'Corredor verde, face sul',2);


INSERT INTO cliente (nm_cliente, ds_email, nr_telefone)
VALUES ('Cliente 1','cliente1@provedor.com.br','47999990000');
INSERT INTO cliente (nm_cliente, ds_email, nr_telefone)
VALUES ('Cliente 2','cliente2@provedor.com.br','47888880000');
INSERT INTO cliente (nm_cliente, ds_email, nr_telefone)
VALUES ('Cliente 3','cliente3@provedor.com.br','47777770000');
INSERT INTO cliente (nm_cliente, ds_email, nr_telefone)
VALUES ('Cliente 4','cliente4@provedor.com.br','47666660000');
INSERT INTO cliente (nm_cliente, ds_email, nr_telefone)
VALUES ('Cliente 5','cliente5@provedor.com.br','47555550000');