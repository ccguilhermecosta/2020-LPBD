- traz todas as linhas(registros) e todas as colunas(campos) da tabela cliente
SELECT * 
  FROM cliente;

-- traz todas as linhas(registros) e somente as colunas nome, rg e cpf
SELECT cli_nascimento, cli_nome, cli_rg, cli_cpf
  FROM cliente;

-- traz todas as linhas(registros) e todas as colunas(campos) da tabela cliente
-- ordenado pela coluna nome de forma ascendente (A-Z)
SELECT * 
  FROM cliente
 ORDER BY cli_nome ASC; 
 
-- traz todas as linhas(registros) e todas as colunas(campos) da tabela cliente
-- ordenado pela coluna nome de forma descendente (Z-A)
SELECT * 
  FROM cliente
 ORDER BY cli_nome DESC; 

-- traz todas as linhas(registros) e todas as colunas(campos) da tabela cliente
-- ordenado pelas colunas nome e cpf de forma descendente (Z-A)
SELECT * 
  FROM cliente
 ORDER BY cli_nome ASC, cli_cpf ASC; 

-- traz todas as linhas(registros) e todas as colunas(campos) da tabela cliente
-- ordenado pelas colunas nome e cpf de forma descendente (Z-A)
SELECT * 
  FROM cliente
 ORDER BY cli_nome ASC, cli_cpf DESC; 

-- selecionar nome, cpf, nascimento dos nomes que contenham 'Soares'
SELECT cli_nome, cli_cpf, cli_nascimento
  FROM cliente
 WHERE cli_nome like '%Soares%';

-- selecionar nome, cpf, nascimento dos nomes que termine com 'Soares'
SELECT cli_nome, cli_cpf, cli_nascimento
  FROM cliente
 WHERE cli_nome like '%Soares';

-- selecionar nome, cpf, nascimento dos nomes que contenham 'Soares' minúsculo/maiúsculo
SELECT cli_nome, cli_cpf, cli_nascimento
  FROM cliente
 WHERE upper(cli_nome) like '%SOARES%';

-- selecionar nascimento, nome e rg dos clientes que nasceram após 2012.
SELECT cli_nascimento, cli_nome, cli_rg
  FROM cliente
 WHERE cli_nascimento >= '2012-01-01'; 

-- selecionar nascimento, nome e rg dos clientes que nasceram entre 2012 e 2015.
SELECT cli_nascimento, cli_nome, cli_rg
  FROM cliente
 WHERE (cli_nascimento >= '2012-01-01' AND cli_nascimento <= '2015-12-31');

-- 2ª forma - selecionar nascimento, nome e rg dos clientes que nasceram entre 2012 e 2015.
SELECT cli_nascimento, cli_nome, cli_rg
  FROM cliente
 WHERE (cli_nascimento BETWEEN '2012-01-01' AND '2015-12-31');

-- selecione nome, estado e cep dos clientes que moram 
-- em estados diferentes de SP 
SELECT cli_nome, cli_estado, cli_cep
  FROM cliente
 WHERE cli_estado <> 'SP';

-- selecione nome, estado e cep dos clientes que moram 
-- em estados diferentes de SP 
SELECT cli_nome, cli_estado, cli_cep
  FROM cliente
 WHERE NOT (cli_estado = 'SP');
 
-- selecione todos os clientes que contenham cep
--select * from cliente
SELECT *
  FROM cliente
 WHERE cli_cep IS NOT NULL; 

-- selecione todos os clientes que não contenham cep
SELECT *
  FROM cliente
 WHERE cli_cep IS NULL;

-- selecione todos os clientes de RJ, MG e PR
SELECT *
  FROM cliente
 WHERE cli_estado IN ('RJ', 'MG', 'PR'); 

-- selecione todos os clientes de estado diferente RJ, MG e PR
SELECT *
  FROM cliente
 WHERE cli_estado NOT IN ('RJ', 'MG', 'PR'); 
