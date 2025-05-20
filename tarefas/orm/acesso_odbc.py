import pyodbc

conn = pyodbc.connect(
    "DRIVER={PostgreSQL Unicode};"
    "SERVER=localhost;"
    "PORT=5432;"
    "DATABASE=atividade_db;"
    "UID=postgres;"
    "PWD=postgres;"
)
cursor = conn.cursor()

# Inserir uma nova atividade
cursor.execute("""
    INSERT INTO atividade (descricao, projeto, data_inicio, data_fim)
    VALUES (?, ?, ?, ?);
""", ("Nova atividade via ODBC", 1, '2025-05-20', '2025-05-30'))
conn.commit()
print("Atividade inserida com sucesso.")

# Atualizar o líder do projeto
cursor.execute("""
    UPDATE projeto SET responsavel = ?
    WHERE codigo = ?;
""", (2, 1))
conn.commit()
print("Responsável atualizado com sucesso.")

# Listar projetos e suas atividades
cursor.execute("""
    SELECT p.nome AS projeto, a.descricao AS atividade
    FROM projeto p
    JOIN atividade a ON p.codigo = a.projeto;
""")
print("\n Projetos e suas Atividades:")
for row in cursor.fetchall():
    print(f"Projeto: {row.projeto}, Atividade: {row.atividade}")

cursor.close()
conn.close()

