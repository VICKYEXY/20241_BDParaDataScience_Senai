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
GROUP BY genero
ORDER BY qtde_cliente ASC;

-- INNER JOIN PRODUTO

--QTDE de produtos em estoque
SELECT SUM(quantidade) AS total_produtos FROM estoque;

-- Faturamento por mes
SELECT MONTH(dataVenda) AS mes, YEAR(dataVenda) AS ano, SUM(ip.valorTotal) AS Faturamento_mensal FROM itemPedido ip
INNER JOIN pedido P ON ip.id_pedido = p.id_pedido
GROUP BY MONTH(dataVenda), YEAR(dataVenda)
ORDER BY ano, mes;