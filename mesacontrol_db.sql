/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 100316
 Source Host           : localhost:3306
 Source Schema         : mesacontrol_db

 Target Server Type    : MySQL
 Target Server Version : 100316
 File Encoding         : 65001

 Date: 04/09/2019 16:42:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aseguradora
-- ----------------------------
DROP TABLE IF EXISTS `aseguradora`;
CREATE TABLE `aseguradora`  (
  `id_aseguradora` int(100) NOT NULL AUTO_INCREMENT,
  `nombre_aseguradora` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`id_aseguradora`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of aseguradora
-- ----------------------------
INSERT INTO `aseguradora` VALUES (1, 'Club de Asistencia SA de CV  (Hogar)');
INSERT INTO `aseguradora` VALUES (4, 'Club de Asistencia SA de CV  (P. Vial)');
INSERT INTO `aseguradora` VALUES (9, 'IKE ASISTENCIA ');
INSERT INTO `aseguradora` VALUES (10, 'TELEMEDIC');
INSERT INTO `aseguradora` VALUES (12, 'ALLIANZ GLOBAL ');
INSERT INTO `aseguradora` VALUES (13, 'IGS SERVICIOS ');
INSERT INTO `aseguradora` VALUES (15, 'MAS SERVICIOS VIAL ');
INSERT INTO `aseguradora` VALUES (16, 'MAS SERVICIOS HOGAR');
INSERT INTO `aseguradora` VALUES (17, 'AMERICAN ASSIST MEXICO');
INSERT INTO `aseguradora` VALUES (19, 'MEXICO RED INTEGRAL(RED INTEGRAL)');
INSERT INTO `aseguradora` VALUES (20, 'ALCRIMEX (VIDRIOS)');
INSERT INTO `aseguradora` VALUES (21, 'CRISTAKAR (VIDRIOS)');

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado`  (
  `id_empleado` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `ap_paterno` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `ap_materno` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`id_empleado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES (1, 'Graciela', 'Hernandez', 'Rodriguez', 'graciela', 'pipeso');

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `nombre_empresa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `puerto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `url_fact` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES ('Pipeso', '3006', 'Admin', 'admin', NULL);

-- ----------------------------
-- Table structure for entidad_fed
-- ----------------------------
DROP TABLE IF EXISTS `entidad_fed`;
CREATE TABLE `entidad_fed`  (
  `id_entidad` int(255) NOT NULL,
  `nombre_entidad` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_entidad`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of entidad_fed
-- ----------------------------
INSERT INTO `entidad_fed` VALUES (25, 'Sinaloa');
INSERT INTO `entidad_fed` VALUES (26, 'Sonora');

-- ----------------------------
-- Table structure for estado_orden
-- ----------------------------
DROP TABLE IF EXISTS `estado_orden`;
CREATE TABLE `estado_orden`  (
  `id_status` int(1) NOT NULL,
  `orden_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estado_orden
-- ----------------------------
INSERT INTO `estado_orden` VALUES (1, 'Por asignar');
INSERT INTO `estado_orden` VALUES (2, 'Programada');
INSERT INTO `estado_orden` VALUES (3, 'En proceso');
INSERT INTO `estado_orden` VALUES (4, 'Finalizada');
INSERT INTO `estado_orden` VALUES (5, 'Facturada');
INSERT INTO `estado_orden` VALUES (6, 'Cancelada con costo');
INSERT INTO `estado_orden` VALUES (7, 'Cancelada sin costo');

-- ----------------------------
-- Table structure for evidencia
-- ----------------------------
DROP TABLE IF EXISTS `evidencia`;
CREATE TABLE `evidencia`  (
  `id_evidencia` int(255) NOT NULL AUTO_INCREMENT,
  `id_orden` int(255) NOT NULL,
  `evidencia` blob NULL,
  `fecha` datetime(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id_evidencia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for historial_orden
-- ----------------------------
DROP TABLE IF EXISTS `historial_orden`;
CREATE TABLE `historial_orden`  (
  `id_movimiento` int(255) NOT NULL,
  `id_tipo_usuario` int(255) NULL DEFAULT NULL,
  `id_orden` int(255) NULL DEFAULT NULL,
  `id_estdo_orden` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for municipio
-- ----------------------------
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio`  (
  `id_entidad` int(255) NOT NULL,
  `id_municipio` int(255) NOT NULL,
  `nombre_municipio` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_entidad`, `id_municipio`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of municipio
-- ----------------------------
INSERT INTO `municipio` VALUES (25, 1872, 'Culiacán');
INSERT INTO `municipio` VALUES (25, 1873, 'Navolato');
INSERT INTO `municipio` VALUES (25, 1874, 'Badiraguato');
INSERT INTO `municipio` VALUES (25, 1875, 'Cosalá');
INSERT INTO `municipio` VALUES (25, 1876, 'Mocorito');
INSERT INTO `municipio` VALUES (25, 1877, 'Guasave');
INSERT INTO `municipio` VALUES (25, 1878, 'Ahome');
INSERT INTO `municipio` VALUES (25, 1879, 'Salvador Alvarado');
INSERT INTO `municipio` VALUES (25, 1880, 'Angostura');
INSERT INTO `municipio` VALUES (25, 1881, 'Choix');
INSERT INTO `municipio` VALUES (25, 1882, 'El Fuerte');
INSERT INTO `municipio` VALUES (25, 1883, 'Sinaloa');
INSERT INTO `municipio` VALUES (25, 1884, 'Mazatlán');
INSERT INTO `municipio` VALUES (25, 1885, 'Escuinapa');
INSERT INTO `municipio` VALUES (25, 1886, 'Concordia');
INSERT INTO `municipio` VALUES (25, 1887, 'Elota');
INSERT INTO `municipio` VALUES (25, 1888, 'Rosario');
INSERT INTO `municipio` VALUES (25, 1889, 'San Ignacio');
INSERT INTO `municipio` VALUES (26, 1890, 'Hermosillo');
INSERT INTO `municipio` VALUES (26, 1891, 'San Miguel de Horcasitas');
INSERT INTO `municipio` VALUES (26, 1892, 'Carbó');
INSERT INTO `municipio` VALUES (26, 1893, 'San Luis Río Colorado');
INSERT INTO `municipio` VALUES (26, 1894, 'Puerto Peñasco');
INSERT INTO `municipio` VALUES (26, 1895, 'General Plutarco Elías Calles');
INSERT INTO `municipio` VALUES (26, 1896, 'Caborca');
INSERT INTO `municipio` VALUES (26, 1897, 'Altar');
INSERT INTO `municipio` VALUES (26, 1898, 'Tubutama');
INSERT INTO `municipio` VALUES (26, 1899, 'Atil');
INSERT INTO `municipio` VALUES (26, 1900, 'Oquitoa');
INSERT INTO `municipio` VALUES (26, 1901, 'Sáric');
INSERT INTO `municipio` VALUES (26, 1902, 'Benjamín Hill');
INSERT INTO `municipio` VALUES (26, 1903, 'Trincheras');
INSERT INTO `municipio` VALUES (26, 1904, 'Pitiquito');
INSERT INTO `municipio` VALUES (26, 1905, 'Nogales');
INSERT INTO `municipio` VALUES (26, 1906, 'Imuris');
INSERT INTO `municipio` VALUES (26, 1907, 'Santa Cruz');
INSERT INTO `municipio` VALUES (26, 1908, 'Magdalena');
INSERT INTO `municipio` VALUES (26, 1909, 'Naco');
INSERT INTO `municipio` VALUES (26, 1910, 'Agua Prieta');
INSERT INTO `municipio` VALUES (26, 1911, 'Fronteras');
INSERT INTO `municipio` VALUES (26, 1912, 'Nacozari de García');
INSERT INTO `municipio` VALUES (26, 1913, 'Bavispe');
INSERT INTO `municipio` VALUES (26, 1914, 'Bacerac');
INSERT INTO `municipio` VALUES (26, 1915, 'Huachinera');
INSERT INTO `municipio` VALUES (26, 1916, 'Nácori Chico');
INSERT INTO `municipio` VALUES (26, 1917, 'Granados');
INSERT INTO `municipio` VALUES (26, 1918, 'Bacadéhuachi');
INSERT INTO `municipio` VALUES (26, 1919, 'Cumpas');
INSERT INTO `municipio` VALUES (26, 1920, 'Huásabas');
INSERT INTO `municipio` VALUES (26, 1921, 'Moctezuma');
INSERT INTO `municipio` VALUES (26, 1922, 'Villa Hidalgo');
INSERT INTO `municipio` VALUES (26, 1923, 'Santa Ana');
INSERT INTO `municipio` VALUES (26, 1924, 'Cananea');
INSERT INTO `municipio` VALUES (26, 1925, 'Arizpe');
INSERT INTO `municipio` VALUES (26, 1926, 'Cucurpe');
INSERT INTO `municipio` VALUES (26, 1927, 'Bacoachi');
INSERT INTO `municipio` VALUES (26, 1928, 'San Pedro de la Cueva');
INSERT INTO `municipio` VALUES (26, 1929, 'Divisaderos');
INSERT INTO `municipio` VALUES (26, 1930, 'Tepache');
INSERT INTO `municipio` VALUES (26, 1931, 'Villa Pesqueira');
INSERT INTO `municipio` VALUES (26, 1932, 'Opodepe');
INSERT INTO `municipio` VALUES (26, 1933, 'Huépac');
INSERT INTO `municipio` VALUES (26, 1934, 'Banámichi');
INSERT INTO `municipio` VALUES (26, 1935, 'Ures');
INSERT INTO `municipio` VALUES (26, 1936, 'Aconchi');
INSERT INTO `municipio` VALUES (26, 1937, 'Baviácora');
INSERT INTO `municipio` VALUES (26, 1938, 'San Felipe de Jesús');
INSERT INTO `municipio` VALUES (26, 1939, 'Rayón');
INSERT INTO `municipio` VALUES (26, 1940, 'Cajeme');
INSERT INTO `municipio` VALUES (26, 1941, 'Navojoa');
INSERT INTO `municipio` VALUES (26, 1942, 'Huatabampo');
INSERT INTO `municipio` VALUES (26, 1943, 'Bácum');
INSERT INTO `municipio` VALUES (26, 1944, 'Etchojoa');
INSERT INTO `municipio` VALUES (26, 1945, 'Benito Juárez');
INSERT INTO `municipio` VALUES (26, 1946, 'Empalme');
INSERT INTO `municipio` VALUES (26, 1947, 'Guaymas');
INSERT INTO `municipio` VALUES (26, 1948, 'San Ignacio Río Muerto');
INSERT INTO `municipio` VALUES (26, 1949, 'La Colorada');
INSERT INTO `municipio` VALUES (26, 1950, 'Mazatán');
INSERT INTO `municipio` VALUES (26, 1951, 'Suaqui Grande');
INSERT INTO `municipio` VALUES (26, 1952, 'Sahuaripa');
INSERT INTO `municipio` VALUES (26, 1953, 'San Javier');
INSERT INTO `municipio` VALUES (26, 1954, 'Soyopa');
INSERT INTO `municipio` VALUES (26, 1955, 'Bacanora');
INSERT INTO `municipio` VALUES (26, 1956, 'Arivechi');
INSERT INTO `municipio` VALUES (26, 1957, 'Rosario');
INSERT INTO `municipio` VALUES (26, 1958, 'Quiriego');
INSERT INTO `municipio` VALUES (26, 1959, 'Onavas');
INSERT INTO `municipio` VALUES (26, 1960, 'Alamos');
INSERT INTO `municipio` VALUES (26, 1961, 'Yécora');

-- ----------------------------
-- Table structure for orden
-- ----------------------------
DROP TABLE IF EXISTS `orden`;
CREATE TABLE `orden`  (
  `id_orden` int(255) NULL DEFAULT NULL,
  `id_aseguradora` int(5) NOT NULL,
  `expediente` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `facturado` datetime(6) NULL DEFAULT NULL,
  `levantamiento` datetime(6) NULL DEFAULT current_timestamp(6),
  `asignada` datetime(6) NULL DEFAULT NULL,
  `cancelada` datetime(0) NULL DEFAULT NULL,
  `folio_cierre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `id_status` int(1) NULL DEFAULT 1,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `id_servicio` int(5) NULL DEFAULT 0,
  `id_poliza` int(10) NULL DEFAULT 0,
  `benef_nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `benef_paterno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `benef_materno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `recibe_benef` int(10) NULL DEFAULT 0,
  `recibe_nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `recibe_materno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `recibe_paterno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `id_tecnico` int(5) NULL DEFAULT 0,
  `observaciones` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `arribo` datetime(6) NULL DEFAULT NULL,
  `fin` datetime(6) NULL DEFAULT NULL,
  `calle` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `num_ext` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `num_int` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `col` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `id_municipio` int(255) NULL DEFAULT 0,
  `id_estado` int(255) NULL DEFAULT 0,
  `entre_calle1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `entre_calle2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `referencia` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `servicio_vial` int(10) NULL DEFAULT 0,
  `vehiculo_tipo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_placa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_ubicacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_combustible` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_litros` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `folio_recepcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `folio_factura` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`id_aseguradora`, `expediente`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orden
-- ----------------------------
INSERT INTO `orden` VALUES (58, 1, '11111111111', NULL, '2019-08-15 12:28:20.266740', '2019-08-26 13:44:00.000000', NULL, '', 2, '', 0, NULL, '', '', '', 0, '', '', '', 6, '', NULL, NULL, 'null', 'null', 'null', 'null', 0, 0, '', '', '', NULL, '', '', '', '', '', '', '', '');
INSERT INTO `orden` VALUES (45, 1, '173432', '2019-08-14 15:57:05.000000', '2019-08-10 18:01:37.459582', '2019-08-10 18:01:37.459582', NULL, '', 4, 'POSIBLE CORTO EN COCINA', 4, NULL, 'MIRIAM', 'MEDINA', 'BELTRAN', 0, 'PIPESO', 'DE C.V.', 'S.A.', 7, '', '2019-08-14 15:56:00.000000', '2019-08-14 15:56:06.000000', 'MAZATLAN ', '730', NULL, 'Hermosillo', 0, 0, 'PASEO COTA DE HERMOSILLO ', 'Y VILLA FONTANA', 'CASA COLOR ROSA Y CERCO CAFE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (28, 1, '173961', NULL, '2019-08-08 17:51:50.564419', '2019-08-08 17:51:50.564419', NULL, '', 3, 'NO SIRVE LA CERRADURA SI SE REQUIERE CAMBIO HABLAR A CABINA', 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 11, '', '2019-08-11 10:00:02.000000', '2019-08-11 10:00:04.000000', 'GERMANICA', '15', NULL, 'PRIVADAS DEL REAL', 1890, 26, 'GERNICA', 'GUADALQUIVIR', 'FACHADA CON REJA AMARILLA Y CAFE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (29, 1, '173963', NULL, '2019-08-08 17:57:14.899970', '2019-08-08 17:57:14.899970', NULL, '', 1, 'CORTO CIRCUITO EN AREA DE LAVADO', 4, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '', NULL, NULL, 'GERMANICA', '15', NULL, 'PRIV. DEL RAL', 0, 26, 'GERNICA', 'GUADALQUIVIR', 'FACHADA CON REJA AMARILLA Y CAFE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (10, 1, '173974', NULL, '2019-08-05 23:51:23.590934', '2019-08-05 23:51:23.590934', NULL, '', 3, 'fuga de agua en la parte de abajo del wc\n\n2.-ya compraron un wc y hay que instalarlo', 2, NULL, 'Luis Ruben', 'Garcelazo', 'Vejar', 0, NULL, NULL, NULL, 7, '', '2019-08-10 18:15:28.000000', '2019-08-10 18:15:32.000000', 'bLVD DEL RETIRO', '29', NULL, 'Valle Escondido', 1890, 26, 'Jardines', 'y La Paz', 'casa enjarrada cafe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (13, 1, '174098', NULL, '2019-08-06 12:55:59.142501', '2019-08-06 12:55:59.142501', NULL, '', 3, 'FUGA DE AGUA EN LLAVE MEZCLADORA DEL LAVABO\n', 2, NULL, 'CAYETANO', NULL, 'MAYO FELIX', 0, NULL, NULL, NULL, 7, '', '2019-08-10 18:20:43.000000', '2019-08-10 18:20:46.000000', 'LOS PINOS', '5', NULL, 'VALLE DORADO', 1890, 26, 'FLOR DE LIRIO', 'PASEO DE LOS ARENALES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (34, 1, '17410', NULL, '2019-08-09 09:31:55.545600', '2019-08-09 09:31:55.545600', NULL, '', 5, 'FUGA  EN CESPOL DE LAVABO BAÑO', 2, NULL, 'LUIS RUBEN GARCILAZO', NULL, NULL, 0, NULL, NULL, NULL, 11, '', '2019-08-11 10:05:36.000000', '2019-08-11 10:05:39.000000', 'BLVD DEL RETIRO ', '29', NULL, 'VALLE ESCONDIDO', 1890, 26, 'JARDINES ', 'LA PAZ', 'ENREJADO CAFE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (14, 1, '174101', NULL, '2019-08-06 13:05:14.166247', '2019-08-06 13:05:14.166247', NULL, '', 3, 'FUGA E AGUA EN LAVABO DEL BAÑO\n\n', 2, NULL, 'SANDRA IVONNE ', 'KRIPE', 'MARTINEZ', 0, 'null', 'null', 'null', 7, '', '2019-08-10 18:23:04.000000', '2019-08-10 18:23:06.000000', 'PASEO DEL PARQUE', '6', 'null', 'VALLE GRANDE', 1890, 26, 'ESQ. CON SAHUARIPA', 'null', 'ATRAS DE RESTAURANT  JOWAH', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (31, 1, '174102', NULL, '2019-08-08 18:58:15.562348', '2019-08-08 18:58:15.562348', NULL, '', 3, 'fuga de agua en lavabo de baño', 2, NULL, 'sandra ivonne', 'kripe', 'martinez', 0, NULL, NULL, NULL, 7, '', '2019-08-11 10:01:58.000000', '2019-08-11 10:01:59.000000', 'paseo del parque', '6', NULL, 'VALLE GRANDE', 1890, 26, 'esq. con sahuaripa', NULL, 'atras de restaurant JOWAH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (9, 1, '174132', NULL, '2019-08-05 23:38:08.271444', '2019-08-05 23:38:08.271444', NULL, '8521775', 3, 'corto en apagador de cocina', 4, NULL, 'Fausto Enrique', 'Luna ', 'Castro', 0, 'null', 'null', 'null', 11, '', '2019-08-10 18:08:42.000000', '2019-08-10 18:12:47.000000', 'dominico', '16', 'null', 'campanario', 1890, 26, 'esq antonianos', 'null', 'a tres cuadras a la derecha entrando al fraccionamiento', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (17, 1, '174133', NULL, '2019-08-06 13:41:20.245140', '2019-08-06 13:41:20.245140', NULL, '', 3, 'SE REPORTA CORTO EN APAGADOR DE COCINA', 4, NULL, 'FAUSTO ENRIQUE.', 'Luna ', 'CASTRO', 0, NULL, NULL, NULL, 7, '', '2019-08-10 19:12:40.000000', '2019-08-10 19:12:41.000000', 'dominico', '16', NULL, 'EL CAMPANARIO', 1890, 26, 'ESQ, CON ANTONIANOS', NULL, 'A TRES CUADRAS A LA DERECHA ENTRANDO AL FRACCIONAMIENTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (18, 1, '174134', NULL, '2019-08-06 13:41:20.418149', '2019-08-06 13:41:20.418149', NULL, '', 3, 'SE REPORTA CORTO EN APAGADOR DE COCINA', 4, NULL, 'FAUSTO ENRIQUE.', 'Luna ', 'CASTRO', 0, NULL, NULL, NULL, 7, '', '2019-08-10 19:12:54.000000', '2019-08-10 19:12:54.000000', 'dominico', '16', NULL, 'EL CAMPANARIO', 1890, 26, 'ESQ, CON ANTONIANOS', NULL, 'A TRES CUADRAS A LA DERECHA ENTRANDO AL FRACCIONAMIENTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (19, 1, '174135', NULL, '2019-08-06 13:41:22.623276', '2019-08-06 13:41:22.623276', NULL, '', 6, 'SE REPORTA CORTO EN APAGADOR DE COCINA', 4, NULL, 'FAUSTO ENRIQUE.', 'Luna ', 'CASTRO', 0, NULL, NULL, NULL, 7, '', '2019-08-10 19:13:03.000000', '2019-08-10 19:13:03.000000', 'dominico', '16', NULL, 'EL CAMPANARIO', 1890, 26, 'ESQ, CON ANTONIANOS', NULL, 'A TRES CUADRAS A LA DERECHA ENTRANDO AL FRACCIONAMIENTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (54, 1, '174136', NULL, '2019-08-12 11:08:30.120606', '2019-08-12 11:08:30.120606', NULL, '', 1, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (22, 1, '174251', NULL, '2019-08-06 13:57:17.974919', '2019-08-06 13:57:17.974919', NULL, '', 3, 'fuga de agua en el fregadero', 2, NULL, 'RUTH', 'BRAWN', 'MOLINA', 0, NULL, NULL, NULL, 7, '', '2019-08-11 09:46:52.000000', '2019-08-11 09:46:53.000000', 'LUIS ORCI', '149', NULL, 'BALDERRAMA', 1890, 26, 'GRAL. PÑA', 'REYES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (25, 1, '174265', NULL, '2019-08-07 18:11:51.481310', '2019-08-07 18:11:51.481310', NULL, '', 3, 'fuga en mecanismo wc', 2, NULL, 'leslie yarim dominguez ', 'grijalva', NULL, 0, NULL, NULL, NULL, 7, '', '2019-08-11 09:59:25.000000', '2019-08-11 09:59:26.000000', 'catabria', '27', NULL, 'portales', 1890, 26, 'esq. puerto palos', NULL, 'clave de acceso 3027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (30, 1, '174266', NULL, '2019-08-08 18:53:07.869749', '2019-08-08 18:53:07.869749', NULL, '', 3, 'fuga en mecanismo wc', 2, NULL, 'leslie yarim ', 'dominguez', 'grijalva', 0, NULL, NULL, NULL, 11, '', '2019-08-11 10:00:40.000000', '2019-08-11 10:00:42.000000', 'catabria', '27', NULL, 'los portales', 1890, 26, 'esq puerto de palos', NULL, 'clave acceso 3027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (11, 1, '174275', NULL, '2019-08-06 11:41:21.862416', '2019-08-06 11:41:21.862416', NULL, '', 3, 'FUGA EN AGUA DE PORCHE', 2, NULL, 'DORA ALICIA ', 'GARCIA', 'VERDUGO', 0, NULL, NULL, NULL, 7, '', '2019-08-10 18:18:08.000000', '2019-08-10 18:18:11.000000', 'OCASO', '8', NULL, 'PALMAR DEL SOL', 1890, 26, 'BOULEVAR HIDALGO', 'ALBORADA', 'CASA AMARILLA CON REJA NEGRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (23, 1, '174369', NULL, '2019-08-06 16:04:03.063905', '2019-08-06 16:04:03.063905', NULL, '', 3, 'SE GENERO UN APAGON EN EL AREA DE LA SALA', 4, NULL, 'RAMON ', 'CHAN', 'VALENZUELA', 0, 'VIRGINIA ', 'LAM', NULL, 7, '', '2019-08-14 15:59:11.000000', '2019-08-14 16:00:18.000000', 'RETORNO ROSARIO CASTELLANOS', '33', NULL, 'URBI VILLA DEL CEDRO', 1890, 26, 'JAIME SABINES', 'GABRIEL SAID', 'A LA IZQUIERDA UN ABARREY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (24, 1, '174380', NULL, '2019-08-06 17:02:42.891227', '2019-08-06 17:02:42.891227', NULL, '', 3, 'POSIBLE CORTO CONTACTO COCINA.  **1589 ACCESO**', 4, NULL, 'GUADALUPE ', 'COTA', 'SNCHEZ', 0, NULL, NULL, NULL, 11, '', '2019-08-11 09:49:27.000000', '2019-08-11 09:49:34.000000', 'RETORNO CAMPIRANO', '12', NULL, 'CORCELES.', 1890, 26, 'BLVD QUIROGA', 'COLOSIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (33, 1, '174905', NULL, '2019-08-09 09:20:17.599679', '2019-08-09 09:20:17.599679', NULL, '', 3, 'FUGA EN TUBERIA DE AIMENTACION QUE VA AL TINACO', 2, NULL, 'CARMEN MAGDALENA ', 'AMAYA', 'BORGARO', 0, NULL, NULL, NULL, 11, '', '2019-08-11 10:02:53.000000', '2019-08-11 10:02:56.000000', 'LA MESA', NULL, '13', 'SANTA FE', 1890, 26, 'BLVD. NAVARRETE ', 'PASEO SNTA FE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (38, 1, '174910', NULL, '2019-08-09 12:09:14.371470', '2019-08-09 12:09:14.371470', NULL, '', 3, 'FUGA DE AGUA CESPOL DE LAVABO', 2, NULL, 'LUIS RUBEN', 'GARCILAZO', NULL, 0, NULL, NULL, NULL, 11, '', '2019-08-11 10:07:55.000000', '2019-08-11 10:07:56.000000', 'BLVD. DEL RETIRO', '29', NULL, NULL, 1890, 26, 'JARDINES', 'DE LA PAZ', 'ENREJADO CAFE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (36, 1, '174934', NULL, '2019-08-09 11:54:45.204756', '2019-08-26 13:53:00.000000', NULL, '', 2, 'FALLA  DE LA MUFA DENTRO DEL DOMICILIO (POSIBLE CORTO)', 4, NULL, 'MARIA FERNANDA', 'OCANO', 'FONTE', 0, 'null', 'null', 'null', 7, '', NULL, NULL, 'PALMITO', '10-A', 'TEPIC', 'PALO VERDE', 1890, 26, 'CACTUS', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (43, 1, '175132', NULL, '2019-08-10 17:28:50.809096', '2019-08-26 17:53:00.000000', NULL, '', 2, 'APERTURA PUERTA PRINCIPAL CERRADURA CONVENCIONAL\n ', 10, NULL, 'JOSE MARIA', 'PORTILLO ', 'ALVAREZ', 0, 'null', 'null', 'null', 12, '', NULL, NULL, 'AYOLA  ', '20017', 'null', 'LAS ESPIGAS', 1940, 26, 'PARIS', 'ESCUINAPA', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (59, 1, '52213001', '2019-08-27 15:53:22.000000', '2019-08-27 15:01:46.216148', '2019-08-28 15:00:00.000000', NULL, '5212120', 4, 'Cambio de llanta delantera lado del copiloto', 18, 2, 'Frank', 'Crow ', 'Belloso', 1, '', '', '', 6, '', '2019-08-27 17:41:00.000000', '2019-08-27 17:41:25.000000', 'Carretera Mochis-Ahome s/n', '411', '44', 'Los Mochis', 1878, 25, 'ESQ. ROMULO CORDOVA', 'MERCADERES', 'ENFRENTE DE LUBR, MART', 0, '', '', '', '', '', '', '', '');
INSERT INTO `orden` VALUES (60, 1, '52213002', NULL, '2019-08-27 15:33:17.518876', '2019-08-28 15:31:00.000000', NULL, '', 3, 'Gasolina magna ', 1, 1, 'Frank', 'Crow', 'Belloso', 0, 'Antonio', 'Osuna', 'Juarez', 6, '', '2019-08-27 17:43:00.000000', NULL, 'Hidalgo', '522', '52', 'Las Fuentes', 1878, 25, '', '', '', 1, 'HONDA CIVIC 2002', 'ROJO', 'UBW-852-52', 'Las Fuentes', 'Magna', '60', '', '');
INSERT INTO `orden` VALUES (61, 1, '52213003', NULL, '2019-08-27 17:46:13.654489', '2019-08-28 18:00:00.000000', NULL, '', 2, 'Socket con corto circuito', 4, 3, 'Juan Manuel', 'Conteras', 'Felix', 0, 'Jesus Adrián', 'Peraza', 'Martinez', 7, '', NULL, NULL, 'Domingo Rubí', '444', '411', 'Centro', 1889, 25, 'Uno', 'Dos', 'Casa azul', 0, '', '', '', '', '', '', '', '');
INSERT INTO `orden` VALUES (15, 4, '13282381', NULL, '2019-08-06 13:30:38.146414', '2019-08-06 13:30:38.146414', NULL, '521452', 3, 'CAMBIO DE LLANTA IZQ. TRASERA', 18, NULL, 'NICOLAS ABELARDO ', 'BETANCUR', 'null', 0, 'null', 'null', 'null', 24, '', '2019-08-10 18:24:02.000000', '2019-08-10 18:24:06.000000', 'BLVD GUSTO SIERRA', 'null', '112', 'PITIC', 1890, 26, 'ESQ. CON AVENIDA CENTRAL', 'null', 'A ESPALDAS DE COLEGIO REGIS', NULL, 'BMW', 'GRIS', '376', 'PITIC HERMOSILLO', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (12, 4, '13290624', NULL, '2019-08-06 12:49:32.021359', '2019-08-06 12:49:32.021359', NULL, '', 1, 'null', 14, NULL, 'ALBERTO RAFAEL', 'TORRES', 'SOTO', 0, 'null', 'null', 'null', 8, '', NULL, NULL, 'TOLERANO', '13', '', 'null', 0, 0, 'PLAZA MAYOR ', 'MERCADERES', 'DENTRO DE COCHERA FUERA DE CASA DE TITULAR', NULL, 'GRAN CHEROKEE 2000', 'BLANCO', '024', 'VILLA SATELITE HERMOSILLO', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (41, 4, '13298871', NULL, '2019-08-09 14:08:03.590238', '2019-08-09 14:08:03.590238', NULL, '', 3, NULL, 14, NULL, 'ADOLFO ', 'ALVAREZ', 'QUINTERO', 0, 'IDEL', 'ALVAREZ', 'GARCIA', 12, '', '2019-08-11 10:09:40.000000', '2019-08-11 10:09:42.000000', 'VALLE DEL TIGO', '1546', NULL, 'VILLA FONTANA', 1890, 26, 'PASEO MIRA VALLE', 'AUSTRIA', 'ESQUINA ABARROTES CAMPA', NULL, 'TOYOTA RAV 2013', 'BLANCO', '3094', NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (42, 4, '13301635', NULL, '2019-08-10 12:07:25.865061', '2019-08-10 12:07:25.865061', NULL, '', 3, 'SE ABRIRA PUERTA DE AUTO POR EL LADO DEL COPILOTO\nLAS LLAVES SE QUEDARON DENTRO.\nUSUARIO INDICO QUE SOLO SERA APERTURA( HAY UN EXCEDENTE DE $96 PESOS QUE USURIO ASEPTO CUBRIR.  ASIGNO CORRSPONSALIA :ALEJANDRA LOPEZ. ', 10, NULL, 'MARIA', 'FUFUTIS', 'MENDOZA', 0, NULL, NULL, NULL, 12, '', '2019-08-10 12:40:17.000000', '2019-08-10 12:41:51.000000', 'AMBERES', '2155', NULL, 'BELLA VISTA', 1890, 26, 'ESQ. MILAN', NULL, NULL, NULL, 'MONZA', 'ARENA', '1159', NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (46, 4, '13303728', '2019-08-22 12:16:26.000000', '2019-08-11 13:35:43.278145', '2019-08-11 13:35:43.278145', NULL, '', 4, NULL, 1, NULL, 'Ana Maria ', 'Figueroa', 'Gonzalez', 0, 'PIPESO', 'DE C.V.', 'S.A.', 6, '', '2019-08-11 13:35:55.000000', '2019-08-11 13:35:58.000000', 'carretera a sanpedro km 3.7', NULL, NULL, 'san pedro', 1890, 26, NULL, NULL, 'afuera del super del norte y la ferrteria lubrimar', NULL, 'Honda', 'ROJO', '9504', NULL, 'MAGNA', '20', '', '');
INSERT INTO `orden` VALUES (52, 4, '13303729', NULL, '2019-08-12 10:37:25.245513', '2019-08-12 10:37:00.000000', NULL, '', 2, 'SAN PEDRO KM 37 ', 1, NULL, 'ANA MARIA', 'FIGUEROA', 'GONZALEZ', 0, 'null', 'null', 'null', 6, 'hola como estas', '2019-09-01 17:13:00.000000', NULL, 'KM 37', 'null', 'null', 'SAN PEDRO', 0, 26, 'ESQ. ROMULO CORDOVA', 'null', 'ENFRENTE DE LUBR, MART', NULL, 'HONDA CIVIC 2002', 'ROJO', '9504', 'null', 'MAGNA', '20', '', '');
INSERT INTO `orden` VALUES (47, 4, '13304837', NULL, '2019-08-12 09:01:27.760741', '2019-08-12 09:01:27.760741', NULL, '', 1, 'KM ADICIONALES 25KM X 7 175 + IVA', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 12, '', NULL, NULL, NULL, NULL, NULL, NULL, 1940, 26, NULL, NULL, NULL, NULL, NULL, NULL, 'VE-35-821', NULL, 'PREMIUM ', '20', '', '');
INSERT INTO `orden` VALUES (51, 4, '13306057', NULL, '2019-08-12 10:30:26.675773', '2019-08-12 10:30:26.675773', NULL, '', 1, NULL, 18, NULL, 'LUZ ALEJANDRA', 'VILLALBA', NULL, 0, NULL, NULL, NULL, 11, '', NULL, NULL, 'DIEGO HURTADO', '661-A', NULL, 'SAN JAVIER', 1890, 26, 'SOLIDARIDAD', 'CRITOLBAL COLON', NULL, NULL, 'SENTRA NISSAN 2018', 'BLANCO', 'VVE3A', NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (49, 4, '13306058', NULL, '2019-08-12 10:17:26.471395', '2019-08-12 10:17:26.471395', NULL, '', 1, 'LLANTA DELANTERA DERECHA', 18, NULL, 'LUZ ALEJANDRA', 'VILLALBA', NULL, 0, NULL, NULL, NULL, 11, '', NULL, NULL, 'DIEGO HURTADO', '661-A', NULL, 'SAN JAVIER', 1890, 26, 'SOLIDARIDAD', 'CRISTOBAL COLON', 'EBFRENDE DE FLORERIA CHADAI', NULL, 'SENTRA 2018', 'BLANCO', NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (50, 4, '13306187', NULL, '2019-08-12 10:25:24.801440', '2019-08-12 10:25:24.801440', NULL, '', 1, NULL, 1, NULL, 'LUIS JAVIER', 'AMAVIZCA', NULL, 0, NULL, NULL, NULL, 11, '', NULL, NULL, 'BLVD SOLIDARIDAD', NULL, NULL, NULL, 1890, 26, 'SOLIDARIDAD', 'NAVARRETE ', NULL, NULL, 'FORD ESCORT 98', 'VERDE', '669A', NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (55, 4, '13306515', NULL, '2019-08-12 12:57:28.851344', '2019-08-12 12:57:28.851344', NULL, '', 1, 'CAMBIO DE LLANTA DERECHA DELANTERA USUARIO CUENTA CON BIRLOS Y LLAVE.\nENTRAR POR LA ZONA DE PROVEEDORES ACCESO 3809', 18, NULL, 'EMILIANO ', 'RUIZ', 'LUCERO', 0, NULL, NULL, NULL, 7, '', NULL, NULL, 'LAGO SUPERIOR', '9', NULL, 'VALLE DEL LAGO', 1890, 26, 'RETORNO GRANDES LAGOS', NULL, 'VALLE DEL LAGO SECCION ATARDECERES', NULL, 'HONDA HODISAY 2011', 'PLATA', NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (20, 4, '174189', NULL, '2019-08-06 13:45:09.187234', '2019-08-06 13:45:09.187234', NULL, '', 1, 'FUGA EN LAVAMANOS DE BAÑO', 2, 1, 'VICTOR', 'AGUILAR', 'CORDOVA', 0, 'null', 'null', 'null', 25, '', NULL, NULL, 'JOSE MARIA MENDOZA', '1213', 'null', 'SAHUARO INDECO', 1890, 26, 'CALLE 9 ', 'CALLE 11', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (53, 4, '175188', NULL, '2019-08-12 10:43:41.186177', '2019-08-12 10:43:41.186177', NULL, '', 1, 'APERTURA PUERTA PRINCIPAL (SOLO APERTURA)', 10, NULL, 'JULIO CESAR', 'MIJARES', 'SALAS', 0, NULL, NULL, NULL, 19, '', NULL, NULL, 'CIRCUITO DEL OLIVER PTE', '3', NULL, NULL, 1890, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (8, 9, '1555827', NULL, '2019-08-03 10:21:48.276131', '2019-08-03 10:21:48.276131', NULL, '', 1, 'FUGA DE LAVABO', 2, NULL, 'ARMIDA ', 'BARRON', NULL, 0, NULL, NULL, NULL, 0, '', NULL, NULL, 'LAGO ERIEN ', '20', NULL, 'VALLE DE LAGO', 1890, 26, 'CERRADA AMANECER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (7, 9, '15558669', NULL, '2019-08-03 09:15:54.810006', '2019-08-03 09:15:54.810006', NULL, '', 1, 'FUGA TUBERIA DE TINACO,  FACIL ACCESO', 2, NULL, 'SANDRA ', 'PRECIADO', NULL, 0, NULL, NULL, NULL, 0, '', NULL, NULL, 'DR. VOURLAR', '84', NULL, NULL, 1890, 26, 'SAHUARIPA', 'DR. CANALES', 'CERCA DE BENAVIDES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (35, 9, '15562371', NULL, '2019-08-09 10:26:16.490115', '2019-08-09 10:26:00.000000', NULL, '', 2, 'null', 0, NULL, 'null', 'null', 'null', 0, 'null', 'null', 'null', 7, '', NULL, NULL, 'null', 'null', 'null', 'null', 0, 0, 'null', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (39, 9, '15562372', NULL, '2019-08-09 12:14:37.543954', '2019-08-09 12:14:37.543954', NULL, '', 3, 'FUGA DE FREGADERO DESGUE', 2, NULL, 'FRANCISCA ', 'RODRIGUEZ', 'MOLINA', 0, NULL, NULL, NULL, 11, '', '2019-08-10 12:44:11.000000', '2019-08-10 13:00:56.000000', 'ACACIA BLANCA', '46', NULL, 'PUERTA REAL', 1890, 26, NULL, NULL, 'CERRADA SECCION CORDOVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (16, 9, '15564445', NULL, '2019-08-06 13:35:40.362699', '2019-08-06 13:35:40.362699', NULL, '', 1, 'FUGA DE AGUA EN CISTERNA  EN TUBERIA E HIDRONEUMATICO', 2, NULL, 'EDUARDO RAMIRO', 'VALENZUELA', NULL, 0, 'PIPESO', 'DE C.V.', 'S.A.', 0, '', NULL, NULL, 'RETORNO FALABLLA', '13', NULL, 'RECIDENCIAL CORSELES', 1890, 26, NULL, NULL, 'MARCAR CLAVE DE ACCESO 1370', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (21, 9, '15565347', NULL, '2019-08-06 13:52:24.383126', '2019-08-06 13:52:24.383126', NULL, '', 1, 'FUGA EN FREGADERO (alimentacion)', 2, NULL, 'mari', 'Brawer', 'null', 0, 'null', 'null', 'null', 8, '', NULL, NULL, 'primo de verdad ', '52', 'null', 'pitic', 1890, 26, 'null', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (27, 9, '15571811', NULL, '2019-08-08 17:42:12.647364', '2019-08-08 17:42:12.647364', NULL, '', 3, 'FUGA DE WC ALIMENTACION', 2, NULL, 'HECTOR JAVIER ', 'PEREZ', 'GASTELUM', 0, NULL, NULL, NULL, 7, '', '2019-08-11 09:58:50.000000', '2019-08-11 09:58:51.000000', 'COLONIZADORES', '4', NULL, 'DE ANZA', 1890, 26, 'ESQ. SOLIDARIDAD', NULL, 'FRENTE FARMACIA GI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (26, 9, '15573616', NULL, '2019-08-08 17:36:28.624687', '2019-08-08 17:36:28.624687', NULL, '', 3, 'FUGA ENTUBERIA DE TINACO', 2, NULL, 'ELEN ', 'MARTINEZ', 'GARCIA', 0, NULL, NULL, NULL, 7, '', '2019-08-11 09:58:40.000000', '2019-08-11 09:58:41.000000', 'CABALLET PONIENTE', '7', NULL, 'EL ESPLENDOR', 1890, 26, 'BLVD DEL ARTE', NULL, 'PERIMETRAL NTE  Y HAY UN CAR WACH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (40, 9, '15575915', NULL, '2019-08-09 13:56:54.101945', '2019-08-09 13:56:54.101945', NULL, '', 3, 'FALLA INTERRUPTOR GENERL', 4, NULL, 'VICTOR ', 'MELO', 'RIVERA', 0, NULL, NULL, NULL, 7, '', '2019-08-10 13:05:44.000000', '2019-08-10 13:05:54.000000', 'CERRADA VISCONTI', '11', NULL, 'PUERTA REAL', 1890, 26, 'NAVOJOA', 'REYES CATOLICO', 'ENTRADA SEGUNADA ETAPA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (56, 9, '15585574', NULL, '2019-08-12 13:09:08.627179', '2019-08-12 13:09:08.627179', NULL, '', 1, 'FUGA EN TUBERIA QUE DA AL PATIO\nEN LA CASETA INFORMAR QUE VA AL DOMICILIO', 2, NULL, 'MARIA TERESA', 'CARLON', NULL, 0, NULL, NULL, NULL, 11, '', NULL, NULL, 'CERRADA DE LOS PROFETAS', '27', NULL, 'SAN MARCOS RECIEDENCIAL', 1890, 26, NULL, NULL, 'EN CERRADA DE LOS PROFETAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (57, 9, '15585599', NULL, '2019-08-12 13:25:15.833283', '2019-08-12 13:25:15.833283', NULL, '', 1, 'APERTURA DE PUERTA PRINCIPAL, CHAPA CONVENCIONAL', 10, NULL, 'CLAUDIA ', 'RAMOS', NULL, 0, NULL, NULL, NULL, 12, '', NULL, NULL, 'REAL DE CATALUÑA', '1921', NULL, 'MISION  DEL SOL', 1940, 26, 'BLVD MISION DEL REAL', 'SANTA FE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (NULL, 10, '174101', NULL, '2019-08-14 14:54:05.578220', '2019-08-14 14:54:05.578220', NULL, '', 1, '', 0, NULL, '', '', '', 0, '', '', '', 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '', '', NULL, '', '', '', '', '', '', '', '');
INSERT INTO `orden` VALUES (44, 10, 'TA2524821', NULL, '2019-08-10 17:56:07.579714', '2019-08-26 12:56:00.000000', NULL, '', 1, 'SE REQUIERE CAMBIAR ', 4, NULL, 'null', 'null', 'null', 0, 'null', 'null', 'null', 0, '', NULL, NULL, 'null', 'null', 'null', 'null', 0, 0, 'null', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (32, 17, '14995', NULL, '2019-08-08 19:12:09.280034', '2019-08-08 19:12:09.280034', NULL, '', 1, 'FUGA EN LAVABO (GOTEA)', 2, NULL, 'FERNANDO', 'LOHERA', 'null', 0, 'null', 'null', 'null', 15, '', NULL, NULL, 'GRABADOS PONIENTE ', '2', 'null', 'EL ESPLENDOR', 1890, 26, 'ESQ. BLVD BELARDE', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 'null', 'null', '', '');
INSERT INTO `orden` VALUES (NULL, 21, '174101', NULL, '2019-08-14 15:31:46.481745', '2019-08-14 15:31:46.481745', NULL, '', 1, '', 0, NULL, '', '', '', 0, '', '', '', 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '', '', NULL, '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for poliza
-- ----------------------------
DROP TABLE IF EXISTS `poliza`;
CREATE TABLE `poliza`  (
  `id_aseguradora` int(10) NOT NULL,
  `id_poliza` int(255) NOT NULL,
  `poliza_nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `poliza_valor` double(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_aseguradora`, `id_poliza`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of poliza
-- ----------------------------
INSERT INTO `poliza` VALUES (1, 1, 'Liverpool', 400);
INSERT INTO `poliza` VALUES (1, 2, 'Suburbia', 400);
INSERT INTO `poliza` VALUES (1, 3, 'Axtel', 500);
INSERT INTO `poliza` VALUES (1, 4, '', 0);
INSERT INTO `poliza` VALUES (1, 5, 'ACE HOGAR', 431);
INSERT INTO `poliza` VALUES (1, 6, 'CORRESPONSALIA FORANEO', 300);
INSERT INTO `poliza` VALUES (1, 7, 'COSTO SALIDA (SERVICIO VIAL)', 250);
INSERT INTO `poliza` VALUES (4, 1, 'liverpool', 400);
INSERT INTO `poliza` VALUES (4, 2, 'BANAMEX LIBRA', 500);
INSERT INTO `poliza` VALUES (4, 3, '', 0);
INSERT INTO `poliza` VALUES (4, 4, '', 0);
INSERT INTO `poliza` VALUES (9, 1, 'COSTO DE SALIDA X KILOMETRO', 7);
INSERT INTO `poliza` VALUES (9, 2, 'CORRESPONSALIA FORANEA', 300);
INSERT INTO `poliza` VALUES (9, 3, 'ASISTENCIA MUJER  BANORTE', 500);
INSERT INTO `poliza` VALUES (9, 4, 'ASISTENCIA INTEGRALSCOTIABANK CREDITO', 400);
INSERT INTO `poliza` VALUES (9, 5, 'ASISTENCIA CREDITO HSBC', 500);
INSERT INTO `poliza` VALUES (9, 6, '', 0);
INSERT INTO `poliza` VALUES (9, 7, '', 0);
INSERT INTO `poliza` VALUES (9, 8, 'ASISTENCIA HABITT', 500);
INSERT INTO `poliza` VALUES (9, 9, 'ADT PLUS RESIDENCIAL', 500);
INSERT INTO `poliza` VALUES (9, 10, 'GNP', 862);
INSERT INTO `poliza` VALUES (9, 11, '', 0);
INSERT INTO `poliza` VALUES (9, 12, 'BANAMEX HOGAR Y AJUSTES', 1000);
INSERT INTO `poliza` VALUES (9, 13, '', 0);
INSERT INTO `poliza` VALUES (9, 14, 'LIBRA PLUS', 500);
INSERT INTO `poliza` VALUES (9, 15, '', 0);
INSERT INTO `poliza` VALUES (17, 1, 'COSTO POR KM (SERVICIO VIAL)', 0);
INSERT INTO `poliza` VALUES (17, 2, 'PLOMERIA (BASICO)', 390);
INSERT INTO `poliza` VALUES (17, 3, 'SANITARIO (SOLO MANO DE OBRA)', 650);
INSERT INTO `poliza` VALUES (17, 4, 'ELECTRICIDAD', 390);
INSERT INTO `poliza` VALUES (17, 5, 'CERRAJERIA', 400);

-- ----------------------------
-- Table structure for servicio
-- ----------------------------
DROP TABLE IF EXISTS `servicio`;
CREATE TABLE `servicio`  (
  `id_servicio` int(255) NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `descripcion_servicio` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_servicio`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of servicio
-- ----------------------------
INSERT INTO `servicio` VALUES (1, 'Gasolina', '  Llenado de gasolina a un vehículo en la dirección acordada por el cliente');
INSERT INTO `servicio` VALUES (2, 'Plomeria', ' Trabajos de plomeria menor en domicilios particular');
INSERT INTO `servicio` VALUES (4, 'Electricidad', 'Mantenimiento y reparación de instalaciones eléctricas particulares');
INSERT INTO `servicio` VALUES (6, 'Impermeabilización', ' Servicio de impermeabilizar ');
INSERT INTO `servicio` VALUES (7, 'Taxi', 'Traslado de personas de un lugar a otro indicado por la aseguradora');
INSERT INTO `servicio` VALUES (8, 'Vidrio', 'cambio de cristales en ventanas y puertas');
INSERT INTO `servicio` VALUES (9, 'Aluminio', 'Fabricacion y Reparacion de canceleria, puertas y ventanas de aluminio');
INSERT INTO `servicio` VALUES (10, 'Cerrajeria', ' Apertura de cerraduras, candados y automoviles');
INSERT INTO `servicio` VALUES (11, 'Albañileria', 'Trabajos menor de albañileria');
INSERT INTO `servicio` VALUES (12, 'Herreria', 'fabricacion y reparacion de trabajos de herreria');
INSERT INTO `servicio` VALUES (14, 'Paso de Corriente', 'pasar corriente a vehiculos con cables o jumper');
INSERT INTO `servicio` VALUES (15, 'Refrigeracion', 'servicio de mantenimiento preventivo a aire acondicionado');
INSERT INTO `servicio` VALUES (16, 'Pintura', 'aplicacion de pintura en muros estanteria  y rejas');
INSERT INTO `servicio` VALUES (17, 'Carpinteria', 'fabricacion y reparacion de muebles de madera');
INSERT INTO `servicio` VALUES (18, 'Cambio de Llanta', 'Cambio de llanta baja por llnata de refaccion nota no se parchan llantas ni se llevan a llantera el cliente debe contar con dados para candados de rines ');
INSERT INTO `servicio` VALUES (19, 'Tablaroca', ' fabricacion de panel de yeso y durock co n estructura metalica para divisiones');

-- ----------------------------
-- Table structure for tecnico
-- ----------------------------
DROP TABLE IF EXISTS `tecnico`;
CREATE TABLE `tecnico`  (
  `id_tecnico` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ap_paterno` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ap_materno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 0,
  `id_estado` int(10) NULL DEFAULT 0,
  `id_municipio` int(10) NULL DEFAULT 0,
  `servicios` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `num_cel` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `num_fijo` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `datos_banco` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tecnico`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tecnico
-- ----------------------------
INSERT INTO `tecnico` VALUES (6, 'Javier', 'Partida', 'Lugo', 0, 26, 1890, '1,7,2,4,6,8,9,10,11,12,14', '6622568642', '', '', 'juanito', 'pipesorules');
INSERT INTO `tecnico` VALUES (7, 'Jose Luis', 'Gonzalez', '', 0, 26, 1890, '4,2,15', '', '', '', '', '');
INSERT INTO `tecnico` VALUES (8, 'Rey Baltazar', 'Maldonado', 'Samayoa', 0, 26, 1890, '8,9,10,7,1,14', '6621786167', '', '', '', '');
INSERT INTO `tecnico` VALUES (9, 'Rene ', 'Gonzalez', '', 0, 26, 1890, '8,9,6,16', '6621429182', '', '', '', '');
INSERT INTO `tecnico` VALUES (10, 'Jose', 'Chavez', 'Gaviño', 0, 26, 1890, '2,12,8', '6621454790', '', '', '', '');
INSERT INTO `tecnico` VALUES (11, 'Ramon ', 'Mac Group', '', 0, 26, 1890, '4,2,8,12', '6621575936', '', '', '', '');
INSERT INTO `tecnico` VALUES (12, 'Juan Carlos ', 'Hacha', '', 0, 26, 1940, '10,1,7', '6444082100', '', '', '', '');
INSERT INTO `tecnico` VALUES (13, 'Adrian ', 'Acosta', '', 0, 26, 1940, '1,14', '', '', '', '', '');
INSERT INTO `tecnico` VALUES (14, 'Genaro', 'Muñoz', '', 0, 26, 1947, '2,4,6', '6221112745', '', '', '', '');
INSERT INTO `tecnico` VALUES (15, 'Cristhian', 'Reyna', '', 0, 26, 0, '6,4,2,15', '6564194245', '', '', '', '');
INSERT INTO `tecnico` VALUES (16, 'Carlos ', 'Contreras', '', 0, 26, 1890, '19', '6623530203', '', '', '', '');
INSERT INTO `tecnico` VALUES (17, 'Francisco', 'Rodriguez', '', 0, 26, 1924, '2,4,6,12,16', '6453335111', '', '', '', '');
INSERT INTO `tecnico` VALUES (18, 'Juan Ramon ', 'Esquer', '', 0, 26, 1940, '2,8', '', '', '', '', '');
INSERT INTO `tecnico` VALUES (19, 'Marcos ', 'Valenzuela', '', 0, 26, 1890, '10', '6622004816', '6622249468', '', '', '');
INSERT INTO `tecnico` VALUES (20, 'Joel', 'Magaña', '', 0, 26, 1940, '4,15,2', '6441219761', '', '', '', '');
INSERT INTO `tecnico` VALUES (21, 'Everardo ', 'Gutierrez', '', 0, 26, 1890, '16,6,11', '6621554880', '', '', '', '');
INSERT INTO `tecnico` VALUES (22, 'Omar ', 'Becerra', 'Gomez', 0, 26, 1890, '2,4,15', '6623953740', '', '', '', '');
INSERT INTO `tecnico` VALUES (23, 'Armando', 'Veloz', '', 0, 26, 1905, '8', '6311028328', '', '', '', '');
INSERT INTO `tecnico` VALUES (24, 'German ', 'Noperi ', '', 0, 26, 1890, '7,1,14', '6621600437', '', '', '', '');
INSERT INTO `tecnico` VALUES (25, 'Ivan ', 'Gonzalez', '', 0, 26, 1947, '10', '6221513625', '', '', '', '');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `id_user` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
