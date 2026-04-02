-- MySQL dump 10.13  Distrib 9.6.0, for macos26.2 (arm64)
--
-- Host: 127.0.0.1    Database: partiel_bdd
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athlete` (
  `id_athlete` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `id_pays` int DEFAULT NULL,
  PRIMARY KEY (`id_athlete`),
  KEY `id_pays` (`id_pays`),
  CONSTRAINT `athlete_ibfk_1` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete`
--

/*!40000 ALTER TABLE `athlete` DISABLE KEYS */;
INSERT INTO `athlete` VALUES (1,'Martin','Leo','1998-05-10',1),(2,'Dupont','Anna','2000-07-21',1),(3,'Smith','John','1995-03-12',2),(4,'Tanaka','Yuki','1999-11-02',4),(5,'Dubois','Claire','1997-04-14',1),(6,'Wilson','Emma','1996-08-30',2),(7,'Muller','Lukas','1994-01-12',5),(8,'Sato','Hana','2001-06-18',4),(9,'Garcia','Luis','1997-09-10',3),(10,'Rossi','Marco','1996-02-14',5),(11,'Kim','Min','2000-12-01',4);
/*!40000 ALTER TABLE `athlete` ENABLE KEYS */;

--
-- Table structure for table `critere`
--

DROP TABLE IF EXISTS `critere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `critere` (
  `id_critere` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `poids` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_critere`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critere`
--

/*!40000 ALTER TABLE `critere` DISABLE KEYS */;
INSERT INTO `critere` VALUES (1,'Technique',3.00),(2,'Amplitude',2.00),(3,'Style',2.00),(4,'Difficulte',3.00);
/*!40000 ALTER TABLE `critere` ENABLE KEYS */;

--
-- Table structure for table `editionjo`
--

DROP TABLE IF EXISTS `editionjo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editionjo` (
  `id_edition` int NOT NULL AUTO_INCREMENT,
  `annee` int NOT NULL,
  `ville` varchar(100) NOT NULL,
  PRIMARY KEY (`id_edition`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editionjo`
--

/*!40000 ALTER TABLE `editionjo` DISABLE KEYS */;
INSERT INTO `editionjo` VALUES (1,2026,'Cortina');
/*!40000 ALTER TABLE `editionjo` ENABLE KEYS */;

--
-- Table structure for table `epreuve`
--

DROP TABLE IF EXISTS `epreuve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `epreuve` (
  `id_epreuve` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `id_edition` int DEFAULT NULL,
  PRIMARY KEY (`id_epreuve`),
  KEY `id_edition` (`id_edition`),
  CONSTRAINT `epreuve_ibfk_1` FOREIGN KEY (`id_edition`) REFERENCES `editionjo` (`id_edition`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epreuve`
--

/*!40000 ALTER TABLE `epreuve` DISABLE KEYS */;
INSERT INTO `epreuve` VALUES (1,'Halfpipe','2022-02-10',1),(2,'Big Air','2022-02-15',1);
/*!40000 ALTER TABLE `epreuve` ENABLE KEYS */;

--
-- Table structure for table `juge`
--

DROP TABLE IF EXISTS `juge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juge` (
  `id_juge` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `id_pays` int DEFAULT NULL,
  PRIMARY KEY (`id_juge`),
  KEY `id_pays` (`id_pays`),
  CONSTRAINT `juge_ibfk_1` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juge`
--

/*!40000 ALTER TABLE `juge` DISABLE KEYS */;
INSERT INTO `juge` VALUES (1,'Minnie M. Jones',2),(2,'Hayley Borrie',3),(3,'Tashimi Yamamoto',4),(4,'Daniel M. Carr',5),(5,'Claude L\'Hiver',1),(6,'Michael R. Ladner',2);
/*!40000 ALTER TABLE `juge` ENABLE KEYS */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `id_run` int NOT NULL,
  `id_juge` int NOT NULL,
  `id_critere` int NOT NULL,
  `valeur` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_run`,`id_juge`,`id_critere`),
  KEY `id_juge` (`id_juge`),
  KEY `id_critere` (`id_critere`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_run`) REFERENCES `run` (`id_run`),
  CONSTRAINT `note_ibfk_2` FOREIGN KEY (`id_juge`) REFERENCES `juge` (`id_juge`),
  CONSTRAINT `note_ibfk_3` FOREIGN KEY (`id_critere`) REFERENCES `critere` (`id_critere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,1,1,85.00),(1,1,2,80.00),(1,1,3,78.00),(1,1,4,82.00),(1,2,1,88.00),(1,2,2,85.00),(1,2,3,84.00),(1,2,4,86.00),(3,1,1,70.00),(3,1,2,75.00),(3,1,3,72.00),(3,1,4,74.00),(4,2,1,90.00),(4,2,2,88.00),(4,2,3,91.00),(4,2,4,89.00),(6,1,1,82.00),(6,1,2,80.00),(6,1,3,79.00),(6,1,4,81.00),(6,2,1,84.00),(6,2,2,83.00),(6,2,3,82.00),(6,2,4,85.00),(7,2,1,88.00),(7,2,2,86.00),(7,2,3,87.00),(7,2,4,89.00),(7,3,1,85.00),(7,3,2,84.00),(7,3,3,83.00),(7,3,4,86.00),(8,1,1,78.00),(8,1,2,76.00),(8,1,3,75.00),(8,1,4,77.00),(8,3,1,80.00),(8,3,2,79.00),(8,3,3,78.00),(8,3,4,81.00),(9,1,1,90.00),(9,1,2,88.00),(9,1,3,89.00),(9,1,4,91.00),(9,2,1,87.00),(9,2,2,86.00),(9,2,3,88.00),(9,2,4,89.00),(10,2,1,83.00),(10,2,2,82.00),(10,2,3,81.00),(10,2,4,84.00),(10,3,1,85.00),(10,3,2,84.00),(10,3,3,83.00),(10,3,4,86.00),(11,1,1,86.00),(11,1,2,85.00),(11,1,3,84.00),(11,1,4,87.00),(11,2,1,88.00),(11,2,2,87.00),(11,2,3,86.00),(11,2,4,89.00),(12,2,1,90.00),(12,2,2,88.00),(12,2,3,89.00),(12,2,4,91.00),(12,3,1,87.00),(12,3,2,86.00),(12,3,3,88.00),(12,3,4,89.00),(13,1,1,82.00),(13,1,2,81.00),(13,1,3,80.00),(13,1,4,83.00),(13,3,1,84.00),(13,3,2,83.00),(13,3,3,82.00),(13,3,4,85.00),(14,1,1,85.00),(14,1,2,84.00),(14,1,3,83.00),(14,1,4,86.00),(14,2,1,87.00),(14,2,2,86.00),(14,2,3,85.00),(14,2,4,88.00),(15,1,1,91.00),(15,1,2,90.00),(15,1,3,89.00),(15,1,4,92.00),(15,2,1,88.00),(15,2,2,87.00),(15,2,3,86.00),(15,2,4,89.00),(15,6,4,101.00);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Verifier_note` BEFORE INSERT ON `note` FOR EACH ROW BEGIN
# je me suis aperçu en testant avec cette commande : INSERT INTO note (id_run, id_juge, id_critere, valeur) VALUES (15,6,4,101);
# que mon trigger ne marchait pas donc j'ai essayé avec cette autre méthode
    IF NEW.valeur > 100 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erreur, la note ne peut pas être au dessus de 100';
    END IF;
    IF NEW.valeur < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'erreur, la note ne peut pas être en dessous de 0';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participation` (
  `id_athlete` int NOT NULL,
  `id_epreuve` int NOT NULL,
  PRIMARY KEY (`id_athlete`,`id_epreuve`),
  KEY `id_epreuve` (`id_epreuve`),
  CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`id_athlete`) REFERENCES `athlete` (`id_athlete`),
  CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`id_epreuve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participation`
--

/*!40000 ALTER TABLE `participation` DISABLE KEYS */;
INSERT INTO `participation` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(1,2),(3,2),(9,2),(10,2),(11,2);
/*!40000 ALTER TABLE `participation` ENABLE KEYS */;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pays` (
  `id_pays` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pays`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (3,'Canada'),(1,'France'),(4,'Japon'),(5,'Suisse'),(2,'USA');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;

--
-- Table structure for table `run`
--

DROP TABLE IF EXISTS `run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `run` (
  `id_run` int NOT NULL AUTO_INCREMENT,
  `id_athlete` int DEFAULT NULL,
  `id_epreuve` int DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `temps_execution` int DEFAULT NULL,
  PRIMARY KEY (`id_run`),
  KEY `id_athlete` (`id_athlete`,`id_epreuve`),
  CONSTRAINT `run_ibfk_1` FOREIGN KEY (`id_athlete`, `id_epreuve`) REFERENCES `participation` (`id_athlete`, `id_epreuve`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (1,1,1,1,45),(2,1,1,2,48),(3,2,1,1,44),(4,3,1,1,47),(5,4,1,1,46),(6,5,1,1,46),(7,5,1,2,49),(8,6,1,1,45),(9,7,1,1,48),(10,8,1,1,47),(11,1,2,1,50),(12,3,2,1,52),(13,9,2,1,51),(14,10,2,1,49),(15,11,2,1,48);
/*!40000 ALTER TABLE `run` ENABLE KEYS */;

--
-- Dumping routines for database 'partiel_bdd'
--
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 8.0.33.
--
--
-- WARNING: can't read the INFORMATION_SCHEMA.libraries table. It's most probably an old server 8.0.33.
--
/*!50003 DROP PROCEDURE IF EXISTS `Classement_par_epreuve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Classement_par_epreuve`()
BEGIN
    SELECT epreuve.nom, athlete.nom, athlete.prenom, AVG(note.valeur)
    FROM epreuve
    INNER JOIN participation ON epreuve.id_epreuve = participation.id_epreuve
    INNER JOIN athlete ON participation.id_athlete = athlete.id_athlete
    INNER JOIN note ON participation.id_participation = note.id_participation
    GROUP BY epreuve.id_epreuve, athlete.id_athlete
    ORDER BY AVG(note.valeur) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-02 11:50:45
