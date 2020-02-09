CREATE DATABASE master_shop;
USE master_shop;

CREATE TABLE users(

	id int(255) auto_increment not null,
	name varchar(100) not null,
	surname varchar(255),
	email varchar(255) not null,
	password varchar(255) not null,
	rol varchar(20),
	image varchar(255),
    CONSTRAINT pk_user PRIMARY KEY(id),
    CONSTRAINT uq_email UNIQUE(email)
)ENGINE=InnoDb;

INSERT INTO users VALUES(NULL, 'Admin', 'Admin', 'admin@admin.com', 'contraseña', 'admin', NULL);

CREATE TABLE categories(
    id int(255) auto_increment not null,
    name varchar(100) not null,
    CONSTRAINT pk_categories PRIMARY KEY(id)
)ENGINE=InnoDb;

INSERT INTO categories VALUES(NULL, 'T-shirt');
INSERT INTO categories VALUES(NULL, 'Jumber');
INSERT INTO categories VALUES(NULL, 'Shirt');
INSERT INTO categories VALUES(NULL, 'Sweater');

CREATE TABLE products(
    id int(255) auto_increment not null,
    category_id int(255) not null,
    name varchar(100) not null,
    description text,
    price float(100,2) not null,
    stock int(255) not null,
    offer varchar(2),
    productDate date not null,
    image varchar(255),
    CONSTRAINT pk_categories PRIMARY KEY(id),
    CONSTRAINT fk_product_category FOREIGN KEY(category_id) REFERENCES categories(id)
)ENGINE=InnoDb;

CREATE TABLE orders(
    id int(255) auto_increment not null,
    user_id int(255) not null,
    state varchar(100) not null,
    city varchar(100) not null,
    street varchar(255) not null,
    total_price float(200,2) not null,
    status varchar(20) not null,
    order_date date,
    order_time time,
    CONSTRAINT pk_orders PRIMARY KEY(id),
    CONSTRAINT fk_orders_user FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;

CREATE TABLE order_line(
    id int(255) auto_increment not null,
    order_id int(255) not null,
    product_id int(255) not null,
    CONSTRAINT pk_order_line PRIMARY KEY(id),
    CONSTRAINT fk_order_line FOREIGN KEY(order_id) REFERENCES orders(id),
    CONSTRAINT fk_order_product FOREIGN KEY(product_id) REFERENCES products(id)
)ENGINE=InnoDb;

