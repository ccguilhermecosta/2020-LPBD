/*EXERCÍCIOS DA AULA 07 - FUNÇÕES DE GRUPO E AGRUPAMENTO*/
/* DEVELOPED BY GUILHERME COSTA */

/*A*/

SELECT MAX(cd_preco_venda) "Maior valor de venda", MIN(cd_preco_venda) "Menor valor de venda"
FROM cd;

/*B*/

SELECT (MAX(cd_preco_venda) - MIN(cd_preco_venda)) "Diferença entre maior e menor preço de venda"

/*C*/

SELECT MAX(cd_data_lancamento) "Data mais recente", MIN(cd_data_lancamento) "Data mais antiga", 
