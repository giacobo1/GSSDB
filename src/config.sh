#!/bin/bash

# Verifica se o PostgreSQL esta instalado.
if [ "$(dpkg-query -W -f='${Status}' postgresql | grep -c -w "installed")" != "1" ]
then
	apt-get install postgresql
fi
# Verifica se o Módulo do Python para manipular o PostgreSQL esta instalado.
if [ "$(dpkg-query -W -f='${Status}' psycopg2 | grep -c -w "installed")" != "1" ]
then
	echo
	#apt-get install python-psycopg2
fi

psql -U postgres -h localhost -f /home/giacobo1/Dropbox/GSSDB/src/dummy_db_test.sql  


# TODO 1: descobrir como fazer um usuario e logar via shell-script. Talvez passar login via linha de comando.
# TODO 2: Após passo 1, listar e verificar se a base de dados ja esta instalada, se não, chamar o arquivo.
# TODO 3: verificar permições deste arquivo e o grupo dele. 
