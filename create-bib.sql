-- Criação da tabela Biblioteca com a nova coluna e restrição CHECK
CREATE TABLE Biblioteca (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    endereco VARCHAR(255),
    cidade VARCHAR(100),
    categoria VARCHAR(20) NOT NULL CHECK (categoria IN ('municipal', 'estadual'))
);

-- Criação da tabela Livros (permanece igual)
CREATE TABLE Livros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT,
    biblioteca_id INT NOT NULL,
    CONSTRAINT fk_biblioteca FOREIGN KEY (biblioteca_id) REFERENCES Biblioteca(id) ON DELETE CASCADE
);