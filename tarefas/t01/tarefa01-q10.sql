SELECT p.nome AS projeto,
dp.descricao AS departamento_do_projeto,
f.nome AS responsavel,
df.descricao AS departamento_do_funcionario
FROM projeto p
LEFT JOIN departamento dp ON p.codDepto = dp.codigo
LEFT JOIN funcionario f ON p.codResponsavel = f.codigo
LEFT JOIN departamento df ON f.codDepto = df.codigo;