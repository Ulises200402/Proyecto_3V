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
-- Table structure for table `choferes`
--

DROP TABLE IF EXISTS `choferes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choferes` (
  `idChoferes` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `DNI` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idChoferes`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choferes`
--

LOCK TABLES `choferes` WRITE;
/*!40000 ALTER TABLE `choferes` DISABLE KEYS */;
INSERT INTO `choferes` VALUES (1,'Juan','Pérez','011-2345-6789','12345678'),(2,'María','Gómez','011-9876-5432','23456789'),(3,'Carlos','López','011-2345-9876','34567890'),(4,'Lucía','Martínez','011-8765-4321','45678901'),(5,'Javier','Rodríguez','011-2345-7890','56789012'),(6,'Ana','Fernández','011-8765-1234','67890123'),(7,'Diego','Sánchez','011-2345-0987','78901234'),(8,'Laura','Gutiérrez','011-8765-2345','89012345'),(9,'Santiago','Morales','011-2345-9012','90123456'),(10,'Valeria','Ramírez','011-8765-4300','01234567'),(11,'Juan','Pérez','011-2345-6789','20123456'),(12,'María','Gómez','011-2345-6790','20123457'),(13,'Pedro','López','011-2345-6791','20123458'),(14,'Ana','Martínez','011-2345-6792','20123459'),(15,'Carlos','Hernández','011-2345-6793','20123460'),(16,'Lucía','Rodríguez','011-2345-6794','20123461'),(17,'José','Fernández','011-2345-6795','20123462'),(18,'Laura','Sánchez','011-2345-6796','20123463'),(19,'Diego','González','011-2345-6797','20125464'),(20,'Claudia','Martín','011-2345-6798','20123465'),(21,'Sergio','Jímenez','011-2345-6799','20123466'),(22,'Verónica','Moreno','011-2345-6800','20123467'),(23,'Fernando','Salazar','011-2345-6801','20123468'),(24,'Gabriela','Castro','011-2345-6802','20123469');
/*!40000 ALTER TABLE `choferes` ENABLE KEYS */;
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
