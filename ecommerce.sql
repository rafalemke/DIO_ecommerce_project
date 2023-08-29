CREATE DATABASE if not exists ecommerce;
USE ecommerce;

SHOW TABLES;
CREATE TABLE Users (
	user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Fname VARCHAR(30),
    Lname VARCHAR(30),
    username VARCHAR(45) NOT NULL UNIQUE,
    email VARCHAR(45) NOT NULL UNIQUE,
    passwrd VARCHAR(45) NOT NULL
	);
ALTER TABLE Users  ADD COLUMN user_type ENUM('PF','PJ') NOT NULL;
DESC Users;

    
CREATE TABLE Addresses (
	address_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    street VARCHAR(45),
    city VARCHAR(45),
    state CHAR(3),
    zip_code CHAR(8),
    constraint FK_address_user_id FOREIGN KEY (user_id) REFERENCES Users(user_id) 
		ON UPDATE CASCADE    
);
DESC Addresses;



CREATE TABLE Orders (
	order_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date DATE,
    total_amount FLOAT NOT NULL,
    order_status ENUM('Processing', 'Waiting payment', 'Preparing', 'Posted', 'Delivered') DEFAULT 'Processing',
    constraint FK_orders_user_id FOREIGN KEY (user_id) REFERENCES Users(user_id)
		ON UPDATE CASCADE
);
ALTER TABLE Orders ADD COLUMN tracking_code CHAR(15);
DESC Orders;

CREATE TABLE Payments (
	payment_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATE,
    payment_amount FLOAT NOT NULL,
    payment_method ENUM('Cash','Credit Card','Pix','Debit') DEFAULT 'Cash',
    constraint FK_payment_order_id FOREIGN KEY (order_id) REFERENCES Orders(order_id) 
		ON UPDATE CASCADE
);
DESC Payments;

CREATE TABLE Products(
	product_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Pname VARCHAR(45) NOT NULL,
    description VARCHAR(100),
    price FLOAT NOT NULL,
    stock_quantity INT NOT NULL
);
DESC Products;

CREATE TABLE Order_Items (
	order_item_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal FLOAT NOT NULL,
    constraint FK_Order_item_id FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON UPDATE CASCADE,
    constraint FK_Order_item_product FOREIGN KEY (product_id) REFERENCES Products(product_id) ON UPDATE CASCADE
);
DESC Order_Items;

CREATE TABLE Categories(
	category_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Cname VARCHAR(45) NOT NULL,
    description VARCHAR(100)
);
DESC Categories;

CREATE TABLE Product_Categories (
	product_id INT NOT NULL,
    category_id INT NOT NULL,
    constraint FK_PC_product_id FOREIGN KEY (product_id) REFERENCES Products(product_id) ON UPDATE CASCADE,
    constraint FK_PC_category_id FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON UPDATE CASCADE
);