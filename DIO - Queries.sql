/*
Inserção de dados na base e-commerce que faz parte do bootcamp POTÊNCIA TECH BY IFOOD | CIÊNCIA DE DADOS
oferecido pela DIO em JUL/2023.
O meu perfil profissional pode ser acessado em meu LinkedIn: https://www.linkedin.com/in/ezaro/
*/

use ecommerce;

/*
show databases;
use information_schema;
use ecommerce;
show tables;

select * from referential_constraints where constraint_schema = 'ecommerce';
*/  

    
-- 1) Quantos pedidos foram feitos por cada cliente?

select FName as Nome, count(*) idPedidoCliente from cliente c
	left outer join pedido on idCliente = idPedidoCliente
    group by Fname;


-- 2) Algum vendedor também é fornecedor?
-- Não existe uma foreing key que se relacione entre as duas tabelas [vendedor] e [fornecedor], sendo improvável
-- ter a relação de ambos, sendo assim cada categoria fica em sua respectiva função.


-- 3) Relação de Produtos, fornecedores e estoque.

select Pname as 'Produto', nomeFornecedor as 'Fornecedor', localestoque from produtofornecedor pf
	join produto p
		on pf.idPFProduto = p.idProduto
	join localestoque l
		on p.idProduto = l.idLProduto  
	join fornecedor f
		on f.idFornecedor = pf.idPFornecedor
;


-- 4) Relação de nome dos fornecedores e produtos.

select nomefornecedor as 'Nome Fornecedor', Pname as 'Nome do Produto' from fornecedor, produto
	left outer join produtofornecedor on idPFProduto = idPFornecedor;
