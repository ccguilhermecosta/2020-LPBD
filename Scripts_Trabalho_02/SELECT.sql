/*TRABALHO 02 DE LINGUAGEM DE PROGRAMAÇAO DE BANCO DE DADOS*/
/*DEVELOPED BY GUILHERME COSTA*/

/*CONSULTAS SQL*/

/*A - Mostrar o código do financeiro, data de emissão, data de vencimento, nome do
cliente e total dos recebimentos entre ‘01/01/2000’ e a DATA ATUAL, dos clientes
do estado de “SP”.*/
SELECT r.fk2_id_financeiro, f.emissao, f.vencimento, c.nome, f.total
FROM financeiro f JOIN receber r
ON f.id_financeiro = r.fk2_id_financeiro JOIN cliente c
ON c.id_cliente = r.fk_id_cliente
WHERE r.fk_id_cliente IN (SELECT c.id_cliente
                            FROM cliente c
                            WHERE c.fk_id_endereco 
                            IN (SELECT e.id_endereco
                                FROM endereco e
                                WHERE fk_id_estado = (SELECT est.id_estado
                                                        FROM estado est
                                                        WHERE uf LIKE 'SP')))
AND f.emissao BETWEEN '01/01/2000' AND sysdate; /*ARRUMAR*/

/*B - Mostrar o código do financeiro, data de vencimento, data de pagamento, nome, ddd
e telefone dos fornecedores que tenham a palavra ‘INFORMÁTICA’ no seu nome,
e que pagaram multa.*/
SELECT p.fk_id_financeiro "ID FINANCEIRO", f.vencimento "VENCIMENTO", f.pagamento "PAGAMENTO", frn.nome "NOME", frn.ddd "DDD", frn.telefone "TELEFONE"
FROM pagar p JOIN fornecedor frn
ON p.fk_id_fornecedor = frn.id_fornecedor JOIN financeiro f 
ON p.fk_id_financeiro = f.id_financeiro
WHERE UPPER(frn.nome) LIKE '%INFORMATICA%'
AND f.multa IS NOT NULL;

/*C - Mostrar a data do pagamento e a somatória dos recebimentos, agrupados por data
do pagamento.*/
SELECT f.pagamento "DATA DE PAGAMENTO", SUM(f.total) "TOTAL RECEBIDO NA DATA"
FROM financeiro f
GROUP BY f.pagamento
ORDER BY 1;

/*D - Mostre o nome do fornecedor, o valor mínimo, médio e máximo de seus
pagamentos. Ordene pelo nome do fornecedor.*/
SELECT frn.nome, MIN(f.total), AVG(f.total), MAX(f.total)
FROM financeiro f, pagar p, fornecedor frn
WHERE p.fk_id_financeiro = f.id_financeiro
GROUP BY frn.nome
ORDER BY frn.nome;

/*E - Mostre o nome do cliente, a quantidade, média e somatória dos seus pagamentos.
Filtre os clientes do estado de São Paulo que tiveram descontos no pagamento.*/