use comercio;
--SELECT PARA TABELA CLIENTE
SELECT * FROM cliente;
SELECT * FROM cliente WHERE nomeSocial= 'N\A';
SELECT * FROM cliente WHERE nome like 'G%';
SELECT * FROM cliente WHERE nome like '%A';
SELECT * FROM cliente WHERE nome like 'G%' AND nome like '%a';
SELECT * FROM cliente WHERE tipoDocumento = 'CP';
SELECT nome, dataNascimento FROM cliente;

SELECT COUNT(*) AS total_clientes FROM cliente;
SELECT * FROM cliente ORDER BY nome ASC;
SELECT * FROM cliente ORDER BY nome DESC;
SELECT * FROM cliente WHERE nomeSocial IS NULL;

--INNER JOIN CLIENTE
SELECT cliente.id_cliente, cliente.nome, contato.telefone, contato.celular
FROM cliente INNER JOIN contato ON cliente.id_cliente = contato.id_cliente;
SELECT cliente.id_cliente, cliente.nome, contato.telefone, contato.celular, endereco.logradouro, endereco.numero, endereco.bairro, endereco.cidade
FROM cliente 
INNER JOIN contato ON cliente.id_cliente = contato.id_cliente
INNER JOIN endereco ON cliente.id_cliente = endereco.id_cliente
WHERE endereco.cidade = 'São Paulo';

SELECT cliente.id_cliente, cliente.nome, contato.telefone, contato.celular, endereco.logradouro, endereco.numero, endereco.bairro, endereco.cidade
FROM cliente
INNER JOIN contato ON cliente.id_cliente = contato.id_cliente
INNER JOIN endereco ON cliente.id_cliente = endereco.id_cliente
WHERE endereco.uf = 'BA' AND cliente.nome like 'A&';

SELECT cliente.id_cliente, cliente.nome, contato.telefone, contato.celular, endereco.logradouro, endereco.numero, endereco.bairro, endereco.cidade
FROM cliente
INNER JOIN contato ON cliente.id_cliente = contato.id_cliente
INNER JOIN endereco ON cliente.id_cliente = endereco.id_cliente
WHERE endereco.uf = 'BA' AND cliente.nome like 'H&'
OR endereco.uf = 'BA' AND cliente.nome like 'B&';

SELECT uf, COUNT(*) AS Estado FROM endereco
GROUP BY uf
ORDER BY Estado ASC;

SELECT genero, COUNT(*) AS qtde_cliente FROM cliente
GROUP BY genero
ORDER BY qtde_cliente ASC;

--Clientes que nunca compraram
SELECT C.nome FROM cliente c 
LEFT JOIN pedido p ON c.id_cliente=p.id_cliente
WHERE p.id_cliente IS NULL;

--Clientes com mais de um endereco
SELECT c.nome, COUNT(e.id_cliente) AS quantidade_endereco FROM cliente c 
LEFT JOIN endereco e ON c.id_cliente = e.id_cliente
GROUP BY c.nome
HAVING quantidade_endereco > 1
ORDER BY c.nome;