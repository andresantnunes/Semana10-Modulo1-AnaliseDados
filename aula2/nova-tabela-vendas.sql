CREATE SCHEMA ecommerce;

-- 1. Tabela Cliente
CREATE TABLE ecommerce.cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- 2. Tabela Produto
CREATE TABLE ecommerce.produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL CHECK (preco > 0)
);

-- 3. Tabela Venda (Relaciona Cliente e Produto)
CREATE TABLE ecommerce.venda (
    id SERIAL PRIMARY KEY,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES ecommerce.cliente(id) 
		on DELETE CASCADE,
    CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES ecommerce.produto(id)
);

ALTER TABLE ecommerce.Venda DROP CONSTRAINT fk_produto;

ALTER TABLE ecommerce.Venda 
ADD CONSTRAINT fk_produto 
FOREIGN KEY (produto_id) REFERENCES ecommerce.produto(id) ON DELETE CASCADE;


INSERT INTO ecommerce.cliente (nome, email) VALUES ('Ana Silva', 'ana@email.com');
INSERT INTO ecommerce.cliente (nome, email) VALUES ('Bruno Santos', 'bruno@email.com');

INSERT INTO ecommerce.produto (nome, preco) VALUES ('Notebook', 3500.00);
INSERT INTO ecommerce.produto (nome, preco) VALUES ('Mouse', 150.00);

INSERT INTO ecommerce.venda (cliente_id, produto_id, data_venda) 
VALUES (1, 1, '2026-06-17 14:30:00');

INSERT INTO Venda (cliente_id, produto_id) 
VALUES (2, 2);
