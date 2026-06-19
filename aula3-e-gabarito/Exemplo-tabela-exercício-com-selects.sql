
-- 1. CRIAÇÃO DO SCHEMA E CONFIGURAÇÃO DO CAMINHO DE BUSCA
CREATE SCHEMA IF NOT EXISTS clinica;
SET search_path TO clinica; -- permite que quando eu não tenho um path (clinica.tabela) nos acessamos uma tabela por padrão
-- Padrão é o schema public, nós vamos alterar isso com o SET path

-- 2. CRIAÇÃO DAS TABELAS (DDL)
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

-- 3. INSERÇÃO DE DADOS DE TESTE (DML)
-- Populando Nutricionistas (Com hierarquia de mentoria)
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

-- 4. RESOLUÇÃO DOS SELECTS REQUERIDOS

-- A. INNER JOIN (Apenas consultas com pacientes correspondentes ativos)
SELECT 
    c.id_consulta, 
    p.nome AS nome_paciente, 
    c.valor_consulta
FROM consultas c
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente;

-- B. LEFT JOIN (Todos os pacientes, inclusive os sem consulta cadastrada)
SELECT 
    p.nome AS nome_paciente, 
    c.id_consulta, 
    c.data_consulta
FROM pacientes p
LEFT JOIN consultas c ON p.id_paciente = c.id_paciente;

-- C. RIGHT JOIN (Todos os nutricionistas, inclusive os sem atendimento)
SELECT 
    c.id_consulta, 
    n.nome AS nome_nutricionista
FROM consultas c
RIGHT JOIN nutricionistas n ON c.id_nutricionista = n.id_nutricionista;

-- D. FULL OUTER JOIN (Todos os registros de todas as pontas da operação)
SELECT 
    p.nome AS nome_paciente, 
    c.id_consulta, 
    n.nome AS nome_nutricionista
FROM pacientes p
FULL OUTER JOIN consultas c ON p.id_paciente = c.id_paciente
FULL OUTER JOIN nutricionistas n ON c.id_nutricionista = n.id_nutricionista;

-- E. NATURAL JOIN (Junção automática por coluna de mesmo nome: id_paciente)
SELECT id_paciente, nome, id_consulta, valor_consulta
FROM pacientes
NATURAL JOIN consultas;

-- F. EQUI JOIN (Junção baseada estritamente no operador de igualdade '=')
SELECT 
    c.id_consulta, 
    a.nome_alimento, 
    pa.quantidade_gramas
FROM prescricoes_alimentos pa
JOIN alimentos a ON pa.id_alimento = a.id_alimento;

-- G. SELF JOIN (Tabela consultando a si mesma para mapear hierarquia/mentoria)
SELECT 
    vaga.nome AS nutricionista_residente,
    mentor.nome AS mentor_responsavel
FROM nutricionistas vaga
INNER JOIN nutricionistas mentor ON vaga.id_mentor = mentor.id_nutricionista;