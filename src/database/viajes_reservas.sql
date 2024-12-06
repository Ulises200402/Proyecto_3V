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
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `idReservas` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `Fecha de Ida` date NOT NULL,
  `Fecha de Vuelta` date NOT NULL,
  `idDestino` int(11) NOT NULL,
  `idViaje` int(11) NOT NULL,
  PRIMARY KEY (`idReservas`,`iduser`,`idDestino`,`idViaje`),
  KEY `iduser` (`iduser`),
  KEY `idDestino_idx` (`idDestino`),
  KEY `idviaje` (`idViaje`),
  CONSTRAINT `fk_Viaje_Reservas` FOREIGN KEY (`idReservas`) REFERENCES `viaje` (`idViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idDestino_lugares` FOREIGN KEY (`idDestino`) REFERENCES `lugares` (`idLugar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idviaje` FOREIGN KEY (`idViaje`) REFERENCES `viaje` (`idViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (4,2,'Roberto','2024-11-07','2024-11-29',19,19),(5,3,'Pepe','2024-11-13','2024-11-16',12,12),(6,2,'carlos','2024-11-16','2024-11-23',1,1),(7,7,'Ana Smith','2024-12-10','2024-12-17',15,15),(8,8,'Mario Pérez','2024-12-11','2024-12-18',2,2),(9,9,'Lucia Martin','2024-12-12','2024-12-19',14,14),(10,10,'Juan García','2024-12-13','2024-12-20',8,8),(11,11,'Sofía Fernández','2024-12-14','2024-12-21',9,9),(12,12,'Messi Leo','2024-12-15','2024-12-22',6,6),(13,13,'Carla López','2024-12-16','2024-12-23',6,6),(14,14,'Cristiano Ronaldo','2024-12-17','2024-12-24',2,2),(15,15,'Andrés Méndez','2024-12-18','2024-12-25',8,8),(16,16,'Neymar Jr','2024-12-19','2024-12-26',1,1),(17,17,'Josephine Santos','2024-12-20','2024-12-27',7,7),(18,18,'Gabriel Morales','2024-12-21','2024-12-28',3,3),(19,19,'Mariana Castro','2024-12-22','2024-12-29',5,5),(20,20,'Felipe González','2024-12-23','2024-12-30',2,2),(21,21,'Natalia Jiménez','2024-12-24','2024-12-31',9,9),(22,22,'Juanita Palacios','2024-12-25','2025-01-01',14,14),(23,23,'Oscar Herrera','2024-12-26','2025-01-02',1,1),(24,24,'Elena Rojas','2024-12-27','2025-01-03',8,8),(25,25,'Victor Sánchez','2024-12-28','2025-01-04',4,4),(26,26,'Martín López','2024-12-29','2025-01-05',10,10);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06  3:21:44
