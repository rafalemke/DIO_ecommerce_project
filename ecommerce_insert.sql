SHOW DATABASES;
USE ecommerce;
SHOW TABLES;
DESC users;

INSERT INTO users(Fname,Lname,username,email,passwrd,user_type)
            VALUES('Matheus', 'Pimentel', 'matheuspimtl', 'matheuspimtl@123.com', 192833321, 'PF'),
				  ('Ricardo', 'Silva', 'ricsilva', 'ricsilva@123.com', 08748201, 'PF'),
                  ('Julia', 'Franca', 'jufranca', 'jufranca@123.com', 991992873, 'PJ'),
                  ('Caio', 'Gonçalves', 'caiogonçalves', 'caiogonçalves@123.com', 859192332, 'PF'),
                  ('Roberta', 'Assis', 'robertaas', 'robertaas@123.com', 11239832, 'PF'),
                  ('Isabela', 'Cruz', 'isacruz', 'isacruz@123.com', 123909742, 'PJ'),
                  ('Rafael', 'Lemke', 'rafaellmk', 'rafaellmk@123.com', 06828391, 'PF'),
                  ('Gabriel', 'Cavalcanti', 'Gabrielcava', 'Gabrielcava@123.com', 11199321, 'PF');
                  
                  
                  
DESC Addresses;
INSERT INTO Addresses(user_id, street, city, state, zip_code) VALUES 
				(8, 'Rua ABC', 'Recife', 'PE', 52139123),
                (3, 'Rua DEF', 'Caruaru', 'PE', 52133323),
                (1, 'Avenida FGH', 'São Paulo', 'SP', 44239123);
                (1, 'Estrada JHGS', 'Salvador', 'BA', 52134423),
                (5, 'Avenida NNBVC', 'Belo Horizonte', 'MG', 52122134),
                (2, 'Rua OIUAA', 'Recife', 'PE', 44239123),
                (7, 'Rua DEF', 'Caruaru', 'PE', 52133323),
                (8, 'Avenida FGH', 'São Paulo', 'SP', 44239123),
                (9, 'Rua QWER', 'Rio Grande do Sul', 'RS', 33212341);
                
SELECT * FROM addresses;

DESC orders;
INSERT INTO orders(user_id, order_date, total_amount, order_status, tracking_code) VALUES
			(9, '2023-01-05', 65.30,'Processing', null),
            (5, '2023-01-14', 16.99,'Waiting payment', null),
            (1, '2023-01-24', 55.99,'Posted','BR192384918283R'),
            (3, '2023-02-24', 89.99,'Posted', 'BR191223918283R'),
            (7, '2023-01-04', 125.15,'Waiting payment', null),
            (6, '2023-05-18', 255.99,'Preparing', null),
            (2, '2023-05-24', 149.99,'Posted', 'BR112223918283R'),
            (9, '2023-6-12', 899.90,'Delivered','BR112223911283R'),
            (2, '2023-3-30', 19.99,'Waiting payment', null),
            (6, '2023-08-14', 75.89,'Waiting payment', null),
            (7, '2023-07-21', 212.99,'Preparing', null),
            (5, '2023-09-14', 250.99,'Posted', 'BR191233218283R'),
            (1, '2023-03-14', 365.99,'Delivered','BR112223181283R');
            
SELECT * FROM orders;

DESC Payments;
 -- payment_id  order_id  payment_date  payment_amount  payment_method  
INSERT INTO Payments (order_id, payment_date, payment_amount, payment_method) VALUES 
		(6,'2023-01-24', 55.99, 'Pix'),
        (7,'2023-02-24', 50.00, 'Cash'),
        (7,'2023-02-24', 39.99, 'Credit Card'),
        (9,'2023-05-18', 255.99, 'Credit Card'),
        (10,'2023-05-24','149.99', 'Credit Card'),
        (11,'2023-06-12','500.00', 'Debit'),
        (11,'2023-06-12','399.9', 'Credit Card'),
        (14,'2023-07-21','212.99', 'Pix'),
        (15,'2023-09-14','250.99', 'Debit'),
        (16,'2023-03-14','365.99', 'Credit Card');
        
SELECT * FROM payments;


DESC Products;
-- product_id  Pname  description  price  stock_quantity
INSERT INTO Products(Pname, description, price, stock_quantity) VALUES
		('Caderno', 'Caderno marca X.', 16.99, 50),
        ('Ventilador', 'Ventilador marca X.', 65.30, 15),
        ('Travesseiro', null, 55.99, 10),
        ('Cafeteira', null, 89.99, 8),
        ('Mochila', null, 125.15, 3),
        ('Memória DDR4 8gb', 'Memoria DDR4 8GB marca X', 255.99, 6),
        ('Jogo de panelas', null, 149.99, 2),
        ('Frigobar', null, 899.9, 2),
        ('Kit Canetas', 'Kit Com canetas marca X', 19.99, 7),
        ('Camisa', 'Camisa Masculina tamanho P', 75.89, 13),
        ('Oculos de sol', null, 212.99, 3),
        ('Mouse sem fio', null, 250.99, 5),
        ('Headset Bluetooth', null, 365.99, 1),
        ('Pen Drive 8gb', null, 25.39, 6),
        ('Livro', 'Livro X editora Y', 163.99, 3);
        
SELECT * FROM Products;

DESC order_items;
-- order_item_id  order_id  product_id  quantity subtotal

INSERT INTO order_items(order_id, product_id, quantity, subtotal) VALUES 
		(1, 14, 1, 25.39),
        (2, 15, 1, 163.99),
        (3, 2, 1, 65.3),
        (4, 2, 1, 65.3),
        (5, 1, 1, 16.99),
        (6, 3, 1, 55.99),
        (7, 4, 1, 89.99),
        (8, 5, 1, 125.15),
        (9, 6, 1, 255.99),
        (10, 7, 1, 149.99),
        (11, 8, 1, 899.9),
        (12, 9, 1, 19.99),
        (13, 10, 1, 75.89),
        (14, 11, 1, 212.99),
        (15, 12, 1, 250.99),
        (16, 13, 1, 365.99);

SELECT * FROM order_items;


DESC categories;
INSERT INTO categories(Cname, description) VALUES 
		('Estudos', 'Materiais escolares e relacionados a estudos'),
        ('Eletrodomésticos', 'Equipamentos elétricos em geral'),
        ('Cama, mesa e banho', null),
        ('Acessórios', 'Acessórios em geral'),
        ('Eletrônicos', 'Aparelhos eletrônicos em geral'),
        ('Cozinha', 'Utensilios de cozinha');
        
SELECT * FROM categories;
        

DESC product_categories;

INSERT INTO product_categories(product_id, category_id) VALUES 
			(1,1),
            (2,2),
            (3,3),
            (4,2),
            (5,4),
            (6,5),
            (7,6),
            (8,2),
            (9,1),
            (10,4),
            (11,4),
            (12,5),
            (13,5),
            (14,5),
            (15,1);
            


