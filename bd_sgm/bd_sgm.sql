-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_sgm
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` int NOT NULL AUTO_INCREMENT,
  `fecha_creada` date DEFAULT NULL,
  `id_intervalo` int DEFAULT NULL,
  `id_paciente` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `fk_cita_paciente_idx` (`id_paciente`),
  KEY `fk_intervalo_idx` (`id_intervalo`),
  CONSTRAINT `fk_cita_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_intervalo` FOREIGN KEY (`id_intervalo`) REFERENCES `intervalos` (`id_intervalos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (1,'2025-01-15',13,3,'2025-01-13'),(2,'2025-01-15',14,3,'2025-01-13'),(3,'2025-01-15',37,4,'2025-06-15'),(4,'2025-01-15',25,3,'2025-01-15'),(5,'2025-01-15',38,12,'2025-06-15'),(6,'2025-01-15',39,8,'2025-06-15'),(7,'2025-01-15',26,12,'2025-01-15');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `Id_Especialidades` int NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Especialidades`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'-------------'),(2,'Cardiologia'),(3,'Traumatologia'),(4,'Ortopedia'),(5,'Neurologia'),(6,'Gastroenterologia'),(7,'Endocrinologia'),(8,'Dermatologia'),(9,'Psiquiatria'),(10,'Neumologia'),(11,'Oncologia'),(12,'Oftalmologia'),(13,'Otorrinolaringologia');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `Id_Horario` int NOT NULL AUTO_INCREMENT,
  `Id_Personal_Medico` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora_Inicio` time DEFAULT NULL,
  `Hora_Fin` time DEFAULT NULL,
  `Total_Cupos` int DEFAULT NULL,
  `Cupos_Disponible` int DEFAULT NULL,
  PRIMARY KEY (`Id_Horario`),
  KEY `fk_personal_medico_idx` (`Id_Personal_Medico`),
  CONSTRAINT `fk_personal_medico` FOREIGN KEY (`Id_Personal_Medico`) REFERENCES `personalmedico` (`Id_Personal_Medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,1,'2025-01-15','08:00:00','12:00:00',12,11),(2,2,'2025-01-15','08:00:00','12:00:00',12,10),(3,3,'2025-01-15','14:00:00','18:00:00',12,10),(4,4,'2025-06-15','08:00:00','12:00:00',12,9);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervalos`
--

DROP TABLE IF EXISTS `intervalos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervalos` (
  `id_intervalos` int NOT NULL AUTO_INCREMENT,
  `id_horario` int DEFAULT NULL,
  `hora_ini` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`id_intervalos`),
  KEY `fk_hora_idx` (`id_horario`),
  CONSTRAINT `fk_hora` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`Id_Horario`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervalos`
--

LOCK TABLES `intervalos` WRITE;
/*!40000 ALTER TABLE `intervalos` DISABLE KEYS */;
INSERT INTO `intervalos` VALUES (1,1,'08:00:00','08:20:00'),(2,1,'08:20:00','08:40:00'),(3,1,'08:40:00','09:00:00'),(4,1,'09:00:00','09:20:00'),(5,1,'09:20:00','09:40:00'),(6,1,'09:40:00','10:00:00'),(7,1,'10:00:00','10:20:00'),(8,1,'10:20:00','10:40:00'),(9,1,'10:40:00','11:00:00'),(10,1,'11:00:00','11:20:00'),(11,1,'11:20:00','11:40:00'),(12,1,'11:40:00','12:00:00'),(13,2,'08:00:00','08:20:00'),(14,2,'08:20:00','08:40:00'),(15,2,'08:40:00','09:00:00'),(16,2,'09:00:00','09:20:00'),(17,2,'09:20:00','09:40:00'),(18,2,'09:40:00','10:00:00'),(19,2,'10:00:00','10:20:00'),(20,2,'10:20:00','10:40:00'),(21,2,'10:40:00','11:00:00'),(22,2,'11:00:00','11:20:00'),(23,2,'11:20:00','11:40:00'),(24,2,'11:40:00','12:00:00'),(25,3,'14:00:00','14:20:00'),(26,3,'14:20:00','14:40:00'),(27,3,'14:40:00','15:00:00'),(28,3,'15:00:00','15:20:00'),(29,3,'15:20:00','15:40:00'),(30,3,'15:40:00','16:00:00'),(31,3,'16:00:00','16:20:00'),(32,3,'16:20:00','16:40:00'),(33,3,'16:40:00','17:00:00'),(34,3,'17:00:00','17:20:00'),(35,3,'17:20:00','17:40:00'),(36,3,'17:40:00','18:00:00'),(37,4,'08:00:00','08:20:00'),(38,4,'08:20:00','08:40:00'),(39,4,'08:40:00','09:00:00'),(40,4,'09:00:00','09:20:00'),(41,4,'09:20:00','09:40:00'),(42,4,'09:40:00','10:00:00'),(43,4,'10:00:00','10:20:00'),(44,4,'10:20:00','10:40:00'),(45,4,'10:40:00','11:00:00'),(46,4,'11:00:00','11:20:00'),(47,4,'11:20:00','11:40:00'),(48,4,'11:40:00','12:00:00');
/*!40000 ALTER TABLE `intervalos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `Doc_Id_Paciente` varchar(45) NOT NULL,
  `Nombres_Paciente` varchar(45) DEFAULT NULL,
  `Apellidos_Paciente` varchar(45) DEFAULT NULL,
  `FechaNacimiento_Paciente` date DEFAULT NULL,
  `Direccion_Paciente` varchar(45) DEFAULT NULL,
  `Telefono_Paciente` varchar(45) DEFAULT NULL,
  `Apoderado_Paciente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `Doc_Id_Paciente_UNIQUE` (`Doc_Id_Paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (3,'00000000','PatrickKKK','Garcia Abanto','2000-04-21','Av Colonizacion','890765','Sandra'),(4,'12345676','Dennis Josue','Sanchez Hidalgo','1999-09-18','Av los robles','890765','Joshua'),(5,'78965896','jhgjh','khghk','1998-05-05','jvjh bjv','985965896',''),(6,'98989898','hgv','hghh','1992-06-09','hgh vh','986532698','hj'),(8,'78787878','jkhbjkc','hghj','1998-08-05','hgh gh','78986545','kjnbhj'),(9,'45454545','jhgjh','jhjn','1998-02-02','ufuj hg','989569896','bm'),(10,'12121212','hgjkbb','hgh','1999-06-03','jgfj','7895656','jhj'),(11,'98653265','khgk','jhgjh','1998-03-03','jhgh','54656565','jkkjh'),(12,'32659832','jvj','mhvjmh','1996-03-03','khgk','65986532','hgkh');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalmedico`
--

DROP TABLE IF EXISTS `personalmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalmedico` (
  `Id_Personal_Medico` int NOT NULL AUTO_INCREMENT,
  `Dni_Personal_Medico` varchar(45) NOT NULL,
  `Nombres_Personal_Medico` varchar(45) DEFAULT NULL,
  `Apellidos_Personal_Medico` varchar(45) DEFAULT NULL,
  `FechaNacimiento_Personal_Medico` varchar(45) DEFAULT NULL,
  `Direccion_Personal_Medico` varchar(45) DEFAULT NULL,
  `Telefono_Personal_Medico` varchar(45) DEFAULT NULL,
  `Numero_Colegiatura` varchar(45) DEFAULT NULL,
  `Id_Tipo_Personal` int DEFAULT NULL,
  `Id_Especialidad` int DEFAULT NULL,
  PRIMARY KEY (`Id_Personal_Medico`),
  UNIQUE KEY `Dni_Personal_Medico_UNIQUE` (`Dni_Personal_Medico`),
  KEY `fk_idTipoPersonal_idx` (`Id_Tipo_Personal`),
  KEY `fk_idEspecialidad_idx` (`Id_Especialidad`),
  CONSTRAINT `fk_idEspecialidad` FOREIGN KEY (`Id_Especialidad`) REFERENCES `especialidades` (`Id_Especialidades`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idTipoPersonal` FOREIGN KEY (`Id_Tipo_Personal`) REFERENCES `tipopersonalmedico` (`Id_Tipo_Personal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalmedico`
--

LOCK TABLES `personalmedico` WRITE;
/*!40000 ALTER TABLE `personalmedico` DISABLE KEYS */;
INSERT INTO `personalmedico` VALUES (1,'75843447','Luis','Lopez Garcia','1970-05-12','Av tupac','890765111','8991',2,1),(2,'78945613','Josue','Lopez Montalvan','1980-11-12','Av tupac','890765222','8992',1,5),(3,'78945612','Ana','Perez Gutierrez','1990-09-12','Av Colonizacion','890765333','8993',1,4),(4,'78945630','Denis Josue','Sanchez Hidalgo','2000-05-12','Av tupac','890765','8993',1,4),(6,'985365458','Dorge','Esquivel Salazar','1999-08-04','Jr calle 14','985698324','7854',2,1),(9,'45451515','ngcghg','sdcsdc dssfsd','1999-02-16','cdsfs dsfdsf','454545454','4521',2,1),(10,'55555555','bvnbvnb','mhbhjjvbhj','1998-05-06','hgch','456985632','4562',2,1),(11,'56454545','hjgjcgtcgt','tgtrtrht5','1998-05-05','gtfhdhdhg','4554545','7845',2,1);
/*!40000 ALTER TABLE `personalmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopersonalmedico`
--

DROP TABLE IF EXISTS `tipopersonalmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipopersonalmedico` (
  `Id_Tipo_Personal` int NOT NULL AUTO_INCREMENT,
  `Tipo_Personal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Tipo_Personal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopersonalmedico`
--

LOCK TABLES `tipopersonalmedico` WRITE;
/*!40000 ALTER TABLE `tipopersonalmedico` DISABLE KEYS */;
INSERT INTO `tipopersonalmedico` VALUES (1,'Medico'),(2,'Enfermero'),(3,'Enfermero Tecnico'),(4,'Psicologo');
/*!40000 ALTER TABLE `tipopersonalmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd_sgm'
--
/*!50003 DROP PROCEDURE IF EXISTS `GenerarIntervalos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerarIntervalos`()
BEGIN
    DECLARE tiempo_ini TIME;
    DECLARE tiempo_fin TIME;
    DECLARE id_h INT;
    
    -- Cursor para iterar sobre cada registro en la tabla Horario
    DECLARE horario_cursor CURSOR FOR 
        SELECT id_horario, Hora_Inicio, Hora_Fin FROM horario;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET @fin_cursor = 1;

    -- Variables para controlar el cursor
    SET @fin_cursor = 0;

    OPEN horario_cursor;
    leer_cursor: LOOP
        FETCH horario_cursor INTO id_h, tiempo_ini, tiempo_fin;
        IF @fin_cursor THEN
            LEAVE leer_cursor;
        END IF;

        -- Generar intervalos de 20 minutos
        WHILE tiempo_ini < tiempo_fin DO
            INSERT INTO intervalos (id_horario, hora_ini, hora_fin)
            VALUES (id_h, tiempo_ini, ADDTIME(tiempo_ini, '00:20:00'));
            SET tiempo_ini = ADDTIME(tiempo_ini, '00:20:00');
        END WHILE;
    END LOOP;
    CLOSE horario_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ActualizarCupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizarCupo`(in id int)
BEGIN
    DECLARE v_id_horario INT;

    
    SELECT id_horario INTO v_id_horario
    FROM intervalos
    WHERE id_intervalos = id;

   
    IF v_id_horario IS NOT NULL THEN
        UPDATE horario
        SET Cupos_Disponible = Cupos_Disponible - 1
        WHERE Id_Horario = v_id_horario AND Cupos_Disponible > 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Disponiblidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Disponiblidad`(in id int)
BEGIN

SELECT * 
FROM horario
WHERE Id_Horario = 1 
  AND Fecha = '2025-01-13'
  AND Hora_Inicio <= '08:00:00' AND Hora_Fin >= '09:00:00'
  AND Cupos_Disponible > 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarPaciente`(IN idPaciente int(11))
BEGIN
	delete from paciente where id_paciente=idPaciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminarPersonalM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarPersonalM`(in idPersM INT)
BEGIN
	delete from personalmedico where Id_Personal_Medico = idPersM;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarCita`(in fechac date,in pacien int,in inter int,in fecha date )
BEGIN

insert into cita(id_cita,fecha_creada,id_paciente,id_intervalo,fecha) values(0,fechac,pacien,inter,fecha);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertarEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEspecialidad`(in nom varchar(50))
BEGIN
insert into especialidades(Id_Especialidades,Especialidad) values(0,nom);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarPaciente`(IN docIdentP varchar(45), IN nombresP varchar(45), 
IN apellidosP varchar(45), IN fechNacP date, IN direcP varchar(45), IN telefP varchar(45), IN ApodeP varchar(45))
BEGIN
	insert into paciente(id_paciente, Doc_Id_Paciente, Nombres_Paciente, Apellidos_Paciente, FechaNacimiento_Paciente,
    Direccion_Paciente, Telefono_Paciente, Apoderado_Paciente) 
    values(0,docIdentP, nombresP, apellidosP, fechNacP, direcP, telefP, ApodeP);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertarPersonalMedico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarPersonalMedico`(in dni varchar(45),in nombre varchar(45),in apellido varchar(50),
in fecha date,in direccion varchar(45),in telefono varchar(45),in numero varchar(50) ,in personal int,in especialidad int)
BEGIN

insert into personalmedico(Id_Personal_Medico,Dni_Personal_Medico,Nombres_Personal_Medico,Apellidos_Personal_Medico,
FechaNacimiento_Personal_Medico,Direccion_Personal_Medico,Telefono_Personal_Medico,Numero_Colegiatura,
Id_Tipo_Personal,Id_Especialidad) values(0,dni,nombre,apellido,fecha,direccion,telefono,numero,personal,especialidad);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertarTipoPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoPersonal`(in nom varchar(50))
BEGIN

insert into tipopersonalmedico(Id_Tipo_Personal,Tipo_Personal) values(0,nom);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarCita`()
BEGIN

select c.id_cita,c.fecha_creada,p.Doc_Id_Paciente,concat(p.Nombres_Paciente,' ',p.Apellidos_Paciente  )as Paciente,
concat(i.hora_ini,' ',i.hora_fin)as horario, c.fecha from cita c inner join paciente p on c.id_paciente=p.id_paciente

inner join intervalos i on c.id_intervalo=i.id_intervalos order by c.id_cita ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarCitaPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarCitaPaciente`(in id int)
BEGIN

select c.id_cita,p.id_paciente,p.Doc_Id_Paciente,concat(p.Nombres_Paciente,' ',p.Apellidos_Paciente) as Paciente,
c.id_horario,c.fecha_creacion,c.edad from cita c inner join paciente p on c.id_Paciente=p.id_paciente
where c.id_Paciente=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarCitas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarCitas`(in id int)
BEGIN

select * from cita where id_Paciente=id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarEspecialidad`()
BEGIN

select * from especialidades;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarIntervalos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarIntervalos`(IN id INT)
BEGIN
    SELECT 
        i.id_intervalos,
        i.id_horario,
        CONCAT(i.hora_ini, " ", i.hora_fin) AS Hora
    FROM 
        intervalos i
    WHERE 
        i.id_horario = id
        AND NOT EXISTS (
            SELECT 1 
            FROM cita c 
            WHERE c.id_intervalo = i.id_intervalos
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarPaciente`()
BEGIN
	select * from paciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarPersonal`()
BEGIN
	select p.Id_Personal_Medico,p.Dni_Personal_Medico,p.Nombres_Personal_Medico,p.Apellidos_Personal_Medico,
	p.FechaNacimiento_Personal_Medico,p.Direccion_Personal_Medico,p.Telefono_Personal_Medico,p.Numero_Colegiatura,
	t.Tipo_Personal ,e.Especialidad
	from personalmedico p 
	inner join tipopersonalmedico t on p.Id_Tipo_Personal=t.Id_Tipo_Personal
	inner join especialidades e on p.Id_Especialidad=e.Id_Especialidades;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarPersonalId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarPersonalId`(IN idPersonal int)
BEGIN
	select p.Id_Personal_Medico,p.Dni_Personal_Medico,p.Nombres_Personal_Medico,p.Apellidos_Personal_Medico,
	p.FechaNacimiento_Personal_Medico,p.Direccion_Personal_Medico,p.Telefono_Personal_Medico,p.Numero_Colegiatura,
	p.Id_Tipo_Personal, t.Tipo_Personal, p.Id_Especialidad, e.Especialidad
	from personalmedico p 
	inner join tipopersonalmedico t on p.Id_Tipo_Personal=t.Id_Tipo_Personal
	inner join especialidades e on p.Id_Especialidad=e.Id_Especialidades
	where Id_Personal_Medico=idPersonal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarPersonalMedico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarPersonalMedico`()
BEGIN

select * from personalmedico;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarTipoPersonal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarTipoPersonal`()
BEGIN

select * from tipopersonalmedico;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modificarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificarPaciente`(IN idPaci int, IN docIdentP varchar(45), IN nombresP varchar(45), 
IN apellidosP varchar(45), IN fechNacP date, IN direcP varchar(45), IN telefP varchar(45), IN ApodeP varchar(45))
BEGIN
	update paciente set Doc_Id_Paciente = docIdentP, Nombres_Paciente= nombresP, Apellidos_Paciente =apellidosP,FechaNacimiento_Paciente=fechNacP,
    Direccion_Paciente = direcP, Telefono_Paciente = telefP, Apoderado_Paciente =ApodeP  where id_paciente = idPaci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modificarPersonalM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificarPersonalM`(in idPersMe int, in dni varchar(45),in nombre varchar(45),
in apellido varchar(50), in fecha date,in direccion varchar(45),in telefono varchar(45),in numero varchar(50) ,in personal int,
in especialidad int)
BEGIN
	update personalmedico set Dni_Personal_Medico = dni, Nombres_Personal_Medico= nombre, Apellidos_Personal_Medico =apellido,
    FechaNacimiento_Personal_Medico=fecha, Direccion_Personal_Medico = direccion, Telefono_Personal_Medico = telefono, 
    Numero_Colegiatura =numero, Id_Tipo_Personal=personal, Id_Especialidad=especialidad where Id_Personal_Medico = idPersMe;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerPaciente`(IN v_idpaciente int)
BEGIN
	select * from paciente where id_paciente=v_idpaciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerPacientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerPacientes`(IN v_idpaciente int)
BEGIN
	select id_paciente,Doc_Id_Paciente,concat(Nombres_Paciente,' ',Apellidos_Paciente) as Nombre,FechaNacimiento_Paciente
    
    from paciente where id_paciente=v_idpaciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_seleccionarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_seleccionarHorario`(in id int)
BEGIN

select h.Id_Horario,concat (p.Nombres_Personal_Medico,' ',p.Apellidos_Personal_Medico) AS Dr

,e.Especialidad,h.Fecha, concat(h.Hora_Inicio,' a ',h.Hora_Fin) AS Horario,h.Total_Cupos,h.Cupos_Disponible from horario h

inner join personalmedico p on h.Id_Personal_Medico=p.Id_Personal_Medico

inner join especialidades e on p.Id_Especialidad=e.Id_Especialidades

where e.Id_Especialidades=id;

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

-- Dump completed on 2025-01-15 21:33:32
