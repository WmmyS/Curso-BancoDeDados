/* Modelagem básica*/

/*ENTIDADE = TABELA
CAMPOS = ATRIBUTOS*/

CLIENTE

NOME - CARACTER (30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDEREÇO - CARACTER(100)
SEXCO - CARACTER(1)

/*PROCESSO DE MODELAGEM */

/* FASE 01 FASE 02 - AD ADM DE DADOS */

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/*OBS: NO BR MODELO PODEMOS CRIAR AS ENTIDADES E OS ATRIBUTOS DENTRO DA MESMA
E ORGANIZAR COM O CTRL+O */

/*FASE 03 - DBA / AD */

MODELAGEM FÍSICA - SCRIPTS DE BANCO

/*INICIANDO A MODELAGEM FÍSICA*/

/*CRIANDO O BANCO DE DADOS*/

CREATE DATABASE PROJETO;

/*CONECTANDO-SE AO BANCO DE DADOS*/

USE PROJETO;

/*CRIANDO A TABELA DE CLIENTES*/

CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDEREÇO VARCHAR(100)
);

/*VERIFICANDO AS TABELAS DO BANDO DE DADOS*/

SHOW TABLES;

/*DESCOBRINDO COMO É A ESTRUTURA DE UMA TABLE*/

DESC CLIENTE;

/*COLOCANDO DADOS NA TABELA DENTRO DO BANCO DE DADOS*/

/*FORMA 1 - OMITINDO AS COLUNAS - PERIGOSA POIS PODEMOS INVERTER A ORDEM DOS CAMPOS E INSERIR VALORES ERRADOS*/

INSERT INTO CLIENTE VALUES('WESLEY','M','WESLEYMARCOS100@HOTMAIL.COM',38923266810,'16982170571','ESTR. ANTÔNIA MUGNATO MARINCEK');

UPDATE CLIENTE SET EMAIL='WESLEYMARCOS100@HOTMAIL.COM'WHERE NOME = 'WESLEY';

/*FORMA 2 - COLOCANDO AS COLUNAS - CONSIDERADA A MAIS SEGURA*/

INSERT INTO CLIENTE(NOME, SEXO, ENDEREÇO, TELEFONE, CPF) VALUES('JORGE','M','RUA CAMPOS DO JORDÃO','16992258178',NULL);

INSERT INTO CLIENTE(NOME, SEXO, ENDEREÇO, TELEFONE, CPF) VALUES('WESLEY','M','ESTR. ANTÔNIA MUGNATO MARINCEK','16982170571',NULL);

INSERT INTO CLIENTE(NOME, SEXO, E-MAIL, CPF, TELEFONE, ENDERECO) VALUES('JOAO','M','JOAO@GMAIL.COM',"68956523515",'16992258178',NULL);

/*FORMA 3 - INSERT COMPACTO - SOMENTE NO MYSQL*/

INSERT INTO CLIENTE VALUES
	('ANA','F','ANA@GLOBO.COM',58848962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
	('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
	
/* O COMANDO SELECT
Seleção, projecao e juncao */

SELECT NOW();

SELECT 'JORGE';

SELECT 'BANCO DE DADOS';

/*ALIAS DE COLUNAS*/

SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDEREÇO FROM CLIENTE;

/*PROJETANDO A TABELA PARA TRAZER RESULTADOS PEDIDOS*/
/*AQUI VAMOS TRAZER UMA TABELA COM INFORMAÇÕES REQUERIDAS COM UMA TABLEA ADICIONAL INFORMADO A DATA E A HORA*/
SELECT EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HOTA FROM CLIENTE;

/*APENAS PARA FINS ACADÊMICOS*/

SELECT * FROM CLIENTE;
/* COMANDO COM O ASTERISCO FAZ UM FULL SCAN NA TABELA*/

/*FILTRANDO*/

SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDEREÇO = 'RJ';

/*UTILIZANDO O LIKE*/

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';

/*CARACTERE CORINGA % -> QUALQUER COISA */
/*NESTE EXEMPLO MOSTRAREMOS RESULTADOS QUE O FINAL SEJA IGUAL A RJ*/

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%';

/* COUNT(*) MONSTRA A CONTAGEM DE ALGO EM UMA TABELA*/
/*EXEMPLO*/
SELECT COUNT(*) AS "QUANTIDADE DE REGISTROS DA TABELA CLIENTE" FROM CLIENTE;

/*OPERADOR BY GROUP*/

/*NESTA PARTE O BANCO IRÁ TRAZER UMA QUERY DA QUANTIDADE DE ITENS NA COLUNA SEXO COM O PRIMEIRO RESULTADOS
ENCONTRADO NA COLUNA SEXO, OU SEJA ELE NÃO MOSTRA OS RESULTADOS SEPARADAMENTE CONTADOS*/
SELECT SEXO, COUNT(*)
FROM CLIENTE;

/*PARA TRAZER UMA QUERY SEPARADA PRECISAMOS FAZER UMA BUSCA SEPARANDO POR GRUPOS DE RESULTADOS
ENTÃO O BANCO IRÁ TRAZER UM RESULTADO DE QUANTIDADES SEPARADO*/
SELECT SEXO, COUNT(*)
FROM CLIENTE
GROUP BY SEXO;



