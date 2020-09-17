/* 2 - MODELO DE UM PROJETO DE VENDAS */

/*DEVELOPED BY GUILHERME COSTA*/

/*DROP TABLES*/


DROP TABLE VENDA_PRODUTO;
DROP TABLE VENDA;
DROP TABLE PRODUTO;
DROP TABLE CLIENTE_TELEFONE;
DROP TABLE CLIENTE;
DROP TABLE TELEFONE;
DROP TABLE TELEFONE_TIPO;

/*CREATE TABLES*/


CREATE TABLE TELEFONE_TIPO(
TT_CODIGO INTEGER PRIMARY KEY,
TT_NOME VARCHAR(40) NOT NULL
);


CREATE TABLE TELEFONE(
TEL_CODIGO INTEGER PRIMARY KEY,
TEL_DDD INTEGER NOT NULL,
TEL_FONE VARCHAR(9) NOT NULL,
TT_CODIGO INTEGER
    CONSTRAINT tt_codigo_FK REFERENCES TELEFONE_TIPO(TT_CODIGO)
);


CREATE TABLE CLIENTE(
CLI_CODIGO INTEGER PRIMARY KEY,
CLI_CPF VARCHAR(14) NOT NULL,
CLI_RG VARCHAR(15) NOT NULL,
CLI_NOME VARCHAR(80) NOT NULL,
CLI_ENDE VARCHAR(80) NOT NULL,
CLIE_ENDENUM VARCHAR(10) NOT NULL,
CLIE_ENDECOMPL VARCHAR(30) NOT NULL,
CLI_BAIRRO VARCHAR(80) NOT NULL,
CLI_ESTADO CHAR(2) NOT NULL,
CLI_CEP VARCHAR(9) NOT NULL,
CLI_NASCIMENTO DATE NOT NULL
);


CREATE TABLE CLIENTE_TELEFONE(
CLI_CODIGO INTEGER
    CONSTRAINT cli_codigo_FK REFERENCES CLIENTE(CLI_CODIGO),
TEL_CODIGO INTEGER
    CONSTRAINT tel_codigo_FK REFERENCES TELEFONE(TEL_CODIGO)
);


CREATE TABLE PRODUTO(
PRO_CODIGO INTEGER PRIMARY KEY,
PRO_NOME VARCHAR(80) NOT NULL,
PRO_ESTOQUE NUMERIC(12,4),
PRO_VENDA NUMERIC(12,2),
PRO_COMPRA NUMERIC(12,2),
PRO_UNIDADE VARCHAR(3)
);


CREATE TABLE VENDA(
VEN_CODIGO INTEGER PRIMARY KEY,
VEN_DATA DATE NOT NULL,
VEN_TOTAL NUMERIC(8,2),
VEN_OBS VARCHAR(50) NOT NULL,
CLI_CODIGO INTEGER
    CONSTRAINT cli_codigo2_FK REFERENCES CLIENTE(CLI_CODIGO)
);


CREATE TABLE VENDA_PRODUTO(
VP_VALOR NUMERIC(14,2),
VP_QTDE NUMERIC(14,2),
VEN_CODIGO INTEGER
    CONSTRAINT ven_codigo_FK REFERENCES VENDA(VEN_CODIGO),
PRO_CODIGO INTEGER
    CONSTRAINT pro_codigo_FK REFERENCES PRODUTO(PRO_CODIGO)
);

