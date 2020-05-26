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
  `sh_enabled` varchar(1) NOT NULL,
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
  `us_fk` int(11) NOT NULL,
  `sh_fk` int(11) NOT NULL,
  PRIMARY KEY (`us_fk`,`sh_fk`),
  KEY `shop_id` (`sh_fk`),
  CONSTRAINT `su_shop_user_ibfk_1` FOREIGN KEY (`us_fk`) REFERENCES `us_users` (`id`),
  CONSTRAINT `su_shop_user_ibfk_2` FOREIGN KEY (`sh_fk`) REFERENCES `sh_shops` (`id`)
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
-- Table structure for table `ur_user_roles`
--

DROP TABLE IF EXISTS `ur_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ur_user_roles` (
  `us_fk` int(11) NOT NULL,
  `ro_fk` int(11) NOT NULL,
  `sh_fk` int(11) NOT NULL,
  PRIMARY KEY (`us_fk`,`ro_fk`),
  KEY `role_id` (`ro_fk`),
  KEY `sh_fk` (`sh_fk`),
  CONSTRAINT `ur_user_roles_ibfk_1` FOREIGN KEY (`us_fk`) REFERENCES `us_users` (`id`),
  CONSTRAINT `ur_user_roles_ibfk_2` FOREIGN KEY (`ro_fk`) REFERENCES `ro_roles` (`id`),
  CONSTRAINT `ur_user_roles_ibfk_3` FOREIGN KEY (`sh_fk`) REFERENCES `sh_shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ur_user_roles`
--

LOCK TABLES `ur_user_roles` WRITE;
/*!40000 ALTER TABLE `ur_user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ur_user_roles` ENABLE KEYS */;
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
  `us_enabled` varchar(1) NOT NULL,
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

-- Dump completed on 2020-05-26 16:00:17
