/*
Criação do banco de dados e-commerce que faz parte do bootcamp POTÊNCIA TECH BY IFOOD | CIÊNCIA DE DADOS
oferecido pela DIO em JUL/2023.
O meu perfil profissional pode ser acessado em meu LinkedIn: https://www.linkedin.com/in/ezaro/
*/

create database ecommerce;
-- show databases;
 use ecommerce;
-- drop database ecommerce;

-- Criação da Tabela cliente

create table cliente(
	idCliente int auto_increment primary key,
	Fname varchar(10),
	Minit char(3),
    Lname varchar(20),
	CPF char(11) not null,
    Adress varchar(30),
    constraint unique_cpf_cliente unique (CPF)
);

alter table cliente auto_increment = 1;

-- Criação da Tabela produto
	
create table produto(
	idProduto int auto_increment primary key,
	Pname varchar(10) not null ,
	Classification_kids bool default false,
    Category enum('Eletrônicos','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    Avaliação float default 0,
    size varchar(10)
);

-- Criação da Tabela Pagamentos

create table pagamento(
	idPCliente int,
    idPagamento int auto_increment,
    tipoPagamento enum('Boleto','Cartão','Segundo Cartão') default 'Cartão' ,
    limite float,
	primary key(idPagamento),
    constraint fk_pagamento_cliente foreign key (idPCliente) references Cliente (idCliente)
);

-- Criação da Tabela Pedido

create table pedido(
	idPedido int auto_increment primary key,
    idPedidoCliente int,
    pedidoStatus enum('Cancelado','Confirmado','','Processando') default 'Processando',
    pedidoDescricao varchar(255),
	frete float default 0,
    pagamento boolean default false,
	constraint fk_pedido_cliente foreign key (idPedidoCliente) references Cliente (idCliente) on update cascade
);

-- Criação da Tabela estoque

create table estoque(
	idEstoque int auto_increment primary key,
    localEstoque varchar(45),
	quantidade int default 0
);

-- Criação da Tabela fornecedor

create table fornecedor(
	idFornecedor int auto_increment primary key,
    nomefornecedor varchar(255) not null,
    CNPJ char(15) not null,
	contato char(11) not null,
	constraint unico_fornecedor unique (CNPJ)
);

-- Criação da tabela vendedor

create table vendedor(
	idVendedor int auto_increment primary key,
	nomeVendedor varchar(255) not null,
	CNPJ char(15),
    CPF char(9),
    localidade varchar(255),
    contato char(11) not null,
    constraint unico_vendedor_cnpj unique (CNPJ),
    constraint unico_vendedor_cpf unique (CPF)
);

-- Criação da tabela produtovendedor

create table produtovendedor (
	idPVendedor int,
    idProduto int,
    quantidade int default 1,
    primary key (idPVendedor, idProduto),
	constraint fk_produto_vendedor foreign key (idPVendedor) references vendedor (idVendedor),
    constraint fk_produto_produto foreign key (idProduto) references produto (idProduto)
);

-- Criação da tabela produtoOrdem

create table produtoPedido (
	idPProduto int,
    idPPedido int,
    ppquantidade int default 1,
    ppStatus enum ('Disponível','Sem estoque') default 'Disponível',
    primary key (idPProduto, idPPedido),
	constraint fk_produtopedido_vendedor foreign key (idPProduto) references produto (idProduto),
    constraint fk_produtopedido_produto foreign key (idPPedido) references pedido (idPedido)
);

-- Criação da tabela localEstoque

create table localEstoque (
	idLProduto int,
    idLEstoque int,
    localestoque varchar(255) not null,
    primary key (idLProduto, idLEstoque),
	constraint fk_local_estoque_produto foreign key (idLProduto) references produto (idProduto),
    constraint fk_local_estoque_estoque foreign key (idLEstoque) references estoque (idEstoque)
);

-- Criação da tabela produtoFornecedor

create table produtoFornecedor (
	idPFornecedor int,
    idPFProduto int,
    quantity int not null,
    primary key (idPFornecedor, idPFProduto),
	constraint fk_produto_fornecedor_fornecedor foreign key (idPFornecedor) references fornecedor (idFornecedor),
    constraint fk_produto_fornecedor_produto foreign key (idPFProduto) references produto (idProduto)
);



