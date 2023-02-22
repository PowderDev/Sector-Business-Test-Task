-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Token`
--

DROP TABLE IF EXISTS `Token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `refreshToken` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Token_refreshToken_key` (`refreshToken`),
  KEY `Token_userId_fkey` (`userId`),
  CONSTRAINT `Token_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Token`
--

LOCK TABLES `Token` WRITE;
/*!40000 ALTER TABLE `Token` DISABLE KEYS */;
INSERT INTO `Token` VALUES (1,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjc3MDAxNTc2LCJleHAiOjE2Nzk1OTM1NzZ9.TEttfNH7jv839YKW-VFG7vayjBP0MPN_oaqQCi0yzTQ'),(2,2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjc3MDAyMTg1LCJleHAiOjE2Nzk1OTQxODV9.jkUJcO4hbjTk8opehyC0FU0h5DYsZ5OD1CpEhF1Cucc'),(3,3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNjc3MDAyMjkwLCJleHAiOjE2Nzk1OTQyOTB9.p7wdjkvpHuVsQh5StmVzwz8AchaHTOqtwtwxHXYQ7yE'),(4,4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNjc3MDAyNDY3LCJleHAiOjE2Nzk1OTQ0Njd9.dOBEewMp64Sd11lwpT8N_tH--KtvLnwAqXR357SR7_A'),(5,5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjc3MDY4NzEzLCJleHAiOjE2Nzk2NjA3MTN9.TMuL04ZMfQm0Ph26ITUkLxNTsC-REPRsqKYbxfZ-gVE');
/*!40000 ALTER TABLE `Token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('MALE','FIMALE') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'test@gmail.com','$2a$04$mIU0ZM09xekq5f.gtqSziOZCKtZhTLTxiH1eXJQP732O.lV7N5Fhq','jirar',NULL,'MALE','/upload/1.eed3aa5a1e706.png','2023-02-21 17:46:16.785'),(2,'test2@gmail.com','$2a$04$tXX144QwhuebJl9g3NW1Teb6i1IjbE9epW5v433DeZi208XwxyYDq','jira',NULL,NULL,NULL,'2023-02-21 17:56:25.305'),(3,'test3@gmail.com','$2a$04$1klVwmF8hxUgWi7u.zQQ3.dE4VQ1qntxIhzpUg2BxZqq3I6mo/h4y','jira',NULL,NULL,NULL,'2023-02-21 17:58:10.827'),(4,'test4@gmail.com','$2a$04$5xA.BnVOGOZXY3s2y0sNme2PAhSzf3lVxXey0eoikm0F2kVSKtqbG','jira',NULL,NULL,NULL,'2023-02-21 18:01:07.437'),(5,'test5@gmail.com','$2a$04$9R8Sw1FfSSsZJ0wh6UdBX.kCS2Nk3ATIh8B3XVQMnGI7RaLSdzYA.','jira',NULL,NULL,NULL,'2023-02-21 18:05:04.942');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('4bdfddfb-d21b-437c-bc0c-8290929e1424','b72333b26767ee7cf828101bfa52ed1de42acd47b6ec887b1a1216b16e978ef4','2023-02-21 16:17:47.786','20230221161747_mark_refresh_token_as_unique',NULL,NULL,'2023-02-21 16:17:47.747',1),('71d69262-8179-422c-bbbb-be0a747caae2','cd5627bd92838ffd1e48b20020f4a6b2d1ce48dafef522353911606f8d978792','2023-02-21 16:22:26.560','20230221162226_make_user_created_at_as_auto_timestamp',NULL,NULL,'2023-02-21 16:22:26.170',1),('9ca3095a-46d7-41db-8d45-8bf3e45df341','59f51bc8ff34a456eb8230624f04bdfafcf52fe05522b50cad519bb1c9066abc','2023-02-21 16:02:26.600','20230221160226_initial',NULL,NULL,'2023-02-21 16:02:26.477',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-22 15:48:14
