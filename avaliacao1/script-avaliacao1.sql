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

-- d)



-- e) Todo: uma ou mais localidades com maior qtd?

SELECT
	lc.cd_localidade AS codigo_localidade,
	lc.nm_localidade AS nome_localidade,
	lc.sg_uf         AS uf,
	COUNT(*)         AS qtd_ceps_especiais
FROM localidade           AS lc
INNER JOIN grande_usuario AS gu ON lc.cd_localidade = gu.cd_localidade
GROUP BY lc.cd_localidade
ORDER BY COUNT(*) DESC

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

-- h)



-- i) Todo: um ou mais logradouros com maior qtd?

SELECT
	lg.nm_logradouro AS nome_logradouro,
	COUNT(*)         AS qtd_municipios
FROM logradouro       AS lg
INNER JOIN localidade AS lc ON lg.cd_localidade = lc.cd_localidade
WHERE lc.fl_tipo_localidade = "M" AND lc.sg_uf = "SC"
GROUP BY lg.nm_logradouro
ORDER BY COUNT(*) DESC

-- j) OK

SELECT
	nm_localidade AS nome_municipio,
	COUNT(sg_uf)  AS qtd_ufs
FROM localidade
WHERE fl_tipo_localidade = "M"
GROUP BY nm_localidade
HAVING COUNT(sg_uf) > 1

-- k)



-- l)



-- m)



-- o)



-- p)



-- q)

