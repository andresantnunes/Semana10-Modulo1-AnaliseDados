Temos que modelar o banco de dados de uma clínica de nutrição. 
O sistema precisa registrar os nutricionistas (e sua hierarquia de mentoria interna), 
os pacientes atendidos, as consultas realizadas e os alimentos recomendados em 
cada plano alimentar (prescrições).

Tabelas do sistema:
A. Tabela: nutricionistas (Contém relacionamento Self-Join)
   - id_nutricionista (INT, Chave Primária)
   - nome (VARCHAR(100), Não Nulo)
   - id_mentor (INT, Chave Estrangeira apontando para id_nutricionista)
   - salario (NUMERIC(10,2))

B. Tabela: pacientes (Relacionamento 1:N com Consultas)
   - id_paciente (INT, Chave Primária)
   - nome (VARCHAR(100), Não Nulo)
   - data_nascimento (DATE, Não Nulo)

C. Tabela: consultas (Tabela Fato / Relacionamentos N:1)
   - id_consulta (INT, Chave Primária) -> ID da própria consulta
   - id_paciente (INT, Chave Estrangeira apontando para pacientes - Permite Nulo)
   - id_nutricionista (INT, Chave Estrangeira apontando para nutricionistas)
   - data_consulta (TIMESTAMP, Não Nulo)
   - valor_consulta (NUMERIC(10,2), Não Nulo)

D. Tabela: alimentos (Entidade integrante do relacionamento N:N)
   - id_alimento (INT, Chave Primária)
   - nome_alimento (VARCHAR(100), Não Nulo)
   - calorias_por_100g (INT, Não Nulo)

E. Tabela: prescricoes_alimentos (Tabela Pivot / Associativa do relacionamento N:N)
   - id_consulta (INT, Chave Estrangeira apontando para consultas)
   - id_alimento (INT, Chave Estrangeira apontando para alimentos)
   - quantidade_gramas (INT, Não Nulo)
   - Chave Primária Composta por: (id_consulta, id_alimento)

Você pode utilizar o GEMINI para gerar inserts de valores para o creates anteriores.
O ideal seriam uns 50 inserts para cada tabela.
"Dado o INSERT a seguir: <Insert base>, crie 50 registros aleatórios para essa tabela"

Ao final da criação e inserção, devem ser estruturados SELECTs utilizando:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- NATURAL JOIN
- EQUI JOIN
- SELF JOIN

Queremos também SELECTs com DISTINCT, WITH
Queremos criar uma VIEW de alimentos prescritos.