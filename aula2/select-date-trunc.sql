SELECT 
	v.id AS id_venda,
	CONCAT('Pessoa: ',c.nome) AS nome_cliente,
	CONCAT('Produto: ',p.nome) AS nome_produto,
	p.preco AS valor_produto,
	v.data_venda
FROM ecommerce.venda v 
JOIN ecommerce.cliente c ON v.cliente_id = c.id
JOIN ecommerce.produto p ON v.produto_id = p.id
WHERE p.preco > 1000;

SELECT DISTINCT SUBSTRING(nome,0,3) AS abreviacao_nome
FROM ecommerce.produto

SELECT -- soma de valores de produto
	SUM(p.preco) AS valor_total_produto,
		-- categoriza os produtos por mes da venda
		-- DATE_TRUNC para contar apenas o mês desse campo
	DATE_TRUNC('month', v.data_venda) mes_analise
FROM ecommerce.venda v 
JOIN ecommerce.produto p ON v.produto_id = p.id
GROUP BY DATE_TRUNC('month', v.data_venda)
ORDER BY mes_analise;