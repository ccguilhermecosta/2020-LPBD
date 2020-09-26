/* EXERCICIOS AULA 04 */

/*A*/
SELECT *
FROM gravadora;

/*B*/
SELECT cd_id, cd_nome, cd_preco_venda
FROM cd;

/*C*/
SELECT aut_id, aut_nome
FROM autor;

/*D*/
SELECT aut_id, aut_nome
FROM autor
ORDER BY aut_nome DESC;

/*E*/
SELECT *
FROM cd
WHERE grav_id = 3;

/*F*/
SELECT cd_nome, cd_preco_venda
FROM cd 
WHERE cd_preco_venda < 20
AND grav_id = 3;

/*G*/
SELECT * 
FROM gravadora 
WHERE grav_contato IS NULL;

/*H*/
SELECT * 
FROM gravadora 
WHERE grav_contato IS NOT NULL;

/*I*/
SELECT *
FROM cd
WHERE cd_preco_venda
BETWEEN 15.00 AND 20.00;

/*J*/
SELECT * 
FROM cd 
WHERE cd_dt_lancamento > '01-JAN-2000';

/*K*/
SELECT mus_nome
FROM musica
WHERE mus_nome LIKE 'A%';

/*L*/
SELECT *
FROM cd
WHERE cd_nome LIKE '_E%';

/*M*/
SELECT * 
FROM cd
WHERE LOWER(cd_nome) LIKE '%o%';

/*N*/
SELECT * 
FROM cd 
WHERE cd_preco_venda < 30.00
ORDER BY cd_dt_lancamento DESC;

/*O*/

SELECT *
FROM musica
WHERE mus_id IN(1,3,5);


