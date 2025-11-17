--Tabelas do Banco de dados
CREATE TABLE pessoa (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  nome VARCHAR(150) NOT NULL,
  cep VARCHAR(8) NOT NULL
);

CREATE TABLE pessoa_fisica (
  id_pessoa BIGINT PRIMARY KEY,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  tipo VARCHAR(20) NOT NULL,
  CONSTRAINT fk_pf_pessoa
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);

CREATE TABLE aluno (
  id_pessoa BIGINT PRIMARY KEY,
  matricula VARCHAR(150) UNIQUE NOT NULL,
  CONSTRAINT fk_aluno_pf
    FOREIGN KEY (id_pessoa) REFERENCES pessoa_fisica(id_pessoa)
);

CREATE TABLE professor (
  id_pessoa BIGINT PRIMARY KEY,
  disciplina VARCHAR(150) UNIQUE NOT NULL,
  CONSTRAINT fk_prof_pf
    FOREIGN KEY (id_pessoa) REFERENCES pessoa_fisica(id_pessoa)
);

CREATE TABLE pessoa_juridica (
  id_pessoa BIGINT PRIMARY KEY,
  cnpj VARCHAR(18) UNIQUE NOT NULL,
  produto VARCHAR(200) NOT NULL,
  CONSTRAINT fk_pj_pessoa
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);

CREATE TABLE fornecedor (
  id_pessoa BIGINT PRIMARY KEY,
  produto VARCHAR(255) NOT NULL,
  CONSTRAINT fk_forn_pj
    FOREIGN KEY (id_pessoa) REFERENCES pessoa_juridica(id_pessoa)
);
