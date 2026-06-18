WITH ResumoVendas AS ( -- with precede um select ou outra operação
    -- Esta é a sua CTE (tabela temporária na memória)
    SELECT 
        v.id AS id_venda,
        c.nome AS nome_cliente,
        p.nome AS nome_produto,
        p.preco AS valor_produto,
        v.data_venda
    FROM ecommerce.venda v -- left de cliente
    JOIN ecommerce.cliente c ON v.cliente_id = c.id -- righ de vendas e left de produto
    JOIN ecommerce.produto p ON v.produto_id = p.id -- left de cliente
)
-- Agora você seleciona os dados dessa tabela temporária
-- Esse segundo select é parte do bloco do with
SELECT * FROM ResumoVendas
WHERE valor_produto > 500.00
ORDER BY data_venda DESC;