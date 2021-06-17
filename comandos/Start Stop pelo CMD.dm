START, STOP, RESTART PostgreSQL via CMD

Pra aqueles que tiverem algum problema com a inicialização ou finalização do serviço do PostgreSQL, aqui vai os comandos para iniciar (START) e parar (STOP) o servidor de banco de dados.

Para iniciar (START) o servidor de banco de dados, execute os seguintes passos:

1- Aperte Windows
2- Se for windows 7 ou superior digite cmd e aperte Enter.
    Se não, vá em Executar e digite cmd e aperte Enter.
3- Após aberto o Prompt de comando do Windows - Navegue até a pasta BIN do PostgreSQL
    Ex.: CD C:/Program Files/PostgreSQL/9.2/bin
4- Na pasta bin digite o seguinte comando
    pg_ctl -D "c:/Program Files/PostgreSQL/13/data" start
   
Obs.: Note que o -D tem que ser maiúsculo para que o comando seja executado perfeitamente.

Para parar o servidor o procedimento é o mesmo, trocando somente a ultima palavra START por STOP.

Agora para se fazer um desligamento com segurança, sem que seja fechada todas as conexões, digite a opção -s depois do comando. Ex.:

pg_ctl -D "c:/Program Files/PostgreSQL/9.2/data" stop -s

Podemos fazer a reinicialização do servidor com o mesmo comando, mudando a palavra stop por RESTART, o que desliga o servidor e reinicia o mesmo.

pg_ctl -D "c:/Program Files/PostgreSQL/9.2/data" restart -s