# Comandos PostgreSQL :computer:

### Prática

> SELECT 1; 
> CREATE ROLE professores NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS CONNECTION LIMIT 10;
> ALTER ROLE 	professores PASSWORD '123';--CREATE ROLE DANIEL PASSWORD '123';
>         
> --DROP ROLE daniel;
> --CREATE ROLE daniel LOGIN PASSWORD '123' IN ROLE PROFESSORES;
> --CREATE ROLE daniel LOGIN PASSWORD '123' ROLE PROFESSORES;
>         
> CREATE TABLE teste (nome varchar);
> GRANT ALL ON TABLE teste TO professores;
> CREATE ROLE daniel LOGIN PASSWORD '123';
> CREATE ROLE daniel INHERIT LOGIN PASSWORD '123' IN ROLE PROFESSORES; //Herança de professores
> REVOKE professores FROM daniel; //Revogada

## Terminal 
Para conseguir acessar o banco de dados pelo CMD vá até a pasta bin ou  configure as variáveis de ambiente PATH no Windows com o um novo path: 
**"C:\Program Files\PostgreSQL\13\bin"**

**\du** - Ver roles 

**plsql -U userName databaseName** - Acessar o banco de dados

**\q** - Sair do Banco

