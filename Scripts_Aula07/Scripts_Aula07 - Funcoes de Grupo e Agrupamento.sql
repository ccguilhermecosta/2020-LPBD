/*EXERCÍCIOS DA AULA 07 - FUNÇÕES DE GRUPO E AGRUPAMENTO*/
/* DEVELOPED BY GUILHERME COSTA */

/*A - Verifique o maior e menor valor dos preços de venda dos CD's*/

SELECT MAX(cd_preco_venda) "Maior valor de venda", MIN(cd_preco_venda) "Menor valor de venda"
FROM cd;

/*B - Verifique a diferença entre o maior e menor valor dos preços de venda dos CD's*/

SELECT (MAX(cd_preco_venda) - MIN(cd_preco_venda)) "Diferença entre maior e menor preço de venda"
FROM cd;

/*C - Verifique a quantidade de dias compreendidos entre a data mais atual e a data mais antiga das datas de lançamento dos CD's*/

SELECT MAX(cd_dt_lancamento) - MIN(cd_dt_lancamento) || ' Dias de diferença' "Diferença"
FROM cd;

/*D - Mostre atraves de uma consulta o tempo total do CD 1 (cd_id = 1) */

SELECT i.cd_id "ID do CD", SUM(m.mus_duracao) "Soma da Duraçao"
FROM item_cd i 
INNER JOIN musica m ON m.mus_id = i.mus_id 
GROUP BY i.cd_id 
HAVING i.cd_id = 1;


/*E - Mostre atraves de uma consulta a media de duraçao das musicas cujo nome comece com a letra A*/

SELECT COUNT(mus_duracao) "Quantidade De Musicas Começando Com A" , AVG(mus_duracao) "Media de duraçao das musicas"
FROM musica 
WHERE UPPER(mus_nome) LIKE 'A%';


/*F - Faça uma consulta que retorne a quantidade de CD's cadastrados*/
SELECT COUNT(cd_id) "Quantidade de CD's cadastrados"
FROM cd;

/*G - Faça uma consulta que retorne o nome do CD e a media de duraçao das musicas em cada CD, desde que a media nao seja superior a 4*/ 

SELECT c.cd_nome "Nome do CD", AVG(m.mus_duracao) "Media de Duracao das Musicas"
FROM cd c INNER JOIN item_cd i 
ON c.cd_id = i.cd_id INNER JOIN musica m
ON i.mus_id = m.mus_id
GROUP BY c.cd_nome;

/*H - Faça uma consulta que retorne os autores que sao autores de mais de uma musica*/

SELECT a.aut_nome "Nome do Autor", COUNT(m.mus_id) "Numero de musicas cadastradas"
FROM autor a INNER JOIN mus_autor ma
ON a.aut_id = ma.aut_id INNER JOIN musica m
ON m.mus_id = ma.mus_id
GROUP BY a.aut_nome;
