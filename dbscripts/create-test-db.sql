DROP DATABASE IF EXISTS ecomerce_test;

CREATE DATABASE ecomerce_test;

USE ecomerce_test;

CREATE TABLE IF NOT EXISTS example_table (
  id INT NOT NULL AUTO_INCREMENT,
  field1 VARCHAR(255) NOT NULL,
  PRIMARY KEY(id)
);


-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.12 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla ecomerce.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `total` decimal(10,0) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK_orders_user` (`userId`),
  CONSTRAINT `FK_orders_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce.products
CREATE TABLE IF NOT EXISTS `products` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `oldPrice` decimal(10,0) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `image` text NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce.productsbycategories
CREATE TABLE IF NOT EXISTS `productsbycategories` (
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  KEY `FK_productsbycategories_products` (`productId`),
  KEY `FK_productsbycategories_categories` (`categoryId`),
  CONSTRAINT `FK_productsbycategories_categories` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryid`),
  CONSTRAINT `FK_productsbycategories_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce.productsbyorders
CREATE TABLE IF NOT EXISTS `productsbyorders` (
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `FK_productsbyorders_products` (`productId`),
  KEY `FK_productsbyorders_orders` (`orderId`),
  CONSTRAINT `FK_productsbyorders_orders` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `FK_productsbyorders_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce.user
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce.wishlist
CREATE TABLE IF NOT EXISTS `wishlist` (
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  KEY `FK_wishlist_products` (`productId`),
  KEY `userId_productId` (`userId`),
  CONSTRAINT `FK_wishlist_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productid`),
  CONSTRAINT `FK_wishlist_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
