# Enunciado Avaliação 1

Considerando o modelo para a base de dados apresentada, elabore sentenças SQL para atender as requisições a seguir. Lembre-se de utilizar os recursos de otimização, em especial a criação de índices, para as estruturas que julgar necessário.

## Questões

a) Total de localidades por Unidade da Federação (UF);

b) Qual é a UF que apresenta o maior número de municípios (fl_tipo_localidade= 'M'). Considerar que pode haver UFs com o mesmo número máximo de municípios;

c) Qual o número de CEPs encontrados em cada município (fl_tipo_localidade= 'M'), com respectiva UF, ordenados pelo maior número (de CEPs listados). Considerar apenas os municípios que possuem mais de um CEP (tabela logradouro);

d) Qual o nome do logradouro mais popular no Brasil, ou seja, o que é encontrado no maior número de localidades. Atenção, aqui poderá haver mais de um logradouro, haja vista que podem apresentar o mesmo número de ocorrências e, neste caso, todos os empatados na 1a. posição (maior número) devem ser exibidos;

e) Qual a localidade (nome) que apresenta o maior número de CEPs especiais (grandes usuários). Listar também a UF e a localidade;

f) Quais municípios possuem distrito (fl_tipo_localidade= 'D'). Listar também o número de distritos de cada município listado, ordenando pelo maior número encontrado;

g) Listar o nome do, ou dos bairros mais populares (que mais são encontrados) na UF "SC", caso tenhamos empate no número máximo listado;

h) Qual o número de CEPs dos bairros dos municípios da UF "SC" que apresentam mais de um CEP (tabela logradouro). Listar o nome do bairro, também. Ordenar pelo maior número de CEPs;

i) Qual o nome de logradouro mais popular encontrado nos municípios da UF "SC". Listar também o número de vezes encontrado;

j) Quais nomes de municípios são encontrados em mais de uma UF. Listar também a quantidade de vezes em que o mesmo é encontrado;

k) Listar o nome de todos os bairros do município de "Blumenau", UF "SC", com a respectiva quantidade de CEPs associados a cada bairro listado;

l) Listar o nome dos logradouros que iniciam em um bairro e terminam em outro (ver colunas cd_bairro_inicio e cd_bairro_fim) da UF "SC". Listar também o nome dos respectivos bairros (início e fim);

m) Listar o nome do(s) bairro(s) que apresenta(m) o maior número de logradouros associado. Listar também o nome da localidade e a sigla da UF onde se encontra este(s) bairro(s);

o) Criar uma view para listar o nome do município e a respectiva quantidade de bairros associado ao mesmo. Listar também a sigla da UF;

p) Criar uma view para listar a sigla da UF com a respectiva quantidade de  municípios que apresentam mais de um CEP;

q) Criar uma view com todos os CEPS existentes na base de dados (localidades, logradouros e grandes usuários). Além do número do CEP, em havendo dados complementares (logradouro, bairro, localidade, uf) estes deverão presentes também. Aos CEPS que não apresentarem dados complementares, recomenda-se deixar em branco estes atributos nas linhas (registros).