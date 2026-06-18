DROP VIEW ecommerce.vw_vendas_consolidadas;

CREATE VIEW ecommerce.vw_vendas_consolidadas AS
SELECT 
    c.nome, 
    SUM(p.preco) AS total_comprado,
	COUNT(v.id) AS total_vendas
FROM ecommerce.venda v 
JOIN ecommerce.cliente c ON v.cliente_id = c.id
JOIN ecommerce.produto p ON v.produto_id = p.id
GROUP BY c.nome;

-- Toda busca em uma VIEW é a execução do SELECT salvo nessa view
-- Ou seja, ela sempre traz os dados mais recentes
SELECT 
	*
FROM ecommerce.vw_vendas_consolidadas