CREATE DATABASE orderSwift;

USE orderSwift;

CREATE TABLE users (
	user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(30) UNIQUE NULL,
	first_name VARCHAR(30),
    last_name VARCHAR(30),
    user_shipping_address VARCHAR(50),
	user_password VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
    phone_num VARCHAR(20) NULL,
    user_email VARCHAR(50) UNIQUE
);

CREATE TABLE orders(
	order_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    order_date DATETIME NUll,
    order_status VARCHAR(10) CHECK(order_status IN('PENDING', 'ON PROCESS', 'SENT', 'DELIVERED')),
    total_amount DECIMAL(10, 2) NULL,
    foreign key (user_id) REFERENCES users (user_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE companies(
	company_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(30) NULL,
    company_address VARCHAR(50) NULL,
    company_contacts VARCHAR(50) NULL, 
    company_industry VARCHAR(30) NULL,
    company_description TEXT NULL,
    company_date_subscription DATE NULL 
);

CREATE TABLE user_company_roles (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    role VARCHAR(30) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE products(
	product_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NULL,
    product_descrip TEXT NULL,
    price DECIMAL(10, 2) NULL
);

CREATE TABLE ordersDetails(
	order_deail_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER NULL,
    unit_price DECIMAL(10, 2) NULL,
    foreign key (order_id) REFERENCES orders(order_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
    foreign key (product_id) REFERENCES products(product_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE categories(
	category_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NULL,
    INDEX idx_category_name (category_name)
);


CREATE TABLE transactions(
	transaction_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    order_id INTEGER,
    transactions_date DATETIME NULL,
    amount DECIMAL(10, 2) NULL,
    payment_method VARCHAR(15),
    foreign key (order_id) REFERENCES orders(order_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
    INDEX idx_order_id (order_id)
);

CREATE TABLE products_categories(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	category_id INTEGER,
    product_id INTEGER,
    foreign key (category_id) REFERENCES categories(category_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
    foreign key (product_id) REFERENCES products(product_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE transactions_users(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    transaction_id INTEGER,
    foreign key (transaction_id) REFERENCES transactions(transaction_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
    foreign key (user_id) REFERENCES users (user_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);
