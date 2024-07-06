use comercio;
--SELECT PARA TABELA PRODUTO
SELECT * FROM produto
SELECT COUNT(*) AS total_produto FROM produto;
SELECT*FROM produto WHERE valor >100 AND valor <= 300;
ORDER BY valor ASC

SELECT*FROM produto WHERE valor >=100 OR valor ,= 300;
SELECT *FROM produto ORDER BY valor ASC;
SELECT*FROM produto WHERE nomeProduto LIKE 'carro%' OR nomeProduto LIKE 'notebook%';

--QTDE de produtos em estoque
SELECT SUM(quantidade) AS total_produtos FROM estoque;

--INNER JOIN PRODUTO

-- Faturamento por mes
SELECT MONTH(dataVenda) AS mes, YEAR(dataVenda) AS ano, SUM(ip.valorTotal) AS Faturamento_mensal FROM itemPedido ip
INNER JOIN pedido P ON ip.id_pedido = p.id_pedido
GROUP BY MONTH(dataVenda), YEAR(dataVenda)
ORDER BY ano, mes;

-- clientes que compraram acima de um determinado valor
SELECT C.nome, SUM(ip.valorTotal) AS valor_total_compras FROM cliente C
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
INNER JOIN itemPedido ip ON ip.id_pedido = p.id_pedido
GROUP BY c.nome
HAVING valor_total_compras > 2000;

-- produtos mais vendidos por categoria
SELECT c.nomeCategoria, p.nomeProduto, SUM(ip.quantidade) AS qtde_vendida FROM itemPedido ip 
INNER JOIN produto p ON ip.id_produto = p.id_produto
INNER JOIN categoria c ON p.id_categoria = c.id_categoria
GROUP BY c.nomeCategoria, p.nomeProduto
ORDER BY c.nomeCategoria, qtde_vendida DESC;

--media do valor dos produtos por categoria
SELECT c.nomeCategoria, AVG(p.valor) AS media_valor
FROM produto P
INNER JOIN categoria c ON p.id_categoria = c.id_categoria
GROUP BY c.nomeCategoria;

