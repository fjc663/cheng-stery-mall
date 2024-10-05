-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cstery_mall_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID，关联到用户表',
  `receiver_name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(20) NOT NULL COMMENT '收货人联系电话',
  `province` varchar(50) NOT NULL COMMENT '省份',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `district` varchar(50) NOT NULL COMMENT '区/县',
  `detailed_address` varchar(255) NOT NULL COMMENT '详细地址',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否为默认地址，1表示默认',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (4,9,'张三','13380809123','河北省','邯郸市','峰峰矿区','夏天镇',0,'2024-09-21 05:36:53','2024-10-01 05:22:14'),(6,9,'王五','13360601423','福建省','莆田市','涵江区','高德镇',0,'2024-09-21 05:39:27','2024-10-01 05:21:44'),(8,9,'李四','13380801732','山西省','阳泉市','郊区','二狗村',0,'2024-09-21 06:01:07','2024-10-01 05:21:45'),(9,9,'赵六','13360601432','广东省','广州市','番禺区','小谷围100号',1,'2024-09-22 01:54:09','2024-10-01 05:22:14'),(10,9,'林奇','13434237889','西藏自治区','昌都市','类乌齐县','大围村11号',0,'2024-09-22 02:19:55','2024-09-22 02:22:59');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车记录ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加到购物车的时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `specifications` text COLLATE utf8mb4_unicode_ci COMMENT '商品规格，JSON 格式',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (117,9,237,2,'2024-10-05 08:43:58','2024-10-05 08:43:58','{\"硬盘\":\"256GB\",\"处理器\":\"i7\",\"屏幕尺寸\":\"15英寸\",\"显卡\":\"GTX 1650\",\"内存\":\"4GB\"}'),(115,9,405,2,'2024-10-05 06:12:35','2024-10-05 06:12:35','{\"音质\":\"低音加强\",\"颜色分类\":\"黑色\"}'),(116,9,91,1,'2024-10-05 08:43:51','2024-10-05 08:43:51','{\"硬盘\":\"256GB\",\"处理器\":\"i3\",\"屏幕尺寸\":\"13英寸\",\"显卡\":\"RTX 2060\",\"内存\":\"4GB\"}'),(114,9,373,2,'2024-10-05 06:12:32','2024-10-05 06:12:32','{\"音质\":\"低音加强\",\"颜色分类\":\"黑色\"}');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `description` text COMMENT '分类描述',
  `image_url` varchar(255) DEFAULT 'http://localhost:8080/category_default.png' COMMENT '图片地址',
  `status` tinyint(1) DEFAULT '1' COMMENT '分类状态（1=有效，0=禁用）',
  `sort_order` int(11) DEFAULT '0' COMMENT '分类排序',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父分类ID（若无父分类则为NULL）',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` bigint(20) unsigned NOT NULL COMMENT '创建用户ID',
  `updated_by` bigint(20) unsigned NOT NULL COMMENT '更新用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_parent_category` (`parent_id`),
  CONSTRAINT `fk_parent_category` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'酒水','各类酒水饮品','http://localhost:8080/category/wine.png',1,1,NULL,'2024-10-04 10:37:56',NULL,9,1),(2,'红酒','红酒及相关产品','http://localhost:8080/category_jiu.png',1,2,1,'2024-09-28 06:32:40',NULL,9,1),(3,'白酒','各类白酒','http://localhost:8080/category_jiu.png',1,3,1,'2024-09-28 06:32:27',NULL,9,1),(4,'啤酒','各种品牌啤酒','http://localhost:8080/category_jiu.png',1,4,1,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(5,'饮料','碳酸饮料，果汁等','http://localhost:8080/category/drink.png',1,5,NULL,'2024-09-16 05:16:20','2024-09-16 08:45:58',1,1),(6,'汽水','碳酸类饮料','http://localhost:8080/category_jiu.png',1,6,5,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(7,'果汁','鲜榨果汁和瓶装果汁','http://localhost:8080/category_jiu.png',1,7,5,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(8,'乳制品','牛奶、酸奶、奶酪等','http://localhost:8080/category/mike.png',1,8,NULL,'2024-09-16 05:16:20','2024-09-16 08:53:38',1,1),(9,'零食','各类零食小吃','http://localhost:8080/category/snack.png',1,9,NULL,'2024-09-16 05:16:20','2024-09-16 08:53:38',1,1),(10,'薯片','薯片类小吃','http://localhost:8080/category_jiu.png',1,10,9,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(11,'饼干','各种饼干','http://localhost:8080/category_jiu.png',1,11,9,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(12,'巧克力','各类巧克力及甜品','http://localhost:8080/category_jiu.png',1,12,9,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(13,'坚果','坚果类小吃','http://localhost:8080/category_jiu.png',1,13,9,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(14,'家电','各种家用电器','http://localhost:8080/category/householdAppliances.png',1,14,NULL,'2024-09-16 05:16:20','2024-09-16 08:54:02',1,1),(15,'冰箱','家用冰箱','http://localhost:8080/category_jiu.png',1,15,14,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(16,'洗衣机','各种品牌洗衣机','http://localhost:8080/category_jiu.png',1,16,14,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(17,'空调','空调及相关产品','http://localhost:8080/category_jiu.png',1,17,14,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(18,'厨房电器','厨房用小家电','http://localhost:8080/category_jiu.png',1,18,14,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(19,'电脑','台式机、笔记本、配件等','http://localhost:8080/category/computer.png',1,19,NULL,'2024-09-16 05:16:20','2024-09-16 08:54:34',1,1),(20,'笔记本电脑','各类笔记本电脑','http://localhost:8080/category_jiu.png',1,20,19,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(21,'键盘鼠标','各种键盘鼠标','http://localhost:8080/category_jiu.png',1,21,19,'2024-10-04 11:42:14',NULL,9,1),(22,'耳机','各类品牌耳机','http://localhost:8080/category_jiu.png',1,22,19,'2024-10-04 11:41:34',NULL,9,1),(23,'手机','各类手机及配件','http://localhost:8080/category/phone.png',1,23,NULL,'2024-09-16 05:16:20','2024-09-16 08:54:34',1,1),(24,'智能手机','智能手机及相关配件','http://localhost:8080/category_jiu.png',1,24,23,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(25,'手表','各种手表等','http://localhost:8080/category_jiu.png',1,25,23,'2024-10-04 12:14:13',NULL,9,1),(26,'手机配件','手机壳、保护膜等','http://localhost:8080/category_jiu.png',1,26,23,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(27,'服装','男装、女装、童装等','http://localhost:8080/category/cloth.png',1,27,NULL,'2024-09-16 05:16:20','2024-09-16 08:54:52',1,1),(28,'男装','各类男装','http://localhost:8080/category_jiu.png',1,28,27,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(29,'女装','各类女装','http://localhost:8080/category_jiu.png',1,29,27,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(30,'童装','儿童服装及相关配件','http://localhost:8080/category_jiu.png',1,30,27,'2024-09-16 05:16:20','2024-09-16 05:16:20',1,1),(38,'牛奶','各类纯牛奶','',1,9,8,'2024-10-04 11:58:02','2024-10-04 11:58:02',9,9),(39,'显示器','各种显示器','',1,22,19,'2024-10-04 13:04:31',NULL,9,9);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_product`
--

DROP TABLE IF EXISTS `featured_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `featured_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品ID，关联到商品表',
  `type` tinyint(4) NOT NULL COMMENT '类型: 1-轮播图商品, 2-热门商品, 3-新品商品',
  `display_order` int(11) DEFAULT '0' COMMENT '显示顺序，数值越大越优先显示',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `featured_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='轮播图、热门、新品商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_product`
--

LOCK TABLES `featured_product` WRITE;
/*!40000 ALTER TABLE `featured_product` DISABLE KEYS */;
INSERT INTO `featured_product` VALUES (1,1,1,10,'2024-09-25 11:01:39','2024-09-25 11:01:39'),(2,2,2,5,'2024-09-25 11:01:39','2024-09-25 11:01:39'),(3,3,3,7,'2024-09-25 11:01:39','2024-09-25 11:01:39'),(4,4,1,15,'2024-09-25 11:01:39','2024-09-25 11:01:39'),(5,5,2,3,'2024-09-25 11:01:39','2024-09-25 11:01:39'),(6,6,3,8,'2024-09-25 11:01:39','2024-09-25 11:01:39'),(7,7,1,11,'2024-09-25 11:03:19','2024-09-25 11:03:19'),(8,8,2,5,'2024-09-25 11:03:19','2024-09-25 11:03:19'),(9,9,3,7,'2024-09-25 11:03:19','2024-09-25 11:03:19'),(11,11,2,12,'2024-09-25 11:03:19','2024-09-25 11:03:19'),(12,12,3,22,'2024-09-25 11:03:19','2024-09-25 11:03:19'),(18,374,1,0,'2024-10-05 02:35:50','2024-10-05 02:35:50'),(19,376,1,0,'2024-10-05 02:35:54','2024-10-05 02:35:54'),(20,370,1,0,'2024-10-05 04:56:11','2024-10-05 04:56:11'),(21,391,1,0,'2024-10-05 06:05:27','2024-10-05 06:05:27'),(22,406,1,0,'2024-10-05 06:05:28','2024-10-05 06:05:28'),(23,256,1,0,'2024-10-05 06:05:29','2024-10-05 06:05:29'),(24,39,1,0,'2024-10-05 06:05:32','2024-10-05 06:05:32'),(25,243,1,0,'2024-10-05 06:05:37','2024-10-05 06:05:37'),(28,253,2,0,'2024-10-05 06:05:49','2024-10-05 06:05:49'),(29,78,2,0,'2024-10-05 06:05:51','2024-10-05 06:05:51');
/*!40000 ALTER TABLE `featured_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单商品记录ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID，关联到订单表',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品ID，关联到商品表',
  `product_name` varchar(255) NOT NULL COMMENT '商品名称，冗余字段',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `product_price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `product_image_url` varchar(255) DEFAULT NULL COMMENT '商品图片地址',
  `specifications` varchar(255) DEFAULT NULL COMMENT '商品规格，JSON格式',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,3,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"蓝色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-19 14:15:34'),(3,3,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"M\",\"材质\":\"棉\"}','2024-09-19 14:15:34'),(4,3,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"XL\",\"材质\":\"棉\"}','2024-09-19 14:15:34'),(5,3,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"XL\",\"材质\":\"羊毛\"}','2024-09-19 14:15:34'),(6,3,1,'红酒 A',6,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"黄色\",\"尺寸\":\"XL\",\"材质\":\"羊毛\"}','2024-09-19 14:15:34'),(7,3,1,'红酒 A',4,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"黄色\",\"尺寸\":\"S\",\"材质\":\"羊毛\"}','2024-09-19 14:15:34'),(8,4,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"绿色\",\"尺寸\":\"M\",\"材质\":\"棉\"}','2024-09-19 14:21:37'),(9,4,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"绿色\",\"尺寸\":\"M\",\"材质\":\"羊毛\"}','2024-09-19 14:21:37'),(10,5,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-19 14:43:37'),(11,6,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-19 14:50:23'),(12,7,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-19 16:01:25'),(13,7,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"涤纶\"}','2024-09-19 16:01:25'),(14,7,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"丝绸\"}','2024-09-19 16:01:25'),(15,8,1,'红酒 A',5,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"XL\",\"材质\":\"棉\"}','2024-09-20 11:01:06'),(16,8,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"XL\",\"材质\":\"涤纶\"}','2024-09-20 11:01:06'),(17,8,1,'红酒 A',5,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"XL\",\"材质\":\"牛仔\"}','2024-09-20 11:01:06'),(18,8,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"黄色\",\"尺寸\":\"XL\",\"材质\":\"牛仔\"}','2024-09-20 11:01:06'),(19,8,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"L\",\"材质\":\"棉\"}','2024-09-20 11:01:06'),(20,8,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-20 11:01:06'),(21,9,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-20 11:02:22'),(22,10,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-20 11:02:45'),(23,11,1,'红酒 A',4,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-20 15:01:41'),(24,11,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"黄色\",\"尺寸\":\"XL\",\"材质\":\"棉\"}','2024-09-20 15:01:41'),(25,12,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"M\",\"材质\":\"棉\"}','2024-09-20 15:01:58'),(26,12,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"M\",\"材质\":\"羊毛\"}','2024-09-20 15:01:58'),(27,12,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"XL\",\"材质\":\"羊毛\"}','2024-09-20 15:01:58'),(28,13,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"L\",\"材质\":\"涤纶\"}','2024-09-22 05:04:48'),(29,13,1,'红酒 A',4,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"XXL\",\"材质\":\"涤纶\"}','2024-09-22 05:04:48'),(30,13,1,'红酒 A',5,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"紫色\",\"尺寸\":\"XXL\",\"材质\":\"涤纶\"}','2024-09-22 05:04:48'),(31,13,1,'红酒 A',4,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"紫色\",\"尺寸\":\"XXL\",\"材质\":\"丝绸\"}','2024-09-22 05:04:48'),(33,13,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"蓝色\",\"尺寸\":\"XXL\",\"材质\":\"棉\"}','2024-09-22 05:04:48'),(34,13,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"蓝色\",\"尺寸\":\"XXL\",\"材质\":\"牛仔\"}','2024-09-22 05:04:48'),(48,14,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-23 16:49:50'),(49,14,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"涤纶\"}','2024-09-23 16:49:50'),(50,14,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"丝绸\"}','2024-09-23 16:49:50'),(52,15,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"涤纶\"}','2024-09-23 16:52:19'),(53,15,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"丝绸\"}','2024-09-23 16:52:19'),(61,17,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"丝绸\"}','2024-09-24 13:26:24'),(62,16,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-24 13:26:15'),(63,19,1,'红酒 A',2,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"涤纶\"}','2024-09-24 16:12:08'),(65,18,91,'笔记本电脑 F',3,5800.00,'http://localhost:8080/product/default_product.png','{}','2024-09-24 13:42:11'),(66,20,237,'笔记本电脑 H',3,7200.00,'http://localhost:8080/product/default_product.png','{}','2024-09-24 16:12:53'),(69,21,4,'果汁 A',1,10.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-25 13:11:18'),(80,22,1,'红酒 A',3,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-09-27 09:05:09'),(81,25,1,'红酒 A',6,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"涤纶\"}','2024-10-01 05:22:08'),(82,28,1,'红酒 A',6,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"丝绸\"}','2024-10-03 04:38:44'),(83,24,97,'啤酒 F',1,15.00,'http://localhost:8080/product/default_product.png','{}','2024-10-01 04:17:50'),(84,24,79,'笔记本电脑 E',1,6000.00,'http://localhost:8080/product/default_product.png','{}','2024-10-01 04:17:50'),(85,23,91,'笔记本电脑 F',3,5800.00,'http://localhost:8080/product/default_product.png','{}','2024-09-27 10:55:08'),(86,23,237,'笔记本电脑 H',3,7200.00,'http://localhost:8080/product/default_product.png','{}','2024-09-27 10:55:08'),(87,24,16,'红酒 B',2,150.00,'http://localhost:8080/product/default_product.png','{}','2024-10-01 04:17:50'),(88,22,2,'白酒 A',2,80.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"容量\":\"16GB\"}','2024-09-27 09:05:09'),(89,26,1,'红酒 A',1,120.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}','2024-10-03 03:18:50'),(90,27,10,'空调 A',2,2500.00,'http://localhost:8080/product/default_product.png','{\"尺寸\":\"S\",\"容量\":\"16GB\",\"重量\":\"0.5kg\"}','2024-10-03 04:22:20'),(91,29,408,'qq糖',2,500.00,'https://cstery-sky.oss-cn-beijing.aliyuncs.com/product/2806eb50-2c9e-4259-b8fd-f4ef72c0b637.png','{\"材质\":\"棉\",\"容量\":\"128GB\",\"电池容量\":\"1000mAh\",\"重量\":\"0.5kg\"}','2024-10-03 05:18:23'),(92,32,237,'笔记本电脑 H',3,7200.00,'http://localhost:8080/product/default_product.png','{}','2024-10-03 15:21:06'),(93,30,408,'qq糖',4,500.00,'https://cstery-sky.oss-cn-beijing.aliyuncs.com/product/2806eb50-2c9e-4259-b8fd-f4ef72c0b637.png','{\"材质\":\"棉\",\"容量\":\"128GB\",\"电池容量\":\"1000mAh\",\"重量\":\"0.5kg\"}','2024-10-03 06:21:26'),(94,32,6,'薯片 A',2,5.00,'http://localhost:8080/product/default_product.png','{\"颜色\":\"红色\",\"材质\":\"棉\",\"电池容量\":\"2000mAh\"}','2024-10-03 15:21:06'),(95,32,76,'薯片 E',2,6.50,'http://localhost:8080/product/default_product.png','{}','2024-10-03 15:21:06'),(96,31,234,'薯片 G',2,8.50,'http://localhost:8080/product/default_product.png','{}','2024-10-03 15:20:49'),(97,31,101,'巧克力 F',4,30.00,'http://localhost:8080/product/default_product.png','{}','2024-10-03 15:20:49'),(98,32,77,'巧克力 E',5,25.00,'http://localhost:8080/product/default_product.png','{}','2024-10-03 15:21:06'),(106,33,6,'薯片 A',5,5.00,'http://localhost:8080/product/shupian/1.png','{}','2024-10-05 06:07:05'),(107,34,253,'智能手机 J',2,5200.00,'http://localhost:8080/product/shouji/8.png','{\"电池容量\":\"1000mAh\",\"处理器\":\"i3\",\"内存\":\"8GB\",\"防水等级\":\"IPX3\"}','2024-10-05 06:09:34'),(108,34,20,'牛奶 B',3,9.00,'http://localhost:8080/product/niunai/2.png','{}','2024-10-05 06:09:34'),(109,36,12,'智能手机 A',1,3000.00,'http://localhost:8080/product/shouji/1.png','{\"电池容量\":\"1000mAh\",\"处理器\":\"i3\",\"内存\":\"4GB\",\"防水等级\":\"IPX5\"}','2024-10-05 06:12:08'),(110,35,35,'智能手表 A',2,800.00,'http://localhost:8080/product/shoubiao/1.png','{}','2024-10-05 06:11:44'),(111,35,13,'男装 A',2,150.00,'http://localhost:8080/product/fuzhuang/1.png','{}','2024-10-05 06:11:44'),(112,37,29,'女装 B',2,220.00,'http://localhost:8080/product/fuzhuang/5.png','{}','2024-10-05 06:12:41'),(113,37,63,'耳机 B',2,320.00,'http://localhost:8080/product/erji/2.png','{\"音质\":\"低音加强\",\"颜色分类\":\"黑色\"}','2024-10-05 06:12:41');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `order_number` varchar(50) NOT NULL COMMENT '订单编号',
  `total_amount` decimal(10,2) NOT NULL COMMENT '订单总金额',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单状态：1-待支付, 2-已支付, 3-已发货, 4-已完成, 5-已取消',
  `payment_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态：0-未支付, 1-已支付',
  `payment_method` tinyint(4) DEFAULT NULL COMMENT '支付方式：1-支付宝, 2-微信, 3-信用卡',
  `shipping_address` varchar(255) NOT NULL COMMENT '收货地址',
  `shipping_cost` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `item_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品总数',
  `discount_amount` decimal(10,2) DEFAULT '0.00' COMMENT '优惠金额',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单更新时间',
  `paid_at` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `shipped_at` timestamp NULL DEFAULT NULL COMMENT '发货时间',
  `completed_at` timestamp NULL DEFAULT NULL COMMENT '订单完成时间',
  `canceled_at` timestamp NULL DEFAULT NULL COMMENT '订单取消时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,9,'1726755333884',0.00,4,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,6,0.00,'2024-09-23 13:36:34','2024-10-03 15:22:17',NULL,'2024-10-03 15:21:58','2024-10-03 15:22:17','2024-09-23 13:39:00',''),(4,9,'1726755697328',0.00,5,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,2,0.00,'2024-09-23 12:24:37','2024-10-02 17:09:25',NULL,NULL,NULL,'2024-10-02 17:09:25',''),(5,9,'1726757016752',0.00,4,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,1,0.00,'2024-09-23 12:25:37','2024-10-03 06:17:03',NULL,'2024-10-02 17:09:19','2024-10-03 06:17:03','2024-09-23 12:37:24',''),(6,9,'1726757423382',0.00,5,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,1,0.00,'2024-09-19 14:50:23','2024-10-02 17:00:27',NULL,NULL,NULL,'2024-10-02 17:00:27',''),(7,9,'1726761685174',0.00,4,0,1,'王五 13700137000\n广东省 广州市 天河区 ZZ路ZZ号',0.00,3,0.00,'2024-09-19 16:01:25','2024-10-03 15:22:22',NULL,'2024-10-03 15:22:01','2024-10-03 15:22:22',NULL,''),(8,9,'1726830065852',2640.00,4,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,6,0.00,'2024-09-20 11:01:06','2024-10-03 15:22:20',NULL,'2024-10-03 15:21:59','2024-10-03 15:22:20','2024-09-22 14:30:33',''),(9,9,'1726830141658',120.00,5,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,1,0.00,'2024-09-20 11:02:22','2024-09-22 06:26:15',NULL,NULL,NULL,NULL,''),(10,9,'1726830164717',120.00,5,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,1,0.00,'2024-09-20 11:02:45',NULL,NULL,NULL,NULL,'2024-09-22 14:30:33',''),(11,9,'1726844500693',840.00,4,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,2,0.00,'2024-09-20 15:01:41','2024-10-03 15:22:19',NULL,'2024-10-02 16:54:31','2024-10-03 15:22:19',NULL,''),(12,9,'1726844517562',840.00,5,0,1,'李四 13900139000\n上海市 上海市 浦东新区 YY路YY号',0.00,3,0.00,'2024-09-20 15:01:58',NULL,NULL,NULL,NULL,'2024-09-22 14:30:33',''),(13,9,'1726981487606',2400.00,4,0,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,6,0.00,'2024-09-22 05:04:48','2024-10-03 06:19:15',NULL,NULL,'2024-10-03 06:19:15',NULL,''),(14,9,'1727110189996',600.00,4,0,1,'李四 13380801732\n山西省 阳泉市 郊区 二狗村',0.00,3,0.00,'2024-09-23 16:49:50','2024-09-27 08:41:42',NULL,NULL,NULL,'2024-09-24 04:11:01',''),(15,9,'1727110339041',600.00,5,0,3,'王五 13360601423\n福建省 三明市 宁化县 高德镇',0.00,2,0.00,'2024-09-23 16:52:19',NULL,NULL,NULL,NULL,'2024-09-24 04:11:01',''),(16,9,'1727184375037',240.00,4,0,2,'李四 13380801732\n山西省 阳泉市 郊区 二狗村',0.00,1,0.00,'2024-09-24 13:26:15','2024-09-27 08:41:42',NULL,NULL,NULL,'2024-09-24 13:42:00',''),(17,9,'1727184383603',240.00,5,0,1,'李四 13380801732\n山西省 阳泉市 郊区 二狗村',0.00,1,0.00,'2024-09-24 13:26:24',NULL,NULL,NULL,NULL,'2024-09-24 13:42:00',''),(18,9,'1727185331134',17400.00,4,0,1,'王五 13360601423\n福建省 三明市 宁化县 高德镇',0.00,1,0.00,'2024-09-24 13:42:11','2024-09-27 08:41:42',NULL,NULL,NULL,'2024-09-24 13:58:00',''),(19,9,'1727194327585',240.00,5,0,2,'李四 13380801732\n山西省 阳泉市 郊区 二狗村',0.00,1,0.00,'2024-09-24 16:12:08',NULL,NULL,NULL,NULL,'2024-09-24 16:12:37',''),(20,9,'1727194372601',21600.00,4,0,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,1,0.00,'2024-09-24 16:12:53','2024-09-27 08:41:42',NULL,NULL,NULL,'2024-09-24 16:28:00',''),(21,9,'1727269877575',10.00,5,0,2,'张三 13380809123\n河北省 秦皇岛市 抚宁区 夏天镇',0.00,1,0.00,'2024-09-25 13:11:18',NULL,NULL,NULL,NULL,'2024-09-25 13:27:00',''),(22,9,'1727427908596',520.00,5,0,2,'李四 13380801732\n山西省 阳泉市 郊区 二狗村',0.00,2,0.00,'2024-09-27 09:05:09',NULL,NULL,NULL,NULL,'2024-09-27 09:21:00',''),(23,9,'1727434507749',39000.00,5,0,2,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,2,0.00,'2024-09-27 10:55:08',NULL,NULL,NULL,NULL,'2024-09-27 11:11:00',''),(24,9,'1727756269845',6315.00,5,0,2,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,3,0.00,'2024-10-01 04:17:50',NULL,NULL,NULL,NULL,'2024-10-01 04:33:00',''),(25,9,'1727760127663',720.00,5,0,1,'王五 13360601423\n福建省 莆田市 涵江区 高德镇',0.00,1,0.00,'2024-10-01 05:22:08',NULL,NULL,NULL,NULL,'2024-10-01 05:38:00',''),(26,9,'1727925529685',120.00,5,0,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,1,0.00,'2024-10-03 03:18:50',NULL,NULL,NULL,NULL,'2024-10-03 03:34:00',''),(27,9,'1727929339871',5000.00,5,0,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,1,0.00,'2024-10-03 04:22:20',NULL,NULL,NULL,NULL,'2024-10-03 04:38:00',''),(28,9,'1727930323606',720.00,4,1,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,1,0.00,'2024-10-03 05:10:44','2024-10-03 15:22:15','2024-10-03 05:15:47','2024-10-03 15:21:56','2024-10-03 15:22:15','2024-10-03 05:01:00',''),(29,9,'1727932703446',1000.00,4,1,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,1,0.00,'2024-10-03 05:18:23','2024-10-03 06:04:57','2024-10-03 05:20:48','2024-10-03 05:21:23','2024-10-03 06:04:57',NULL,''),(30,9,'1727936485756',2000.00,5,0,2,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,1,0.00,'2024-10-03 06:21:26','2024-10-03 06:26:26',NULL,NULL,NULL,'2024-10-03 06:26:26',''),(31,9,'1727968849117',137.00,4,1,2,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,2,0.00,'2024-10-03 15:20:49','2024-10-03 15:22:13','2024-10-03 15:20:51','2024-10-03 15:21:54','2024-10-03 15:22:13',NULL,''),(32,9,'1727968865580',21748.00,4,1,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,4,0.00,'2024-10-03 15:21:06','2024-10-03 15:22:11','2024-10-03 15:21:07','2024-10-03 15:21:52','2024-10-03 15:22:11',NULL,''),(33,9,'1728108425212',25.00,4,1,2,'李四 13380801732\n山西省 阳泉市 郊区 二狗村',0.00,1,0.00,'2024-10-05 06:07:05','2024-10-05 06:10:56','2024-10-05 06:07:08','2024-10-05 06:10:37','2024-10-05 06:10:56',NULL,''),(34,9,'1728108573547',10427.00,4,1,2,'林奇 13434237889\n西藏自治区 昌都市 类乌齐县 大围村11号',0.00,2,0.00,'2024-10-05 06:09:34','2024-10-05 06:10:53','2024-10-05 06:09:46','2024-10-05 06:10:34','2024-10-05 06:10:53',NULL,''),(35,9,'1728108703717',1900.00,2,1,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,2,0.00,'2024-10-05 06:11:44','2024-10-05 06:11:49','2024-10-05 06:11:49',NULL,NULL,NULL,''),(36,9,'1728108728269',3000.00,2,1,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,1,0.00,'2024-10-05 06:12:08','2024-10-05 06:12:09','2024-10-05 06:12:09',NULL,NULL,NULL,''),(37,9,'1728108761256',1080.00,3,1,1,'赵六 13360601432\n广东省 广州市 番禺区 小谷围100号',0.00,2,0.00,'2024-10-05 06:12:41','2024-10-05 06:13:00','2024-10-05 06:12:42','2024-10-05 06:13:00',NULL,NULL,'');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `description` text COMMENT '商品描述',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `category_id` bigint(20) unsigned NOT NULL COMMENT '分类ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商品状态（1=上架，0=下架）',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品销量',
  `image_url` varchar(255) DEFAULT NULL COMMENT '商品图片地址',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `created_by` bigint(20) unsigned NOT NULL COMMENT '创建用户ID',
  `updated_by` bigint(20) unsigned NOT NULL COMMENT '更新用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'红酒 A','优质红酒，进口自法国.优质红酒，进口自法国.优质红酒，进口自法国.优质红酒，进口自法国.优质红酒，进口自法国',120.00,100,2,1,131,'http://localhost:8080/product/jiu/1.png','2024-09-17 02:20:30','2024-10-04 13:53:38',1,9),(2,'白酒 A','白酒，国产名牌',80.00,200,3,1,30,'http://localhost:8080/product/jiu/2.png','2024-09-17 02:20:30','2024-10-04 13:53:39',1,1),(3,'啤酒 A','进口啤酒，口感清爽',12.00,500,4,1,300,'http://localhost:8080/product/jiu/3.png','2024-09-17 02:20:30','2024-10-04 13:53:39',1,1),(4,'果汁 A','新鲜果汁，健康无添加',10.00,400,7,1,100,'http://localhost:8080/product/guozhi/1.png','2024-09-17 02:20:30','2024-10-04 12:10:36',1,1),(5,'牛奶 A','纯天然牛奶，营养丰富',8.00,600,38,1,250,'http://localhost:8080/product/niunai/1.png','2024-09-17 02:20:30','2024-10-04 13:10:19',1,1),(6,'薯片 A','脆脆的薯片，口感丰富',5.00,993,10,1,707,'http://localhost:8080/product/shupian/1.png','2024-09-17 02:20:30','2024-10-05 06:10:56',1,9),(7,'巧克力 A','进口巧克力，甜美可口',15.00,300,12,1,150,'http://localhost:8080/product/qiaokeli/1.png','2024-09-17 02:20:30','2024-10-04 12:09:39',1,1),(8,'冰箱 A','双开门冰箱，制冷效果好',3000.00,50,15,1,20,'http://localhost:8080/product/bingxiang/1.png','2024-09-17 02:20:30','2024-10-04 13:57:36',1,1),(9,'洗衣机 A','全自动洗衣机，省水省电',2000.00,60,16,1,25,'http://localhost:8080/product/xiyiji/1.png','2024-09-17 02:20:30','2024-10-04 11:54:15',1,1),(10,'空调 A','大功率空调，制冷快速',2500.00,40,17,1,18,'http://localhost:8080/product/kongtiao/1.png','2024-09-17 02:20:30','2024-10-04 11:19:17',1,1),(11,'笔记本电脑 A','轻薄型笔记本，性能强劲',5000.00,100,20,1,60,'http://localhost:8080/product/diannao/1.png','2024-09-17 02:20:30','2024-10-04 13:58:45',1,1),(12,'智能手机 A','新款智能手机，流畅运行',3000.00,199,24,1,120,'http://localhost:8080/product/shouji/1.png','2024-09-17 02:20:30','2024-10-05 06:12:08',1,1),(13,'男装 A','男士休闲服饰，舒适时尚',150.00,298,28,1,180,'http://localhost:8080/product/fuzhuang/1.png','2024-09-17 02:20:30','2024-10-05 06:11:44',1,1),(14,'女装 A','女士时尚服饰，优雅大方',180.00,250,29,1,140,'http://localhost:8080/product/fuzhuang/2.png','2024-09-17 02:20:30','2024-10-04 11:26:25',1,1),(15,'童装 A','儿童服装，柔软舒适',80.00,400,30,1,230,'http://localhost:8080/product/fuzhuang/3.png','2024-09-17 02:20:30','2024-10-04 11:26:25',1,1),(16,'红酒 B','高档红酒，浓郁香醇',150.00,80,2,1,40,'http://localhost:8080/product/jiu/4.png','2024-09-17 02:20:30','2024-10-04 13:53:39',1,1),(17,'白酒 B','名牌白酒，口感醇厚',90.00,180,3,1,25,'http://localhost:8080/product/jiu/5.png','2024-09-17 02:20:30','2024-10-04 13:53:39',1,1),(18,'啤酒 B','本地啤酒，畅爽体验',10.00,600,4,1,350,'http://localhost:8080/product/jiu/6.png','2024-09-17 02:20:30','2024-10-04 13:53:39',1,1),(19,'果汁 B','有机果汁，健康选择',12.00,350,7,1,90,'http://localhost:8080/product/guozhi/2.png','2024-09-17 02:20:30','2024-10-04 12:10:37',1,1),(20,'牛奶 B','鲜奶，奶味浓郁',9.00,547,38,1,223,'http://localhost:8080/product/niunai/2.png','2024-09-17 02:20:30','2024-10-05 06:10:53',1,9),(21,'薯片 B','口味多样，咸甜适中',6.00,900,10,1,600,'http://localhost:8080/product/shupian/2.png','2024-09-17 02:20:30','2024-10-04 12:12:06',1,1),(22,'巧克力 B','高档巧克力，入口即化',18.00,280,12,1,140,'http://localhost:8080/product/qiaokeli/2.png','2024-09-17 02:20:30','2024-10-04 12:09:39',1,1),(23,'冰箱 B','大容量冰箱，耐用可靠',3200.00,55,15,1,22,'http://localhost:8080/product/bingxiang/2.png','2024-09-17 02:20:30','2024-10-04 13:57:36',1,1),(24,'洗衣机 B','滚筒洗衣机，性能稳定',2200.00,70,16,1,28,'http://localhost:8080/product/xiyiji/2.png','2024-09-17 02:20:30','2024-10-04 11:54:15',1,1),(25,'空调 B','小型空调，节能高效',2300.00,45,17,1,16,'http://localhost:8080/product/kongtiao/2.png','2024-09-17 02:20:30','2024-10-04 11:19:17',1,1),(26,'笔记本电脑 B','高性能笔记本，游戏办公两不误',5500.00,90,20,1,50,'http://localhost:8080/product/diannao/2.png','2024-09-17 02:20:30','2024-10-04 13:58:45',1,1),(27,'智能手机 B','旗舰款智能手机，超长续航',3500.00,180,24,1,110,'http://localhost:8080/product/shouji/2.png','2024-09-17 02:20:30','2024-10-04 14:00:50',1,1),(28,'男装 B','男士正装，商务场合必备',200.00,280,28,1,170,'http://localhost:8080/product/fuzhuang/4.png','2024-09-17 02:20:30','2024-10-04 11:26:25',1,1),(29,'女装 B','女士连衣裙，优雅迷人',220.00,228,29,1,130,'http://localhost:8080/product/fuzhuang/5.png','2024-09-17 02:20:30','2024-10-05 06:12:41',1,1),(30,'童装 B','儿童外套，时尚耐穿',100.00,370,30,1,210,'http://localhost:8080/product/fuzhuang/6.png','2024-09-17 02:20:30','2024-10-04 11:26:25',1,1),(31,'电视 A','高清电视，支持4K显示',3200.00,100,18,1,60,'http://localhost:8080/product/dianshi/1.png','2024-09-17 02:22:21','2024-10-04 11:55:10',1,1),(32,'冰箱 C','智能冰箱，支持WiFi连接',3800.00,45,15,1,22,'http://localhost:8080/product/bingxiang/3.png','2024-09-17 02:22:21','2024-10-04 13:57:36',1,1),(33,'洗衣机 C','滚筒式洗衣机，高效节能',2600.00,65,16,1,27,'http://localhost:8080/product/xiyiji/3.png','2024-09-17 02:22:21','2024-10-04 11:54:15',1,1),(34,'空调 C','大功率空调，适合大空间',2800.00,30,17,1,25,'http://localhost:8080/product/kongtiao/3.png','2024-09-17 02:22:21','2024-10-04 11:19:17',1,1),(35,'智能手表 A','多功能智能手表，支持心率监测',800.00,148,25,1,100,'http://localhost:8080/product/shoubiao/1.png','2024-09-17 02:22:21','2024-10-05 06:11:44',1,1),(36,'耳机 A','无线耳机，音质清晰',300.00,400,22,1,250,'http://localhost:8080/product/erji/1.png','2024-09-17 02:22:21','2024-10-04 13:59:44',1,1),(37,'键盘 A','机械键盘，打字体验极佳',500.00,200,21,1,150,'http://localhost:8080/product/jianpanshubiao/1.png','2024-09-17 02:22:21','2024-10-04 11:49:51',1,1),(38,'鼠标 A','游戏鼠标，反应灵敏',200.00,350,21,1,180,'http://localhost:8080/product/jianpanshubiao/6.png','2024-09-17 02:22:21','2024-10-04 11:50:23',1,1),(39,'显示器 A','27寸曲面显示器，护眼模式',1800.00,100,39,1,80,'http://localhost:8080/product/xianshiqi/1.png','2024-09-17 02:22:21','2024-10-04 13:47:32',1,9),(40,'家用空调 A','变频空调，制冷快',3200.00,80,17,1,35,'http://localhost:8080/product/kongtiao/4.png','2024-09-17 02:22:21','2024-10-04 11:19:17',1,1),(41,'红酒 C','高档红酒，醇香四溢',140.00,60,2,1,38,'http://localhost:8080/product/jiu/7.png','2024-09-17 02:22:21','2024-10-04 13:53:39',1,1),(42,'白酒 C','国产白酒，纯粮酿造',85.00,150,3,1,20,'http://localhost:8080/product/jiu/8.png','2024-09-17 02:22:21','2024-10-04 13:53:39',1,1),(43,'啤酒 C','进口啤酒，纯正口感',11.00,550,4,1,280,'http://localhost:8080/product/jiu/9.png','2024-09-17 02:22:21','2024-10-04 13:53:39',1,1),(44,'果汁 C','新鲜果汁，低糖低卡',9.00,300,7,1,95,'http://localhost:8080/product/guozhi/3.png','2024-09-17 02:22:21','2024-10-04 12:10:36',1,1),(45,'牛奶 C','有机牛奶，健康之选',7.50,500,38,1,230,'http://localhost:8080/product/niunai/3.png','2024-09-17 02:22:21','2024-10-04 13:10:18',1,1),(46,'薯片 C','薯片，咸香酥脆',5.50,950,10,1,610,'http://localhost:8080/product/shupian/3.png','2024-09-17 02:22:21','2024-10-04 12:12:06',1,1),(47,'巧克力 C','手工巧克力，香浓甜美',16.00,270,12,1,135,'http://localhost:8080/product/qiaokeli/3.png','2024-09-17 02:22:21','2024-10-04 12:09:39',1,1),(48,'笔记本电脑 C','商务笔记本，续航超强',4800.00,110,20,1,72,'http://localhost:8080/product/diannao/3.png','2024-09-17 02:22:21','2024-10-04 13:58:45',1,1),(49,'智能手机 C','旗舰款智能手机，超大屏幕',3400.00,190,24,1,108,'http://localhost:8080/product/shouji/3.png','2024-09-17 02:22:21','2024-10-04 14:00:50',1,1),(50,'男装 C','男士商务西装，剪裁合身',220.00,270,28,1,160,'http://localhost:8080/product/fuzhuang/7.png','2024-09-17 02:22:21','2024-10-04 11:26:25',1,1),(51,'女装 C','女士夏季连衣裙，清爽透气',170.00,230,29,1,120,'http://localhost:8080/product/fuzhuang/8.png','2024-09-17 02:22:21','2024-10-04 11:26:25',1,1),(52,'童装 C','儿童T恤，夏季新款',90.00,350,30,1,220,'http://localhost:8080/product/fuzhuang/9.png','2024-09-17 02:22:21','2024-10-04 11:26:25',1,1),(53,'红酒 D','进口红酒，浓郁果香',160.00,55,2,1,42,'http://localhost:8080/product/jiu/10.png','2024-09-17 02:22:21','2024-10-04 13:53:39',1,1),(54,'白酒 D','高端白酒，陈酿十年',95.00,140,3,1,28,'http://localhost:8080/product/jiu/1.png','2024-09-17 02:22:21','2024-10-04 13:53:39',1,1),(55,'啤酒 D','清爽型啤酒，夏季必备',12.50,510,4,1,300,'http://localhost:8080/product/jiu/2.png','2024-09-17 02:22:21','2024-10-04 13:53:39',1,1),(56,'果汁 D','混合果汁，富含维生素',11.00,320,7,1,85,'http://localhost:8080/product/guozhi/4.png','2024-09-17 02:22:21','2024-10-04 12:10:37',1,1),(57,'牛奶 D','脱脂牛奶，低脂肪',9.00,490,38,1,210,'http://localhost:8080/product/niunai/4.png','2024-09-17 02:22:21','2024-10-04 13:10:19',1,1),(58,'薯片 D','多口味薯片，畅享美味',6.00,910,10,1,590,'http://localhost:8080/product/shupian/4.png','2024-09-17 02:22:21','2024-10-04 12:12:06',1,1),(59,'巧克力 D','浓郁巧克力，融化于口',20.00,260,12,1,128,'http://localhost:8080/product/qiaokeli/4.png','2024-09-17 02:22:21','2024-10-04 12:09:39',1,1),(60,'冰箱 D','大容量双开门冰箱，节能环保',3400.00,50,15,1,24,'http://localhost:8080/product/bingxiang/4.png','2024-09-17 02:22:21','2024-10-04 13:57:36',1,1),(61,'洗衣机 D','智能洗衣机，自动烘干',2700.00,70,16,1,32,'http://localhost:8080/product/xiyiji/4.png','2024-09-17 02:22:21','2024-10-04 11:54:14',1,1),(62,'智能手表 B','时尚智能手表，全天候健康监测',850.00,140,25,1,120,'http://localhost:8080/product/shoubiao/2.png','2024-09-17 02:41:34','2024-10-04 12:18:14',1,1),(63,'耳机 B','降噪无线耳机，高清音质',320.00,378,22,1,180,'http://localhost:8080/product/erji/2.png','2024-09-17 02:41:34','2024-10-05 06:12:41',1,1),(64,'键盘 B','背光机械键盘，适合游戏玩家',520.00,190,21,1,150,'http://localhost:8080/product/jianpanshubiao/2.png','2024-09-17 02:41:34','2024-10-04 11:49:51',1,1),(65,'鼠标 B','专业游戏鼠标，超快速响应',210.00,340,21,1,160,'http://localhost:8080/product/jianpanshubiao/7.png','2024-09-17 02:41:34','2024-10-04 11:50:23',1,1),(66,'显示器 B','32寸4K高清显示器，支持HDR',2500.00,80,39,1,85,'http://localhost:8080/product/xianshiqi/2.png','2024-09-17 02:41:34','2024-10-04 13:47:32',1,9),(67,'电视 B','55寸智能电视，超高清画质',4000.00,90,18,1,50,'http://localhost:8080/product/dianshi/2.png','2024-09-17 02:41:34','2024-10-04 11:55:10',1,1),(68,'冰箱 E','三门冰箱，大容量节能',3000.00,55,15,1,22,'http://localhost:8080/product/bingxiang/5.png','2024-09-17 02:41:34','2024-10-04 13:57:36',1,1),(69,'洗衣机 E','滚筒式洗衣机，带烘干功能',2800.00,65,16,1,25,'http://localhost:8080/product/xiyiji/5.png','2024-09-17 02:41:34','2024-10-04 11:54:14',1,1),(70,'空调 E','中央空调，强劲制冷',4500.00,40,17,1,18,'http://localhost:8080/product/kongtiao/5.png','2024-09-17 02:41:34','2024-10-04 11:19:17',1,1),(71,'红酒 E','高档红酒，口感醇厚',180.00,60,2,1,40,'http://localhost:8080/product/jiu/3.png','2024-09-17 02:41:34','2024-10-04 13:53:39',1,1),(72,'白酒 E','年份白酒，口感纯正',130.00,140,3,1,33,'http://localhost:8080/product/jiu/4.png','2024-09-17 02:41:34','2024-10-04 13:53:39',1,1),(73,'啤酒 E','进口啤酒，浓香顺滑',20.00,600,4,1,450,'http://localhost:8080/product/jiu/5.png','2024-09-17 02:41:34','2024-10-04 13:53:39',1,1),(74,'果汁 E','有机果汁，无添加',15.00,300,7,1,140,'http://localhost:8080/product/guozhi/5.png','2024-09-17 02:41:34','2024-10-04 12:10:37',1,1),(75,'牛奶 E','高钙牛奶，适合各年龄段',9.50,500,38,1,300,'http://localhost:8080/product/niunai/5.png','2024-09-17 02:41:34','2024-10-04 13:10:19',1,9),(76,'薯片 E','经典薯片，多种口味可选',6.50,898,10,1,752,'http://localhost:8080/product/shupian/5.png','2024-09-17 02:41:34','2024-10-04 12:12:06',1,9),(77,'巧克力 E','黑巧克力，口感浓郁',25.00,265,12,1,165,'http://localhost:8080/product/qiaokeli/5.png','2024-09-17 02:41:34','2024-10-04 12:09:39',1,9),(78,'智能手机 E','最新款智能手机，全面屏设计',3900.00,170,24,1,120,'http://localhost:8080/product/shouji/4.png','2024-09-17 02:41:34','2024-10-04 14:00:50',1,1),(79,'笔记本电脑 E','高端笔记本，适合设计和编程',6000.00,95,20,1,80,'http://localhost:8080/product/diannao/4.png','2024-09-17 02:41:34','2024-10-04 13:58:45',1,1),(80,'电视 C','75寸智能电视，支持8K显示',8500.00,50,18,1,30,'http://localhost:8080/product/dianshi/3.png','2024-09-17 02:41:34','2024-10-04 11:55:10',1,1),(81,'耳机 C','蓝牙耳机，降噪效果出色',350.00,350,22,1,200,'http://localhost:8080/product/erji/3.png','2024-09-17 02:41:34','2024-10-04 13:59:44',1,1),(82,'洗衣机 F','洗烘一体机，支持APP远程控制',3200.00,55,16,1,35,'http://localhost:8080/product/xiyiji/6.png','2024-09-17 02:41:34','2024-10-04 11:54:15',1,1),(83,'空调 F','壁挂式空调，支持智能调节',2900.00,45,17,1,22,'http://localhost:8080/product/kongtiao/6.png','2024-09-17 02:41:34','2024-10-04 11:19:17',1,1),(84,'电视 D','60寸电视，4K超高清',3700.00,85,18,1,60,'http://localhost:8080/product/dianshi/4.png','2024-09-17 02:41:34','2024-10-04 11:55:10',1,1),(85,'冰箱 F','双开门冰箱，低耗能',3100.00,60,15,1,50,'http://localhost:8080/product/bingxiang/6.png','2024-09-17 02:41:34','2024-10-04 13:57:37',1,1),(86,'耳机 D','有线耳机，音质清晰',120.00,480,22,1,260,'http://localhost:8080/product/erji/4.png','2024-09-17 02:41:34','2024-10-04 13:59:44',1,1),(87,'键盘 C','防水机械键盘，耐用性强',450.00,190,21,1,100,'http://localhost:8080/product/jianpanshubiao/3.png','2024-09-17 02:41:34','2024-10-04 11:49:51',1,1),(88,'鼠标 C','轻便无线鼠标，电池耐用',150.00,370,21,1,150,'http://localhost:8080/product/jianpanshubiao/8.png','2024-09-17 02:41:34','2024-10-04 11:50:23',1,1),(89,'显示器 C','24寸全高清显示器，适合办公',1500.00,120,39,1,65,'http://localhost:8080/product/xianshiqi/3.png','2024-09-17 02:41:34','2024-10-04 13:47:32',1,9),(90,'智能手机 F','曲面屏智能手机，支持5G',4100.00,130,24,1,110,'http://localhost:8080/product/shouji/5.png','2024-09-17 02:41:34','2024-10-04 14:00:50',1,1),(91,'笔记本电脑 F','轻薄笔记本，支持触屏操作',5800.00,85,20,1,95,'http://localhost:8080/product/diannao/5.png','2024-09-17 02:41:34','2024-10-04 13:58:45',1,1),(92,'冰箱 G','智能冰箱，支持语音控制',4000.00,70,15,1,40,'http://localhost:8080/product/bingxiang/7.png','2024-09-17 02:41:34','2024-10-04 13:57:37',1,1),(93,'洗衣机 G','全自动洗衣机，智能节水',2900.00,50,16,1,45,'http://localhost:8080/product/xiyiji/7.png','2024-09-17 02:41:34','2024-10-04 11:54:15',1,1),(94,'空调 G','节能型空调，快速制冷',3200.00,60,17,1,20,'http://localhost:8080/product/kongtiao/7.png','2024-09-17 02:41:34','2024-10-04 11:19:17',1,1),(95,'红酒 F','经典红酒，适合宴会和礼品',250.00,70,2,1,48,'http://localhost:8080/product/jiu/6.png','2024-09-17 02:41:34','2024-10-04 13:53:39',1,1),(96,'白酒 F','老字号白酒，纯正口感',150.00,180,3,1,28,'http://localhost:8080/product/jiu/7.png','2024-09-17 02:41:34','2024-10-04 13:53:39',1,1),(97,'啤酒 F','瓶装啤酒，清爽口感',15.00,600,4,1,420,'http://localhost:8080/product/jiu/8.png','2024-09-17 02:41:34','2024-10-04 13:53:39',1,1),(98,'果汁 F','纯果汁，无添加糖',12.00,280,7,1,115,'http://localhost:8080/product/guozhi/6.png','2024-09-17 02:41:34','2024-10-04 12:10:36',1,1),(99,'牛奶 F','儿童牛奶，富含钙和维生素',10.50,460,38,1,280,'http://localhost:8080/product/niunai/6.png','2024-09-17 02:41:34','2024-10-04 13:10:19',1,9),(100,'薯片 F','低脂薯片，适合健身人士',7.50,780,10,1,620,'http://localhost:8080/product/shupian/6.png','2024-09-17 02:41:34','2024-10-04 12:12:06',1,1),(101,'巧克力 F','果仁巧克力，口感丰富',30.00,246,12,1,139,'http://localhost:8080/product/qiaokeli/6.png','2024-09-17 02:41:34','2024-10-04 12:09:39',1,9),(102,'智能手表 G','新款运动手表，防水防尘',1100.00,130,25,1,110,'http://localhost:8080/product/shoubiao/3.png','2024-09-17 02:41:34','2024-10-04 12:18:14',1,1),(103,'笔记本电脑 G','商务笔记本，性能稳定',6200.00,75,20,1,85,'http://localhost:8080/product/diannao/6.png','2024-09-17 02:41:34','2024-10-04 13:58:45',1,1),(104,'电视 F','85寸电视，支持8K播放',9200.00,40,18,1,35,'http://localhost:8080/product/dianshi/5.png','2024-09-17 02:41:34','2024-10-04 11:55:10',1,1),(105,'耳机 F','高保真耳机，带麦克风',500.00,310,22,1,180,'http://localhost:8080/product/erji/5.png','2024-09-17 02:41:34','2024-10-04 13:59:44',1,1),(106,'显示器 D','28寸显示器，支持HDR10',1800.00,90,39,1,75,'http://localhost:8080/product/xianshiqi/4.png','2024-09-17 02:41:34','2024-10-04 13:47:33',1,9),(221,'智能手表 H','高端智能手表，全天候心率监测',1400.00,90,25,1,95,'http://localhost:8080/product/shoubiao/4.png','2024-09-17 02:47:43','2024-10-04 12:18:14',1,1),(222,'耳机 G','降噪耳机，适合长时间佩戴',360.00,280,22,1,190,'http://localhost:8080/product/erji/6.png','2024-09-17 02:47:43','2024-10-04 13:59:44',1,1),(223,'键盘 F','超薄机械键盘，极致手感',650.00,170,21,1,160,'http://localhost:8080/product/jianpanshubiao/4.png','2024-09-17 02:47:43','2024-10-04 11:49:51',1,1),(224,'鼠标 F','无线办公鼠标，适合各类场景',180.00,320,21,1,140,'http://localhost:8080/product/jianpanshubiao/9.png','2024-09-17 02:47:43','2024-10-04 11:50:23',1,1),(225,'显示器 E','27寸显示器，4K分辨率，广色域',2000.00,100,39,1,90,'http://localhost:8080/product/xianshiqi/5.png','2024-09-17 02:47:43','2024-10-04 13:47:33',1,9),(226,'冰箱 L','四门冰箱，风冷无霜',3800.00,65,15,1,35,'http://localhost:8080/product/bingxiang/8.png','2024-09-17 02:47:43','2024-10-04 13:57:37',1,1),(227,'洗衣机 H','带烘干功能的全自动洗衣机',3000.00,45,16,1,40,'http://localhost:8080/product/xiyiji/8.png','2024-09-17 02:47:43','2024-10-04 11:54:14',1,1),(228,'空调 H','1.5匹壁挂空调，静音省电',2400.00,50,17,1,25,'http://localhost:8080/product/kongtiao/8.png','2024-09-17 02:47:43','2024-10-04 11:19:17',1,1),(229,'红酒 I','法国红酒，口感饱满',260.00,55,2,1,50,'http://localhost:8080/product/jiu/9.png','2024-09-17 02:47:43','2024-10-04 13:53:39',1,1),(230,'白酒 G','高度白酒，传统工艺酿造',180.00,120,3,1,40,'http://localhost:8080/product/jiu/10.png','2024-09-17 02:47:43','2024-10-04 13:53:39',1,1),(231,'啤酒 G','德式啤酒，香气浓郁',28.00,680,4,1,480,'http://localhost:8080/product/jiu/1.png','2024-09-17 02:47:43','2024-10-04 13:53:39',1,1),(232,'果汁 G','纯果汁，健康无糖',18.50,320,7,1,150,'http://localhost:8080/product/guozhi/7.png','2024-09-17 02:47:43','2024-10-04 12:10:36',1,1),(233,'牛奶 G','草饲牛奶，营养丰富',12.50,520,38,1,310,'http://localhost:8080/product/niunai/7.png','2024-09-17 02:47:43','2024-10-04 13:10:18',1,9),(234,'薯片 G','烤制薯片，低油健康',8.50,738,10,1,672,'http://localhost:8080/product/shupian/7.png','2024-09-17 02:47:43','2024-10-04 12:12:06',1,9),(235,'巧克力 G','白巧克力，丝滑口感',32.00,240,12,1,130,'http://localhost:8080/product/qiaokeli/7.png','2024-09-17 02:47:43','2024-10-04 12:09:39',1,1),(236,'智能手机 H','全面屏智能手机，超长续航',4800.00,150,24,1,135,'http://localhost:8080/product/shouji/6.png','2024-09-17 02:47:43','2024-10-04 14:00:50',1,1),(237,'笔记本电脑 H','超高性能笔记本，适合商务办公',7200.00,67,20,1,88,'http://localhost:8080/product/diannao/7.png','2024-09-17 02:47:43','2024-10-04 13:58:45',1,9),(238,'电视 G','65寸OLED电视，画质细腻',8800.00,55,18,1,40,'http://localhost:8080/product/dianshi/6.png','2024-09-17 02:47:43','2024-10-04 11:55:10',1,1),(239,'冰箱 H','大容量双开门冰箱，变频节能',4200.00,60,15,1,45,'http://localhost:8080/product/bingxiang/9.png','2024-09-17 02:47:43','2024-10-04 13:57:37',1,1),(240,'耳机 H','蓝牙耳机，带充电盒',390.00,290,22,1,210,'http://localhost:8080/product/erji/7.png','2024-09-17 02:47:43','2024-10-04 13:59:44',1,1),(241,'洗衣机 I','节能型滚筒洗衣机',2700.00,50,16,1,30,'http://localhost:8080/product/xiyiji/9.png','2024-09-17 02:47:43','2024-10-04 11:54:15',1,1),(242,'空调 I','立式空调，支持远程控制',3600.00,35,17,1,15,'http://localhost:8080/product/kongtiao/9.png','2024-09-17 02:47:43','2024-10-04 11:19:17',1,1),(243,'智能手机 I','大屏手机，强劲性能',5400.00,110,24,1,125,'http://localhost:8080/product/shouji/7.png','2024-09-17 02:47:43','2024-10-04 14:00:50',1,1),(244,'笔记本电脑 I','工作站笔记本，支持多屏',8200.00,50,20,1,60,'http://localhost:8080/product/diannao/8.png','2024-09-17 02:47:43','2024-10-04 13:58:45',1,1),(245,'耳机 I','耳挂式运动耳机',250.00,400,22,1,220,'http://localhost:8080/product/erji/8.png','2024-09-17 02:47:43','2024-10-04 13:59:44',1,1),(246,'红酒 H','年份红酒，口感复杂',320.00,50,2,1,45,'http://localhost:8080/product/jiu/2.png','2024-09-17 02:47:43','2024-10-04 13:53:39',1,1),(247,'白酒 H','老酒，深厚香味',240.00,100,3,1,50,'http://localhost:8080/product/jiu/3.png','2024-09-17 02:47:43','2024-10-04 13:53:39',1,1),(248,'啤酒 H','瓶装精酿啤酒',38.00,560,4,1,420,'http://localhost:8080/product/jiu/4.png','2024-09-17 02:47:43','2024-10-04 13:53:39',1,1),(249,'果汁 H','冷榨果汁，保留营养',20.00,240,7,1,135,'http://localhost:8080/product/guozhi/8.png','2024-09-17 02:47:43','2024-10-04 12:10:37',1,1),(250,'牛奶 H','全脂牛奶，富含维生素D',14.00,480,38,1,290,'http://localhost:8080/product/niunai/8.png','2024-09-17 02:47:43','2024-10-04 13:10:18',1,9),(251,'薯片 H','脆烤薯片，低卡路里',10.00,720,10,1,640,'http://localhost:8080/product/shupian/8.png','2024-09-17 02:47:43','2024-10-04 12:12:06',1,1),(252,'巧克力 H','夹心巧克力，丰富口感',38.00,220,12,1,140,'http://localhost:8080/product/qiaokeli/8.png','2024-09-17 02:47:43','2024-10-04 12:09:39',1,1),(253,'智能手机 J','旗舰智能手机，快速充电',5200.00,118,24,1,132,'http://localhost:8080/product/shouji/8.png','2024-09-17 02:47:43','2024-10-05 06:10:53',1,9),(254,'笔记本电脑 J','轻薄笔记本，超高分辨率屏幕',6800.00,65,20,1,90,'http://localhost:8080/product/diannao/9.png','2024-09-17 02:47:43','2024-10-04 13:58:45',1,1),(255,'耳机 J','高保真音乐耳机',430.00,270,22,1,180,'http://localhost:8080/product/erji/9.png','2024-09-17 02:47:43','2024-10-04 13:59:44',1,1),(256,'显示器 F','34寸超宽屏显示器，游戏玩家首选',3000.00,85,39,1,70,'http://localhost:8080/product/xianshiqi/6.png','2024-09-17 02:47:43','2024-10-04 13:47:33',1,9),(257,'冰箱 I','风冷冰箱，节能省电',4500.00,55,15,1,50,'http://localhost:8080/product/bingxiang/10.png','2024-09-17 02:47:43','2024-10-04 13:57:37',1,1),(258,'洗衣机 J','变频洗衣机，带智能调节功能',3400.00,40,16,1,35,'http://localhost:8080/product/xiyiji/10.png','2024-09-17 02:47:43','2024-10-04 11:54:15',1,1),(370,'洗衣机 Z','变频洗衣机，带智能调节功能',3400.00,40,16,1,35,'http://localhost:8080/product/xiyiji/1.png','2024-09-17 02:53:41','2024-10-04 13:31:13',1,9),(371,'空调 J','智能空调，支持自动清洁',3500.00,50,17,1,20,'http://localhost:8080/product/kongtiao/10.png','2024-09-17 02:53:41','2024-10-04 13:31:27',1,9),(372,'智能手表 I','高精度智能手表，支持多种运动模式',1550.00,85,25,1,80,'http://localhost:8080/product/shoubiao/5.png','2024-09-17 02:53:41','2024-10-04 13:31:42',1,9),(373,'耳机 K','无线耳机，舒适贴合',420.00,300,22,1,190,'http://localhost:8080/product/erji/10.png','2024-09-17 02:53:41','2024-10-04 13:59:44',1,9),(374,'键盘 G','多功能机械键盘，支持宏定义',700.00,160,21,1,170,'http://localhost:8080/product/jianpanshubiao/5.png','2024-09-17 02:53:41','2024-10-04 11:49:51',1,1),(375,'鼠标 G','高精度游戏鼠标，适合竞技游戏',230.00,300,21,1,190,'http://localhost:8080/product/jianpanshubiao/10.png','2024-09-17 02:53:41','2024-10-04 11:50:23',1,1),(376,'显示器 G','32寸曲面显示器，适合游戏玩家',2800.00,70,39,1,55,'http://localhost:8080/product/xianshiqi/7.png','2024-09-17 02:53:41','2024-10-04 13:47:33',1,9),(377,'冰箱 J','多门智能冰箱，支持联网功能',4200.00,60,15,1,40,'http://localhost:8080/product/bingxiang/1.png','2024-09-17 02:53:41','2024-10-04 13:57:37',1,1),(378,'洗衣机 K','全自动洗衣机，支持智能控制',3100.00,50,16,1,38,'http://localhost:8080/product/xiyiji/2.png','2024-09-17 02:53:41','2024-10-04 11:54:14',1,1),(379,'空调 K','冷暖空调，节能高效',3400.00,55,17,1,25,'http://localhost:8080/product/kongtiao/1.png','2024-09-17 02:53:41','2024-10-04 11:19:17',1,1),(380,'红酒 Z','葡萄酒，口感柔顺',290.00,65,2,1,42,'http://localhost:8080/product/jiu/5.png','2024-09-17 02:53:41','2024-10-04 13:53:39',1,1),(381,'白酒 I','白酒，口感浓烈',200.00,140,3,1,35,'http://localhost:8080/product/jiu/6.png','2024-09-17 02:53:41','2024-10-04 13:53:39',1,1),(382,'啤酒 I','纯麦啤酒，泡沫丰富',22.00,620,4,1,500,'http://localhost:8080/product/jiu/7.png','2024-09-17 02:53:41','2024-10-04 13:53:39',1,1),(383,'果汁 I','浓缩果汁，纯天然',17.00,290,7,1,145,'http://localhost:8080/product/guozhi/9.png','2024-09-17 02:53:41','2024-10-04 12:10:36',1,1),(384,'牛奶 I','无糖牛奶，适合减肥人士',11.50,540,38,1,300,'http://localhost:8080/product/niunai/9.png','2024-09-17 02:53:41','2024-10-04 13:10:19',1,9),(385,'薯片 I','健康薯片，低盐少油',9.00,760,10,1,690,'http://localhost:8080/product/shupian/9.png','2024-09-17 02:53:41','2024-10-04 12:12:06',1,1),(386,'巧克力 I','黑巧克力，适合成人',35.00,270,12,1,140,'http://localhost:8080/product/qiaokeli/9.png','2024-09-17 02:53:41','2024-10-04 12:09:39',1,1),(387,'智能手机 Z','高性能智能手机，适合游戏',5000.00,140,24,1,130,'http://localhost:8080/product/shouji/9.png','2024-09-17 02:53:41','2024-10-04 14:00:50',1,1),(388,'笔记本电脑 K','轻薄笔记本，适合移动办公',6500.00,85,20,1,95,'http://localhost:8080/product/diannao/10.png','2024-09-17 02:53:41','2024-10-04 13:58:45',1,1),(389,'电视 H','85寸智能电视，超高清画质',9500.00,45,18,1,50,'http://localhost:8080/product/dianshi/7.png','2024-09-17 02:53:41','2024-10-04 11:55:10',1,1),(390,'耳机 L','运动蓝牙耳机，防水设计',370.00,300,22,1,200,'http://localhost:8080/product/erji/1.png','2024-09-17 02:53:41','2024-10-04 13:59:44',1,1),(391,'显示器 H','27寸高刷新率显示器，适合电竞',2500.00,75,39,1,80,'http://localhost:8080/product/xianshiqi/8.png','2024-09-17 02:53:41','2024-10-04 13:47:33',1,9),(392,'冰箱 K','双开门冰箱，智能调节温度',4300.00,55,15,1,48,'http://localhost:8080/product/bingxiang/2.png','2024-09-17 02:53:41','2024-10-04 13:57:37',1,1),(393,'洗衣机 L','滚筒洗衣机，静音节能',2900.00,40,16,1,42,'http://localhost:8080/product/xiyiji/3.png','2024-09-17 02:53:41','2024-10-04 11:54:15',1,1),(394,'空调 L','智能冷暖空调，支持语音控制',3700.00,45,17,1,30,'http://localhost:8080/product/kongtiao/2.png','2024-09-17 02:53:41','2024-10-04 11:19:17',1,1),(395,'红酒 J','年份红酒，适合收藏',340.00,60,2,1,55,'http://localhost:8080/product/jiu/8.png','2024-09-17 02:53:41','2024-10-04 13:53:39',1,1),(396,'白酒 J','传统白酒，浓烈醇香',220.00,130,3,1,48,'http://localhost:8080/product/jiu/9.png','2024-09-17 02:53:41','2024-10-04 13:53:39',1,1),(397,'啤酒 J','清爽啤酒，适合聚会',25.00,640,4,1,510,'http://localhost:8080/product/jiu/10.png','2024-09-17 02:53:41','2024-10-04 13:53:39',1,1),(398,'果汁 J','新鲜果汁，保留原汁原味',19.00,300,7,1,150,'http://localhost:8080/product/guozhi/10.png','2024-09-17 02:53:41','2024-10-04 12:10:36',1,1),(399,'牛奶 J','高蛋白牛奶，增强体力',13.00,500,38,1,320,'http://localhost:8080/product/niunai/10.png','2024-09-17 02:53:41','2024-10-04 13:10:18',1,9),(400,'薯片 J','原味薯片，口感酥脆',11.00,780,10,1,710,'http://localhost:8080/product/shupian/10.png','2024-09-17 02:53:41','2024-10-04 12:12:06',1,1),(401,'巧克力 J','牛奶巧克力，甜蜜口感',36.00,260,12,1,150,'http://localhost:8080/product/qiaokeli/10.png','2024-09-17 02:53:41','2024-10-04 12:09:39',1,1),(402,'智能手表 J','运动智能手表，支持多种运动模式',1600.00,75,25,1,70,'http://localhost:8080/product/shoubiao/6.png','2024-09-17 02:53:41','2024-10-04 12:18:14',1,1),(403,'笔记本电脑 L','高效能笔记本，适合编程使用',7000.00,60,20,1,70,'http://localhost:8080/product/diannao/1.png','2024-09-17 02:53:41','2024-10-04 13:58:45',1,1),(404,'电视 I','70寸智能电视，4K画质',7800.00,50,18,1,55,'http://localhost:8080/product/dianshi/8.png','2024-09-17 02:53:41','2024-10-04 11:55:10',1,1),(405,'耳机 M','耳机，舒适佩戴',440.00,320,22,1,220,'http://localhost:8080/product/erji/2.png','2024-09-17 02:53:41','2024-10-04 13:59:44',1,1),(406,'显示器 I','34寸超宽显示器，适合设计',3200.00,65,39,1,65,'http://localhost:8080/product/xianshiqi/9.png','2024-09-17 02:53:41','2024-10-04 13:47:33',1,9);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_favorites`
--

DROP TABLE IF EXISTS `product_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID, 关联用户表',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品ID, 关联商品表',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_product` (`user_id`,`product_id`) COMMENT '防止重复收藏',
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_favorites`
--

LOCK TABLES `product_favorites` WRITE;
/*!40000 ALTER TABLE `product_favorites` DISABLE KEYS */;
INSERT INTO `product_favorites` VALUES (4,9,68,'2024-09-25 16:41:33','2024-09-25 16:41:33'),(5,9,104,'2024-09-25 16:41:37','2024-09-25 16:41:37'),(8,9,96,'2024-09-26 08:13:03','2024-09-26 08:13:03'),(12,9,16,'2024-09-26 08:43:22','2024-09-26 08:43:22'),(30,9,97,'2024-09-27 08:39:52','2024-09-27 08:39:52'),(31,9,79,'2024-09-27 08:40:30','2024-09-27 08:40:30'),(33,9,1,'2024-09-29 15:38:41','2024-09-29 15:38:41'),(36,9,10,'2024-10-01 05:22:21','2024-10-01 05:22:21'),(37,9,376,'2024-10-04 13:33:09','2024-10-04 13:33:09');
/*!40000 ALTER TABLE `product_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specifications`
--

DROP TABLE IF EXISTS `product_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_specifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品规格关联ID',
  `product_id` bigint(20) NOT NULL COMMENT '关联的商品ID',
  `specification_id` bigint(20) NOT NULL COMMENT '关联的规格ID',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建用户ID',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新用户ID',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `specification_id` (`specification_id`)
) ENGINE=MyISAM AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品与规格选项关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specifications`
--

LOCK TABLES `product_specifications` WRITE;
/*!40000 ALTER TABLE `product_specifications` DISABLE KEYS */;
INSERT INTO `product_specifications` VALUES (128,43,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(127,42,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(120,1,4,'2024-10-04 13:53:38',NULL,'2024-10-04 13:53:38',NULL),(126,41,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(125,18,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(121,2,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(124,17,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(123,16,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(122,3,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(10,4,1,'2024-09-17 13:01:44',4,'2024-09-17 13:01:44',4),(11,4,2,'2024-09-17 13:01:44',4,'2024-09-17 13:01:44',4),(12,4,3,'2024-09-17 13:01:44',4,'2024-09-17 13:01:44',4),(13,5,2,'2024-09-17 13:01:44',5,'2024-09-17 13:01:44',5),(14,5,4,'2024-09-17 13:01:44',5,'2024-09-17 13:01:44',5),(15,5,6,'2024-09-17 13:01:44',5,'2024-09-17 13:01:44',5),(19,7,2,'2024-09-17 13:01:44',7,'2024-09-17 13:01:44',7),(20,7,4,'2024-09-17 13:01:44',7,'2024-09-17 13:01:44',7),(21,7,6,'2024-09-17 13:01:44',7,'2024-09-17 13:01:44',7),(152,23,7,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(151,8,24,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(150,8,7,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(25,9,1,'2024-09-17 13:01:44',9,'2024-09-17 13:01:44',9),(26,9,3,'2024-09-17 13:01:44',9,'2024-09-17 13:01:44',9),(27,9,5,'2024-09-17 13:01:44',9,'2024-09-17 13:01:44',9),(28,10,2,'2024-09-17 13:01:44',10,'2024-09-17 13:01:44',10),(29,10,4,'2024-09-17 13:01:44',10,'2024-09-17 13:01:44',10),(30,10,6,'2024-09-17 13:01:44',10,'2024-09-17 13:01:44',10),(53,409,6,'2024-10-02 08:23:09',9,'2024-10-02 08:23:09',9),(52,409,4,'2024-10-02 08:23:09',9,'2024-10-02 08:23:09',9),(86,39,11,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(51,408,7,'2024-10-02 08:22:20',9,'2024-10-02 08:22:20',9),(50,408,4,'2024-10-02 08:22:20',9,'2024-10-02 08:22:20',9),(49,408,3,'2024-10-02 08:22:20',9,'2024-10-02 08:22:20',9),(110,376,11,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(113,391,10,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(112,391,1,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(117,406,10,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(116,406,1,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(105,256,10,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(104,256,1,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(101,225,10,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(100,225,1,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(89,66,10,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(88,66,1,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(93,89,10,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(92,89,1,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(97,106,10,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(96,106,1,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(85,39,10,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(84,39,1,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(72,370,7,'2024-10-04 13:31:13',9,'2024-10-04 13:31:13',9),(73,370,24,'2024-10-04 13:31:13',9,'2024-10-04 13:31:13',9),(74,371,7,'2024-10-04 13:31:27',9,'2024-10-04 13:31:27',9),(75,372,16,'2024-10-04 13:31:42',9,'2024-10-04 13:31:42',9),(247,373,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(109,376,10,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(108,376,1,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(87,39,13,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(90,66,11,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(91,66,13,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(94,89,11,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(95,89,13,'2024-10-04 13:47:32',NULL,'2024-10-04 13:47:32',NULL),(98,106,11,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(99,106,13,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(102,225,11,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(103,225,13,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(106,256,11,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(107,256,13,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(111,376,13,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(114,391,11,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(115,391,13,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(118,406,11,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(119,406,13,'2024-10-04 13:47:33',NULL,'2024-10-04 13:47:33',NULL),(129,53,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(130,54,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(131,55,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(132,71,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(133,72,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(134,73,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(135,95,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(136,96,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(137,97,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(138,229,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(139,230,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(140,231,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(141,246,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(142,247,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(143,248,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(144,380,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(145,381,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(146,382,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(147,395,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(148,396,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(149,397,4,'2024-10-04 13:53:39',NULL,'2024-10-04 13:53:39',NULL),(153,23,24,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(154,32,7,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(155,32,24,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(156,60,7,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(157,60,24,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(158,68,7,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(159,68,24,'2024-10-04 13:57:36',NULL,'2024-10-04 13:57:36',NULL),(160,85,7,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(161,85,24,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(162,92,7,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(163,92,24,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(164,226,7,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(165,226,24,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(166,239,7,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(167,239,24,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(168,257,7,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(169,257,24,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(170,377,7,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(171,377,24,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(172,392,7,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(173,392,24,'2024-10-04 13:57:37',NULL,'2024-10-04 13:57:37',NULL),(174,11,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(175,11,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(176,11,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(177,11,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(178,11,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(179,26,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(180,26,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(181,26,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(182,26,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(183,26,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(184,48,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(185,48,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(186,48,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(187,48,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(188,48,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(189,79,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(190,79,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(191,79,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(192,79,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(193,79,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(194,91,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(195,91,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(196,91,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(197,91,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(198,91,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(199,103,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(200,103,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(201,103,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(202,103,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(203,103,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(204,237,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(205,237,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(206,237,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(207,237,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(208,237,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(209,244,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(210,244,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(211,244,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(212,244,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(213,244,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(214,254,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(215,254,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(216,254,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(217,254,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(218,254,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(219,388,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(220,388,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(221,388,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(222,388,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(223,388,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(224,403,8,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(225,403,10,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(226,403,9,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(227,403,14,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(228,403,15,'2024-10-04 13:58:45',NULL,'2024-10-04 13:58:45',NULL),(229,36,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(230,36,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(231,63,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(232,63,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(233,81,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(234,81,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(235,86,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(236,86,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(237,105,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(238,105,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(239,222,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(240,222,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(241,240,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(242,240,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(243,245,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(244,245,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(245,255,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(246,255,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(248,373,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(249,390,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(250,390,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(251,405,20,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(252,405,21,'2024-10-04 13:59:44',NULL,'2024-10-04 13:59:44',NULL),(253,12,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(254,12,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(255,12,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(256,12,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(257,27,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(258,27,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(259,27,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(260,27,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(261,49,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(262,49,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(263,49,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(264,49,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(265,78,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(266,78,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(267,78,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(268,78,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(269,90,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(270,90,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(271,90,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(272,90,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(273,236,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(274,236,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(275,236,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(276,236,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(277,243,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(278,243,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(279,243,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(280,243,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(281,253,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(282,253,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(283,253,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(284,253,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(285,387,5,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(286,387,9,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(287,387,15,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL),(288,387,27,'2024-10-04 14:00:50',NULL,'2024-10-04 14:00:50',NULL);
/*!40000 ALTER TABLE `product_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specifications`
--

DROP TABLE IF EXISTS `specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `specifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规格ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规格名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格描述',
  `status` tinyint(4) DEFAULT '1' COMMENT '规格状态，1表示启用，0表示禁用',
  `specification_options` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规格选项，用逗号隔开',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建用户的ID',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新用户的ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='规格表，存储商品的规格信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specifications`
--

LOCK TABLES `specifications` WRITE;
/*!40000 ALTER TABLE `specifications` DISABLE KEYS */;
INSERT INTO `specifications` VALUES (1,'颜色','可选颜色',1,'红色,蓝色,绿色,黄色,紫色','2024-09-17 12:55:06',1,'2024-09-17 12:55:06',NULL),(2,'尺寸','可选尺寸',1,'S,M,L,XL,XXL','2024-09-17 12:55:06',1,'2024-09-17 12:55:06',NULL),(3,'材质','可选材质',1,'棉,涤纶,羊毛,丝绸,牛仔','2024-09-17 12:55:06',1,'2024-09-30 14:00:45',9),(4,'容量','容量规格',1,'100ml,200ml,400ml,1L','2024-09-17 12:55:06',2,'2024-10-04 13:56:06',9),(5,'电池容量','电池的容量',1,'1000mAh,2000mAh,3000mAh,4000mAh','2024-09-17 12:55:06',2,'2024-09-17 12:55:06',NULL),(6,'重量','产品重量',1,'0.5kg,1kg,1.5kg,2kg','2024-09-17 12:55:06',3,'2024-09-17 12:55:06',NULL),(7,'功率','电器功率',1,'100W,200W,300W,500W,1000W','2024-09-17 12:55:06',2,'2024-10-02 17:15:51',9),(8,'硬盘','硬盘容量',1,'256GB,512GB,1TB,2TB','2024-09-17 12:55:06',4,'2024-09-30 14:17:01',9),(9,'处理器','可选处理器型号',1,'i3,i5,i7,Ryzen 5,Ryzen 7','2024-09-17 12:55:06',5,'2024-09-17 12:55:06',NULL),(10,'屏幕尺寸','屏幕的尺寸',1,'13英寸,14英寸,15英寸,17英寸','2024-09-17 12:55:06',3,'2024-09-30 15:29:22',9),(11,'分辨率','屏幕分辨率',1,'1080p,2K,4K','2024-09-17 12:55:06',5,'2024-09-17 12:55:06',NULL),(12,'接口类型','设备接口类型',1,'USB-A,USB-C,HDMI,VGA,雷电3','2024-09-17 12:55:06',4,'2024-09-17 12:55:06',NULL),(13,'刷新率','屏幕刷新率',1,'60Hz,90Hz,120Hz,144Hz','2024-09-17 12:55:06',5,'2024-09-17 12:55:06',NULL),(14,'显卡','显卡型号',1,'GTX 1650,RTX 2060,RTX 3070,RTX 3080','2024-09-17 12:55:06',6,'2024-09-17 12:55:06',NULL),(15,'内存','内存容量',1,'4GB,8GB,16GB,32GB','2024-09-17 12:55:06',5,'2024-09-17 12:55:06',NULL),(16,'手表表带','手表表带类型',1,'皮革,金属,硅胶,尼龙','2024-09-17 12:55:06',3,'2024-09-17 12:55:06',NULL),(17,'鞋码','鞋子尺码',1,'35,36,37,38,39,40,41,42,43,44','2024-09-17 12:55:06',1,'2024-09-17 12:55:06',NULL),(18,'风格','服饰风格',1,'休闲,商务,运动,时尚,复古','2024-09-17 12:55:06',3,'2024-09-17 12:55:06',NULL),(19,'香型','香水香型',1,'花香型,果香型,木质香,麝香','2024-09-17 12:55:06',1,'2024-09-17 12:55:06',NULL),(20,'音质','耳机音质类型',1,'低音加强,均衡,高音清晰','2024-09-17 12:55:06',2,'2024-09-17 12:55:06',NULL),(21,'颜色分类','常见颜色分类',1,'黑色,白色,灰色,棕色,蓝色','2024-09-17 12:55:06',1,'2024-09-17 12:55:06',NULL),(22,'灯光模式','RGB 灯光模式',1,'单色,呼吸灯,彩虹灯效','2024-09-17 12:55:06',2,'2024-09-17 12:55:06',NULL),(23,'材质分类','材料类型',1,'塑料,金属,玻璃,陶瓷','2024-09-17 12:55:06',3,'2024-09-17 12:55:06',NULL),(24,'电压','电压规格',1,'110V,220V,380V','2024-09-17 12:55:06',5,'2024-09-17 12:55:06',NULL),(25,'频率响应','音频设备频率响应范围',1,'20Hz-20kHz,50Hz-18kHz,10Hz-40kHz','2024-09-17 12:55:06',4,'2024-09-17 12:55:06',NULL),(26,'接口数量','可用接口数量',1,'2个,4个,6个,8个','2024-09-17 12:55:06',4,'2024-09-17 12:55:06',NULL),(27,'防水等级','防水等级',1,'IPX3,IPX5,IPX7,IP68','2024-09-17 12:55:06',6,'2024-09-17 12:55:06',NULL),(28,'时区','时区选择',1,'GMT+0,GMT+1,GMT+8,GMT-5','2024-09-17 12:55:06',5,'2024-09-17 12:55:06',NULL),(29,'温度范围','工作温度范围',1,'-20°C-50°C,0°C-100°C','2024-09-17 12:55:06',3,'2024-09-17 12:55:06',NULL),(30,'速度','传输速度',1,'10Mbps,100Mbps,1Gbps,10Gbps','2024-09-17 12:55:06',4,'2024-09-17 12:55:06',NULL),(33,'种类','描述种类',0,'动物,老鼠,鸟','2024-09-30 15:28:01',9,'2024-09-30 15:28:01',9),(32,'非常的生产','DVD尺寸VS',0,'v但是v但是v,vfdsv,jop','2024-09-30 14:17:40',9,'2024-09-30 15:24:28',9);
/*!40000 ALTER TABLE `specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '密码加密的盐值',
  `status` tinyint(4) DEFAULT '1' COMMENT '用户状态（1=正常，0=禁用）',
  `role` varchar(20) DEFAULT 'USER' COMMENT '用户角色',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `last_login` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '用户头像URL',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别（0=未知，1=男，2=女）',
  `birthdate` date DEFAULT NULL COMMENT '生日',
  `address` varchar(255) DEFAULT NULL COMMENT '默认收货地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'cstery','fjc2977023857@outlook.com',NULL,'56cd6541e34ea1697ca69c0e33d27dfc','qOTh7PgZ7C6KLTKA+YLr3A==',1,'ADMIN','2024-09-15 03:30:23','2024-10-05 08:59:32','2024-10-05 08:59:33',NULL,NULL,NULL,NULL),(4,'lwy123','lwy333@qq.com',NULL,'e5987403d130fb7174b846d5c57ac488','ct1hBDj8T154tQW5r8Sf3A==',1,'USER','2024-09-15 05:39:59','2024-10-05 08:59:32','2024-10-05 08:59:33',NULL,NULL,NULL,NULL),(7,'qwdq','dasd@qq.com',NULL,'acccb27533f1531ab1ec42252224dd92','XVy/EVgEEFxMiCoDi8JxDg==',1,'USER','2024-09-15 06:27:28','2024-10-05 08:59:32','2024-10-05 08:59:33',NULL,NULL,NULL,NULL),(8,'jinggna','fjidf@qq.com',NULL,'911e6140803ff3de4db3d4e89cfaf32f','qOeRLgJ/l0hckDmRkMcb7A==',1,'USER','2024-09-15 06:30:27','2024-10-05 08:59:32','2024-10-05 08:59:33',NULL,NULL,NULL,NULL),(9,'fjc663','fjc115125@outlook.com','13380801988','b0642315a65cf5fad5b2b8014e12f2c9','qXg73APHHdPTeOyz69BsEw==',1,'SUPER','2024-09-15 08:19:42','2024-10-05 08:59:32','2024-10-05 08:59:33','https://cstery-sky.oss-cn-beijing.aliyuncs.com/avatar/0b5ab5e6-49c5-4e6d-bc0e-d52b80a349ec.png',1,'2000-08-26','广东省 广州市 白云区 某某23号'),(10,'lxqian123','fjncds@qq.com',NULL,'1c64b6f46208072015455d9caa7565fa','P2J1CT0Qyh5wIKeEAnn8Iw==',1,'USER','2024-09-15 08:33:34','2024-10-05 08:59:32','2024-10-05 08:59:33',NULL,NULL,NULL,NULL),(19,'liuergou123','lety@outlook.com',NULL,'876550e9b3199c2e4fa1145bdd902bf8','U3tCBhU0Aa+YMcVpMv1g/w==',1,'USER','2024-09-16 04:45:16','2024-10-05 08:59:32','2024-10-05 08:59:33','http://localhost:8080/defaultAvatar.png',NULL,NULL,NULL),(20,'fjccc789','fjv789@qq.com',NULL,'b8e3e13592e9323464468baeb6318291','qThu1O2QFjWcac7oEkuarg==',1,'USER','2024-09-24 14:37:10','2024-10-05 08:59:32','2024-10-05 08:59:33','http://localhost:8080/defaultAvatar.png',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_third_party`
--

DROP TABLE IF EXISTS `user_third_party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_third_party` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '第三方登录唯一标识',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '关联的用户ID',
  `provider` varchar(50) NOT NULL COMMENT '第三方平台名称（如微信，谷歌，Facebook等）',
  `provider_user_id` varchar(255) NOT NULL COMMENT '第三方平台的用户ID',
  `access_token` varchar(255) DEFAULT NULL COMMENT '第三方平台的访问令牌',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '第三方平台的刷新令牌',
  `expires_in` bigint(20) DEFAULT NULL COMMENT '令牌过期时间',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '绑定时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_provider` (`provider`,`provider_user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_third_party_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='第三方登录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_third_party`
--

LOCK TABLES `user_third_party` WRITE;
/*!40000 ALTER TABLE `user_third_party` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_third_party` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-05 17:30:13
