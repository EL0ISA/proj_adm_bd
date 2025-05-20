SELECT nome
FROM funcionario
WHERE codigo NOT IN (
  SELECT codigo
  FROM funcionario
  WHERE dtNasc = (SELECT MIN(dtNasc) FROM funcionario)
);