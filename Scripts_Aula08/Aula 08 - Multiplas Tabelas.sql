/* Exercicios Aula 08 - Pesquisas em Multiplas tabelas */
/* Developed by Guilherme Costa */

/* A - Faça uma busca que mostre todos os CD's e o nome de suas respectivas gravadoras */
SELECT c.cd_nome "Nome do CD", g.grav_nome "Nome da Gravadora"
FROM cd c INNER JOIN gravadora g
ON c.grav_id = g.grav_id;

/* B - Faça uma pesquisa que mostre o produto cartesiano das tabelas MUSICA e CD */
SELECT * 
FROM musica, cd;

/* C - Realize uma consulta se utilizando da sintaxe JOIN que mostre todas MUSICAS e o nome de seus respectivos CD's. */
SELECT m.mus_nome "Nome da Musica", c.cd_nome "Nome do CD"
FROM musica m INNER JOIN item_cd i
ON i.mus_id = m.mus_id INNER JOIN cd c
ON i.cd_id = c.cd_id;

/* D - Crie uma pesquisa que retorne como resultado todas as gravadoras e seus respectivos CD's mesmo que estes nao possuam CD's associados */
SELECT g.grav_nome "Nome da Gravadora", c.cd_nome "Nome do CD"
FROM gravadora g INNER JOIN cd c
ON g.grav_id = c.grav_id;

/* E - Crie uma pesquisa que mostre o AUTOR e suas MUSICAS ordenadas por AUTOR */
SELECT a.aut_nome "Nome do Autor", m.mus_nome "Nome da Musica"
FROM autor a, musica m, mus_autor ma
WHERE a.aut_id = ma.aut_id AND m.mus_id = ma.mus_id
ORDER BY a.aut_nome;

/* F - Acrescente a pesquisa anteriror o nome do CD que foi gravado a musica. */
SELECT a.aut_nome "Nome do Autor", m.mus_nome "Nome da Musica", c.cd_nome "Nome do CD"
FROM autor a, musica m, mus_autor ma, cd c, item_cd i
WHERE a.aut_id = ma.aut_id
AND m.mus_id = ma.mus_id
AND i.cd_id = c.cd_id
AND i.mus_id = m.mus_id
ORDER BY a.aut_nome;

/* G - Crie uma pesquisa que mostre em quais gravadoras os autores tem ralizado suas gravaçoes */
SELECT a.aut_nome "Nome do Autor", c.cd_nome "Nome do CD", g.grav_nome "Nome da Gravadora"
FROM autor a, cd c, gravadora g, item_cd i, musica m, mus_autor ma
WHERE m.mus_id = ma.mus_id
AND ma.aut_id = a.aut_id
AND g.grav_id = c.grav_id
AND i.cd_id = c.cd_id
AND i.mus_id = m.mus_id;

