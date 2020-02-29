CREATE DATABASE  IF NOT EXISTS `restfulexample` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `restfulexample`;
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
INSERT INTO `admin` VALUES ('harsohailB','admin',4),('rh3','ryanPassword',3),('string2','2324',0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
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
INSERT INTO `follows` VALUES (1,'hello2'),(2,'hello2');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
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
  `home_number_of_plays` int(11) DEFAULT NULL,
  `home_points` int(11) DEFAULT NULL,
  `away_team` varchar(3) NOT NULL,
  `away_number_of_plays` int(11) DEFAULT NULL,
  `away_points` int(11) DEFAULT NULL,
  `stadium` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `attendance` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `game_team_team_code_fk` (`home_team`),
  KEY `game_team_team_code_fk_2` (`away_team`),
  CONSTRAINT `game_team_team_code_fk` FOREIGN KEY (`home_team`) REFERENCES `team` (`team_code`),
  CONSTRAINT `game_team_team_code_fk_2` FOREIGN KEY (`away_team`) REFERENCES `team` (`team_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'CGY',11,41,'ALB',10,31,'Foote Field','Calgary',2300,3,'2020-02-29 19:00:00');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `issue` (
  `client_username` varchar(20) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`issue_id`,`client_username`),
  KEY `issue_client_username_fk` (`client_username`),
  CONSTRAINT `issue_client_username_fk` FOREIGN KEY (`client_username`) REFERENCES `client` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES ('hello2',1,'Please fix this bug','2020-02-29 00:31:31');
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
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
  `Time` time NOT NULL,
  `valid` varchar(1) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play`
--

LOCK TABLES `play` WRITE;
/*!40000 ALTER TABLE `play` DISABLE KEYS */;
INSERT INTO `play` VALUES (1,1,1,'15:00:00','N',-45,'Niko DiFonte kickoff 60 yards to the ALB5, Wesley Bookland return 31 yards to the ALB36, out-of-bounds (M. Lucyshyn).','CGY',31,0,0,NULL,'CGY','Y'),(2,1,1,'14:51:00','N',-36,'Jonathan Rosery rush for 3 yards to the ALB39 (Tyrese Best).','ALB',3,1,10,'R','ALB',NULL),(3,1,1,'14:51:00','N',-39,'Brad Launhardt pass complete to Tyler Turner for 5 yards to the ALB44 (M. Lucyshyn).','ALB',5,2,7,'P','ALB',NULL),(4,1,1,'14:51:00','Y',-44,'PENALTY ALB TC 5 yards to the ALB39.','ALB',NULL,3,2,'N','ALB',NULL),(5,1,1,'14:51:00','N',-39,'Reece Oldenburg punt 37 yards to the CGY34, Dallas Boath return 4 yards to the CGY38 (Shaydon Philip).','ALB',4,3,7,NULL,'ALB',NULL),(6,1,1,'14:51:00','N',-38,'Jeshrun Antwi rush for 12 yards to the CGY50, 1ST DOWN CGY (Wesley Bookland).','CGY',12,1,10,'R','CGY',NULL),(7,1,1,'13:23:00','N',-50,'Adam Sinagra rush for 3 yards to the CGY53 (Shaydon Philip).','CGY',3,1,10,'P','CGY',NULL),(8,1,1,'13:23:00','N',-53,'Adam Sinagra pass incomplete to Dallas Boath, PENALTY CGY holding declined.','CGY',0,2,7,'P','CGY',NULL),(9,1,1,'13:23:00','Y',-53,'PENALTY CGY offside 5 yards to the CGY48.','CGY',0,3,7,NULL,'CGY',NULL),(10,1,1,'13:23:00','N',-48,'Niko DiFonte punt 38 yards to the ALB24, Wesley Bookland return 0 yards to the ALB24, PENALTY ALB holding 10 yards to the ALB14, 1st and 10, ALB ball on ALB14.','CGY',0,3,12,NULL,'CGY',NULL),(11,1,1,'11:15:00','N',-14,'D. Kalesnikoff rush for loss of 5 yards to the ALB9 (M. Lucyshyn).','ALB',-5,1,10,'R','ALB',NULL),(12,1,1,'11:15:00','N',-9,'Brad Launhardt pass complete to Jonathan Rosery for loss of 1 yard to the ALB8 (Joe Cant), PENALTY ALB holding declined.','ALB',-1,2,15,'P','ALB',NULL),(13,1,1,'09:57:00','N',-8,'TEAM loss of 8 yards to ALB0, safety.','ALB',NULL,3,16,NULL,'ALB',NULL),(14,1,1,'09:57:00','N',-35,'Brent Arthur kickoff 64 yards to the CGY11, Jalen Philpot return 17 yards to the CGY28 (Lucky Daniels).','ALB',17,0,0,NULL,'ALB',NULL),(15,1,1,'09:52:00','N',-28,'Jeshrun Antwi rush for no gain to the CGY28 (Jassen Brown).','CGY',0,1,10,'R','CGY',NULL),(16,1,1,'09:52:00','N',-28,'Jeshrun Antwi rush for loss of 4 yards to the CGY24 (Luke Sperry).','CGY',-4,2,10,'R','CGY',NULL),(17,1,1,'09:52:00','N',-24,'Niko DiFonte punt 41 yards to the ALB45, PENALTY CGY no yards 15 yards to the CGY50, 1st and 10, ALB ball on CGY50.','CGY',0,3,14,NULL,'CGY',NULL),(18,1,1,'08:27:00','N',50,'Jonathan Rosery rush for 3 yards to the CGY47 (Tyrese Best;Hayden Nellis).','ALB',3,1,10,'R','CGY',NULL),(19,1,1,'08:27:00','N',47,'Brad Launhardt pass complete to D. Kalesnikoff for 25 yards to the CGY22, 1ST DOWN ALB, out-of-bounds (Joe Cant).','ALB',25,2,7,'P','CGY','Y'),(20,1,1,'08:27:00','Y',22,'Brad Launhardt pass incomplete to Ben Kopczynski, PENALTY CGY offside defense 5 yards to the CGY17, NO PLAY.','ALB',0,1,10,'P','CGY',NULL),(21,1,1,'08:27:00','N',17,'Brad Launhardt pass complete to Jonathan Rosery for 2 yards to the CGY15 (Charlie Moore).','ALB',2,1,5,'P','CGY',NULL),(22,1,1,'08:27:00','N',15,'D. Kalesnikoff rush for loss of 1 yard to the CGY16 (Carter Johnson).','ALB',-1,2,3,'R','CGY',NULL),(23,1,1,'06:07:00','N',16,'Brent Arthur field goal attempt from 23 GOOD, .','ALB',NULL,3,4,NULL,'CGY',NULL),(24,1,1,'06:07:00','N',-35,'Adam Sinagra pass incomplete to Jalen Philpot.','CGY',0,1,10,'P','CGY',NULL),(25,1,1,'06:07:00','N',-35,'Adam Sinagra pass complete to Jalen Philpot for 25 yards to the ALB50, 1ST DOWN CGY (Jassen Brown).','CGY',25,2,10,'P','CGY',NULL),(26,1,1,'06:07:00','Y',50,'Jeshrun Antwi rush for 4 yards to the ALB46 (Luke Sperry), PENALTY ALB offside defense 5 yards to the ALB45, NO PLAY, PENALTY CGY unnecessary roughness 15 yards to the CGY50, NO PLAY.','CGY',4,1,10,'R','ALB',NULL),(27,1,1,'06:07:00','N',-50,'Adam Sinagra pass complete to Jeshrun Antwi for 36 yards to the ALB24, 1ST DOWN CGY (Aaron Chabaylo).','CGY',36,1,20,'P','CGY',NULL),(28,1,1,'06:07:00','N',24,'Jeshrun Antwi rush for 2 yards to the ALB22 (Josiah Schakel).','CGY',2,1,10,'R','ALB',NULL),(29,1,1,'06:07:00','Y',22,'R. Rodrigues rush for no gain to the ALB22 (Jassen Brown), PENALTY ALB offside defense 5 yards to the ALB17, NO PLAY.','CGY',0,2,8,'R','ALB',NULL),(30,1,1,'06:07:00','N',17,'R. Rodrigues rush for 4 yards to the ALB13, 1ST DOWN CGY (Jassen Brown).','CGY',4,2,3,'R','ALB',NULL),(31,1,1,'06:07:00','N',13,'Jeshrun Antwi rush for 12 yards to the ALB1, 1ST DOWN CGY (T. Blackburn).','CGY',12,1,10,'R','ALB',NULL),(32,1,1,'02:01:00','N',1,'Josiah Joseph rush for 1 yard to the ALB0, 1ST DOWN CGY, TOUCHDOWN, , PENALTY ALB offside defense declined.','CGY',1,1,1,'R','ALB',NULL),(33,1,1,'02:01:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'ALB',NULL),(34,1,1,'02:01:00','N',-45,'Niko DiFonte kickoff 55 yards to the ALB10, Wesley Bookland return 21 yards to the ALB31 (Subomi Oyesorro).','CGY',21,0,0,NULL,'CGY',NULL),(35,1,1,'01:55:00','Y',-31,'Jonathan Rosery rush for 8 yards to the ALB39 (Deane Leonard), PENALTY ALB holding 10 yards to the ALB21, NO PLAY.','ALB',8,1,10,'R','ALB',NULL),(36,1,1,'01:55:00','N',-21,'Brad Launhardt pass intercepted by Charlie Moore at the ALB38, Charlie Moore return 16 yards to the ALB22, out-of-bounds.','ALB',0,1,20,'P','ALB','Y'),(37,1,1,'01:19:00','N',22,'Jeshrun Antwi rush for 0 yards to the ALB22 (Jayden Dalke).','CGY',0,1,10,'R','ALB',NULL),(38,1,1,'01:19:00','N',22,'Adam Sinagra pass complete to Jalen Philpot for 19 yards to the ALB3, 1ST DOWN CGY, out-of-bounds (Troy Hansen).','CGY',19,2,10,'P','ALB','Y'),(39,1,1,'01:19:00','N',3,'Jeshrun Antwi rush for loss of 1 yard to the ALB4 (Aaron Chabaylo).','CGY',-1,1,3,'R','ALB',NULL),(40,1,1,'01:19:00','N',4,'J-Min Pelley rush for 2 yards to the ALB2 (Cole Nelson;D. Burgmaier).','CGY',2,2,4,'R','ALB',NULL),(41,1,2,'14:42:00','N',2,'Josiah Joseph pass complete to Zach Newman for 2 yards to the ALB0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',2,3,2,'P','ALB',NULL),(42,1,2,'14:42:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'ALB',NULL),(43,1,2,'14:42:00','N',-45,'Niko DiFonte kickoff 59 yards to the ALB6, Wesley Bookland return 19 yards to the ALB25 (Aidan Miele).','CGY',19,0,0,NULL,'CGY',NULL),(44,1,2,'14:37:00','Y',-25,'Brad Launhardt pass incomplete to Ben Kopczynski, PENALTY CGY offside defense 5 yards to the ALB30, NO PLAY.','ALB',0,1,10,'P','ALB',NULL),(45,1,2,'14:37:00','N',-30,'Brad Launhardt rush for 9 yards to the ALB39, 1ST DOWN ALB (T. Abrahams-Web).','ALB',9,1,5,'R','ALB',NULL),(46,1,2,'14:37:00','N',-39,'Brad Launhardt pass complete to Tanner Buchanan for 4 yards to the ALB43 (Peter Nicastro), PENALTY CGY unnecessary roughness 10 yards to the ALB53, 1ST DOWN ALB, PENALTY CGY unnecessary roughness 15 yards to the CGY42, 1ST DOWN ALB.','ALB',4,1,10,'P','ALB',NULL),(47,1,2,'14:37:00','N',42,'Jonathan Rosery rush for 6 yards to the CGY36 (Patrick Pankow).','ALB',6,1,10,'R','CGY',NULL),(48,1,2,'14:37:00','Y',36,'Jonathan Rosery rush for no gain to the CGY36 (Cole Kussmann), PENALTY ALB holding 10 yards to the CGY46, NO PLAY.','ALB',0,2,4,'R','CGY',NULL),(49,1,2,'14:37:00','N',46,'Brad Launhardt pass complete to D. Bubelenyi for 23 yards to the CGY23, 1ST DOWN ALB, out-of-bounds (Daniel Teitz).','ALB',23,2,14,'P','CGY','Y'),(50,1,2,'14:37:00','N',23,'Brad Launhardt pass incomplete to Ben Kopczynski.','ALB',0,1,10,'P','CGY',NULL),(51,1,2,'12:17:00','N',23,'Brad Launhardt pass complete to D. Bubelenyi for 23 yards to the CGY0, 1ST DOWN ALB, TOUCHDOWN, , PENALTY CGY offside defense declined.','ALB',23,2,10,'P','CGY',NULL),(52,1,2,'12:17:00','N',5,'Brent Arthur kick attempt good.','ALB',NULL,0,0,NULL,'CGY',NULL),(53,1,2,'12:17:00','N',-45,'Brent Arthur kickoff 51 yards to the CGY14, Jalen Philpot return 38 yards to the CGY52 (Jake Taylor), PENALTY ALB unnecessary roughness 15 yards to the ALB43, 1st and 10, CGY ball on ALB43.','ALB',38,0,0,NULL,'ALB',NULL),(54,1,2,'12:08:00','N',43,'Jeshrun Antwi rush for 20 yards to the ALB23, 1ST DOWN CGY (T. Blackburn).','CGY',20,1,10,'R','ALB',NULL),(55,1,2,'12:08:00','N',23,'Jeshrun Antwi rush for 6 yards to the ALB17 (Shaydon Philip).','CGY',6,1,10,'R','ALB',NULL),(56,1,2,'12:08:00','N',17,'Adam Sinagra pass complete to Alex Basilis for 14 yards to the ALB3, 1ST DOWN CGY (Jayden Dalke).','CGY',14,2,4,'P','ALB',NULL),(57,1,2,'10:06:00','Y',3,'TIMEOUT CGY, NO PLAY.','CGY',NULL,1,3,'N','ALB',NULL),(58,1,2,'10:06:00','N',3,'Adam Sinagra pass complete to Jalen Philpot for 3 yards to the ALB0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',3,1,3,'P','ALB',NULL),(59,1,2,'10:06:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'ALB',NULL),(60,1,2,'10:06:00','N',-45,'Niko DiFonte kickoff 62 yards to the ALB3, Wesley Bookland return 40 yards to the ALB43, out-of-bounds (Niko DiFonte), PENALTY CGY unnecessary roughness 15 yards to the CGY52, 1st and 10, ALB ball on CGY52.','CGY',40,0,0,NULL,'CGY','Y'),(61,1,2,'09:57:00','N',52,'Brad Launhardt pass intercepted by M. Lucyshyn at the CGY48, M. Lucyshyn return 7 yards to the 55 yardline (Brad Launhardt), PENALTY CGY unnecessary roughness 15 yards to the CGY40, 1st and 10, CGY ball on CGY40.','ALB',0,1,10,'P','CGY',NULL),(62,1,2,'09:32:00','N',-40,'Jeshrun Antwi rush for 2 yards to the CGY42 (D. Burgmaier).','CGY',2,1,10,'R','CGY',NULL),(63,1,2,'09:32:00','N',-42,'Adam Sinagra pass complete to H. Karl for 29 yards to the ALB39, 1ST DOWN CGY (Jayden Dalke), PENALTY ALB IC declined, PENALTY ALB IC declined.','CGY',29,2,8,'P','CGY',NULL),(64,1,2,'09:32:00','N',39,'R. Rodrigues rush for 6 yards to the ALB33 (Luke Sperry).','CGY',6,1,10,'R','ALB',NULL),(65,1,2,'09:32:00','N',33,'Adam Sinagra pass complete to Hunter Karl for 15 yards to the ALB18, 1ST DOWN CGY (Jayden Dalke), PENALTY ALB unnecessary roughness 15 yards to the ALB3, 1ST DOWN CGY.','CGY',15,2,4,'P','ALB',NULL),(66,1,2,'09:32:00','Y',3,'Cole Kussmann rush for 1 yard to the ALB2 (Aaron Chabaylo), PENALTY CGY clipping 10 yards to the ALB13, NO PLAY.','CGY',1,1,3,'R','ALB',NULL),(67,1,2,'09:32:00','N',13,'Adam Sinagra pass incomplete to Dallas Boath (Shaydon Philip).','CGY',0,1,13,'P','ALB',NULL),(68,1,2,'09:32:00','Y',13,'Adam Sinagra pass incomplete to Alex Basilis, PENALTY ALB unnecessary roughness 12 yards to the ALB1, NO PLAY.','CGY',0,2,13,'P','ALB',NULL),(69,1,2,'09:32:00','Y',1,'R. Rodrigues rush for no gain to the ALB1 (Jassen Brown), PENALTY ALB offside defense 0 yards to the ALB1, 1ST DOWN CGY, NO PLAY.','CGY',0,2,1,'R','ALB',NULL),(70,1,2,'05:56:00','N',1,'Adam Sinagra rush for 1 yard to the ALB0, 1ST DOWN CGY, TOUCHDOWN, .','CGY',1,1,1,'R','ALB',NULL),(71,1,2,'05:56:00','N',5,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'ALB',NULL),(72,1,2,'05:56:00','N',-45,'Niko DiFonte kickoff 61 yards to the ALB4, D. Bubelenyi return 23 yards to the ALB27 (Nick Statz).','CGY',23,0,0,NULL,'CGY',NULL),(73,1,2,'05:47:00','N',-27,'Jonathan Rosery rush for loss of 3 yards to the ALB24 (Peter Nicastro).','ALB',-3,1,10,'R','ALB',NULL),(74,1,2,'05:47:00','N',-24,'Brad Launhardt pass complete to Ben Kopczynski for 27 yards to the ALB51, 1ST DOWN ALB (Trey Dube).','ALB',27,2,13,'P','ALB',NULL),(75,1,2,'05:47:00','N',-51,'Brad Launhardt pass incomplete to D. Bubelenyi.','ALB',0,1,10,'P','ALB',NULL),(76,1,2,'05:47:00','N',-51,'Brad Launhardt pass complete to Jonathan Rosery for 13 yards to the CGY46, 1ST DOWN ALB (Jacob Biggs).','ALB',13,2,10,'P','ALB',NULL),(77,1,2,'05:47:00','N',46,'Brad Launhardt pass complete to Jonathan Rosery for 13 yards to the CGY33, 1ST DOWN ALB, out-of-bounds (Patrick Pankow).','ALB',13,1,10,'P','CGY','Y'),(78,1,2,'05:47:00','N',33,'Brad Launhardt rush for 6 yards to the CGY27 (M. Lucyshyn).','ALB',6,1,10,'R','CGY',NULL),(79,1,2,'05:47:00','N',27,'Jonathan Rosery rush for 6 yards to the CGY21, 1ST DOWN ALB (Adam Sinagra).','ALB',6,2,4,'R','CGY',NULL),(80,1,2,'05:47:00','N',21,'Brad Launhardt pass incomplete to D. Kalesnikoff.','ALB',0,1,10,'P','CGY',NULL),(81,1,2,'05:47:00','N',21,'Brad Launhardt pass complete to Tanner Buchanan for 4 yards to the CGY17 (T. Abrahams-Web).','ALB',4,2,10,'P','CGY',NULL),(82,1,2,'02:09:00','N',17,'Brent Arthur field goal attempt from 24 MISSED, kick to CGY-11, , Deane Leonard return 13 yards to the CGY2 (Parker Dawson), PENALTY ALB illegal block declined, CGY ball on CGY20.','ALB',13,3,6,NULL,'CGY',NULL),(83,1,2,'02:09:00','Y',-20,'R. Rodrigues rush for 5 yards to the ALB25 (Jayden Dalke), PENALTY CGY holding 10 yards to the CGY10, NO PLAY.','CGY',5,1,10,'R','CGY',NULL),(84,1,2,'02:09:00','N',-10,'Adam Sinagra pass complete to Jalen Philpot for 15 yards to the CGY25 (Shaydon Philip).','CGY',15,1,20,'P','CGY',NULL),(85,1,2,'02:09:00','N',-25,'Adam Sinagra pass complete to Alex Basilis for 17 yards to the CGY42, 1ST DOWN CGY (D. Burgmaier).','CGY',17,2,5,'P','CGY',NULL),(86,1,2,'02:09:00','N',-42,'Adam Sinagra pass incomplete to Dallas Boath.','CGY',0,1,10,'P','CGY',NULL),(87,1,2,'02:09:00','N',-42,'Adam Sinagra pass incomplete to Payton Burbank (David Kolkman).','CGY',0,2,10,'P','CGY',NULL),(88,1,2,'02:09:00','N',-42,'Niko DiFonte punt 26 yards to the ALB42, out-of-bounds.','CGY',NULL,3,10,NULL,'CGY','Y'),(89,1,2,'01:16:00','N',-42,'Brad Launhardt pass complete to Ben Kopczynski for 6 yards to the ALB48 (Deane Leonard).','ALB',6,1,10,'P','ALB',NULL),(90,1,2,'01:16:00','N',-48,'Brad Launhardt pass complete to Jonathan Rosery for 7 yards to the 55 yardline, 1ST DOWN ALB, out-of-bounds (Peter Nicastro).','ALB',7,2,4,'P','ALB','Y'),(91,1,2,'01:16:00','N',-55,'Jonathan Rosery rush for 3 yards to the CGY52 (M. Lucyshyn).','ALB',3,1,10,'R','ALB',NULL),(92,1,2,'01:16:00','N',52,'Brad Launhardt pass complete to Tanner Buchanan for 29 yards to the CGY23, 1ST DOWN ALB (Joe Cant).','ALB',29,2,7,'P','CGY',NULL),(93,1,2,'01:16:00','N',23,'Brad Launhardt pass incomplete to Jon Girma.','ALB',0,1,10,'P','CGY',NULL),(94,1,2,'01:16:00','N',23,'Brad Launhardt pass incomplete to Tyler Turner.','ALB',0,2,10,'P','CGY',NULL),(95,1,2,'00:13:00','N',23,'J. Giustini field goal attempt from 30 GOOD, .','ALB',NULL,3,10,NULL,'CGY',NULL),(96,1,2,'00:13:00','N',-35,'TEAM rush for loss of 1 yard to the CGY34.','CGY',-1,1,10,'R','CGY',NULL),(97,1,2,'00:13:00','N',-34,'TEAM rush for loss of 2 yards to the CGY31.','CGY',-2,2,11,'R','CGY',NULL),(98,1,3,'15:00:00','N',-31,'Brent Arthur kickoff 60 yards to the CGY5, Jalen Philpot return 16 yards to the CGY21, fumble forced by Josiah Schakel, fumble by Jalen Philpot recovered by ALB Jordy Kibamba at CGY30, PENALTY holding CGY, declined.','CGY',16,0,0,NULL,'CGY',NULL),(99,1,3,'14:56:00','N',30,'Brad Launhardt rush for loss of 6 yards to the CGY36, fumble by Brad Launhardt recovered by CGY Subomi Oyesorro at CGY40.','ALB',-6,1,10,'R','CGY',NULL),(100,1,3,'14:37:00','N',-40,'Adam Sinagra pass complete to Alex Basilis for 7 yards to the CGY47 (Shaydon Philip).','CGY',7,1,10,'P','CGY',NULL),(101,1,3,'14:37:00','N',-47,'Adam Sinagra pass incomplete.','CGY',0,2,3,'P','CGY',NULL),(102,1,3,'14:37:00','N',-47,'Niko DiFonte punt 47 yards to the ALB16, Wesley Bookland return 2 yards to the ALB18.','CGY',2,3,3,NULL,'CGY',NULL),(103,1,3,'13:24:00','N',-18,'Brad Launhardt pass incomplete to Jonathan Rosery.','ALB',0,1,10,'P','ALB',NULL),(104,1,3,'13:24:00','N',-18,'Brad Launhardt pass complete to Ben Kopczynski for 7 yards to the ALB25 (Deane Leonard), PENALTY ALB offside declined.','ALB',7,2,10,'P','ALB',NULL),(105,1,3,'13:24:00','N',-25,'Reece Oldenburg punt 41 yards to the CGY44, Dallas Boath return 13 yards to the ALB53 (Jayden Dalke).','ALB',13,3,3,NULL,'ALB',NULL),(106,1,3,'12:30:00','N',53,'Adam Sinagra pass complete to Dallas Boath for 7 yards to the ALB46 (Shaydon Philip).','CGY',7,1,10,'P','ALB',NULL),(107,1,3,'12:30:00','N',46,'Jeshrun Antwi rush for 7 yards to the ALB39, 1ST DOWN CGY (Josiah Schakel).','CGY',7,2,3,'R','ALB',NULL),(108,1,3,'12:30:00','N',39,'Adam Sinagra pass complete to Alex Basilis for 37 yards to the ALB2, 1ST DOWN CGY (T. Blackburn).','CGY',37,1,10,'P','ALB',NULL),(109,1,3,'12:30:00','N',2,'Adam Sinagra rush for 1 yard to the ALB1 (Parker Dawson).','CGY',1,1,2,'R','ALB',NULL),(110,1,3,'12:30:00','Y',1,'PENALTY CGY illegal procedure 5 yards to the ALB6.','CGY',NULL,2,1,'N','ALB',NULL),(111,1,3,'12:30:00','N',6,'Adam Sinagra pass incomplete to Jalen Philpot, dropped pass.','CGY',0,2,6,'P','ALB',NULL),(112,1,3,'09:27:00','N',6,'Niko DiFonte field goal attempt from 13 GOOD, .','CGY',NULL,3,6,NULL,'ALB',NULL),(113,1,3,'09:27:00','N',-35,'Jonathan Rosery rush for 5 yards to the ALB40 (Hayden Nellis), PENALTY ALB face mask 15 yards to the ALB25.','ALB',5,1,10,'R','ALB',NULL),(114,1,3,'09:27:00','N',-25,'Brad Launhardt pass incomplete to Tyler Turner.','ALB',0,1,20,'P','ALB',NULL),(115,1,3,'09:27:00','N',-25,'Reece Oldenburg punt 32 yards to the CGY53, N. Anderson return 6 yards to the ALB51 (Josiah Schakel).','ALB',6,2,20,NULL,'ALB',NULL),(116,1,3,'08:17:00','N',51,'Adam Sinagra pass incomplete to Dallas Boath, PENALTY CGY illegal block declined.','CGY',0,1,10,'P','ALB',NULL),(117,1,3,'08:17:00','N',51,'Adam Sinagra pass incomplete to Jalen Philpot.','CGY',0,2,10,'P','ALB',NULL),(118,1,3,'08:17:00','N',51,'Niko DiFonte punt 50 yards to the ALB1.','CGY',0,3,10,NULL,'ALB',NULL),(119,1,3,'07:12:00','N',-1,'Jonathan Rosery rush for 1 yard to the ALB2 (Peter Nicastro).','ALB',1,1,10,'R','ALB',NULL),(120,1,3,'07:12:00','N',-2,'Brad Launhardt rush for 10 yards to the ALB12, 1ST DOWN ALB (T. Abrahams-Web).','ALB',10,2,9,'R','ALB',NULL),(121,1,3,'07:12:00','N',-12,'Brad Launhardt pass complete to Jonathan Rosery for 12 yards to the ALB24, out-of-bounds (M. Lucyshyn), PENALTY ALB holding 10 yards to the ALB14.','ALB',12,1,10,'P','ALB','Y'),(122,1,3,'07:12:00','N',-14,'Brad Launhardt pass complete to Ben Kopczynski for 15 yards to the ALB29, 1ST DOWN ALB (Nick Statz).','ALB',15,1,10,'P','ALB',NULL),(123,1,3,'07:12:00','N',-29,'Jonathan Rosery rush for 7 yards to the ALB36 (T. Abrahams-Web), PENALTY ALB unnecessary roughness 15 yards to the ALB21.','ALB',7,1,10,'R','ALB',NULL),(124,1,3,'07:12:00','N',-21,'Brad Launhardt pass incomplete to Jonathan Rosery, PENALTY CGY unnecessary roughness 15 yards to the ALB36.','ALB',0,2,18,'P','ALB',NULL),(125,1,3,'07:12:00','N',-36,'Brad Launhardt pass complete to Ben Kopczynski for 16 yards to the ALB52, 1ST DOWN ALB (M. Lucyshyn).','ALB',16,2,3,'P','ALB',NULL),(126,1,3,'07:12:00','N',-52,'Brad Launhardt pass complete to Tanner Buchanan for 44 yards to the CGY14, 1ST DOWN ALB (Joe Cant).','ALB',44,1,10,'P','ALB',NULL),(127,1,3,'03:06:00','N',14,'Brad Launhardt pass complete to Tanner Buchanan for 14 yards to the CGY0, 1ST DOWN ALB, TOUCHDOWN, PENALTY CGY roughing passer 15 yards to the CGY50, PENALTY CGY offside defense declined.','ALB',14,1,10,'P','CGY',NULL),(128,1,3,'03:06:00','N',5,'J. Giustini kick attempt good.','ALB',NULL,0,0,NULL,'CGY',NULL),(129,1,3,'03:06:00','N',50,'Brent Arthur kickoff 60 yards to the CGY-10 - SINGLE, touchback.','ALB',NULL,0,0,NULL,'CGY',NULL),(130,1,3,'03:04:00','N',-35,'Jeshrun Antwi rush for 5 yards to the CGY40 (Jayden Dalke;Jassen Brown).','CGY',5,1,10,'R','CGY',NULL),(131,1,3,'03:04:00','N',-40,'Adam Sinagra pass incomplete to Jalen Philpot.','CGY',0,2,5,'P','CGY',NULL),(132,1,3,'03:04:00','N',-40,'Niko DiFonte punt 38 yards to the ALB32, Wesley Bookland return 6 yards to the ALB38 (Cole Kussmann), PENALTY CGY illegal procedure declined, PENALTY ALB unnecessary roughness 15 yards to the ALB23, 1st and 10, ALB ball on ALB23.','CGY',6,3,5,NULL,'CGY',NULL),(133,1,3,'01:53:00','Y',-23,'Brad Launhardt pass complete to Jonathan Rosery for 13 yards to the ALB36 (Jacob Biggs;Nick Statz), PENALTY ALB illegal block 10 yards to the ALB13, PENALTY CGY unnecessary roughness 15 yards to the ALB28.','ALB',13,1,10,'P','ALB',NULL),(134,1,3,'01:53:00','N',-28,'Brad Launhardt pass complete to Ben Kopczynski for 9 yards to the ALB37 (Deane Leonard).','ALB',9,1,10,'P','ALB',NULL),(135,1,3,'01:53:00','Y',-37,'PENALTY ALB TMM 10 yards to the ALB27.','ALB',NULL,2,1,'N','ALB',NULL),(136,1,3,'01:53:00','N',-27,'Brad Launhardt pass complete to Ben Kopczynski for 35 yards to the CGY48, 1ST DOWN ALB (Deane Leonard).','ALB',35,2,11,'P','ALB',NULL),(137,1,3,'01:53:00','N',48,'Brad Launhardt pass complete to Ben Kopczynski for 20 yards to the CGY28, 1ST DOWN ALB (Jacob Biggs).','ALB',20,1,10,'P','CGY',NULL),(138,1,3,'01:53:00','N',28,'Jonathan Rosery rush for 14 yards to the CGY14, 1ST DOWN ALB (Carter Johnson).','ALB',14,1,10,'R','CGY',NULL),(139,1,4,'15:00:00','N',14,'Brad Launhardt pass incomplete to Colby Miller.','ALB',0,1,10,'P','CGY',NULL),(140,1,4,'15:00:00','Y',14,'Brad Launhardt rush for 12 yards to the CGY2 (Charlie Moore), PENALTY ALB holding 10 yards to the CGY24, NO PLAY.','ALB',12,2,10,'P','CGY',NULL),(141,1,4,'15:00:00','Y',24,'PENALTY ALB illegal procedure 5 yards to the CGY29.','ALB',NULL,2,20,'N','CGY',NULL),(142,1,4,'15:00:00','N',29,'Brad Launhardt pass incomplete (Trey Dube).','ALB',0,2,25,'P','CGY',NULL),(143,1,4,'13:34:00','N',29,'J. Giustini field goal attempt from 36 MISSED, kick to CGY-7, Deane Leonard return 10 yards to the CGY3.','ALB',10,3,25,NULL,'CGY',NULL),(144,1,4,'13:34:00','N',-20,'Jalen Philpot rush for 9 yards to the CGY29 (Luke Sperry).','CGY',9,1,10,'R','CGY',NULL),(145,1,4,'13:34:00','N',-29,'Josiah Joseph rush for no gain to the CGY29 (R. Szafranski).','CGY',0,2,1,'R','CGY',NULL),(146,1,4,'12:16:00','N',-29,'Josiah Joseph rush for 3 yards to the CGY32, 1ST DOWN CGY (Anthony Hume).','CGY',3,3,1,'R','CGY',NULL),(147,1,4,'11:27:00','N',-32,'Adam Sinagra pass intercepted by Jayden Dalke at the CGY35, Jayden Dalke return 35 yards to the CGY0, TOUCHDOWN, .','CGY',0,1,10,'P','CGY',NULL),(148,1,4,'11:27:00','N',5,'J. Giustini kick attempt good.','ALB',NULL,0,0,NULL,'CGY',NULL),(149,1,4,'11:27:00','N',-45,'Brent Arthur kickoff 60 yards to the CGY5, N. Anderson return 12 yards to the CGY17 (Jassen Brown).','ALB',12,0,0,NULL,'ALB',NULL),(150,1,4,'11:27:00','N',-17,'Jeshrun Antwi rush for 3 yards to the CGY20.','CGY',3,1,10,'R','CGY',NULL),(151,1,4,'11:27:00','N',-20,'Adam Sinagra pass incomplete to Jalen Philpot (Jayden Dalke).','CGY',0,2,7,'P','CGY',NULL),(152,1,4,'11:27:00','N',-20,'Niko DiFonte punt 38 yards to the ALB52, Wesley Bookland return 2 yards to the ALB54, fumble by Wesley Bookland recovered by CGY Chaz Marshall at 55 yardline.','CGY',2,3,7,NULL,'CGY',NULL),(153,1,4,'10:02:00','N',-55,'Adam Sinagra pass complete to Dallas Boath for 9 yards to the ALB46 (Josiah Schakel).','CGY',9,1,10,'P','CGY',NULL),(154,1,4,'10:02:00','N',46,'Jeshrun Antwi rush for 2 yards to the ALB44, 1ST DOWN CGY (Cole Nelson).','CGY',2,2,1,'R','ALB',NULL),(155,1,4,'10:02:00','N',44,'Adam Sinagra pass incomplete to Alex Basilis, dropped pass.','CGY',0,1,10,'P','ALB',NULL),(156,1,4,'10:02:00','N',44,'Adam Sinagra pass complete to Jalen Philpot for 15 yards to the ALB29, 1ST DOWN CGY (Josiah Schakel).','CGY',15,2,10,'P','ALB',NULL),(157,1,4,'10:02:00','N',29,'Adam Sinagra pass incomplete to Erik Nusl.','CGY',0,1,10,'P','ALB',NULL),(158,1,4,'10:02:00','N',29,'Adam Sinagra pass complete to Jeshrun Antwi for loss of 3 yards to the ALB32 (Aaron Chabaylo), PENALTY CGY holding declined.','CGY',-3,2,10,'P','ALB',NULL),(159,1,4,'07:10:00','N',32,'Niko DiFonte field goal attempt from 39 MISSED, kick to ALB-13, , Wesley Bookland return 71 yards to the CGY52, out-of-bounds (Dallas Boath).','CGY',71,3,13,NULL,'ALB','Y'),(160,1,4,'07:10:00','Y',52,'Brad Launhardt pass incomplete to Tanner Buchanan, PENALTY CGY roughing passer 15 yards to the CGY37, 1ST DOWN ALB, NO PLAY.','ALB',0,1,10,'P','CGY',NULL),(161,1,4,'07:10:00','N',37,'Brad Launhardt rush for 6 yards to the CGY31 (Noah McDonough).','ALB',6,1,10,'R','CGY',NULL),(162,1,4,'07:10:00','N',31,'Jonathan Rosery rush for 3 yards to the CGY28 (Jacob Plamondon).','ALB',3,2,4,'R','CGY',NULL),(163,1,4,'07:10:00','N',28,'Brad Launhardt rush for 2 yards to the CGY26, 1ST DOWN ALB (Alex Basilis).','ALB',2,3,1,'R','CGY',NULL),(164,1,4,'07:10:00','Y',26,'Brad Launhardt pass incomplete to Tanner Buchanan, PENALTY CGY pass interference 15 yards to the CGY11, 1ST DOWN ALB, NO PLAY.','ALB',0,1,10,'P','CGY',NULL),(165,1,4,'07:10:00','N',11,'Brad Launhardt pass complete to Jonathan Rosery for 4 yards to the CGY7 (Jacob Biggs).','ALB',4,1,10,'P','CGY',NULL),(166,1,4,'04:14:00','Y',7,'TIMEOUT ALB, NO PLAY.','ALB',NULL,2,6,'N','CGY',NULL),(167,1,4,'04:14:00','N',7,'Brad Launhardt pass incomplete to Jonathan Rosery, dropped pass.','ALB',0,2,6,'P','CGY',NULL),(168,1,4,'04:14:00','Y',7,'PENALTY ALB illegal procedure 0 yards to the CGY7.','ALB',NULL,3,6,'N','CGY',NULL),(169,1,4,'03:42:00','N',7,'J. Giustini field goal attempt from 15 GOOD, .','ALB',NULL,3,6,NULL,'CGY',NULL),(170,1,4,'03:42:00','N',-35,'Adam Sinagra pass incomplete to Alex Basilis.','CGY',0,1,10,'P','CGY',NULL),(171,1,4,'03:42:00','N',-35,'Adam Sinagra pass complete to Dallas Boath for 15 yards to the CGY50, 1ST DOWN CGY, out-of-bounds (Wesley Bookland).','CGY',15,2,10,'P','CGY','Y'),(172,1,4,'03:42:00','N',-50,'Adam Sinagra pass incomplete to Dallas Boath (Wesley Bookland).','CGY',0,1,10,'P','CGY',NULL),(173,1,4,'03:42:00','N',-50,'Adam Sinagra pass complete to Dallas Boath for 8 yards to the ALB52, out-of-bounds (Jayden Dalke).','CGY',8,2,10,'P','CGY','Y'),(174,1,4,'03:42:00','N',52,'Niko DiFonte punt 39 yards to the ALB13, Wesley Bookland return 7 yards to the ALB20 (Noah McDonough).','CGY',7,3,2,NULL,'ALB',NULL),(175,1,4,'02:12:00','N',-20,'Ben Kopczynski rush for 34 yards to the ALB54, 1ST DOWN ALB (Jacob Plamondon).','ALB',34,1,10,'R','ALB',NULL),(176,1,4,'02:12:00','N',-54,'Jonathan Rosery rush for 4 yards to the CGY52 (Daniel Teitz).','ALB',4,1,10,'R','ALB',NULL),(177,1,4,'02:12:00','N',52,'Jonathan Rosery rush for loss of 1 yard to the CGY53 (Hayden Nellis).','ALB',-1,2,6,'R','CGY',NULL),(178,1,4,'02:12:00','N',53,'Brad Launhardt pass incomplete, PENALTY ALB unnecessary roughness (Tyler Turner) 15 yards to the ALB42.','ALB',0,3,7,'P','CGY',NULL),(179,1,4,'01:31:00','N',42,'Jeshrun Antwi rush for 11 yards to the ALB31, 1ST DOWN CGY (Troy Hansen).','CGY',11,1,10,'R','ALB',NULL),(180,1,4,'01:31:00','N',31,'Jeshrun Antwi rush for 4 yards to the ALB27 (Jayden Dalke).','CGY',4,1,10,'R','ALB',NULL),(181,1,4,'01:31:00','N',27,'Jeshrun Antwi rush for loss of 2 yards to the ALB29 (Josiah Schakel).','CGY',-2,2,6,'R','ALB',NULL),(182,1,4,'00:20:00','N',29,'Niko DiFonte field goal attempt from 37 SINGLE, touchback, .','CGY',NULL,3,8,NULL,'ALB',NULL),(183,1,4,'00:20:00','N',-35,'Brad Launhardt pass complete to M. Peterson for 18 yards to the ALB53, 1ST DOWN ALB, out-of-bounds (Joe Cant).','ALB',18,1,10,'P','ALB','Y'),(184,1,4,'00:00:00','Y',-53,'TIMEOUT CGY, NO PLAY.','ALB',NULL,1,10,'N','ALB',NULL),(185,1,4,'00:00:00','N',-53,'Brad Launhardt pass intercepted by Deane Leonard at the CGY48, Deane Leonard return 62 yards to the ALB0, TOUCHDOWN, . PENALTY CGY unsportsmanlike conduct 10 yards to the ALB15.','ALB',0,1,10,'P','ALB',NULL),(186,1,4,'00:00:00','N',15,'Niko DiFonte kick attempt good.','CGY',NULL,0,0,NULL,'ALB',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'2/24/2020 21:01','CGY','Josiah Joseph',1,'6-3','QB',215,'4','Peachland, BC','Okanagan Sun (Mount Boucherie)'),(2,'2/24/2020 21:01','CGY','Deane Leonard',2,'6-2','DB',193,'3','Calgary, Alta','(Notre Dame)'),(3,'2/24/2020 21:01','CGY','Jacob Biggs',3,'6-1','DB',185,'2','Calgary, Alta','(St Francis)'),(4,'2/24/2020 21:01','CGY','Sterling Taylor IV',4,'6-2','DB',200,'5','Atlanta, Ga, USA','Murray State Univ (Morrow)'),(5,'2/24/2020 21:01','CGY','Jalen Philpot',5,'6-1','WR',185,'2','Delta, BC','(Seaquam)'),(6,'2/24/2020 21:01','CGY','Tyson Philpot',6,'6-1','WR',190,'2','Delta, BC','(Seaquam)'),(7,'2/24/2020 21:01','CGY','Matteo Spoletini',7,'6-3','QB',215,'1','Calgary, Alta','(Notre Dame)'),(8,'2/24/2020 21:01','CGY','Nick Statz',8,'5-10','DB',180,'5','Calgary, Alta','(Notre Dame)'),(9,'2/24/2020 21:01','CGY','Grant McDonald',9,'6-3','LB',225,'3','Tsawwassen, BC','Univ of Maine (South Delta)'),(10,'2/24/2020 21:01','CGY','Jack McDonald',10,'6-1','WR',210,'5','South Delta, BC','(South Delta)'),(11,'2/24/2020 21:01','CGY','Dallas Boath',11,'5-9','WR',185,'5','Calgary, Alta','(Centennial)'),(12,'2/24/2020 21:01','CGY','Adam Sinagra',12,'6-1','QB',195,'5','Pointe Claire, Que','John Abbott College'),(13,'2/24/2020 21:01','CGY','Matthew Wilson',13,'6-1','QB',183,'1','Saskatoon, Sask','(Holy Cross)'),(14,'2/24/2020 21:01','CGY','Jason Anyimadu',14,'6-1','DB',205,'4','Mississauga, Ont','Hamilton Hurricanes (Our Lady of Mount Carmel)'),(15,'2/24/2020 21:01','CGY','Treshaun Abrahams-Webster',15,'5-11','DB',185,'4','Pickering, Ont','Canada Prep (Pickering)'),(16,'2/24/2020 21:01','CGY','Daniel Sananes',16,'6-4','QB',215,'1','Lachine, Que','Vanier College'),(17,'2/24/2020 21:01','CGY','Andrew Ricard',18,'6-2','DB',195,'4','Winnipeg, Man','Winnipeg Rifles (Elmwood)'),(18,'2/24/2020 21:01','CGY','Matson Tulloch',19,'5-8','WR',170,'1','Calgary, Alta','(Henry Wise Wood)'),(19,'2/24/2020 21:01','CGY','Alessandro Molnar',20,'5-10','RB',195,'3','Calgary, Alta','Rundle College'),(20,'2/24/2020 21:01','CGY','Jeshrun Antwi',21,'6-1','RB',210,'5','Calgary, Alta','(Father Lacombe)'),(21,'2/24/2020 21:01','CGY','Patrick Pankow',22,'5-11','DB',185,'4','Perth, Ont','Univ of Toronto (St John CHS)'),(22,'2/24/2020 21:01','CGY','Trey Dube',23,'6-1','DB',198,'2','Calgary, Alta','(Henry Wise Wood)'),(23,'2/24/2020 21:01','CGY','Keidron Hughes',24,'6-4','DB',170,'1','Calgary, Alta','(William Aberhart)'),(24,'2/24/2020 21:01','CGY','Beko Wande',25,'6-1','DB',173,'1','Red Deer, Alta','(Notre Dame)'),(25,'2/24/2020 21:01','CGY','Matthew Lucyshyn',26,'6-1','DB',180,'3','Calgary, Alta','(Bishop Grandin)'),(26,'2/24/2020 21:01','CGY','Joe Cant',27,'6-1','DB',185,'3','Calgary, Alta','(Notre Dame)'),(27,'2/24/2020 21:01','CGY','Thirpam Thomas',28,'6-1','WR',160,'1','Calgary, Alta','(Notre Dame)'),(28,'2/24/2020 21:01','CGY','Tyler Santos',30,'6-1','RB',210,'1','Calgary, Alta','(Henry Wise Wood)'),(29,'2/24/2020 21:01','CGY','O\'Shae Ho-Sang',31,'6-1','RB',200,'1','Lasalle, Que','(Kents Hill)'),(30,'2/24/2020 21:01','CGY','Cole Kussmann',32,'5-10','RB',195,'4','London, Ont','(Mother Teresa)'),(31,'2/24/2020 21:01','CGY','Robinson Rodrigues',33,'5-10','RB',195,'4','Burnaby, BC','Okanagan Sun (Coquitlam)'),(32,'2/24/2020 21:01','CGY','Payton Burbank',34,'6-2','WR',180,'1','Okotoks, Alta','(Foothills Composite)'),(33,'2/24/2020 21:01','CGY','Ross DeLauw',35,'5-11','LB',225,'5','Lethbridge, Alta','(Winston Churchill)'),(34,'2/24/2020 21:01','CGY','Tyson Rowe',36,'6-1','RB',225,'1','Calgary, Alta','(St Francis)'),(35,'2/24/2020 21:01','CGY','Zach Newman',37,'6-2','RB',245,'2','Calgary, Alta','(Robert Thirsk)'),(36,'2/24/2020 21:01','CGY','Caleb Guthrie',38,'6-1','LB',208,'1','Calgary, Alta','(Robert Thirsk)'),(37,'2/24/2020 21:01','CGY','Josh Yanchishyn',40,'6-1','DB',170,'1','Winnipeg, Man','(Dakota Collegiate)'),(38,'2/24/2020 21:01','CGY','Madison Spewak',41,'5-10','DB',170,'1','Winnipeg, Man','(Dakota Collegiate)'),(39,'2/24/2020 21:01','CGY','Noah McDonough',42,'6-1','DB',195,'2','Calgary, Alta','(St Francis)'),(40,'2/24/2020 21:01','CGY','Subomi Oyesoro',43,'6-1','LB',215,'2','Calgary, Alta','(Crescent Heights)'),(41,'2/24/2020 21:01','CGY','Aidan Miele',44,'5-10','LB',208,'1','Calgary, Alta','(Notre Dame)'),(42,'2/24/2020 21:01','CGY','Niko DiFonte',45,'6-1','K/P',170,'4','Winnipeg, Man','(Oak Park)'),(43,'2/24/2020 21:01','CGY','Steen Rasmussen',46,'5-11','DB',185,'1','Lantzville, BC','(John Barsby)'),(44,'2/24/2020 21:01','CGY','Patrick Jelen',47,'6-1','DB',190,'1','Okotoks, Alta','(Holy Trinity Academy)'),(45,'2/24/2020 21:01','CGY','Caleb Callaghan',48,'6-1','LB',195,'1','Calgary, Alta','(Crescent Heights)'),(46,'2/24/2020 21:01','CGY','Jacob Kirk',49,'6-1','DB',175,'1','Tsawwassen, BC','(South Delta)'),(47,'2/24/2020 21:01','CGY','Charlie Moore',50,'6-3','LB',215,'3','South Delta, BC','(South Delta)'),(48,'2/24/2020 21:01','CGY','Daniel Flanagan',51,'6-1','LB',190,'1','Calgary, Alta','(St Francis)'),(49,'2/24/2020 21:01','CGY','Peter Nicastro',52,'6-2','OL',310,'3','Calgary, Alta','(St Francis)'),(50,'2/24/2020 21:01','CGY','Nikolas Fourlas',53,'5-11','LB',200,'1','Calgary, Alta','(Henry Wise Wood)'),(51,'2/24/2020 21:01','CGY','Chaz Marshall',54,'6-1','LS',215,'1','Port Coquitlam, BC','(Terry Fox)'),(52,'2/24/2020 21:01','CGY','Salim Fraser',55,'6-3','DL',257,'1','Calgary, Alta','(Sir Winston Churchill)'),(53,'2/24/2020 21:01','CGY','Spencer Roy',56,'6-4','OL',330,'4','Calgary, Alta','(Notre Dame)'),(54,'2/24/2020 21:01','CGY','Daniel Teitz',57,'6-1','LB',220,'3','Calgary, Alta','(Springbank)'),(55,'2/24/2020 21:01','CGY','Carter Johnson',58,'6-3','OL',300,'1','Calgary, Alta','(Henry Wise Wood)'),(56,'2/24/2020 21:01','CGY','George Hutchings',59,'6-2','OL',300,'3','Calgary, Alta','(St Andrew\'s College)'),(57,'2/24/2020 21:01','CGY','Jay-Ar Driedger',60,'6-1','OL',295,'1','Winnipeg, Man','(Dakota Collegiate)'),(58,'2/24/2020 21:01','CGY','Nicolas Auvigne',61,'6-2','OL',280,'2','Calgary, Alta','(St Francis)'),(59,'2/24/2020 21:01','CGY','Chad Whittemore',64,'6-1','OL',270,'1','Calgary, Alta','(Bishop O\'Byrne)'),(60,'2/24/2020 21:01','CGY','Simon Li',65,'6-6','OL',310,'1','Vancouver, BC','(West Vancouver)'),(61,'2/24/2020 21:01','CGY','Tyler Packer',66,'6-6','OL',330,'3','Calgary, Alta','(Notre Dame)'),(62,'2/24/2020 21:01','CGY','Carter Comeau',67,'6-6','OL',350,'4','Riverton, Man','Okanagan Sun (Riverton Collegiate)'),(63,'2/24/2020 21:01','CGY','John Bosse',68,'6-6','OL',285,'1','Calgary, Alta','(Lester B Pearson)'),(64,'2/24/2020 21:01','CGY','Logan Bandy',69,'6-5','OL',285,'3','Calgary, Alta','(St Francis)'),(65,'2/24/2020 21:01','CGY','Carson Dueck',71,'6-1','K/P',170,'1','Calgary, Alta','(William Aberhart)'),(66,'2/24/2020 21:01','CGY','Tariq Essa',72,'6-5','OL',300,'1','Calgary, Alta','(Ernest Manning)'),(67,'2/24/2020 21:01','CGY','Matthew Lawrence',74,'6-2','LB',218,'1','Calgary, Alta','(John G Diefenbaker)'),(68,'2/24/2020 21:01','CGY','Danny Tasie',75,'5-11','DL',265,'1','Calgary, Alta','Okanagan Sun (Lester B Pearson)'),(69,'2/24/2020 21:01','CGY','Curtis Prime',76,'6-3','DL',270,'1','Calgary, Alta','(St Francis)'),(70,'2/24/2020 21:01','CGY','Scott MacDonell',77,'6-6','DL',235,'1','Calgary, Alta','(Springbank)'),(71,'2/24/2020 21:01','CGY','Tom Baatar',79,'6-7','DL',232,'1','Calgary, Alta','(St Mary\'s)'),(72,'2/24/2020 21:01','CGY','Payton Price',80,'6-1','WR',195,'1','Okotoks, Alta','(Foothills Composite)'),(73,'2/24/2020 21:01','CGY','Dante Carbone',81,'6-4','WR',195,'1','Victoria, BC','(Mount Douglas)'),(74,'2/24/2020 21:01','CGY','Nathanael Durkan',82,'6-2','WR',190,'4','Nanaimo, BC','Simon Fraser Univ (John Barsby)'),(75,'2/24/2020 21:01','CGY','Erik Nusl',84,'5-11','WR',170,'2','Cochrane, Alta','(Cochrane)'),(76,'2/24/2020 21:01','CGY','Alex Basilis',85,'6-1','WR',200,'3','Calgary, Alta','(St Mary\'s)'),(77,'2/24/2020 21:01','CGY','Hunter Karl',86,'6-1','WR',185,'5','Okotoks, Alta','(Foothills Composite)'),(78,'2/24/2020 21:01','CGY','Mason David',87,'6-3','WR',235,'1','Calgary, Alta','(Henry Wise Wood)'),(79,'2/24/2020 21:01','CGY','Michail Peters',88,'6-1','WR',180,'1','Calgary, Alta','(Bishop McNally)'),(80,'2/24/2020 21:01','CGY','Nathanael Anderson',89,'6-1','WR',180,'2','Salt Lake City, Utah, USA','Okanagan Sun (Copper Hills)'),(81,'2/24/2020 21:01','CGY','J-Min Pelley',90,'6-6','DL',320,'2','Calgary, Alta','Okanagan Sun'),(82,'2/24/2020 21:01','CGY','Tyrese Best',91,'6-4','DL',260,'2','Calgary, Alta','(Henry Wise Wood)'),(83,'2/24/2020 21:01','CGY','Jacob Plamondon',92,'6-3','DL',230,'3','Red Deer, Alta','(Notre Dame)'),(84,'2/24/2020 21:01','CGY','Nathan Teitz',93,'6-2','DL',250,'1','Calgary, Alta','(Springbank)'),(85,'2/24/2020 21:01','CGY','Chimzy Tasie',94,'6-3','DL',260,'2','Calgary, Alta','(Lester B Pearson)'),(86,'2/24/2020 21:01','CGY','Josh Hyer',96,'6-4','DL',250,'2','Vernon, BC','(Vernon Secondary)'),(87,'2/24/2020 21:01','CGY','Max Baatar',97,'6-1','DL',265,'4','Calgary, Alta','(Henry Wise Wood)'),(88,'2/24/2020 21:01','CGY','Zach Xavier',98,'5-11','DL',250,'1','Calgary, Alta','(William Aberhart)'),(89,'2/24/2020 21:01','CGY','Hayden Nellis',99,'6-4','DL',280,'4','Winnipeg, Man','Winnipeg Rifles (Dakota Collegiate)'),(90,'2/24/2020 21:01','CGY','Jayden Bailey',0,'6-4','RB',205,'1','Calgary, Alta','(Bishop O\'Byrne)'),(91,'2/24/2020 21:01','CGY','Joe Bell',0,'6-1','WR',176,'1','Calgary, Alta','(Cochrane)'),(92,'2/24/2020 21:01','CGY','Caleb Cutcliffe',0,'6-1','QB',200,'2','Oakville, Ont','Gavilan College (Oakville Trafalgar)'),(93,'2/24/2020 21:01','CGY','Brandon MacIsaac',0,'6-3','WR',210,'2','Calgary, Alta','Calgary Colts (St Francis)'),(94,'2/24/2020 21:01','CGY','Abdelmalik Mohammed',0,'6-1','WR',204,'2','Kristianstad, SWE',''),(95,'2/24/2020 21:01','CGY','Dylan Neis',0,'6-1','WR',170,'1','Cochrane, Alta','(Cochrane)'),(96,'2/24/2020 21:01','CGY','Omar Ramy',0,'6-1','WR',199,'2','Cairo, EGY','Univ of Wyoming'),(97,'2/24/2020 21:01','CGY','Alex Wahl',0,'6-5','WR',207,'1','North Vancouver, BC','(Argyle Secondary)'),(98,'2/24/2020 21:01','CGY','Nick Watson',0,'6-1','DB',195,'1','Calgary, Alta','(Centennial)'),(99,'2/24/2020 21:01','CGY','Evan Zadery',0,'6-1','DB',180,'1','Calgary, Alta','(Henry Wise Wood)'),(100,'2/24/2020 21:01','UBC','Edgerrin Williams',1,'5-11','Rec',180,'1','Hamilton, Ont','St Thomas More Catholic'),(101,'2/24/2020 21:01','UBC','Christophe Bouchard',2,'6-2','DB',175,'1','Québec City, Que','Campus Notre-Dame-de-Foy'),(102,'2/24/2020 21:01','UBC','Kamryn Matheson',3,'5-11','DB',180,'1','Truro, NS','IMG Academy'),(103,'2/24/2020 21:01','UBC','Tommy Yanchuk',4,'6-1','QB',195,'1','Lloydminster, Sask','Holy Rosary High'),(104,'2/24/2020 21:01','UBC','Marc Bouchard',12,'5-11','Rec',165,'1','Saint-Bernard, Que',''),(105,'2/24/2020 21:01','UBC','Ryan Baker',14,'6-2','QB',200,'1','North Vancouver, BC','Windsor Secondary'),(106,'2/24/2020 21:01','UBC','Julian Hartley',18,'6-2','Rec',180,'1','North Vancouver, BC','Argyle Secondary'),(107,'2/24/2020 21:01','UBC','Max Kennedy',19,'5-10','DB',183,'1','Port Moody, BC','Centennial Secondary'),(108,'2/24/2020 21:01','UBC','Joshua Martin',20,'5-9','Rec',180,'1','Livermore, Calif','Livermore High'),(109,'2/24/2020 21:01','UBC','Eric Dika-Balotoken',23,'5-8','DB',170,'1','North Vancouver, BC','Handsworth Secondary'),(110,'2/24/2020 21:01','UBC','Charles Lemay',30,'5-11','RB',190,'1','Coldstream, BC','Vernon Secondary'),(111,'2/24/2020 21:01','UBC','Chris Thelasco',33,'5-11','DB',180,'1','Calgary, Alta','Father Lacombe Senior High'),(112,'2/24/2020 21:01','UBC','Dario Ciccone',37,'6-1','DB',180,'1','Burnaby, BC','St Thomas More Collegiate'),(113,'2/24/2020 21:01','UBC','Joel Pielak',38,'5-10','RB',190,'1','Coquitlam, BC','St Thomas More Collegiate'),(114,'2/24/2020 21:01','UBC','Daniel Auld',39,'6-1','DB',180,'1','Burnaby, BC','St Thomas More Collegiate'),(115,'2/24/2020 21:01','UBC','Owen Brown',41,'5-10','K',165,'1','Winnipeg, Man','St John\'s Ravenscourt'),(116,'2/24/2020 21:01','UBC','Mitchell Townsend',42,'6-4','LB',220,'1','North Vancouver, BC','Windsor Secondary'),(117,'2/24/2020 21:01','UBC','John Nikolovski',46,'6-1','LB',205,'1','Burlington, Ont','St Ignatius of Loyola Catholic'),(118,'2/24/2020 21:01','UBC','Marcus Nikolovski',49,'6-3','LB',232,'1','Burlington, Ont','St Ignatius of Loyola Catholic'),(119,'2/24/2020 21:01','UBC','Aiden Bertuzzi',55,'6-5','DL',220,'1','Victoria, BC','Mt Douglas Secondary'),(120,'2/24/2020 21:01','UBC','Noah Hochfelder',62,'6-2','OL',260,'1','Vancouver, BC','Vancouver College'),(121,'2/24/2020 21:01','UBC','Kevin Morrison',64,'6-5','OL',265,'1','Langley, BC','DW Poppy Secondary'),(122,'2/24/2020 21:01','UBC','Gavin Murray',68,'6-3','OL',265,'1','Delta, BC','Seaquam Secondary'),(123,'2/24/2020 21:01','UBC','Theo Benedet',72,'6-7','OL',240,'1','North Vancouver, BC','Handsworth Secondary'),(124,'2/24/2020 21:01','UBC','Giovanni Manu',76,'6-8','OL',320,'1','Pitt Meadows, BC','Pitt Meadows Secondary'),(125,'2/24/2020 21:01','UBC','Lucas Robertson',82,'6-4','Rec',230,'1','Edmonton, Alta','St Pius X High'),(126,'2/24/2020 21:01','UBC','Daniel Okumagba',84,'6-3','Rec',186,'1','Calgary, Alta','St Mary\'s High'),(127,'2/24/2020 21:01','UBC','Brad Hladik',87,'6-4','TE',200,'1','Vernon, BC','Vernon Secondary'),(128,'2/24/2020 21:01','UBC','Isaac Williams',89,'6-1','Rec',180,'1','Calgary, Alta','Centennial High'),(129,'2/24/2020 21:01','UBC','Kyle Samson',92,'6-3','DL',253,'1','Hamilton, Ont','Cardinal Newman Catholic'),(130,'2/24/2020 21:01','UBC','Sam Steele',99,'6-1','DL',225,'1','Surrey, BC','St Thomas More Collegiate'),(131,'2/24/2020 21:01','UBC','Ryan Smith',5,'6-1','Rec',195,'2','Calgary, Alta','Notre Dame High'),(132,'2/24/2020 21:01','UBC','Ted Kubongo',6,'6-1','RB',212,'2','Calgary, Alta','St Matthews High'),(133,'2/24/2020 21:01','UBC','Michael Calvert',8,'6-2','DB',200,'2','Delta, BC','South Delta Secondary'),(134,'2/24/2020 21:01','UBC','Nick Cross',9,'6-1','LB',200,'2','Regina, Sask','Dr Martin LeBoldus High'),(135,'2/24/2020 21:01','UBC','Gabe Olivares',10,'5-10','QB',205,'2','Chilliwack, BC','GW Graham Secondary'),(136,'2/24/2020 21:01','UBC','Jaxon Ciraolo-Brown',22,'6-1','DB',190,'2','Hamilton, Ont','Cathedral High'),(137,'2/24/2020 21:01','UBC','James Vause',24,'6-1','DB',193,'2','Saskatoon, Sask','Aden Bowman Collegiate'),(138,'2/24/2020 21:01','UBC','Nick Pollitt',25,'6-1','Rec',175,'2','Calgary, Alta','Henry Wise Wood High'),(139,'2/24/2020 21:01','UBC','Cormac Scholz',26,'6-1','LB',205,'2','Calgary, Alta','Springbank Community High'),(140,'2/24/2020 21:01','UBC','Sharique Khan',27,'5-11','RB',185,'2','Fort McMurray, Alta','Holy Trinity Catholic High'),(141,'2/24/2020 21:01','UBC','David Habashy',28,'6-1','LB',220,'2','Vancouver, BC','American International School'),(142,'2/24/2020 21:01','UBC','Daniel Appiah',34,'5-6','RB',150,'2','Calgary, Alta','Ernest Manning High'),(143,'2/24/2020 21:01','UBC','Luke Burton-Krahn',40,'6-1','DB',225,'2','Victoria, BC','Esquimalt Secondary'),(144,'2/24/2020 21:01','UBC','Lake Korte-Moore',44,'6-5','LB',227,'2','Ottawa, Ont','St Joseph\'s Catholic'),(145,'2/24/2020 21:01','UBC','Daniel Kwamou',45,'6-1','LB',216,'2','Calgary, Alta','Notre Dame High'),(146,'2/24/2020 21:01','UBC','Brandon Sanford',63,'6-5','OL',300,'2','Salmon Arm, BC','Salmon Arm Secondary'),(147,'2/24/2020 21:01','UBC','Brendan Devane',80,'6-4','Rec',210,'2','Mississauga, Ont','Port Credit Secondary'),(148,'2/24/2020 21:01','UBC','Jacob Patten',81,'6-1','Rec',170,'2','Stoney Creek, Ont','Bishop Ryan Catholic'),(149,'2/24/2020 21:01','UBC','Kees Den Ouden',83,'6-1','Rec',190,'2','Calgary, Alta','Centennial High'),(150,'2/24/2020 21:01','UBC','Tom Schnitzler',94,'6-5','DL',245,'2','Saskatoon, Sask','Bishop James Mahoney High'),(151,'2/24/2020 21:01','UBC','Darth Hundal',95,'6-3','DL',255,'2','Calgary, Alta','St Francis High'),(152,'2/24/2020 21:01','UBC','Elias Rodriguez',98,'6-1','DL',260,'2','Kelowna, BC','Kelowna Secondary'),(153,'2/24/2020 21:01','UBC','Kene Ezekeke',11,'6-2','DB',190,'3','Calgary, Alta','St Mary\'s High'),(154,'2/24/2020 21:01','UBC','Lliam Wishart',13,'6-2','Rec',197,'3','Kamloops, BC','Valleyview Secondary'),(155,'2/24/2020 21:01','UBC','Payton LaGrange',16,'5-8','DB',175,'3','Red Deer, Alta','Notre Dame High'),(156,'2/24/2020 21:01','UBC','Bashiru Sise-Odaa',29,'5-8','DB',183,'3','Surrey, BC','Frank Hurt Secondary'),(157,'2/24/2020 21:01','UBC','James Ens',31,'6-1','DB',195,'3','Sherwood Park, Alta','Bev Facey Community High'),(158,'2/24/2020 21:01','UBC','Elliot Graham',32,'6-3','DL',220,'3','Hamilton, Ont','Westdale Secondary'),(159,'2/24/2020 21:01','UBC','Garrin McDonnell',43,'6-2','K',230,'3','Parksville, BC','Ballenas Secondary'),(160,'2/24/2020 21:01','UBC','Saeed Hosain',50,'6-2','OL',300,'3','Burnaby, BC','Centennial Secondary'),(161,'2/24/2020 21:01','UBC','Ben Hladik',52,'6-4','LB',238,'3','Vernon, BC','Vernon Secondary'),(162,'2/24/2020 21:01','UBC','Ethan Slater',58,'6-3','OL',275,'3','Thunder Bay, Ont','St Ignatius High'),(163,'2/24/2020 21:01','UBC','Dave Edwards',70,'6-5','OL',290,'3','Delta, BC','South Delta Secondary'),(164,'2/24/2020 21:01','UBC','James Harney',74,'6-1','OL',270,'3','Squamish, BC','Notre Dame Regional'),(165,'2/24/2020 21:01','UBC','Diego Alatorre',75,'6-3','OL',315,'3','Tlajomulco de Zuñiga, Mexico',''),(166,'2/24/2020 21:01','UBC','Hamada Kanaan',77,'6-1','OL',280,'3','London, Ont','Catholic Central High'),(167,'2/24/2020 21:01','UBC','Marcus Browne',86,'6-4','Rec',206,'3','Surrey, BC','Holy Cross Regional'),(168,'2/24/2020 21:01','UBC','Nick Richard',88,'6-3','Rec',195,'3','Calgary, Alta','Notre Dame High'),(169,'2/24/2020 21:01','UBC','JJ DesLauriers',7,'5-11','Rec',180,'4','Surrey, BC','St Thomas More Collegiate'),(170,'2/24/2020 21:01','UBC','Trey Kellogg',21,'6-3','Rec',190,'4','De Winton, Alta','Foothills Composite High'),(171,'2/24/2020 21:01','UBC','Zackari Vint',36,'6-1','LB',215,'4','Kelowna, BC','Kelowna Secondary'),(172,'2/24/2020 21:01','UBC','Henrique Custodio',54,'6-1','DL',235,'4','Toronto, Ont','The Hill School'),(173,'2/24/2020 21:01','UBC','Kieran Janes',85,'6-4','TE',235,'4','New Westminster, BC','St Thomas More Collegiate'),(174,'2/24/2020 21:01','UBC','AJ Blackwell',35,'5-11','LB',190,'5','North Vancouver, BC','Carson Graham Secondary'),(175,'2/24/2020 21:01','REG','Maguire Abell',72,'6-1','OL',265,'2','Moose Jaw, Sask','Albert E Peacock Collegiate'),(176,'2/24/2020 21:01','REG','Gowrishan Aravinthan',23,'6-1','DB',180,'1','Regina, Sask','Campbell Collegiate'),(177,'2/24/2020 21:01','REG','Andrew Becker',65,'6-3','OL',300,'3','Kelowna, BC','Rutland Senior Secondary'),(178,'2/24/2020 21:01','REG','Isaac Birdsell-Tyndale',35,'5-9','RB',220,'RS','Regina, Sask','Miller Comprehensive HS'),(179,'2/24/2020 21:01','REG','Riley Boersma',83,'5-10','REC',175,'2','Cambridge, Ont','Royal Imperial Collegiate of Canada'),(180,'2/24/2020 21:01','REG','Roe Borgmann',67,'6-1','OL',270,'5','Lumsden, Sask','Lumsden HS'),(181,'2/24/2020 21:01','REG','Joel Braden',64,'6-5','OL',325,'3','Regina, Sask','Regina Thunder'),(182,'2/24/2020 21:01','REG','Seb Britton',2,'6-5','QB',230,'3','Calgary, Alta','Rundle College'),(183,'2/24/2020 21:01','REG','Brandon Brooks',6,'6-2','DB',190,'5','San Diego, Calif','University of Nevada'),(184,'2/24/2020 21:01','REG','Trey Campbell',5,'5-9','RB',190,'5','Toronto, Ont','Westshore Rebels'),(185,'2/24/2020 21:01','REG','Theren Churchill',62,'6-6','OL',295,'5','Stettler, Alta','Edmonton Huskies'),(186,'2/24/2020 21:01','REG','Michael Clow',98,'6-2','DL',210,'RS','Regina, Sask','Miller Comprehensive HS'),(187,'2/24/2020 21:01','REG','Cameron Cross',93,'6-3','DL',260,'4','North Vancouver, BC','Langley Rams'),(188,'2/24/2020 21:01','REG','Jacob Dakiniewich',47,'6-2','LB',205,'RS','Regina, Sask','Dr Martin LeBoldus HS'),(189,'2/24/2020 21:01','REG','Cord Delinte',31,'6-1','DB',205,'5','Cowley, Alta','Okanagan Sun'),(190,'2/24/2020 21:01','REG','Elias Deptuch',59,'5-11','DL',230,'RS','Regina, Sask','Dr Martin LeBoldus HS'),(191,'2/24/2020 21:01','REG','Dominique Dheilly',88,'6-1','REC',175,'RS','Regina, Sask','Dr Martin LeBoldus HS'),(192,'2/24/2020 21:01','REG','Andrew Doidge',57,'6-1','DL',210,'RS','Lumsden, Sask','Lumsden HS'),(193,'2/24/2020 21:01','REG','Josh Donnelly',17,'6-3','QB',185,'1','Regina, Sask','Dr Martin LeBoldus HS'),(194,'2/24/2020 21:01','REG','Jayse Easton',33,'5-10','RB',180,'RS','Moosomin, Sask','Moosomin Generals'),(195,'2/24/2020 21:01','REG','Chase Ellingson',16,'6-1','DB',190,'RS','Swan River, Man','Royal Imperial Collegiate of Canada'),(196,'2/24/2020 21:01','REG','Cody Ellingson',41,'6-1','LB',215,'3','Swan River, Man','Swan Valley Regional Secondary'),(197,'2/24/2020 21:01','REG','Zach Eltom',99,'6-3','DL',250,'1','Regina, Sask','Dr Martin LeBoldus HS'),(198,'2/24/2020 21:01','REG','Jared Ens',0,'6-2','DB',175,'RS','Warman, Sask','Bishop James Mahoney HS'),(199,'2/24/2020 21:01','REG','Jesse Ens',75,'6-4','OL',280,'3','Warman, Sask','Warman HS'),(200,'2/24/2020 21:01','REG','Jaxon Ford',21,'6-1','DB',190,'2','Regina, Sask','Campbell Collegiate'),(201,'2/24/2020 21:01','REG','Jaxon Fuchs',12,'5-11','DB',170,'RS','Regina, Sask','Michael A Riffel HS'),(202,'2/24/2020 21:01','REG','Aldo Galvan',1,'5-10','K',200,'2','Mexico City, Mexico','Bucaneros de Satélite'),(203,'2/24/2020 21:01','REG','Brandon Gandire',19,'6-1','DB',185,'3','Marietta, Ga','Westshore Rebels'),(204,'2/24/2020 21:01','REG','Will Genert',0,'6-1','DB',155,'RS','Regina, Sask','Miller Comprehensive HS'),(205,'2/24/2020 21:01','REG','Connor Green',53,'5-7','K',165,'RS','Portage la Prairie, Man','Portage Collegiate'),(206,'2/24/2020 21:01','REG','Lachlan Hardiker',82,'6-3','REC',180,'RS','Medicine Hat, Alta','Medicine Hat HS'),(207,'2/24/2020 21:01','REG','Garret Hatchard',49,'6-3','LB',210,'RS','Lloydminster, Alta','Lloydminster Comprehensive HS'),(208,'2/24/2020 21:01','REG','Colton Hippe',15,'6-4','QB',225,'4','Lloydminster, Sask','Edmonton Wildcats'),(209,'2/24/2020 21:01','REG','Zach Hirshmiller',97,'6-1','DL',245,'RS','Regina, Sask','Winston Knoll Collegiate'),(210,'2/24/2020 21:01','REG','Parker Hodel',70,'6-4','OL',305,'1','Regina, Sask','Winston Knoll Collegiate'),(211,'2/24/2020 21:01','REG','Josh Howe',58,'6-3','DL',225,'RS','Medicine Hat, Alta','Medicine Hat HS'),(212,'2/24/2020 21:01','REG','Thomas Hyett',11,'6-5','QB',210,'RS','Vernon, BC','Vernon Secondary'),(213,'2/24/2020 21:01','REG','Ethan Jaster',24,'5-8','DB',170,'RS','Regina, Sask','Archbishop MC O\'Neill HS'),(214,'2/24/2020 21:01','REG','Liam Jensen',63,'6-3','OL',285,'3','Watrous, Sask','Winston HS'),(215,'2/24/2020 21:01','REG','Colby Joyes',77,'6-6','OL',320,'RS','Clavet, Sask','Clavet Composite'),(216,'2/24/2020 21:01','REG','Christian Katende',38,'5-8','RB',220,'RS','Regina, Sask','Winston Knoll Collegiate'),(217,'2/24/2020 21:01','REG','Dallen Keen',4,'6-5','REC',195,'1','Regina, Sask','Miller Comprehensive HS'),(218,'2/24/2020 21:01','REG','Dillon Kiefer',42,'6-3','DB',185,'RS','Regina, Sask','Miller Comprehensive HS'),(219,'2/24/2020 21:01','REG','Karl King',18,'5-11','DB',190,'4','St Louis, Mo','Dakota College at Bottineau'),(220,'2/24/2020 21:01','REG','Garth Knittig',90,'6-1','DL',285,'3','Delisle, Sask','Saskatoon Hilltops'),(221,'2/24/2020 21:01','REG','Jacob Laboccetta',55,'6-1','LB',215,'3','Moose Jaw, Sask','Central Collegiate'),(222,'2/24/2020 21:01','REG','Tyler Lalonde',81,'5-10','REC',185,'1','Regina, Sask','Michael A Riffel HS'),(223,'2/24/2020 21:01','REG','Dawson Laye',89,'6-1','REC',160,'RS','Cochrane, Alta','Cochrane HS'),(224,'2/24/2020 21:01','REG','Liam Lerat',0,'5-10','DB',180,'5','Ottawa, Ont','St Mark Catholic HS'),(225,'2/24/2020 21:01','REG','Robbie Lowes',32,'6-1','LB',205,'4','Regina, Sask','Westshore Rebels'),(226,'2/24/2020 21:01','REG','Cameron Mah',3,'6-1','LB',210,'1','Vancouver, BC','Notre Dame Regional Secondary'),(227,'2/24/2020 21:01','REG','Justin Maser',46,'6-2','LB',215,'RS','Medicine Hat, Alta','Medicine Hat HS'),(228,'2/24/2020 21:01','REG','Ethan Mather',26,'6-1','DB',190,'RS','Lloydminster, Sask','Lloydminster Comprehensive HS'),(229,'2/24/2020 21:01','REG','Semba Mbasela',27,'5-7','RB',175,'2','Regina, Sask','Dr Martin LeBoldus HS'),(230,'2/24/2020 21:01','REG','Brandon McKimmon',92,'6-3','DL',255,'3','Warman, Sask','University of Saskatchewan'),(231,'2/24/2020 21:01','REG','Sam Mike',7,'5-11','REC',185,'4','Saskatoon, Sask','Saskatoon Hilltops'),(232,'2/24/2020 21:01','REG','Matt Moore',91,'6-1','DL',260,'3','Regina, Sask','Dr Martin LeBoldus HS'),(233,'2/24/2020 21:01','REG','Zach Moore',29,'6-1','DB',190,'3','Regina, Sask','Dr Martin LeBoldus HS'),(234,'2/24/2020 21:01','REG','Kyle Moortgat',86,'6-1','REC',185,'5','Cochrane, Alta','Cochrane HS'),(235,'2/24/2020 21:01','REG','Kyler Mosley',85,'5-11','REC',195,'4','Richmond, BC','Okanagan Sun'),(236,'2/24/2020 21:01','REG','Mason Novik',84,'5-10','REC',170,'RS','Regina, Sask','Sheldon-Williams Collegiate'),(237,'2/24/2020 21:01','REG','Bryden O\'Flaherty',13,'6-3','QB',180,'1','Calgary, Alta','Bishop O\'Byrne HS'),(238,'2/24/2020 21:01','REG','Odun Ogidan',43,'5-10','RB',205,'5','Winnipeg, Man','Winnipeg Rifles'),(239,'2/24/2020 21:01','REG','Cody Peters',50,'5-11','LB',210,'4','Saskatoon, Sask','Saskatoon Hilltops'),(240,'2/24/2020 21:01','REG','Matt Rivers',8,'6-1','REC',175,'RS','Regina, Sask','Campbell Collegiate'),(241,'2/24/2020 21:01','REG','Peyton Ryder',54,'5-8','LB',210,'1','Newport News, Va','Christchurch School'),(242,'2/24/2020 21:01','REG','Noah Sampson',25,'5-11','DB',185,'2','Pilot Butte, Sask','Greenall HS'),(243,'2/24/2020 21:01','REG','Ryan Schienbein',14,'5-10','REC',180,'5','Regina, Sask','Balfour Collegiate'),(244,'2/24/2020 21:01','REG','Daniel Scraper',80,'5-11','REC',170,'5','Regina, Sask','Dr Martin LeBoldus HS'),(245,'2/24/2020 21:01','REG','Paxton Seib',51,'6-1','DL',275,'2','Regina, Sask','Campbell Collegiate'),(246,'2/24/2020 21:01','REG','Travis Semenok',39,'5-11','LB',215,'4','Medicine Hat, Alta','Edmonton Wildcats'),(247,'2/24/2020 21:01','REG','Holden Serack',73,'6-2','OL',315,'RS','Saskatoon, Sask','Evan Hardy Collegiate'),(248,'2/24/2020 21:01','REG','Tanner Smith',48,'6-1','LB',200,'3','Regina, Sask','Regina Thunder'),(249,'2/24/2020 21:01','REG','Carson Sombach',28,'5-10','DB',175,'RS','Regina, Sask','Miller Comprehensive HS'),(250,'2/24/2020 21:01','REG','Jackson Sombach',36,'5-9','DB',175,'1','Regina, Sask','Miller Comprehensive HS'),(251,'2/24/2020 21:01','REG','Emmett Steadman',0,'5-11','REC',165,'RS','Regina, Sask','Miller Comprehensive HS'),(252,'2/24/2020 21:01','REG','Colin Stumborg',34,'6-1','TE',245,'5','Saskatoon, Sask','Saskatoon Hilltops'),(253,'2/24/2020 21:01','REG','Bennett Stusek',10,'5-11','REC',170,'2','Regina, Sask','Campbell Collegiate'),(254,'2/24/2020 21:01','REG','Haider Syed',71,'6-1','OL',265,'RS','Fullerton, Calif','Santa Ana College'),(255,'2/24/2020 21:01','REG','Connor Taylor',74,'6-4','OL',290,'RS','Medicine Hat, Alta','Medicine Hat HS'),(256,'2/24/2020 21:01','REG','Oluwafemi Tiemi',94,'6-5','DL',340,'1','Warri, Nigeria',''),(257,'2/24/2020 21:01','REG','Apete Tuiloma',60,'6-3','OL',255,'RS','North Battleford, Sask','North Battleford Comprehensive HS'),(258,'2/24/2020 21:01','REG','Luke Turner',69,'6-1','DL',255,'RS','Wood Mountain, Sask','Assiniboia Composite HS'),(259,'2/24/2020 21:01','REG','Brayden Vandermeer',66,'6-2','OL',280,'2','Airdrie, Alta','Calgary Colts'),(260,'2/24/2020 21:01','REG','Sam Varao',45,'6-1','RB',210,'5','Victoria, BC','Belmont Secondary'),(261,'2/24/2020 21:01','REG','Ryder Varga',56,'6-3','LB',225,'2','Regina, Sask','Dr Martin LeBoldus HS'),(262,'2/24/2020 21:01','REG','CJ Vincent',87,'6-2','REC',180,'RS','Moose Jaw, Sask','Central Collegiate'),(263,'2/24/2020 21:01','REG','Brayden Wagg',30,'5-10','LB',185,'3','Regina, Sask','Campbell Collegiate'),(264,'2/24/2020 21:01','REG','Derek Walde',61,'6-1','OL',300,'3','Kindersley, Sask','Kamloops Broncos'),(265,'2/24/2020 21:01','REG','Brayden Walz',68,'6-3','DL',295,'1','Calgary, Alta','Bishop O\'Byrne HS'),(266,'2/24/2020 21:01','REG','Josh White',44,'6-2','LB',190,'2','Regina, Sask','Campbell Collegiate'),(267,'2/24/2020 21:01','REG','Eric Wicijowski',96,'6-2','DL',285,'5','Regina, Sask','Dr Martin LeBoldus HS'),(268,'2/24/2020 21:01','REG','Braedy Will',20,'6-4','LB',215,'5','Winnipeg, Man','Winnipeg Rifles'),(269,'2/24/2020 21:01','REG','Javier Williams',9,'5-10','RB',205,'RS','Calgary, Alta','Notre Dame HS'),(270,'2/24/2020 21:01','REG','Payton Williams',40,'6-1','DB',180,'RS','Regina, Sask','Winston Knoll Collegiate'),(271,'2/24/2020 21:01','REG','Ivan Xu',79,'6-2','OL',260,'RS','Victoria, BC','Mount Douglas Secondary'),(272,'2/24/2020 21:01','REG','Dillon Zimmermann',37,'6-1','DB',175,'1','Regina, Sask','Dr Martin LeBoldus HS'),(278,'2020-02-24 22:48:58','CGY','string',0,'stri','string',0,'string','string','string'),(279,'2020-02-28 12:22:10','CGY','Ryan Holt',38,'6-0','QB',150,'3','Calgary','Coyotes'),(279,'2020-02-28 16:15:56','CGY','',0,'','',0,'','',''),(279,'2020-02-28 16:19:13','CGY','string',0,'6-0','string',0,'string','string','string'),(279,'2020-02-28 16:20:13','CGY','string',0,'6-0','string',0,'string','string','string'),(279,'2020-02-28 16:26:20','CGY','string',0,'6-0','string',0,'string','string','string'),(279,'2020-02-28 16:30:31','CGY','string',0,'6-0','string',0,'string','string','string'),(279,'2020-02-28 16:34:48','CGY','strdsfaing',0,'6-0','string',0,'string','string','string'),(279,'2020-02-28 16:35:02','CGY','strdsfaing',0,'6-0','string',0,'string','string','string'),(279,'2020-02-28 22:34:43','ALB','string',0,'6-0','string',0,'string','string','string'),(279,'2020-02-28 22:35:20','ALB','string',0,'6-0','string',0,'string','string','string');
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
  UNIQUE KEY `reviews_pk` (`issue_id`),
  UNIQUE KEY `reviews_pk_2` (`admin_username`),
  CONSTRAINT `reviews_admin_username_fk` FOREIGN KEY (`admin_username`) REFERENCES `admin` (`username`) ON UPDATE CASCADE,
  CONSTRAINT `reviews_issue_issue_id_fk` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`)
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
                                                IN permission_level int)
BEGIN
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `addClient`(IN username varchar(20), IN password varchar(20))
BEGIN
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
                                                              IN last_name varchar(45), IN position varchar(100))
BEGIN
    SET @v1 := (SELECT COUNT(1) FROM team WHERE team.team_code = team_code);
    IF @v1 THEN
        INSERT INTO coaching_staff VALUES (DEFAULT, team_code, first_name, last_name, position);
        SELECT * FROM coaching_staff WHERE coaching_staff.coaching_staff_id = LAST_INSERT_ID();
    END IF;
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
                                                 IN high_school_team varchar(60))
BEGIN
    SET @v1 := (SELECT COUNT(1) FROM team WHERE team.team_code = team_code);
    IF @v1 THEN
        INSERT INTO player
        VALUES (DEFAULT, current_timestamp(), team_code, player_name, jersey_number, height, position, weight, year,
                hometown, high_school_team);
        SELECT * FROM player WHERE player.player_id = LAST_INSERT_ID();
    END IF;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `addTeam`(IN team_code varchar(3), IN team_name varchar(45), IN hometown varchar(45),
                         IN mascot varchar(45), IN university varchar(45))
begin
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
   SELECT username FROM follows WHERE follows.player_id = player_id;
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
    SELECT * FROM issue;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIssuesByClientUsername`(IN client_username VARCHAR(20))
begin
    SELECT * FROM issue WHERE issue.client_username = client_username;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayerById`(IN player_id int)
begin
    SELECT *
    FROM player
    WHERE player.creation_date = (SELECT MAX(creation_date) FROM player WHERE player.player_id = player_id);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayerHistory`(IN player_id int)
begin
    SELECT * FROM player WHERE player.player_id = player_id ORDER BY creation_date;
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
    SELECT * FROM player;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlayersFollowedByClient`(IN username VARCHAR(20))
begin
    SELECT * FROM player WHERE player_id IN (SELECT player_id FROM follows WHERE follows.username = username);
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
/*!50003 DROP PROCEDURE IF EXISTS `updateAdminUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAdminUsername`(IN old_username varchar(20), IN password varchar(20),
                                                           IN permission_level int, IN new_username varchar(20))
BEGIN
    UPDATE admin
    SET admin.username = new_username
    WHERE admin.username = old_username
      AND admin.password = password
      AND admin.permission_level = permission_level;
    SELECT ROW_COUNT();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateClientUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateClientUsername`(IN old_username varchar(20), IN new_username varchar(20),
                                                            IN password varchar(20))
BEGIN
    UPDATE client
    SET client.username = new_username
    WHERE client.username = old_username
      AND client.password = password;
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
                                                        IN player_id int, OUT fail_msg varchar(100))
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

-- Dump completed on 2020-02-29  2:38:21
