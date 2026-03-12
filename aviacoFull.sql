CREATE DATABASE  IF NOT EXISTS `aviaco` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aviaco`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: aviaco
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `AC_NUMBER` varchar(5) NOT NULL,
  `MOD_CODE` varchar(10) DEFAULT NULL,
  `AC_TTAF` decimal(8,2) DEFAULT NULL,
  `AC_TTEL` decimal(8,2) DEFAULT NULL,
  `AC_TTER` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`AC_NUMBER`),
  KEY `FAC_Model_idx` (`MOD_CODE`),
  CONSTRAINT `FAC_MODEL` FOREIGN KEY (`MOD_CODE`) REFERENCES `model` (`MOD_CODE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('1484P','PA23-250',1833.10,1833.10,101.80),('2289L','C-90A',4243.80,768.90,1123.40),('2778V','PA31-350',7992.90,1513.10,789.50),('4278Y','PA31-350',2147.30,622.10,243.20);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charter`
--

DROP TABLE IF EXISTS `charter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charter` (
  `CHAR_TRIP` int NOT NULL,
  `CHAR_DATE` datetime DEFAULT NULL,
  `CHAR_PILOT` int DEFAULT NULL,
  `CHAR_COPILOT` int DEFAULT NULL,
  `AC_NUMBER` varchar(5) DEFAULT NULL,
  `CHAR_DESTINATION` varchar(3) DEFAULT NULL,
  `CHAR_DISTANCE` decimal(8,2) DEFAULT NULL,
  `CHAR_HOURS_FLOWN` decimal(8,2) DEFAULT NULL,
  `CHAR_HOURS_WAIT` decimal(8,2) DEFAULT NULL,
  `CHAR_FUEL_GALLONS` decimal(8,2) DEFAULT NULL,
  `CHAR_OIL_QTS` int DEFAULT NULL,
  `CUS_CODE` int DEFAULT NULL,
  PRIMARY KEY (`CHAR_TRIP`),
  KEY `FCHAR_AC_idx` (`AC_NUMBER`),
  KEY `FCHAR_CUS_idx` (`CUS_CODE`),
  KEY `FCHAR_PIL_idx` (`CHAR_PILOT`),
  KEY `FCHAR_COPIL_idx` (`CHAR_COPILOT`),
  CONSTRAINT `FCHAR_AC` FOREIGN KEY (`AC_NUMBER`) REFERENCES `aircraft` (`AC_NUMBER`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FCHAR_COPIL` FOREIGN KEY (`CHAR_COPILOT`) REFERENCES `employee` (`EMP_NUM`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FCHAR_CUS` FOREIGN KEY (`CUS_CODE`) REFERENCES `customer` (`CUS_CODE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FCHAR_PIL` FOREIGN KEY (`CHAR_PILOT`) REFERENCES `pilot` (`EMP_NUM`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charter`
--

LOCK TABLES `charter` WRITE;
/*!40000 ALTER TABLE `charter` DISABLE KEYS */;
INSERT INTO `charter` VALUES (10001,'2018-02-05 00:00:00',104,NULL,'2289L','ATL',936.00,5.10,2.20,354.10,1,10011),(10002,'2018-02-05 00:00:00',101,NULL,'2778V','BNA',320.00,1.60,0.00,72.60,0,10016),(10003,'2018-02-05 00:00:00',105,109,'4278Y','GNV',1574.00,7.80,0.00,339.80,2,10014),(10004,'2018-02-06 00:00:00',106,NULL,'1484P','STL',472.00,2.90,4.90,97.20,1,10019),(10005,'2018-02-06 00:00:00',101,NULL,'2289L','ATL',1023.00,5.70,3.50,397.70,2,10011),(10006,'2018-02-06 00:00:00',109,NULL,'4278Y','STL',472.00,2.60,5.20,117.10,0,10017),(10007,'2018-02-06 00:00:00',104,105,'2778V','GNV',1574.00,7.90,0.00,348.40,2,10012),(10008,'2018-02-07 00:00:00',106,NULL,'1484P','TYS',644.00,4.10,0.00,140.60,1,10014),(10009,'2018-02-07 00:00:00',105,NULL,'2289L','GNV',1574.00,6.60,23.40,459.90,0,10017),(10010,'2018-02-07 00:00:00',109,NULL,'4278Y','ATL',998.00,6.20,3.20,279.70,0,10016),(10011,'2018-02-07 00:00:00',101,104,'1484P','BNA',352.00,1.90,5.30,66.40,1,10012),(10012,'2018-02-08 00:00:00',101,NULL,'2778V','MOB',884.00,4.80,4.20,215.10,0,10010),(10013,'2018-02-08 00:00:00',105,NULL,'4278Y','TYS',644.00,3.90,4.50,174.30,1,10011),(10014,'2018-02-09 00:00:00',106,NULL,'4278Y','ATL',936.00,6.10,2.10,302.60,0,10017),(10015,'2018-02-09 00:00:00',104,101,'2289L','GNV',1645.00,6.70,0.00,459.50,2,10016),(10016,'2018-02-09 00:00:00',109,105,'2778V','MQY',312.00,1.50,0.00,67.20,0,10011),(10017,'2018-02-10 00:00:00',101,NULL,'1484P','STL',508.00,3.10,0.00,105.50,0,10014),(10018,'2018-02-10 00:00:00',105,104,'4278Y','TYS',644.00,3.80,4.50,167.40,0,10017);
/*!40000 ALTER TABLE `charter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charter_fact`
--

DROP TABLE IF EXISTS `charter_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charter_fact` (
  `CHAR_TRIP` int NOT NULL,
  `TIME_ID` int NOT NULL,
  `EMP_NUM` int NOT NULL,
  `MOD_CODE` varchar(10) NOT NULL,
  `HOURS_FLOWN` decimal(8,2) NOT NULL,
  `FUEL_GALLONS` decimal(8,2) NOT NULL,
  `REVENUE` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CHAR_TRIP`),
  KEY `FFACT_TIME_idx` (`TIME_ID`),
  KEY `FFACT_EMP_idx` (`EMP_NUM`),
  KEY `FFACT_MOD_idx` (`MOD_CODE`),
  CONSTRAINT `FFACT_CHAR` FOREIGN KEY (`CHAR_TRIP`) REFERENCES `charter` (`CHAR_TRIP`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FFACT_EMP` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FFACT_MOD` FOREIGN KEY (`MOD_CODE`) REFERENCES `model` (`MOD_CODE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FFACT_TIME` FOREIGN KEY (`TIME_ID`) REFERENCES `time_dim` (`TIME_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charter_fact`
--

LOCK TABLES `charter_fact` WRITE;
/*!40000 ALTER TABLE `charter_fact` DISABLE KEYS */;
INSERT INTO `charter_fact` VALUES (10001,1,104,'C-90A',5.10,354.10,15.30),(10002,1,101,'PA31-350',1.60,72.60,3.20),(10003,1,105,'PA31-350',7.80,339.80,15.60),(10004,1,106,'PA23-250',2.90,97.20,5.80),(10005,1,101,'C-90A',5.70,397.70,17.10),(10006,1,109,'PA31-350',2.60,117.10,5.20),(10007,1,104,'PA31-350',7.90,348.40,15.80),(10008,1,106,'PA23-250',4.10,140.60,8.20),(10009,1,105,'C-90A',6.60,459.90,19.80),(10010,1,109,'PA31-350',6.20,279.70,12.40),(10011,1,101,'PA23-250',1.90,66.40,3.80),(10012,1,101,'PA31-350',4.80,215.10,9.60),(10013,1,105,'PA31-350',3.90,174.30,7.80),(10014,1,106,'PA31-350',6.10,302.60,12.20),(10015,1,104,'C-90A',6.70,459.50,20.10),(10016,1,109,'PA31-350',1.50,67.20,3.00),(10017,1,101,'PA23-250',3.10,105.50,6.20),(10018,1,105,'PA31-350',3.80,167.40,7.60);
/*!40000 ALTER TABLE `charter_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew` (
  `CHAR_TRIP` int NOT NULL,
  `EMP_NUM` int NOT NULL,
  PRIMARY KEY (`EMP_NUM`,`CHAR_TRIP`),
  KEY `FCREW_CHAR_idx` (`CHAR_TRIP`),
  CONSTRAINT `FCREW_CHAR` FOREIGN KEY (`CHAR_TRIP`) REFERENCES `charter` (`CHAR_TRIP`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FCREW_EMP` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew`
--

LOCK TABLES `crew` WRITE;
/*!40000 ALTER TABLE `crew` DISABLE KEYS */;
/*!40000 ALTER TABLE `crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CUS_CODE` int NOT NULL,
  `CUS_LNAME` varchar(15) DEFAULT NULL,
  `CUS_FNAME` varchar(15) DEFAULT NULL,
  `CUS_INITIAL` varchar(1) DEFAULT NULL,
  `CUS_AREACODE` varchar(3) DEFAULT NULL,
  `CUS_PHONE` varchar(8) DEFAULT NULL,
  `CUS_BALANCE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`CUS_CODE`),
  UNIQUE KEY `CUS_CODE_UNIQUE` (`CUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10010,'Ramas','Alfred','A','615','844-2573',0),(10011,'Dunne','Leona','K','713','894-1238',0),(10012,'Smith','Kathy','W','615','894-2285',897),(10013,'Olowski','Paul','F','615','894-2180',1285),(10014,'Orlando','Myron','','615','222-1672',673),(10015,'O\'Brian','Amy','B','713','442-3381',1015),(10016,'Brown','James','G','615','297-1228',0),(10017,'Williams','George','','615','290-2556',0),(10018,'Farriss','Anne','G','713','382-7185',0),(10019,'Smith','Olette','K','615','297-3809',454);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EMP_NUM` int NOT NULL,
  `EMP_TITLE` varchar(4) DEFAULT NULL,
  `EMP_LNAME` varchar(15) DEFAULT NULL,
  `EMP_FNAME` varchar(15) DEFAULT NULL,
  `EMP_INITIAL` varchar(1) DEFAULT NULL,
  `EMP_DOB` datetime DEFAULT NULL,
  `EMP_HIRE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`),
  UNIQUE KEY `EMP_NUM_UNIQUE` (`EMP_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'Mr.','Kolmycz','George','D','1962-06-15 00:00:00','2008-03-15 00:00:00'),(101,'Ms.','Lewis','Rhonda','G','1985-03-19 00:00:00','2006-04-25 00:00:00'),(102,'Mr.','VanDam','Rhett','','1978-11-14 00:00:00','2013-05-18 00:00:00'),(103,'Ms.','Jones','Anne','M','1994-05-11 00:00:00','2017-07-26 00:00:00'),(104,'Mr.','Lange','John','P','1991-07-12 00:00:00','2010-08-20 00:00:00'),(105,'Mr.','Williams','Robert','D','1995-03-14 00:00:00','2017-06-19 00:00:00'),(106,'Mrs.','Duzak','Jeanine','K','1988-02-12 00:00:00','2018-03-13 00:00:00'),(107,'Mr.','Diante','Jorge','D','1995-05-01 00:00:00','2016-07-02 00:00:00'),(108,'Mr.','Wiesenbach','Paul','R','1986-02-14 00:00:00','2013-06-03 00:00:00'),(109,'Ms.','Travis','Elizabeth','K','1981-06-18 00:00:00','2016-02-14 00:00:00'),(110,'Mrs.','Genkazi','Leighla','W','1990-05-19 00:00:00','2010-06-29 00:00:00');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `MOD_CODE` varchar(10) NOT NULL,
  `MOD_MANUFACTURER` varchar(15) DEFAULT NULL,
  `MOD_NAME` varchar(20) DEFAULT NULL,
  `MOD_SEATS` decimal(8,2) DEFAULT NULL,
  `MOD_CHG_MILE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`MOD_CODE`),
  UNIQUE KEY `MOD_CODE_UNIQUE` (`MOD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES ('B200','Beechcraft','Super KingAir',10.00,2),('C-90A','Beechcraft','KingAir',8.00,3),('PA23-250','Piper','Aztec',6.00,2),('PA31-350','Piper','Navajo Chieftain',10.00,2);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot` (
  `EMP_NUM` int NOT NULL,
  `PIL_LICENSE` varchar(25) DEFAULT NULL,
  `PIL_RATINGS` varchar(30) DEFAULT NULL,
  `PIL_MED_TYPE` varchar(1) DEFAULT NULL,
  `PIL_MED_DATE` datetime DEFAULT NULL,
  `PIL_PT135_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`),
  CONSTRAINT `FPIL_EMP` FOREIGN KEY (`EMP_NUM`) REFERENCES `employee` (`EMP_NUM`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
INSERT INTO `pilot` VALUES (101,'ATP','ATP/SEL/MEL/Instr/CFII','1','2018-01-20 00:00:00','2018-01-11 00:00:00'),(104,'ATP','ATP/SEL/MEL/Instr','1','2017-12-18 00:00:00','2018-01-17 00:00:00'),(105,'COM','COMM/SEL/MEL/Instr/CFI','2','2018-01-05 00:00:00','2018-01-02 00:00:00'),(106,'COM','COMM/SEL/MEL/Instr','2','2017-12-10 00:00:00','2018-02-02 00:00:00'),(109,'COM','ATP/SEL/MEL/SES/Instr/CFII','1','2018-01-22 00:00:00','2018-01-15 00:00:00');
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_dim`
--

DROP TABLE IF EXISTS `time_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_dim` (
  `TIME_ID` int NOT NULL AUTO_INCREMENT,
  `YEAR` int NOT NULL,
  `MONTH` int NOT NULL,
  PRIMARY KEY (`TIME_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_dim`
--

LOCK TABLES `time_dim` WRITE;
/*!40000 ALTER TABLE `time_dim` DISABLE KEYS */;
INSERT INTO `time_dim` VALUES (1,2018,2);
/*!40000 ALTER TABLE `time_dim` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-09 11:48:22
