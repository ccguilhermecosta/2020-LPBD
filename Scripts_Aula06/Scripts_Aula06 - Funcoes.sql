/*EXERCICIOS AULA 06*/

/*A*/
SELECT current_date
FROM dual;

/*B*/
SELECT cd_nome, cd_preco_venda, (cd_preco_venda*1.2) "Acrescimo de 20%"
FROM cd;

/*C*/
SELECT cd_nome, cd_preco_venda, (cd_preco_venda*1.2) "Acrescimo de 20%", ((cd_preco_venda*1.2)-(cd_preco_venda)) "Diferença entre preço comum e acrescimo"
FROM cd;

/*D*/
SELECT grav_nome || ' - ' || grav_contato "Gravadora Nome e Contato"
FROM gravadora;

/*E*/
SELECT *
FROM autor 
WHERE LOWER(aut_nome) LIKE '%a%';

/*F*/
SELECT SUBSTR(mus_nome, 1, 1) "Primeira letra da Musica", mus_duracao "Duraçao"
FROM musica;

/*G*/
SELECT cd_nome, cd_dt_lancamento "Data de Lançamento", current_date,(current_date - cd_dt_lancamento) "Diferença entre hoje e data de lançamento"
FROM cd;

/*H*/ 
SELECT cd_nome, cd_dt_lancamento "Data de Lançamento", current_date,(current_date - cd_dt_lancamento) "Diferença entre hoje e data de lançamento", cd_dt_lancamento + 15 "Data de Lançamento + 15 dias"
FROM cd;

/*I*/
SELECT cd_dt_lancamento
FROM cd
WHERE cd_id IN (1,2,3);

/*J*/
SELECT SUBSTR(mus_nome, 1, 5), mus_nome
FROM musica;