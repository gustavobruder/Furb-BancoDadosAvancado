# Enunciado Avaliação 3

Construção de gatilhos/rotinas para:

## Questões

a) Manter um log com todas as operações DML (insert, update e delete) realizadas na tabela cliente. Dica, criar uma tabela e registrar os eventos (logs) com: data, hora, operação realizada e usuário. Utilize o usuário logado na seção (função user()) para saber o usuário que executou a operação. Importante: nos casos que envolve alterações (update), registrar no logo o valor antigo e o novo valor (alterado);

b) Criar uma rotina que sinalize (liste) a disponibilidade de quarto(s), ou seja sem reserva, considerando uma determinada data passada com parâmetro;

c) Criar uma rotina para adicionar uma hospedagem passando como parâmetros: cliente (o seu cadastro, ou seja, seu id/nome), quarto, data de entrada e data prevista de saída. Utilizar cd_funcionario (1) visto que não teremos controle de autenticação, e fl_situacao ('O') para ocupado.  Atenção para a validação da reserva do cliente, pois a hospedagem só deve acontecer se houver reserva prévia;

d) Criar uma rotina para adicionar um serviço a uma determinada hospedagem. Considerar os seguintes parâmetros: identificação da hospedagem e serviço. Atenção para a data de solicitação que deve ser a atual e o número de sequência (que deve seguir incremental apenas dentro do número da hospedagem, ou seja, este número é zerado para cada nova hospedagem);

e) Criar uma rotina para mudar o status (coluna fl_situacao) para 'F' - finalizada. Esta rotina deverá receber como parâmetro o identificador da hospedagem.