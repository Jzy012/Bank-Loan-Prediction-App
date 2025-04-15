-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: loan_prediction
-- ------------------------------------------------------
-- Server version	8.0.36

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add loan',7,'add_loan'),(26,'Can change loan',7,'change_loan'),(27,'Can delete loan',7,'delete_loan'),(28,'Can view loan',7,'view_loan'),(29,'Can add client',8,'add_client'),(30,'Can change client',8,'change_client'),(31,'Can delete client',8,'delete_client'),(32,'Can view client',8,'view_client');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$cnvBoCM9neMcwzWG7WYi7s$8tFL1VT8HmhKCg6ajPRFttygdUFUw/PJ02enL33dGZA=','2025-04-06 10:08:22.275401',1,'Jc','','','jc@email.com',1,1,'2025-04-06 10:08:05.713303');
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
-- Table structure for table `bankloan_client`
--

DROP TABLE IF EXISTS `bankloan_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankloan_client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankloan_client`
--

LOCK TABLES `bankloan_client` WRITE;
/*!40000 ALTER TABLE `bankloan_client` DISABLE KEYS */;
INSERT INTO `bankloan_client` VALUES (11,'Maria Santos','09171234501'),(12,'Juan Dela Cruz','09171234502'),(13,'Liza Magbanua','09171234503'),(14,'Carlos Reyes','09171234504'),(15,'Andrea Torres','09171234505'),(16,'Pedro Bautista','09171234506'),(17,'Marta Lim','09171234507'),(18,'Ramon Gonzales','09171234508'),(19,'Elena Castro','09171234509'),(20,'Fernando Aquino','09171234510'),(21,'Grace Mendoza','09172234501'),(22,'Daniel Ramos','09172234502'),(23,'Sophia Chua','09172234503'),(24,'Ethan Sy','09172234504'),(25,'Isabella Tan','09172234505'),(26,'Ricardo Santos','09172234506'),(27,'Carmen Lim','09172234507'),(28,'Alberto Reyes','09172234508'),(29,'Veronica Cruz','09172234509'),(30,'Armando Ong','09172234510'),(31,'Olivia Lim','09173334501'),(32,'Benjamin Tan','09173334502'),(33,'Amelia Sy','09173334503'),(34,'Lucas Reyes','09173334504'),(35,'Mia Gonzales','09173334505'),(36,'Roberto Delgado','09173334506'),(37,'Isabel Vasquez','09173334507'),(38,'Fernando Navarro','09173334508'),(39,'Gabriela Molina','09173334509'),(40,'Ricardo Ortega','09173334510'),(41,'Ethan Wong','09174444501'),(42,'Charlotte Uy','09174444502'),(43,'Noah Chen','09174444503'),(44,'Ava Lim','09174444504'),(45,'Liam Tan','09174444505'),(46,'Diego Mendoza','09174444506'),(47,'Valentina Silva','09174444507'),(48,'Mateo Cruz','09174444508'),(49,'Camila Reyes','09174444509'),(50,'Santiago Lopez','09174444510');
/*!40000 ALTER TABLE `bankloan_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankloan_loan`
--

DROP TABLE IF EXISTS `bankloan_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankloan_loan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `payment_duration` int NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_issued` date NOT NULL,
  `client_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bankloan_loan_client_id_980263c5_fk_bankloan_client_id` (`client_id`),
  CONSTRAINT `bankloan_loan_client_id_980263c5_fk_bankloan_client_id` FOREIGN KEY (`client_id`) REFERENCES `bankloan_client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankloan_loan`
--

LOCK TABLES `bankloan_loan` WRITE;
/*!40000 ALTER TABLE `bankloan_loan` DISABLE KEYS */;
INSERT INTO `bankloan_loan` VALUES (40,2500.00,12,5.00,'Paid','2021-01-15',11),(41,1800.00,6,5.50,'Paid','2022-04-20',11),(42,3000.00,24,6.00,'Paid','2022-07-10',11),(43,2200.00,18,5.75,'Ongoing','2023-01-05',11),(44,2000.00,12,5.25,'Paid','2021-05-10',12),(45,2800.00,24,6.00,'Paid','2022-03-15',12),(46,1500.00,6,5.00,'Paid','2023-02-20',12),(47,3000.00,12,5.50,'Paid','2021-03-10',13),(48,2200.00,18,5.75,'Paid','2021-11-12',13),(49,1800.00,6,5.00,'Paid','2022-06-22',13),(50,2500.00,12,5.25,'Ongoing','2023-01-15',13),(51,1500.00,12,15.00,'Overdue','2021-02-10',16),(52,2000.00,6,18.00,'Overdue','2021-08-15',16),(53,2500.00,24,20.00,'Overdue','2022-04-20',16),(54,1800.00,12,15.50,'Ongoing','2023-01-05',16),(55,2200.00,18,18.50,'Overdue','2021-05-15',17),(56,3000.00,36,20.00,'Overdue','2022-02-20',17),(57,1500.00,6,15.00,'Overdue','2022-09-10',17),(58,2200.00,18,16.00,'Ongoing','2022-05-15',18),(59,3500.00,24,22.00,'Paid','2021-10-30',18),(60,2700.00,12,14.50,'Overdue','2023-02-20',18),(61,3000.00,6,19.00,'Ongoing','2023-03-10',18),(62,1300.00,12,13.50,'Paid','2021-06-25',19),(63,2500.00,18,17.50,'Overdue','2022-01-05',19),(64,3000.00,24,21.00,'Ongoing','2022-08-17',19),(65,2200.00,6,15.00,'Overdue','2023-04-01',19),(66,1900.00,12,16.00,'Ongoing','2022-03-03',20),(67,2700.00,6,19.50,'Paid','2021-09-15',20),(68,3200.00,24,23.00,'Overdue','2022-12-10',20),(69,1800.00,18,18.00,'Ongoing','2023-01-25',20),(70,4600.00,6,17.00,'Overdue','2021-10-14',14),(71,5300.00,12,18.50,'Paid','2022-04-07',14),(72,4900.00,18,19.00,'Ongoing','2022-08-22',14),(73,5100.00,24,21.00,'Overdue','2023-01-15',14),(74,4400.00,6,16.50,'Paid','2021-09-18',15),(75,5100.00,12,17.50,'Ongoing','2022-03-12',15),(76,4800.00,18,18.00,'Overdue','2022-11-04',15),(77,5200.00,24,20.00,'Paid','2023-02-28',15),(78,2800.00,12,5.25,'Paid','2021-03-10',21),(79,1900.00,6,5.00,'Paid','2022-01-15',21),(80,3200.00,24,6.25,'Ongoing','2023-02-20',21),(81,2200.00,18,5.50,'Paid','2021-05-12',22),(82,1500.00,6,5.00,'Paid','2022-03-18',22),(83,2500.00,12,5.75,'Paid','2022-11-05',22),(84,3000.00,24,6.00,'Ongoing','2023-01-15',22),(85,1800.00,12,5.00,'Paid','2021-04-20',23),(86,2200.00,18,5.75,'Paid','2021-12-15',23),(87,2900.00,24,6.00,'Paid','2022-08-10',23),(88,1500.00,6,5.00,'Ongoing','2023-03-01',23),(89,2500.00,12,18.00,'Overdue','2021-02-15',26),(90,1800.00,6,20.00,'Overdue','2021-09-20',26),(91,3000.00,24,22.00,'Overdue','2022-04-10',26),(92,2200.00,18,19.50,'Ongoing','2023-01-05',26),(93,1500.00,12,17.50,'Overdue','2021-03-10',27),(94,2800.00,24,20.00,'Overdue','2021-11-15',27),(95,2000.00,6,18.00,'Overdue','2022-05-20',27),(96,2500.00,18,19.00,'Ongoing','2022-12-01',27),(110,10000.00,6,12.00,'Ongoing','2025-04-06',11),(111,2500.00,12,5.00,'Ongoing','2025-04-06',12),(112,2200.00,12,5.25,'Paid','2021-04-10',31),(113,1800.00,6,5.00,'Paid','2021-11-15',31),(114,3000.00,24,6.00,'Paid','2022-06-20',31),(115,2500.00,18,5.75,'Ongoing','2023-01-05',31),(116,2800.00,12,5.50,'Paid','2021-05-12',32),(117,1500.00,6,5.00,'Paid','2022-02-18',32),(118,3200.00,24,6.25,'Ongoing','2022-12-10',32),(119,1500.00,6,5.00,'Paid','2021-03-15',33),(120,2200.00,12,5.25,'Paid','2021-09-20',33),(121,1800.00,18,5.75,'Paid','2022-04-25',33),(122,2500.00,12,5.50,'Paid','2022-11-30',33),(123,3000.00,24,6.00,'Ongoing','2023-03-01',33),(124,2500.00,12,18.50,'Overdue','2021-02-28',36),(125,1800.00,6,20.00,'Overdue','2021-08-15',36),(126,3000.00,24,22.00,'Overdue','2022-03-10',36),(127,2200.00,18,19.00,'Ongoing','2022-12-05',36),(128,1500.00,12,17.00,'Overdue','2021-04-05',37),(129,2800.00,24,20.50,'Overdue','2021-12-20',37),(130,2000.00,18,18.00,'Overdue','2022-07-15',37),(131,2200.00,12,5.00,'Paid','2021-01-10',41),(132,2800.00,18,5.25,'Paid','2021-07-15',41),(133,1500.00,6,4.75,'Paid','2022-01-20',41),(134,3000.00,24,5.50,'Paid','2022-07-25',41),(135,2500.00,12,5.00,'Ongoing','2023-01-30',41),(136,1800.00,6,5.00,'Paid','2021-03-05',42),(137,2200.00,12,5.25,'Paid','2021-09-10',42),(138,3000.00,24,5.75,'Paid','2022-03-15',42),(139,2500.00,18,5.50,'Ongoing','2022-09-20',42),(140,2500.00,12,5.25,'Paid','2021-02-15',43),(141,1500.00,6,5.00,'Paid','2021-08-20',43),(142,2800.00,18,5.50,'Overdue','2022-02-25',43),(143,2200.00,12,5.25,'Ongoing','2022-08-30',43),(144,2500.00,12,18.00,'Overdue','2021-01-05',46),(145,3000.00,24,20.00,'Overdue','2021-07-10',46),(146,1800.00,6,19.00,'Overdue','2022-01-15',46),(147,2200.00,18,18.50,'Ongoing','2022-07-20',46),(148,2800.00,12,19.00,'Overdue','2021-04-10',47),(149,1500.00,6,20.00,'Overdue','2021-10-15',47),(150,2200.00,18,21.00,'Overdue','2022-04-20',47);
/*!40000 ALTER TABLE `bankloan_loan` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-06 10:14:47.645347','34','John Doe - 1000.00',3,'',7,1),(2,'2025-04-06 10:14:47.645453','33','John Doe - 5000.00',3,'',7,1),(3,'2025-04-06 10:14:47.645491','32','John Doe - 5000.00',3,'',7,1),(4,'2025-04-06 10:14:47.645515','31','John Doe - 5000.00',3,'',7,1),(5,'2025-04-06 14:17:19.808466','10','William Thomas',3,'',8,1),(6,'2025-04-06 14:17:19.809416','9','Linda Anderson',3,'',8,1),(7,'2025-04-06 14:17:19.809457','8','Robert Taylor',3,'',8,1),(8,'2025-04-06 14:17:19.809477','7','Patricia Moore',3,'',8,1),(9,'2025-04-06 14:17:19.809494','6','James Wilson',3,'',8,1),(10,'2025-04-06 14:17:19.809509','5','Sarah Davis',3,'',8,1),(11,'2025-04-06 14:17:19.809523','4','Michael Brown',3,'',8,1),(12,'2025-04-06 14:17:19.809537','3','Emily Johnson',3,'',8,1),(13,'2025-04-06 14:17:19.809551','2','Jane Smith',3,'',8,1),(14,'2025-04-06 14:17:19.809566','1','John Doe',3,'',8,1),(15,'2025-04-06 14:53:19.222488','97','Maria Santos - 10000.00',3,'',7,1),(16,'2025-04-06 14:55:23.629721','99','Maria Santos - 5000.00',3,'',7,1),(17,'2025-04-06 14:55:23.629782','98','Maria Santos - 10000.00',3,'',7,1),(18,'2025-04-06 14:58:07.287602','102','Liza Magbanua - 2000.00',3,'',7,1),(19,'2025-04-06 14:58:07.287645','101','Juan Dela Cruz - 15000.00',3,'',7,1),(20,'2025-04-06 14:58:07.287665','100','Maria Santos - 10000.00',3,'',7,1),(21,'2025-04-06 14:59:24.180480','105','Maria Santos - 10000.00',3,'',7,1),(22,'2025-04-06 14:59:24.180602','104','Maria Santos - 15000.00',3,'',7,1),(23,'2025-04-06 14:59:24.180657','103','Maria Santos - 10000.00',3,'',7,1),(24,'2025-04-06 15:00:41.550204','107','Maria Santos - 10000.00',3,'',7,1),(25,'2025-04-06 15:00:41.550283','106','Maria Santos - 10000.00',3,'',7,1),(26,'2025-04-06 15:05:55.864779','109','Juan Dela Cruz - 2000.00',3,'',7,1),(27,'2025-04-06 15:05:55.864991','108','Maria Santos - 10000.00',3,'',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'bankloan','client'),(7,'bankloan','loan'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-05 19:50:06.996202'),(2,'auth','0001_initial','2025-04-05 19:50:08.428725'),(3,'admin','0001_initial','2025-04-05 19:50:08.794930'),(4,'admin','0002_logentry_remove_auto_add','2025-04-05 19:50:08.830079'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-05 19:50:08.849923'),(6,'contenttypes','0002_remove_content_type_name','2025-04-05 19:50:09.009759'),(7,'auth','0002_alter_permission_name_max_length','2025-04-05 19:50:09.172873'),(8,'auth','0003_alter_user_email_max_length','2025-04-05 19:50:09.217448'),(9,'auth','0004_alter_user_username_opts','2025-04-05 19:50:09.230709'),(10,'auth','0005_alter_user_last_login_null','2025-04-05 19:50:09.344301'),(11,'auth','0006_require_contenttypes_0002','2025-04-05 19:50:09.350239'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-05 19:50:09.361040'),(13,'auth','0008_alter_user_username_max_length','2025-04-05 19:50:09.480848'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-05 19:50:09.600497'),(15,'auth','0010_alter_group_name_max_length','2025-04-05 19:50:09.632842'),(16,'auth','0011_update_proxy_permissions','2025-04-05 19:50:09.644137'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-05 19:50:09.770541'),(18,'sessions','0001_initial','2025-04-05 19:50:09.844815'),(19,'bankloan','0001_initial','2025-04-05 20:54:55.409870'),(20,'bankloan','0002_remove_client_trust_rating','2025-04-06 06:52:03.952670'),(21,'bankloan','0003_alter_loan_client','2025-04-06 07:20:45.709112'),(22,'bankloan','0004_alter_loan_status','2025-04-06 10:29:10.502606');
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
INSERT INTO `django_session` VALUES ('72eekpemvsyawrziivyx00gglkf3izm7','.eJxVjDEOwyAQBP9CHSHAcEDK9H4DOg4ITiIsGbuK8vfYkouk2WJndt8s4LbWsPW8hCmxK5Ps8ttFpGduB0gPbPeZ09zWZYr8UPhJOx_nlF-30_07qNjrvib0RiYFJFyRhnzyVlsL4Bw4Y5VGigCwpxdIKhpjc0Zp9JBFtGUo7PMF0ZY3tg:1u1MvO:_6Hm9Re8m6xYFKqa5fa15jknP5FrJNkrb1yWY1gxe90','2025-04-20 10:08:22.297270');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06 23:22:59
