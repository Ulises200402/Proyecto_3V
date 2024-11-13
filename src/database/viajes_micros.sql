-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: viajes
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `micros`
--

DROP TABLE IF EXISTS `micros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `micros` (
  `idMicros` int(11) NOT NULL AUTO_INCREMENT,
  `Numero_asientos` int(11) DEFAULT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `Patente` varchar(20) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMicros`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `micros`
--

LOCK TABLES `micros` WRITE;
/*!40000 ALTER TABLE `micros` DISABLE KEYS */;
INSERT INTO `micros` VALUES (1,50,'500 RS','ABC123','Mercedes Benz'),(2,50,'500 RS','DEF456','Mercedes Benz'),(3,50,'500 RS','GHI789','Mercedes Benz'),(4,50,'500 RS','JKL012','Mercedes Benz'),(5,50,'500 RS','MNO345','Mercedes Benz'),(6,50,'500 RS','PQR678','Mercedes Benz'),(7,50,'500 RS','STU901','Mercedes Benz'),(8,50,'500 RS','VWX234','Mercedes Benz'),(9,50,'500 RS','YZA567','Mercedes Benz'),(10,50,'500 RS','BCD890','Mercedes Benz'),(11,50,'500 RS','AB 123 CD','Mercedes Benz'),(12,50,'500 RS','AB 124 CD','Mercedes Benz'),(13,50,'500 RS','AB 125 CD','Mercedes Benz'),(14,50,'500 RS','AB 126 CD','Mercedes Benz'),(15,50,'500 RS','AB 127 CD','Mercedes Benz'),(16,50,'500 RS','AB 128 CD','Mercedes Benz'),(17,50,'500 RS','AB 129 CD','Mercedes Benz'),(18,50,'500 RS','AB 130 CD','Mercedes Benz'),(19,50,'500 RS','AB 131 CD','Mercedes Benz'),(20,50,'500 RS','AB 132 CD','Mercedes Benz'),(21,50,'500 RS','AB 133 CD','Mercedes Benz'),(22,50,'500 RS','AB 134 CD','Mercedes Benz'),(23,50,'500 RS','AB 135 CD','Mercedes Benz'),(24,50,'500 RS','AB 136 CD','Mercedes Benz');
/*!40000 ALTER TABLE `micros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-09 18:01:59
