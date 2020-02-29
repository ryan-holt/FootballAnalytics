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
  PRIMARY KEY (`issue_id`),
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

-- Dump completed on 2020-02-29  1:04:39
