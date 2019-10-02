-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mesacontrol_db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `aseguradora`
--

DROP TABLE IF EXISTS `aseguradora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aseguradora` (
  `id_aseguradora` int(100) NOT NULL AUTO_INCREMENT,
  `nombre_aseguradora` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `nombre_contacto` varchar(45) DEFAULT '',
  `telefono` varchar(45) DEFAULT '',
  `logotipo_aseguradora` varchar(200) DEFAULT '',
  PRIMARY KEY (`id_aseguradora`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aseguradora`
--

LOCK TABLES `aseguradora` WRITE;
/*!40000 ALTER TABLE `aseguradora` DISABLE KEYS */;
INSERT INTO `aseguradora` VALUES (1,'Club de Asistencia SA de CV  (Hogar)','','',''),(4,'Club de Asistencia SA de CV  (P. Vial)','','',''),(9,'IKE ASISTENCIA ','','',''),(10,'TELEMEDIC','','',''),(12,'ALLIANZ GLOBAL ','','',''),(13,'IGS SERVICIOS ','','',''),(15,'MAS SERVICIOS VIAL ','','',''),(16,'MAS SERVICIOS HOGAR','','',''),(17,'AMERICAN ASSIST MEXICO','','',''),(19,'MEXICO RED INTEGRAL(RED INTEGRAL)','','',''),(20,'ALCRIMEX (VIDRIOS)','','',''),(21,'CRISTAKAR (VIDRIOS)','','','');
/*!40000 ALTER TABLE `aseguradora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costo`
--

DROP TABLE IF EXISTS `costo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costo` (
  `id_orden` int(255) NOT NULL,
  `mano_obra` double(255,0) DEFAULT '0',
  `corres` double(255,0) DEFAULT '0',
  `kilometros` double(255,0) DEFAULT '0',
  `importe_materiales` double(255,0) DEFAULT '0',
  `total` double(255,0) DEFAULT '0',
  `cant_km` double(255,0) DEFAULT '0',
  `precio_km` double(255,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo`
--

LOCK TABLES `costo` WRITE;
/*!40000 ALTER TABLE `costo` DISABLE KEYS */;
INSERT INTO `costo` VALUES (46,100,100,100,61,361,0,0),(60,350,90,150,360,950,0,0),(59,350,10,150,1500,2010,0,0),(67,150,0,0,0,150,0,0),(68,170,0,0,0,170,0,0),(70,250,0,0,60,310,0,0),(58,250,300,140,65,755,0,0),(47,150,300,0,0,450,0,0),(72,250,0,0,119,369,0,0),(2,250,0,0,0,250,0,0),(3,250,0,0,65,315,0,0),(6,250,0,0,95,345,0,0),(5,190,0,0,190,380,0,0),(12,200,0,0,118,318,0,0),(1,250,110,400,119,879,80,5),(9,250,300,63,137,750,9,7),(15,250,300,0,200,750,0,0),(16,100,0,0,0,100,0,0),(14,250,300,0,0,550,0,0),(20,300,150,0,900,1350,0,0),(21,300,300,0,270,870,0,0),(19,250,300,0,130,680,0,0);
/*!40000 ALTER TABLE `costo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `ap_paterno` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `ap_materno` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY (`id_empleado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Graciela','Hernandez','Rodriguez','',''),(2,'Soporte','','','soporte','soporte'),(3,'Maria del Carmen','Martinez','Careaga','c01','1234'),(4,'Maria de Jesus','Lopez','Encinas','c02','1234'),(5,'Maria ','Ibarra','Bustamante','c03','1234'),(6,'Lourdes','Valenzuela','E.','c04','1234'),(7,'Francisco Javier ','Partida ','Lugo','c99','1234');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `nombre_empresa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `puerto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `url_fact` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('Pipeso','3006','Admin','admin',NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidad_fed`
--

DROP TABLE IF EXISTS `entidad_fed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidad_fed` (
  `id_entidad` int(255) NOT NULL,
  `nombre_entidad` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_entidad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad_fed`
--

LOCK TABLES `entidad_fed` WRITE;
/*!40000 ALTER TABLE `entidad_fed` DISABLE KEYS */;
INSERT INTO `entidad_fed` VALUES (25,'Sinaloa'),(26,'Sonora');
/*!40000 ALTER TABLE `entidad_fed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_orden`
--

DROP TABLE IF EXISTS `estado_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_orden` (
  `id_status` int(1) NOT NULL,
  `orden_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_orden`
--

LOCK TABLES `estado_orden` WRITE;
/*!40000 ALTER TABLE `estado_orden` DISABLE KEYS */;
INSERT INTO `estado_orden` VALUES (1,'Por asignar'),(2,'Programada'),(3,'En proceso'),(4,'Finalizada'),(5,'Facturada'),(6,'Cancelada con costo'),(7,'Cancelada sin costo');
/*!40000 ALTER TABLE `estado_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidencia`
--

DROP TABLE IF EXISTS `evidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidencia` (
  `id_evidencia` int(255) NOT NULL AUTO_INCREMENT,
  `id_orden` int(255) NOT NULL,
  `evidencia` varchar(300) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_evidencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidencia`
--

LOCK TABLES `evidencia` WRITE;
/*!40000 ALTER TABLE `evidencia` DISABLE KEYS */;
INSERT INTO `evidencia` VALUES (44,14,'14_IMG-20190918-WA0005.jpg','2019-09-19 14:13:28'),(45,14,'14_IMG-20190916-WA0000.jpg','2019-09-19 14:13:40'),(46,14,'14_Screenshot_20190915-173116_Twitter.jpg','2019-09-19 14:14:02'),(47,14,'14_dribbble-302.png','2019-09-19 15:53:23'),(48,46,'46_15692800798348258519851985684013.jpg','2019-09-23 18:07:57'),(49,70,'70_1569281210900404990533947387417.jpg','2019-09-23 18:26:44'),(50,70,'70_15692818314615810044239804569496.jpg','2019-09-23 18:37:00'),(51,72,'72_15693474895322052053064386721654.jpg','2019-09-24 12:51:17'),(52,72,'72_1569352330761834919877277420554.jpg','2019-09-24 14:11:36'),(53,1,'1_15693540984387478635046776765524.jpg','2019-09-24 14:41:03'),(54,1,'1_15693541235553493825824842491256.jpg','2019-09-24 14:41:21'),(55,2,'2_IMG-20190924-WA0120.jpeg','2019-09-24 19:55:08'),(56,2,'2_IMG-20190924-WA0120.jpeg','2019-09-24 19:55:21'),(57,2,'2_IMG-20190924-WA0112.jpeg','2019-09-24 19:56:57'),(58,3,'3_122 X 244 PIPESO CIBUTA.jpg','2019-09-26 09:45:19'),(59,5,'5_20190926_104744.jpg','2019-09-26 11:47:24'),(60,5,'5_20190926_104750.jpg','2019-09-26 11:47:38'),(61,3,'3_15695177461102646227696375465213.jpg','2019-09-26 12:08:15'),(62,6,'6_1569521475769879642117731274542.jpg','2019-09-26 13:11:21'),(63,6,'6_15695219719335714712082585001469.jpg','2019-09-26 13:19:35'),(64,12,'12_15695411611805622195875494288132.jpg','2019-09-26 18:39:18'),(65,12,'12_1569541187141592682647673570617.jpg','2019-09-26 18:39:47'),(66,13,'13_575390AE-1432-42B7-BB8A-582F470F66CA.jpeg','2019-09-29 13:27:03'),(67,13,'13_C22C1FBB-04DC-405D-80AA-02B179D77E75.jpeg','2019-09-29 13:27:56'),(68,13,'13_image.jpg','2019-09-29 13:50:17'),(69,15,'15_casa de família multi-geracional _ Arquitetos de boas-vindas #Rustico.jpg','2019-09-30 12:10:43'),(70,15,'15_28277144_1469437953182457_6517912912330842040_n.png','2019-09-30 12:11:25'),(71,15,'15_IMG-20190930-WA0000.jpg','2019-09-30 13:26:30'),(72,15,'15_IMG-20190930-WA0001.jpg','2019-09-30 13:30:27'),(73,15,'15_IMG-20190930-WA0001.jpg','2019-09-30 13:30:31'),(74,16,'16_IMG-20190930-WA0115.jpg','2019-09-30 21:19:00'),(75,16,'16_IMG-20190930-WA0114.jpg','2019-09-30 21:19:10'),(76,19,'19_IMG-20191001-WA0017.jpeg','2019-10-01 12:38:46'),(77,20,'20_reg dañada.jpg','2019-10-01 13:08:00'),(78,20,'20_reg nueva.jpg','2019-10-01 13:08:10'),(79,20,'20_reg nueva2.jpg','2019-10-01 13:08:17'),(80,21,'21_20191001_121224.jpg','2019-10-01 15:56:48'),(81,21,'21_IMG-20191001-WA0015.jpeg','2019-10-01 16:07:38'),(82,21,'21_20191001_134749.jpg','2019-10-01 16:13:51'),(83,18,'18_IMG-20190930-WA0095.jpg','2019-10-01 20:13:24'),(84,18,'18_IMG-20190930-WA0094.jpg','2019-10-01 20:13:45'),(85,18,'18_IMG-20190930-WA0093.jpg','2019-10-01 20:14:12'),(86,18,'18_IMG-20190930-WA0091.jpg','2019-10-01 20:14:32'),(87,24,'24_IMG-20191001-WA0082.jpg','2019-10-01 20:15:36'),(88,24,'24_IMG-20191001-WA0081.jpg','2019-10-01 20:15:51'),(89,24,'24_IMG-20191001-WA0080.jpg','2019-10-01 20:16:10'),(90,24,'24_IMG-20191001-WA0079.jpg','2019-10-01 20:16:23'),(91,24,'24_IMG-20191001-WA0077.jpg','2019-10-01 20:17:09'),(92,24,'24_IMG-20191001-WA0076.jpg','2019-10-01 20:17:25');
/*!40000 ALTER TABLE `evidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_orden`
--

DROP TABLE IF EXISTS `historial_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_orden` (
  `id_movimiento` int(255) NOT NULL,
  `id_tipo_usuario` int(255) DEFAULT NULL,
  `id_orden` int(255) DEFAULT NULL,
  `id_estdo_orden` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_orden`
--

LOCK TABLES `historial_orden` WRITE;
/*!40000 ALTER TABLE `historial_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `id_orden` int(255) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `cantidad` double(255,0) DEFAULT '0',
  `precio_unitario` double(255,0) DEFAULT '0',
  `importe` double(255,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (46,'Tornillo',1,1,1),(46,'GUASA DE PRESION',10,1,10),(46,'Llave de Jardin',1,50,50),(60,'H2O aire',30,12,360),(59,'H2O ',30,50,1500),(70,'Llave de control',1,60,60),(58,'Manguera lavabo',1,65,65),(72,'gasolina magna ',7,17,119),(3,'',0,0,0),(3,'Manguera wc',1,65,65),(6,'',0,0,0),(6,'Valvila de flotador',1,95,95),(5,'Tapa doble co tacto',1,70,70),(5,'Contacto',2,40,80),(5,'CINTA AISLANTE',1,40,40),(12,'Vsd',1,118,118),(1,'Gasolina magna',7,17,119),(9,'GASOLINA',7,20,137),(15,'Cerradura mariposa',1,200,200),(20,'Regadera Lorenceti',1,400,400),(20,'Cable calibre 10 color Rojo',25,10,250),(20,'Cable calibre 10 color Negro',25,10,250),(21,'Centro de carga de 2 circuitos',1,130,130),(21,'Térmico sencillo 40 amperes',1,140,140),(19,'Gasolina Premium',7,19,130);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `id_entidad` int(255) NOT NULL,
  `id_municipio` int(255) NOT NULL,
  `nombre_municipio` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_entidad`,`id_municipio`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (25,1872,'Culiacán'),(25,1873,'Navolato'),(25,1874,'Badiraguato'),(25,1875,'Cosalá'),(25,1876,'Mocorito'),(25,1877,'Guasave'),(25,1878,'Ahome'),(25,1879,'Salvador Alvarado'),(25,1880,'Angostura'),(25,1881,'Choix'),(25,1882,'El Fuerte'),(25,1883,'Sinaloa'),(25,1884,'Mazatlán'),(25,1885,'Escuinapa'),(25,1886,'Concordia'),(25,1887,'Elota'),(25,1888,'Rosario'),(25,1889,'San Ignacio'),(26,1890,'Hermosillo'),(26,1891,'San Miguel de Horcasitas'),(26,1892,'Carbó'),(26,1893,'San Luis Río Colorado'),(26,1894,'Puerto Peñasco'),(26,1895,'General Plutarco Elías Calles'),(26,1896,'Caborca'),(26,1897,'Altar'),(26,1898,'Tubutama'),(26,1899,'Atil'),(26,1900,'Oquitoa'),(26,1901,'Sáric'),(26,1902,'Benjamín Hill'),(26,1903,'Trincheras'),(26,1904,'Pitiquito'),(26,1905,'Nogales'),(26,1906,'Imuris'),(26,1907,'Santa Cruz'),(26,1908,'Magdalena'),(26,1909,'Naco'),(26,1910,'Agua Prieta'),(26,1911,'Fronteras'),(26,1912,'Nacozari de García'),(26,1913,'Bavispe'),(26,1914,'Bacerac'),(26,1915,'Huachinera'),(26,1916,'Nácori Chico'),(26,1917,'Granados'),(26,1918,'Bacadéhuachi'),(26,1919,'Cumpas'),(26,1920,'Huásabas'),(26,1921,'Moctezuma'),(26,1922,'Villa Hidalgo'),(26,1923,'Santa Ana'),(26,1924,'Cananea'),(26,1925,'Arizpe'),(26,1926,'Cucurpe'),(26,1927,'Bacoachi'),(26,1928,'San Pedro de la Cueva'),(26,1929,'Divisaderos'),(26,1930,'Tepache'),(26,1931,'Villa Pesqueira'),(26,1932,'Opodepe'),(26,1933,'Huépac'),(26,1934,'Banámichi'),(26,1935,'Ures'),(26,1936,'Aconchi'),(26,1937,'Baviácora'),(26,1938,'San Felipe de Jesús'),(26,1939,'Rayón'),(26,1940,'Cajeme'),(26,1941,'Navojoa'),(26,1942,'Huatabampo'),(26,1943,'Bácum'),(26,1944,'Etchojoa'),(26,1945,'Benito Juárez'),(26,1946,'Empalme'),(26,1947,'Guaymas'),(26,1948,'San Ignacio Río Muerto'),(26,1949,'La Colorada'),(26,1950,'Mazatán'),(26,1951,'Suaqui Grande'),(26,1952,'Sahuaripa'),(26,1953,'San Javier'),(26,1954,'Soyopa'),(26,1955,'Bacanora'),(26,1956,'Arivechi'),(26,1957,'Rosario'),(26,1958,'Quiriego'),(26,1959,'Onavas'),(26,1960,'Alamos'),(26,1961,'Yécora');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `id_orden` int(255) DEFAULT NULL,
  `id_aseguradora` int(5) NOT NULL,
  `expediente` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `facturado` datetime(6) DEFAULT NULL,
  `levantamiento` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `asignada` varchar(100) DEFAULT NULL,
  `cancelada` datetime DEFAULT NULL,
  `folio_cierre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `id_status` int(1) DEFAULT '1',
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `id_servicio` int(5) DEFAULT '0',
  `id_poliza` int(10) DEFAULT '0',
  `benef_nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `benef_paterno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `benef_materno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `recibe_benef` int(10) DEFAULT '0',
  `recibe_nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `recibe_materno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `recibe_paterno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `id_tecnico` int(5) DEFAULT '0',
  `observaciones` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `arribo` varchar(100) DEFAULT NULL,
  `fin` datetime(6) DEFAULT NULL,
  `calle` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `num_ext` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `num_int` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `col` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `id_municipio` int(255) DEFAULT '0',
  `id_estado` int(255) DEFAULT '0',
  `entre_calle1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `entre_calle2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `referencia` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `servicio_vial` int(10) DEFAULT '0',
  `vehiculo_tipo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `vehiculo_color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `vehiculo_placa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `vehiculo_ubicacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `vehiculo_combustible` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `vehiculo_litros` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `folio_recepcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `folio_factura` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `id_tipo` int(10) unsigned DEFAULT '1',
  `url_pdf` varchar(500) DEFAULT '',
  `url_xml` varchar(500) DEFAULT '',
  PRIMARY KEY (`id_aseguradora`,`expediente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (18,0,'1',NULL,'2019-09-30 15:08:39.168200','2019-09-30 15:08:00.000000',NULL,'',4,'falla en 1/2 casa tiene luz',4,0,'','','',0,'Maximiliano','','',0,'','2019-10-1 18:8','2019-10-01 20:36:34.000000','Fronteras ','173-A','','san benito',1890,26,'esq cuernavaca','','',0,'','','','','','','','',2,'',''),(24,0,'2',NULL,'2019-10-01 20:04:47.494600','2019-10-01 17:01:00',NULL,'',4,'revision de trabajos de plomeria',2,0,'','','',0,'fidel ','Quezada','Jimenez',28,'','2019-10-1 18:15','2019-10-01 20:17:33.000000','blvd antonio quiroga','344','','luis donaldo colosio',1890,26,'','','quezada mayoreo',0,'','','','','','','','',2,'',''),(10,1,'1111','2019-09-26 18:03:39.000000','2019-09-26 17:47:06.880800','2019-09-26 18:47:00.000000',NULL,'123456',5,'FUGA EN LLAVE JARDIN',2,2,'AAAAAAAAA','AAA','AAA',1,'','','',7,'','2019-09-26 20:49:00.000000','2019-09-26 18:02:48.000000','AAAAA','AAA','null','AAAAAA',1879,25,'','','',0,'','','','','','','','fc08976',1,'',''),(19,1,'13441289',NULL,'2019-10-01 10:47:28.029600','2019-10-01 16:33:59',NULL,'',4,'7  premium\n',1,1,'fco jose ','VALENZUELA','',1,'','','',12,'','2019-10-1 12:11','2019-10-01 14:10:17.000000','plan de agua prieta','','','luis echeverria',1940,26,'esq. otilio montañoi','','atras de ley expres',0,'dodge duarango 2004','negro','3311','','premium','7','','',1,'',''),(12,1,'181661','2019-09-26 18:59:24.000000','2019-09-26 18:32:10.439400','2019-09-26 10:30:00.000000',NULL,'13426648',5,'VIDRIO ROTO QUE DA AL EXTERIOR ',8,1,'MANUEL ','HOLGUIN ','',1,'','','',11,'Vidrio que da paña  calle de 0.37 x 0.91 vsd','2019-09-26 17:33:00.000000','2019-09-26 18:38:45.000000','PRIVADA GRANADA ','8','null','las lomas ',1890,26,'privada granadas ','privada la rioja ','',0,'','','','','','','','',1,'',''),(8,1,'181822','2019-09-26 18:41:12.000000','2019-09-26 16:47:27.212400','2019-09-26 15:17:00.000000',NULL,'',5,'APERTURA DE CERRADURA ',10,2,'DAVID ALBERTO','DURAN','FIERRO',1,'','','',12,'','2019-09-26 17:24:00.000000','2019-09-26 17:46:14.000000','JUAREZ','466',NULL,'BENITO JUAREZ',1940,26,'ZARAGOZA','REVOLUCION','',0,'','','','','','','','',1,'',''),(15,1,'182197','2019-09-30 12:10:02.000000','2019-09-30 10:13:21.015800','2019-09-30 12:09:00.000000',NULL,'',5,'APERTURA DE DOMICILIO ',10,1,'ALBERTO','ROJAS','LOPEZ',1,'','','',12,'','2019-09-30 12:08:00.000000','2019-09-30 12:09:35.000000','SAN ANTONIO','2359','','EL CAMPANARIO',1940,26,'ESQ BARTOLOME DELGADO','','FRENTE A UN SUPER DEL NORTE',0,'','','','','','','','',1,'',''),(17,1,'182307',NULL,'2019-09-30 15:05:41.923600','2019-09-30 23:17:47',NULL,'',4,'vidrio roto que da a la calle',8,1,'Ana Lourdes','Morales ','Espinoza',1,'','','',9,'','2019-9-30 18:30','2019-10-01 10:13:24.000000','provincia asturias','3 B','','Las Lomas',1890,26,'entre paseo santa cruz','','a espaldas de abarrotes almacen',0,'','','','','','','','',1,'',''),(23,1,'182524',NULL,'2019-10-01 18:57:13.464600','2019-10-02 23:42:20',NULL,'',2,'VIDRIO  ROTO EN RECAMARA\n',8,1,'MAYRA LIZETH','MORENO ','GONZALEZ',1,'','','',8,'',NULL,NULL,'RETORNO TOUGLANI ','56','','villa bonita',1890,26,'','','entrada por villa lourdes , casa de dos pisos y enseguida de un lote baldio',0,'','','','','','','','',1,'',''),(9,1,'ordenPrueba','2019-09-29 15:02:12.000000','2019-09-26 17:10:49.219000','2019-09-27 20:50:00.000000',NULL,'123',5,'Drenaje tapado',2,1,'Trabajo','','',1,'','','',0,'','2019-09-26 17:50:00.000000','2019-09-26 17:46:23.000000','Callejón Domingo Rubí','444','null','AHOME',1878,25,'','','',0,'','','','','','','','321',1,'',''),(25,1,'pruebachuy',NULL,'2019-10-01 21:27:09.317200','2019-10-02 00:33:59',NULL,'',2,'prueba',2,1,'prueba','prueba','prueba',1,'','','',30,'',NULL,NULL,'cocrit','20','','lopez mateos',1940,26,'miguel aleman ','12','atras del oxxo',0,'','','','','','','','',1,'',''),(1,4,'13422690','2019-09-24 14:50:29.000000','2019-09-24 14:39:25.067200','2019-09-26 22:45:00.000000',NULL,'5354609',4,'SUMINISTRO 7 LTS GASOLINA',1,2,'OLGA VERONICA ','CEJUDO','',1,'','','',6,'','2019-09-26 17:25:00.000000','2019-09-26 17:45:56.000000','MIGUEL ALEMAN  NORTE ','null','null','null',1940,26,'ESQ 6 DE ABRIL','','',1,'RAV4 MODELO 2010','PLATA','83-A','','MAGNA','7  LITROS ','','',1,'',''),(2,9,'15716013',NULL,'2019-09-24 17:32:46.962400','2019-09-24 17:41:00.000000',NULL,'',4,'APERTURA DE PUERTA PRINCIPAL',10,14,'MYRNA GUADALUPE ','ACUÑA ','OSORIO ',1,'','','',12,'','2019-09-24 17:51:00.000000','2019-09-24 19:57:47.000000','CALLE SOYOPA ','916','null','LA JOYA',1940,26,'QUINTANA ROO','ONAVAS','HAY UN TINACO ENFRENTE DE LA CALLE ',0,'','','','','','','','',1,'',''),(6,9,'15721138 ','2019-09-26 17:06:46.000000','2019-09-26 13:02:27.041600','2019-09-26 21:23:00.000000',NULL,'1234',5,'fuga en tuberia de tinacoo',2,9,'DORA ESTELA','CLARK ','LOPEZ',1,'','','',7,'No sirve valvula de llenado','2019-09-26 20:06:00.000000','2019-09-26 17:06:05.000000','saturnino campoy','1085','null','hacienda del sol',1890,26,'cabo san lucas ','de los maestros','en la purificadora de agua y ferrteria',0,'','','','','','','','fc2345',1,'',''),(13,9,'15729555',NULL,'2019-09-29 13:10:17.311200','2019-09-29 12:08:00.000000',NULL,'',4,'fuga de agua en el fregadero',2,10,'Juan','Salazar','',1,'','','',10,'Estaba tapado el filtro de la llave','2019-09-29 12:24:00.000000','2019-09-29 13:28:31.000000','FLORES MAGON ANDADOR O','13','','Las Granjas',1890,26,'minorca ','olivares','CERCA DE ESCUELA GOMEZ MAGON',0,'','','','','','','','',1,'',''),(14,9,'15731769',NULL,'2019-09-30 10:01:51.588400','2019-09-30 15:50:00.000000',NULL,'',4,'APERTURA DE AUTO',10,10,'LILIANA','GARCIA','MARTINEZ',1,'','','',12,'Apertura puerta chofer','2019-9-30 8:38','2019-10-01 10:44:33.000000','CONQUISTADORES ','422','','URBI VILLA DEL REY',1940,26,'','','LA POLICIA CERCA DEL DOMICILIO',1,'CHEVROLET SILVERADO 2001','BLANCO','VB 33 712','','','','','',1,'',''),(16,9,'15732951',NULL,'2019-09-30 14:47:49.313600','2019-09-30 17:00:00',NULL,'15732951',4,'CORTO CIRCUITO GENERAL',4,10,'Julio Cesar','Camargo','Rodriguez',1,'','','',27,'Se hizo revisión de centro de carga y base de medición, se checo voltaje y estaba todo correcto','2019-9-30 17:50','2019-09-30 20:55:34.000000','ISEO PONIENTE ','3416','','Residencial Montecarlo',1940,26,' JESUS GARCIA ','oasis','A ESPALDA DE SUPER MONTECARLO RECIBE ILEANA CASTRO ',0,'','','','','','','','',1,'',''),(21,9,'15735584',NULL,'2019-10-01 15:39:16.334200','2019-10-01 20:36:00',NULL,'15735584',4,'corto circuito parcial',4,9,'Lorena Guadalupe','Cabos ','Diaz',1,'','','',27,'Diagnostico. Corto circuito en centro de carga principal y térmico dañado.\nSolución: cambiar centro de carga y térmico. ','2019-10-1 13:43','2019-10-01 16:23:30.000000','los Legionarios','2709','','Las haciendas',1940,26,'Franciscanos y','Lagunas','',0,'','','','','','','','',1,'',''),(3,9,'30800100','2019-09-26 10:03:04.000000','2019-09-25 14:17:39.485200','2019-09-25 23:31:00.000000',NULL,'123',5,'gasl',1,1,'Camilo ','Sesto','',1,'','','',7,'','2019-09-26 08:03:00.000000','2019-09-26 10:03:02.000000','km 34 hillo - nogales','null','null','AHOME',1939,26,'','','',1,'HONDA CIVIC 2002','ROJO','9504VPS','KM 39','MAGNA','20','','',1,'3_F-19629.xml',''),(11,9,'9998888','2019-09-26 18:07:25.000000','2019-09-26 18:00:35.748000','2019-09-26 16:01:00.000000',NULL,'45644',5,'FUGA',2,9,'CHABELO','','',1,'','','',7,'','2019-09-26 17:02:00.000000','2019-09-26 18:07:23.000000','MUEBLES TRONCOSO','null','null','SI',1889,25,'','','',0,'','','','','','','','FV001',1,'',''),(20,9,'Z0001','2019-10-01 13:10:49.000000','2019-10-01 13:01:07.418200','2019-10-02 15:02:00',NULL,'FC001',5,'Reposición de cable y regadera eléctrica',4,9,'Juan','Dominguez ','No me chingues',1,'','','',7,'','2019-10-2 9:14','2019-10-01 13:07:31.000000','Leyva','350','','Los Mochis',1878,25,'Juarez','Independencia','Frente casa de cambio',0,'','','','','','','','A3750',1,'20_A3750.xml',''),(5,10,'9999',NULL,'2019-09-26 11:38:10.217400','2019-09-26 13:39:00.000000',NULL,'',4,'reposicion contacto',4,1,'Maria del Carmen','Soto','Armenta',1,'','','',7,'','2019-09-26 10:43:00.000000','2019-09-26 11:43:21.000000','Huertos','2250','null','HERMOSILLO',1890,26,'Mangos','Aguacates','',0,'','','','','','','','',1,'',''),(22,12,'H119000872',NULL,'2019-10-01 16:21:51.691000','2019-10-01 21:08:00',NULL,'',2,'FUGA EN LABAVO DEL BAÑO',2,0,'BLANCA IDALIA ','OLEA','RUIZ',1,'','','',11,'',NULL,NULL,'CERRADA LA BARRANCA','30','','CASA BONITA',1890,26,'BLVD AGUSTIN DEL CAMPO','','CASA BEICH C/ ROJO Y  CARRO DE TACOS',0,'','','','','','','','',1,'','');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poliza`
--

DROP TABLE IF EXISTS `poliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poliza` (
  `id_aseguradora` int(10) NOT NULL,
  `id_poliza` int(255) NOT NULL,
  `poliza_nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `poliza_valor` double(255,0) DEFAULT '0',
  `poliza_cancelacion` double(255,0) DEFAULT '0',
  `poliza_costo` double(255,0) DEFAULT '0',
  PRIMARY KEY (`id_aseguradora`,`id_poliza`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poliza`
--

LOCK TABLES `poliza` WRITE;
/*!40000 ALTER TABLE `poliza` DISABLE KEYS */;
INSERT INTO `poliza` VALUES (1,1,'Liverpool',400,150,345),(1,2,'Suburbia',400,150,345),(1,3,'Axtel',500,150,431),(1,4,'Asistencia Trus',400,150,345),(4,1,'LIVERPOOL VIAL HMO',250,150,250),(4,2,'LIVERPOOL  VIAL FORANEO',300,150,300),(9,1,'ASISTENCIA MUJER  BANORTE',500,0,450),(9,2,'ASISTENCIA INTEGRALSCOTIABANK CREDITO',400,0,450),(9,3,'ASISTENCIA CREDITO HSBC',500,0,450),(9,4,'ASISTENCIA HABITT',500,0,450),(9,5,'ADT PLUS RESIDENCIAL',500,0,450),(9,6,'GNP',862,0,450),(9,7,'BANAMEX HOGAR Y AJUSTES',1000,0,450),(9,8,'LIBRA PLUS',500,0,450),(10,1,'Bancomer',500,200,500),(17,1,'COSTO POR KM (SERVICIO VIAL)',0,0,0),(17,2,'PLOMERIA (BASICO)',390,0,0),(17,3,'SANITARIO (SOLO MANO DE OBRA)',650,0,0),(17,4,'ELECTRICIDAD',390,0,0),(17,5,'CERRAJERIA',400,0,0);
/*!40000 ALTER TABLE `poliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int(255) NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `descripcion_servicio` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `erp` varchar(50) DEFAULT '',
  PRIMARY KEY (`id_servicio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Gasolina','Suministro de gasolina a un vehículo en la dirección acordada por el cliente','GAS'),(2,'Plomeria',' Trabajos de plomeria menor en domicilios particular','PLO'),(4,'Electricidad','Mantenimiento y reparación de instalaciones eléctricas particulares','ELE'),(6,'Impermeabilización',' Servicio de impermeabilizar ','IMP'),(7,'Taxi','Traslado de personas de un lugar a otro indicado por la aseguradora','TX'),(8,'Vidrio','cambio de cristales en ventanas y puertas','VID'),(9,'Aluminio','Fabricacion y Reparacion de canceleria, puertas y ventanas de aluminio',''),(10,'Cerrajeria',' Apertura de cerraduras, candados y automoviles',''),(11,'Albañileria','Trabajos menor de albañileria',''),(12,'Herreria','fabricacion y reparacion de trabajos de herreria',''),(14,'Paso de Corriente','pasar corriente a vehiculos con cables o jumper','FPASO'),(15,'Refrigeracion','servicio de mantenimiento preventivo a aire acondicionado',''),(16,'Pintura','aplicacion de pintura en muros estanteria  y rejas','PIN'),(17,'Carpinteria','fabricacion y reparacion de muebles de madera','CARP'),(18,'Cambio de Llanta','Cambio de llanta baja por llnata de refaccion nota no se parchan llantas ni se llevan a llantera el cliente debe contar con dados para candados de rines ','FLLANTA'),(19,'Tablaroca',' fabricacion de panel de yeso y durock co n estructura metalica para divisiones','');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `id_tecnico` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ap_paterno` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ap_materno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `id_estado` int(10) DEFAULT '0',
  `id_municipio` int(10) DEFAULT '0',
  `servicios` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `num_cel` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `num_fijo` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `datos_banco` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_tecnico`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
INSERT INTO `tecnico` VALUES (6,'Javier','Partida','Lugo',0,26,1890,'1,7,2,4,6,8,9,10,11,12,14','6622568642','','','javier.lugo','javierlugo'),(7,'Juan Carlos','Valenzuela','',0,26,1890,'1,14,18','6624481297','','Banorte ','juancarlosvalenzuela','1234'),(8,'Rey Baltazar','Maldonado','Samayoa',0,26,1890,'8,9,10,7,1,14','6621786167','','','maldonado','1234'),(9,'Rene ','Gonzalez','',0,26,1890,'8,9,6,16','6621429182','','','',''),(10,'Jose','Chavez','Gaviño',0,26,1890,'2,12,8','6621454790','','','josechavez','1234'),(11,'Ramon ','Mac Group','',0,26,1890,'4,2,8,12','6621575936','','','ramonmac','1234'),(12,'Juan Carlos ','Acha','Piña',0,26,1940,'10,1,7','6444082100','','','Juan.acha','2100'),(13,'Adrian ','Acosta','',0,26,1940,'1,14','','','','',''),(14,'Genaro','Muñoz','',0,26,1947,'2,4,6','6221112745','','','',''),(15,'Cristhian','Reyna','',0,26,0,'6,4,2,15','6564194245','','','',''),(16,'Carlos ','Contreras','',0,26,1890,'19','6623530203','','','',''),(17,'Francisco','Rodriguez','',0,26,1924,'2,4,6,12,16','6453335111','','','',''),(18,'Juan Ramon ','Esquer','',0,26,1940,'2,8','','','','',''),(19,'Marcos ','Valenzuela','',0,26,1890,'10','6622004816','6622249468','','',''),(20,'Joel','Magaña','',0,26,1940,'4,15,2','6441219761','','','',''),(21,'Everardo ','Gutierrez','',0,26,1890,'16,6,11','6621554880','','','',''),(22,'Omar ','Becerra','Gomez',0,26,1890,'2,4,15','6623953740','','','',''),(23,'Armando','Veloz','',0,26,1905,'8','6311028328','','','',''),(24,'German ','Noperi ','',0,26,1890,'7,1,14','6621600437','','','',''),(25,'Ivan ','Gonzalez','',0,26,1947,'10','6221513625','','','',''),(26,'Eliseo','Perez','',0,26,1910,'2,4,6,7,8,9,10,11,12,14,15,16,17,18,19','6333349000',NULL,'Santander ',NULL,NULL),(27,'Mario ','Soto','',0,26,1940,'4','6441222221',NULL,NULL,'mariosoto','2221'),(28,'Marco','Delgado','Gaspar',0,26,1890,'2,4,15','6621237054',NULL,NULL,'mariodelgado','7054'),(29,'Marco','Delgado','Gaspar',0,26,1890,'4,15,2','6621237054',NULL,NULL,NULL,NULL),(30,'Jesus Maria','Lopez','Castro',0,26,1940,'2,8,9','6441738063',NULL,NULL,'jesuslopez','8063');
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_user` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-01 23:04:41
