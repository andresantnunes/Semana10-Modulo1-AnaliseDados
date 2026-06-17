SELECT nome, preco from ecommerce.produto 
where preco > (
	select avg(preco) from ecommerce.produto  
) 

WITH venda_cliente AS (
    SELECT cliente.nome, venda.data 
    FROM vendas
    GROUP BY vendedor_id
)
SELECT v.nome, r.total_visto
FROM resumo_vendas r
JOIN vendedores v ON v.id = r.vendedor_id;
