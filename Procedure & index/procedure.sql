
--1. procedure para listar clientes por estados (UF)
 
CREATE PROCEDURE sp_ClientesPorEstado (@uf VARCHAR (4)) AS BEGIN
SELECT * FROM cliente c
INNER JOIN endereco e ON c.id_cliente = e.id_cliente WHERE e.uf = @uf;
END;
 
-- Como usar:
EXEC sp_ClientesPorEstado 'SP';
 
 
CREATE PROCEDURE sp_ValorTotalPedido (@idPedido SMALLINT)
AS
BEGIN
DECLARE @valorTotal FLOAT (5);
 
SELECT @valorTotal = SUM(ip.valorTotal)
FROM itemPedido ip
WHERE ip.id_pedido = @idPedido;
END;
 
-- como usar
 
use comercio;
DECLARE @idPedido SMALLINT = 65;
 
EXEC sp_ValorTotalPedido @idPedido;
 
-- Procedure para inserir Dados em Clientes
CREATE PROCEDURE sp_InserirCliente
@nome VARCHAR (150),
@nomeSocial VARCHAR (150),
@genero VARCHAR (15)
@dataNascimento DATE,
@documento VARCHAR (18)
@tipoDocumento VARCHAR (2)
AS
BEGIN
INSERT INTO cliente (nome, nomeSocial, genero, dataNascimento, documento, tipoDocumento)
VALUES (@nome, @nomeSocial, @genero, @dataNascimento, @documento, @tipoDocumento);
END;
 
-- como usar
EXEC  sp_InsertCliente 'João Silva', 'joão', 'masculino', '1989-05-05', '123456789', 'RG';
 
-- Exemplo 2: Procedure para Atualizar Innformações de produtos
 
CREATE PROCEDURE sp_AtualizarProduto
@id_produto SMALLINT,
@nomeProduto VARCHAR (100),
@valor FLOAT (5),
@descricao VARCHAR (250)
AS
BEGIN
UPDATE produto
SET nomeProduto = @nomeProduto,marca = @marca,valor = @valor,descricao = @descricao
WHERE id_produto = @id_produto;
END;
 
-- como usar
EXEC sp_AtualizarProduto 1, 'Notebook', 'Dell', 2500.00, 'Notebook Dell Inspiron 15';
 
-- exemplo 3: procedure para Consulta Pedidos por Cliente
CREATE PROCEDURE sp_ConsultarPedidosPorCliente
@id_cliente SMALLINT
AS
BEGIN
   SELECT
   p.id_pedido, p.dataVenda, p.statusVenda, p.tipoEntrega
 
  FROM
  pedido p
    WHERE
    p.id_cliente = @id_cliente;
END;
 
--Como usar
EXEC sp_ConsultarPedidosPorCliente 1;
 
--exemplo 1: Procedure para Relatorio de vendas mensais por clientes
CREATE PROCEDURE sp_RelatorioVendasMensaisPorCliente
@id_cliente SMALLINT,
@ano INT,
@mes INT
AS BEGIN
SELECT p.id_pedido, p.dataVenda, SUM(ip.valorTotal) AS TotalVendas FROM pedido p
JOIN itemPedido ip ON p.id_pedido = ip_pedido = ip.id_pedido
WHERE
p.id_cliente = @id_cliente
AND YEAR (p.dataVenda) = @ano
AND MONTH(p.dataVenda) = @mes
GROUP BY
p.id_pedido, p.dataVenda
ORDER BY
p.dataVenda;
END;
 
-- como usar
    EXEC sp_RelatorioVendasMensaisPorCliente 50, 2020, 12;
    SELECT*FROM pedido;
 
    --exemplos de Views para analistas de dados
 
    -- As Views (visões) sao como tabelas virtuais baseadas em consultas SQL pre definidas.
    -- Elas simplificam o acesso e a analise de dados para analistas,
    -- Ocultando a complexidade das juncoes e filtros.
 
    --1. View para Visualizar Clientes Ativos:
 
    CREATE VIEW vw_ClientesAtivos
    AS
    SELECT*
    FROM cliente
    WHERE dataNascimento <DATEADD(year, -18, GETDATE());
   
    --como usar
 
    SELECT*FROM vw_ClientesAtivos;
 
--2 view para unir informacoes de clientes e endereços:
    CREATE VIEW vw_ClienteEndereco
    AS
    SELECT c.nome, c.genero, e.logradouro, e.bairro, e.cidade, e.uf
    FROM cliente c
    INNER JOIN endereco e ON c.id_cliente = e.id_cliente;
 
    --como usar
    SELECT*FROM  vw_ClienteEndereco
 
    --3. View para Listar Produtos com Estoque:
    CREATE VIEW vw_ProdutosEstoque
    AS
    SELECT p.nomeProduto, p.marca, e.quantidade
    FROM produto p
    INNER JOIN estoque e ON p.id_produto = e.id_produto;
 
    --Como usar?

    SELECT*FROM vw_ProdutosEstoque;
 
    CREATE VIEW vw_ClienteUltimaCompra
    AS
    SELECT c.nome, c.genero, p.dataVenda AS DataUltimaCompra
    FROM cliente c
    INNER JOIN pedido p ON c.id_cliente = p.id_cliente
    INNER JOIN(
    SELECT id_cliente, MAX(dataVenda) AS UltimaCompra
    FROM pedido
    GROUP BY id_cliente
    ) AS ultimasCompras ON c.id_cliente = ultimasCompras.id_cliente;
 
    --Como usar
    SELECT * FROM vw_ClienteUltimaCompra