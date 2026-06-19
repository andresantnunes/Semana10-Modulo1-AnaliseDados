CREATE SCHEMA IF NOT EXISTS clinica;
SET search_path TO clinica; 

CREATE TABLE nutricionistas (
    id_nutricionista INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_mentor INT REFERENCES nutricionistas(id_nutricionista),
    salario NUMERIC(10, 2)
);

CREATE TABLE pacientes (
    id_paciente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE consultas (
    id_consulta INT PRIMARY KEY,
    id_paciente INT REFERENCES pacientes(id_paciente),
    id_nutricionista INT REFERENCES nutricionistas(id_nutricionista),
    data_consulta TIMESTAMP NOT NULL,
    valor_consulta NUMERIC(10, 2) NOT NULL
);

CREATE TABLE alimentos (
    id_alimento INT PRIMARY KEY,
    nome_alimento VARCHAR(100) NOT NULL,
    calorias_por_100g INT NOT NULL
);

CREATE TABLE prescricoes_alimentos (
    id_consulta INT REFERENCES consultas(id_consulta),
    id_alimento INT REFERENCES alimentos(id_alimento),
    quantidade_gramas INT NOT NULL,
    PRIMARY KEY (id_consulta, id_alimento)
);



INSERT INTO nutricionistas VALUES (1, 'Dra. Helena Silva', NULL, 8500.00);
INSERT INTO nutricionistas VALUES (2, 'Dr. Bruno Souza', 1, 5000.00);
INSERT INTO nutricionistas VALUES (3, 'Dra. Carina Lopes', 1, 4800.00);
INSERT INTO nutricionistas VALUES (4, 'Dr. Daniel Lima', NULL, 4000.00);

-- Populando Pacientes
INSERT INTO pacientes VALUES (101, 'Ana Costa', '1995-05-12');
INSERT INTO pacientes VALUES (102, 'Carlos Torres', '1988-11-23');
INSERT INTO pacientes VALUES (103, 'Mariana Reis', '2001-02-02');

-- Populando Consultas
INSERT INTO consultas VALUES (2001, 101, 2, '2026-06-15 14:00:00', 250.00);
INSERT INTO consultas VALUES (2002, 102, 1, '2026-06-16 10:00:00', 350.00);
INSERT INTO consultas VALUES (2003, NULL, 3, '2026-06-18 16:00:00', 200.00);

-- Populando Alimentos
INSERT INTO alimentos VALUES (501, 'Peito de Frango', 165);
INSERT INTO alimentos VALUES (502, 'Arroz Integral', 111);
INSERT INTO alimentos VALUES (503, 'Abacate', 160);

-- Populando Prescrições
INSERT INTO prescricoes_alimentos VALUES (2001, 501, 150);
INSERT INTO prescricoes_alimentos VALUES (2001, 502, 100);
INSERT INTO prescricoes_alimentos VALUES (2002, 503, 80);


SELECT *
FROM consultas

SELECT 
    c.id_consulta, 
    p.nome AS nome_paciente, 
    c.valor_consulta
FROM consultas c
LEFT JOIN pacientes p ON c.id_paciente = p.id_paciente;

-- natural join só traz o que existe de comum entre as 2 tabelas
SELECT id_paciente, nome, id_consulta, valor_consulta
FROM pacientes
NATURAL JOIN consultas;

SELECT 
    nutri.nome AS nutricionista_residente,
    mentor.nome AS mentor_responsavel
FROM nutricionistas nutri
INNER JOIN nutricionistas mentor ON nutri.id_mentor = mentor.id_nutricionista;

CREATE VIEW vw_alimentos_prescritos AS
SELECT 
	c.id_consulta,
    p.nome AS nome_paciente,
    n.nome AS nome_nutricionista,
    a.nome_alimento,
    pa.quantidade_gramas
FROM consultas c
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN nutricionistas n ON c.id_nutricionista = n.id_nutricionista
INNER JOIN prescricoes_alimentos pa ON c.id_consulta = pa.id_consulta
INNER JOIN alimentos a ON pa.id_alimento = a.id_alimento;

-- A view é dinamica
SELECT * FROM vw_alimentos_prescritos;

SELECT DISTINCT p.id_paciente, p.nome
FROM pacientes p 
INNER JOIN consultas c ON p.id_paciente = c.id_paciente;

-- Cria uma tabela virtual, ou seja uma tabela temporária para fazer alguma operação
-- CTE - Common Table Expression
WITH faturamento_por_nutri AS ( 
	SELECT 
        id_nutricionista, -- fatura e atendido por nutricionista
        SUM(valor_consulta) AS total_faturado,
        COUNT(id_consulta) AS total_atendimentos
    FROM consultas
    GROUP BY id_nutricionista
)
SELECT 
    n.nome AS nutricionista, -- o nome do nutricionista esta fora do consultas
    f.total_atendimentos,
    f.total_faturado
FROM nutricionistas n
INNER JOIN faturamento_por_nutri f ON n.id_nutricionista = f.id_nutricionista
WHERE f.total_faturado >  -- quem tem faturamento acima da média
(
	SELECT AVG(valor_consulta) FROM consultas
);


SELECT 
    c.id_consulta,
    p.nome AS nome_paciente,
    n.nome AS nome_nutricionista,
    a.nome_alimento,
    pa.quantidade_gramas,
    -- Cálculo dinâmico das calorias ingeridas com base nas gramas prescritas
	-- Arredonda uma conta matemática
	-- Podemos fazer calculos com cada registro e colocar como (AS) uma coluna de resposta
    ROUND(((pa.quantidade_gramas / 100.0) * a.calorias_por_100g), 2) AS total_calorias_prescritas
FROM consultas c
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN nutricionistas n ON c.id_nutricionista = n.id_nutricionista
INNER JOIN prescricoes_alimentos pa ON c.id_consulta = pa.id_consulta
INNER JOIN alimentos a ON pa.id_alimento = a.id_alimento;

