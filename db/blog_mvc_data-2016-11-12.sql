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
  `UserID` varchar(36) NOT NULL,
  `Blogs` int(11) NOT NULL DEFAULT '0',
  `Comments` int(11) NOT NULL DEFAULT '0',
  `LastActivity` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`UserID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_activity_user_idx` (`UserID`),
  CONSTRAINT `fk_activity_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogcomment`
--

DROP TABLE IF EXISTS `blogcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogcomment` (
  `ID` varchar(36) NOT NULL,
  `Author` varchar(36) NOT NULL,
  `BlogItemID` varchar(36) NOT NULL,
  `Text` text NOT NULL,
  `X_CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_UpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_RemoveTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`Author`,`BlogItemID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_blogcomment_user1_idx` (`Author`),
  KEY `fk_blogcomment_blogtext1_idx` (`BlogItemID`),
  CONSTRAINT `fk_blogcomment_blogtext1` FOREIGN KEY (`BlogItemID`) REFERENCES `blogtext` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_blogcomment_user1` FOREIGN KEY (`Author`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogcomment`
--

LOCK TABLES `blogcomment` WRITE;
/*!40000 ALTER TABLE `blogcomment` DISABLE KEYS */;
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
  `UserID` varchar(36) NOT NULL,
  `Title` text NOT NULL,
  `Text` longtext NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `X_CreateUser` varchar(36) DEFAULT NULL,
  `X_CreateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_UpdateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_RemoveTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`UserID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_blogtext_user1_idx` (`UserID`),
  CONSTRAINT `fk_blogtext_user1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=cp1250;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogtext`
--

LOCK TABLES `blogtext` WRITE;
/*!40000 ALTER TABLE `blogtext` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogtext` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-12 18:49:30
