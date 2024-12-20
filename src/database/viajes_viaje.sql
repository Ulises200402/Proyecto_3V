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
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `idViaje` int(11) NOT NULL AUTO_INCREMENT,
  `idOrigen` int(11) NOT NULL,
  `idDestino` int(11) NOT NULL,
  `idMicros` int(11) NOT NULL,
  `idChoferes` int(11) NOT NULL,
  PRIMARY KEY (`idViaje`,`idOrigen`,`idDestino`,`idMicros`,`idChoferes`),
  KEY `fk_Lugar_Origen` (`idOrigen`),
  KEY `fk_Lugar_Destino` (`idDestino`),
  KEY `fk_Micros_Viaje_idx` (`idMicros`),
  KEY `fk_Choferes_Viaje_idx` (`idChoferes`),
  CONSTRAINT `fk_Choferes_Viaje` FOREIGN KEY (`idChoferes`) REFERENCES `choferes` (`idChoferes`),
  CONSTRAINT `fk_Lugar_Destino` FOREIGN KEY (`idDestino`) REFERENCES `lugares` (`idLugar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lugar_Origen` FOREIGN KEY (`idOrigen`) REFERENCES `lugares` (`idLugar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Micros_Viaje` FOREIGN KEY (`idMicros`) REFERENCES `micros` (`idMicros`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES (1,13,1,1,1),(2,13,2,2,2),(3,13,3,3,3),(4,13,4,4,4),(5,13,5,5,5),(6,13,6,6,6),(7,13,7,7,7),(8,13,8,8,8),(9,13,9,9,9),(10,13,10,10,10),(11,13,11,11,11),(12,13,12,12,12),(13,13,14,13,13),(14,13,15,14,14),(15,13,16,15,15),(16,13,17,16,16),(17,13,18,17,17),(18,13,19,18,18),(19,13,20,19,19),(20,13,21,20,20),(21,13,22,21,21),(22,13,23,22,22),(23,13,24,23,23),(24,1,13,1,1),(25,2,13,2,2),(26,3,13,3,3),(27,4,13,4,4),(28,5,13,5,5),(29,6,13,6,6),(30,7,13,7,7),(31,8,13,8,8),(32,9,13,9,9),(33,10,13,10,10),(34,11,13,11,11),(35,12,13,12,12),(36,14,13,13,13),(37,15,13,14,14),(38,16,13,15,15),(39,17,13,16,16),(40,18,13,17,17),(41,19,13,18,18),(42,20,13,19,19),(43,21,13,20,20),(44,22,13,21,21),(45,23,13,22,22),(46,24,13,23,23);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
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
