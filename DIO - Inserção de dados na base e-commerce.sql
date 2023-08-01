/*
Inserção de dados na base e-commerce que faz parte do bootcamp POTÊNCIA TECH BY IFOOD | CIÊNCIA DE DADOS
oferecido pela DIO em JUL/2023.
O meu perfil profissional pode ser acessado em meu LinkedIn: https://www.linkedin.com/in/ezaro/
*/

use ecommerce;

insert into cliente (Fname, Minit, Lname, CPF, Adress)
	values  ('Maria','M','Silva','1779733889','Rua 13 de maio, 299'),
			('José','P','Silva','123456789','Avenida 44, 1009'),
			('Zac','R','Jones','55647789','Alameda das Flores, 788'),
			('Boomer','RM','Also','554678888','Rua Santa Rita, 77'),
			('San','H','Goody','00987777777','Rua das Acácias, 888'),
			('Sara','H','Gotardo','44444444','Avenida 66, 998');


-- enum('Eletrônicos','Vestimenta','Brinquedos','Alimentos','Móveis')
insert into produto (Pname, Classification_kids, Category, Avaliação, size)
	values	('Fone sem fio', false, 'Eletrônicos', '4', null),
			('Barbie Elsa', true, 'Brinquedos', '3', null),
			('Body Carters', true, 'Vestimenta', '5', null),
			('Micro Vedo', false, 'Eletrônicos', '4', null),
			('Sofá', false, 'Móveis', '3', '3x57x80'),
			('Farinha de Rosca', false, 'Alimentos', '2', null),
			('Playstation 5', false, 'Eletrônicos', '3', null);
    

-- alter table produto modify column Pname varchar(30)

insert into pedido (idPedidoCliente, pedidoStatus, pedidoDescricao, frete, pagamento)
	values  (7, default, 'compra via aplicativo', null, 1),
			(8, default, 'compra via aplicativo', 50, 0),
			(9, 'Confirmado', null, null, 1),
			(10, default, 'compra web', 150, 0);
    


insert into produtopedido (idPProduto, idPPedido, ppquantidade, ppStatus)
	values  (8,13,2,null),
			(9,13,2,null),
			(10,14,2,null);
            


insert into estoque (localestoque, quantidade)
	values  ('Roraima', 99),
			('Brasilia', 100);



insert into localestoque (idLProduto, idLEstoque, localestoque)
	values  (8,1,'RJ'),
			(9,2,'GO');



insert into fornecedor (nomefornecedor, CNPJ, contato)
	values	('Almeida & Filho', 1234567778898, '12345'),
			('Agua Verde', 234567778898, 'my fone'),
			('Matarazzo', 67778898, '18-998766');



insert into produtofornecedor (idPFornecedor, idPFProduto, quantity)
	values	(1, 8, 500),
			(1, 9, 500),
			(2, 11, 66),
			(3, 12, 5),
			(3, 9, 99),
			(2, 14, 5);
            
insert into vendedor (nomeVendedor, CNPJ, CPF, localidade, contato)
		values	('Tech Eletro', '123445677/00091', null, 'Rio de Janeiro', 210099),
				('Amilton Jones', null, null, 'Rio de Janeiro', 456666),
				('Kids Worls Trade', null, null, 'São Paulo', 3345666);


insert into produtovendedor (idPVendedor, idProduto, quantidade)
	values (2, 9, 6);
    

-- 'Boleto','Cartão','Segundo Cartão') default 'Cartão'     
insert into pagamento (idPCliente, idPagamento, tipoPagamento, limite)
	values  (11, 5, 'Cartão', 67.0),
			(8, 2, 'Cartão', 55),
			(9, 3, 'Boleto', 78.0),
			(10, 4, default, 33.0);



    
    
    
			



