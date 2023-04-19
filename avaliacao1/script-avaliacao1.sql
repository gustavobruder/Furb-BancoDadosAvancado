-- Furb - Banco de Dados Avançado
-- Aluno: Gustavo Baroni Bruder
-- Avaliação 1

-- a) OK

SELECT
	sg_uf    AS uf,
	COUNT(*) AS qtd_localidades
FROM localidade
GROUP BY sg_uf

-- b) OK

WITH qry AS
(
	SELECT
		sg_uf    AS uf,
		COUNT(*) AS qtd_municipios
	FROM localidade
	WHERE fl_tipo_localidade = "M"
	GROUP BY sg_uf
)

SELECT * FROM qry
WHERE qry.qtd_municipios = (SELECT MAX(qry.qtd_municipios) FROM qry)

-- c) OK

SELECT
	lc.cd_localidade AS codigo_municipio,
	lc.nm_localidade AS nome_municipio,
	lc.sg_uf         AS uf,
	COUNT(*)         AS qtd_ceps
FROM localidade       AS lc
INNER JOIN logradouro AS lg ON lc.cd_localidade = lg.cd_localidade
WHERE lc.fl_tipo_localidade = "M"
GROUP BY lc.cd_localidade
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC

-- d) OK

WITH qry AS
(
	SELECT
		lg.nm_logradouro                 AS nome_logradouro,
		COUNT(DISTINCT lc.cd_localidade) AS qtd_localidades
	FROM logradouro       AS lg
	INNER JOIN localidade AS lc ON lg.cd_localidade = lc.cd_localidade
	GROUP BY lg.nm_logradouro
)

SELECT * FROM qry
WHERE qry.qtd_localidades = (SELECT MAX(qry.qtd_localidades) FROM qry)

-- e) OK

WITH qry AS
(
	SELECT
		lc.nm_localidade AS nome_localidade,
		lc.sg_uf         AS uf,
		COUNT(*)         AS qtd_ceps_especiais
	FROM localidade           AS lc
	INNER JOIN grande_usuario AS gu ON lc.cd_localidade = gu.cd_localidade
	GROUP BY lc.cd_localidade
)

SELECT * FROM qry
WHERE qry.qtd_ceps_especiais = (SELECT MAX(qry.qtd_ceps_especiais) FROM qry)

-- f) OK

SELECT
	municipio.cd_localidade AS codigo_municipio,
	municipio.nm_localidade AS nome_municipio,
	COUNT(*)                AS qtd_distritos
FROM localidade       AS municipio
INNER JOIN localidade AS distrito ON municipio.cd_localidade = distrito.cd_localidade_sub
WHERE municipio.fl_tipo_localidade = "M" AND distrito.fl_tipo_localidade = "D"
GROUP BY municipio.cd_localidade
ORDER BY COUNT(*) DESC

-- g) OK

WITH qry AS
(
	SELECT
		nm_bairro        AS nome_bairro,
		COUNT(nm_bairro) AS qtd
	FROM bairro
	WHERE sg_uf = "SC"
	GROUP BY nm_bairro
)

SELECT * FROM qry
WHERE qry.qtd = (SELECT MAX(qry.qtd) FROM qry)

-- h) OK

SELECT
	ba.nm_bairro              AS nome_bairro,
	COUNT(DISTINCT lg.nr_cep) AS qtd_ceps
FROM localidade       AS lc
INNER JOIN logradouro AS lg ON lc.cd_localidade = lg.cd_localidade
INNER JOIN bairro     AS ba ON lg.cd_bairro_inicio = ba.cd_bairro
WHERE lc.fl_tipo_localidade = "M" AND lc.sg_uf = "SC"
GROUP BY ba.nm_bairro
HAVING qtd_ceps > 1
ORDER BY qtd_ceps DESC

-- i) OK

WITH qry AS
(
	SELECT
		lg.nm_logradouro AS nome_logradouro,
		COUNT(*)         AS qtd_municipios
	FROM logradouro       AS lg
	INNER JOIN localidade AS lc ON lg.cd_localidade = lc.cd_localidade
	WHERE lc.fl_tipo_localidade = "M" AND lc.sg_uf = "SC"
	GROUP BY lg.nm_logradouro
)

SELECT * FROM qry
WHERE qry.qtd_municipios = (SELECT MAX(qry.qtd_municipios) FROM qry)

-- j) OK

SELECT
	nm_localidade AS nome_municipio,
	COUNT(sg_uf)  AS qtd_ufs
FROM localidade
WHERE fl_tipo_localidade = "M"
GROUP BY nm_localidade
HAVING COUNT(sg_uf) > 1

-- k) OK

SELECT
	ba.nm_bairro              AS nome_bairro,
	COUNT(DISTINCT lg.nr_cep) AS qtd_ceps
FROM bairro           AS ba
INNER JOIN logradouro AS lg ON ba.cd_bairro = lg.cd_bairro_inicio
INNER JOIN localidade AS lc ON lg.cd_localidade = lc.cd_localidade
WHERE lc.fl_tipo_localidade = "M"
	AND lc.nm_localidade = "Blumenau"
	AND lc.sg_uf = "SC"
GROUP BY ba.nm_bairro

-- l) OK

SELECT
	lg.nm_logradouro    AS nome_logradouro,
	ba_inicio.nm_bairro AS nome_bairro_inicio,
	ba_fim.nm_bairro    AS nome_bairro_fim
FROM logradouro   AS lg
INNER JOIN bairro AS ba_inicio ON lg.cd_bairro_inicio = ba_inicio.cd_bairro
INNER JOIN bairro AS ba_fim    ON lg.cd_bairro_fim    = ba_fim.cd_bairro
WHERE lg.cd_bairro_inicio != lg.cd_bairro_fim AND lg.sg_uf = "SC"

-- m) OK

WITH qry AS
(
	SELECT
		ba.nm_bairro                     AS nome_bairro,
		lc.nm_localidade                 AS nome_localidade,
		lc.sg_uf                         AS uf,
		COUNT(DISTINCT lg.cd_logradouro) AS qtd_logradouros
	FROM bairro           AS ba
	INNER JOIN logradouro AS lg ON ba.cd_bairro = lg.cd_bairro_inicio OR ba.cd_bairro = lg.cd_bairro_fim
	INNER JOIN localidade AS lc ON lg.cd_localidade = lc.cd_localidade
	GROUP BY ba.nm_bairro, lc.nm_localidade, lc.sg_uf
)

SELECT * FROM qry
WHERE qry.qtd_logradouros = (SELECT MAX(qry.qtd_logradouros) FROM qry)

-- o)



-- p)



-- q)

