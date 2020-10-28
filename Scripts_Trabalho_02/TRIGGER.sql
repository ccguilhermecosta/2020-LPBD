/*TRABALHO 02 DE LINGUAGEM DE PROGRAMAÇAO DE BANCO DE DADOS*/
/*DEVELOPED BY GUILHERME COSTA*/

/*CRIAÇAO DA TRIGGER*/
CREATE OR REPLACE TRIGGER CALCULO_VALOR_TOTAL
AFTER INSERT OR UPDATE OR DELETE ON FINANCEIRO
BEGIN
UPDATE FINANCEIRO
SET TOTAL = (VALOR + JUROS + MULTA - DESCONTO);
END;
