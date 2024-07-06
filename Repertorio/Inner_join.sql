use comercio;

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