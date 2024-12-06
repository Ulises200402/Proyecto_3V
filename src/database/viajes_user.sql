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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `Gmail` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lol@gmail.com','ulises10','ulises'),(2,'lolol@gmail.com','123456','prueba123'),(3,'ay@gmail.com','123456','prueba6'),(4,'pablito@gmail.com','pablito123','pablito'),(5,'jorgeguzman234@gmail.com','jorge234','jorge234'),(6,'Alexis69@gmail.com','123456','Alexis69'),(7,'ana.smith@example.com','password123','ana123'),(8,'mario.perez@example.com','123456','marioperez'),(9,'lucia.martin@example.com','lucia2024','luciamartin'),(10,'juan.garcia@example.com','juanmarco','juangarcia'),(11,'sofia.fernandez@example.com','sofia2024','sofiaf'),(12,'messi.leo@example.com','messi2024','leomessi'),(13,'carla.lopezz@example.com','carla2024','carla123'),(14,'ronaldo.cr7@example.com','ronaldo123','cristiano'),(15,'andres.mendez@example.com','andres123','andres123'),(16,'neymarjr.futbol@example.com','neymar1234','neymarjr'),(17,'josephine.santos@example.com','josephine123','jo_santos'),(18,'gabriel.morales@example.com','gabriel2024','gabrielmorales'),(19,'mariana.castro@example.com','mariana123','marianacastro'),(20,'felipe.gonzalez@example.com','felipe2024','felipegonzalez'),(21,'natalia.jimenez@example.com','natalia123','natjimenez'),(22,'juanita.palacios@example.com','juanita2024','juanita24'),(23,'oscar.herrera@example.com','oscar1234','oscarherrera'),(24,'elena.rojas@example.com','elena123','elenarojas'),(25,'victor.sanchez@example.com','victor2024','victorsanchez'),(26,'martin.lopez@example.com','martin456','martin123');
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

-- Dump completed on 2024-12-06  3:21:43
