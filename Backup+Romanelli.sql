-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cinemapy
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Dumping data for table `actores`
--

LOCK TABLES `actores` WRITE;
/*!40000 ALTER TABLE `actores` DISABLE KEYS */;
INSERT INTO `actores` VALUES (1,1,'1995-01-01'),(2,2,'1995-01-01'),(3,4,'1995-01-01'),(4,7,'1995-01-01'),(5,9,'1995-01-01'),(6,10,'1995-01-01');
/*!40000 ALTER TABLE `actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,1,1,'la mejor de la historia','2022-12-20 20:14:46',8),(3,1,3,'ES LA MEJOR PELUCULA','2022-12-20 20:14:46',9),(4,1,4,'EXCELENTE','2022-12-21 00:17:40',7);
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `directores`
--

LOCK TABLES `directores` WRITE;
/*!40000 ALTER TABLE `directores` DISABLE KEYS */;
INSERT INTO `directores` VALUES (1,3,'1995-01-01'),(2,5,'1995-01-01'),(3,6,'1995-01-01'),(4,8,'1995-01-01');
/*!40000 ALTER TABLE `directores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'TERROR'),(2,'COMEDIA'),(3,'ACCION'),(4,'SUSPENSO'),(5,'INFANTIL'),(6,'THRILLER'),(7,'FAMILIAR');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `new_calificacion`
--

LOCK TABLES `new_calificacion` WRITE;
/*!40000 ALTER TABLE `new_calificacion` DISABLE KEYS */;
INSERT INTO `new_calificacion` VALUES (2,2,'ME ENCANTO',7,'2022-12-20','21:19:20','root@localhost','ADD'),(3,3,'ES MI PREFERIDA',9,'2022-12-20','21:16:24','root@localhost','UPDATE'),(4,4,'EXCELENTE',7,'2022-12-20','21:19:10','root@localhost','ADD');
/*!40000 ALTER TABLE `new_calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `new_peliculas`
--

LOCK TABLES `new_peliculas` WRITE;
/*!40000 ALTER TABLE `new_peliculas` DISABLE KEYS */;
INSERT INTO `new_peliculas` VALUES (9,'Wakanda Forever','2022-12-20','19:04:29','root@localhost','DELETE'),(10,'La habitación del pánico','2022-12-20','18:59:39','root@localhost','ADD');
/*!40000 ALTER TABLE `new_peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'Titanic','1997-01-01',195,6,NULL),(2,'El hombre de la máscara','1998-01-01',132,3,NULL),(3,'Django desencadenado','2012-01-01',165,3,NULL),(4,'Atrapame si Puedes','2002-01-01',141,4,NULL),(5,'Once Upon a Time','2019-01-01',160,4,NULL),(6,'The Post','2017-01-01',115,6,NULL),(8,'Avatar2','2022-01-01',223,3,NULL),(10,'La habitación del pánico','1996-01-01',96,4,NULL);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `peliculas_actores`
--

LOCK TABLES `peliculas_actores` WRITE;
/*!40000 ALTER TABLE `peliculas_actores` DISABLE KEYS */;
INSERT INTO `peliculas_actores` VALUES (1,1,1,NULL),(2,2,1,NULL),(3,1,2,NULL),(4,1,3,NULL),(5,3,3,NULL),(6,1,4,NULL),(7,4,4,NULL),(8,1,5,NULL),(9,5,5,NULL),(10,4,6,NULL),(11,6,6,NULL);
/*!40000 ALTER TABLE `peliculas_actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `peliculas_directores`
--

LOCK TABLES `peliculas_directores` WRITE;
/*!40000 ALTER TABLE `peliculas_directores` DISABLE KEYS */;
INSERT INTO `peliculas_directores` VALUES (1,1,1,NULL),(2,4,2,NULL),(3,2,3,NULL),(4,3,4,NULL),(5,2,5,NULL),(6,4,6,NULL),(7,1,1,NULL),(8,4,2,NULL),(9,2,3,NULL),(10,3,4,NULL),(11,2,5,NULL),(12,4,6,NULL);
/*!40000 ALTER TABLE `peliculas_directores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Leonardo','DiCaprio','USA','1974-11-11'),(2,'Kate ','Winslet','USA','1975-10-05'),(3,'James','Cameron','Canada','1954-08-16'),(4,'Jamie ','Fox','USA','1967-12-13'),(5,'Quentin','Tarantino','USA','1963-03-27'),(6,'Steven ','Spielberg','USA','1946-12-08'),(7,'Tom','Hanks','USA','1956-07-09'),(8,'Randall ','Wallace','USA','1950-07-28'),(9,'Brad ','Pitt','USA','1963-12-18'),(10,'Meryl','Streep','USA','1949-06-22'),(11,'Tom ','Hardy','Inglaterra','1977-09-15'),(12,'Joseph','Gordon Levitt','USA','1981-02-17'),(13,'Jennifer','Lawrence','USA','1990-08-15'),(14,'Jonah','Hill','USA','1983-12-20'),(15,'Timothee','Chalamet','USA','1995-12-27'),(16,'Cate','Blanchett','Australia','1969-05-14'),(17,'Kerry','Washington','USA','1977-01-31'),(18,'Christoph ','Waltz','Austria','1956-10-04'),(19,'Samuel','Jackson','USA','1948-12-21');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Lucas','Romanelli','xz_lucas@hotmail.com','12345');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-10 21:25:05
