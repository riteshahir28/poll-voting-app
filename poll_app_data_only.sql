-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: Poll_app
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (4,2,'yes'),(5,2,'no'),(6,3,'java'),(7,3,'c++'),(8,4,'PlateForm Dependent'),(9,4,'PlateForm Independen'),(10,4,'Both'),(11,5,'a'),(12,5,'c'),(13,5,'s'),(14,6,'a'),(15,6,'d'),(16,6,'g'),(17,6,'s'),(18,7,'a'),(19,7,'d'),(20,7,'h'),(21,8,'a'),(22,8,'d'),(23,8,'h'),(24,9,'yes'),(25,9,'no'),(26,10,'yes'),(27,10,'no'),(28,11,'yes'),(29,11,'no'),(30,12,'yes'),(31,12,'no');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
INSERT INTO `polls` VALUES (2,'hello hr how are your ritesh','2025-07-17 10:32:00','closed'),(3,'which fav language','2025-07-11 11:17:00','open'),(4,'what is ____ language','2025-07-08 14:39:00','open'),(5,'hello hr how are your','2025-07-11 14:43:00','open'),(6,'hello hr how are youasdjfajsdhf','2025-07-11 14:54:00','open'),(7,'asdfasdf','2025-07-17 17:00:00','open'),(8,'asdfasdf','2025-07-17 17:00:00','open'),(9,'hello hr how are your','2025-07-03 16:02:00','open'),(10,'hello hr how are your','2025-07-03 16:02:00','closed'),(11,'hello hr how are your','2025-07-17 17:04:00','closed'),(12,'hello hr how are your','2025-08-04 13:07:00','closed');
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ritesh','ry@gmail.com','c252fc1549065de9027a643d3df973657db25c7fbed14130e616179f328a2e4e','admin','bebed95ef13213e36ba77b8eff53abee'),(9,'ashish','ash@gmail.com','50eefdcd843384b03e58f688d81a5ac00f01eb6bed0d956a9e5f33fb71573fe8','user','9f4d1cdc98a7e4e4fd2f22873e531e79');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (14,3,6,9),(15,4,9,9),(16,5,13,9),(17,6,16,9),(18,7,19,9),(19,12,31,9);
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-03 14:37:11
