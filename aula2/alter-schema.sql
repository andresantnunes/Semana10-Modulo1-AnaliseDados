ALTER SCHEMA ecommerce RENAME TO loja

SET search_path TO loja, public;
SHOW SEARCH_PATH

SELECT * FROM cliente -- retorno os dados da tabela cliente no schema loja

SELECT * FROM biblioteca 

-- retorno os dados da tabela biblioteca do schema public
-- ele busca primeiro na loja 
	-- e como não econtra a biblioteca ele segue para o próximo schema da lista

