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
-- Table structure for table `cu_customers`
--

DROP TABLE IF EXISTS `cu_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cu_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `cu_fname` varchar(100) NOT NULL,
  `cu_lname` varchar(100) NOT NULL,
  `cu_email` varchar(100) NOT NULL,
  `cu_city` varchar(100) NOT NULL,
  `cu_region` varchar(100) NOT NULL,
  `cu_phone` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cu_customers`
--

LOCK TABLES `cu_customers` WRITE;
/*!40000 ALTER TABLE `cu_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cu_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `od_order_details`
--

DROP TABLE IF EXISTS `od_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `od_order_details` (
  `fk_product_order` int(11) NOT NULL,
  `fk_order_product` int(11) NOT NULL,
  PRIMARY KEY (`fk_product_order`,`fk_order_product`),
  KEY `order_id` (`fk_order_product`),
  CONSTRAINT `od_order_details_ibfk_1` FOREIGN KEY (`fk_product_order`) REFERENCES `pr_products` (`id`),
  CONSTRAINT `od_order_details_ibfk_2` FOREIGN KEY (`fk_order_product`) REFERENCES `or_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_order_details`
--

LOCK TABLES `od_order_details` WRITE;
/*!40000 ALTER TABLE `od_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `od_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `or_orders`
--

DROP TABLE IF EXISTS `or_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `or_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `or_number` int(11) NOT NULL,
  `or_date` date NOT NULL,
  `or_price` int(11) NOT NULL,
  `or_quantity` int(11) NOT NULL,
  `fk_customer_order` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`fk_customer_order`),
  CONSTRAINT `or_orders_ibfk_1` FOREIGN KEY (`fk_customer_order`) REFERENCES `cu_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `or_orders`
--

LOCK TABLES `or_orders` WRITE;
/*!40000 ALTER TABLE `or_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `or_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_products`
--

DROP TABLE IF EXISTS `pr_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pr_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `pr_name` varchar(100) NOT NULL,
  `pr_price` int(11) NOT NULL,
  `pr_quantity` int(11) NOT NULL,
  `pr_category` varchar(100) NOT NULL,
  `pr_image` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `product_supplier_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`product_supplier_id`),
  CONSTRAINT `pr_products_ibfk_1` FOREIGN KEY (`product_supplier_id`) REFERENCES `sh_shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_products`
--

LOCK TABLES `pr_products` WRITE;
/*!40000 ALTER TABLE `pr_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ro_roles`
--

DROP TABLE IF EXISTS `ro_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ro_roles` (
  `id` int(11) NOT NULL,
  `rn_role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ro_roles`
--

LOCK TABLES `ro_roles` WRITE;
/*!40000 ALTER TABLE `ro_roles` DISABLE KEYS */;
INSERT INTO `ro_roles` VALUES (0,'ADMIN'),(1,'USER');
/*!40000 ALTER TABLE `ro_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_shops`
--

DROP TABLE IF EXISTS `sh_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `sh_name` varchar(50) NOT NULL,
  `sh_enabled` varchar(10) NOT NULL,
  `sh_icon` varchar(50) NOT NULL,
  `sh_description` varchar(150) NOT NULL,
  `sh_tag` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_shops`
--

LOCK TABLES `sh_shops` WRITE;
/*!40000 ALTER TABLE `sh_shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `su_shop_user`
--

DROP TABLE IF EXISTS `su_shop_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `su_shop_user` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`shop_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `su_shop_user_ibfk_1` FOREIGN KEY (`id`) REFERENCES `us_users` (`id`),
  CONSTRAINT `su_shop_user_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `sh_shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `su_shop_user`
--

LOCK TABLES `su_shop_user` WRITE;
/*!40000 ALTER TABLE `su_shop_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `su_shop_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_user_roles`
--

DROP TABLE IF EXISTS `us_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `us_user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `us_user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `us_users` (`id`),
  CONSTRAINT `us_user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `ro_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_user_roles`
--

LOCK TABLES `us_user_roles` WRITE;
/*!40000 ALTER TABLE `us_user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `us_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_users`
--

DROP TABLE IF EXISTS `us_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `us_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) NOT NULL,
  `us_fname` varchar(50) NOT NULL,
  `us_lname` varchar(50) NOT NULL,
  `us_email` varchar(50) NOT NULL,
  `us_username` varchar(50) NOT NULL,
  `us_password` varchar(50) NOT NULL,
  `us_enabled` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_users`
--

LOCK TABLES `us_users` WRITE;
/*!40000 ALTER TABLE `us_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `us_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-25 23:07:58
