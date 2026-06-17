SELECT * FROM public.biblioteca
ORDER BY id ASC LIMIT 100

SELECT count(cidade), categoria FROM public.biblioteca
GROUP BY categoria
	HAVING COUNT(cidade) > 12

-- Buscamos quais cidades tem mais que 5 bibliotecas
-- Poderiamos ter quantidade de visitantes e fazer uma soma (Exemplo teórico)
SELECT cidade, COUNT(nome) FROM public.biblioteca
GROUP BY cidade
	HAVING COUNT(nome) > 4

-- O SELECT com GROUP BY não tem linhas duplicadas (ou não deveria)
SELECT cidade, nome FROM public.biblioteca
GROUP BY cidade -- o Agrupador dita quais linhas eu trago, ou seja, 
				-- não temos repetição de valores no agrupamento
	HAVING COUNT(nome) > 4
-- O Group By tem 2 tipos de coluna
-- A coluna(s) de agrupamento (agregador) - 
	-- são a "chave" dessa busca
	-- podem ser string ou numéricos
-- E a coluna(s) de valores (agregada) - 
	-- essas precisam ser agregadas com COUNT, SUM, AVG
	-- ou outro método que junte valores de multiplos registros
	-- viram numéricos pela agregação

-- categorais são valores que enumeram alguma coisa
-- O Having pode pesquisar tanto sobre a coluna agregada quanto a agregadora

SELECT cidade, COUNT(nome) FROM public.biblioteca
GROUP BY cidade
	HAVING cidade LIKE 'São%' -- Pequisa pelo agrupadors

SELECT cidade, COUNT(nome) FROM public.biblioteca
GROUP BY cidade 
	HAVING COUNT(nome) > 4 -- Pequisa pelo valor agrupado


-- Distinct elimina duplicatas em buscas que trazem muitas linhas iguais
SELECT DISTINCT cidade, categoria FROM public.biblioteca
