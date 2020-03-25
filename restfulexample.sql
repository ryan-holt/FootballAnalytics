-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: restfulexample
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `permission_level` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('harsohailB','admin',69),('rh3','ryanPassword',3),('string2','2324',0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_timeout`
--

DROP TABLE IF EXISTS `calls_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `calls_timeout` (
  `play_id` int(11) NOT NULL,
  `team_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`play_id`),
  KEY `calls_timeout_play_id_fk_idx` (`team_code`),
  CONSTRAINT `calls_timeout_play_id_fk` FOREIGN KEY (`team_code`) REFERENCES `team` (`team_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_timeout`
--

LOCK TABLES `calls_timeout` WRITE;
/*!40000 ALTER TABLE `calls_timeout` DISABLE KEYS */;
INSERT INTO `calls_timeout` VALUES (368,'CGY'),(535,'CGY'),(645,'CGY'),(691,'CGY'),(585,'MAN'),(680,'MAN'),(684,'MAN'),(384,'UBC'),(396,'UBC');
/*!40000 ALTER TABLE `calls_timeout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `join_date` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('1','john',NULL),('2','sally',NULL),('5','Ryan',NULL),('7','tyler',NULL),('8','cool',NULL),('9','gary',NULL),('harsohailB','pass','2020-02-24 11:57:24'),('hello2','world','2020-02-24 02:17:01');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaching_staff`
--

DROP TABLE IF EXISTS `coaching_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coaching_staff` (
  `coaching_staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_code` varchar(3) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`coaching_staff_id`),
  KEY `coaching_staff_team_team_code_fk` (`team_code`),
  CONSTRAINT `coaching_staff_team_team_code_fk` FOREIGN KEY (`team_code`) REFERENCES `team` (`team_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaching_staff`
--

LOCK TABLES `coaching_staff` WRITE;
/*!40000 ALTER TABLE `coaching_staff` DISABLE KEYS */;
INSERT INTO `coaching_staff` VALUES (1,'CGY','Wayne','Harris','Head Coach'),(2,'CGY','Pat','Sheahan','Offensive Coordinator'),(3,'CGY','Matt','Berry','Defensive Coordinator & Recruiting'),(4,'CGY','Nathan','Mollard','Special Teams Coordinator'),(5,'CGY','Paul','Carson','Offensive Line'),(6,'CGY','Aldo','Laratta','Offensive Line'),(7,'CGY','Gino','DiVincentis','Running Backs'),(8,'CGY','Mike','Rennie','Running Backs'),(9,'CGY','Jabari','Arthur','Receivers'),(10,'CGY','Matt','Lambros','Receivers'),(11,'CGY','Jake','Harty','Receivers'),(12,'CGY','Erik','Glavic','Quarterbacks'),(13,'CGY','Andrew','Buckley','Quarterbacks'),(14,'CGY','Kent','Warnock','Defensive Line'),(15,'CGY','Marvin','Pope','Defensive Line'),(16,'CGY','James','Harris','Linebackers'),(17,'CGY','Mike','Schwieder','Linebackers'),(18,'CGY','Marcello','Rapini','Defensive Backs'),(19,'CGY','Michael','Schmidt','Defensive Backs'),(20,'CGY','Mac','Horwood','Defensive Backs'),(21,'CGY','J.T.','Hay','Kickers'),(22,'CGY','Don','Sweet','Kickers'),(23,'CGY','David','Swagar','Strength & Conditioning Coach, Linebackers'),(24,'CGY','Jose','Delgado','Strength & Conditioning Coach'),(25,'UBC','Blake','Nill','Head Coach'),(26,'UBC','Taylor','Nill','Offensive Coordinator'),(27,'UBC','Pat','Tracey','Defensive Coordinator'),(28,'UBC','Chris','Shibley','Special Teams Coordinator'),(29,'UBC','Shomari','Williams','Football Recruiting Coordinator/Defensive Line'),(30,'UBC','Peter','Buckley','Tight ends and H-backs'),(31,'UBC','Neil','Cartwright','Offensive Line Coach'),(32,'UBC','Josh','Collins','Kickers Coach'),(33,'UBC','Glen','Donaldson','Running Backs Coach'),(34,'UBC','Jordan','Filippelli','Offensive Line Coach'),(35,'UBC','Adrian','Hoople','Linebackers Coach'),(36,'UBC','Cy','Iwanegbe','Defensive Backs'),(37,'UBC','Pascal','Lochard','Offensive Assistant'),(38,'UBC','Cole','Meyer','Offensive Assistant'),(39,'UBC','Jay','Prepchuk','Offensive Assistant'),(40,'UBC','Joe','McCullum','Head Coach, Strength and Conditioning'),(41,'UBC','Tavis','Bruce','Assistant Coach, Strength & Conditioning'),(42,'REG','Mark','McConkey','Interim Head Coach'),(43,'REG','Sheldon','Gray','Defensive Coordinator'),(44,'REG','Jeff','Stusek','Special Teams Coordinator'),(45,'REG','Ventson','Donelson','Defensive Backs Coach'),(46,'REG','John','Hashem','Offensive Line Coach'),(47,'REG','Derek','Lamer','Linebackers Coach'),(48,'REG','Dwayne','Masson','Running Backs Coach'),(49,'REG','Mark','McLoughlin','Special Teams Assistant Coach'),(50,'REG','Sheldon','Neald','Offensive Line Coach'),(51,'REG','Noah','Picton','Quarterbacks Coach'),(52,'REG','Kevin','Pierce','Special Teams Assistant'),(53,'REG','Kyle','Stroeder','Defensive Line Coach'),(54,'REG','Robbie','Avram','Assistant Defensive Backs Coach'),(55,'SSK','Scott','Flory','Head Coach'),(56,'SSK','Warren','Muzika','Defensive Coordinator'),(57,'SSK','Jerry','Friesen','Special Teams Coordinator'),(58,'SSK','Duane','Dmytryshyn','Offensive Assistant - Receivers'),(59,'SSK','Dan','Houle','Offensive Assistant - Running Backs'),(60,'SSK','Lane','Bryksa','Offensive Assistant - Offensive line'),(61,'SSK','Jeremy','Long','Offensive Assistant - Quarterbacks'),(62,'SSK','Kit','Hillis','Offensive Assistant - Receivers'),(63,'SSK','Paul','Woldu','Defensive Assistant - Defensive Backs'),(64,'SSK','Cody','Halseth','Defensive Assistant - Defensive Backs'),(65,'SSK','Tye','Mountney','Defensive Assistant - Linebackers'),(66,'SSK','Tony','Michalchuk','Defensive Assistant - Defensive Line'),(67,'SSK','Braden','Suchan','Special Teams Assistant - Kickers'),(68,'SSK','Joel','Lipinski','Strength & Conditioning Coordinator'),(69,'SSK','Chris','Lambiris','Recruiting Coordinator'),(70,'MAN','Brian','Dobie','Head Coach - Football'),(71,'MAN','Stan','Pierre','Defensive Coordinator / Assistant Head Coach - Football'),(72,'MAN','Vaughan','Mitchell','Offensive Coordinator / Assistant Coach - Football'),(73,'MAN','Cory','Waldbauer','Assistant Coach - Football'),(74,'MAN','Jeff','Ready','Assistant Coach - Football'),(75,'MAN','Scott','Naujoks','Assistant Coach - Football'),(76,'MAN','Dylan','Schrot','Assistant Coach - Football'),(77,'MAN','Ryan','Karhut','Assistant Coach - Football'),(78,'MAN','Mark','Loewen','Assistant Coach - Football'),(79,'MAN','Rich','Urbanovich','Assistant Coach - Football'),(80,'MAN','Sean','Oleksewycz','Assistant Coach - Football'),(81,'MAN','Scott','Barbour','Assistant Coach - Football'),(82,'MAN','Shaquille','Armstrong','Assistant Coach - Football'),(83,'MAN','Lori','Giasson','Certified Athletic Therapist'),(84,'MAN','Cole','Scheller','Strength and Conditioning Coach'),(85,'MAN','Alex','Gardiner','Speed and Power Coach'),(86,'MAN','Evan','Fehr','Athletic Therapy Certification Candidate'),(87,'MAN','Dricx','Catap','Athletic Therapy Certification Candidate'),(88,'MAN','Marion','Morales','Athletic Therapy Certification Candidate'),(89,'MAN','Erin','Martens','Athletic Therapy Certification Candidate'),(90,'MAN','Aska','Liang','Athletic Therapy Certification Candidate'),(91,'MAN','Yuanhe','Li','Athletic Therapy Certification Candidate'),(92,'MAN','Kara','Fulawka','Athletic Therapy Certification Candidate'),(93,'MAN','Zachary','Baron','Athletic Therapy Certification Candidate'),(94,'MAN','Denise','Gill','Equipment and Team Manager - Football'),(95,'MAN','Jenn','Romanoff','Equipment Manager - Football'),(96,'ALB','Greg','Knox','Defensive Coordinator'),(97,'ALB','Rick','Walters','Offensive Coordinator'),(98,'ALB','Tom','Denehey','Offensive Line Coach'),(99,'ALB','Terris','Paliwada','Offensive Line Coach'),(100,'ALB','Smith','Wright','Runningback Coach'),(101,'ALB','Brent','Korte','Defensive Line Coach'),(102,'ALB','Kurtis','Pankow','Defensive Line Coach'),(103,'ALB','Blake','Adams','Defensive Line Coach'),(104,'ALB','David','Noonan','Linebacker Coach'),(105,'ALB','Wade','Dupont','Defensive Back Coach'),(106,'ALB','Reid','Knox','Defensive Back Coach'),(107,'ALB','Dylan','Neidermaier','Defensive Back Coach'),(108,'ALB','Darryl','Szafranski','Receiver Coach'),(109,'ALB','Wyatt','Urbanski','Receiver Coach'),(110,'ALB','Aundrey','Webster','Receiver Coach'),(111,'ALB','Sam','Grewcock','Assistant Coach'),(112,'ALB','Steve','Kasowski','Kicking Coach'),(113,'ALB','Eric','Theroux','Recruiting Coordinator'),(114,'ALB','Russell','Schoeppe','Head Scout'),(115,'ALB','Terry','Baskier','Recruiting Coordinator');
/*!40000 ALTER TABLE `coaching_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follows` (
  `player_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`player_id`,`username`),
  KEY `follows_client_username_fk` (`username`),
  CONSTRAINT `follows_client_username_fk` FOREIGN KEY (`username`) REFERENCES `client` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follows_player_player_id_fk` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (2,'harsohailB'),(272,'harsohailB'),(1,'hello2'),(2,'hello2');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fumble`
--

DROP TABLE IF EXISTS `fumble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fumble` (
  `play_id` int(11) NOT NULL,
  `fum_player_id` int(11) DEFAULT NULL,
  `fum_creation_date` varchar(45) DEFAULT NULL,
  `rec_player_id` int(11) DEFAULT NULL,
  `rec_creation_date` varchar(45) DEFAULT NULL,
  `fumble_yardage` int(11) NOT NULL,
  `forced` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`play_id`),
  KEY `fumble_fum_player_id_creation_date_fk_idx` (`fum_player_id`,`fum_creation_date`),
  KEY `fumble_rec_player_id_creation_date_fk_idx` (`rec_player_id`,`rec_creation_date`),
  CONSTRAINT `fumble_fum_player_id_creation_date_fk` FOREIGN KEY (`fum_player_id`, `fum_creation_date`) REFERENCES `player` (`player_id`, `creation_date`),
  CONSTRAINT `fumble_play_id_fk` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `fumble_rec_player_id_creation_date_fk` FOREIGN KEY (`rec_player_id`, `rec_creation_date`) REFERENCES `player` (`player_id`, `creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fumble`
--

LOCK TABLES `fumble` WRITE;
/*!40000 ALTER TABLE `fumble` DISABLE KEYS */;
INSERT INTO `fumble` VALUES (356,NULL,'2/24/2020 21:01',116,'2/24/2020 21:01',17,'Y'),(446,NULL,'2/24/2020 21:01',NULL,'2/24/2020 21:01',72,NULL),(452,NULL,'2/24/2020 21:01',19,'2/24/2020 21:01',0,NULL),(463,132,'2/24/2020 21:01',40,'2/24/2020 21:01',0,'Y'),(691,NULL,NULL,NULL,NULL,72,NULL);
/*!40000 ALTER TABLE `fumble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `home_team` varchar(3) NOT NULL,
  `home_points` int(11) NOT NULL,
  `away_team` varchar(3) NOT NULL,
  `away_points` int(11) NOT NULL,
  `stadium` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `attendance` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `start_time` varchar(45) NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `game_home_team_fk` (`home_team`),
  KEY `game_away_team_fk` (`away_team`),
  CONSTRAINT `game_away_team_fk` FOREIGN KEY (`away_team`) REFERENCES `team` (`team_code`),
  CONSTRAINT `game_home_team_fk` FOREIGN KEY (`home_team`) REFERENCES `team` (`team_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'ALB',31,'CGY',41,'Foote Field','Edmonton',2300,3,'2019-08-30 19:00:00'),(2,'CGY',20,'REG',7,'McMahon Stadium','Calgary',944,2,'2019-09-20 19:00:00'),(3,'UBC',13,'CGY',47,'Thunderbird Stadium','Vancouver',6363,2,'2019-09-14 19:00:00'),(4,'CGY',24,'MAN',10,'McMahon Stadium','Calgary',6113,2,'2019-09-06 19:00:00'),(5,'CGY',32,'REG',11,'test','test',4848,3,'2019-09-22 19:00:00');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hurries_qb`
--

DROP TABLE IF EXISTS `hurries_qb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hurries_qb` (
  `play_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `creation_date` varchar(45) NOT NULL,
  PRIMARY KEY (`play_id`,`player_id`,`creation_date`),
  KEY `hurries_qb_player_id_creation_date_fk_idx` (`player_id`,`creation_date`),
  CONSTRAINT `hurries_qb_play_id_fk` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `hurries_qb_player_id_creation_date_fk` FOREIGN KEY (`player_id`, `creation_date`) REFERENCES `player` (`player_id`, `creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hurries_qb`
--

LOCK TABLES `hurries_qb` WRITE;
/*!40000 ALTER TABLE `hurries_qb` DISABLE KEYS */;
INSERT INTO `hurries_qb` VALUES (548,4,'2/24/2020 21:01'),(628,9,'2/24/2020 21:01'),(674,9,'2/24/2020 21:01'),(679,81,'2/24/2020 21:01'),(531,83,'2/24/2020 21:01'),(671,83,'2/24/2020 21:01'),(607,86,'2/24/2020 21:01'),(620,86,'2/24/2020 21:01'),(534,89,'2/24/2020 21:01'),(691,101,'2/24/2020 21:01'),(363,144,'2/24/2020 21:01'),(414,161,'2/24/2020 21:01'),(425,162,'2/24/2020 21:01'),(466,162,'2/24/2020 21:01');
/*!40000 ALTER TABLE `hurries_qb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_bc_or_rec`
--

DROP TABLE IF EXISTS `is_bc_or_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `is_bc_or_rec` (
  `play_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `creation_date` varchar(45) NOT NULL,
  PRIMARY KEY (`play_id`,`player_id`,`creation_date`),
  KEY `bc_rec_player_id_creation_date_fk_idx` (`player_id`,`creation_date`),
  CONSTRAINT `bc_rec_play_id_fk` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `bc_rec_player_id_creation_date_fk` FOREIGN KEY (`player_id`, `creation_date`) REFERENCES `player` (`player_id`, `creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_bc_or_rec`
--

LOCK TABLES `is_bc_or_rec` WRITE;
/*!40000 ALTER TABLE `is_bc_or_rec` DISABLE KEYS */;
INSERT INTO `is_bc_or_rec` VALUES (527,1,'2/24/2020 21:01'),(534,1,'2/24/2020 21:01'),(544,1,'2/24/2020 21:01'),(559,1,'2/24/2020 21:01'),(564,1,'2/24/2020 21:01'),(599,1,'2/24/2020 21:01'),(629,1,'2/24/2020 21:01'),(630,1,'2/24/2020 21:01'),(681,1,'2/24/2020 21:01'),(524,3,'2/24/2020 21:01'),(562,3,'2/24/2020 21:01'),(605,3,'2/24/2020 21:01'),(609,3,'2/24/2020 21:01'),(619,3,'2/24/2020 21:01'),(620,3,'2/24/2020 21:01'),(621,3,'2/24/2020 21:01'),(656,3,'2/24/2020 21:01'),(659,3,'2/24/2020 21:01'),(677,3,'2/24/2020 21:01'),(554,5,'2/24/2020 21:01'),(574,5,'2/24/2020 21:01'),(613,5,'2/24/2020 21:01'),(666,5,'2/24/2020 21:01'),(667,5,'2/24/2020 21:01'),(668,5,'2/24/2020 21:01'),(673,5,'2/24/2020 21:01'),(675,5,'2/24/2020 21:01'),(684,5,'2/24/2020 21:01'),(529,6,'2/24/2020 21:01'),(553,6,'2/24/2020 21:01'),(555,6,'2/24/2020 21:01'),(578,6,'2/24/2020 21:01'),(590,6,'2/24/2020 21:01'),(645,6,'2/24/2020 21:01'),(542,10,'2/24/2020 21:01'),(550,10,'2/24/2020 21:01'),(586,10,'2/24/2020 21:01'),(588,10,'2/24/2020 21:01'),(606,10,'2/24/2020 21:01'),(607,10,'2/24/2020 21:01'),(633,10,'2/24/2020 21:01'),(537,11,'2/24/2020 21:01'),(568,11,'2/24/2020 21:01'),(579,11,'2/24/2020 21:01'),(580,11,'2/24/2020 21:01'),(595,11,'2/24/2020 21:01'),(541,12,'2/24/2020 21:01'),(561,12,'2/24/2020 21:01'),(594,12,'2/24/2020 21:01'),(602,12,'2/24/2020 21:01'),(614,12,'2/24/2020 21:01'),(640,12,'2/24/2020 21:01'),(641,12,'2/24/2020 21:01'),(642,12,'2/24/2020 21:01'),(644,12,'2/24/2020 21:01'),(662,12,'2/24/2020 21:01'),(678,12,'2/24/2020 21:01'),(679,12,'2/24/2020 21:01'),(563,15,'2/24/2020 21:01'),(600,15,'2/24/2020 21:01'),(649,15,'2/24/2020 21:01'),(626,16,'2/24/2020 21:01'),(525,17,'2/24/2020 21:01'),(531,17,'2/24/2020 21:01'),(532,17,'2/24/2020 21:01'),(540,17,'2/24/2020 21:01'),(565,17,'2/24/2020 21:01'),(583,17,'2/24/2020 21:01'),(601,17,'2/24/2020 21:01'),(616,17,'2/24/2020 21:01'),(618,17,'2/24/2020 21:01'),(631,17,'2/24/2020 21:01'),(639,17,'2/24/2020 21:01'),(648,17,'2/24/2020 21:01'),(651,17,'2/24/2020 21:01'),(660,17,'2/24/2020 21:01'),(661,17,'2/24/2020 21:01'),(671,17,'2/24/2020 21:01'),(528,20,'2/24/2020 21:01'),(536,20,'2/24/2020 21:01'),(546,20,'2/24/2020 21:01'),(548,20,'2/24/2020 21:01'),(549,20,'2/24/2020 21:01'),(551,20,'2/24/2020 21:01'),(567,20,'2/24/2020 21:01'),(575,20,'2/24/2020 21:01'),(576,20,'2/24/2020 21:01'),(587,20,'2/24/2020 21:01'),(623,20,'2/24/2020 21:01'),(635,20,'2/24/2020 21:01'),(653,20,'2/24/2020 21:01'),(669,20,'2/24/2020 21:01'),(683,20,'2/24/2020 21:01'),(533,27,'2/24/2020 21:01'),(572,27,'2/24/2020 21:01'),(591,27,'2/24/2020 21:01'),(598,27,'2/24/2020 21:01'),(603,27,'2/24/2020 21:01'),(604,27,'2/24/2020 21:01'),(608,27,'2/24/2020 21:01'),(523,29,'2/24/2020 21:01'),(627,29,'2/24/2020 21:01'),(637,29,'2/24/2020 21:01'),(658,29,'2/24/2020 21:01'),(690,29,'2/24/2020 21:01'),(552,31,'2/24/2020 21:01'),(577,31,'2/24/2020 21:01'),(589,31,'2/24/2020 21:01'),(593,31,'2/24/2020 21:01'),(560,74,'2/24/2020 21:01'),(592,74,'2/24/2020 21:01'),(628,74,'2/24/2020 21:01'),(650,74,'2/24/2020 21:01'),(657,74,'2/24/2020 21:01'),(663,74,'2/24/2020 21:01'),(680,74,'2/24/2020 21:01'),(682,74,'2/24/2020 21:01'),(624,75,'2/24/2020 21:01'),(654,75,'2/24/2020 21:01'),(664,75,'2/24/2020 21:01'),(665,75,'2/24/2020 21:01'),(547,76,'2/24/2020 21:01'),(636,76,'2/24/2020 21:01'),(674,76,'2/24/2020 21:01'),(526,79,'2/24/2020 21:01'),(571,79,'2/24/2020 21:01'),(545,80,'2/24/2020 21:01'),(566,80,'2/24/2020 21:01'),(573,80,'2/24/2020 21:01'),(612,80,'2/24/2020 21:01'),(622,80,'2/24/2020 21:01'),(632,80,'2/24/2020 21:01'),(643,80,'2/24/2020 21:01'),(652,80,'2/24/2020 21:01'),(672,80,'2/24/2020 21:01'),(364,100,'2/24/2020 21:01'),(396,100,'2/24/2020 21:01'),(402,100,'2/24/2020 21:01'),(408,100,'2/24/2020 21:01'),(409,100,'2/24/2020 21:01'),(434,100,'2/24/2020 21:01'),(457,100,'2/24/2020 21:01'),(459,100,'2/24/2020 21:01'),(462,100,'2/24/2020 21:01'),(466,100,'2/24/2020 21:01'),(467,100,'2/24/2020 21:01'),(474,100,'2/24/2020 21:01'),(481,100,'2/24/2020 21:01'),(483,100,'2/24/2020 21:01'),(507,100,'2/24/2020 21:01'),(398,103,'2/24/2020 21:01'),(405,103,'2/24/2020 21:01'),(424,103,'2/24/2020 21:01'),(458,103,'2/24/2020 21:01'),(480,103,'2/24/2020 21:01'),(510,103,'2/24/2020 21:01'),(361,104,'2/24/2020 21:01'),(412,104,'2/24/2020 21:01'),(414,104,'2/24/2020 21:01'),(418,104,'2/24/2020 21:01'),(431,104,'2/24/2020 21:01'),(461,104,'2/24/2020 21:01'),(464,104,'2/24/2020 21:01'),(487,104,'2/24/2020 21:01'),(426,107,'2/24/2020 21:01'),(428,107,'2/24/2020 21:01'),(471,107,'2/24/2020 21:01'),(475,107,'2/24/2020 21:01'),(488,107,'2/24/2020 21:01'),(490,107,'2/24/2020 21:01'),(502,107,'2/24/2020 21:01'),(482,108,'2/24/2020 21:01'),(484,108,'2/24/2020 21:01'),(503,108,'2/24/2020 21:01'),(505,108,'2/24/2020 21:01'),(511,108,'2/24/2020 21:01'),(512,108,'2/24/2020 21:01'),(354,111,'2/24/2020 21:01'),(355,111,'2/24/2020 21:01'),(359,111,'2/24/2020 21:01'),(369,111,'2/24/2020 21:01'),(376,111,'2/24/2020 21:01'),(377,111,'2/24/2020 21:01'),(387,111,'2/24/2020 21:01'),(391,111,'2/24/2020 21:01'),(392,111,'2/24/2020 21:01'),(394,111,'2/24/2020 21:01'),(400,111,'2/24/2020 21:01'),(429,111,'2/24/2020 21:01'),(472,111,'2/24/2020 21:01'),(473,111,'2/24/2020 21:01'),(401,125,'2/24/2020 21:01'),(453,125,'2/24/2020 21:01'),(489,125,'2/24/2020 21:01'),(360,126,'2/24/2020 21:01'),(375,126,'2/24/2020 21:01'),(390,126,'2/24/2020 21:01'),(417,126,'2/24/2020 21:01'),(432,126,'2/24/2020 21:01'),(500,126,'2/24/2020 21:01'),(442,127,'2/24/2020 21:01'),(353,128,'2/24/2020 21:01'),(358,128,'2/24/2020 21:01'),(368,128,'2/24/2020 21:01'),(386,128,'2/24/2020 21:01'),(370,131,'2/24/2020 21:01'),(388,131,'2/24/2020 21:01'),(406,131,'2/24/2020 21:01'),(407,131,'2/24/2020 21:01'),(413,131,'2/24/2020 21:01'),(419,131,'2/24/2020 21:01'),(430,131,'2/24/2020 21:01'),(433,131,'2/24/2020 21:01'),(460,131,'2/24/2020 21:01'),(486,131,'2/24/2020 21:01'),(501,131,'2/24/2020 21:01'),(506,131,'2/24/2020 21:01'),(513,131,'2/24/2020 21:01'),(463,132,'2/24/2020 21:01'),(362,135,'2/24/2020 21:01'),(363,135,'2/24/2020 21:01'),(389,135,'2/24/2020 21:01'),(393,135,'2/24/2020 21:01'),(415,135,'2/24/2020 21:01'),(425,135,'2/24/2020 21:01'),(427,135,'2/24/2020 21:01'),(496,138,'2/24/2020 21:01'),(497,138,'2/24/2020 21:01'),(508,138,'2/24/2020 21:01'),(516,138,'2/24/2020 21:01'),(365,140,'2/24/2020 21:01'),(366,140,'2/24/2020 21:01'),(367,140,'2/24/2020 21:01'),(372,140,'2/24/2020 21:01'),(379,140,'2/24/2020 21:01'),(380,140,'2/24/2020 21:01'),(382,140,'2/24/2020 21:01'),(395,140,'2/24/2020 21:01'),(397,140,'2/24/2020 21:01'),(403,140,'2/24/2020 21:01'),(404,140,'2/24/2020 21:01'),(421,140,'2/24/2020 21:01'),(423,140,'2/24/2020 21:01'),(441,140,'2/24/2020 21:01'),(446,140,'2/24/2020 21:01'),(449,140,'2/24/2020 21:01'),(455,140,'2/24/2020 21:01'),(456,140,'2/24/2020 21:01'),(468,140,'2/24/2020 21:01'),(492,140,'2/24/2020 21:01'),(515,140,'2/24/2020 21:01'),(691,140,'2/24/2020 21:01'),(485,142,'2/24/2020 21:01'),(499,142,'2/24/2020 21:01'),(448,147,'2/24/2020 21:01'),(477,147,'2/24/2020 21:01'),(384,148,'2/24/2020 21:01'),(445,148,'2/24/2020 21:01'),(493,154,'2/24/2020 21:01'),(498,154,'2/24/2020 21:01'),(504,158,'2/24/2020 21:01'),(436,167,'2/24/2020 21:01'),(439,167,'2/24/2020 21:01'),(517,167,'2/24/2020 21:01'),(694,167,'2/24/2020 21:01'),(440,169,'2/24/2020 21:01'),(443,169,'2/24/2020 21:01'),(450,169,'2/24/2020 21:01'),(469,169,'2/24/2020 21:01'),(478,169,'2/24/2020 21:01'),(479,169,'2/24/2020 21:01'),(381,170,'2/24/2020 21:01'),(422,170,'2/24/2020 21:01'),(444,170,'2/24/2020 21:01'),(451,170,'2/24/2020 21:01'),(495,170,'2/24/2020 21:01'),(509,170,'2/24/2020 21:01'),(378,173,'2/24/2020 21:01'),(416,173,'2/24/2020 21:01');
/*!40000 ALTER TABLE `is_bc_or_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_kicker`
--

DROP TABLE IF EXISTS `is_kicker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `is_kicker` (
  `play_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `creation_date` varchar(45) NOT NULL,
  `kick_yardage` int(11) NOT NULL,
  `kick_result` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`play_id`,`player_id`,`creation_date`),
  KEY `is_kicker_player_id_creation_date_fk_idx` (`player_id`,`creation_date`),
  CONSTRAINT `is_kicker_player_id_creation_date_fk` FOREIGN KEY (`player_id`, `creation_date`) REFERENCES `player` (`player_id`, `creation_date`),
  CONSTRAINT `play_id_fk` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_kicker`
--

LOCK TABLES `is_kicker` WRITE;
/*!40000 ALTER TABLE `is_kicker` DISABLE KEYS */;
INSERT INTO `is_kicker` VALUES (353,159,'2/24/2020 21:01',56,'R'),(356,145,'2/24/2020 21:01',-14,'B'),(357,145,'2/24/2020 21:01',12,''),(358,159,'2/24/2020 21:01',55,'R'),(364,145,'2/24/2020 21:01',41,'R'),(368,159,'2/24/2020 21:01',43,'R'),(371,145,'2/24/2020 21:01',25,'O'),(386,159,'2/24/2020 21:01',41,'R'),(399,159,'2/24/2020 21:01',27,''),(402,145,'2/24/2020 21:01',36,'R'),(405,159,'2/24/2020 21:01',50,'R'),(408,145,'2/24/2020 21:01',33,'R'),(411,159,'2/24/2020 21:01',43,''),(420,145,'2/24/2020 21:01',12,''),(421,145,'2/24/2020 21:01',34,'R'),(424,159,'2/24/2020 21:01',49,'R'),(435,145,'2/24/2020 21:01',12,''),(436,145,'2/24/2020 21:01',48,'R'),(439,145,'2/24/2020 21:01',50,'R'),(447,145,'2/24/2020 21:01',12,''),(448,145,'2/24/2020 21:01',36,'R'),(452,159,'2/24/2020 21:01',-10,'B'),(454,145,'2/24/2020 21:01',12,''),(455,145,'2/24/2020 21:01',57,'R'),(458,159,'2/24/2020 21:01',44,'R'),(462,145,'2/24/2020 21:01',45,'R'),(467,145,'2/24/2020 21:01',51,'R'),(476,145,'2/24/2020 21:01',12,''),(477,145,'2/24/2020 21:01',30,'R'),(480,159,'2/24/2020 21:01',50,'R'),(491,145,'2/24/2020 21:01',12,''),(492,145,'2/24/2020 21:01',55,'R'),(507,145,'2/24/2020 21:01',38,'R'),(510,159,'2/24/2020 21:01',46,'R'),(514,145,'2/24/2020 21:01',35,''),(515,145,'2/24/2020 21:01',40,'R'),(518,159,'2/24/2020 21:01',36,'D'),(522,45,'2/24/2020 21:01',65,'R'),(530,45,'2/24/2020 21:01',42,'R'),(535,11,'2/24/2020 21:01',34,'O'),(539,45,'2/24/2020 21:01',70,'R'),(545,11,'2/24/2020 21:01',50,'R'),(556,45,'2/24/2020 21:01',12,''),(557,45,'2/24/2020 21:01',57,'T'),(566,11,'2/24/2020 21:01',41,'R'),(570,45,'2/24/2020 21:01',60,'R'),(573,11,'2/24/2020 21:01',50,'P'),(581,45,'2/24/2020 21:01',12,''),(582,45,'2/24/2020 21:01',61,'R'),(591,45,'2/24/2020 21:01',46,'R'),(596,45,'2/24/2020 21:01',12,''),(597,45,'2/24/2020 21:01',59,'R'),(610,11,'2/24/2020 21:01',28,''),(612,11,'2/24/2020 21:01',70,'R'),(615,45,'2/24/2020 21:01',33,'O'),(622,11,'2/24/2020 21:01',49,'R'),(626,45,'2/24/2020 21:01',39,'R'),(632,11,'2/24/2020 21:01',47,'R'),(637,45,'2/24/2020 21:01',36,'R'),(643,11,'2/24/2020 21:01',36,'R'),(646,45,'2/24/2020 21:01',35,'O'),(652,11,'2/24/2020 21:01',37,'R'),(655,45,'2/24/2020 21:01',37,'O'),(669,45,'2/24/2020 21:01',40,'R'),(672,11,'2/24/2020 21:01',44,'R'),(676,45,'2/24/2020 21:01',45,'R');
/*!40000 ALTER TABLE `is_kicker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_primary_def`
--

DROP TABLE IF EXISTS `is_primary_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `is_primary_def` (
  `play_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `creation_date` varchar(45) NOT NULL,
  PRIMARY KEY (`play_id`,`player_id`,`creation_date`),
  KEY `is_primary_def_player_id_creation_date_fk_idx` (`player_id`,`creation_date`),
  CONSTRAINT `is_primary_def_play_id_fk` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `is_primary_def_player_id_creation_date_fk` FOREIGN KEY (`player_id`, `creation_date`) REFERENCES `player` (`player_id`, `creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_primary_def`
--

LOCK TABLES `is_primary_def` WRITE;
/*!40000 ALTER TABLE `is_primary_def` DISABLE KEYS */;
INSERT INTO `is_primary_def` VALUES (525,2,'2/24/2020 21:01'),(527,2,'2/24/2020 21:01'),(553,2,'2/24/2020 21:01'),(559,2,'2/24/2020 21:01'),(562,2,'2/24/2020 21:01'),(568,2,'2/24/2020 21:01'),(578,2,'2/24/2020 21:01'),(604,2,'2/24/2020 21:01'),(623,2,'2/24/2020 21:01'),(630,2,'2/24/2020 21:01'),(648,2,'2/24/2020 21:01'),(673,2,'2/24/2020 21:01'),(526,3,'2/24/2020 21:01'),(571,3,'2/24/2020 21:01'),(619,3,'2/24/2020 21:01'),(628,3,'2/24/2020 21:01'),(659,3,'2/24/2020 21:01'),(677,3,'2/24/2020 21:01'),(528,6,'2/24/2020 21:01'),(614,6,'2/24/2020 21:01'),(564,8,'2/24/2020 21:01'),(600,8,'2/24/2020 21:01'),(621,8,'2/24/2020 21:01'),(662,8,'2/24/2020 21:01'),(663,8,'2/24/2020 21:01'),(679,8,'2/24/2020 21:01'),(523,9,'2/24/2020 21:01'),(561,9,'2/24/2020 21:01'),(563,9,'2/24/2020 21:01'),(592,9,'2/24/2020 21:01'),(593,9,'2/24/2020 21:01'),(647,9,'2/24/2020 21:01'),(649,9,'2/24/2020 21:01'),(683,9,'2/24/2020 21:01'),(684,9,'2/24/2020 21:01'),(690,9,'2/24/2020 21:01'),(537,13,'2/24/2020 21:01'),(547,13,'2/24/2020 21:01'),(594,13,'2/24/2020 21:01'),(633,13,'2/24/2020 21:01'),(653,13,'2/24/2020 21:01'),(654,13,'2/24/2020 21:01'),(664,13,'2/24/2020 21:01'),(637,14,'2/24/2020 21:01'),(524,15,'2/24/2020 21:01'),(560,15,'2/24/2020 21:01'),(608,15,'2/24/2020 21:01'),(616,15,'2/24/2020 21:01'),(617,15,'2/24/2020 21:01'),(631,15,'2/24/2020 21:01'),(639,15,'2/24/2020 21:01'),(605,22,'2/24/2020 21:01'),(643,23,'2/24/2020 21:01'),(665,23,'2/24/2020 21:01'),(672,24,'2/24/2020 21:01'),(550,25,'2/24/2020 21:01'),(586,25,'2/24/2020 21:01'),(657,25,'2/24/2020 21:01'),(667,25,'2/24/2020 21:01'),(532,26,'2/24/2020 21:01'),(541,26,'2/24/2020 21:01'),(587,26,'2/24/2020 21:01'),(598,26,'2/24/2020 21:01'),(530,30,'2/24/2020 21:01'),(669,33,'2/24/2020 21:01'),(536,37,'2/24/2020 21:01'),(589,37,'2/24/2020 21:01'),(644,37,'2/24/2020 21:01'),(612,38,'2/24/2020 21:01'),(652,38,'2/24/2020 21:01'),(676,39,'2/24/2020 21:01'),(546,40,'2/24/2020 21:01'),(549,40,'2/24/2020 21:01'),(577,40,'2/24/2020 21:01'),(603,40,'2/24/2020 21:01'),(618,40,'2/24/2020 21:01'),(656,40,'2/24/2020 21:01'),(570,41,'2/24/2020 21:01'),(582,41,'2/24/2020 21:01'),(539,42,'2/24/2020 21:01'),(597,42,'2/24/2020 21:01'),(548,44,'2/24/2020 21:01'),(551,44,'2/24/2020 21:01'),(574,44,'2/24/2020 21:01'),(579,44,'2/24/2020 21:01'),(635,44,'2/24/2020 21:01'),(666,44,'2/24/2020 21:01'),(522,46,'2/24/2020 21:01'),(575,46,'2/24/2020 21:01'),(576,46,'2/24/2020 21:01'),(542,47,'2/24/2020 21:01'),(543,47,'2/24/2020 21:01'),(545,47,'2/24/2020 21:01'),(627,47,'2/24/2020 21:01'),(629,47,'2/24/2020 21:01'),(640,47,'2/24/2020 21:01'),(670,47,'2/24/2020 21:01'),(591,49,'2/24/2020 21:01'),(584,81,'2/24/2020 21:01'),(641,81,'2/24/2020 21:01'),(658,81,'2/24/2020 21:01'),(602,83,'2/24/2020 21:01'),(678,83,'2/24/2020 21:01'),(567,86,'2/24/2020 21:01'),(572,86,'2/24/2020 21:01'),(642,86,'2/24/2020 21:01'),(446,101,'2/24/2020 21:01'),(450,101,'2/24/2020 21:01'),(494,101,'2/24/2020 21:01'),(508,101,'2/24/2020 21:01'),(691,101,'2/24/2020 21:01'),(378,102,'2/24/2020 21:01'),(392,102,'2/24/2020 21:01'),(431,102,'2/24/2020 21:01'),(452,102,'2/24/2020 21:01'),(471,102,'2/24/2020 21:01'),(364,103,'2/24/2020 21:01'),(380,103,'2/24/2020 21:01'),(381,103,'2/24/2020 21:01'),(396,103,'2/24/2020 21:01'),(443,103,'2/24/2020 21:01'),(478,103,'2/24/2020 21:01'),(496,103,'2/24/2020 21:01'),(402,106,'2/24/2020 21:01'),(361,107,'2/24/2020 21:01'),(388,109,'2/24/2020 21:01'),(406,109,'2/24/2020 21:01'),(375,111,'2/24/2020 21:01'),(412,111,'2/24/2020 21:01'),(417,111,'2/24/2020 21:01'),(485,111,'2/24/2020 21:01'),(436,116,'2/24/2020 21:01'),(492,116,'2/24/2020 21:01'),(355,130,'2/24/2020 21:01'),(356,133,'2/24/2020 21:01'),(366,133,'2/24/2020 21:01'),(395,133,'2/24/2020 21:01'),(498,133,'2/24/2020 21:01'),(369,134,'2/24/2020 21:01'),(372,134,'2/24/2020 21:01'),(386,134,'2/24/2020 21:01'),(389,134,'2/24/2020 21:01'),(390,134,'2/24/2020 21:01'),(394,134,'2/24/2020 21:01'),(398,134,'2/24/2020 21:01'),(405,134,'2/24/2020 21:01'),(414,134,'2/24/2020 21:01'),(415,134,'2/24/2020 21:01'),(427,134,'2/24/2020 21:01'),(430,134,'2/24/2020 21:01'),(461,134,'2/24/2020 21:01'),(468,134,'2/24/2020 21:01'),(473,134,'2/24/2020 21:01'),(474,134,'2/24/2020 21:01'),(484,134,'2/24/2020 21:01'),(504,134,'2/24/2020 21:01'),(360,136,'2/24/2020 21:01'),(393,136,'2/24/2020 21:01'),(432,136,'2/24/2020 21:01'),(481,136,'2/24/2020 21:01'),(482,136,'2/24/2020 21:01'),(483,136,'2/24/2020 21:01'),(502,136,'2/24/2020 21:01'),(365,139,'2/24/2020 21:01'),(379,139,'2/24/2020 21:01'),(422,139,'2/24/2020 21:01'),(449,139,'2/24/2020 21:01'),(409,140,'2/24/2020 21:01'),(444,140,'2/24/2020 21:01'),(493,140,'2/24/2020 21:01'),(358,143,'2/24/2020 21:01'),(458,143,'2/24/2020 21:01'),(480,143,'2/24/2020 21:01'),(487,143,'2/24/2020 21:01'),(359,144,'2/24/2020 21:01'),(377,144,'2/24/2020 21:01'),(429,144,'2/24/2020 21:01'),(391,145,'2/24/2020 21:01'),(507,145,'2/24/2020 21:01'),(368,150,'2/24/2020 21:01'),(397,150,'2/24/2020 21:01'),(505,150,'2/24/2020 21:01'),(510,150,'2/24/2020 21:01'),(387,152,'2/24/2020 21:01'),(401,153,'2/24/2020 21:01'),(433,153,'2/24/2020 21:01'),(460,153,'2/24/2020 21:01'),(501,153,'2/24/2020 21:01'),(513,153,'2/24/2020 21:01'),(416,155,'2/24/2020 21:01'),(428,155,'2/24/2020 21:01'),(511,155,'2/24/2020 21:01'),(424,156,'2/24/2020 21:01'),(488,157,'2/24/2020 21:01'),(353,158,'2/24/2020 21:01'),(408,158,'2/24/2020 21:01'),(455,158,'2/24/2020 21:01'),(462,158,'2/24/2020 21:01'),(477,158,'2/24/2020 21:01'),(515,158,'2/24/2020 21:01'),(373,159,'2/24/2020 21:01'),(423,159,'2/24/2020 21:01'),(456,159,'2/24/2020 21:01'),(495,159,'2/24/2020 21:01'),(367,160,'2/24/2020 21:01'),(374,160,'2/24/2020 21:01'),(441,160,'2/24/2020 21:01'),(354,161,'2/24/2020 21:01'),(376,161,'2/24/2020 21:01'),(400,161,'2/24/2020 21:01'),(426,161,'2/24/2020 21:01'),(472,161,'2/24/2020 21:01'),(503,161,'2/24/2020 21:01'),(512,161,'2/24/2020 21:01'),(464,162,'2/24/2020 21:01'),(448,174,'2/24/2020 21:01');
/*!40000 ALTER TABLE `is_primary_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_secondary_def`
--

DROP TABLE IF EXISTS `is_secondary_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `is_secondary_def` (
  `play_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `creation_date` varchar(45) NOT NULL,
  PRIMARY KEY (`play_id`,`player_id`,`creation_date`),
  KEY `is_secondary_def_player_id_creation_date_fk_idx` (`player_id`,`creation_date`),
  CONSTRAINT `is_secondary_def_play_id_fk` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `is_secondary_def_player_id_creation_date_fk` FOREIGN KEY (`player_id`, `creation_date`) REFERENCES `player` (`player_id`, `creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_secondary_def`
--

LOCK TABLES `is_secondary_def` WRITE;
/*!40000 ALTER TABLE `is_secondary_def` DISABLE KEYS */;
INSERT INTO `is_secondary_def` VALUES (683,6,'2/24/2020 21:01'),(627,9,'2/24/2020 21:01'),(608,22,'2/24/2020 21:01'),(577,23,'2/24/2020 21:01'),(546,25,'2/24/2020 21:01'),(564,25,'2/24/2020 21:01'),(575,25,'2/24/2020 21:01'),(586,26,'2/24/2020 21:01'),(662,26,'2/24/2020 21:01'),(614,37,'2/24/2020 21:01'),(548,40,'2/24/2020 21:01'),(567,40,'2/24/2020 21:01'),(657,40,'2/24/2020 21:01'),(536,44,'2/24/2020 21:01'),(589,44,'2/24/2020 21:01'),(621,47,'2/24/2020 21:01'),(649,47,'2/24/2020 21:01'),(658,47,'2/24/2020 21:01'),(612,48,'2/24/2020 21:01'),(643,48,'2/24/2020 21:01'),(652,49,'2/24/2020 21:01'),(691,101,'2/24/2020 21:01'),(482,116,'2/24/2020 21:01'),(467,118,'2/24/2020 21:01'),(458,127,'2/24/2020 21:01'),(378,133,'2/24/2020 21:01'),(382,133,'2/24/2020 21:01'),(492,133,'2/24/2020 21:01'),(366,134,'2/24/2020 21:01'),(379,134,'2/24/2020 21:01'),(444,134,'2/24/2020 21:01'),(472,134,'2/24/2020 21:01'),(389,136,'2/24/2020 21:01'),(424,143,'2/24/2020 21:01'),(355,145,'2/24/2020 21:01'),(429,145,'2/24/2020 21:01'),(468,150,'2/24/2020 21:01'),(390,155,'2/24/2020 21:01'),(394,155,'2/24/2020 21:01'),(460,155,'2/24/2020 21:01'),(484,155,'2/24/2020 21:01'),(504,155,'2/24/2020 21:01'),(510,156,'2/24/2020 21:01'),(448,158,'2/24/2020 21:01'),(512,158,'2/24/2020 21:01'),(387,162,'2/24/2020 21:01'),(395,162,'2/24/2020 21:01');
/*!40000 ALTER TABLE `is_secondary_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `issue` (
  `client_username` varchar(20) NOT NULL,
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `submission_date` datetime NOT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issue_client_username_fk` (`client_username`),
  CONSTRAINT `issue_client_username_fk` FOREIGN KEY (`client_username`) REFERENCES `client` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES ('hello2',1,'Please fix this bug','2020-02-29 00:31:31'),('harsohailB',4,'Cannot see players.','2020-03-21 16:32:29'),('harsohailB',5,'The issues aren\'t working.','2020-03-21 17:07:39'),('harsohailB',6,'Another big issue.','2020-03-21 17:25:07'),('harsohailB',8,'New issue.','2020-03-21 18:13:43');
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors_in`
--

DROP TABLE IF EXISTS `majors_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `majors_in` (
  `player_id` int(11) NOT NULL,
  `creation_date` varchar(45) NOT NULL,
  `major` varchar(45) NOT NULL,
  PRIMARY KEY (`player_id`,`creation_date`,`major`),
  CONSTRAINT `majors_in_player_id_creation_date_fk` FOREIGN KEY (`player_id`, `creation_date`) REFERENCES `player` (`player_id`, `creation_date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors_in`
--

LOCK TABLES `majors_in` WRITE;
/*!40000 ALTER TABLE `majors_in` DISABLE KEYS */;
INSERT INTO `majors_in` VALUES (1,'2/24/2020 21:01','Kinesiology'),(2,'2/24/2020 21:01','Business'),(3,'2/24/2020 21:01','Business'),(4,'2/24/2020 21:01','Arts'),(5,'2/24/2020 21:01','Open Studies'),(6,'2/24/2020 21:01','Open Studies'),(7,'2/24/2020 21:01','Business'),(8,'2/24/2020 21:01','Education'),(9,'2/24/2020 21:01','Arts'),(10,'2/24/2020 21:01','Business'),(11,'2/24/2020 21:01','Arts'),(12,'2/24/2020 21:01','Arts'),(13,'2/24/2020 21:01','Arts'),(14,'2/24/2020 21:01','Open Studies'),(15,'2/24/2020 21:01','Arts'),(16,'2/24/2020 21:01','Arts'),(17,'2/24/2020 21:01','Open Studies'),(18,'2/24/2020 21:01','Kinesiology'),(19,'2/24/2020 21:01','Business'),(20,'2/24/2020 21:01','Arts'),(20,'2/24/2020 21:01','Education'),(21,'2/24/2020 21:01','Graduate Studies'),(22,'2/24/2020 21:01','Arts'),(22,'2/24/2020 21:01','Business'),(23,'2/24/2020 21:01','Open Studies'),(24,'2/24/2020 21:01','Engineering'),(25,'2/24/2020 21:01','Arts'),(26,'2/24/2020 21:01','Engineering'),(27,'2/24/2020 21:01','Arts'),(28,'2/24/2020 21:01','Arts'),(29,'2/24/2020 21:01','Arts'),(30,'2/24/2020 21:01','Business'),(31,'2/24/2020 21:01','Arts'),(32,'2/24/2020 21:01','Arts'),(33,'2/24/2020 21:01','Arts'),(34,'2/24/2020 21:01','Arts'),(35,'2/24/2020 21:01','Arts'),(36,'2/24/2020 21:01','Science'),(37,'2/24/2020 21:01','Business'),(38,'2/24/2020 21:01','Arts'),(39,'2/24/2020 21:01','Kinesiology'),(40,'2/24/2020 21:01','Arts'),(41,'2/24/2020 21:01','Science'),(42,'2/24/2020 21:01','Engineering'),(43,'2/24/2020 21:01','Open Studies'),(44,'2/24/2020 21:01','Business'),(45,'2/24/2020 21:01','Arts'),(46,'2/24/2020 21:01','Business'),(47,'2/24/2020 21:01','Arts'),(48,'2/24/2020 21:01','Arts'),(49,'2/24/2020 21:01','Open Studies'),(50,'2/24/2020 21:01','Arts'),(51,'2/24/2020 21:01','Arts'),(52,'2/24/2020 21:01','Business'),(53,'2/24/2020 21:01','Arts'),(54,'2/24/2020 21:01','Business'),(55,'2/24/2020 21:01','Arts'),(56,'2/24/2020 21:01','Arts'),(57,'2/24/2020 21:01','Business'),(58,'2/24/2020 21:01','Arts'),(59,'2/24/2020 21:01','Science'),(60,'2/24/2020 21:01','Arts'),(61,'2/24/2020 21:01','Arts'),(62,'2/24/2020 21:01','Arts'),(63,'2/24/2020 21:01','Kinesiology'),(64,'2/24/2020 21:01','Arts'),(65,'2/24/2020 21:01','Arts'),(66,'2/24/2020 21:01','Arts'),(67,'2/24/2020 21:01','Open Studies'),(68,'2/24/2020 21:01','Arts'),(69,'2/24/2020 21:01','Arts'),(70,'2/24/2020 21:01','Open Studies'),(71,'2/24/2020 21:01','Open Studies'),(72,'2/24/2020 21:01','Arts'),(73,'2/24/2020 21:01','Arts'),(74,'2/24/2020 21:01','Kinesiology'),(75,'2/24/2020 21:01','Arts'),(76,'2/24/2020 21:01','Arts'),(77,'2/24/2020 21:01','Arts'),(78,'2/24/2020 21:01','Open Studies'),(79,'2/24/2020 21:01','Arts'),(80,'2/24/2020 21:01','Arts'),(81,'2/24/2020 21:01','Arts'),(82,'2/24/2020 21:01','Science'),(83,'2/24/2020 21:01','Arts'),(84,'2/24/2020 21:01','Science'),(85,'2/24/2020 21:01','Engineering'),(86,'2/24/2020 21:01','Open Studies'),(87,'2/24/2020 21:01','Open Studies'),(88,'2/24/2020 21:01','Arts'),(89,'2/24/2020 21:01','Arts'),(90,'2/24/2020 21:01','Open Studies'),(91,'2/24/2020 21:01','Arts'),(92,'2/24/2020 21:01','Arts'),(93,'2/24/2020 21:01','Arts'),(94,'2/24/2020 21:01','Open Studies'),(95,'2/24/2020 21:01','Open Studies'),(96,'2/24/2020 21:01','Open Studies'),(97,'2/24/2020 21:01','Arts'),(98,'2/24/2020 21:01','Open Studies'),(99,'2/24/2020 21:01','Arts');
/*!40000 ALTER TABLE `majors_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pass`
--

DROP TABLE IF EXISTS `pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pass` (
  `play_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `creation_date` varchar(45) NOT NULL,
  `pass_result` varchar(45) NOT NULL,
  PRIMARY KEY (`play_id`),
  KEY `pass_player_id_creation_date_fk_idx` (`player_id`,`creation_date`),
  CONSTRAINT `pass_play_id_fk` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `pass_player_id_creation_date_fk` FOREIGN KEY (`player_id`, `creation_date`) REFERENCES `player` (`player_id`, `creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pass`
--

LOCK TABLES `pass` WRITE;
/*!40000 ALTER TABLE `pass` DISABLE KEYS */;
INSERT INTO `pass` VALUES (360,104,'2/24/2020 21:01','C'),(361,104,'2/24/2020 21:01','R'),(362,104,'2/24/2020 21:01','I'),(363,104,'2/24/2020 21:01','I'),(370,104,'2/24/2020 21:01','I'),(375,104,'2/24/2020 21:01','C'),(377,104,'2/24/2020 21:01','I'),(379,103,'2/24/2020 21:01','C'),(380,103,'2/24/2020 21:01','C'),(381,103,'2/24/2020 21:01','C'),(384,103,'2/24/2020 21:01','I'),(385,103,'2/24/2020 21:01','I'),(388,104,'2/24/2020 21:01','I'),(389,104,'2/24/2020 21:01','C'),(390,104,'2/24/2020 21:01','C'),(392,104,'2/24/2020 21:01','C'),(393,104,'2/24/2020 21:01','C'),(396,103,'2/24/2020 21:01','C'),(401,104,'2/24/2020 21:01','I'),(404,103,'2/24/2020 21:01','I'),(406,104,'2/24/2020 21:01','I'),(407,104,'2/24/2020 21:01','D'),(409,103,'2/24/2020 21:01','C'),(410,103,'2/24/2020 21:01','I'),(413,104,'2/24/2020 21:01','I'),(414,104,'2/24/2020 21:01','R'),(415,104,'2/24/2020 21:01','C'),(416,104,'2/24/2020 21:01','C'),(417,104,'2/24/2020 21:01','C'),(418,104,'2/24/2020 21:01','R'),(419,104,'2/24/2020 21:01','C'),(422,103,'2/24/2020 21:01','C'),(425,104,'2/24/2020 21:01','I'),(426,104,'2/24/2020 21:01','C'),(427,104,'2/24/2020 21:01','C'),(428,104,'2/24/2020 21:01','C'),(430,104,'2/24/2020 21:01','C'),(432,104,'2/24/2020 21:01','C'),(433,104,'2/24/2020 21:01','I'),(440,103,'2/24/2020 21:01','C'),(441,103,'2/24/2020 21:01','C'),(442,103,'2/24/2020 21:01','C'),(443,103,'2/24/2020 21:01','C'),(444,103,'2/24/2020 21:01','C'),(445,103,'2/24/2020 21:01','D'),(446,103,'2/24/2020 21:01','IN'),(450,103,'2/24/2020 21:01','C'),(451,103,'2/24/2020 21:01','I'),(453,104,'2/24/2020 21:01','C'),(457,103,'2/24/2020 21:01','C'),(459,104,'2/24/2020 21:01','I'),(460,104,'2/24/2020 21:01','C'),(461,104,'2/24/2020 21:01','R'),(463,103,'2/24/2020 21:01','C'),(464,104,'2/24/2020 21:01','S'),(466,104,'2/24/2020 21:01','I'),(469,103,'2/24/2020 21:01','I'),(471,104,'2/24/2020 21:01','C'),(474,104,'2/24/2020 21:01','C'),(475,104,'2/24/2020 21:01','C'),(478,103,'2/24/2020 21:01','I'),(479,103,'2/24/2020 21:01','I'),(481,104,'2/24/2020 21:01','C'),(483,104,'2/24/2020 21:01','C'),(485,104,'2/24/2020 21:01','I'),(486,104,'2/24/2020 21:01','I'),(487,104,'2/24/2020 21:01','R'),(488,104,'2/24/2020 21:01','C'),(489,104,'2/24/2020 21:01','D'),(490,104,'2/24/2020 21:01','C'),(500,104,'2/24/2020 21:01','I'),(501,104,'2/24/2020 21:01','C'),(502,104,'2/24/2020 21:01','C'),(506,104,'2/24/2020 21:01','D'),(513,104,'2/24/2020 21:01','C'),(524,12,'2/24/2020 21:01','C'),(525,12,'2/24/2020 21:01','C'),(526,12,'2/24/2020 21:01','I'),(527,12,'2/24/2020 21:01','IN'),(529,12,'2/24/2020 21:01','D'),(531,12,'2/24/2020 21:01','I'),(532,12,'2/24/2020 21:01','C'),(534,12,'2/24/2020 21:01','I'),(537,12,'2/24/2020 21:01','C'),(540,12,'2/24/2020 21:01','I'),(541,12,'2/24/2020 21:01','R'),(542,12,'2/24/2020 21:01','C'),(544,12,'2/24/2020 21:01','I'),(547,12,'2/24/2020 21:01','C'),(548,12,'2/24/2020 21:01','C'),(550,12,'2/24/2020 21:01','C'),(551,12,'2/24/2020 21:01','C'),(552,12,'2/24/2020 21:01','I'),(553,12,'2/24/2020 21:01','C'),(554,12,'2/24/2020 21:01','I'),(555,12,'2/24/2020 21:01','C'),(559,12,'2/24/2020 21:01','C'),(560,12,'2/24/2020 21:01','C'),(561,12,'2/24/2020 21:01','R'),(562,12,'2/24/2020 21:01','C'),(565,12,'2/24/2020 21:01','I'),(568,12,'2/24/2020 21:01','D'),(571,12,'2/24/2020 21:01','I'),(572,12,'2/24/2020 21:01','C'),(578,12,'2/24/2020 21:01','C'),(579,12,'2/24/2020 21:01','C'),(580,12,'2/24/2020 21:01','C'),(583,12,'2/24/2020 21:01','D'),(586,12,'2/24/2020 21:01','C'),(588,12,'2/24/2020 21:01','I'),(590,12,'2/24/2020 21:01','I'),(592,12,'2/24/2020 21:01','IN'),(594,12,'2/24/2020 21:01','R'),(595,12,'2/24/2020 21:01','C'),(599,12,'2/24/2020 21:01','I'),(601,12,'2/24/2020 21:01','I'),(602,12,'2/24/2020 21:01','S'),(605,12,'2/24/2020 21:01','C'),(606,12,'2/24/2020 21:01','I'),(607,12,'2/24/2020 21:01','I'),(609,12,'2/24/2020 21:01','I'),(613,12,'2/24/2020 21:01','I'),(614,12,'2/24/2020 21:01','S'),(616,12,'2/24/2020 21:01','C'),(618,12,'2/24/2020 21:01','C'),(619,12,'2/24/2020 21:01','C'),(620,12,'2/24/2020 21:01','I'),(621,12,'2/24/2020 21:01','C'),(624,12,'2/24/2020 21:01','D'),(628,12,'2/24/2020 21:01','C'),(629,12,'2/24/2020 21:01','C'),(630,12,'2/24/2020 21:01','C'),(631,12,'2/24/2020 21:01','I'),(633,76,'2/24/2020 21:01','C'),(636,12,'2/24/2020 21:01','D'),(639,12,'2/24/2020 21:01','C'),(640,12,'2/24/2020 21:01','R'),(641,12,'2/24/2020 21:01','S'),(642,12,'2/24/2020 21:01','S'),(644,12,'2/24/2020 21:01','S'),(645,12,'2/24/2020 21:01','I'),(648,12,'2/24/2020 21:01','C'),(650,12,'2/24/2020 21:01','I'),(651,12,'2/24/2020 21:01','I'),(653,12,'2/24/2020 21:01','C'),(654,12,'2/24/2020 21:01','C'),(656,12,'2/24/2020 21:01','C'),(657,12,'2/24/2020 21:01','C'),(659,12,'2/24/2020 21:01','C'),(660,12,'2/24/2020 21:01','I'),(661,12,'2/24/2020 21:01','I'),(662,12,'2/24/2020 21:01','R'),(663,12,'2/24/2020 21:01','IN'),(664,12,'2/24/2020 21:01','C'),(665,12,'2/24/2020 21:01','C'),(666,12,'2/24/2020 21:01','C'),(667,12,'2/24/2020 21:01','C'),(668,12,'2/24/2020 21:01','D'),(670,12,'2/24/2020 21:01','C'),(671,12,'2/24/2020 21:01','I'),(673,12,'2/24/2020 21:01','C'),(674,12,'2/24/2020 21:01','I'),(675,12,'2/24/2020 21:01','I'),(677,12,'2/24/2020 21:01','C'),(678,12,'2/24/2020 21:01','R'),(679,12,'2/24/2020 21:01','R'),(680,12,'2/24/2020 21:01','I'),(681,12,'2/24/2020 21:01','I'),(682,12,'2/24/2020 21:01','I'),(691,103,'2/24/2020 21:01','IN');
/*!40000 ALTER TABLE `pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `penalty` (
  `penalty_id` int(11) NOT NULL AUTO_INCREMENT,
  `play_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `creation_date` varchar(45) DEFAULT NULL,
  `penalty_yardage` int(11) DEFAULT NULL,
  `penalty_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`penalty_id`),
  KEY `penalty_play_id_fk_idx` (`play_id`),
  KEY `penalty_player_id_creation_date_fk_idx` (`player_id`,`creation_date`),
  CONSTRAINT `penalty_play_id_fk` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`),
  CONSTRAINT `penalty_player_id_creation_date_fk` FOREIGN KEY (`player_id`, `creation_date`) REFERENCES `player` (`player_id`, `creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty`
--

LOCK TABLES `penalty` WRITE;
/*!40000 ALTER TABLE `penalty` DISABLE KEYS */;
INSERT INTO `penalty` VALUES (1,361,76,'2/24/2020 21:01',-10,'HOLD'),(2,364,51,'2/24/2020 21:01',-5,'NO YARDS'),(3,378,46,'2/24/2020 21:01',0,'HOLD'),(4,385,103,'2/24/2020 21:01',-10,'INTEN. GROUND'),(5,388,161,'2/24/2020 21:01',5,'OFF DEF'),(6,397,163,'2/24/2020 21:01',0,'HOLD'),(7,410,103,'2/24/2020 21:01',-11,'INTEN. GROUND'),(8,413,136,'2/24/2020 21:01',10,'ILG. CONT.'),(9,418,150,'2/24/2020 21:01',5,'OFF DEF'),(10,425,134,'2/24/2020 21:01',15,'PI'),(11,433,153,'2/24/2020 21:01',11,'PI'),(12,459,61,'2/24/2020 21:01',-10,'HOLD'),(13,465,5,'2/24/2020 21:01',-5,'OFFSIDE'),(14,480,133,'2/24/2020 21:01',-5,'NO YARDS'),(15,481,136,'2/24/2020 21:01',13,'PI'),(16,486,155,'2/24/2020 21:01',10,'ILG. CONT.'),(17,517,124,'2/24/2020 21:01',0,'DQ OBJ COND.'),(18,517,85,'2/24/2020 21:01',0,'DQ OBJ. COND.'),(19,518,150,'2/24/2020 21:01',-15,'NO YARDS'),(20,526,3,'2/24/2020 21:01',4,'PI'),(21,552,61,'2/24/2020 21:01',0,'HOLD'),(22,573,54,'2/24/2020 21:01',10,'HOLD'),(23,600,40,'2/24/2020 21:01',5,'OFFSIDE'),(24,602,83,'2/24/2020 21:01',15,'UN. RGH.'),(25,608,83,'2/24/2020 21:01',5,'OFFSIDE'),(26,622,26,'2/24/2020 21:01',3,'ILG. BLK'),(27,634,62,'2/24/2020 21:01',-5,'ILG. PROC'),(28,649,40,'2/24/2020 21:01',5,'OFFSIDE'),(29,660,40,'2/24/2020 21:01',15,'RGH. PASSER'),(30,666,56,'2/24/2020 21:01',-10,'HOLD'),(317,694,124,'2/24/2020 21:01',0,'DQ OBJ COND.'),(318,694,85,'2/24/2020 21:01',0,'DQ OBJ. COND.');
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play`
--

DROP TABLE IF EXISTS `play`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `play` (
  `play_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `time` varchar(45) NOT NULL,
  `play_null` varchar(1) NOT NULL,
  `field_position` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `team_possession` varchar(3) NOT NULL,
  `yardage_gained` int(11) DEFAULT NULL,
  `down` int(11) NOT NULL,
  `first_down_distance` int(11) NOT NULL,
  `run_pass_flag` varchar(1) DEFAULT NULL,
  `ball_position` varchar(3) NOT NULL,
  `out_of_bounds` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`play_id`),
  KEY `play_game_game_id_fk` (`game_id`),
  KEY `play_team_team_code_fk` (`team_possession`),
  KEY `play_team_team_code_fk_2` (`ball_position`),
  CONSTRAINT `play_game_game_id_fk` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `play_team_team_code_fk` FOREIGN KEY (`team_possession`) REFERENCES `team` (`team_code`),
  CONSTRAINT `play_team_team_code_fk_2` FOREIGN KEY (`ball_position`) REFERENCES `team` (`team_code`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play`
--

LOCK TABLES `play` WRITE;
/*!40000 ALTER TABLE `play` DISABLE KEYS */;
INSERT INTO `play` VALUES (353,3,1,'15:00:00','N',-45,'Garrin McDonnell kickoff 56 yards to the CGY9, Nathanael Anderson return 14 yards to the CGY23 (Elliot Graham).','UBC',14,0,0,NULL,'UBC',NULL),(354,3,1,'14:53:00','N',-23,'Robinson Rodrigues rush for 4 yards to the CGY27 (Sam Steele).','CGY',4,1,10,'R','CGY',NULL),(355,3,1,'14:53:00','N',-27,'Robinson Rodrigues rush for 4 yards to the CGY31 (Sam Steele;Daniel Kwamou).','CGY',4,2,6,'R','CGY',NULL),(356,3,1,'13:17:00','N',-31,'Niko DiFonte punt BLOCKED, recovered by UBC Mitchell Townsend at CGY17 (blocked by Michael Calvert), Mitchell Townsend for 17 yards to the CGY0, TOUCHDOWN, .','CGY',NULL,3,2,NULL,'CGY',NULL),(357,3,1,'13:17:00','N',5,'Daniel Kwamou kick attempt good.','UBC',NULL,0,0,NULL,'CGY',NULL),(358,3,1,'13:17:00','N',-45,'Garrin McDonnell kickoff 55 yards to the CGY10, Nathanael Anderson return 14 yards to the CGY24 (Luke Burton-Krahn).','UBC',14,0,0,NULL,'UBC',NULL),(359,3,1,'13:11:00','N',-24,'Robinson Rodrigues rush for 13 yards to the CGY37, 1ST DOWN CGY (Lake Korte-Moore).','CGY',13,1,10,'R','CGY',NULL),(360,3,1,'13:11:00','N',-37,'Adam Sinagra pass complete to Erik Nusl for 3 yards to the CGY40 (Ciraolo-Brown).','CGY',3,1,10,'P','CGY',NULL),(361,3,1,'13:11:00','N',-40,'Adam Sinagra rush for 10 yards to the CGY50, out-of-bounds, PENALTY CGY holding 10 yards to the CGY40, 1ST DOWN CGY.','CGY',10,2,7,'P','CGY','Y'),(362,3,1,'13:11:00','N',-40,'Adam Sinagra pass incomplete to Jack McDonald.','CGY',0,1,10,'P','CGY',NULL),(363,3,1,'13:11:00','N',-40,'Adam Sinagra pass incomplete to Jack McDonald.','CGY',0,2,10,'P','CGY',NULL),(364,3,1,'13:11:00','N',-40,'Niko DiFonte punt 41 yards to the UBC29, PENALTY CGY no yards 5 yards to the UBC34, 1st and 10, UBC ball on UBC34.','CGY',0,0,0,NULL,'CGY',NULL),(365,3,1,'10:28:00','N',-34,'Sharique Khan rush for 14 yards to the UBC48, 1ST DOWN UBC (Matthew Lucyshyn).','UBC',14,1,10,'R','UBC',NULL),(366,3,1,'10:28:00','N',-48,'Sharique Khan rush for 8 yards to the CGY54 (Nick Statz).','UBC',8,1,10,'R','UBC',NULL),(367,3,1,'10:28:00','N',54,'Sharique Khan rush for loss of 5 yards to the UBC51 (J-Min Pelley).','UBC',-5,2,2,'R','CGY',NULL),(368,3,1,'08:48:00','N',-51,'Garrin McDonnell punt 43 yards to the CGY16, Nathanael Anderson return 10 yards to the CGY26 (Tom Schnitzler).','UBC',8,3,7,NULL,'UBC',NULL),(369,3,1,'08:35:00','N',-26,'Robinson Rodrigues rush for loss of 3 yards to the CGY23 (Nick Cross).','CGY',-3,1,10,'R','CGY',NULL),(370,3,1,'08:35:00','N',-23,'Adam Sinagra pass incomplete to Jalen Philpot.','CGY',0,2,13,'P','CGY',NULL),(371,3,1,'08:35:00','N',-23,'Niko DiFonte punt 25 yards to the CGY48, out-of-bounds.','CGY',NULL,3,13,NULL,'CGY','Y'),(372,3,1,'07:16:00','N',48,'Sharique Khan rush for 8 yards to the CGY40 (Grant McDonald).','UBC',8,1,10,'R','CGY',NULL),(373,3,1,'07:16:00','N',40,'Gabe Olivares rush for 1 yard to the CGY39 (Charlie Moore;Tyrese Best).','UBC',1,2,2,'R','CGY',NULL),(374,3,1,'07:16:00','N',39,'Gabe Olivares rush for no gain to the CGY39, fumble by Gabe Olivares, fumble recovered by Gabe Olivare at CGY39 (Charlie Moore).','UBC',0,3,1,'R','CGY',NULL),(375,3,1,'05:49:00','N',-39,'Adam Sinagra pass complete to Erik Nusl for 25 yards to the UBC46, 1ST DOWN CGY (John Nikolovski).','CGY',25,1,10,'P','CGY',NULL),(376,3,1,'05:49:00','N',46,'Robinson Rodrigues rush for loss of 1 yard to the UBC47 (Ben Hladik).','CGY',-1,1,10,'R','UBC',NULL),(377,3,1,'05:49:00','N',47,'Adam Sinagra pass incomplete to Robinson Rodrigues (Lake Korte-Moore).','CGY',0,2,11,'P','UBC',NULL),(378,3,1,'05:49:00','N',47,'Alex Basilis rush for 2 yards to the UBC45 (Kamryn Matheson;Michael Calvert), PENALTY CGY holding declined.','CGY',2,3,11,'R','UBC',NULL),(379,3,1,'04:18:00','N',-45,'Tommy Yanchuk pass complete to Sharique Khan for 8 yards to the UBC53 (Matthew Lucyshyn;Grant McDonald).','UBC',8,1,10,'P','UBC',NULL),(380,3,1,'04:18:00','N',-53,'Tommy Yanchuk pass complete to Sharique Khan for 3 yards to the CGY54, 1ST DOWN UBC (Sterling Taylor).','UBC',3,2,2,'P','UBC',NULL),(381,3,1,'04:18:00','N',54,'Tommy Yanchuk pass complete to Trey Kellogg for 8 yards to the CGY46 (Sterling Taylor).','UBC',8,1,10,'P','CGY',NULL),(382,3,1,'04:18:00','N',46,'Sharique Khan rush for 3 yards to the CGY43, 1ST DOWN UBC (J-Min Pelley;Nick Statz).','UBC',3,2,2,'R','CGY',NULL),(383,3,1,'01:21:00','Y',43,'TIMEOUT UBC, NO PLAY.','UBC',NULL,1,10,'N','CGY',NULL),(384,3,1,'01:21:00','N',43,'Tommy Yanchuk pass incomplete to Jacob Patten (T. Abrahams-Webster).','UBC',0,1,10,'P','CGY',NULL),(385,3,1,'01:21:00','Y',43,'Tommy Yanchuk pass incomplete, PENALTY UBC intentional grounding 10 yards to the CGY53, NO PLAY.','UBC',0,2,10,'P','CGY',NULL),(386,3,1,'01:21:00','N',53,'Garrin McDonnell punt 41 yards to the CGY12, Nathanael Anderson return 5 yards to the CGY17 (Nick Cross).','UBC',5,3,20,NULL,'CGY',NULL),(387,3,1,'00:23:00','N',-17,'Robinson Rodrigues rush for 1 yard to the CGY18 (Elias Rodriguez;Tom Schnitzler).','CGY',1,1,10,'R','CGY',NULL),(388,3,1,'00:23:00','Y',-18,'Adam Sinagra pass incomplete to Jalen Philpot, PENALTY UBC offside defense 5 yards to the CGY23, NO PLAY.','CGY',0,2,9,'P','CGY',NULL),(389,3,1,'00:23:00','N',-23,'Adam Sinagra pass complete to Jack McDonald for 6 yards to the CGY29, 1ST DOWN CGY (Nick Cross).','CGY',6,2,4,'P','CGY',NULL),(390,3,2,'15:00:00','N',-29,'Adam Sinagra pass complete to Erik Nusl for 8 yards to the CGY37 (Nick Cross).','CGY',8,1,10,'P','CGY',NULL),(391,3,2,'15:00:00','N',-37,'Robinson Rodrigues rush for 3 yards to the CGY40, 1ST DOWN CGY (Daniel Kwamou).','CGY',3,2,2,'R','CGY',NULL),(392,3,2,'15:00:00','N',-40,'Adam Sinagra pass complete to Robinson Rodrigues for 1 yard to the CGY41 (Nick Cross).','CGY',1,1,10,'P','CGY',NULL),(393,3,2,'15:00:00','N',-41,'Adam Sinagra pass complete to Jack McDonald for 8 yards to the CGY49.','CGY',8,2,9,'P','CGY',NULL),(394,3,2,'15:00:00','N',-49,'Robinson Rodrigues rush for no gain to the CGY49 (Ethan Slater).','CGY',0,3,1,'R','CGY',NULL),(395,3,2,'12:30:00','N',49,'Sharique Khan rush for 5 yards to the CGY44 (Nick Statz;Chimzy Tasie).','UBC',5,1,10,'R','CGY',NULL),(396,3,2,'11:32:00','N',44,'Tommy Yanchuk pass complete to Edgerrin Williams for 19 yards to the CGY25, 1ST DOWN UBC, out-of-bounds (Sterling Taylor).','UBC',19,2,5,'P','CGY','Y'),(397,3,2,'11:32:00','N',25,'Sharique Khan rush for loss of 5 yards to the CGY30 (Chimzy Tasie), PENALTY UBC holding declined.','UBC',-5,1,10,'R','CGY',NULL),(398,3,2,'11:32:00','N',30,'Tommy Yanchuk rush for 10 yards to the CGY20 (Grant McDonald;Nick Statz).','UBC',10,2,15,'R','CGY',NULL),(399,3,2,'10:09:00','N',20,'Garrin McDonnell field goal attempt from 27 GOOD, .','UBC',NULL,3,5,NULL,'CGY',NULL),(400,3,2,'10:09:00','N',-35,'Robinson Rodrigues rush for 1 yard to the CGY36 (Ben Hladik).','CGY',1,1,10,'R','CGY',NULL),(401,3,2,'10:09:00','N',-36,'Adam Sinagra pass incomplete to Nathanael Durkan.','CGY',0,2,9,'P','CGY',NULL),(402,3,2,'10:09:00','N',-36,'Niko DiFonte punt 36 yards to the UBC38, Edgerrin Williams return 10 yards to the UBC48 (Andrew Ricard).','CGY',10,3,9,NULL,'CGY',NULL),(403,3,2,'08:55:00','N',-48,'Sharique Khan rush for 4 yards to the UBC52 (J-Min Pelley).','UBC',4,1,10,'R','UBC',NULL),(404,3,2,'08:55:00','N',-52,'Tommy Yanchuk pass incomplete (Josh Hyer).','UBC',0,2,6,'P','UBC',NULL),(405,3,2,'08:55:00','N',-52,'Garrin McDonnell punt 50 yards to the CGY8, Sterling Taylor return 9 yards to the CGY17, out-of-bounds (Nick Cross).','UBC',9,3,6,NULL,'UBC','Y'),(406,3,2,'07:35:00','N',-17,'Adam Sinagra pass incomplete to Jalen Philpot.','CGY',0,1,10,'P','CGY',NULL),(407,3,2,'07:35:00','N',-17,'Adam Sinagra pass incomplete to Jalen Philpot, dropped pass.','CGY',0,2,10,'P','CGY',NULL),(408,3,2,'07:35:00','N',-17,'Niko DiFonte punt 33 yards to the CGY50, Edgerrin Williams return 26 yards to the CGY24 (Cole Kussmann).','CGY',26,3,10,NULL,'CGY',NULL),(409,3,2,'06:45:00','N',24,'Tommy Yanchuk pass complete to Edgerrin Williams for loss of 1 yard to the CGY25 (Joe Cant).','UBC',-1,1,10,'P','CGY',NULL),(410,3,2,'06:45:00','N',25,'Tommy Yanchuk pass incomplete, PENALTY UBC intentional grounding 11 yards to the CGY36, NO PLAY.','UBC',0,2,11,'P','CGY',NULL),(411,3,2,'05:28:00','N',36,'Garrin McDonnell field goal attempt from 43 GOOD, .','UBC',NULL,3,22,NULL,'CGY',NULL),(412,3,2,'05:28:00','N',-35,'Adam Sinagra rush for 7 yards to the CGY42, out-of-bounds (Chris Thelasco).','CGY',7,1,10,'R','CGY','Y'),(413,3,2,'05:28:00','Y',-42,'Adam Sinagra pass incomplete to Jalen Philpot, PENALTY UBC illegal contact 10 yards to the CGY52, 1ST DOWN CGY, NO PLAY.','CGY',0,2,3,'P','CGY',NULL),(414,3,2,'05:28:00','N',-52,'Adam Sinagra rush for 15 yards to the UBC43, 1ST DOWN CGY (Nick Cross).','CGY',15,1,10,'P','CGY',NULL),(415,3,2,'05:28:00','N',43,'Adam Sinagra pass complete to Jack McDonald for 9 yards to the UBC34 (Nick Cross).','CGY',9,1,10,'P','UBC',NULL),(416,3,2,'05:28:00','N',34,'Adam Sinagra pass complete to Alex Basilis for 9 yards to the UBC25, 1ST DOWN CGY (Payton LaGrange).','CGY',9,2,1,'P','UBC',NULL),(417,3,2,'05:28:00','N',25,'Adam Sinagra pass complete to Erik Nusl for 8 yards to the UBC17 (Chris Thelasco).','CGY',8,1,10,'P','UBC',NULL),(418,3,2,'05:28:00','Y',17,'Adam Sinagra rush for 4 yards to the UBC13, out-of-bounds, PENALTY UBC offside defense 5 yards to the UBC12, 1ST DOWN CGY, NO PLAY.','CGY',4,2,2,'P','UBC','Y'),(419,3,2,'02:43:00','N',12,'Adam Sinagra pass complete to Jalen Philpot for 12 yards to the UBC0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',12,1,10,'P','UBC',NULL),(420,3,2,'02:43:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'UBC',NULL),(421,3,2,'02:43:00','N',-45,'Niko DiFonte kickoff 34 yards to the UBC31, Sharique Khan return 4 yards to the UBC35.','CGY',4,0,0,NULL,'CGY',NULL),(422,3,2,'02:43:00','N',-35,'Tommy Yanchuk pass complete to Trey Kellogg for 7 yards to the UBC42 (Matthew Lucyshyn).','UBC',7,1,10,'P','UBC',NULL),(423,3,2,'02:43:00','N',-42,'Sharique Khan rush for 1 yard to the UBC43 (Subomi Oyesorro).','UBC',1,2,3,'R','UBC',NULL),(424,3,2,'02:43:00','N',-43,'Garrin McDonnell punt 49 yards to the CGY18, Sterling Taylor return 12 yards to the CGY30, out-of-bounds (Bashiru Sise-Odaa;Luke Burton-Krahn).','UBC',12,3,2,NULL,'UBC','Y'),(425,3,2,'02:06:00','Y',-30,'Adam Sinagra pass incomplete, PENALTY UBC pass interference 15 yards to the CGY45, 1ST DOWN CGY, NO PLAY.','CGY',0,1,10,'P','CGY',NULL),(426,3,2,'02:06:00','N',-45,'Adam Sinagra pass complete to Matson Tulloch for 15 yards to the UBC50, 1ST DOWN CGY (Ben Hladik).','CGY',15,1,10,'P','CGY',NULL),(427,3,2,'02:06:00','N',50,'Adam Sinagra pass complete to Jack McDonald for 5 yards to the UBC45 (Nick Cross).','CGY',5,1,10,'P','UBC',NULL),(428,3,2,'02:06:00','N',45,'Adam Sinagra pass complete to Matson Tulloch for 6 yards to the UBC39, 1ST DOWN CGY (Payton LaGrange).','CGY',6,2,5,'P','UBC',NULL),(429,3,2,'02:06:00','N',39,'Robinson Rodrigues rush for 5 yards to the UBC34 (Elias Rodriguez;Daniel Kwamou).','CGY',5,1,10,'R','UBC',NULL),(430,3,2,'02:06:00','N',34,'Adam Sinagra pass complete to Jalen Philpot for 12 yards to the UBC22, 1ST DOWN CGY (Nick Cross).','CGY',12,2,5,'P','UBC',NULL),(431,3,2,'02:06:00','N',22,'Adam Sinagra rush for 4 yards to the UBC18, out-of-bounds (Kamryn Matheson).','CGY',4,1,10,'R','UBC','Y'),(432,3,2,'02:06:00','N',18,'Adam Sinagra pass complete to Erik Nusl for 6 yards to the UBC12, 1ST DOWN CGY (Ciraolo-Brown).','CGY',6,2,6,'P','UBC',NULL),(433,3,2,'02:06:00','Y',12,'Adam Sinagra pass incomplete to Jalen Philpot (Kene Ezekeke), PENALTY UBC pass interference 11 yards to the UBC1, 1ST DOWN CGY, NO PLAY.','CGY',0,1,10,'P','UBC',NULL),(434,3,2,'00:20:00','N',1,'Josiah Joseph rush for 1 yard to the UBC0, 1ST DOWN CGY, TOUCHDOWN, , PENALTY UBC offside defense declined.','CGY',1,1,1,'R','UBC',NULL),(435,3,2,'00:20:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'UBC',NULL),(436,3,2,'00:20:00','N',-45,'Niko DiFonte kickoff 48 yards to the UBC17, Marcus Browne return 10 yards to the UBC27 (Noah McDonough).','CGY',10,0,0,NULL,'CGY',NULL),(437,3,2,'00:13:00','N',-27,'TEAM rush for loss of 2 yards to the UBC25.','UBC',-2,1,10,'R','UBC',NULL),(438,3,2,'00:13:00','N',-25,'TEAM rush for loss of 2 yards to the UBC23.','UBC',-2,2,12,'R','UBC',NULL),(439,3,3,'15:00:00','N',-45,'Niko DiFonte kickoff 50 yards to the UBC15, Marcus Browne return 6 yards to the UBC21 (Daniel Teitz).','CGY',6,0,0,NULL,'CGY',NULL),(440,3,3,'14:53:00','N',-21,'Tommy Yanchuk pass complete to J.J. DesLauriers for 16 yards to the UBC37, 1ST DOWN UBC.','UBC',16,1,10,'P','UBC',NULL),(441,3,3,'14:53:00','N',-37,'Tommy Yanchuk pass complete to Sharique Khan for 8 yards to the UBC45 (T. Abrahams-Webster).','UBC',8,1,10,'P','UBC',NULL),(442,3,3,'14:53:00','N',-45,'Tommy Yanchuk pass complete to Brad Hladik for 7 yards to the UBC52, 1ST DOWN UBC.','UBC',7,2,2,'P','UBC',NULL),(443,3,3,'14:53:00','N',-52,'Tommy Yanchuk pass complete to J.J. DesLauriers for 3 yards to the 55 yardline (Sterling Taylor).','UBC',3,1,10,'P','UBC',NULL),(444,3,3,'14:53:00','N',-55,'Tommy Yanchuk pass complete to Trey Kellogg for 12 yards to the CGY43, 1ST DOWN UBC (Joe Cant).','UBC',12,2,7,'P','UBC',NULL),(445,3,3,'14:53:00','N',43,'Tommy Yanchuk pass incomplete to Jacob Patten, dropped pass.','UBC',0,1,10,'P','CGY',NULL),(446,3,3,'11:03:00','N',43,'Tommy Yanchuk pass intercepted by Deane Leonard at the CGY38, Deane Leonard return 72 yards to the UBC0, TOUCHDOWN, .','UBC',0,2,10,'P','CGY',NULL),(447,3,3,'11:03:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'UBC',NULL),(448,3,3,'11:03:00','N',-45,'Niko DiFonte kickoff 36 yards to the UBC29, Brendan Devane return 2 yards to the UBC31 (Ross DeLauw;Cole Kussmann).','CGY',2,0,0,NULL,'CGY',NULL),(449,3,3,'10:58:00','N',-31,'Sharique Khan rush for 10 yards to the UBC41, 1ST DOWN UBC (Grant McDonald).','UBC',10,1,10,'R','UBC',NULL),(450,3,3,'10:58:00','N',-41,'Tommy Yanchuk pass complete to J.J. DesLauriers for 4 yards to the UBC45 (Deane Leonard).','UBC',4,1,10,'P','UBC',NULL),(451,3,3,'10:58:00','N',-45,'Tommy Yanchuk pass incomplete to Trey Kellogg.','UBC',0,2,6,'P','UBC',NULL),(452,3,3,'10:58:00','N',-45,'Garrin McDonnell punt BLOCKED, recovered by CGY Alessandro Molnar at UBC5 (blocked by Jacob Biggs), Alessandro Molnar for no gain to the UBC5 (Brendan Devane).','UBC',NULL,3,6,NULL,'UBC',NULL),(453,3,3,'08:36:00','N',5,'Adam Sinagra pass complete to Nathanael Durkan for 5 yards to the UBC0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',5,1,5,'P','UBC',NULL),(454,3,3,'08:36:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'UBC',NULL),(455,3,3,'08:36:00','N',-45,'Niko DiFonte kickoff 57 yards to the UBC8, Sharique Khan return 14 yards to the UBC22 (Cole Kussmann).','CGY',14,0,0,NULL,'CGY',NULL),(456,3,3,'08:30:00','N',-22,'Sharique Khan rush for loss of 2 yards to the UBC20 (Subomi Oyesorro).','UBC',-2,1,10,'R','UBC',NULL),(457,3,3,'08:30:00','N',-20,'Tommy Yanchuk pass complete to Edgerrin Williams for 8 yards to the UBC28 (Charlie Moore).','UBC',8,2,12,'P','UBC',NULL),(458,3,3,'08:30:00','N',-28,'Garrin McDonnell punt 44 yards to the CGY38, Sterling Taylor return 12 yards to the CGY50 (Luke Burton-Krahn;Brad Hladik).','UBC',12,3,4,NULL,'UBC',NULL),(459,3,3,'06:47:00','Y',-50,'Adam Sinagra pass incomplete to Josiah Joseph, PENALTY CGY holding 10 yards to the CGY40, NO PLAY.','CGY',0,1,10,'P','CGY',NULL),(460,3,3,'06:47:00','N',-40,'Adam Sinagra pass complete to Jalen Philpot for 5 yards to the CGY45 (Kene Ezekeke;Payton LaGrange).','CGY',5,1,20,'P','CGY',NULL),(461,3,3,'06:47:00','N',-45,'Adam Sinagra rush for 5 yards to the CGY50 (Nick Cross).','CGY',5,2,15,'P','CGY',NULL),(462,3,3,'06:47:00','N',-50,'Niko DiFonte punt 45 yards to the UBC15, Edgerrin Williams return 14 yards to the UBC29, out-of-bounds (Chaz Marshall).','CGY',14,3,10,NULL,'CGY','Y'),(463,3,3,'05:11:00','N',-29,'Tommy Yanchuk pass complete to Ted Kubongo for 10 yards to the UBC39, fumble by Ted Kubongo recovered by CGY Subomi Oyesorro at UBC39.','UBC',10,1,10,'P','UBC',NULL),(464,3,3,'04:40:00','N',39,'Adam Sinagra sacked for loss of 8 yards to the UBC47 (Ethan Slater).','CGY',-8,1,10,'P','UBC',NULL),(465,3,3,'04:40:00','Y',47,'PENALTY CGY offside 5 yards to the UBC52.','CGY',NULL,2,18,'N','UBC',NULL),(466,3,3,'04:40:00','N',52,'Adam Sinagra pass incomplete to Josiah Joseph.','CGY',0,2,23,'P','UBC',NULL),(467,3,3,'04:40:00','N',52,'Niko DiFonte punt 51 yards to the UBC1, Edgerrin Williams return 3 yards to the UBC4 (Daniel Teitz;Jacob Kirk).','CGY',3,3,23,NULL,'UBC',NULL),(468,3,3,'03:38:00','N',-4,'Sharique Khan rush for 6 yards to the UBC10 (Grant McDonald;Chimzy Tasie).','UBC',6,1,10,'R','UBC',NULL),(469,3,3,'03:38:00','N',-10,'Tommy Yanchuk pass incomplete to J.J. DesLauriers.','UBC',0,2,4,'P','UBC',NULL),(470,3,3,'02:34:00','N',-10,'TEAM rush for loss of 10 yards to the UBC0, TEAM safety, .','UBC',-10,3,4,'R','UBC',NULL),(471,3,3,'02:34:00','N',-35,'Adam Sinagra pass complete to Matson Tulloch for 9 yards to the CGY44, out-of-bounds (Kamryn Matheson).','CGY',9,1,10,'P','CGY','Y'),(472,3,3,'02:34:00','N',-44,'Robinson Rodrigues rush for 18 yards to the UBC48, 1ST DOWN CGY (Ben Hladik).','CGY',18,2,1,'R','CGY',NULL),(473,3,3,'02:34:00','N',48,'Robinson Rodrigues rush for 18 yards to the UBC30, 1ST DOWN CGY (Nick Cross).','CGY',18,1,10,'R','UBC',NULL),(474,3,3,'02:34:00','N',30,'Adam Sinagra pass complete to Josiah Joseph for 4 yards to the UBC26 (Nick Cross).','CGY',4,1,10,'P','UBC',NULL),(475,3,3,'00:22:00','N',26,'Adam Sinagra pass complete to Matson Tulloch for 26 yards to the UBC0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',26,2,6,'P','UBC',NULL),(476,3,3,'00:22:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'UBC',NULL),(477,3,3,'00:22:00','N',-45,'Niko DiFonte kickoff 30 yards to the UBC35, Brendan Devane return 1 yards to the UBC36 (Cole Kussmann).','CGY',1,0,0,NULL,'CGY',NULL),(478,3,3,'00:20:00','N',-36,'Tommy Yanchuk pass incomplete to J.J. DesLauriers (Sterling Taylor).','UBC',0,1,10,'P','UBC',NULL),(479,3,3,'00:20:00','N',-36,'Tommy Yanchuk pass incomplete to J.J. DesLauriers (T. Abrahams-Webster).','UBC',0,2,10,'P','UBC',NULL),(480,3,4,'15:00:00','N',-36,'Garrin McDonnell punt 50 yards to the CGY24, Sterling Taylor return 9 yards to the CGY33, out-of-bounds (Luke Burton-Krahn), PENALTY UBC no yards 5 yards to the CGY38, 1st and 10, CGY ball on CGY38.','UBC',9,3,10,NULL,'UBC','Y'),(481,3,4,'14:38:00','Y',-38,'Adam Sinagra pass complete to Josiah Joseph for 13 yards to the CGY51 (Ciraolo-Brown), PENALTY UBC pass interference 13 yards to the CGY51, 1ST DOWN CGY, NO PLAY.','CGY',13,1,10,'P','CGY',NULL),(482,3,4,'14:38:00','N',-51,'Alessandro Molnar rush for 4 yards to the 55 yardline (Ciraolo-Brown;Mitchell Townsend).','CGY',4,1,10,'R','CGY',NULL),(483,3,4,'14:38:00','N',-55,'Adam Sinagra pass complete to Josiah Joseph for 10 yards to the UBC45, 1ST DOWN CGY (Ciraolo-Brown).','CGY',10,2,6,'P','CGY',NULL),(484,3,4,'14:38:00','N',45,'Alessandro Molnar rush for 12 yards to the UBC33, 1ST DOWN CGY (Nick Cross;Payton LaGrange).','CGY',12,1,10,'R','UBC',NULL),(485,3,4,'14:38:00','N',33,'Adam Sinagra pass incomplete to Payton Burbank.','CGY',0,1,10,'P','UBC',NULL),(486,3,4,'14:38:00','Y',33,'Adam Sinagra pass incomplete to Jalen Philpot, PENALTY UBC illegal touching 10 yards to the UBC23, 1ST DOWN CGY, NO PLAY.','CGY',0,2,10,'P','UBC',NULL),(487,3,4,'14:38:00','N',23,'Adam Sinagra rush for 6 yards to the UBC17 (Luke Burton-Krahn).','CGY',6,1,10,'P','UBC',NULL),(488,3,4,'14:38:00','N',17,'Adam Sinagra pass complete to Matson Tulloch for 4 yards to the UBC13, 1ST DOWN CGY (James Ens).','CGY',4,2,4,'P','UBC',NULL),(489,3,4,'14:38:00','N',13,'Adam Sinagra pass incomplete to Nathanael Durkan, dropped pass.','CGY',0,1,10,'P','UBC',NULL),(490,3,4,'10:12:00','N',13,'Adam Sinagra pass complete to Matson Tulloch for 13 yards to the UBC0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',13,2,10,'P','UBC',NULL),(491,3,4,'10:12:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'UBC',NULL),(492,3,4,'10:12:00','N',-45,'Niko DiFonte kickoff 55 yards to the UBC10, Sharique Khan return 23 yards to the UBC33 (Noah McDonough;Nick Statz).','CGY',23,0,0,NULL,'CGY',NULL),(493,3,4,'10:04:00','N',-33,'Gabe Olivares pass complete to Lliam Wishart for 9 yards to the UBC42 (Jacob Biggs).','UBC',9,1,10,'P','UBC',NULL),(494,3,4,'10:04:00','N',-42,'Gabe Olivares rush for 17 yards to the CGY51, 1ST DOWN UBC (Deane Leonard).','UBC',17,2,1,'R','UBC',NULL),(495,3,4,'10:04:00','N',51,'Gabe Olivares pass complete to Trey Kellogg for 9 yards to the CGY42 (Subomi Oyesorro).','UBC',9,1,10,'P','CGY',NULL),(496,3,4,'10:04:00','N',42,'Gabe Olivares pass complete to Nick Pollitt for 6 yards to the CGY36, 1ST DOWN UBC (Sterling Taylor).','UBC',6,2,1,'P','CGY',NULL),(497,3,4,'10:04:00','N',36,'Gabe Olivares pass incomplete to Nick Pollitt, dropped pass.','UBC',0,1,10,'P','CGY',NULL),(498,3,4,'10:04:00','N',36,'Gabe Olivares pass complete to Lliam Wishart for 2 yards to the CGY34 (Nick Statz).','UBC',2,2,10,'P','CGY',NULL),(499,3,4,'10:04:00','N',34,'Gabe Olivares pass incomplete to Daniel Appiah.','UBC',0,3,8,'P','CGY',NULL),(500,3,4,'06:56:00','N',-34,'Adam Sinagra pass incomplete to Erik Nusl.','CGY',0,1,10,'P','CGY',NULL),(501,3,4,'06:56:00','N',-34,'Adam Sinagra pass complete to Jalen Philpot for 16 yards to the CGY50, 1ST DOWN CGY (Kene Ezekeke).','CGY',16,2,10,'P','CGY',NULL),(502,3,4,'06:56:00','N',-50,'Adam Sinagra pass complete to Matson Tulloch for 5 yards to the 55 yardline (Ciraolo-Brown).','CGY',5,1,10,'P','CGY',NULL),(503,3,4,'06:56:00','N',-55,'Alessandro Molnar rush for 19 yards to the UBC36, 1ST DOWN CGY (Ben Hladik).','CGY',19,2,5,'R','CGY',NULL),(504,3,4,'06:56:00','N',36,'Cole Kussmann rush for 11 yards to the UBC25, 1ST DOWN CGY (Nick Cross;Kamryn Matheson).','CGY',11,1,10,'R','UBC',NULL),(505,3,4,'06:56:00','N',25,'Alessandro Molnar rush for loss of 6 yards to the UBC31 (Tom Schnitzler).','CGY',-6,1,10,'R','UBC',NULL),(506,3,4,'06:56:00','N',31,'Adam Sinagra pass incomplete to Jalen Philpot, dropped pass.','CGY',0,2,16,'P','UBC',NULL),(507,3,4,'03:08:00','N',31,'Niko DiFonte field goal attempt from 38 MISSED, kick to UBC-12, , Edgerrin Williams return 41 yards to the UBC29 (Niko DiFonte).','CGY',41,3,16,NULL,'UBC',NULL),(508,3,4,'03:08:00','N',-29,'Gabe Olivares pass complete to Nick Pollitt for 7 yards to the UBC36 (Deane Leonard).','UBC',7,1,10,'P','UBC',NULL),(509,3,4,'03:08:00','N',-36,'Gabe Olivares pass incomplete.','UBC',0,2,3,'P','UBC',NULL),(510,3,4,'03:08:00','N',-36,'Garrin McDonnell punt 46 yards to the CGY28, Sterling Taylor return 19 yards to the CGY47 (Tom Schnitzler;Bashiru Sise-Odaa).','UBC',19,3,3,NULL,'UBC',NULL),(511,3,4,'02:25:00','N',-47,'Alessandro Molnar rush for 26 yards to the UBC37, 1ST DOWN CGY (Payton LaGrange).','CGY',26,1,10,'R','CGY',NULL),(512,3,4,'02:25:00','N',37,'Alessandro Molnar rush for 2 yards to the UBC35 (Elias Rodriguez;Ciraolo-Brown).','CGY',2,1,10,'R','UBC',NULL),(513,3,4,'02:25:00','N',35,'Adam Sinagra pass complete to Jalen Philpot for 7 yards to the UBC28 (Kene Ezekeke;Payton LaGrange).','CGY',7,2,8,'P','UBC',NULL),(514,3,4,'01:09:00','N',28,'Niko DiFonte field goal attempt from 35 GOOD, .','CGY',NULL,3,1,NULL,'UBC',NULL),(515,3,4,'01:09:00','N',-45,'Niko DiFonte kickoff 40 yards to the UBC25, Sharique Khan return 9 yards to the UBC34 (Cole Kussmann).','CGY',9,0,0,NULL,'CGY',NULL),(516,3,4,'01:06:00','N',-34,'Gabe Olivares pass incomplete to Nick Pollitt.','UBC',0,1,10,'P','UBC',NULL),(517,3,4,'01:06:00','N',-34,'Gabe Olivares pass incomplete to Marcus Browne, PENALTY UBC disqualification objectionable conduct, PENALTY CGY disqualification objectionable conduct off-setting.','UBC',0,2,10,'P','UBC',NULL),(518,3,4,'01:06:00','N',-34,'Garrin McDonnell punt 36 yards to the CGY40, PENALTY UBC no yards 15 yards to the 55 yardline, 1st and 10, CGY ball on 55 yardline.','UBC',NULL,3,10,NULL,'UBC',NULL),(519,3,4,'00:30:00','N',-55,'TEAM rush for loss of 1 yard to the CGY54.','CGY',-1,1,10,'R','CGY',NULL),(520,3,4,'00:30:00','N',-54,'TEAM rush for loss of 1 yard to the CGY53.','CGY',-1,2,11,'R','CGY',NULL),(521,3,4,'00:30:00','N',-53,'TEAM rush for loss of 1 yard to the CGY52.','CGY',-1,3,12,'R','CGY',NULL),(522,4,1,'15:00:00','N',-45,'Niko DiFonte kickoff 65 yards to the MAN0, M. Ritchott return 30 yards to the MAN30 (Jacob Kirk).','CGY',30,0,0,NULL,'CGY',NULL),(523,4,1,'14:54:00','N',-30,'V. S-Laviolette rush for 1 yard to the MAN31 (Grant McDonald).','MAN',1,1,10,'R','MAN',NULL),(524,4,1,'14:54:00','N',-31,'Des Catellier pass complete to Trysten Dyce for 24 yards to the 55 yardline, 1ST DOWN MAN (AbrahamsWebster).','MAN',24,2,9,'P','MAN',NULL),(525,4,1,'14:54:00','N',-55,'Des Catellier pass complete to Macho Bockru for 5 yards to the CGY50 (Deane Leonard).','MAN',5,1,10,'P','MAN',NULL),(526,4,1,'14:54:00','Y',50,'Des Catellier pass incomplete to Birhanu Yitna (Jacob Biggs), PENALTY CGY pass interference 4 yards to the CGY46, 1ST DOWN MAN, NO PLAY.','MAN',0,2,5,'P','CGY',NULL),(527,4,1,'14:54:00','N',46,'Des Catellier pass intercepted by Deane Leonard at the CGY30, Tyler Santos return 0 yards to the CGY30.','MAN',0,1,10,'P','CGY',NULL),(528,4,1,'12:32:00','N',-30,'Jeshrun Antwi rush for 3 yards to the CGY33 (Jeremie Drouin).','CGY',3,1,10,'R','CGY',NULL),(529,4,1,'12:32:00','N',-33,'Adam Sinagra pass incomplete to Tyson Philpot, dropped pass.','CGY',0,2,7,'P','CGY',NULL),(530,4,1,'12:32:00','N',-33,'Niko DiFonte punt 42 yards to the MAN35, M. Ritchott return 5 yards to the MAN40, PENALTY MAN holding 10 yards to the MAN30, 1st and 10, MAN ball on MAN30.','CGY',5,3,7,NULL,'CGY',NULL),(531,4,1,'11:24:00','N',-30,'Des Catellier pass incomplete to Macho Bockru.','MAN',0,1,10,'P','MAN',NULL),(532,4,1,'11:24:00','N',-30,'Des Catellier pass complete to Macho Bockru for 40 yards to the CGY40, 1ST DOWN MAN.','MAN',40,2,10,'P','MAN',NULL),(533,4,1,'11:24:00','N',40,'Logan Fischer rush for loss of 3 yards to the CGY43, fumble by Logan Fischer recovered by MAN C. Krause at CGY41.','MAN',-3,1,10,'R','CGY',NULL),(534,4,1,'11:24:00','N',41,'Des Catellier pass incomplete to A. Gassama.','MAN',0,2,11,'P','CGY',NULL),(535,4,1,'09:39:00','N',41,'Matt Riley punt 34 yards to the CGY7, out-of-bounds.','MAN',NULL,3,11,NULL,'CGY','Y'),(536,4,1,'09:32:00','N',-7,'Jeshrun Antwi rush for 1 yard to the CGY8 (Derek Dufault;Nick Thomas).','CGY',1,1,10,'R','CGY',NULL),(537,4,1,'09:32:00','N',-8,'Adam Sinagra pass complete to Dallas Boath for 4 yards to the CGY12 (Stefan Conway).','CGY',4,2,9,'P','CGY',NULL),(538,4,1,'08:05:00','N',-12,'TEAM rush for loss of 12 yards to the CGY0, TEAM safety, .','CGY',-12,3,5,'R','CGY',NULL),(539,4,1,'08:05:00','N',-35,'Niko DiFonte kickoff 70 yards to the MAN5, M. Ritchott return 27 yards to the MAN32, PENALTY MAN holding 10 yards to the MAN22, 1st and 10, MAN ball on MAN22.','CGY',27,0,0,NULL,'CGY',NULL),(540,4,1,'07:58:00','N',-22,'Des Catellier pass incomplete to Macho Bockru.','MAN',0,1,10,'P','MAN',NULL),(541,4,1,'07:58:00','N',-22,'Des Catellier rush for 19 yards to the MAN41, 1ST DOWN MAN (Joe Cant).','MAN',19,2,10,'P','MAN',NULL),(542,4,1,'07:58:00','N',-41,'Des Catellier pass complete to Kai Madsen for 13 yards to the MAN54, 1ST DOWN MAN (Charlie Moore).','MAN',13,1,10,'P','MAN',NULL),(543,4,1,'07:58:00','N',-54,'M. Ritchott rush for loss of 1 yard to the MAN53 (Charlie Moore).','MAN',-1,1,10,'R','MAN',NULL),(544,4,1,'07:58:00','N',-53,'Des Catellier pass incomplete to A. Gassama.','MAN',0,2,11,'P','MAN',NULL),(545,4,1,'07:58:00','N',-53,'Matt Riley punt 50 yards to the CGY7, N. Anderson return 5 yards to the CGY12 (Samson Abbott).','MAN',4,3,11,NULL,'MAN',NULL),(546,4,1,'04:54:00','N',-12,'Jeshrun Antwi rush for 6 yards to the CGY18 (Kyle Gordon;Arjay Shelley).','CGY',6,1,10,'R','CGY',NULL),(547,4,1,'04:54:00','N',-18,'Adam Sinagra pass complete to Alex Basilis for 12 yards to the CGY30, 1ST DOWN CGY (Stefan Conway).','CGY',12,2,4,'P','CGY',NULL),(548,4,1,'04:54:00','N',-30,'Adam Sinagra pass complete to Jeshrun Antwi for 9 yards to the CGY39 (Nick Thomas;Kyle Gordon).','CGY',9,1,10,'P','CGY',NULL),(549,4,1,'04:54:00','Y',-39,'Jeshrun Antwi rush for 2 yards to the CGY41, PENALTY MAN offside 5 yards to the CGY44, 1ST DOWN CGY, NO PLAY.','CGY',2,2,1,'R','CGY',NULL),(550,4,1,'04:54:00','N',-44,'Adam Sinagra pass complete to Jack McDonald for 7 yards to the CGY51 (Austin Balan).','CGY',7,1,10,'P','CGY',NULL),(551,4,1,'04:54:00','N',-51,'Adam Sinagra pass complete to Jeshrun Antwi for 6 yards to the MAN53, 1ST DOWN CGY (Nick Thomas).','CGY',6,2,3,'P','CGY',NULL),(552,4,1,'04:54:00','Y',53,'Adam Sinagra pass incomplete to R. Rodrigues, PENALTY CGY holding 10 yards to the CGY47, NO PLAY, PENALTY MAN IC 10 yards to the MAN53, NO PLAY.','CGY',0,1,10,'P','MAN',NULL),(553,4,1,'04:54:00','N',53,'Adam Sinagra pass complete to Tyson Philpot for 17 yards to the MAN36, 1ST DOWN CGY (Markos Bockru).','CGY',17,1,10,'P','MAN',NULL),(554,4,1,'04:54:00','N',36,'Adam Sinagra pass incomplete to Jalen Philpot.','CGY',0,1,10,'P','MAN',NULL),(555,4,1,'01:33:00','N',36,'Adam Sinagra pass complete to Tyson Philpot for 36 yards to the MAN0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',36,2,10,'P','MAN',NULL),(556,4,1,'01:33:00','N',5,'Niko DiFonte kick attempt good. PENALTY MAN 13 men on the field 10 yards to the 55 yardline.','CGY',NULL,0,0,NULL,'MAN',NULL),(557,4,1,'01:33:00','N',-55,'Niko DiFonte kickoff 57 yards to the MAN-2 - SINGLE, touchback.','CGY',NULL,0,0,NULL,'CGY',NULL),(558,4,1,'01:32:00','Y',-35,'PENALTY MAN offside 5 yards to the MAN30.','MAN',NULL,1,10,'N','MAN',NULL),(559,4,1,'01:32:00','N',-30,'Des Catellier pass complete to A. Gassama for 6 yards to the MAN36 (Deane Leonard).','MAN',6,1,15,'P','MAN',NULL),(560,4,1,'01:32:00','N',-36,'Des Catellier pass complete to Riley Harrison for 19 yards to the 55 yardline, 1ST DOWN MAN (AbrahamsWebster).','MAN',19,2,9,'P','MAN',NULL),(561,4,1,'01:32:00','N',-55,'Des Catellier rush for 1 yard to the CGY54 (Grant McDonald).','MAN',1,1,10,'P','MAN',NULL),(562,4,2,'15:00:00','N',54,'Des Catellier pass complete to Trysten Dyce for 8 yards to the CGY46, out-of-bounds.','MAN',8,2,9,'P','CGY','Y'),(563,4,2,'15:00:00','N',46,'Jonathan Remple rush for 2 yards to the CGY44, 1ST DOWN MAN (Grant McDonald).','MAN',2,3,1,'R','CGY',NULL),(564,4,2,'15:00:00','N',44,'A. Gassama rush for 1 yard to the CGY43 (Nick Statz;M. Lucyshyn).','MAN',1,1,10,'R','CGY',NULL),(565,4,2,'15:00:00','N',43,'Des Catellier pass incomplete to Macho Bockru.','MAN',0,2,9,'P','CGY',NULL),(566,4,2,'15:00:00','N',43,'Matt Riley punt 41 yards to the CGY2, N. Anderson return 0 yards to the CGY2.','MAN',0,3,9,NULL,'CGY',NULL),(567,4,2,'13:21:00','N',-2,'Jeshrun Antwi rush for 2 yards to the CGY4 (Cole Adamson;Kyle Gordon).','CGY',2,1,10,'R','CGY',NULL),(568,4,2,'13:21:00','N',-4,'Adam Sinagra pass incomplete to Dallas Boath (Markos Bockru), dropped pass.','CGY',0,2,8,'P','CGY',NULL),(569,4,2,'12:12:00','N',-4,'TEAM rush for loss of 4 yards to the CGY0, TEAM safety, .','CGY',-4,3,8,'R','CGY',NULL),(570,4,2,'12:12:00','N',-35,'Niko DiFonte kickoff 60 yards to the MAN15, M. Ritchott return 25 yards to the MAN40 (Aidan Miele).','CGY',25,0,0,NULL,'CGY',NULL),(571,4,2,'12:05:00','N',-40,'Des Catellier pass incomplete to Birhanu Yitna (Jacob Biggs).','MAN',0,1,10,'P','MAN',NULL),(572,4,2,'12:05:00','N',-40,'Des Catellier pass complete to Logan Fischer for loss of 2 yards to the MAN38 (Josh Hyer).','MAN',-2,2,10,'P','MAN',NULL),(573,4,2,'12:05:00','N',-38,'Matt Riley punt 50 yards to the CGY22, PENALTY CGY holding 10 yards to the CGY12, 1st and 10, CGY ball on CGY12.','MAN',0,3,12,NULL,'MAN','Y'),(574,4,2,'10:57:00','N',-12,'Jalen Philpot rush for 8 yards to the CGY20 (Nick Thomas).','CGY',8,1,10,'R','CGY',NULL),(575,4,2,'10:57:00','N',-20,'Jeshrun Antwi rush for 10 yards to the CGY30, 1ST DOWN CGY.','CGY',10,2,2,'R','CGY',NULL),(576,4,2,'10:57:00','N',-30,'Jeshrun Antwi rush for 40 yards to the MAN40, 1ST DOWN CGY (Samuel Hezekiah).','CGY',40,1,10,'R','CGY',NULL),(577,4,2,'10:57:00','N',40,'R. Rodrigues rush for 5 yards to the MAN35 (Kyle Gordon).','CGY',5,1,10,'R','MAN',NULL),(578,4,2,'10:57:00','N',35,'Adam Sinagra pass complete to Tyson Philpot for 18 yards to the MAN17, 1ST DOWN CGY (Markos Bockru).','CGY',18,2,5,'P','MAN',NULL),(579,4,2,'10:57:00','N',17,'Adam Sinagra pass complete to Dallas Boath for 6 yards to the MAN11 (Nick Thomas).','CGY',6,1,10,'P','MAN',NULL),(580,4,2,'07:25:00','N',11,'Adam Sinagra pass complete to Dallas Boath for 11 yards to the MAN0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',11,2,4,'P','MAN',NULL),(581,4,2,'07:25:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'MAN',NULL),(582,4,2,'07:25:00','N',-45,'Niko DiFonte kickoff 61 yards to the MAN4, M. Ritchott return 21 yards to the MAN25, PENALTY MAN IB 10 yards to the MAN15, 1st and 10, MAN ball on MAN15.','CGY',21,0,0,NULL,'CGY',NULL),(583,4,2,'07:17:00','N',-15,'Des Catellier pass incomplete to Macho Bockru, dropped pass.','MAN',0,1,10,'P','MAN',NULL),(584,4,2,'07:17:00','N',-15,'M. Ritchott rush for no gain to the MAN15 (J-Min Pelley).','MAN',0,2,10,'R','MAN',NULL),(585,4,2,'06:31:00','N',-15,'TEAM rush for loss of 15 yards to the MAN0, TEAM safety, .','MAN',-15,3,10,'R','MAN',NULL),(586,4,2,'06:31:00','N',-35,'Adam Sinagra pass complete to Jack McDonald for 25 yards to the MAN50 (Austin Balan;Arjay Shelley).','CGY',25,1,-35,'P','CGY',NULL),(587,4,2,'06:31:00','N',50,'Jeshrun Antwi rush for 6 yards to the MAN44 (Arjay Shelley).','CGY',6,2,50,'R','MAN',NULL),(588,4,2,'06:31:00','Y',44,'Adam Sinagra pass incomplete to Jack McDonald, PENALTY MAN pass interference 4 yards to the MAN40, 1ST DOWN CGY, NO PLAY.','CGY',0,3,44,'P','MAN',NULL),(589,4,2,'06:31:00','N',40,'R. Rodrigues rush for 1 yard to the MAN39 (Julian Luis).','CGY',1,1,10,'R','MAN',NULL),(590,4,2,'06:31:00','N',39,'Adam Sinagra pass incomplete to Tyson Philpot.','CGY',0,2,9,'P','MAN',NULL),(591,4,2,'03:30:00','N',39,'Niko DiFonte field goal attempt from 46 MISSED, kick to MAN-19, , Logan Fischer return 22 yards to the MAN3 (TEAM).','CGY',22,3,9,NULL,'MAN',NULL),(592,4,2,'03:30:00','N',-20,'Des Catellier pass intercepted by Grant McDonald at the MAN26, Grant McDonald return 0 yards to the MAN26 (Riley Harrison).','MAN',0,1,10,'P','MAN',NULL),(593,4,2,'03:00:00','N',26,'R. Rodrigues rush for 4 yards to the MAN22 (Brock Gowanlock).','CGY',4,1,10,'R','MAN',NULL),(594,4,2,'03:00:00','N',22,'Adam Sinagra rush for 14 yards to the MAN8, 1ST DOWN CGY, out-of-bounds.','CGY',14,2,6,'P','MAN','Y'),(595,4,2,'02:16:00','N',8,'Adam Sinagra pass complete to Dallas Boath for 8 yards to the MAN0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',8,1,8,'P','MAN',NULL),(596,4,2,'02:16:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'MAN',NULL),(597,4,2,'02:16:00','N',-45,'Niko DiFonte kickoff 59 yards to the MAN6, M. Ritchott return 32 yards to the MAN38 (Niko DiFonte).','CGY',32,0,0,NULL,'CGY',NULL),(598,4,2,'02:06:00','N',-38,'Logan Fischer rush for 9 yards to the MAN47 (Joe Cant).','MAN',9,1,10,'R','MAN',NULL),(599,4,2,'02:06:00','N',-47,'Des Catellier pass incomplete to A. Gassama.','MAN',0,2,1,'P','MAN',NULL),(600,4,2,'02:06:00','Y',-47,'Jonathan Remple rush for no gain to the MAN47, fumble by Jonathan Remple recovered by MAN Liam Haime at MAN47, PENALTY CGY offside 5 yards to the MAN52, 1ST DOWN MAN, NO PLAY.','MAN',0,3,1,'R','MAN',NULL),(601,4,2,'02:06:00','N',-52,'Des Catellier pass incomplete to Macho Bockru.','MAN',0,1,10,'P','MAN',NULL),(602,4,2,'02:06:00','Y',-52,'Des Catellier sacked for loss of 4 yards to the MAN48 (Jacob Plamondon), PENALTY CGY unnecessary roughness 15 yards to the CGY43, 1ST DOWN MAN, NO PLAY.','MAN',-4,2,10,'P','MAN',NULL),(603,4,2,'02:06:00','Y',43,'Logan Fischer rush for 15 yards to the CGY28 (Subomi Oyesorro), PENALTY MAN IB 10 yards to the CGY53, NO PLAY.','MAN',15,1,10,'R','CGY',NULL),(604,4,2,'02:06:00','N',53,'Logan Fischer rush for 12 yards to the CGY41 (Patrick Pankow).','MAN',12,1,20,'R','CGY',NULL),(605,4,2,'02:06:00','N',41,'Des Catellier pass complete to Trysten Dyce for 25 yards to the CGY16, fumble forced by Trey Dube, fumble by Trysten Dyce recovered by MAN Macho Bockru at CGY16, 1ST DOWN MAN.','MAN',25,2,8,'P','CGY',NULL),(606,4,2,'02:06:00','Y',16,'Des Catellier pass incomplete to Kai Madsen, PENALTY MAN holding 10 yards to the CGY26, NO PLAY.','MAN',0,1,10,'P','CGY',NULL),(607,4,2,'02:06:00','N',26,'Des Catellier pass incomplete to Kai Madsen.','MAN',0,1,20,'P','CGY',NULL),(608,4,2,'02:06:00','Y',26,'Logan Fischer rush for 7 yards to the CGY19 (AbrahamsWebster;Trey Dube), PENALTY CGY offside 5 yards to the CGY21, NO PLAY.','MAN',7,2,20,'R','CGY',NULL),(609,4,2,'02:06:00','N',21,'Des Catellier pass incomplete to Trysten Dyce.','MAN',0,2,15,'P','CGY',NULL),(610,4,2,'00:04:00','N',21,'Matt Riley field goal attempt from 28 GOOD, .','MAN',NULL,3,15,NULL,'CGY',NULL),(611,4,2,'00:04:00','N',-35,'TEAM rush for loss of 1 yard to the CGY34.','CGY',-1,1,65,'R','CGY',NULL),(612,4,3,'15:00:00','N',-45,'Matt Riley kickoff 70 yards to the CGY-5, N. Anderson return 81 yards to the MAN34 (Andrew Smith).','MAN',81,0,0,NULL,'MAN',NULL),(613,4,3,'14:40:00','N',34,'Adam Sinagra pass incomplete to Jalen Philpot.','CGY',0,1,10,'P','MAN',NULL),(614,4,3,'14:40:00','N',34,'Adam Sinagra sacked for loss of 7 yards to the MAN41 (Jeremie Drouin;Derek Dufault).','CGY',-7,2,10,'P','MAN',NULL),(615,4,3,'14:40:00','N',41,'Niko DiFonte punt 33 yards to the MAN8, out-of-bounds, PENALTY MAN holding 4 yards to the MAN4, 1st and 10, MAN ball on MAN4.','CGY',NULL,3,17,NULL,'MAN','Y'),(616,4,3,'13:26:00','N',-4,'Des Catellier pass complete to Macho Bockru for 12 yards to the MAN16, 1ST DOWN MAN (AbrahamsWebster).','MAN',12,1,10,'P','MAN',NULL),(617,4,3,'13:26:00','N',-16,'M. Ritchott rush for 19 yards to the MAN35, 1ST DOWN MAN (AbrahamsWebster).','MAN',19,1,10,'R','MAN',NULL),(618,4,3,'13:26:00','N',-35,'Des Catellier pass complete to Macho Bockru for 3 yards to the MAN38 (Subomi Oyesorro).','MAN',3,1,10,'P','MAN',NULL),(619,4,3,'13:26:00','N',-38,'Des Catellier pass complete to Trysten Dyce for 11 yards to the MAN49, 1ST DOWN MAN (Jacob Biggs).','MAN',11,2,7,'P','MAN',NULL),(620,4,3,'13:26:00','N',-49,'Des Catellier pass incomplete to Trysten Dyce.','MAN',0,1,10,'P','MAN',NULL),(621,4,3,'13:26:00','N',-49,'Des Catellier pass complete to Trysten Dyce for 8 yards to the CGY53 (Nick Statz).','MAN',8,2,10,'P','MAN',NULL),(622,4,3,'13:26:00','N',53,'Matt Riley punt 49 yards to the CGY4, N. Anderson return 2 yards to the CGY6, PENALTY CGY IB 3 yards to the CGY3, 1st and 10, CGY ball on CGY3.','MAN',2,3,2,NULL,'CGY',NULL),(623,4,3,'09:32:00','N',-3,'Jeshrun Antwi rush for 3 yards to the CGY6 (Markos Bockru).','CGY',3,1,10,'R','CGY',NULL),(624,4,3,'09:32:00','N',-6,'Adam Sinagra pass incomplete to Erik Nusl, dropped pass.','CGY',0,2,7,'P','CGY',NULL),(625,4,3,'08:32:00','N',-6,'TEAM rush for loss of 6 yards to the CGY0, TEAM safety, .','CGY',-6,3,7,'R','CGY',NULL),(626,4,3,'08:32:00','N',-35,'Niko DiFonte kickoff 39 yards to the MAN36, Liam Grace return 0 yards to the MAN36.','CGY',0,0,0,NULL,'CGY',NULL),(627,4,3,'08:32:00','N',-36,'V. S-Laviolette rush for 6 yards to the MAN42 (Charlie Moore).','MAN',6,1,10,'R','MAN',NULL),(628,4,3,'08:32:00','N',-42,'Des Catellier pass complete to Riley Harrison for 12 yards to the MAN54, 1ST DOWN MAN (Nick Statz).','MAN',12,2,4,'P','MAN',NULL),(629,4,3,'08:32:00','N',-54,'Des Catellier pass complete to A. Gassama for 11 yards to the CGY45, 1ST DOWN MAN (Charlie Moore).','MAN',11,1,10,'P','MAN',NULL),(630,4,3,'08:32:00','N',45,'Des Catellier pass complete to A. Gassama for 5 yards to the CGY40 (Deane Leonard).','MAN',5,1,10,'P','CGY',NULL),(631,4,3,'08:32:00','N',40,'Des Catellier pass incomplete to Macho Bockru (AbrahamsWebster).','MAN',0,2,5,'P','CGY',NULL),(632,4,3,'05:36:00','N',40,'Matt Riley field goal attempt from 47 MISSED, kick to CGY-8, , N. Anderson return 3 yards to the CGY-5, Matt Riley rouge, clock 05:36.','MAN',3,3,5,NULL,'CGY',NULL),(633,4,3,'05:36:00','N',-40,'Alex Basilis pass complete to Jack McDonald for 25 yards to the MAN45, 1ST DOWN CGY (Stefan Conway).','CGY',25,1,10,'P','CGY',NULL),(634,4,3,'05:36:00','Y',45,'PENALTY CGY IP 5 yards to the MAN50.','CGY',NULL,1,10,'N','MAN',NULL),(635,4,3,'05:36:00','N',50,'Jeshrun Antwi rush for 5 yards to the MAN45 (Nick Thomas).','CGY',5,1,15,'R','MAN',NULL),(636,4,3,'05:36:00','N',45,'Adam Sinagra pass incomplete to Alex Basilis, dropped pass.','CGY',0,2,10,'P','MAN',NULL),(637,4,3,'05:36:00','N',45,'Niko DiFonte punt 36 yards to the MAN9, V. S-Laviolette return 11 yards to the MAN20 (Jason Anyimadu).','CGY',11,3,10,NULL,'MAN',NULL),(638,4,3,'03:25:00','Y',-20,'PENALTY MAN IP 5 yards to the MAN15.','MAN',NULL,1,10,'N','MAN',NULL),(639,4,3,'03:25:00','N',-15,'Des Catellier pass complete to Macho Bockru for 11 yards to the MAN26 (AbrahamsWebster).','MAN',11,1,15,'P','MAN',NULL),(640,4,3,'03:25:00','N',-26,'Des Catellier rush for 7 yards to the MAN33, 1ST DOWN MAN (Charlie Moore).','MAN',7,2,4,'P','MAN',NULL),(641,4,3,'03:25:00','N',-33,'Des Catellier sacked for loss of 9 yards to the MAN24 (J-Min Pelley).','MAN',-9,1,10,'P','MAN',NULL),(642,4,3,'03:25:00','N',-24,'Des Catellier sacked for loss of 8 yards to the MAN16 (Josh Hyer).','MAN',-8,2,19,'P','MAN',NULL),(643,4,3,'03:25:00','N',-16,'Matt Riley punt 36 yards to the MAN52, N. Anderson return 8 yards to the MAN44 (Julian Luis).','MAN',8,3,27,NULL,'MAN',NULL),(644,4,3,'00:35:00','N',44,'Adam Sinagra sacked for loss of 3 yards to the MAN47 (Derek Dufault).','CGY',-3,1,10,'P','MAN',NULL),(645,4,3,'00:00:00','N',47,'Adam Sinagra pass incomplete to Tyson Philpot.','CGY',0,2,13,'P','MAN',NULL),(646,4,4,'15:00:00','N',47,'Niko DiFonte punt 35 yards to the MAN12, out-of-bounds.','CGY',NULL,3,13,NULL,'MAN','Y'),(647,4,4,'14:43:00','N',-12,'M. Ritchott rush for 5 yards to the MAN17 (Grant McDonald).','MAN',5,1,10,'R','MAN',NULL),(648,4,4,'14:43:00','N',-17,'Des Catellier pass complete to Macho Bockru for 4 yards to the MAN21 (Deane Leonard).','MAN',4,2,5,'P','MAN',NULL),(649,4,4,'14:43:00','Y',-21,'Jonathan Remple rush for 2 yards to the MAN23, PENALTY CGY offside 5 yards to the MAN26, 1ST DOWN MAN, NO PLAY.','MAN',2,3,1,'R','MAN',NULL),(650,4,4,'14:43:00','N',-27,'Des Catellier pass incomplete to Riley Harrison.','MAN',0,1,10,'P','MAN',NULL),(651,4,4,'14:43:00','N',-27,'Des Catellier pass incomplete to Macho Bockru.','MAN',0,2,10,'P','MAN',NULL),(652,4,4,'14:43:00','N',-26,'Matt Riley punt 37 yards to the CGY47, N. Anderson return 11 yards to the MAN52 (Andrew Smith), PENALTY MAN IP declined.','MAN',11,3,10,NULL,'MAN',NULL),(653,4,4,'12:23:00','N',52,'Adam Sinagra pass complete to Jeshrun Antwi for loss of 1 yard to the MAN53 (Stefan Conway).','CGY',-1,1,10,'P','MAN',NULL),(654,4,4,'12:23:00','N',53,'Adam Sinagra pass complete to Erik Nusl for 8 yards to the MAN45 (Stefan Conway).','CGY',8,2,11,'P','MAN',NULL),(655,4,4,'12:23:00','N',45,'Niko DiFonte punt 37 yards to the MAN8, out-of-bounds.','CGY',NULL,3,3,NULL,'MAN','Y'),(656,4,4,'11:04:00','N',-8,'Des Catellier pass complete to Trysten Dyce for 13 yards to the MAN21, 1ST DOWN MAN (Nick Statz).','MAN',13,1,10,'P','MAN',NULL),(657,4,4,'11:04:00','N',-21,'Des Catellier pass complete to Riley Harrison for 14 yards to the MAN35, 1ST DOWN MAN (M. Lucyshyn).','MAN',14,1,10,'P','MAN',NULL),(658,4,4,'11:04:00','N',-35,'V. S-Laviolette rush for 5 yards to the MAN40 (J-Min Pelley).','MAN',5,1,10,'R','MAN',NULL),(659,4,4,'11:04:00','N',-40,'Des Catellier pass complete to Trysten Dyce for 15 yards to the 55 yardline, 1ST DOWN MAN (Jacob Biggs).','MAN',15,2,5,'P','MAN',NULL),(660,4,4,'11:04:00','Y',-55,'Des Catellier pass incomplete to Macho Bockru, PENALTY CGY roughing passer 15 yards to the CGY40, 1ST DOWN MAN, NO PLAY.','MAN',0,1,10,'P','MAN',NULL),(661,4,4,'11:04:00','N',40,'Des Catellier pass incomplete to Macho Bockru.','MAN',0,1,10,'P','CGY',NULL),(662,4,4,'11:04:00','N',40,'Des Catellier rush for 13 yards to the CGY27, 1ST DOWN MAN (Nick Statz;Joe Cant).','MAN',13,2,10,'P','CGY',NULL),(663,4,4,'11:04:00','N',27,'Des Catellier pass intercepted by Nick Statz at the CGY-17, Nick Statz return 0 yards to the CGY-17.','MAN',0,1,10,'P','CGY',NULL),(664,4,4,'06:57:00','N',-20,'Adam Sinagra pass complete to Erik Nusl for 7 yards to the CGY27 (Stefan Conway).','CGY',7,1,10,'P','CGY',NULL),(665,4,4,'06:57:00','N',-27,'Adam Sinagra pass complete to Erik Nusl for 5 yards to the CGY32, 1ST DOWN CGY (Julian Luis).','CGY',5,2,3,'P','CGY',NULL),(666,4,4,'06:57:00','Y',-32,'Adam Sinagra pass complete to Jalen Philpot for 31 yards to the MAN47 (Nick Thomas), PENALTY CGY holding 10 yards to the CGY22, NO PLAY.','CGY',31,1,10,'P','CGY',NULL),(667,4,4,'06:57:00','N',-22,'Adam Sinagra pass complete to Jalen Philpot for 12 yards to the CGY34 (Markos Bockru).','CGY',12,1,20,'P','CGY',NULL),(668,4,4,'06:57:00','N',-34,'Adam Sinagra pass incomplete to Jalen Philpot, dropped pass.','CGY',0,2,8,'P','CGY',NULL),(669,4,4,'06:57:00','N',-34,'Niko DiFonte punt 40 yards to the MAN36, Shae Weekes return 5 yards to the MAN41 (Ross DeLauw).','CGY',5,3,8,NULL,'CGY',NULL),(670,4,4,'04:14:00','N',-41,'Des Catellier pass complete to M. Ritchott for 4 yards to the MAN45 (Charlie Moore).','MAN',4,1,10,'P','MAN',NULL),(671,4,4,'04:14:00','N',-45,'Des Catellier pass incomplete to Macho Bockru.','MAN',0,2,6,'P','MAN',NULL),(672,4,4,'04:14:00','N',-45,'Matt Riley punt 44 yards to the CGY21, N. Anderson return 1 yards to the CGY22 (Josh Robinson).','MAN',1,3,6,NULL,'MAN',NULL),(673,4,4,'03:06:00','N',-22,'Adam Sinagra pass complete to Jalen Philpot for 17 yards to the CGY39, 1ST DOWN CGY (Markos Bockru).','CGY',17,1,10,'P','CGY',NULL),(674,4,4,'03:06:00','N',-39,'Adam Sinagra pass incomplete to Alex Basilis.','CGY',0,1,10,'P','CGY',NULL),(675,4,4,'03:06:00','N',-39,'Adam Sinagra pass incomplete to Jalen Philpot.','CGY',0,2,10,'P','CGY',NULL),(676,4,4,'03:06:00','N',-39,'Niko DiFonte punt 45 yards to the MAN26, M. Ritchott return 50 yards to the CGY34 (Noah McDonough), PENALTY MAN unnecessary roughness 15 yards to the CGY49, 1st and 10, MAN ball on CGY49.','CGY',50,3,10,NULL,'CGY',NULL),(677,4,4,'01:58:00','N',49,'Des Catellier pass complete to Trysten Dyce for 10 yards to the CGY39, 1ST DOWN MAN (Jacob Biggs).','MAN',10,1,10,'P','CGY',NULL),(678,4,4,'01:58:00','N',39,'Des Catellier rush for 1 yard to the CGY38 (Grant McDonald).','MAN',1,1,10,'P','CGY',NULL),(679,4,4,'01:58:00','N',38,'Des Catellier rush for 25 yards to the CGY13, 1ST DOWN MAN (M. Lucyshyn;Nick Statz).','MAN',25,2,9,'P','CGY',NULL),(680,4,4,'01:23:00','N',13,'Des Catellier pass incomplete to Riley Harrison.','MAN',0,1,10,'P','CGY',NULL),(681,4,4,'01:23:00','N',13,'Des Catellier pass incomplete to A. Gassama.','MAN',0,2,10,'P','CGY',NULL),(682,4,4,'01:23:00','N',13,'Des Catellier pass incomplete to Riley Harrison.','MAN',0,3,10,'P','CGY',NULL),(683,4,4,'01:03:00','N',-13,'Jeshrun Antwi rush for no gain to the CGY13 (Brock Gowanlock).','CGY',0,1,10,'R','CGY',NULL),(684,4,4,'00:58:00','N',-13,'Jalen Philpot rush for 12 yards to the CGY25, 1ST DOWN CGY (Brock Gowanlock).','CGY',12,2,10,'R','CGY',NULL),(685,4,4,'00:58:00','N',-25,'TEAM rush for loss of 1 yard to the CGY24.','CGY',-1,1,10,'R','CGY',NULL),(686,4,4,'00:58:00','N',-24,'TEAM rush for loss of 1 yard to the CGY23.','CGY',-1,2,11,'R','CGY',NULL),(687,4,4,'00:58:00','N',-23,'TEAM rush for loss of 1 yard to the CGY22.','CGY',-1,3,12,'R','CGY',NULL),(690,5,1,'14:54:00','N',-30,'V. S-Laviolette rush for 1 yard to the MAN31 (Grant McDonald).','MAN',1,1,10,'R','MAN',NULL),(691,5,3,'11:03:00','N',43,'Tommy Yanchuk pass intercepted by Deane Leonard at the CGY38, Deane Leonard return 72 yards to the UBC0, TOUCHDOWN, .','UBC',0,2,10,'P','CGY','Y'),(694,3,4,'01:06:00','N',-34,'Gabe Olivares pass incomplete to Marcus Browne, PENALTY UBC disqualification objectionable conduct, PENALTY CGY disqualification objectionable conduct off-setting.','UBC',0,2,10,'P','UBC',NULL);
/*!40000 ALTER TABLE `play` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` varchar(45) NOT NULL,
  `team_code` varchar(3) DEFAULT NULL,
  `player_name` varchar(45) DEFAULT NULL,
  `jersey_number` int(11) DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `hometown` varchar(45) DEFAULT NULL,
  `high_school_team` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`player_id`,`creation_date`),
  KEY `team_code_idx` (`team_code`),
  CONSTRAINT `team_code` FOREIGN KEY (`team_code`) REFERENCES `team` (`team_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'2/24/2020 21:01','CGY','Josiah Joseph',1,'6-3','QB',215,'4','Peachland, BC','Okanagan Sun (Mount Boucherie)'),(2,'2/24/2020 21:01','CGY','Deane Leonard',2,'6-2','DB',193,'3','Calgary, Alta','(Notre Dame)'),(3,'2/24/2020 21:01','CGY','Jacob Biggs',3,'6-1','DB',185,'2','Calgary, Alta','(St Francis)'),(4,'2/24/2020 21:01','CGY','Sterling Taylor IV',4,'6-2','DB',200,'5','Atlanta, Ga, USA','Murray State Univ (Morrow)'),(5,'2/24/2020 21:01','CGY','Jalen Philpot',5,'6-1','WR',185,'2','Delta, BC','(Seaquam)'),(6,'2/24/2020 21:01','CGY','Tyson Philpot',6,'6-1','WR',190,'2','Delta, BC','(Seaquam)'),(7,'2/24/2020 21:01','CGY','Matteo Spoletini',7,'6-3','QB',215,'1','Calgary, Alta','(Notre Dame)'),(8,'2/24/2020 21:01','CGY','Nick Statz',8,'5-10','DB',180,'5','Calgary, Alta','(Notre Dame)'),(9,'2/24/2020 21:01','CGY','Grant McDonald',9,'6-3','LB',225,'3','Tsawwassen, BC','Univ of Maine (South Delta)'),(10,'2/24/2020 21:01','CGY','Jack McDonald',10,'6-1','WR',210,'5','South Delta, BC','(South Delta)'),(11,'2/24/2020 21:01','CGY','Dallas Boath',11,'5-9','WR',185,'5','Calgary, Alta','(Centennial)'),(12,'2/24/2020 21:01','CGY','Adam Sinagra',12,'6-1','QB',195,'5','Pointe Claire, Que','John Abbott College'),(13,'2/24/2020 21:01','CGY','Matthew Wilson',13,'6-1','QB',183,'1','Saskatoon, Sask','(Holy Cross)'),(14,'2/24/2020 21:01','CGY','Jason Anyimadu',14,'6-1','DB',205,'4','Mississauga, Ont','Hamilton Hurricanes (Our Lady of Mount Carmel)'),(15,'2/24/2020 21:01','CGY','Treshaun Abrahams-Webster',15,'5-11','DB',185,'4','Pickering, Ont','Canada Prep (Pickering)'),(16,'2/24/2020 21:01','CGY','Daniel Sananes',16,'6-4','QB',215,'1','Lachine, Que','Vanier College'),(17,'2/24/2020 21:01','CGY','Andrew Ricard',18,'6-2','DB',195,'4','Winnipeg, Man','Winnipeg Rifles (Elmwood)'),(18,'2/24/2020 21:01','CGY','Matson Tulloch',19,'5-8','WR',170,'1','Calgary, Alta','(Henry Wise Wood)'),(19,'2/24/2020 21:01','CGY','Alessandro Molnar',20,'5-10','RB',195,'3','Calgary, Alta','Rundle College'),(20,'2/24/2020 21:01','CGY','Jeshrun Antwi',21,'6-1','RB',210,'5','Calgary, Alta','(Father Lacombe)'),(21,'2/24/2020 21:01','CGY','Patrick Pankow',22,'5-11','DB',185,'4','Perth, Ont','Univ of Toronto (St John CHS)'),(22,'2/24/2020 21:01','CGY','Trey Dube',23,'6-1','DB',198,'2','Calgary, Alta','(Henry Wise Wood)'),(23,'2/24/2020 21:01','CGY','Keidron Hughes',24,'6-4','DB',170,'1','Calgary, Alta','(William Aberhart)'),(24,'2/24/2020 21:01','CGY','Beko Wande',25,'6-1','DB',173,'1','Red Deer, Alta','(Notre Dame)'),(25,'2/24/2020 21:01','CGY','Matthew Lucyshyn',26,'6-1','DB',180,'3','Calgary, Alta','(Bishop Grandin)'),(26,'2/24/2020 21:01','CGY','Joe Cant',27,'6-1','DB',185,'3','Calgary, Alta','(Notre Dame)'),(27,'2/24/2020 21:01','CGY','Thirpam Thomas',28,'6-1','WR',160,'1','Calgary, Alta','(Notre Dame)'),(28,'2/24/2020 21:01','CGY','Tyler Santos',30,'6-1','RB',210,'1','Calgary, Alta','(Henry Wise Wood)'),(29,'2/24/2020 21:01','CGY','O\'Shae Ho-Sang',31,'6-1','RB',200,'1','Lasalle, Que','(Kents Hill)'),(30,'2/24/2020 21:01','CGY','Cole Kussmann',32,'5-10','RB',195,'4','London, Ont','(Mother Teresa)'),(31,'2/24/2020 21:01','CGY','Robinson Rodrigues',33,'5-10','RB',195,'4','Burnaby, BC','Okanagan Sun (Coquitlam)'),(32,'2/24/2020 21:01','CGY','Payton Burbank',34,'6-2','WR',180,'1','Okotoks, Alta','(Foothills Composite)'),(33,'2/24/2020 21:01','CGY','Ross DeLauw',35,'5-11','LB',225,'5','Lethbridge, Alta','(Winston Churchill)'),(34,'2/24/2020 21:01','CGY','Tyson Rowe',36,'6-1','RB',225,'1','Calgary, Alta','(St Francis)'),(35,'2/24/2020 21:01','CGY','Zach Newman',37,'6-2','RB',245,'2','Calgary, Alta','(Robert Thirsk)'),(36,'2/24/2020 21:01','CGY','Caleb Guthrie',38,'6-1','LB',208,'1','Calgary, Alta','(Robert Thirsk)'),(37,'2/24/2020 21:01','CGY','Josh Yanchishyn',40,'6-1','DB',170,'1','Winnipeg, Man','(Dakota Collegiate)'),(38,'2/24/2020 21:01','CGY','Madison Spewak',41,'5-10','DB',170,'1','Winnipeg, Man','(Dakota Collegiate)'),(39,'2/24/2020 21:01','CGY','Noah McDonough',42,'6-1','DB',195,'2','Calgary, Alta','(St Francis)'),(40,'2/24/2020 21:01','CGY','Subomi Oyesoro',43,'6-1','LB',215,'2','Calgary, Alta','(Crescent Heights)'),(41,'2/24/2020 21:01','CGY','Aidan Miele',44,'5-10','LB',208,'1','Calgary, Alta','(Notre Dame)'),(42,'2/24/2020 21:01','CGY','Niko DiFonte',45,'6-1','K/P',170,'4','Winnipeg, Man','(Oak Park)'),(43,'2/24/2020 21:01','CGY','Steen Rasmussen',46,'5-11','DB',185,'1','Lantzville, BC','(John Barsby)'),(44,'2/24/2020 21:01','CGY','Patrick Jelen',47,'6-1','DB',190,'1','Okotoks, Alta','(Holy Trinity Academy)'),(45,'2/24/2020 21:01','CGY','Caleb Callaghan',48,'6-1','LB',195,'1','Calgary, Alta','(Crescent Heights)'),(46,'2/24/2020 21:01','CGY','Jacob Kirk',49,'6-1','DB',175,'1','Tsawwassen, BC','(South Delta)'),(47,'2/24/2020 21:01','CGY','Charlie Moore',50,'6-3','LB',215,'3','South Delta, BC','(South Delta)'),(48,'2/24/2020 21:01','CGY','Daniel Flanagan',51,'6-1','LB',190,'1','Calgary, Alta','(St Francis)'),(49,'2/24/2020 21:01','CGY','Peter Nicastro',52,'6-2','OL',310,'3','Calgary, Alta','(St Francis)'),(50,'2/24/2020 21:01','CGY','Nikolas Fourlas',53,'5-11','LB',200,'1','Calgary, Alta','(Henry Wise Wood)'),(51,'2/24/2020 21:01','CGY','Chaz Marshall',54,'6-1','LS',215,'1','Port Coquitlam, BC','(Terry Fox)'),(52,'2/24/2020 21:01','CGY','Salim Fraser',55,'6-3','DL',257,'1','Calgary, Alta','(Sir Winston Churchill)'),(53,'2/24/2020 21:01','CGY','Spencer Roy',56,'6-4','OL',330,'4','Calgary, Alta','(Notre Dame)'),(54,'2/24/2020 21:01','CGY','Daniel Teitz',57,'6-1','LB',220,'3','Calgary, Alta','(Springbank)'),(55,'2/24/2020 21:01','CGY','Carter Johnson',58,'6-3','OL',300,'1','Calgary, Alta','(Henry Wise Wood)'),(56,'2/24/2020 21:01','CGY','George Hutchings',59,'6-2','OL',300,'3','Calgary, Alta','(St Andrew\'s College)'),(57,'2/24/2020 21:01','CGY','Jay-Ar Driedger',60,'6-1','OL',295,'1','Winnipeg, Man','(Dakota Collegiate)'),(58,'2/24/2020 21:01','CGY','Nicolas Auvigne',61,'6-2','OL',280,'2','Calgary, Alta','(St Francis)'),(59,'2/24/2020 21:01','CGY','Chad Whittemore',64,'6-1','OL',270,'1','Calgary, Alta','(Bishop O\'Byrne)'),(60,'2/24/2020 21:01','CGY','Simon Li',65,'6-6','OL',310,'1','Vancouver, BC','(West Vancouver)'),(61,'2/24/2020 21:01','CGY','Tyler Packer',66,'6-6','OL',330,'3','Calgary, Alta','(Notre Dame)'),(62,'2/24/2020 21:01','CGY','Carter Comeau',67,'6-6','OL',350,'4','Riverton, Man','Okanagan Sun (Riverton Collegiate)'),(63,'2/24/2020 21:01','CGY','John Bosse',68,'6-6','OL',285,'1','Calgary, Alta','(Lester B Pearson)'),(64,'2/24/2020 21:01','CGY','Logan Bandy',69,'6-5','OL',285,'3','Calgary, Alta','(St Francis)'),(65,'2/24/2020 21:01','CGY','Carson Dueck',71,'6-1','K/P',170,'1','Calgary, Alta','(William Aberhart)'),(66,'2/24/2020 21:01','CGY','Tariq Essa',72,'6-5','OL',300,'1','Calgary, Alta','(Ernest Manning)'),(67,'2/24/2020 21:01','CGY','Matthew Lawrence',74,'6-2','LB',218,'1','Calgary, Alta','(John G Diefenbaker)'),(68,'2/24/2020 21:01','CGY','Danny Tasie',75,'5-11','DL',265,'1','Calgary, Alta','Okanagan Sun (Lester B Pearson)'),(69,'2/24/2020 21:01','CGY','Curtis Prime',76,'6-3','DL',270,'1','Calgary, Alta','(St Francis)'),(70,'2/24/2020 21:01','CGY','Scott MacDonell',77,'6-6','DL',235,'1','Calgary, Alta','(Springbank)'),(71,'2/24/2020 21:01','CGY','Tom Baatar',79,'6-7','DL',232,'1','Calgary, Alta','(St Mary\'s)'),(72,'2/24/2020 21:01','CGY','Payton Price',80,'6-1','WR',195,'1','Okotoks, Alta','(Foothills Composite)'),(73,'2/24/2020 21:01','CGY','Dante Carbone',81,'6-4','WR',195,'1','Victoria, BC','(Mount Douglas)'),(74,'2/24/2020 21:01','CGY','Nathanael Durkan',82,'6-2','WR',190,'4','Nanaimo, BC','Simon Fraser Univ (John Barsby)'),(75,'2/24/2020 21:01','CGY','Erik Nusl',84,'5-11','WR',170,'2','Cochrane, Alta','(Cochrane)'),(76,'2/24/2020 21:01','CGY','Alex Basilis',85,'6-1','WR',200,'3','Calgary, Alta','(St Mary\'s)'),(77,'2/24/2020 21:01','CGY','Hunter Karl',86,'6-1','WR',185,'5','Okotoks, Alta','(Foothills Composite)'),(78,'2/24/2020 21:01','CGY','Mason David',87,'6-3','WR',235,'1','Calgary, Alta','(Henry Wise Wood)'),(79,'2/24/2020 21:01','CGY','Michail Peters',88,'6-1','WR',180,'1','Calgary, Alta','(Bishop McNally)'),(80,'2/24/2020 21:01','CGY','Nathanael Anderson',89,'6-1','WR',180,'2','Salt Lake City, Utah, USA','Okanagan Sun (Copper Hills)'),(81,'2/24/2020 21:01','CGY','J-Min Pelley',90,'6-6','DL',320,'2','Calgary, Alta','Okanagan Sun'),(82,'2/24/2020 21:01','CGY','Tyrese Best',91,'6-4','DL',260,'2','Calgary, Alta','(Henry Wise Wood)'),(83,'2/24/2020 21:01','CGY','Jacob Plamondon',92,'6-3','DL',230,'3','Red Deer, Alta','(Notre Dame)'),(84,'2/24/2020 21:01','CGY','Nathan Teitz',93,'6-2','DL',250,'1','Calgary, Alta','(Springbank)'),(85,'2/24/2020 21:01','CGY','Chimzy Tasie',94,'6-3','DL',260,'2','Calgary, Alta','(Lester B Pearson)'),(86,'2/24/2020 21:01','CGY','Josh Hyer',96,'6-4','DL',250,'2','Vernon, BC','(Vernon Secondary)'),(87,'2/24/2020 21:01','CGY','Max Baatar',97,'6-1','DL',265,'4','Calgary, Alta','(Henry Wise Wood)'),(88,'2/24/2020 21:01','CGY','Zach Xavier',98,'5-11','DL',250,'1','Calgary, Alta','(William Aberhart)'),(89,'2/24/2020 21:01','CGY','Hayden Nellis',99,'6-4','DL',280,'4','Winnipeg, Man','Winnipeg Rifles (Dakota Collegiate)'),(90,'2/24/2020 21:01','CGY','Jayden Bailey',0,'6-4','RB',205,'1','Calgary, Alta','(Bishop O\'Byrne)'),(91,'2/24/2020 21:01','CGY','Joe Bell',0,'6-1','WR',176,'1','Calgary, Alta','(Cochrane)'),(92,'2/24/2020 21:01','CGY','Caleb Cutcliffe',0,'6-1','QB',200,'2','Oakville, Ont','Gavilan College (Oakville Trafalgar)'),(93,'2/24/2020 21:01','CGY','Brandon MacIsaac',0,'6-3','WR',210,'2','Calgary, Alta','Calgary Colts (St Francis)'),(94,'2/24/2020 21:01','CGY','Abdelmalik Mohammed',0,'6-1','WR',204,'2','Kristianstad, SWE',''),(95,'2/24/2020 21:01','CGY','Dylan Neis',0,'6-1','WR',170,'1','Cochrane, Alta','(Cochrane)'),(96,'2/24/2020 21:01','CGY','Omar Ramy',0,'6-1','WR',199,'2','Cairo, EGY','Univ of Wyoming'),(97,'2/24/2020 21:01','CGY','Alex Wahl',0,'6-5','WR',207,'1','North Vancouver, BC','(Argyle Secondary)'),(98,'2/24/2020 21:01','CGY','Nick Watson',0,'6-1','DB',195,'1','Calgary, Alta','(Centennial)'),(99,'2/24/2020 21:01','CGY','Evan Zadery',0,'6-1','DB',180,'1','Calgary, Alta','(Henry Wise Wood)'),(100,'2/24/2020 21:01','UBC','Edgerrin Williams',1,'5-11','Rec',180,'1','Hamilton, Ont','St Thomas More Catholic'),(101,'2/24/2020 21:01','UBC','Christophe Bouchard',2,'6-2','DB',175,'1','Québec City, Que','Campus Notre-Dame-de-Foy'),(102,'2/24/2020 21:01','UBC','Kamryn Matheson',3,'5-11','DB',180,'1','Truro, NS','IMG Academy'),(103,'2/24/2020 21:01','UBC','Tommy Yanchuk',4,'6-1','QB',195,'1','Lloydminster, Sask','Holy Rosary High'),(104,'2/24/2020 21:01','UBC','Marc Bouchard',12,'5-11','Rec',165,'1','Saint-Bernard, Que',''),(105,'2/24/2020 21:01','UBC','Ryan Baker',14,'6-2','QB',200,'1','North Vancouver, BC','Windsor Secondary'),(106,'2/24/2020 21:01','UBC','Julian Hartley',18,'6-2','Rec',180,'1','North Vancouver, BC','Argyle Secondary'),(107,'2/24/2020 21:01','UBC','Max Kennedy',19,'5-10','DB',183,'1','Port Moody, BC','Centennial Secondary'),(108,'2/24/2020 21:01','UBC','Joshua Martin',20,'5-9','Rec',180,'1','Livermore, Calif','Livermore High'),(109,'2/24/2020 21:01','UBC','Eric Dika-Balotoken',23,'5-8','DB',170,'1','North Vancouver, BC','Handsworth Secondary'),(110,'2/24/2020 21:01','UBC','Charles Lemay',30,'5-11','RB',190,'1','Coldstream, BC','Vernon Secondary'),(111,'2/24/2020 21:01','UBC','Chris Thelasco',33,'5-11','DB',180,'1','Calgary, Alta','Father Lacombe Senior High'),(112,'2/24/2020 21:01','UBC','Dario Ciccone',37,'6-1','DB',180,'1','Burnaby, BC','St Thomas More Collegiate'),(113,'2/24/2020 21:01','UBC','Joel Pielak',38,'5-10','RB',190,'1','Coquitlam, BC','St Thomas More Collegiate'),(114,'2/24/2020 21:01','UBC','Daniel Auld',39,'6-1','DB',180,'1','Burnaby, BC','St Thomas More Collegiate'),(115,'2/24/2020 21:01','UBC','Owen Brown',41,'5-10','K',165,'1','Winnipeg, Man','St John\'s Ravenscourt'),(116,'2/24/2020 21:01','UBC','Mitchell Townsend',42,'6-4','LB',220,'1','North Vancouver, BC','Windsor Secondary'),(117,'2/24/2020 21:01','UBC','John Nikolovski',46,'6-1','LB',205,'1','Burlington, Ont','St Ignatius of Loyola Catholic'),(118,'2/24/2020 21:01','UBC','Marcus Nikolovski',49,'6-3','LB',232,'1','Burlington, Ont','St Ignatius of Loyola Catholic'),(119,'2/24/2020 21:01','UBC','Aiden Bertuzzi',55,'6-5','DL',220,'1','Victoria, BC','Mt Douglas Secondary'),(120,'2/24/2020 21:01','UBC','Noah Hochfelder',62,'6-2','OL',260,'1','Vancouver, BC','Vancouver College'),(121,'2/24/2020 21:01','UBC','Kevin Morrison',64,'6-5','OL',265,'1','Langley, BC','DW Poppy Secondary'),(122,'2/24/2020 21:01','UBC','Gavin Murray',68,'6-3','OL',265,'1','Delta, BC','Seaquam Secondary'),(123,'2/24/2020 21:01','UBC','Theo Benedet',72,'6-7','OL',240,'1','North Vancouver, BC','Handsworth Secondary'),(124,'2/24/2020 21:01','UBC','Giovanni Manu',76,'6-8','OL',320,'1','Pitt Meadows, BC','Pitt Meadows Secondary'),(125,'2/24/2020 21:01','UBC','Lucas Robertson',82,'6-4','Rec',230,'1','Edmonton, Alta','St Pius X High'),(126,'2/24/2020 21:01','UBC','Daniel Okumagba',84,'6-3','Rec',186,'1','Calgary, Alta','St Mary\'s High'),(127,'2/24/2020 21:01','UBC','Brad Hladik',87,'6-4','TE',200,'1','Vernon, BC','Vernon Secondary'),(128,'2/24/2020 21:01','UBC','Isaac Williams',89,'6-1','Rec',180,'1','Calgary, Alta','Centennial High'),(129,'2/24/2020 21:01','UBC','Kyle Samson',92,'6-3','DL',253,'1','Hamilton, Ont','Cardinal Newman Catholic'),(130,'2/24/2020 21:01','UBC','Sam Steele',99,'6-1','DL',225,'1','Surrey, BC','St Thomas More Collegiate'),(131,'2/24/2020 21:01','UBC','Ryan Smith',5,'6-1','Rec',195,'2','Calgary, Alta','Notre Dame High'),(132,'2/24/2020 21:01','UBC','Ted Kubongo',6,'6-1','RB',212,'2','Calgary, Alta','St Matthews High'),(133,'2/24/2020 21:01','UBC','Michael Calvert',8,'6-2','DB',200,'2','Delta, BC','South Delta Secondary'),(134,'2/24/2020 21:01','UBC','Nick Cross',9,'6-1','LB',200,'2','Regina, Sask','Dr Martin LeBoldus High'),(135,'2/24/2020 21:01','UBC','Gabe Olivares',10,'5-10','QB',205,'2','Chilliwack, BC','GW Graham Secondary'),(136,'2/24/2020 21:01','UBC','Jaxon Ciraolo-Brown',22,'6-1','DB',190,'2','Hamilton, Ont','Cathedral High'),(137,'2/24/2020 21:01','UBC','James Vause',24,'6-1','DB',193,'2','Saskatoon, Sask','Aden Bowman Collegiate'),(138,'2/24/2020 21:01','UBC','Nick Pollitt',25,'6-1','Rec',175,'2','Calgary, Alta','Henry Wise Wood High'),(139,'2/24/2020 21:01','UBC','Cormac Scholz',26,'6-1','LB',205,'2','Calgary, Alta','Springbank Community High'),(140,'2/24/2020 21:01','UBC','Sharique Khan',27,'5-11','RB',185,'2','Fort McMurray, Alta','Holy Trinity Catholic High'),(141,'2/24/2020 21:01','UBC','David Habashy',28,'6-1','LB',220,'2','Vancouver, BC','American International School'),(142,'2/24/2020 21:01','UBC','Daniel Appiah',34,'5-6','RB',150,'2','Calgary, Alta','Ernest Manning High'),(143,'2/24/2020 21:01','UBC','Luke Burton-Krahn',40,'6-1','DB',225,'2','Victoria, BC','Esquimalt Secondary'),(144,'2/24/2020 21:01','UBC','Lake Korte-Moore',44,'6-5','LB',227,'2','Ottawa, Ont','St Joseph\'s Catholic'),(145,'2/24/2020 21:01','UBC','Daniel Kwamou',45,'6-1','LB',216,'2','Calgary, Alta','Notre Dame High'),(146,'2/24/2020 21:01','UBC','Brandon Sanford',63,'6-5','OL',300,'2','Salmon Arm, BC','Salmon Arm Secondary'),(147,'2/24/2020 21:01','UBC','Brendan Devane',80,'6-4','Rec',210,'2','Mississauga, Ont','Port Credit Secondary'),(148,'2/24/2020 21:01','UBC','Jacob Patten',81,'6-1','Rec',170,'2','Stoney Creek, Ont','Bishop Ryan Catholic'),(149,'2/24/2020 21:01','UBC','Kees Den Ouden',83,'6-1','Rec',190,'2','Calgary, Alta','Centennial High'),(150,'2/24/2020 21:01','UBC','Tom Schnitzler',94,'6-5','DL',245,'2','Saskatoon, Sask','Bishop James Mahoney High'),(151,'2/24/2020 21:01','UBC','Darth Hundal',95,'6-3','DL',255,'2','Calgary, Alta','St Francis High'),(152,'2/24/2020 21:01','UBC','Elias Rodriguez',98,'6-1','DL',260,'2','Kelowna, BC','Kelowna Secondary'),(153,'2/24/2020 21:01','UBC','Kene Ezekeke',11,'6-2','DB',190,'3','Calgary, Alta','St Mary\'s High'),(154,'2/24/2020 21:01','UBC','Lliam Wishart',13,'6-2','Rec',197,'3','Kamloops, BC','Valleyview Secondary'),(155,'2/24/2020 21:01','UBC','Payton LaGrange',16,'5-8','DB',175,'3','Red Deer, Alta','Notre Dame High'),(156,'2/24/2020 21:01','UBC','Bashiru Sise-Odaa',29,'5-8','DB',183,'3','Surrey, BC','Frank Hurt Secondary'),(157,'2/24/2020 21:01','UBC','James Ens',31,'6-1','DB',195,'3','Sherwood Park, Alta','Bev Facey Community High'),(158,'2/24/2020 21:01','UBC','Elliot Graham',32,'6-3','DL',220,'3','Hamilton, Ont','Westdale Secondary'),(159,'2/24/2020 21:01','UBC','Garrin McDonnell',43,'6-2','K',230,'3','Parksville, BC','Ballenas Secondary'),(160,'2/24/2020 21:01','UBC','Saeed Hosain',50,'6-2','OL',300,'3','Burnaby, BC','Centennial Secondary'),(161,'2/24/2020 21:01','UBC','Ben Hladik',52,'6-4','LB',238,'3','Vernon, BC','Vernon Secondary'),(162,'2/24/2020 21:01','UBC','Ethan Slater',58,'6-3','OL',275,'3','Thunder Bay, Ont','St Ignatius High'),(163,'2/24/2020 21:01','UBC','Dave Edwards',70,'6-5','OL',290,'3','Delta, BC','South Delta Secondary'),(164,'2/24/2020 21:01','UBC','James Harney',74,'6-1','OL',270,'3','Squamish, BC','Notre Dame Regional'),(165,'2/24/2020 21:01','UBC','Diego Alatorre',75,'6-3','OL',315,'3','Tlajomulco de Zuñiga, Mexico',''),(166,'2/24/2020 21:01','UBC','Hamada Kanaan',77,'6-1','OL',280,'3','London, Ont','Catholic Central High'),(167,'2/24/2020 21:01','UBC','Marcus Browne',86,'6-4','Rec',206,'3','Surrey, BC','Holy Cross Regional'),(168,'2/24/2020 21:01','UBC','Nick Richard',88,'6-3','Rec',195,'3','Calgary, Alta','Notre Dame High'),(169,'2/24/2020 21:01','UBC','JJ DesLauriers',7,'5-11','Rec',180,'4','Surrey, BC','St Thomas More Collegiate'),(170,'2/24/2020 21:01','UBC','Trey Kellogg',21,'6-3','Rec',190,'4','De Winton, Alta','Foothills Composite High'),(171,'2/24/2020 21:01','UBC','Zackari Vint',36,'6-1','LB',215,'4','Kelowna, BC','Kelowna Secondary'),(172,'2/24/2020 21:01','UBC','Henrique Custodio',54,'6-1','DL',235,'4','Toronto, Ont','The Hill School'),(173,'2/24/2020 21:01','UBC','Kieran Janes',85,'6-4','TE',235,'4','New Westminster, BC','St Thomas More Collegiate'),(174,'2/24/2020 21:01','UBC','AJ Blackwell',35,'5-11','LB',190,'5','North Vancouver, BC','Carson Graham Secondary'),(175,'2/24/2020 21:01','REG','Maguire Abell',72,'6-1','OL',265,'2','Moose Jaw, Sask','Albert E Peacock Collegiate'),(176,'2/24/2020 21:01','REG','Gowrishan Aravinthan',23,'6-1','DB',180,'1','Regina, Sask','Campbell Collegiate'),(177,'2/24/2020 21:01','REG','Andrew Becker',65,'6-3','OL',300,'3','Kelowna, BC','Rutland Senior Secondary'),(178,'2/24/2020 21:01','REG','Isaac Birdsell-Tyndale',35,'5-9','RB',220,'RS','Regina, Sask','Miller Comprehensive HS'),(179,'2/24/2020 21:01','REG','Riley Boersma',83,'5-10','REC',175,'2','Cambridge, Ont','Royal Imperial Collegiate of Canada'),(180,'2/24/2020 21:01','REG','Roe Borgmann',67,'6-1','OL',270,'5','Lumsden, Sask','Lumsden HS'),(181,'2/24/2020 21:01','REG','Joel Braden',64,'6-5','OL',325,'3','Regina, Sask','Regina Thunder'),(182,'2/24/2020 21:01','REG','Seb Britton',2,'6-5','QB',230,'3','Calgary, Alta','Rundle College'),(183,'2/24/2020 21:01','REG','Brandon Brooks',6,'6-2','DB',190,'5','San Diego, Calif','University of Nevada'),(184,'2/24/2020 21:01','REG','Trey Campbell',5,'5-9','RB',190,'5','Toronto, Ont','Westshore Rebels'),(185,'2/24/2020 21:01','REG','Theren Churchill',62,'6-6','OL',295,'5','Stettler, Alta','Edmonton Huskies'),(186,'2/24/2020 21:01','REG','Michael Clow',98,'6-2','DL',210,'RS','Regina, Sask','Miller Comprehensive HS'),(187,'2/24/2020 21:01','REG','Cameron Cross',93,'6-3','DL',260,'4','North Vancouver, BC','Langley Rams'),(188,'2/24/2020 21:01','REG','Jacob Dakiniewich',47,'6-2','LB',205,'RS','Regina, Sask','Dr Martin LeBoldus HS'),(189,'2/24/2020 21:01','REG','Cord Delinte',31,'6-1','DB',205,'5','Cowley, Alta','Okanagan Sun'),(190,'2/24/2020 21:01','REG','Elias Deptuch',59,'5-11','DL',230,'RS','Regina, Sask','Dr Martin LeBoldus HS'),(191,'2/24/2020 21:01','REG','Dominique Dheilly',88,'6-1','REC',175,'RS','Regina, Sask','Dr Martin LeBoldus HS'),(192,'2/24/2020 21:01','REG','Andrew Doidge',57,'6-1','DL',210,'RS','Lumsden, Sask','Lumsden HS'),(193,'2/24/2020 21:01','REG','Josh Donnelly',17,'6-3','QB',185,'1','Regina, Sask','Dr Martin LeBoldus HS'),(194,'2/24/2020 21:01','REG','Jayse Easton',33,'5-10','RB',180,'RS','Moosomin, Sask','Moosomin Generals'),(195,'2/24/2020 21:01','REG','Chase Ellingson',16,'6-1','DB',190,'RS','Swan River, Man','Royal Imperial Collegiate of Canada'),(196,'2/24/2020 21:01','REG','Cody Ellingson',41,'6-1','LB',215,'3','Swan River, Man','Swan Valley Regional Secondary'),(197,'2/24/2020 21:01','REG','Zach Eltom',99,'6-3','DL',250,'1','Regina, Sask','Dr Martin LeBoldus HS'),(198,'2/24/2020 21:01','REG','Jared Ens',0,'6-2','DB',175,'RS','Warman, Sask','Bishop James Mahoney HS'),(199,'2/24/2020 21:01','REG','Jesse Ens',75,'6-4','OL',280,'3','Warman, Sask','Warman HS'),(200,'2/24/2020 21:01','REG','Jaxon Ford',21,'6-1','DB',190,'2','Regina, Sask','Campbell Collegiate'),(201,'2/24/2020 21:01','REG','Jaxon Fuchs',12,'5-11','DB',170,'RS','Regina, Sask','Michael A Riffel HS'),(202,'2/24/2020 21:01','REG','Aldo Galvan',1,'5-10','K',200,'2','Mexico City, Mexico','Bucaneros de Satélite'),(203,'2/24/2020 21:01','REG','Brandon Gandire',19,'6-1','DB',185,'3','Marietta, Ga','Westshore Rebels'),(204,'2/24/2020 21:01','REG','Will Genert',0,'6-1','DB',155,'RS','Regina, Sask','Miller Comprehensive HS'),(205,'2/24/2020 21:01','REG','Connor Green',53,'5-7','K',165,'RS','Portage la Prairie, Man','Portage Collegiate'),(206,'2/24/2020 21:01','REG','Lachlan Hardiker',82,'6-3','REC',180,'RS','Medicine Hat, Alta','Medicine Hat HS'),(207,'2/24/2020 21:01','REG','Garret Hatchard',49,'6-3','LB',210,'RS','Lloydminster, Alta','Lloydminster Comprehensive HS'),(208,'2/24/2020 21:01','REG','Colton Hippe',15,'6-4','QB',225,'4','Lloydminster, Sask','Edmonton Wildcats'),(209,'2/24/2020 21:01','REG','Zach Hirshmiller',97,'6-1','DL',245,'RS','Regina, Sask','Winston Knoll Collegiate'),(210,'2/24/2020 21:01','REG','Parker Hodel',70,'6-4','OL',305,'1','Regina, Sask','Winston Knoll Collegiate'),(211,'2/24/2020 21:01','REG','Josh Howe',58,'6-3','DL',225,'RS','Medicine Hat, Alta','Medicine Hat HS'),(212,'2/24/2020 21:01','REG','Thomas Hyett',11,'6-5','QB',210,'RS','Vernon, BC','Vernon Secondary'),(213,'2/24/2020 21:01','REG','Ethan Jaster',24,'5-8','DB',170,'RS','Regina, Sask','Archbishop MC O\'Neill HS'),(214,'2/24/2020 21:01','REG','Liam Jensen',63,'6-3','OL',285,'3','Watrous, Sask','Winston HS'),(215,'2/24/2020 21:01','REG','Colby Joyes',77,'6-6','OL',320,'RS','Clavet, Sask','Clavet Composite'),(216,'2/24/2020 21:01','REG','Christian Katende',38,'5-8','RB',220,'RS','Regina, Sask','Winston Knoll Collegiate'),(217,'2/24/2020 21:01','REG','Dallen Keen',4,'6-5','REC',195,'1','Regina, Sask','Miller Comprehensive HS'),(218,'2/24/2020 21:01','REG','Dillon Kiefer',42,'6-3','DB',185,'RS','Regina, Sask','Miller Comprehensive HS'),(219,'2/24/2020 21:01','REG','Karl King',18,'5-11','DB',190,'4','St Louis, Mo','Dakota College at Bottineau'),(220,'2/24/2020 21:01','REG','Garth Knittig',90,'6-1','DL',285,'3','Delisle, Sask','Saskatoon Hilltops'),(221,'2/24/2020 21:01','REG','Jacob Laboccetta',55,'6-1','LB',215,'3','Moose Jaw, Sask','Central Collegiate'),(222,'2/24/2020 21:01','REG','Tyler Lalonde',81,'5-10','REC',185,'1','Regina, Sask','Michael A Riffel HS'),(223,'2/24/2020 21:01','REG','Dawson Laye',89,'6-1','REC',160,'RS','Cochrane, Alta','Cochrane HS'),(224,'2/24/2020 21:01','REG','Liam Lerat',0,'5-10','DB',180,'5','Ottawa, Ont','St Mark Catholic HS'),(225,'2/24/2020 21:01','REG','Robbie Lowes',32,'6-1','LB',205,'4','Regina, Sask','Westshore Rebels'),(226,'2/24/2020 21:01','REG','Cameron Mah',3,'6-1','LB',210,'1','Vancouver, BC','Notre Dame Regional Secondary'),(227,'2/24/2020 21:01','REG','Justin Maser',46,'6-2','LB',215,'RS','Medicine Hat, Alta','Medicine Hat HS'),(228,'2/24/2020 21:01','REG','Ethan Mather',26,'6-1','DB',190,'RS','Lloydminster, Sask','Lloydminster Comprehensive HS'),(229,'2/24/2020 21:01','REG','Semba Mbasela',27,'5-7','RB',175,'2','Regina, Sask','Dr Martin LeBoldus HS'),(230,'2/24/2020 21:01','REG','Brandon McKimmon',92,'6-3','DL',255,'3','Warman, Sask','University of Saskatchewan'),(231,'2/24/2020 21:01','REG','Sam Mike',7,'5-11','REC',185,'4','Saskatoon, Sask','Saskatoon Hilltops'),(232,'2/24/2020 21:01','REG','Matt Moore',91,'6-1','DL',260,'3','Regina, Sask','Dr Martin LeBoldus HS'),(233,'2/24/2020 21:01','REG','Zach Moore',29,'6-1','DB',190,'3','Regina, Sask','Dr Martin LeBoldus HS'),(234,'2/24/2020 21:01','REG','Kyle Moortgat',86,'6-1','REC',185,'5','Cochrane, Alta','Cochrane HS'),(235,'2/24/2020 21:01','REG','Kyler Mosley',85,'5-11','REC',195,'4','Richmond, BC','Okanagan Sun'),(236,'2/24/2020 21:01','REG','Mason Novik',84,'5-10','REC',170,'RS','Regina, Sask','Sheldon-Williams Collegiate'),(237,'2/24/2020 21:01','REG','Bryden O\'Flaherty',13,'6-3','QB',180,'1','Calgary, Alta','Bishop O\'Byrne HS'),(238,'2/24/2020 21:01','REG','Odun Ogidan',43,'5-10','RB',205,'5','Winnipeg, Man','Winnipeg Rifles'),(239,'2/24/2020 21:01','REG','Cody Peters',50,'5-11','LB',210,'4','Saskatoon, Sask','Saskatoon Hilltops'),(240,'2/24/2020 21:01','REG','Matt Rivers',8,'6-1','REC',175,'RS','Regina, Sask','Campbell Collegiate'),(241,'2/24/2020 21:01','REG','Peyton Ryder',54,'5-8','LB',210,'1','Newport News, Va','Christchurch School'),(242,'2/24/2020 21:01','REG','Noah Sampson',25,'5-11','DB',185,'2','Pilot Butte, Sask','Greenall HS'),(243,'2/24/2020 21:01','REG','Ryan Schienbein',14,'5-10','REC',180,'5','Regina, Sask','Balfour Collegiate'),(244,'2/24/2020 21:01','REG','Daniel Scraper',80,'5-11','REC',170,'5','Regina, Sask','Dr Martin LeBoldus HS'),(245,'2/24/2020 21:01','REG','Paxton Seib',51,'6-1','DL',275,'2','Regina, Sask','Campbell Collegiate'),(246,'2/24/2020 21:01','REG','Travis Semenok',39,'5-11','LB',215,'4','Medicine Hat, Alta','Edmonton Wildcats'),(247,'2/24/2020 21:01','REG','Holden Serack',73,'6-2','OL',315,'RS','Saskatoon, Sask','Evan Hardy Collegiate'),(248,'2/24/2020 21:01','REG','Tanner Smith',48,'6-1','LB',200,'3','Regina, Sask','Regina Thunder'),(249,'2/24/2020 21:01','REG','Carson Sombach',28,'5-10','DB',175,'RS','Regina, Sask','Miller Comprehensive HS'),(250,'2/24/2020 21:01','REG','Jackson Sombach',36,'5-9','DB',175,'1','Regina, Sask','Miller Comprehensive HS'),(251,'2/24/2020 21:01','REG','Emmett Steadman',0,'5-11','REC',165,'RS','Regina, Sask','Miller Comprehensive HS'),(252,'2/24/2020 21:01','REG','Colin Stumborg',34,'6-1','TE',245,'5','Saskatoon, Sask','Saskatoon Hilltops'),(253,'2/24/2020 21:01','REG','Bennett Stusek',10,'5-11','REC',170,'2','Regina, Sask','Campbell Collegiate'),(254,'2/24/2020 21:01','REG','Haider Syed',71,'6-1','OL',265,'RS','Fullerton, Calif','Santa Ana College'),(255,'2/24/2020 21:01','REG','Connor Taylor',74,'6-4','OL',290,'RS','Medicine Hat, Alta','Medicine Hat HS'),(256,'2/24/2020 21:01','REG','Oluwafemi Tiemi',94,'6-5','DL',340,'1','Warri, Nigeria',''),(257,'2/24/2020 21:01','REG','Apete Tuiloma',60,'6-3','OL',255,'RS','North Battleford, Sask','North Battleford Comprehensive HS'),(258,'2/24/2020 21:01','REG','Luke Turner',69,'6-1','DL',255,'RS','Wood Mountain, Sask','Assiniboia Composite HS'),(259,'2/24/2020 21:01','REG','Brayden Vandermeer',66,'6-2','OL',280,'2','Airdrie, Alta','Calgary Colts'),(260,'2/24/2020 21:01','REG','Sam Varao',45,'6-1','RB',210,'5','Victoria, BC','Belmont Secondary'),(261,'2/24/2020 21:01','REG','Ryder Varga',56,'6-3','LB',225,'2','Regina, Sask','Dr Martin LeBoldus HS'),(262,'2/24/2020 21:01','REG','CJ Vincent',87,'6-2','REC',180,'RS','Moose Jaw, Sask','Central Collegiate'),(263,'2/24/2020 21:01','REG','Brayden Wagg',30,'5-10','LB',185,'3','Regina, Sask','Campbell Collegiate'),(264,'2/24/2020 21:01','REG','Derek Walde',61,'6-1','OL',300,'3','Kindersley, Sask','Kamloops Broncos'),(265,'2/24/2020 21:01','REG','Brayden Walz',68,'6-3','DL',295,'1','Calgary, Alta','Bishop O\'Byrne HS'),(266,'2/24/2020 21:01','REG','Josh White',44,'6-2','LB',190,'2','Regina, Sask','Campbell Collegiate'),(267,'2/24/2020 21:01','REG','Eric Wicijowski',96,'6-2','DL',285,'5','Regina, Sask','Dr Martin LeBoldus HS'),(268,'2/24/2020 21:01','REG','Braedy Will',20,'6-4','LB',215,'5','Winnipeg, Man','Winnipeg Rifles'),(269,'2/24/2020 21:01','REG','Javier Williams',9,'5-10','RB',205,'RS','Calgary, Alta','Notre Dame HS'),(270,'2/24/2020 21:01','REG','Payton Williams',40,'6-1','DB',180,'RS','Regina, Sask','Winston Knoll Collegiate'),(271,'2/24/2020 21:01','REG','Ivan Xu',79,'6-2','OL',260,'RS','Victoria, BC','Mount Douglas Secondary'),(272,'2/24/2020 21:01','REG','Dillon Zimmermann',37,'6-1','DB',175,'1','Regina, Sask','Dr Martin LeBoldus HS');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviews` (
  `admin_username` varchar(20) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  UNIQUE KEY `reviews_pk_2` (`admin_username`),
  KEY `reviews_issue_id_fk_idx` (`issue_id`),
  CONSTRAINT `reviews_admin_username_fk` FOREIGN KEY (`admin_username`) REFERENCES `admin` (`username`) ON UPDATE CASCADE,
  CONSTRAINT `reviews_issue_id_fk` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('harsohailB',1,'In progress');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team` (
  `team_code` varchar(3) NOT NULL,
  `team_name` varchar(45) NOT NULL,
  `hometown` varchar(45) NOT NULL,
  `mascot` varchar(45) NOT NULL,
  `university` varchar(45) NOT NULL,
  PRIMARY KEY (`team_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('ALB','Golden Bears','Edmonton','GUBA','University of Alberta'),('CGY','Dinos','Calgary','Rex','University of Calgary'),('MAN','Bisons','Winnipeg','Billy the Bison','University of Manitoba'),('REG','Rams','Regina','Ram-page','University of Regina'),('SSK','Huskies','Sasaktoon','Howler','University of Saskatchewan'),('UBC','Thunderbirds','Vancouver','Thunderbird','University of British Columbia');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'restfulexample'
--
/*!50003 DROP FUNCTION IF EXISTS `getMostRecentCreationDateByPlayerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMostRecentCreationDateByPlayerId`(in_player_id int) RETURNS varchar(45) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
begin
    DECLARE out_creation_date varchar(45);
    SELECT creation_date
    INTO out_creation_date
    FROM player
    WHERE player_id = in_player_id
    ORDER BY player.creation_date DESC
    LIMIT 1;
    RETURN out_creation_date;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addAdmin`(IN username varchar(20), IN password varchar(20),
                                                IN permission_level int, OUT fail_msg varchar(100))
this_proc:
begin
    SET @v1 := (SELECT COUNT(1) FROM admin WHERE admin.username = username);
    IF @v1 THEN
        SET fail_msg := CONCAT('Username already exists: ', username);
        LEAVE this_proc;
    end if;
    INSERT INTO admin VALUES (username, password, permission_level);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addClient`(IN username varchar(20), IN password varchar(20),
                                                 OUT fail_msg varchar(100))
this_proc:
begin
    SET @v1 := (SELECT COUNT(1) FROM client WHERE client.username = username);
    IF @v1 THEN
        SET fail_msg := CONCAT('Username already exists: ', username);
        LEAVE this_proc;
    end if;
    INSERT INTO client values (username, password, current_timestamp());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addCoachingStaffByTeam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCoachingStaffByTeam`(IN team_code varchar(255), IN first_name varchar(45),
                                                              IN last_name varchar(45), IN position varchar(100),
                                                              OUT fail_msg varchar(100))
this_proc:
begin
    SET @v1 := (SELECT COUNT(1) FROM team WHERE team.team_code = team_code);
    IF NOT @v1 THEN
        SET fail_msg := CONCAT('Team not found: ', team_code);
        LEAVE this_proc;
    end if;
    INSERT INTO coaching_staff VALUES (DEFAULT, team_code, first_name, last_name, position);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGame`(IN home_team varchar(3), IN home_points int, IN away_team varchar(3),
                                               IN away_points int, IN stadium varchar(100), IN location varchar(100),
                                               IN attendance int, IN duration int, IN start_time varchar(45),
                                               OUT fail_msg varchar(100))
this_proc:
begin
    SET @team_codes_valid := (SELECT COUNT(1) FROM team WHERE team.team_code = home_team) AND
                             (SELECT COUNT(1) FROM team WHERE team.team_code = away_team);
    IF NOT @team_codes_valid THEN
        SET fail_msg := 'Invalid team_code provided';
        LEAVE this_proc;
    end if;
    INSERT INTO game VALUES(DEFAULT, home_team, home_points, away_team, away_points, stadium, location, attendance,
                            duration, start_time);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addIssue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addIssue`(IN client_username varchar(20), IN description varchar(200))
begin
   INSERT INTO issue VALUES (client_username, DEFAULT,  description, current_timestamp());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMajor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMajor`(IN player_id int(11), IN creation_date varchar(45), IN major varchar(45))
begin
    INSERT INTO majors_in
    VALUES (player_id, creation_date, major);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addPenalty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPenalty`(IN play_id int, IN penalty_player_id int, IN penalty_yardage int,
                                                  IN penalty_type varchar(45), OUT fail_msg varchar(100))
this_proc:
begin
    SET @player_id_valid := (SELECT COUNT(1) FROM player WHERE player.player_id = penalty_player_id);
    IF NOT @player_id_valid THEN
        SET fail_msg := CONCAT('Player ID not found: ', penalty_player_id);
        LEAVE this_proc;
    end if;
    SET @penalty_player_creation_date := getMostRecentCreationDateByPlayerId(penalty_player_id);
    INSERT INTO penalty values (DEFAULT, play_id,  penalty_player_id, @penalty_player_creation_date, penalty_yardage, penalty_type);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addPlayByGameId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPlayByGameId`(IN game_id int, IN quarter int, IN game_time varchar(45),
                                                       IN play_null varchar(1), IN field_position int,
                                                       IN description varchar(255), IN team_possession varchar(3),
                                                       IN yardage_gained int, IN down int, IN first_down_distance int,
                                                       IN run_pass_flag varchar(1), IN ball_position varchar(3),
                                                       IN out_of_bounds varchar(1), IN is_bc_or_rec_player_id int,
                                                       IN is_kicker_player_id int, IN kick_yardage int,
                                                       IN kick_result varchar(2), IN fum_player_id int,
                                                       IN rec_player_id int, IN fumble_yardage int,
                                                       IN forced varchar(1), IN quarterback_player_id int,
                                                       IN pass_result varchar(45), IN is_primary_def_player_id int,
                                                       IN is_secondary_def_player_id int,
                                                       IN hurries_quarterback_player_id int,
                                                       IN in_calls_timeout varchar(3), OUT fail_msg varchar(100),
                                                       OUT play_id int)
this_proc:
begin
    SET @game_id_valid := (SELECT COUNT(1) FROM game WHERE game.game_id = game_id);
    IF NOT @game_id_valid THEN
        SET fail_msg := CONCAT('Game ID does not exist: ', game_id);
        LEAVE this_proc;
    end if;

    SET @team_codes_valid := (SELECT COUNT(1) FROM team WHERE team.team_code = team_possession) AND
                             (SELECT COUNT(1) FROM team WHERE team.team_code = ball_position) AND
                             IF (in_calls_timeout IS NULL, 1, (SELECT COUNT(1) FROM team WHERE team.team_code = in_calls_timeout));
    IF NOT @team_codes_valid THEN
        SET fail_msg := 'Invalid team_code provided';
        LEAVE this_proc;
    end if;

    SET @players_valid := IF (is_bc_or_rec_player_id IS NULL, 1, (SELECT COUNT(1) FROM player WHERE player.player_id = is_bc_or_rec_player_id)) AND
                          IF (is_kicker_player_id IS NULL, 1, (SELECT COUNT(1) FROM player WHERE player.player_id = is_kicker_player_id)) AND
                          IF (fum_player_id IS NULL, 1, (SELECT COUNT(1) FROM player WHERE player.player_id = fum_player_id)) AND
                          IF (rec_player_id IS NULL, 1, (SELECT COUNT(1) FROM player WHERE player.player_id = rec_player_id)) AND
                          IF (quarterback_player_id IS NULL, 1, (SELECT COUNT(1) FROM player WHERE player.player_id = quarterback_player_id)) AND
                          IF (is_primary_def_player_id IS NULL, 1, (SELECT COUNT(1) FROM player WHERE player.player_id = is_primary_def_player_id)) AND
                          IF (is_secondary_def_player_id IS NULL, 1, (SELECT COUNT(1) FROM player WHERE player.player_id = is_secondary_def_player_id)) AND
                          IF (hurries_quarterback_player_id IS NULL, 1, (SELECT COUNT(1) FROM player WHERE player.player_id = hurries_quarterback_player_id));

    IF NOT @players_valid THEN
        SET fail_msg := 'Invalid player id provided';
        LEAVE this_proc;
    end if;

    INSERT INTO play
    VALUES (DEFAULT, game_id, quarter, game_time, play_null, field_position, description, team_possession,
            yardage_gained, down, first_down_distance, run_pass_flag, ball_position, out_of_bounds);
    SET play_id := (SELECT LAST_INSERT_ID());

    SET @is_bc_or_rec_creation_date := getMostRecentCreationDateByPlayerId(is_bc_or_rec_player_id);
    SET @is_kicker_creation_date := getMostRecentCreationDateByPlayerId(is_kicker_player_id);
    SET @fum_creation_date := getMostRecentCreationDateByPlayerId(fum_player_id);
    SET @rec_creation_date := getMostRecentCreationDateByPlayerId(rec_player_id);
    SET @quarterback_creation_date := getMostRecentCreationDateByPlayerId(quarterback_player_id);
    SET @is_primary_def_creation_date := getMostRecentCreationDateByPlayerId(is_primary_def_player_id);
    SET @is_secondary_def_creation_date := getMostRecentCreationDateByPlayerId(is_secondary_def_player_id);
    SET @hurries_quarterback_creation_date := getMostRecentCreationDateByPlayerId(hurries_quarterback_player_id);

    IF is_bc_or_rec_player_id is not NULL THEN
        INSERT INTO is_bc_or_rec
        VALUES (play_id, is_bc_or_rec_player_id, @is_bc_or_rec_creation_date);
    end if;

    IF is_kicker_player_id is not NULL THEN
        INSERT INTO is_kicker
        VALUES (play_id, is_kicker_player_id, @is_kicker_creation_date, kick_yardage, kick_result);
    end if;

    IF fumble_yardage is not NULL THEN
        INSERT INTO fumble
        VALUES (play_id, fum_player_id, @fum_creation_date, rec_player_id, @rec_creation_date, fumble_yardage, forced);
    end if;

    IF quarterback_player_id is not NULL THEN
        INSERT INTO pass
        VALUES (play_id, quarterback_player_id, @quarterback_creation_date, pass_result);
    end if;

    IF is_primary_def_player_id is not NULL THEN
        INSERT INTO is_primary_def
        VALUES (play_id, is_primary_def_player_id, @is_primary_def_creation_date);
    end if;

    IF is_secondary_def_player_id is not NULL THEN
        INSERT INTO is_secondary_def
        VALUES (play_id, is_secondary_def_player_id, @is_secondary_def_creation_date);
    end if;

    IF hurries_quarterback_player_id is not NULL THEN
        INSERT INTO hurries_qb
        VALUES (play_id, hurries_quarterback_player_id, @hurries_quarterback_creation_date);
    end if;

    IF in_calls_timeout is not NULL THEN
        INSERT INTO calls_timeout
        VALUES (play_id, in_calls_timeout);
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPlayer`(IN team_code varchar(3), IN player_name varchar(45),
                                                 IN jersey_number int, IN height varchar(5), IN position varchar(45),
                                                 IN weight int, IN year varchar(45), IN hometown varchar(45),
                                                 IN high_school_team varchar(60), OUT fail_msg varchar(100),
                                                 OUT player_id int, OUT creation_date varchar(45))
this_proc:
begin
    SET @v1 := (SELECT COUNT(1) FROM team WHERE team.team_code = team_code);
    IF NOT @v1 THEN
        SET fail_msg := CONCAT('Team not found: ', team_code);
        LEAVE this_proc;
    end if;
    INSERT INTO player
    VALUES (DEFAULT, current_timestamp(), team_code, player_name, jersey_number, height, position, weight, year,
            hometown, high_school_team);
    SET player_id := (SELECT LAST_INSERT_ID());
    SET creation_date := (SELECT player.creation_date FROM player WHERE player.player_id = (SELECT LAST_INSERT_ID()));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addTeam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addTeam`(IN team_code varchar(3), IN team_name varchar(45),
                                               IN hometown varchar(45), IN mascot varchar(45),
                                               IN university varchar(45), OUT fail_msg varchar(100))
this_proc:
begin
    SET @v1 := (SELECT COUNT(1) FROM team WHERE team.team_code = team_code);
    IF @v1 THEN
        SET fail_msg := CONCAT('Team already exists: ', team_code);
        LEAVE this_proc;
    end if;
    INSERT INTO team VALUES (team_code, team_name, hometown, mascot, university);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdminByUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAdminByUsername`(
	IN username VARCHAR(20)
)
BEGIN
SELECT * FROM admin WHERE admin.username = username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdmins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAdmins`()
BEGIN
    SELECT * FROM admin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientByUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientByUsername`(IN username varchar(20))
BEGIN
    SELECT * FROM client WHERE client.username = username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClients`()
BEGIN
    SELECT * FROM client;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClientsFollowedByPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientsFollowedByPlayer`(IN player_id int)
begin
   SELECT *
   FROM follows
   JOIN client c on follows.username = c.username
   WHERE follows.player_id = player_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCoachingStaffById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCoachingStaffById`(IN coaching_staff_id int)
begin
    SELECT *
    FROM coaching_staff
    WHERE coaching_staff.coaching_staff_id = coaching_staff_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCoachingStaffByTeam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCoachingStaffByTeam`(IN team_code varchar(255))
begin
    Select * FROM coaching_staff WHERE coaching_staff.team_code = team_code;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGameById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGameById`(IN game_id int)
begin
    SELECT *
    FROM game
    WHERE game.game_id = game_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGameStatsById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGameStatsById`(IN game_id int, OUT number_of_complete_passes int,
                                                        OUT number_of_failed_passes int,
                                                        OUT average_first_down_distance double,
                                                        OUT number_of_fumbles int, OUT number_of_penalties int,
                                                        OUT number_of_kicks int, OUT average_kick_yardage double,
                                                        OUT longest_kicker_name varchar(45))
this_proc:
begin
DROP TABLE IF EXISTS joined_plays;
CREATE TEMPORARY TABLE joined_plays AS (
    SELECT play.play_id, pass_result, first_down_distance, fumble_yardage, penalty_id, kick_yardage, ik.player_id
    FROM (SELECT *
          FROM play
          WHERE play.game_id = game_id) as play
    LEFT OUTER JOIN is_kicker ik on play.play_id = ik.play_id
    LEFT OUTER JOIN fumble f on play.play_id = f.play_id
    LEFT OUTER JOIN pass on play.play_id = pass.play_id
    LEFT OUTER JOIN penalty pen on play.play_id = pen.play_id
);
    SET number_of_complete_passes := (SELECT COUNT(*) FROM joined_plays WHERE joined_plays.pass_result = 'C');
    SET number_of_failed_passes := (SELECT COUNT(*) FROM joined_plays
                                        WHERE joined_plays.pass_result != 'C' AND joined_plays.pass_result IS NOT NULL);
    SET average_first_down_distance := (SELECT AVG(joined_plays.first_down_distance) FROM joined_plays);
    SET number_of_fumbles := (SELECT COUNT(*) FROM joined_plays WHERE joined_plays.fumble_yardage IS NOT NULL);
    SET number_of_penalties := (SELECT COUNT(*) FROM joined_plays WHERE joined_plays.penalty_id IS NOT NULL);
    SET number_of_kicks := (SELECT COUNT(*) FROM joined_plays WHERE joined_plays.kick_yardage IS NOT NULL);
    SET average_kick_yardage := (SELECT AVG(joined_plays.kick_yardage) FROM joined_plays);
    SET longest_kicker_name := (SELECT player_name
                                    FROM(
                                    SELECT MAX(joined_plays.kick_yardage), joined_plays.player_id as pi
                                    FROM joined_plays) AS max_kicker
                                    JOIN player ON player.player_id = pi);

    SELECT home_team, home_points, away_team, away_points
    FROM game
    WHERE game.game_id = game_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIssueByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIssueByID`(IN issue_id Integer)
begin
    SELECT * FROM issue WHERE issue.issue_id = issue_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIssues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIssues`()
begin
    SELECT * FROM issue ORDER BY submission_date DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIssuesByClientUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIssuesByClientUsername`(IN client_username varchar(20))
begin
    SELECT * FROM issue WHERE issue.client_username = client_username ORDER BY submission_date DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPenaltiesByGameId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPenaltiesByGameId`(IN in_game_id int)
begin
    SELECT penalty_id, penalty.play_id, player_id, creation_date, penalty_yardage, penalty_type
    FROM penalty
    JOIN play p on penalty.play_id = p.play_id
    JOIN game g on p.game_id = g.game_id
    WHERE g.game_id = in_game_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlayById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayById`(IN in_play_id int)
begin
    SELECT *
    FROM play
             LEFT OUTER JOIN is_bc_or_rec ibor on play.play_id = ibor.play_id
             LEFT OUTER JOIN is_kicker ik on play.play_id = ik.play_id
             LEFT OUTER JOIN is_primary_def ipd on play.play_id = ipd.play_id
             LEFT OUTER JOIN is_secondary_def isd on play.play_id = isd.play_id
             LEFT OUTER JOIN hurries_qb hq on play.play_id = hq.play_id
             LEFT OUTER JOIN calls_timeout ct on ibor.play_id = ct.play_id
             LEFT OUTER JOIN fumble f on play.play_id = f.play_id
             LEFT OUTER JOIN pass on play.play_id = pass.play_id
             LEFT OUTER JOIN penalty pen on play.play_id = pen.play_id
    WHERE play.play_id = in_play_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlayerById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayerById`(IN in_player_id int)
begin
    SELECT *
    FROM player
             JOIN majors_in ON player.player_id = majors_in.player_id and player.creation_date = majors_in.creation_date
    WHERE player.creation_date = (SELECT MAX(creation_date)
                                  FROM player
                                  WHERE player.player_id = in_player_id)
      AND player.player_id = in_player_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlayerHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayerHistory`(IN in_player_id int)
begin
    SELECT *
    FROM player
             LEFT JOIN majors_in
                       ON player.player_id = majors_in.player_id and player.creation_date = majors_in.creation_date
    WHERE player.player_id = in_player_id
    ORDER BY player.creation_date DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayers`()
BEGIN
    SELECT *
    FROM player
    LEFT JOIN majors_in ON player.player_id = majors_in.player_id and player.creation_date = majors_in.creation_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlayersFollowedByClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayersFollowedByClient`(IN in_username varchar(20))
begin
    SELECT *
    FROM player
    LEFT JOIN majors_in ON player.player_id = majors_in.player_id and player.creation_date = majors_in.creation_date
    WHERE player.player_id IN (SELECT follows.player_id FROM follows WHERE follows.username = in_username);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlaysByGameId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlaysByGameId`(IN game_id int)
begin
    SELECT *
    FROM play
    LEFT OUTER JOIN is_bc_or_rec ibor on play.play_id = ibor.play_id
    LEFT OUTER JOIN is_kicker ik on play.play_id = ik.play_id
    LEFT OUTER JOIN is_primary_def ipd on play.play_id = ipd.play_id
    LEFT OUTER JOIN is_secondary_def isd on play.play_id = isd.play_id
    LEFT OUTER JOIN hurries_qb hq on play.play_id = hq.play_id
    LEFT OUTER JOIN calls_timeout ct on ibor.play_id = ct.play_id
    LEFT OUTER JOIN fumble f on play.play_id = f.play_id
    LEFT OUTER JOIN pass on play.play_id = pass.play_id
    LEFT OUTER JOIN penalty pen on play.play_id = pen.play_id
    WHERE play.game_id=game_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTeamByTeamCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTeamByTeamCode`(IN team_code varchar(3))
BEGIN
    SELECT *
    FROM team
    Where team.team_code = team_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTeams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTeams`()
BEGIN
    SELECT * FROM team;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateAdminPermissionLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAdminPermissionLevel`(IN in_username varchar(20), IN new_permission_level int)
BEGIN
    UPDATE admin
    SET admin.permission_level = new_permission_level
    WHERE admin.username = in_username;
    SELECT ROW_COUNT();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePlayerById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePlayerById`(IN team_code varchar(3), IN player_name varchar(45),
                                                        IN jersey_number int, IN height varchar(5),
                                                        IN position varchar(45), IN weight int, IN year varchar(45),
                                                        IN hometown varchar(45), IN high_school_team varchar(60),
                                                        IN player_id int, OUT fail_msg varchar(100),
                                                        OUT out_creation_date varchar(45))
this_proc:
begin
    SET @v1 := (SELECT COUNT(1) FROM player WHERE player.player_id = player_id);
    IF NOT @v1 THEN
        SET fail_msg := CONCAT('Invalid player id provided: ', player_id);
        LEAVE this_proc;
    end if;
    SET @v2 := (SELECT COUNT(1) FROM team WHERE team.team_code = team_code);
    IF NOT @v2 THEN
        SET fail_msg := CONCAT('Invalid team code provided: ', team_code);
        LEAVE this_proc;
    end if;
    INSERT INTO player
    VALUES (player_id, current_timestamp(), team_code, player_name, jersey_number, height, position, weight, year,
            hometown, high_school_team);
    SET out_creation_date := (SELECT player.creation_date
                              FROM player
                              WHERE player.player_id = player_id
                              ORDER BY player.creation_date DESC
                              LIMIT 1);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-25 14:17:54
