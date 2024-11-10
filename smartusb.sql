-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: smart_usb
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `location` varchar(255) NOT NULL,
  `test_id` bigint DEFAULT NULL,
  `ended` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcyg30qef0he27297kude7lcfc` (`test_id`),
  CONSTRAINT `FKcyg30qef0he27297kude7lcfc` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'2024-11-09 10:58:16.198521','1111',1,'2024-11-09 10:58:33.269505');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_attempt`
--

DROP TABLE IF EXISTS `exam_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_attempt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `grade` int NOT NULL,
  `is_valid` bit(1) NOT NULL,
  `mac_address` varchar(255) NOT NULL,
  `plagiarism_percent` double NOT NULL,
  `exam_id` bigint DEFAULT NULL,
  `student_id` bigint DEFAULT NULL,
  `submitted_file_name` varchar(255) DEFAULT NULL,
  `submission_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn1sj3wwcaqpmn5t43fukvnpwv` (`exam_id`),
  KEY `FK6e4lthx8p1mhfyt84hoo5hmjh` (`student_id`),
  CONSTRAINT `FK6e4lthx8p1mhfyt84hoo5hmjh` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKn1sj3wwcaqpmn5t43fukvnpwv` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_attempt`
--

LOCK TABLES `exam_attempt` WRITE;
/*!40000 ALTER TABLE `exam_attempt` DISABLE KEYS */;
INSERT INTO `exam_attempt` VALUES (1,0,_binary '\0','1212121212',0,1,1,'program.c','program.c_20241110_014816'),(2,0,_binary '\0','33333333',0,1,2,'wifi_handler.c','2222_20241110_094505');
/*!40000 ALTER TABLE `exam_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_attempt_detail`
--

DROP TABLE IF EXISTS `exam_attempt_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_attempt_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `screenshot_name` varchar(255) NOT NULL,
  `exam_attempt_id` bigint DEFAULT NULL,
  `process_list` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhg84beplkyrdav1f1nswgvy76` (`exam_attempt_id`),
  CONSTRAINT `FKhg84beplkyrdav1f1nswgvy76` FOREIGN KEY (`exam_attempt_id`) REFERENCES `exam_attempt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_attempt_detail`
--

LOCK TABLES `exam_attempt_detail` WRITE;
/*!40000 ALTER TABLE `exam_attempt_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_attempt_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `professor_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'pera@pera.com','string','string','$2a$10$dOkDA..7rI78hLYJAWrDQObcFeWTkBsc/AwBCX4X3EOrW.Ez0gFDK');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lh7am6sc9pv0nhyg7qkj7w5d3` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Zika','Zikic','1122'),(2,'Mika','Mikic','2222');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklist_processes_file_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` int NOT NULL,
  `group_one_test_file_name` varchar(255) NOT NULL,
  `group_two_test_file_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `professor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_18q20ny1toqd1kan3xjoeawtq` (`title`),
  KEY `FK6f0wm02t72dlhr48ecbapb18i` (`professor_id`),
  CONSTRAINT `FK6f0wm02t72dlhr48ecbapb18i` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'blacklist.txt','dsdsd',123,'asdasd.zip','asasd.zip','asdasd',1),(2,'fgh.txt','fgh',555,'dfgdfg.zip','dfgdfg.zip','dfgdfg',1),(3,'eee','hhhehe',11,'hhhhh','eee','asdasdadas',1),(6,'eee','hhhehe',11,'hhhhh','eee','asdasdadas1',1);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-10 13:23:54
