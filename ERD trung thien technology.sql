CREATE DATABASE trung_thien_store;
USE trung_thien_store;
 
 
CREATE TABLE roles(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(15) NOT NULL
);

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL UNIQUE,
passwords TEXT NOT NULL
);


CREATE TABLE user_role(
id_role INT,
id_user INT,
PRIMARY KEY(id_role,id_user),
FOREIGN KEY (id_role) REFERENCES roles (id),
FOREIGN KEY (id_user) REFERENCES users (id)
);

CREATE TABLE customer(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
day_of_birth VARCHAR(11) NOT NULL,
gender INT NOT NULL,
address TEXT NOT NULL,
phone_number VARCHAR(11) NOT NULL UNIQUE,
image TEXT,
email VARCHAR(200) UNIQUE,
create_date	DATETIME,
update_date DATETIME,
is_delete BIT(1) NOT NULL,
user_id INT, FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orders(
id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT, FOREIGN KEY (customer_id) REFERENCES customer(id),
create_date	DATETIME
);

CREATE TABLE product_type(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL
);

CREATE TABLE brand(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL
);


CREATE TABLE product(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
price BIGINT CHECK (price >0) NOT NULL,
descriptions TEXT,
brand_id INT,FOREIGN KEY(brand_id) REFERENCES brand(id),
product_type_id INT,FOREIGN KEY(product_type_id) REFERENCES product_type(id),
quantity INT NOT NULL,
image TEXT NOT NULL,
is_delete BIT(1),
create_date	DATETIME,
update_date DATETIME
);

CREATE TABLE order_detail(
id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,FOREIGN KEY(order_id) REFERENCES orders(id),
product_id INT,FOREIGN KEY(product_id) REFERENCES product(id),
price BIGINT NOT NULL,
quantity INT,
is_delete BIT(1),
create_date	DATETIME,
update_date DATETIME
);

CREATE TABLE shopping_cart(
id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,FOREIGN KEY(customer_id) REFERENCES customer(id),
product_id INT,FOREIGN KEY(product_id) REFERENCES product(id),
quantity INT,
is_delete BIT(1)
);