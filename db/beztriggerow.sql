-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: sdbm
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.10-MariaDB

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `ID` varchar(36) NOT NULL DEFAULT '',
  `UserID` varchar(45) NOT NULL DEFAULT 'UUID',
  `Blogs` int(11) NOT NULL DEFAULT '0',
  `Comments` int(11) NOT NULL DEFAULT '0',
  `LastActivity` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES ('619317b4-a3ac-11e6-8bd5-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388',1,11,'2016-11-08 00:17:20'),('77ba6d5f-a3ac-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388',5,17,'2016-11-12 01:30:40'),('bcddb47f-a85a-11e6-b485-7429af9a3388','bcc780e9-a85a-11e6-b485-7429af9a3388',0,0,NULL),('fb4e4897-a3d6-11e6-8bd5-7429af9a3388','fb42b874-a3d6-11e6-8bd5-7429af9a3388',3,3,'2016-11-06 05:44:43');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `all_blog`
--

DROP TABLE IF EXISTS `all_blog`;
/*!50001 DROP VIEW IF EXISTS `all_blog`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all_blog` AS SELECT 
 1 AS `Title`,
 1 AS `Status`,
 1 AS `Login`,
 1 AS `Text`,
 1 AS `X_UpdateTime`,
 1 AS `X_RemoveTime`,
 1 AS `X_CreateUser`,
 1 AS `blogtext_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_comments`
--

DROP TABLE IF EXISTS `all_comments`;
/*!50001 DROP VIEW IF EXISTS `all_comments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all_comments` AS SELECT 
 1 AS `ID`,
 1 AS `BlogItemID`,
 1 AS `Author`,
 1 AS `Text`,
 1 AS `Time`,
 1 AS `Login`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!50001 DROP VIEW IF EXISTS `archive`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `archive` AS SELECT 
 1 AS `Title`,
 1 AS `Status`,
 1 AS `Login`,
 1 AS `Text`,
 1 AS `X_UpdateTime`,
 1 AS `X_RemoveTime`,
 1 AS `X_CreateUser`,
 1 AS `blogtext_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `blog_public`
--

DROP TABLE IF EXISTS `blog_public`;
/*!50001 DROP VIEW IF EXISTS `blog_public`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `blog_public` AS SELECT 
 1 AS `Title`,
 1 AS `Status`,
 1 AS `Login`,
 1 AS `Text`,
 1 AS `X_UpdateTime`,
 1 AS `X_RemoveTime`,
 1 AS `X_CreateUser`,
 1 AS `blogtext_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `blogcomment`
--

DROP TABLE IF EXISTS `blogcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogcomment` (
  `ID` varchar(36) NOT NULL,
  `BlogItemID` varchar(36) NOT NULL,
  `Author` varchar(36) NOT NULL,
  `Text` text NOT NULL,
  `X_CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_UpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_RemoveTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogcomment`
--

LOCK TABLES `blogcomment` WRITE;
/*!40000 ALTER TABLE `blogcomment` DISABLE KEYS */;
INSERT INTO `blogcomment` VALUES ('0034f2d9-a3cd-11e6-8bd5-7429af9a3388','0c85dd0b-a3a7-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','NOWY KOMENTARZ','2016-11-06 03:59:14','2016-11-06 03:59:14',NULL),('1e74be82-a3cf-11e6-8bd5-7429af9a3388','113b2523-a376-11e6-bfd4-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388','gggggggggggggggggg','2016-11-06 04:14:24','2016-11-06 04:14:24',NULL),('2c661b3b-a53c-11e6-9c9f-7429af9a3388','38774f1d-a3f3-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','High German galeipo &#34;companion&#34; and Gothic gahlaiba &#34;messmate&#34;. By 1303, the word referred to trade guilds. Usage of company to mean &#34;business association&#34; was first recorded in 1553,[citation needed] and the abbreviation &#34;co.&#34; dates from 1769.','2016-11-07 23:47:34','2016-11-07 23:47:34',NULL),('2ec5d0c9-a3ce-11e6-8bd5-7429af9a3388','8e3f656d-a3a7-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','n fluid mechanics, the Reynolds number (Re) is a dimensionless quantity that is used to help predict similar flow patterns in different fluid flow situations. The concept was introduced by George Gabriel Stokes in 1851,[2] but the Reynolds number is named after Osborne Reynolds (1842â€“1912), who popularized its use in 1883.[3][4] The Reynolds number is defined as the ratio of inertial forces to viscous forces and consequently quantifies the relative importance of these two types of forces for given flow conditions.[5] Reynolds numbers frequently arise when performing scaling of fluid dynamics problems, and as such can be used to determine dynamic similitude between two different cases of fluid ','2016-11-06 04:07:42','2016-11-06 04:07:42',NULL),('36b74b71-a866-11e6-b485-7429af9a3388','60360add-a3f3-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','the word referred to trade guilds. Usage of company to mean &#34;business association&#34; was first recorded in 1553,[citation needed] and the abbreviation &#34;co.&#34; dates from 1769.','2016-11-12 00:26:03','2016-11-12 00:26:03',NULL),('377583fc-a53e-11e6-9c9f-7429af9a3388','b25ca972-a52d-11e6-9c9f-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388','often known as a corporate group. When the company closes it may need a &#34;death certificate&#34; to avoid further legal obligations.','2016-11-08 00:02:11','2016-11-08 00:02:11',NULL),('394dd636-a52d-11e6-9c9f-7429af9a3388','326d8bc0-a52d-11e6-9c9f-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member','2016-11-07 22:00:33','2016-11-07 22:00:33',NULL),('3d52169d-a86f-11e6-b485-7429af9a3388','b25ca972-a52d-11e6-9c9f-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','taxation incurred as members perform (or fail) to discharge their duty within the publicly declared &#34;birth certificate&#34; or published policy. Because companies are legal persons, they also may associate and register themselves as companies â€“ often known as a corporate group. When the company closes it may need a &#34;death certificate&#34; to avoid further legal obligations.\r\nDodaj komentarz ','2016-11-12 01:30:40','2016-11-12 01:30:40',NULL),('4cb54933-a866-11e6-b485-7429af9a3388','29a44d0e-a3f3-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','Company members share a common purpose and unite in order to focus their various talents and organize their collectively available skills or resources to achieve specific, declared goals.','2016-11-12 00:26:40','2016-11-12 00:26:40',NULL),('546db8a4-a3ea-11e6-8bd5-7429af9a3388','c79d2650-a3e8-11e6-8bd5-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388','Nie masz racji kompletnie zajÄ…cu ty !!!!','2016-11-06 07:29:11','2016-11-06 07:29:11',NULL),('55076f2b-a540-11e6-9c9f-7429af9a3388','b25ca972-a52d-11e6-9c9f-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388','themselves as companies â€“ often known as a corporate group. When the company closes it may need a &#34;death certificate&#34; to avoid further legal obligations.','2016-11-08 00:17:20','2016-11-08 00:17:20',NULL),('6e298fbf-a53c-11e6-9c9f-7429af9a3388','46c7b07c-a3f3-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 23:49:24','2016-11-07 23:49:24',NULL),('796cd3b7-a52d-11e6-9c9f-7429af9a3388','326d8bc0-a52d-11e6-9c9f-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.\r\nA company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 22:02:21','2016-11-07 22:02:21',NULL),('8def6a81-a52d-11e6-9c9f-7429af9a3388','46c7b07c-a3f3-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 22:02:55','2016-11-07 22:02:55',NULL),('8f561510-a53c-11e6-9c9f-7429af9a3388','29a44d0e-a3f3-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','industrial enterprise. Company members share a common purpose and unite in order to focus their various talents and organize their collectively available skills or resources to achieve specific, declared goals.','2016-11-07 23:50:20','2016-11-07 23:50:20',NULL),('9a6a386b-a3d7-11e6-8bd5-7429af9a3388','42d32487-a389-11e6-8bd5-7429af9a3388','fb42b874-a3d6-11e6-8bd5-7429af9a3388','uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu','2016-11-06 05:15:08','2016-11-06 05:15:08',NULL),('9b8816f9-a52d-11e6-9c9f-7429af9a3388','46c7b07c-a3f3-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.\r\nA company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 22:03:18','2016-11-07 22:03:18',NULL),('b0e63ed0-a3d7-11e6-8bd5-7429af9a3388','13297ee5-a3d7-11e6-8bd5-7429af9a3388','fb42b874-a3d6-11e6-8bd5-7429af9a3388','uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu','2016-11-06 05:15:46','2016-11-06 05:15:46',NULL),('bc823c43-a3db-11e6-8bd5-7429af9a3388','b18000bb-a3db-11e6-8bd5-7429af9a3388','fb42b874-a3d6-11e6-8bd5-7429af9a3388','000000000000','2016-11-06 05:44:43','2016-11-06 05:44:43',NULL),('cfdc3f34-a53a-11e6-9c9f-7429af9a3388','326d8bc0-a52d-11e6-9c9f-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 23:37:49','2016-11-07 23:37:49',NULL),('d50aae44-a3e8-11e6-8bd5-7429af9a3388','c79d2650-a3e8-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','In practice, matching the Reynolds number is not on its own sufficient to guarantee similitude. Fluid flow is generally chaotic, and very small changes to shape and surface roughness can result in very different flows. Nevertheless, Reynolds numbers are a very important guide and are widely used','2016-11-06 07:18:28','2016-11-06 07:18:28',NULL),('e321b266-a3ce-11e6-8bd5-7429af9a3388','8e3f656d-a3a7-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','Gabriel Stokes in 1851,[2] but the Reynolds number is named after Osborne Reynolds (1842â€“1912), who popularized its use in 1883.[3][4] The Reynolds number is defined as the ratio of inertial forces to viscous forces and consequently quantifies the relative importance of these two types of forces for given flow conditions.[5] Reynolds numbers frequently arise when performing scaling of fluid dynamics problems, and as such can be used to determine dynamic similitude between two different cases of fluid flow. They are also used to characterize different flo','2016-11-06 04:12:45','2016-11-06 04:12:45',NULL),('e3454d1e-a3cd-11e6-8bd5-7429af9a3388','0c85dd0b-a3a7-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww','2016-11-06 04:05:35','2016-11-06 04:05:35',NULL),('e3c696b5-a53a-11e6-9c9f-7429af9a3388','326d8bc0-a52d-11e6-9c9f-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 23:38:22','2016-11-07 23:38:22',NULL),('ecaea11b-a52d-11e6-9c9f-7429af9a3388','326d8bc0-a52d-11e6-9c9f-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 22:05:34','2016-11-07 22:05:34',NULL),('f295aa6f-a52c-11e6-9c9f-7429af9a3388','46c7b07c-a3f3-11e6-8bd5-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 21:58:34','2016-11-07 21:58:34',NULL),('f4ff94e3-a3cc-11e6-8bd5-7429af9a3388','8e3f656d-a3a7-11e6-8bd5-7429af9a3388','d409a12c-a355-11e6-9727-7429af9a3388','PPPPPPPPPPPPPPPPPPPPPPPPPPPPP','2016-11-06 03:58:56','2016-11-06 03:58:56',NULL),('fee39dcf-a52c-11e6-9c9f-7429af9a3388','46c7b07c-a3f3-11e6-8bd5-7429af9a3388','8bbd23af-a354-11e6-9727-7429af9a3388','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.','2016-11-07 21:58:55','2016-11-07 21:58:55',NULL);
/*!40000 ALTER TABLE `blogcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogtext`
--

DROP TABLE IF EXISTS `blogtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogtext` (
  `ID` varchar(36) NOT NULL,
  `Title` text NOT NULL,
  `Text` longtext NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `X_CreateUser` varchar(36) DEFAULT NULL,
  `X_CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_UpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_RemoveTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogtext`
--

LOCK TABLES `blogtext` WRITE;
/*!40000 ALTER TABLE `blogtext` DISABLE KEYS */;
INSERT INTO `blogtext` VALUES ('29a44d0e-a3f3-11e6-8bd5-7429af9a3388','The Company','A Company is a legal entity made up of an association of persons, be they natural, legal, or a mixture of both, for carrying on a commercial or industrial enterprise. Company members share a common purpose and unite in order to focus their various talents and organize their collectively available skills or resources to achieve specific, declared goals.',1,'d409a12c-a355-11e6-9727-7429af9a3388','2016-11-06 08:32:25','2016-11-06 08:32:25',NULL),('326d8bc0-a52d-11e6-9c9f-7429af9a3388','A company can be defined ....','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.',1,'d409a12c-a355-11e6-9727-7429af9a3388','2016-11-07 22:00:21','2016-11-07 22:00:21','2016-11-08 00:37:14'),('38774f1d-a3f3-11e6-8bd5-7429af9a3388',' Companies take various forms',' Companies take various forms such as:\r\n\r\n    Voluntary associations which may include nonprofit organization\r\n    A group of soldiers\r\n    Business entities with an aim of gaining a profit\r\n    Financial entities and banks\r\n\r\nA company or association of persons can be created at law as legal person so that the company in itself can accept limited liability for civil responsibility and taxation incurred as members perform (or fail) to discharge their duty within the publicly declared &#34;birth certificate&#34; or published policy.\r\n\r\nBecause companies are legal persons, they also may associate and register themselves as companies â€“ often known as a corporate group. When the company closes it may need a &#34;death certificate&#34; to avoid further legal obligations.',1,'d409a12c-a355-11e6-9727-7429af9a3388','2016-11-06 08:32:50','2016-11-06 08:32:50','2016-11-12 00:36:15'),('46c7b07c-a3f3-11e6-8bd5-7429af9a3388','Meanings and definitions','A company can be defined as an &#34;artificial person&#34;, invisible, intangible, created by or under law, with a discrete legal personality, perpetual succession, and a common seal.[citation needed] It is not affected by the death, insanity, or insolvency of an individual member.',1,'d409a12c-a355-11e6-9727-7429af9a3388','2016-11-06 08:33:14','2016-11-06 08:33:14','2016-11-08 00:37:32'),('60360add-a3f3-11e6-8bd5-7429af9a3388','Etymology','The English word company has its origins in the Old French military term compaignie (first recorded in 1150), meaning a &#34;body of soldiers&#34;,[1] and originally from the Late Latin word companio &#34;companion, one who eats bread [pane] with you&#34;, first attested in the Lex Salica as a calque of the Germanic expression *gahlaibo (literally, &#34;with bread&#34;), related to Old High German galeipo &#34;companion&#34; and Gothic gahlaiba &#34;messmate&#34;. By 1303, the word referred to trade guilds. Usage of company to mean &#34;business association&#34; was first recorded in 1553,[citation needed] and the abbreviation &#34;co.&#34; dates from 1769.',1,'d409a12c-a355-11e6-9727-7429af9a3388','2016-11-06 08:33:56','2016-11-06 08:33:56',NULL),('b25ca972-a52d-11e6-9c9f-7429af9a3388','The English word company','Companies take various forms such as: Voluntary associations which may include nonprofit organization A group of soldiers Business entities with an aim of gaining a profit Financial entities and banks A company or association of persons can be created at law as legal person so that the company in itself can accept limited liability for civil responsibility and taxation incurred as members perform (or fail) to discharge their duty within the publicly declared &#34;birth certificate&#34; or published policy. Because companies are legal persons, they also may associate and register themselves as companies â€“ often known as a corporate group. When the company closes it may need a &#34;death certificate&#34; to avoid further legal obligations.',1,'8bbd23af-a354-11e6-9727-7429af9a3388','2016-11-07 22:03:56','2016-11-07 22:03:56',NULL);
/*!40000 ALTER TABLE `blogtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `show_user`
--

DROP TABLE IF EXISTS `show_user`;
/*!50001 DROP VIEW IF EXISTS `show_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `show_user` AS SELECT 
 1 AS `ID`,
 1 AS `Login`,
 1 AS `Pass`,
 1 AS `IsAdmin`,
 1 AS `IsBlocked`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` varchar(36) NOT NULL,
  `Login` varchar(10) NOT NULL,
  `Email` tinytext,
  `Pass` tinytext NOT NULL,
  `X_CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `IsBlocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Login_UNIQUE` (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('8bbd23af-a354-11e6-9727-7429af9a3388','Test',NULL,'369591a5366339605ad6a55ebeaaed1c2e456ba7a90af502cefff3835ebaada68f5c39e1d292be843e950394e1c51db9da64ada3d0d046b3ef8ad86c1c61f63f','2016-11-05 13:36:59',0,0),('bcc780e9-a85a-11e6-b485-7429af9a3388','Kowalski_M','kowal@wp.pl','9b470331da91ed4a28419de70a05716ff6c23c1b6566a1d8c1caa481a723a91ccbe94e3b32886b366aa3206bf25acf001180d66c092781e80e976b95fc7443ec','2016-11-11 23:03:54',0,0),('d409a12c-a355-11e6-9727-7429af9a3388','Mamut',NULL,'f2205410f86effed285f186b120cf89601bb3f35e410e4292082d724b2ae161eca7837a20d5b5d72b837881ab0f7ac1cc363ef974abdddc703da3b616ad00b57','2016-11-05 13:46:10',1,0),('fb42b874-a3d6-11e6-8bd5-7429af9a3388','MAMI',NULL,'d2e30b5b896ff28d7ce4008548886bb4615e6de1457d74fc7da9316f4cf9c2b7135dfa12c88189ec8673d48fd42254392dd74fff094f9c99af60df0c010592bc','2016-11-06 05:10:41',0,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_blog`
--

/*!50001 DROP VIEW IF EXISTS `all_blog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_blog` AS select `blogtext`.`Title` AS `Title`,`blogtext`.`Status` AS `Status`,`user`.`Login` AS `Login`,`blogtext`.`Text` AS `Text`,`blogtext`.`X_UpdateTime` AS `X_UpdateTime`,`blogtext`.`X_RemoveTime` AS `X_RemoveTime`,`blogtext`.`X_CreateUser` AS `X_CreateUser`,`blogtext`.`ID` AS `blogtext_id` from (`blogtext` join `user` on((`blogtext`.`X_CreateUser` = `user`.`ID`))) where isnull(`blogtext`.`X_RemoveTime`) order by `blogtext`.`X_UpdateTime` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_comments`
--

/*!50001 DROP VIEW IF EXISTS `all_comments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_comments` AS select `blogcomment`.`ID` AS `ID`,`blogcomment`.`BlogItemID` AS `BlogItemID`,`blogcomment`.`Author` AS `Author`,`blogcomment`.`Text` AS `Text`,`blogcomment`.`X_CreateTime` AS `Time`,`user`.`Login` AS `Login` from (`blogcomment` join `user` on((`blogcomment`.`Author` = `user`.`ID`))) order by `blogcomment`.`X_CreateTime` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `archive`
--

/*!50001 DROP VIEW IF EXISTS `archive`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `archive` AS select `blogtext`.`Title` AS `Title`,`blogtext`.`Status` AS `Status`,`user`.`Login` AS `Login`,`blogtext`.`Text` AS `Text`,`blogtext`.`X_UpdateTime` AS `X_UpdateTime`,`blogtext`.`X_RemoveTime` AS `X_RemoveTime`,`blogtext`.`X_CreateUser` AS `X_CreateUser`,`blogtext`.`ID` AS `blogtext_id` from (`blogtext` join `user` on((`blogtext`.`X_CreateUser` = `user`.`ID`))) where (`blogtext`.`X_RemoveTime` is not null) order by `blogtext`.`Status` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `blog_public`
--

/*!50001 DROP VIEW IF EXISTS `blog_public`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `blog_public` AS select `all_blog`.`Title` AS `Title`,`all_blog`.`Status` AS `Status`,`all_blog`.`Login` AS `Login`,`all_blog`.`Text` AS `Text`,`all_blog`.`X_UpdateTime` AS `X_UpdateTime`,`all_blog`.`X_RemoveTime` AS `X_RemoveTime`,`all_blog`.`X_CreateUser` AS `X_CreateUser`,`all_blog`.`blogtext_id` AS `blogtext_id` from `all_blog` where (`all_blog`.`Status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_user`
--

/*!50001 DROP VIEW IF EXISTS `show_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_user` AS select `user`.`ID` AS `ID`,`user`.`Login` AS `Login`,`user`.`Pass` AS `Pass`,`user`.`IsAdmin` AS `IsAdmin`,`user`.`IsBlocked` AS `IsBlocked` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-12  4:22:18
