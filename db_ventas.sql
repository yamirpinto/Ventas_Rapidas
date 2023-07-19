CREATE DATABASE  IF NOT EXISTS `db_ventas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_ventas`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ventas
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autenticacion_customuser`
--

DROP TABLE IF EXISTS `autenticacion_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacion_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `carro_compras_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `carro_compras_id` (`carro_compras_id`),
  CONSTRAINT `autenticacion_custom_carro_compras_id_fc940695_fk_ventas_co` FOREIGN KEY (`carro_compras_id`) REFERENCES `ventas_compra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacion_customuser`
--

LOCK TABLES `autenticacion_customuser` WRITE;
/*!40000 ALTER TABLE `autenticacion_customuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `autenticacion_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autenticacion_customuser_groups`
--

DROP TABLE IF EXISTS `autenticacion_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacion_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `autenticacion_customuser_customuser_id_group_id_e4f46c78_uniq` (`customuser_id`,`group_id`),
  KEY `autenticacion_custom_group_id_cb372893_fk_auth_grou` (`group_id`),
  CONSTRAINT `autenticacion_custom_customuser_id_41a1d449_fk_autentica` FOREIGN KEY (`customuser_id`) REFERENCES `autenticacion_customuser` (`id`),
  CONSTRAINT `autenticacion_custom_group_id_cb372893_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacion_customuser_groups`
--

LOCK TABLES `autenticacion_customuser_groups` WRITE;
/*!40000 ALTER TABLE `autenticacion_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `autenticacion_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autenticacion_customuser_user_permissions`
--

DROP TABLE IF EXISTS `autenticacion_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autenticacion_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `autenticacion_customuser_customuser_id_permission_ba4f6f81_uniq` (`customuser_id`,`permission_id`),
  KEY `autenticacion_custom_permission_id_c724edc7_fk_auth_perm` (`permission_id`),
  CONSTRAINT `autenticacion_custom_customuser_id_b777baa5_fk_autentica` FOREIGN KEY (`customuser_id`) REFERENCES `autenticacion_customuser` (`id`),
  CONSTRAINT `autenticacion_custom_permission_id_c724edc7_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autenticacion_customuser_user_permissions`
--

LOCK TABLES `autenticacion_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `autenticacion_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `autenticacion_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add compra',7,'add_compra'),(26,'Can change compra',7,'change_compra'),(27,'Can delete compra',7,'delete_compra'),(28,'Can view compra',7,'view_compra'),(29,'Can add producto',8,'add_producto'),(30,'Can change producto',8,'change_producto'),(31,'Can delete producto',8,'delete_producto'),(32,'Can view producto',8,'view_producto'),(33,'Can add detalle compra',9,'add_detallecompra'),(34,'Can change detalle compra',9,'change_detallecompra'),(35,'Can delete detalle compra',9,'delete_detallecompra'),(36,'Can view detalle compra',9,'view_detallecompra'),(37,'Can add comprobante venta',10,'add_comprobanteventa'),(38,'Can change comprobante venta',10,'change_comprobanteventa'),(39,'Can delete comprobante venta',10,'delete_comprobanteventa'),(40,'Can view comprobante venta',10,'view_comprobanteventa'),(41,'Can add custom user',11,'add_customuser'),(42,'Can change custom user',11,'change_customuser'),(43,'Can delete custom user',11,'delete_customuser'),(44,'Can view custom user',11,'view_customuser'),(45,'Can create new product',11,'can_create_product'),(46,'Can edit product',11,'can_edit_product');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$ULibyMu0OctUiqfEBcf487$Nmpd7DlJLi3SxsvJbGMpqcuUnkOmHS2mIXod2v/TUWE=','2023-06-24 02:36:19.987217',0,'Camila','','','camila@camila.cl',0,1,'2023-06-21 22:03:42.239471'),(2,'pbkdf2_sha256$600000$HHdzgRY1FJ1rIrNcS6Oo8O$3YFIv/Jz9/8gnrRMNFX3O0vIizXqRakrTgy7WcCekKk=','2023-06-23 17:18:19.327750',1,'Yamir','','','yamir.pinto@gmail.com',1,1,'2023-06-23 17:18:06.096349');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'autenticacion','customuser'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'ventas','compra'),(10,'ventas','comprobanteventa'),(9,'ventas','detallecompra'),(8,'ventas','producto');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-19 23:17:54.799149'),(2,'auth','0001_initial','2023-06-19 23:17:55.004951'),(3,'admin','0001_initial','2023-06-19 23:17:55.056952'),(4,'admin','0002_logentry_remove_auto_add','2023-06-19 23:17:55.062951'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-19 23:17:55.067952'),(6,'contenttypes','0002_remove_content_type_name','2023-06-19 23:17:55.103952'),(7,'auth','0002_alter_permission_name_max_length','2023-06-19 23:17:55.149582'),(8,'auth','0003_alter_user_email_max_length','2023-06-19 23:17:55.166583'),(9,'auth','0004_alter_user_username_opts','2023-06-19 23:17:55.171581'),(10,'auth','0005_alter_user_last_login_null','2023-06-19 23:17:55.197150'),(11,'auth','0006_require_contenttypes_0002','2023-06-19 23:17:55.200153'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-19 23:17:55.205150'),(13,'auth','0008_alter_user_username_max_length','2023-06-19 23:17:55.231207'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-19 23:17:55.275472'),(15,'auth','0010_alter_group_name_max_length','2023-06-19 23:17:55.289722'),(16,'auth','0011_update_proxy_permissions','2023-06-19 23:17:55.295722'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-19 23:17:55.325399'),(18,'sessions','0001_initial','2023-06-19 23:17:55.341820'),(19,'ventas','0001_initial','2023-06-19 23:17:55.444494'),(20,'ventas','0002_producto_fecha_creacion_producto_imagen','2023-06-20 18:48:18.071642'),(21,'autenticacion','0001_initial','2023-06-22 03:10:02.096653'),(22,'ventas','0003_alter_producto_imagen','2023-06-22 03:10:02.105653'),(23,'ventas','0004_compra_estado','2023-06-23 01:52:29.071489'),(24,'autenticacion','0002_customuser_carro_compras','2023-06-23 01:52:29.105490');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4czjgctxbno38o89trt5eudkcptyavs8','.eJxVjEsOwjAMBe-SNYqcD43Lkj1nqGzHIQXUSv2sEHdHkbqA7ZuZ9zYD7Vsd9lWXYczmYpw5_W5M8tSpgfyg6T5bmadtGdk2xR50tbc56-t6uH8HldbaavbYs7iuuAIYRbIyACr6LIRJNIqnIMWfM3UKIfWAFFk9uMQuoPl8AQwzOH4:1qCWTF:2NJLtvF8SYJdspI33iDtwLKpCg2OH_-GifeAUt5he74','2023-07-07 02:24:21.286071'),('8b0jwq9es2d8gnaiejute0ibxd1tzsf5','.eJxVjEsOwjAMBe-SNYqcD43Lkj1nqGzHIQXUSv2sEHdHkbqA7ZuZ9zYD7Vsd9lWXYczmYpw5_W5M8tSpgfyg6T5bmadtGdk2xR50tbc56-t6uH8HldbaavbYs7iuuAIYRbIyACr6LIRJNIqnIMWfM3UKIfWAFFk9uMQuoPl8AQwzOH4:1qCaJH:u7jxE9Zr2OvP5WSijEwxQ6i_iZ7tqaloAr3O46xun18','2023-07-07 06:30:19.268580'),('gjqql390m3ft2o1ey6oyjthqjxkjcd1t','e30:1qBqNR:WzVo-Rp63g27I5V6YO6yhls40IzfF0Oq_t-amPdjrXk','2023-07-05 05:27:33.661940');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_compra`
--

DROP TABLE IF EXISTS `ventas_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_compra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_compra_usuario_id_76ae7b8b_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `ventas_compra_usuario_id_76ae7b8b_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_compra`
--

LOCK TABLES `ventas_compra` WRITE;
/*!40000 ALTER TABLE `ventas_compra` DISABLE KEYS */;
INSERT INTO `ventas_compra` VALUES (1,'2023-06-23 02:20:34.492430',1,'R'),(2,'2023-06-23 18:34:52.036774',1,'R'),(3,'2023-06-23 18:35:49.230269',1,'R'),(4,'2023-06-24 01:40:05.968405',1,'R'),(5,'2023-06-24 02:36:45.118723',1,'R'),(6,'2023-06-24 02:37:03.525426',1,'R'),(7,'2023-06-24 15:53:59.511476',1,'R'),(8,'2023-06-24 17:08:00.743021',1,'R');
/*!40000 ALTER TABLE `ventas_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_comprobanteventa`
--

DROP TABLE IF EXISTS `ventas_comprobanteventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_comprobanteventa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `compra_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `compra_id` (`compra_id`),
  CONSTRAINT `ventas_comprobanteventa_compra_id_a50a5b4a_fk_ventas_compra_id` FOREIGN KEY (`compra_id`) REFERENCES `ventas_compra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_comprobanteventa`
--

LOCK TABLES `ventas_comprobanteventa` WRITE;
/*!40000 ALTER TABLE `ventas_comprobanteventa` DISABLE KEYS */;
INSERT INTO `ventas_comprobanteventa` VALUES (1,95880.00,1),(2,29950.00,2),(3,309780.00,3),(4,5990.00,4),(5,5990.00,5),(6,9990.00,6),(7,5990.00,7),(8,15990.00,8);
/*!40000 ALTER TABLE `ventas_comprobanteventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detallecompra`
--

DROP TABLE IF EXISTS `ventas_detallecompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detallecompra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `compra_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_detallecompra_compra_id_97b89a15_fk_ventas_compra_id` (`compra_id`),
  KEY `ventas_detallecompra_producto_id_c432f077_fk_ventas_producto_id` (`producto_id`),
  CONSTRAINT `ventas_detallecompra_compra_id_97b89a15_fk_ventas_compra_id` FOREIGN KEY (`compra_id`) REFERENCES `ventas_compra` (`id`),
  CONSTRAINT `ventas_detallecompra_producto_id_c432f077_fk_ventas_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `ventas_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detallecompra`
--

LOCK TABLES `ventas_detallecompra` WRITE;
/*!40000 ALTER TABLE `ventas_detallecompra` DISABLE KEYS */;
INSERT INTO `ventas_detallecompra` VALUES (1,6,1,1),(2,6,1,2),(3,5,2,1),(4,3,3,2),(5,10,3,5),(6,9,3,6),(7,1,4,1),(8,1,5,1),(9,1,6,2),(10,1,7,1),(11,1,8,4);
/*!40000 ALTER TABLE `ventas_detallecompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_producto`
--

DROP TABLE IF EXISTS `ventas_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad_stock` int NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_producto`
--

LOCK TABLES `ventas_producto` WRITE;
/*!40000 ALTER TABLE `ventas_producto` DISABLE KEYS */;
INSERT INTO `ventas_producto` VALUES (1,'Avengers',5990.00,33,'2023-06-21 05:27:33.648938','assets/img/Avengers_1.webp'),(2,'Avengers Age of Ultron',9990.00,34,'2023-06-21 18:35:29.690575','assets/img/Avengers_Ultron.webp'),(3,'Civil War',12990.00,25,'2023-06-21 18:56:20.207508','assets/img/Civil_War.webp'),(4,'Avengers: Infinity War',15990.00,29,'2023-06-21 18:57:08.738932','assets/img/Infinity_War.jpg'),(5,'Avengers: Endgame',18990.00,35,'2023-06-21 18:57:41.343930','assets/img/Avengers_Endgame.jpg'),(6,'Ironman 3',9990.00,25,'2023-06-23 17:19:46.886178','assets/img/Ironman_3.jpg');
/*!40000 ALTER TABLE `ventas_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-24 13:13:18
