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

-- Faturamento por mes
SELECT MONTH(dataVenda) AS mes, YEAR(dataVenda) AS ano, SUM(ip.valorTotal) AS Faturamento_mensal FROM itemPedido ip
INNER JOIN pedido P ON ip.id_pedido = p.id_pedido
GROUP BY MONTH(dataVenda), YEAR(dataVenda)
ORDER BY ano, mes;