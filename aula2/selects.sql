SELECT DISTINCT autor
FROM  livros;


SELECT DISTINCT *
FROM  livros li 
LEFT JOIN biblioteca bib ON bib.id = li.biblioteca_id
WHERE bib.categoria = 'municipal'
	AND bib.cidade = 'Guaraus'

SELECT *
FROM  livros li 
LEFT JOIN biblioteca bib ON bib.id = li.biblioteca_id