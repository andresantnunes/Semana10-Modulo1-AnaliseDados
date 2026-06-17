-- Agruapando as colunas de nome e categoria por categoria da tabela biblioteca
-- Resultado: Total de nomes (não nulos) por categoria

SELECT COUNT(nome) nomes, categoria FROM biblioteca GROUP BY categoria;

SELECT COUNT(*) nomes, categoria FROM biblioteca 
WHERE cidade ILIKE 'B%'
GROUP BY categoria

SELECT *
FROM biblioteca bib
RIGHT JOIN livros li ON bib.id = li.biblioteca_id
WHERE li.ano_publicacao IS NULL;



SELECT li.autor, bib.categoria
FROM biblioteca bib
INNER JOIN livros li ON bib.id = li.biblioteca_id

SELECT COUNT(li.autor), categoria
FROM biblioteca bib
RIGHT JOIN livros li ON bib.id = li.biblioteca_id
GROUP BY categoria;


SELECT *
FROM  livros li 
LEFT JOIN biblioteca bib ON bib.id = li.biblioteca_id
WHERE li.ano_publicacao > 1930

SELECT *
FROM  livros li 
LEFT JOIN biblioteca bib ON bib.id = li.biblioteca_id
WHERE bib.categoria = 'municipal'

SELECT *
FROM  livros li 
FULL OUTER JOIN biblioteca bib ON bib.id = li.biblioteca_id
WHERE bib.categoria = 'municipal'
	AND bib.cidade = 'Guaraus'