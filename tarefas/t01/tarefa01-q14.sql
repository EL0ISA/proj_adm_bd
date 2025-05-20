CREATE VIEW vw_fun_atividades AS
SELECT f.codigo AS cod_funcionario,
f.nome AS nome_funcionario,
a.codigo AS cod_atividade
FROM funcionario f
JOIN projeto p ON f.codigo = p.codResponsavel
JOIN atividade a ON p.codigo = a.codProjeto;

SELECT nome_funcionario,
COUNT(cod_atividade) AS total_atividades
FROM vw_fun_atividades
GROUP BY nome_funcionario;