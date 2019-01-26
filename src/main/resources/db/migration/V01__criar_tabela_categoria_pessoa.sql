CREATE TABLE categoria(
codigo SERIAL,
nome VARCHAR(100) NOT NULL,
PRIMARY KEY(codigo)
);

CREATE TABLE pais(
codigo SERIAL NOT NULL,
nome VARCHAR(100) NOT NULL,
PRIMARY KEY(codigo)
);

CREATE TABLE usuario(
codigo BIGSERIAL NOT NULL,
nome_usuario VARCHAR(250) NOT NULL,
email VARCHAR(500) NOT NULL,
senha VARCHAR(500) NOT NULL,
codigo_pais INTEGER NOT NULL,
cidade VARCHAR(100) NOT NULL,
data_criacao DATE,
telefone VARCHAR(100),
activo BOOLEAN DEFAULT true,
PRIMARY KEY(codigo),
CONSTRAINT fk_pais_usuario
  FOREIGN KEY(codigo_pais) REFERENCES pais(codigo)
);

CREATE TABLE conta(
codigo BIGSERIAL NOT NULL,
nome_conta VARCHAR(100),
saldo NUMERIC(10, 2) DEFAULT 0,
codigo_usuario BIGINT NOT NULL,
PRIMARY KEY(codigo),
CONSTRAINT fk_conta_usuario
  FOREIGN KEY(codigo) REFERENCES usuario(codigo)
);

CREATE TABLE orcamento(
codigo BIGSERIAL NOT NULL,
mes VARCHAR(50) NOT NULL,
titlo VARCHAR(50),
codigo_usuario BIGINT NOT NULL,
PRIMARY KEY(codigo),
CONSTRAINT fk_orcamento_usuario
  FOREIGN KEY(codigo_usuario) REFERENCES usuario(codigo)
);

CREATE TABLE emprestimo(
codigo SERIAL NOT NULL,
tipo_emprestimo VARCHAR(100),
data_emprestimo DATE,
valor_emprestimo NUMERIC(10, 2) NOT NULL,
valor_corrente NUMERIC(10, 2) NOT NULL,
codigo_usuario BIGINT NOT NULL,
PRIMARY KEY(codigo),
CONSTRAINT fk_emprestimo_usuario
  FOREIGN KEY(codigo_usuario) REFERENCES usuario(codigo)
);

CREATE TABLE transacao(
codigo BIGSERIAL NOT NULL,
data_criacao DATE,
tipo_transacao VARCHAR(100),
descricao TEXT,
valor_transacao NUMERIC(10, 2) NOT NULL,
codigo_usuario BIGINT NOT NULL,
codigo_conta BIGINT NOT NULL,
codigo_categoria INTEGER NOT NULL,
PRIMARY KEY(codigo),
CONSTRAINT fk_transacao_usuario
  FOREIGN KEY(codigo_usuario) REFERENCES usuario(codigo),
CONSTRAINT fk_transacao_conta
  FOREIGN KEY(codigo_conta) REFERENCES conta(codigo),
CONSTRAINT fk_transacao_categoria
  FOREIGN KEY(codigo_categoria) REFERENCES categoria(codigo)
);