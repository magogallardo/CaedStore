DROP DATABASE IF EXISTS store;

CREATE DATABASE IF NOT EXISTS store;

USE store;

CREATE TABLE user
(
 	user_id INT NOT NULL AUTO_INCREMENT,
 	name NVARCHAR(15) NOT NULL,
 	last_name NVARCHAR(15) NOT NULL,
 	email NVARCHAR(50) NOT NULL,
 	phone NVARCHAR(14) NOT NULL,
 	user_name NVARCHAR(15) NOT NULL,
 	password NVARCHAR(15) NOT NULL,
    PRIMARY KEY(user_id)
);

CREATE TABLE address
(
    address_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 	user_id INT NOT NULL REFERENCES user(user_id),
 	name NVARCHAR(15) NOT NULL,
 	street NVARCHAR(15) NOT NULL,
 	suburb NVARCHAR (50) NOT NULL,
 	ext_number NVARCHAR(10) NOT NULL,
 	int_number NVARCHAR(10),
 	postal_code NVARCHAR(10) NOT NULL,
    city NVARCHAR(20) NOT NULL,
    state NVARCHAR(20) NOT NULL,
    country NVARCHAR(20) NOT NULL,
    billing INT REFERENCES billing(billing_id),
    payment INT REFERENCES payment(payment_id)
);

CREATE TABLE payment
(
    payment_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL REFERENCES user(user_id),
    name NVARCHAR(15) NOT NULL,
    last_name NVARCHAR(15) NOT NULL,
    number_card NVARCHAR(16) NOT NULL,
 	expiration_date NVARCHAR(5) NOT NULL,
 	security_number NVARCHAR(3) NOT NULL,
 	bank NVARCHAR(10) NOT NULL,
    PRIMARY KEY (payment_id)
);

CREATE TABLE billing
(
 	billing_id INT NOT NULL AUTO_INCREMENT,
    name NVARCHAR(15) NOT NULL,
 	last_name NVARCHAR(15) NOT NULL,
    RFC NVARCHAR(14) NOT NULL,
 	email NVARCHAR (50) NOT NULL,
 	phone NVARCHAR(14) NOT NULL,
    PRIMARY KEY(billing_id)
);

CREATE TABLE item
(
 	item_id INT NOT NULL AUTO_INCREMENT,
 	name NVARCHAR(15) NOT NULL,
 	descr NVARCHAR(50) NOT NULL,
    brand NVARCHAR(50) NOT NULL,
    pieces NVARCHAR(50) NOT NULL,
    category NVARCHAR(50) NOT NULL,
 	quantity NVARCHAR(50) NOT NULL,
 	price NVARCHAR(10) NOT NULL,
    discount NVARCHAR(4) NOT NULL,
    PRIMARY KEY(item_id)
);

CREATE TABLE image
(
    image_id INT NOT NULL AUTO_INCREMENT,
 	item_id INT NOT NULL REFERENCES item(item_id),
 	link NVARCHAR(255) NOT NULL,
    PRIMARY KEY(image_id)
);

CREATE TABLE cart
(
    cart_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL REFERENCES user(user_id),
    subtotal NVARCHAR(50) NOT NULL,
    PRIMARY KEY(cart_id)
);

CREATE TABLE cart_item
(
    cart_id INT NOT NULL REFERENCES cart(cart_id),
    item_id INT NOT NULL REFERENCES item(item_id),
    quantity NVARCHAR(50) NOT NULL,
    PRIMARY KEY(cart_id, item_id)
);

CREATE TABLE orderr
(   
    order_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL REFERENCES user(user_id),
    order_date DATETIME NOT NULL,
    total NVARCHAR(10) NOT NULL,
    shipping NVARCHAR(10) NOT NULL,
    shipping_price NVARCHAR(10) NOT NULL,
    PRIMARY KEY(order_id)
);


CREATE TABLE item_order
(
    order_id INT NOT NULL REFERENCES orderr(order_id),
    item_id INT NOT NULL REFERENCES item(item_id),
    quantity NVARCHAR(50) NOT NULL,
    PRIMARY KEY(order_id, item_id)
);
