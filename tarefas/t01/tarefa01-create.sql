CREATE TABLE departamento (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(100),
    cod_gerente INT
);

CREATE TABLE funcionario (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    sexo CHAR(1),
    dt_nasc DATE,
    salario NUMERIC(10,2),
    cod_depto INT REFERENCES departamento(codigo)
);

ALTER TABLE departamento
ADD CONSTRAINT fk_gerente FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo);

CREATE TABLE projeto (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    cod_depto INT REFERENCES departamento(codigo),
    cod_responsavel INT REFERENCES funcionario(codigo),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE atividade (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    cod_responsavel INT REFERENCES funcionario(codigo),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE atividade_projeto (
    cod_projeto INT REFERENCES projeto(codigo),
    cod_atividade INT REFERENCES atividade(codigo),
    PRIMARY KEY (cod_projeto, cod_atividade)
);