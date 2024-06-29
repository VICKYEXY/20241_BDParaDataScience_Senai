USE comercio;

CREATE TABLE cliente(
id_cliente SMALLINT IDENTITY PRIMARY KEY,
nome VARCHAR(150)NOT NULL,
nomeSocial VARCHAR(150),
genero VARCHAR(15) NOT NULL,
dataNascimento DATE NOT NULL,
documento VARCHAR(18) NOT NULL,
tipoDocumento VARCHAR(2) NOT NULL
);
select*FROM cliente;

CREATE TABLE  fornecedor(
id_fornecedor SMALLINT IDENTITY PRIMARY KEY,
nomeFornecedor VARCHAR(150) NOT NULL,
cnpj VARCHAR(20) NOT NULL
);
select*FROM fornecedor;

CREATE TABLE categoria(
id_categoria SMALLINT IDENTITY PRIMARY KEY,
nomeCategoria VARCHAR (30) NOT NULL
);
select*FROM categoria;

CREATE TABLE contato(
id_contato SMALLINT IDENTITY PRIMARY KEY,
id_cliente SMALLINT,
id_fornecedor SMALLINT,
telefone VARCHAR(15),
celular VARCHAR(18),
email VARCHAR(150),
CONSTRAINT fk_contato_cliente FOREIGN KEY (id_cliente)
REFERENCES fornecedor (id_fornecedor)
);
select*FROM contato;

CREATE TABLE endereco(
id_endereco SMALLINT IDENTITY PRIMARY KEY,
logradouro VARCHAR(150) NOT NULL,
numero VARCHAR(100) NOT NULL,
complemento VARCHAR(100),
bairro VARCHAR(100) NOT NULL,
cidade VARCHAR(60) NOT NULL,
uf VARCHAR(4) NOT NULL,
cep VARCHAR(12) NOT NULL,
id_cliente SMALLINT,
id_fornecedor SMALLINT,
CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente),
CONSTRAINT fk_endereco_fornecedor FOREIGN KEY (id_fornecedor)
REFERENCES fornecedor(id_fornecedor)
);
select*FROM endereco;

CREATE TABLE produto(
id_produto SMALLINT IDENTITY PRIMARY KEY,
id_categoria SMALLINT,
id_fornecedor SMALLINT,
nomeProduto VARCHAR (100),
marca VARCHAR(100),
valor FLOAT (5),
descricao VARCHAR(250),
CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria)
REFERENCES categoria (id_categoria),
CONSTRAINT fk_produto_fornecedor FOREIGN KEY (id_fornecedor)
REFERENCES fornecedor (id_fornecedor)
);
select*FROM produto;

CREATE TABLE estoque(
id_estoque SMALLINT IDENTITY PRIMARY KEY,
id_produto SMALLINT,
quantidade INT,
valorTotal FLOAT(5),
CONSTRAINT fk_estoque_produto FOREIGN KEY (id_produto)
REFERENCES produto (id_produto)
);
select*FROM estoque;

CREATE TABLE pedido(
id_pedido SMALLINT IDENTITY PRIMARY KEY,
id_cliente SMALLINT NOT NULL,
DataVenda DATE NOT NULL,
statusVenda VARCHAR(20),
tipoEntrega VARCHAR(20)
);
select*FROM pedido;

CREATE TABLE ItemPedido(
id_ItemPedido SMALLINT IDENTITY PRIMARY KEY,
id_pedido SMALLINT,
id_produto SMALLINT,
quantidade INT,
valorUnitario FLOAT (5),
valorTotal FLOAT (5)
);
select*FROM ItemPedido;