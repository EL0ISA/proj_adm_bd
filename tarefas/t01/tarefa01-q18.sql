SELECT 
    f.nome AS nome_funcionario,
    f.salario,
    d.descricao AS nome_departamento
FROM funcionario f
LEFT JOIN departamento d ON f.codDepto = d.codigo
WHERE f.salario = (
    SELECT MAX(f2.salario)
    FROM funcionario f2
    WHERE f2.codDepto = f.codDepto
)
ORDER BY f.salario ASC;
