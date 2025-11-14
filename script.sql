--Tabela Base
---NOME
---CEP
CREATE TABLE pessoa (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR (150) NOT NULL,
    cep VARCHAR (10) NOT NULL
);
--Pessoa Fisica
---CPF
---Aluno ou Professor
CREATE TABLE pessoa_fisica (
    id_pessoa BIGINT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
--Aluno
---Matricula
CREATE TABLE aluno (
    id_pessoa BIGINT PRIMARY KEY,
    matricula VARCHAR(150) UNIQUE NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa_fisica(id_pessoa)
);
--Professor
---Disciplina
CREATE TABLE professor (
    id_pessoa BIGINT PRIMARY KEY,
    disciplina VARCHAR(150) UNIQUE NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa_fisica(id_pessoa)
);
--Pessoa Juridica
---CNPJ
---Produto
CREATE TABLE pessoa_juri (
    id_pessoa BIGINT PRIMARY KEY,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    produto VARCHAR(200) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
