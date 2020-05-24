-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: DatabaseDesignSample
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cu_Customers`
--

DROP TABLE IF EXISTS `Cu_Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cu_Customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_fname` varchar(100) NOT NULL,
  `customer_lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cu_Customers`
--

LOCK TABLES `Cu_Customers` WRITE;
/*!40000 ALTER TABLE `Cu_Customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cu_Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Details`
--

DROP TABLE IF EXISTS `Order_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Details` (
  `fk_product_order` int(11) NOT NULL,
  `fk_order_product` int(11) NOT NULL,
  PRIMARY KEY (`fk_product_order`,`fk_order_product`),
  KEY `order_id` (`fk_order_product`),
  CONSTRAINT `Order_Details_ibfk_1` FOREIGN KEY (`fk_product_order`) REFERENCES `Prod_Products` (`product_id`),
  CONSTRAINT `Order_Details_ibfk_2` FOREIGN KEY (`fk_order_product`) REFERENCES `Orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Details`
--

LOCK TABLES `Order_Details` WRITE;
/*!40000 ALTER TABLE `Order_Details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `fk_customer_order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`fk_customer_order`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`fk_customer_order`) REFERENCES `Cu_Customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prod_Products`
--

DROP TABLE IF EXISTS `Prod_Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prod_Products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `image` longblob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `product_supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `supplier_id` (`product_supplier_id`),
  CONSTRAINT `Prod_Products_ibfk_1` FOREIGN KEY (`product_supplier_id`) REFERENCES `Supplier_Shop` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prod_Products`
--

LOCK TABLES `Prod_Products` WRITE;
/*!40000 ALTER TABLE `Prod_Products` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prod_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier_Shop`
--

DROP TABLE IF EXISTS `Supplier_Shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier_Shop` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) NOT NULL,
  `shop_phone` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier_Shop`
--

LOCK TABLES `Supplier_Shop` WRITE;
/*!40000 ALTER TABLE `Supplier_Shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supplier_Shop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-24  9:25:28
