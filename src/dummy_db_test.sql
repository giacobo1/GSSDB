--  psql -U postgres -h localhost -f /home/giacobo1/Dropbox/GSSDB/src/dummy_db_test.sql  postgres
--  para logar: psql -U postgres -h localhost 
-- TODO: Criar as consultas e as "pseud-views"
-- TODO: Criar um user para o app..
-- TODO: talvez se tudo ficar default - user postgres e search_path public funcione;

CREATE DATABASE GSSDB;
CREATE SCHEMA GSSDB;
ALTER USER postgres SET search_path TO GSSDB,public;

CREATE TABLE GSSDB.Cliente
(
	CPFCliente	 CHAR(14)		PRIMARY KEY NOT NULL,
	Nome		 VARCHAR(30)				NOT NULL,
	Data_Nasc	 DATE,
	Endereco	 VARCHAR(30)				 NOT NULL
);


CREATE TABLE GSSDB.Produto
(
	CodigoProduto	 INT		PRIMARY KEY NOT NULL,
	Valor		 	 DECIMAL(10,2)			NOT NULL,
	Categoria		 VARCHAR(15)			NOT NULL
);



CREATE TABLE GSSDB.Transportadora
(
	CodigoTransp INT		PRIMARY KEY NOT NULL,
	Nome		 VARCHAR(30)			NOT NULL	
);


CREATE TABLE GSSDB.Filial
(
	CodigoFilial 		INT		PRIMARY KEY NOT NULL,
	Nome		 		VARCHAR(30)			NOT NULL,	
	Endereco	 		VARCHAR(30)			NOT NULL,
	CategoriaEstoque	VARCHAR(30)			NOT NULL
);

CREATE TABLE GSSDB.Fornecedor
(
	CodigoForn	 		INT		PRIMARY KEY NOT NULL,
	Nome		 		VARCHAR(30)			NOT NULL,	
	Categoria	 		VARCHAR(30)			NOT NULL
);

-- relacoes..

CREATE TABLE GSSDB.Compra
(
	Data	 		DATE			PRIMARY KEY NOT NULL,
	CPFCliente	 	CHAR(14)		NOT NULL,	
	CodigoProduto	INT			 	NOT NULL,
	Valor			DECIMAL(10,2) 	NOT NULL,

	FOREIGN KEY (CPFCliente) REFERENCES Cliente(CPFCliente),
	FOREIGN KEY (CodigoProduto) REFERENCES Produto(CodigoProduto)
);


CREATE TABLE GSSDB.Entrega
(
	Data_Saida 		DATE			NOT NULL,
	CPFCliente	 	CHAR(14)		NOT NULL,	
	CodigoProduto	INT			 	NOT NULL,
	CodigoTransp	INT			 	NOT NULL,
	Endereco		VARCHAR(30)		NOT NULL,
	
	FOREIGN KEY (CPFCliente) 	REFERENCES Cliente(CPFCliente),
	FOREIGN KEY (CodigoProduto) REFERENCES Produto(CodigoProduto),
	FOREIGN KEY (CodigoTransp) 	REFERENCES Transportadora(CodigoTransp)
);

CREATE TABLE GSSDB.Armazena
(	
	CodigoProduto	INT			 	NOT NULL,
	CodigoFilial	INT			 	NOT NULL,
	
	FOREIGN KEY (CodigoProduto) REFERENCES Produto(CodigoProduto),
	FOREIGN KEY (CodigoFilial) 	REFERENCES Filial(CodigoFilial)
);

CREATE TABLE GSSDB.Encaminha
(	
	CodigoTransp	INT			 	NOT NULL,
	CodigoFilial	INT			 	NOT NULL,
	
	FOREIGN KEY (CodigoTransp) 	REFERENCES Transportadora(CodigoTransp),
	FOREIGN KEY (CodigoFilial) 	REFERENCES Filial(CodigoFilial)
);

CREATE TABLE GSSDB.Abastece
(	
	CodigoForn		INT			 	NOT NULL,
	CodigoFilial	INT			 	NOT NULL,
	
	FOREIGN KEY (CodigoForn)	REFERENCES Fornecedor(CodigoForn),
	FOREIGN KEY (CodigoFilial) 	REFERENCES Filial(CodigoFilial)
);