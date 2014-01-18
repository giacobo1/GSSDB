#!/usr/bin/python

import psycopg2

conn = psycopg2.connect(database="gssdb", user="postgres", password="12345", host="127.0.0.1", port="5432")

cursor = conn.cursor()

cursor.execute("INSERT INTO filial (CodigoFilial,Nome,Endereco,CategoriaEstoque) values(10,'AZUL','RUA 2','meias');")
cursor.execute("INSERT INTO Transportadora (CodigoTransp,Nome) values(5,'VavaTour');")
cursor.execute("INSERT INTO Fornecedor (CodigoForn,Nome,Categoria) values(3,'VAVA','meias');"


conn.commit()

cursor.execute("SELECT FROM filial WHERE CodigoFilial = 10;")

rows = cursor.fetchall()

for x in rows:
	print "CodigoFilial: ",x[0]
	print "Nome: ",x[1]
	print "Endereco: ",x[2]
	print "CategoriaEstoque: ",x[3]

#queries;

conn.commit()
cursor.close()
conn.close()
