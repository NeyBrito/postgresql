# Comandos PostgreSQL :computer:

## Prática

### DDL

> CREATE TABLE IF NOT EXISTS banco(
>     numero INTEGER NOT NULL,
> 	nome VARCHAR(50) NOT NULL,
> 	ativo BOOLEAN NOT NULL DEFAULT TRUE,
> 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
> 	PRIMARY KEY (numero)
> );

> CREATE TABLE IF NOT EXISTS banco(
>     numero INTEGER NOT NULL,
> 	nome VARCHAR(50) NOT NULL,
> 	ativo BOOLEAN NOT NULL DEFAULT TRUE,
> 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
> 	PRIMARY KEY (numero)
> );
>
> CREATE TABLE IF NOT EXISTS agencia(
>     banco_numero INTEGER NOT NULL, 
>     numero INTEGER NOT NULL,
>     nome VARCHAR(80) NOT NULL,   
>     ativo BOOLEAN NOT NULL DEFAULT TRUE,
>     data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
>     PRIMARY KEY (banco_numero, numero),
>     FOREIGN KEY (banco_numero) REFERENCES banco (numero)
> );
>      
> CREATE TABLE cliente(
>     numero BIGSERIAL PRIMARY KEY,
>     nome VARCHAR (120) NOT NULL,
>     email VARCHAR (250) NOT NULL,
>     ativo BOOLEAN NOT NULL DEFAULT TRUE,
>     data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
> );
>
> CREATE TABLE conta_corrente(
>     banco_numero INTEGER NOT NULL,
>     agencia_numero INTEGER NOT NULL,
>     numero BIGINT NOT NULL,
>     digito SMALLINT NOT NULL,
>     cliente_numero BIGINT NOT NULL,
>     ativo BOOLEAN NOT NULL DEFAULT TRUE,
>     data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
>     PRIMARY KEY (banco_numero, agencia_numero, numero, digito, cliente_numero),
>     FOREIGN KEY (banco_numero, agencia_numero) REFERENCES agencia (banco_numero, numero),
>     FOREIGN KEY (cliente_numero) REFERENCES cliente (numero)
> );
>
> CREATE TABLE tipo_transacao(
>     id SMALLSERIAL PRIMARY KEY,
> 	nome VARCHAR (50) NOT NULL,
> 	ativo BOOLEAN NOT NULL DEFAULT TRUE,
>     data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
> );
>
> CREATE TABLE cliente_transacoes(
>     id BIGSERIAL PRIMARY KEY,
> 	banco_numero INTEGER NOT NULL,
> 	agencia_numero INTEGER NOT NULL,
> 	conta_corrente_numero BIGINT NOT NULL,
> 	conta_corrente_digito SMALLINT NOT NULL,
> 	cliente_numero BIGINT NOT NULL,
> 	tipo_transacao_id SMALLINT NOT NULL,
> 	valor NUMERIC(15,2) NOT NULL,
> 	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
> 	FOREIGN KEY (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero) REFERENCES conta_corrente (banco_numero, agencia_numero, numero, digito, cliente_numero)
> );

### DML

#### Testes

> CREATE TABLE IF NOT EXISTS teste(
>     id SERIAL PRIMARY KEY,
> 	nome VARCHAR (50) NOT NULL,
> 	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
> );

> DROP TABLE IF EXISTS teste;

> CREATE TABLE IF NOT EXISTS teste(
>     cpf VARCHAR (11) NOT NULL,
> 	nome VARCHAR (50) NOT NULL,
> 	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
> 	PRIMARY KEY (cpf)
> );

> INSERT INTO teste (cpf, nome, created_at)
> VALUES ('12345678910', 'José Colmeia', '2021-07-01 12:00:00') ON CONFLICT  (CPF) DO NOTHING;

> UPDATE teste SET nome = 'Pedro Alvares' WHERE cpf = '12345678910';

> SELECT * FROM teste;



> SELECT * FROM information_schema.columns WHERE table_name = 'banco';
> SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'banco';

- AVG

  SELECT * FROM cliente_transacoes;
  SELECT AVG(valor) FROM cliente_transacoes;

- COUNT (having)

  SELECT COUNT(numero), email
  FROM cliente
  WHERE email ILIKE '%gmail.com'
  GROUP BY email;

  SELECT COUNT (id), tipo_transacao_id
  FROM cliente_transacoes
  GROUP BY tipo_transacao_id
  HAVING COUNT(id)> 150;

- MAX 

  SELECT MAX(numero)
  FROM cliente;

  SELECT MAX(valor)
  FROM cliente_transacoes;

  SELECT MAX(valor), tipo_transacao_id
  FROM cliente_transacoes
  GROUP BY tipo_transacao_id;

- MIN

  SELECT MIN(numero)
  FROM cliente;

  SELECT MIN(valor)
  FROM cliente_transacoes;

  SELECT MIN(valor), tipo_transacao_id
  FROM cliente_transacoes
  GROUP BY tipo_transacao_id;

- SUM

  SELECT SUM(valor)
  FROM cliente_transacoes;

  SELECT SUM(valor), tipo_transacao_id
  FROM cliente_transacoes
  GROUP BY tipo_transacao_id
  ORDER BY tipo_transacao_id ASC;

  SELECT SUM(valor), tipo_transacao_id
  FROM cliente_transacoes
  GROUP BY tipo_transacao_id
  ORDER BY tipo_transacao_id DESC;



#### JOINS

- LEFT JOIN
- RIGHT JOIN

- FULL JOIN
- CROSS JOIN
