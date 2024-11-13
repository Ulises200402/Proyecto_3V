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
-- Table structure for table `lugares`
--

DROP TABLE IF EXISTS `lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares` (
  `idLugar` int(11) NOT NULL AUTO_INCREMENT,
  `lugarDestino` varchar(100) NOT NULL,
  `lugarOrigen` varchar(100) NOT NULL,
  `Distancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLugar`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugares`
--

LOCK TABLES `lugares` WRITE;
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
INSERT INTO `lugares` VALUES (1,'Buenos Aires','Buenos Aires',1000),(2,'Catamarca','Catamarca',840),(3,'Chaco','Chaco',1180),(4,'Chubut','Chubut',1420),(5,'CABA','CABA',1000),(6,'Córdoba','Córdoba',670),(7,'Corrientes','Corrientes',1230),(8,'Entre Ríos','Entre Ríos',1050),(9,'Formosa','Formosa',1450),(10,'Jujuy','Jujuy',1270),(11,'La Pampa','La Pampa',765),(12,'La Rioja','La Rioja',650),(13,'Mendoza','Mendoza',0),(14,'Misiones','Misiones',1500),(15,'Neuquén','Neuquén',650),(16,'Río Negro','Río Negro',1000),(17,'Salta','Salta',1180),(18,'San Juan','San Juan',170),(19,'San Luis','San Luis',240),(20,'Santa Cruz','Santa Cruz',1970),(21,'Santa Fe','Santa Fe',950),(22,'Santiago del Estero','Santiago del Estero',1050),(23,'Tierra del Fuego','Tierra del Fuego',2700),(24,'Tucumán','Tucumán',915);
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;
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
