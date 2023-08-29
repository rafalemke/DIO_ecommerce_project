USE ecommerce;

-- Nome do produto, preço, quantidade no estoque e categoria do produto
SELECT Pname as Name, price, stock_quantity, Cname as Category FROM products p 
	INNER JOIN product_categories pc ON p.product_id = pc.product_id
	INNER JOIN categories c ON pc.category_id = c.category_id 
    ORDER BY stock_quantity desc;
                         

-- Quantidade de pedidos realizado por cada usuário
SELECT u.user_id, CONCAT(Fname, ' ', Lname) AS Name, COUNT(*) AS Number_of_orders FROM Users u, Orders o 
	WHERE u.user_id = o.user_id 
    GROUP BY user_id;

-- Retorna historico de pedidos ordenados por data
SELECT users.user_id, Fname, Lname, order_date, total_amount, order_status from orders
	LEFT JOIN users on users.user_id = orders.user_id
    ORDER BY order_date;


-- Retornar a lista de pedidos que já foram entregues
SELECT * FROM orders 
	NATURAL JOIN Users
    HAVING order_status = 'Delivered';
    

-- Retorna O total gasto por cada usuário e a quantidade de pedidos realizados
SELECT u.user_id, CONCAT(Fname,' ',Lname) AS NAME, email, ROUND(SUM(total_amount),2) AS total_spent, COUNT(*) AS num_of_orders FROM users u 
	JOIN Orders o on u.user_id = o.user_id
    GROUP BY user_id
    ORDER BY total_Spent DESC;

-- Retorna uma lista com os usuários que ja tiveram seus pedidos enviados
SELECT o.order_id, o.user_id, CONCAT(Fname,' ', Lname) AS Name, o.order_status, order_date, o.tracking_code  FROM Orders o
	 LEFT JOIN Users u on u.user_id = o.user_id
     WHERE o.tracking_code <> 'null'
     ORDER BY order_date;


