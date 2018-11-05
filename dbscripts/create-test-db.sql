-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.10-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para ecomerce_test
DROP DATABASE IF EXISTS `ecomerce_test`;
CREATE DATABASE IF NOT EXISTS `ecomerce_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecomerce_test`;

-- Volcando estructura para tabla ecomerce_test.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce_test.example_table
DROP TABLE IF EXISTS `example_table`;
CREATE TABLE IF NOT EXISTS `example_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field1` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce_test.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `total` decimal(10,0) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce_test.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `oldPrice` decimal(10,0) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `image` text NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce_test.productsbycategories
DROP TABLE IF EXISTS `productsbycategories`;
CREATE TABLE IF NOT EXISTS `productsbycategories` (
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  KEY `categoryId` (`categoryId`),
  KEY `productId` (`productId`),
  CONSTRAINT `productsbycategories_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`),
  CONSTRAINT `productsbycategories_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce_test.productsbyorders
DROP TABLE IF EXISTS `productsbyorders`;
CREATE TABLE IF NOT EXISTS `productsbyorders` (
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `productsbyorders_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `productsbyorders_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce_test.user
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla ecomerce_test.wishlist
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  KEY `productId` (`productId`),
  KEY `userId` (`userId`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
