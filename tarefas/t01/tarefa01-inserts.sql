INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_depto) VALUES
('Ana', 'F', '1990-05-12', 5000.00, NULL),     -- id = 1
('Carlos', 'M', '1985-09-23', 4800.00, NULL),  -- id = 2
('Beatriz', 'F', '1992-11-30', 5300.00, NULL), -- id = 3
('Marcos', 'M', '1980-02-10', 6000.00, NULL),  -- id = 4
('Juliana', 'F', '1995-06-01', 4500.00, NULL); -- id = 5

INSERT INTO departamento (descricao, cod_gerente) VALUES
('TI', 1),            
('RH', 5),            
('Marketing', 3),     
('Financeiro', 4),    
('Jurídico', 2);      

-- Atualizar os funcionários com o código do departamento correto
UPDATE funcionario SET cod_depto = 1 WHERE nome = 'Ana';
UPDATE funcionario SET cod_depto = 2 WHERE nome = 'Juliana';
UPDATE funcionario SET cod_depto = 3 WHERE nome = 'Beatriz';
UPDATE funcionario SET cod_depto = 4 WHERE nome = 'Marcos';
UPDATE funcionario SET cod_depto = 5 WHERE nome = 'Carlos';

INSERT INTO projeto (nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
('Sistema Web', 'Desenvolvimento de sistema web interno', 1, 1, '2024-01-01', '2024-06-30'),
('Recrutamento', 'Campanha de recrutamento', 2, 5, '2024-02-01', '2024-05-31'),
('Nova Marca', 'Rebranding da empresa', 3, 3, '2024-03-01', '2024-08-31'),
('Relatórios Financeiros', 'Automação de relatórios financeiros', 4, 4, '2024-01-15', '2024-07-15'),
('Compliance Jurídico', 'Revisão e adequação jurídica', 5, 2, '2024-04-01', '2024-10-01');

INSERT INTO atividade (nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
('Levantamento', 'Levantamento de requisitos', 1, '2024-01-05', '2024-01-20'),
('Entrevistas', 'Realização de entrevistas com candidatos', 5, '2024-02-05', '2024-02-15'),
('Design', 'Criação da nova identidade visual', 3, '2024-03-10', '2024-04-10'),
('Análise', 'Análise dos dados financeiros', 4, '2024-02-01', '2024-03-01'),
('Revisão', 'Análise de contratos jurídicos', 2, '2024-04-10', '2024-05-10');

INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);