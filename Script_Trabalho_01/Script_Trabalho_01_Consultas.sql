/* TRABALHO 01 DE LPBD - CONSULTAS*/
/*DEVELOPED BY GUILHERME COSTA*/

/* EXERCICIOS AULA 04 */

/*A - LISTE TODOS OS CAMPOS DA TABELA GRAVADORA*/
SELECT *
FROM gravadora;

/*B - LISTE TODAS AS LINHAS DOS CAMPOS CD_ID, CD_NOME, CD_PRECO DA TABELA CD*/
SELECT cd_id, cd_nome, cd_preco
FROM cd;

/*C - LISTE TODAS AS LINHAS DOS CAMPOS AUT_ID, AUT_NOME DA TABELA AUTOR EM ORDEM ALFABETICA*/
SELECT aut_id, aut_nome
FROM autor
ORDER BY aut_nome;

/*D - REPITA O COMANDO ANTERIOR EM ORDEM ALFABETICA DECRESCENTE*/
SELECT aut_id, aut_nome
FROM autor
ORDER BY aut_nome DESC;

/*E - LISTE TODOS OS CDS DA GRAVADORA 3*/
SELECT *
FROM cd
WHERE grav_id = 3;

/*F - LISTE AS COLUNAS CD_NOME, CD_PRECO DOS CDS CUJOS PREÇOS DE VENDA SEJAM INFERIORES A 20,00 E SEJAM DA GRAVADORA 3*/
SELECT cd_nome, cd_preco
FROM cd 
WHERE cd_preco < 20
AND grav_id = 3;

/*G - LISTE AS COLUNAS DA TABELA GRAVADORA CUJO GRAV_CONTATO SEJA NULO*/
SELECT * 
FROM gravadora 
WHERE grav_contato IS NULL;

/*H - REPITA O COMANDO ANTERIOR DESTA VEZ LISTANDO GRAV_CONTATO NAO NULO*/
SELECT * 
FROM gravadora 
WHERE grav_contato IS NOT NULL;

/*I - LISTE OS CDS CUJOS CD_PRECO ESTEJA ENTRE 15,00 E 30,00*/
SELECT *
FROM cd
WHERE cd_preco
BETWEEN 15.00 AND 20.00;

/*J - LISTE TODOS OS CDS CUJA CD_DT_LANCAMENTO SEJA POSTERIOR AO ANO 2000*/
SELECT * 
FROM cd 
WHERE cd_dt_lancamento > '01-JAN-2000';

/*K - LISTE AS MUSICAS CUJO NOME COMECE COM A DA TABELA MUSICA*/
SELECT mus_nome
FROM musica
WHERE mus_nome LIKE 'A%';

/*L - LISTE OS CDS CUJA SEGUNDA LETRA DO CD_NOME SEJA A LETRA E*/
SELECT *
FROM cd
WHERE cd_nome LIKE '_E%';

/*M - LISTE OS CDS QUE POSSUAM A LETRA O EM QUALQUER POSIÇAO DO CD_NOME*/
SELECT * 
FROM cd
WHERE LOWER(cd_nome) LIKE '%o%';

/*N - LISTE OS CDS QUE POSSUAM CD_PRECO INFERIOR A 30,00 EM ORDEM DECRESCENTE DE CD_DT_LANCAMENTO*/
SELECT * 
FROM cd 
WHERE cd_preco < 30.00
ORDER BY cd_dt_lancamento DESC;

/*O - LISTE AS MUSICAS CUJA MUS_ID SEJA 1,3,5*/

SELECT *
FROM musica
WHERE mus_id IN(1,3,5);


/*EXERCICIOS AULA 06*/

/*A - MONTE UMA PESQUISA QUE MOSTRE A DATA ATUAL*/
SELECT current_date
FROM dual;

/*B - ESCREVA UMA BUSCA QUE MOSTRE CD_NOME, CD_PRECO, E CD_PRECO COM 20% DE AUMENTO*/
SELECT cd_nome, cd_preco, (cd_preco*1.2) "Acrescimo de 20%"
FROM cd;

/*C - ESCREVA UMA BUSCA IGUAL A ANTERIOR, POREM ACRESCENTE UMA COLUNA MOSTRANDO A DIFERENÇA ENTRE O CD_PRECO E CD_PRECO COM 20% DE AUMENTO*/
SELECT cd_nome, cd_preco, (cd_preco*1.2) "Acrescimo de 20%", ((cd_preco*1.2)-(cd_preco)) "Diferença entre preço comum e acrescimo"
FROM cd;

/*D - ESCREVA UMA BUSCA QUE MOSTRE GRAV_NOME, GRAV_CONTATO EM UMA UNICA COLUNA SEPARADOS POR UM HIFEN*/
SELECT grav_nome || ' - ' || grav_contato "Gravadora Nome e Contato"
FROM gravadora;

/*E - ESCREVA UMA BUSCA QUE MOSTRE TODOS OS AUTORES QUE TENHAM A LETRA A NO NOME*/
SELECT *
FROM autor 
WHERE LOWER(aut_nome) LIKE '%a%';

/*F - ESCREVA UMA BUSCA QUE MOSTRE A PRIMEIRA LETRA DO MUS_NOME E A MUS_DURACAO DA TABELA MUSICA*/
SELECT SUBSTR(mus_nome, 1, 1) "Primeira letra da Musica", mus_duracao "Duraçao"
FROM musica;

/*G - ESCREVA UMA BUSCA QUE MOSTRE O CD_NOME E O NUMERO DE DIAS ENTRE A DATA ATUAL E A DATA DE LANÇAMENTO*/
SELECT cd_nome, cd_dt_lancamento "Data de Lançamento", current_date,(current_date - cd_dt_lancamento) "Diferença entre hoje e data de lançamento"
FROM cd;

/*H - ESCREVA UMA BUSCA SEMELHANTE A ANTERIOR QUE MOSTRE UMA COLUNA COM 15 DIAS APOS A CD_DT_LANCAMENTO*/ 
SELECT cd_nome, cd_dt_lancamento "Data de Lançamento", cd_dt_lancamento + 15 "Data de Lançamento + 15 dias"
FROM cd;

/*I - ESCREVA UMA BUSCA QUE RETORNE O ANO DE LANÇAMENTO DO CD_ID = 1,2 E 3*/
SELECT cd_dt_lancamento
FROM cd
WHERE cd_id IN (1,2,3);

/*J - ESCREVA UMA CONSULTA QUE RETORNE OS 5 PRIMEIROS CARACTERES DE MUS_NOME E OUTRA COLUNA COM MUS_NOME*/
SELECT SUBSTR(mus_nome, 1, 5), mus_nome
FROM musica;


/*EXERCÍCIOS DA AULA 07*/

/*A - Verifique o maior e menor valor dos preços de venda dos CD's*/

SELECT MAX(cd_preco) "Maior valor de venda", MIN(cd_preco) "Menor valor de venda"
FROM cd;

/*B - Verifique a diferença entre o maior e menor valor dos preços de venda dos CD's*/

SELECT (MAX(cd_preco) - MIN(cd_preco)) "Diferença entre maior e menor preço de venda"
FROM cd;

/*C - Verifique a quantidade de dias compreendidos entre a data mais atual e a data mais antiga das datas de lançamento dos CD's*/

SELECT MAX(cd_dt_lancamento) - MIN(cd_dt_lancamento) || ' Dias de diferença' "Diferença"
FROM cd;

/*D - Mostre atraves de uma consulta o tempo total do CD 1 (cd_id = 1) */

SELECT f.cd_id "ID do CD", SUM(m.mus_duracao) "Soma da Duraçao"
FROM faixa f 
INNER JOIN musica m ON m.mus_id = f.mus_id 
GROUP BY f.cd_id 
HAVING f.cd_id = 1;

/*E - Mostre atraves de uma consulta a media de duraçao das musicas cujo nome comece com a letra A*/

SELECT COUNT(mus_duracao) "Quantidade De Musicas Começando Com A" , AVG(mus_duracao) "Media de duraçao das musicas"
FROM musica 
WHERE UPPER(mus_nome) LIKE 'A%';


/*F - Faça uma consulta que retorne a quantidade de CD's cadastrados*/
SELECT COUNT(cd_id) "Quantidade de CD's cadastrados"
FROM cd;

/*G - Faça uma consulta que retorne o nome do CD e a media de duraçao das musicas em cada CD, desde que a media nao seja superior a 4*/ 

SELECT c.cd_nome "Nome do CD", AVG(m.mus_duracao) "Media de Duracao das Musicas"
FROM cd c INNER JOIN faixa f 
ON c.cd_id = f.cd_id INNER JOIN musica m
ON f.mus_id = m.mus_id
GROUP BY c.cd_nome;

/*H - Faça uma consulta que retorne os autores que sao autores de mais de uma musica*/

SELECT a.aut_nome "Nome do Autor", COUNT(m.mus_id) "Numero de musicas cadastradas"
FROM autor a INNER JOIN musica_autor ma
ON a.aut_id = ma.aut_id INNER JOIN musica m
ON m.mus_id = ma.mus_id
GROUP BY a.aut_nome;

