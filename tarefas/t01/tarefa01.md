# Tarefa 01

Este documento contém os links para os scripts utilizados na tarefa 01, incluindo os de criação e povoamento do esquema relacional e as consultas resolvidas da lista de exercícios.

---

## 🗃️ Scripts do Esquema Relacional

- [Criação do esquema relacional](tarefa01-create.sql)
- [Povoamento do esquema relacional](tarefa01-inserts.sql)

---

## 🔍 Scripts das Consultas Resolvidas

- [Questão 2](tarefa01-q02.sql)
- [Questão 6](tarefa01-q06.sql)
- [Questão 10](tarefa01-q10.sql)
- [Questão 14](tarefa01-q14.sql)
- [Questão 18](tarefa01-q18.sql)
---

## NATURAL JOIN

- É quando se faz a junção automática entre duas tabelas com base em colunas que **têm o mesmo nome**. Não sendo necessário informar manualmente as colunas.
- Mas se existirem colunas com o mesmo nome mas que **não deveriam ser comparadas**, isso pode gerar resultados errados.

### Exemplo:

#### Tabela `departamento`

|codDepto| descricao   |
|--------|-------------|
| 1      | História    |
| 2      | Computação  |

#### Tabela `funcionario`

| codigo | nome  | codDepto |
|--------|-------|----------|
| 1      | Maria | 1        |
| 2      | José  | 2        |

> Como as colunas `codDepto` (em `funcionario`) e `codDepto` (em `departamento`) tem o **mesmo nome**: `codDepto`, se der um NATURAL JOIN:
```sql
SELECT *
FROM funcionario
NATURAL JOIN departamento;
```

#### Resultado:

|codDepto| nome  | codDepto | descricao   |
|--------|-------|----------|-------------|
| 1      | Maria | 1        | História    |
| 2      | José  | 2        | Computação  |

---
## CROSS JOIN

- Também conhecido como **produto cartesiano**, ele junta **todas as linhas da tabela A com todas as da tabela B**.
- Se uma tabela tem 2 registros e a outra 2, o resultado terá **2 × 2 = 4 linhas**.

### Exemplo:


#### Tabela `departamento`

| codigo | descricao   |
|--------|-------------|
| 1      | História    |
| 2      | Computação  |

#### Tabela `funcionario`

| codigo | nome  | codDepto |
|--------|-------|----------|
| 1      | Maria | 1        |
| 2      | José  | 2        |

```sql
SELECT *
FROM funcionario
CROSS JOIN departamento;
```

#### Resultado:

| codigo | nome  | codDepto | codigo | descricao   |
|--------|-------|----------|--------|-------------|
| 1      | Maria | 1        | 1      | História    |
| 1      | Maria | 1        | 2      | Computação  |
| 2      | José  | 2        | 1      | História    |
| 2      | José  | 2        | 2      | Computação  |

---

## Window Functions no PostgreSQL

- As **Window Functions** (ou *funções de janela*) são funções que permitem realizar **cálculos sobre um conjunto de linhas relacionadas à linha atual**, sem precisar agrupar os dados (linhas) como fazemos com `GROUP BY`. Ela também mantém as linhas originais da tabela.
- Com elas é permitido fazer *cálculos parciais* como somas, médias, classificações, contagens etc. sobre uma “janela” de dados.

### Sintaxe básica

```sql
SELECT 
  coluna1,
  coluna2,
  função_de_janela() OVER () AS alias
FROM tabela;

```
- O função_de_janela() é como ROW_NUMBER(), SUM(), RANK(), etc.

- OVER (), como está, sem PARTITION BY ou ORDER BY, significa que a função é aplicada a todas as linhas da tabela (sem particionar ou ordenar), mas se pode adicionar esses outros elementos se necessario.
---