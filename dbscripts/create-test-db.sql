-- Volcando estructura de base de datos para ecomerce
DROP DATABASE IF EXISTS ecomerce_test;
CREATE DATABASE IF NOT EXISTS ecomerce_test;
USE ecomerce_test;

CREATE TABLE IF NOT EXISTS example_table (
  id INT NOT NULL AUTO_INCREMENT,
  field1 VARCHAR(255) NOT NULL,
  PRIMARY KEY(id)
);

-- Volcando estructura para tabla ecomerce.categories
CREATE TABLE IF NOT EXISTS categories (
  categoryId int(11) NOT NULL AUTO_INCREMENT,
  name varchar(80) NOT NULL,
  PRIMARY KEY (categoryId)
);

-- Volcando datos para la tabla ecomerce.categories: ~0 rows (aproximadamente)
DELETE FROM categories;

-- Volcando estructura para tabla ecomerce.user
CREATE TABLE IF NOT EXISTS user (
  userId int(11) NOT NULL AUTO_INCREMENT,
  password varchar(100) NOT NULL,
  email varchar(200) NOT NULL,
  name varchar(200) NOT NULL,
  active tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (userId),
  UNIQUE KEY email(email)
);

-- Volcando datos para la tabla ecomerce.user: ~0 rows (aproximadamente)
DELETE FROM user;

-- Volcando estructura para tabla ecomerce.orders
CREATE TABLE IF NOT EXISTS orders (
  orderId int(11) NOT NULL AUTO_INCREMENT,
  userId int(11) NOT NULL DEFAULT '0',
  total decimal(10,0) NOT NULL DEFAULT '0',
  date date NOT NULL,
  PRIMARY KEY (orderId),
  FOREIGN KEY (userId) REFERENCES user (userid)
);

-- Volcando datos para la tabla ecomerce.orders: ~0 rows (aproximadamente)
DELETE FROM orders;

-- Volcando estructura para tabla ecomerce.products
CREATE TABLE IF NOT EXISTS products (
  productId int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  description varchar(100) NOT NULL,
  price decimal(10,0) NOT NULL,
  oldPrice decimal(10,0) NOT NULL,
  active tinyint(3) unsigned NOT NULL DEFAULT '1',
  image text NOT NULL,
  PRIMARY KEY (productId)
);

-- Volcando datos para la tabla ecomerce.products: ~0 rows (aproximadamente)
DELETE FROM products;

-- Volcando estructura para tabla ecomerce.productsbycategories
CREATE TABLE IF NOT EXISTS productsbycategories (
  productId int(11) NOT NULL,
  categoryId int(11) NOT NULL,
  FOREIGN KEY (categoryId) REFERENCES categories (categoryid),
  FOREIGN KEY (productId) REFERENCES products (productid)
);

-- Volcando datos para la tabla ecomerce.productsbycategories: ~0 rows (aproximadamente)
DELETE FROM productsbycategories;

-- Volcando estructura para tabla ecomerce.productsbyorders
CREATE TABLE IF NOT EXISTS productsbyorders (
  productId int(11) NOT NULL,
  orderId int(11) NOT NULL,
  quantity int(11) NOT NULL,
  FOREIGN KEY (orderId) REFERENCES orders (orderid),
  FOREIGN KEY (productId) REFERENCES products (productid)
);

-- Volcando datos para la tabla ecomerce.productsbyorders: ~0 rows (aproximadamente)
DELETE FROM productsbyorders;

-- Volcando estructura para tabla ecomerce.wishlist
CREATE TABLE IF NOT EXISTS wishlist (
  userId int(11) NOT NULL,
  productId int(11) NOT NULL,
  FOREIGN KEY (productId) REFERENCES products (productid),
  FOREIGN KEY (userId) REFERENCES user (userid)
);

-- Volcando datos para la tabla ecomerce.wishlist: ~0 rows (aproximadamente)
DELETE FROM wishlist;
