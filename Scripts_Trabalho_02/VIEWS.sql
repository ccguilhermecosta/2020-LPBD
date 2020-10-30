/*TRABALHO 02 DE LINGUAGEM DE PROGRAMAÇAO DE BANCO DE DADOS*/
/*DEVELOPED BY GUILHERME COSTA*/

/*CRIAÇAO DAS VISOES DE BANCO DE DADOS*/

/*VIEW_RECEBER_PAGOS*/
CREATE OR REPLACE VIEW VIEW_RECEBER_PAGOS AS
SELECT r.fk_id_cliente "ID DO CLIENTE", c.nome "NOME DO CLIENTE", c.cpf "CPF", c.email "E-MAIL", f.vencimento "DATA DE VENCIMENTO", f.pagamento "DATA DE PAGAMENTO"
FROM financeiro f JOIN receber r 
ON f.id_financeiro = r.fk2_id_financeiro JOIN cliente c
ON r.fk_id_cliente = c.id_cliente
WHERE f.pagamento IS NOT NULL;

SELECT * FROM view_receber_pagos;

/*VIEW_RECEBER_NAO_PAGOS*/
CREATE OR REPLACE VIEW VIEW_RECEBER_NAO_PAGOS AS
SELECT r.fk_id_cliente "ID DO CLIENTE", c.nome "NOME DO CLIENTE", c.cpf "CPF", c.email "E-MAIL", f.vencimento "DATA DE VENCIMENTO", ROUND((sysdate - f.vencimento),0) || ' DIAS' "DIAS DE ATRASO"
FROM financeiro f JOIN receber r
ON f.id_financeiro = r.fk2_id_financeiro JOIN cliente c
ON r.fk_id_cliente = c.id_cliente
WHERE f.pagamento IS NULL;

SELECT * FROM view_receber_nao_pagos;

/*VIEW_PAGAR_PAGOS*/
CREATE OR REPLACE VIEW VIEW_PAGAR_PAGOS AS
SELECT frn.nome "NOME DO FORNECEDOR", frn.ddd "DDD", frn.telefone "TELEFONE", f.vencimento "DATA DE VENCIMENTO", f.pagamento "DATA DE PAGAMENTO"
FROM financeiro f JOIN pagar p
ON f.id_financeiro = p.fk_id_financeiro JOIN fornecedor frn
ON p.fk_id_fornecedor = frn.id_fornecedor
WHERE f.pagamento IS NOT NULL;

SELECT * FROM view_pagar_pagos;

/*VIEW_PAGAR_NAO_PAGOS*/
CREATE OR REPLACE VIEW VIEW_PAGAR_NAO_PAGOS AS
SELECT frn.nome "NOME DO FORNECEDOR", frn.razao "RAZAO SOCIAL", frn.email "E-MAIL", f.vencimento "VENCIMENTO", ROUND((sysdate - f.vencimento),0) || ' DIAS' "DIAS DE ATRASO"
FROM financeiro f JOIN pagar p
ON f.id_financeiro = p.fk_id_financeiro JOIN fornecedor frn
ON p.fk_id_fornecedor = frn.id_fornecedor
WHERE f.pagamento IS NULL;

SELECT * FROM view_pagar_nao_pagos;