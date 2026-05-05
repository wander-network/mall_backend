-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: mall_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户',6,'add_user'),(22,'Can change 用户',6,'change_user'),(23,'Can delete 用户',6,'delete_user'),(24,'Can view 用户',6,'view_user'),(25,'Can add 地址',7,'add_address'),(26,'Can change 地址',7,'change_address'),(27,'Can delete 地址',7,'delete_address'),(28,'Can view 地址',7,'view_address'),(29,'Can add 品牌',8,'add_brand'),(30,'Can change 品牌',8,'change_brand'),(31,'Can delete 品牌',8,'delete_brand'),(32,'Can view 品牌',8,'view_brand'),(33,'Can add 分类',9,'add_category'),(34,'Can change 分类',9,'change_category'),(35,'Can delete 分类',9,'delete_category'),(36,'Can view 分类',9,'view_category'),(37,'Can add 商品',10,'add_product'),(38,'Can change 商品',10,'change_product'),(39,'Can delete 商品',10,'delete_product'),(40,'Can view 商品',10,'view_product'),(41,'Can add 商品图片',11,'add_productimage'),(42,'Can change 商品图片',11,'change_productimage'),(43,'Can delete 商品图片',11,'delete_productimage'),(44,'Can view 商品图片',11,'view_productimage'),(45,'Can add SKU',12,'add_sku'),(46,'Can change SKU',12,'change_sku'),(47,'Can delete SKU',12,'delete_sku'),(48,'Can view SKU',12,'view_sku'),(49,'Can add 购物车',13,'add_cartitem'),(50,'Can change 购物车',13,'change_cartitem'),(51,'Can delete 购物车',13,'delete_cartitem'),(52,'Can view 购物车',13,'view_cartitem'),(53,'Can add 订单',14,'add_order'),(54,'Can change 订单',14,'change_order'),(55,'Can delete 订单',14,'delete_order'),(56,'Can view 订单',14,'view_order'),(57,'Can add order item',15,'add_orderitem'),(58,'Can change order item',15,'change_orderitem'),(59,'Can delete order item',15,'delete_orderitem'),(60,'Can view order item',15,'view_orderitem'),(61,'Can add 支付记录',16,'add_payment'),(62,'Can change 支付记录',16,'change_payment'),(63,'Can delete 支付记录',16,'delete_payment'),(64,'Can view 支付记录',16,'view_payment'),(65,'Can add 收藏',17,'add_favorite'),(66,'Can change 收藏',17,'change_favorite'),(67,'Can delete 收藏',17,'delete_favorite'),(68,'Can view 收藏',17,'view_favorite');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cartitem`
--

DROP TABLE IF EXISTS `cart_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `sku_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_cartitem_user_id_product_id_sku_id_a9a4b08a_uniq` (`user_id`,`product_id`,`sku_id`),
  KEY `cart_cartitem_product_id_b24e265a_fk_goods_product_id` (`product_id`),
  KEY `cart_cartitem_sku_id_d19974f8_fk_goods_sku_id` (`sku_id`),
  CONSTRAINT `cart_cartitem_product_id_b24e265a_fk_goods_product_id` FOREIGN KEY (`product_id`) REFERENCES `goods_product` (`id`),
  CONSTRAINT `cart_cartitem_sku_id_d19974f8_fk_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `goods_sku` (`id`),
  CONSTRAINT `cart_cartitem_user_id_292943b8_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `cart_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cartitem`
--

LOCK TABLES `cart_cartitem` WRITE;
/*!40000 ALTER TABLE `cart_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_cartitem` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-05-05 07:49:23.669411','1','iPhone 15 Pro',1,'[{\"added\": {}}]',10,1),(2,'2026-05-05 07:50:51.161454','2','MacBook Pro',1,'[{\"added\": {}}]',10,1),(3,'2026-05-05 07:51:23.439009','3','小米电视',1,'[{\"added\": {}}]',10,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(13,'cart','cartitem'),(4,'contenttypes','contenttype'),(17,'favorites','favorite'),(8,'goods','brand'),(9,'goods','category'),(10,'goods','product'),(11,'goods','productimage'),(12,'goods','sku'),(14,'orders','order'),(15,'orders','orderitem'),(16,'payments','payment'),(5,'sessions','session'),(7,'users','address'),(6,'users','user');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-05-01 15:29:28.221691'),(2,'contenttypes','0002_remove_content_type_name','2026-05-01 15:29:28.327436'),(3,'auth','0001_initial','2026-05-01 15:29:28.555405'),(4,'auth','0002_alter_permission_name_max_length','2026-05-01 15:29:28.606543'),(5,'auth','0003_alter_user_email_max_length','2026-05-01 15:29:28.611541'),(6,'auth','0004_alter_user_username_opts','2026-05-01 15:29:28.616541'),(7,'auth','0005_alter_user_last_login_null','2026-05-01 15:29:28.622561'),(8,'auth','0006_require_contenttypes_0002','2026-05-01 15:29:28.624928'),(9,'auth','0007_alter_validators_add_error_messages','2026-05-01 15:29:28.630304'),(10,'auth','0008_alter_user_username_max_length','2026-05-01 15:29:28.636297'),(11,'auth','0009_alter_user_last_name_max_length','2026-05-01 15:29:28.641808'),(12,'auth','0010_alter_group_name_max_length','2026-05-01 15:29:28.655067'),(13,'auth','0011_update_proxy_permissions','2026-05-01 15:29:28.661073'),(14,'auth','0012_alter_user_first_name_max_length','2026-05-01 15:29:28.666075'),(15,'users','0001_initial','2026-05-01 15:29:29.008105'),(16,'admin','0001_initial','2026-05-01 15:29:29.137861'),(17,'admin','0002_logentry_remove_auto_add','2026-05-01 15:29:29.144872'),(18,'admin','0003_logentry_add_action_flag_choices','2026-05-01 15:29:29.151071'),(19,'goods','0001_initial','2026-05-01 15:29:29.494243'),(20,'cart','0001_initial','2026-05-01 15:29:29.612942'),(21,'cart','0002_initial','2026-05-01 15:29:29.701980'),(22,'favorites','0001_initial','2026-05-01 15:29:29.774918'),(23,'favorites','0002_initial','2026-05-01 15:29:29.857988'),(24,'orders','0001_initial','2026-05-01 15:29:29.900427'),(25,'orders','0002_initial','2026-05-01 15:29:30.195813'),(26,'payments','0001_initial','2026-05-01 15:29:30.304983'),(27,'sessions','0001_initial','2026-05-01 15:29:30.339922');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4a4mgrdjh4bqalx6x576mqggcphousrc','.eJxVjMsOwiAUBf-FtSGhNDxcuvcbyOU-pGogKe2q8d8NSRe6PTNzDpVg30raO69pIXVVRl1-twz44joAPaE-msZWt3XJeij6pF3fG_H7drp_BwV6GTUazCJRYpiYhKwPMTAZ4snPEMljyCGSZRY0jqMhsGDczEjBiWT1-QIrWTnd:1wKATL:oupcyZ613PAREDbO9gsSQSqEQLl3XgjFvow8QU6UnUU','2026-05-19 07:45:39.641722');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites_favorite`
--

DROP TABLE IF EXISTS `favorites_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorites_favorite_user_id_product_id_d1891cbf_uniq` (`user_id`,`product_id`),
  KEY `favorites_favorite_product_id_7f5abb37_fk_goods_product_id` (`product_id`),
  CONSTRAINT `favorites_favorite_product_id_7f5abb37_fk_goods_product_id` FOREIGN KEY (`product_id`) REFERENCES `goods_product` (`id`),
  CONSTRAINT `favorites_favorite_user_id_69ee5ed6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites_favorite`
--

LOCK TABLES `favorites_favorite` WRITE;
/*!40000 ALTER TABLE `favorites_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_brand`
--

DROP TABLE IF EXISTS `goods_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_brand`
--

LOCK TABLES `goods_brand` WRITE;
/*!40000 ALTER TABLE `goods_brand` DISABLE KEYS */;
INSERT INTO `goods_brand` VALUES (1,'Apple',''),(2,'华为',''),(3,'小米',''),(4,'OPPO',''),(5,'vivo',''),(6,'三星',''),(7,'荣耀',''),(8,'一加',''),(9,'海尔',''),(10,'美的',''),(11,'格力',''),(12,'TCL',''),(13,'海信',''),(14,'创维',''),(15,'飞利浦',''),(16,'松下',''),(17,'耐克',''),(18,'阿迪达斯',''),(19,'李宁',''),(20,'安踏',''),(21,'优衣库',''),(22,'ZARA',''),(23,'H&M',''),(24,'欧莱雅',''),(25,'雅诗兰黛',''),(26,'兰蔻',''),(27,'迪奥',''),(28,'香奈儿',''),(29,'自然堂',''),(30,'完美日记','');
/*!40000 ALTER TABLE `goods_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_category`
--

DROP TABLE IF EXISTS `goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_category_parent_id_c69c7899_fk_goods_category_id` (`parent_id`),
  CONSTRAINT `goods_category_parent_id_c69c7899_fk_goods_category_id` FOREIGN KEY (`parent_id`) REFERENCES `goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_category`
--

LOCK TABLES `goods_category` WRITE;
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` VALUES (1,'手机数码','',1,NULL),(2,'家用电器','',2,NULL),(3,'服装鞋包','',3,NULL),(4,'美妆护肤','',4,NULL),(5,'食品生鲜','',5,NULL),(6,'家居生活','',6,NULL),(7,'运动户外','',7,NULL),(8,'图书音像','',8,NULL),(9,'手机通讯','',1,1),(10,'电脑办公','',2,1),(11,'数码配件','',3,1),(12,'智能设备','',4,1);
/*!40000 ALTER TABLE `goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_product`
--

DROP TABLE IF EXISTS `goods_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL,
  `sales` int unsigned NOT NULL,
  `views` int unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `brand_id` bigint DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_product_brand_id_dbc2f497_fk_goods_brand_id` (`brand_id`),
  KEY `goods_product_category_id_a99ebc03_fk_goods_category_id` (`category_id`),
  CONSTRAINT `goods_product_brand_id_dbc2f497_fk_goods_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `goods_brand` (`id`),
  CONSTRAINT `goods_product_category_id_a99ebc03_fk_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `goods_category` (`id`),
  CONSTRAINT `goods_product_chk_1` CHECK ((`stock` >= 0)),
  CONSTRAINT `goods_product_chk_2` CHECK ((`sales` >= 0)),
  CONSTRAINT `goods_product_chk_3` CHECK ((`views` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_product`
--

LOCK TABLES `goods_product` WRITE;
/*!40000 ALTER TABLE `goods_product` DISABLE KEYS */;
INSERT INTO `goods_product` VALUES (1,'iPhone 15 Pro',7999.00,8999.00,0,0,0,'最新款苹果手机',1,1,1,'2026-05-05 07:49:23.663757','2026-05-05 07:49:23.663757',1,1),(2,'MacBook Pro',14999.00,16999.00,30,0,0,'专业级笔记本电脑',1,1,1,'2026-05-05 07:50:51.159458','2026-05-05 07:50:51.159458',1,10),(3,'小米电视',2999.00,3999.00,100,0,0,'4K超高清智能电视',1,1,1,'2026-05-05 07:51:23.439009','2026-05-05 07:51:23.439009',3,2);
/*!40000 ALTER TABLE `goods_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_productimage`
--

DROP TABLE IF EXISTS `goods_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_productimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `order` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_productimage_product_id_eece8741_fk_goods_product_id` (`product_id`),
  CONSTRAINT `goods_productimage_product_id_eece8741_fk_goods_product_id` FOREIGN KEY (`product_id`) REFERENCES `goods_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_productimage`
--

LOCK TABLES `goods_productimage` WRITE;
/*!40000 ALTER TABLE `goods_productimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_sku`
--

DROP TABLE IF EXISTS `goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spec_value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_sku_product_id_b45d1d23_fk_goods_product_id` (`product_id`),
  CONSTRAINT `goods_sku_product_id_b45d1d23_fk_goods_product_id` FOREIGN KEY (`product_id`) REFERENCES `goods_product` (`id`),
  CONSTRAINT `goods_sku_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_sku`
--

LOCK TABLES `goods_sku` WRITE;
/*!40000 ALTER TABLE `goods_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `paid_at` datetime(6) DEFAULT NULL,
  `address_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `orders_order_address_id_0daf897b_fk_users_address_id` (`address_id`),
  KEY `orders_order_user_id_e9b59eb1_fk_users_user_id` (`user_id`),
  CONSTRAINT `orders_order_address_id_0daf897b_fk_users_address_id` FOREIGN KEY (`address_id`) REFERENCES `users_address` (`id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderitem`
--

DROP TABLE IF EXISTS `orders_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `sku_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  KEY `orders_orderitem_product_id_afe4254a_fk_goods_product_id` (`product_id`),
  KEY `orders_orderitem_sku_id_b2338e9b_fk_goods_sku_id` (`sku_id`),
  CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_goods_product_id` FOREIGN KEY (`product_id`) REFERENCES `goods_product` (`id`),
  CONSTRAINT `orders_orderitem_sku_id_b2338e9b_fk_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `goods_sku` (`id`),
  CONSTRAINT `orders_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderitem`
--

LOCK TABLES `orders_orderitem` WRITE;
/*!40000 ALTER TABLE `orders_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_payment`
--

DROP TABLE IF EXISTS `payments_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `paid_at` datetime(6) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_no` (`payment_no`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `payments_payment_order_id_22c479b7_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_payment`
--

LOCK TABLES `payments_payment` WRITE;
/*!40000 ALTER TABLE `payments_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_address`
--

DROP TABLE IF EXISTS `users_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_address_user_id_4c106ba4_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_address_user_id_4c106ba4_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_address`
--

LOCK TABLES `users_address` WRITE;
/*!40000 ALTER TABLE `users_address` DISABLE KEYS */;
INSERT INTO `users_address` VALUES (1,'张三','13800138000','浙江省','杭州市','西湖区','西湖大道1号',1,'2026-05-05 04:11:06.014172',2);
/*!40000 ALTER TABLE `users_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$1000000$R6JRZx5i3UDVA4XhsdzhUB$GuuWRy2P3oXVognblOJC8JqJ+SfUYot4s9tjuJCBmhU=','2026-05-05 07:45:39.635718',1,'admin','','','1349440242@qq.com',1,1,'2026-05-01 15:30:30.750695','',''),(2,'pbkdf2_sha256$1000000$tKHIntBUbbQPn0DhttPDId$BL5EKddaJSvJ/QR5zhnay/aUiTcWPDS0aoddbr6mtGM=',NULL,0,'wander','','','1349440242@qq.com',0,1,'2026-05-01 15:45:57.021018','13587820111',''),(3,'pbkdf2_sha256$1000000$jU3nSQ56VqwzZHR2AQUBrd$OD47/THi2XanGGADV/WtgDr5Rkf+z+9GSPdwU9in/XQ=',NULL,0,'testuser','','','test@example.com',0,1,'2026-05-05 04:09:47.227589','13800138000','');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-05 16:23:08
