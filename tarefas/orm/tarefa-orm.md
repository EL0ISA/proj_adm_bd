# Tarefa ORM com Python

## 📁 Scripts e Programas Criados

- [Script ORM com SQLAlchemy](orm.py)  
  Realiza operações com ORM (Object-Relational Mapping) usando SQLAlchemy em Python.

  Este script realiza as seguintes operações no banco de dados PostgreSQL `atividade_db`:

    - Define os modelos ORM para as tabelas `Funcionario`, `Departamento`, `Projeto` e `Atividade`
    - Insere uma nova atividade em um projeto existente
    - Atualiza o líder (responsável) de um projeto
    - Lista todos os projetos e suas respectivas atividades
- [Script com ODBC usando pyodbc](acesso_odbc.py)  
  Realiza operações diretamente via conexão ODBC com PostgreSQL.
  Este script realiza as mesmas operações, mas usando ODBC com o pacote `pyodbc`:

    - Conecta-se ao banco de dados PostgreSQL via ODBC
    - Insere uma nova atividade
    - Atualiza o responsável de um projeto
    - Lista todos os projetos e suas atividades

---

## 📘 Resumo sobre ODBC em Python

**ODBC (Open Database Connectivity)** é uma API padrão para acesso a sistemas gerenciadores de bancos de dados (SGBDs) de forma genérica, independentemente do fornecedor do banco. Em Python, a biblioteca mais usada para se conectar a bancos via ODBC é o `pyodbc`. Ela permite executar comandos SQL diretamente (como SELECT, INSERT, UPDATE, etc.)

## 📘 Resumo sobre ORM em Python com SQLAlchemy

**ORM (Object-Relational Mapping)** é uma técnica que converte dados entre bancos relacionais e objetos de linguagens orientadas a objetos.O SQLAlchemy é o framework ORM mais popular no ecossistema Python. Com ela, é possivel mapear tabelas do banco para classes Python e colunas para atributos. Assim, facilitando operações como inserção, atualização e consulta sem precisar escrever SQL diretamente.No SQLAlchemy se usa o conceito de sessões para gerenciar transações.