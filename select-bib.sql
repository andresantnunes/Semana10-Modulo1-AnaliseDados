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
