/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 100130
 Source Host           : localhost:3306
 Source Schema         : mesacontrol_db

 Target Server Type    : MySQL
 Target Server Version : 100130
 File Encoding         : 65001

 Date: 13/08/2019 10:12:22
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
  `id_empleado` int(10) NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ap_paterno` int(11) NULL DEFAULT NULL,
  `ap_materno` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_empleado`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
INSERT INTO `estado_orden` VALUES (2, 'En proceso');
INSERT INTO `estado_orden` VALUES (3, 'Finalizada');
INSERT INTO `estado_orden` VALUES (4, 'Facturada');

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
  `id_orden` int(255) NOT NULL AUTO_INCREMENT,
  `expediente` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `facturado` datetime(6) NULL DEFAULT NULL,
  `levantamiento` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `folio_cierre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `id_status` int(1) NULL DEFAULT 1,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_servicio` int(5) NULL DEFAULT NULL,
  `id_aseguradora` int(5) NULL DEFAULT NULL,
  `id_poliza` int(10) NULL DEFAULT NULL,
  `benef_nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `benef_paterno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `benef_materno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
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
  `vehiculo_tipo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_placa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_ubicacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_combustible` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `vehiculo_litros` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `folio_recepcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `folio_factura` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`id_orden`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orden
-- ----------------------------
INSERT INTO `orden` VALUES (7, '15558669', NULL, '2019-08-03 09:15:54.810006', '', 1, 'FUGA TUBERIA DE TINACO,  FACIL ACCESO', 2, 9, NULL, 'SANDRA ', 'PRECIADO', NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 'DR. VOURLAR', '84', NULL, NULL, 1890, 26, 'SAHUARIPA', 'DR. CANALES', 'CERCA DE BENAVIDES', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (8, '1555827', NULL, '2019-08-03 10:21:48.276131', '', 1, 'FUGA DE LAVABO', 2, 9, NULL, 'ARMIDA ', 'BARRON', NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 'LAGO ERIEN ', '20', NULL, 'VALLE DE LAGO', 1890, 26, 'CERRADA AMANECER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (9, '174132', NULL, '2019-08-05 23:38:08.271444', '', 3, 'corto en apagador de cocina', 4, 1, NULL, 'Fausto Enrique', 'Luna ', 'Castro', NULL, NULL, NULL, 11, '', '2019-08-10 18:08:42.000000', '2019-08-10 18:12:47.000000', 'dominico', '16', NULL, 'campanario', 1890, 26, 'esq antonianos', NULL, 'a tres cuadras a la derecha entrando al fraccionamiento', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (10, '173974', NULL, '2019-08-05 23:51:23.590934', '', 3, 'fuga de agua en la parte de abajo del wc\n\n2.-ya compraron un wc y hay que instalarlo', 2, 1, NULL, 'Luis Ruben', 'Garcelazo', 'Vejar', NULL, NULL, NULL, 7, '', '2019-08-10 18:15:28.000000', '2019-08-10 18:15:32.000000', 'bLVD DEL RETIRO', '29', NULL, 'Valle Escondido', 1890, 26, 'Jardines', 'y La Paz', 'casa enjarrada cafe', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (11, '174275', NULL, '2019-08-06 11:41:21.862416', '', 3, 'FUGA EN AGUA DE PORCHE', 2, 1, NULL, 'DORA ALICIA ', 'GARCIA', 'VERDUGO', NULL, NULL, NULL, 7, '', '2019-08-10 18:18:08.000000', '2019-08-10 18:18:11.000000', 'OCASO', '8', NULL, 'PALMAR DEL SOL', 1890, 26, 'BOULEVAR HIDALGO', 'ALBORADA', 'CASA AMARILLA CON REJA NEGRA', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (12, '13290624', NULL, '2019-08-06 12:49:32.021359', '', 1, NULL, 14, 4, NULL, 'ALBERTO RAFAEL', 'TORRES', 'SOTO', NULL, NULL, NULL, 24, '', NULL, NULL, 'TOLERANO', '13', '', NULL, 0, 0, 'PLAZA MAYOR ', 'MERCADERES', 'DENTRO DE COCHERA FUERA DE CASA DE TITULAR', 'GRAN CHEROKEE 2000', 'BLANCO', '024', 'VILLA SATELITE HERMOSILLO', NULL, NULL, '', '');
INSERT INTO `orden` VALUES (13, '174098', NULL, '2019-08-06 12:55:59.142501', '', 3, 'FUGA DE AGUA EN LLAVE MEZCLADORA DEL LAVABO\n', 2, 1, NULL, 'CAYETANO', NULL, 'MAYO FELIX', NULL, NULL, NULL, 7, '', '2019-08-10 18:20:43.000000', '2019-08-10 18:20:46.000000', 'LOS PINOS', '5', NULL, 'VALLE DORADO', 1890, 26, 'FLOR DE LIRIO', 'PASEO DE LOS ARENALES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (14, '174101', NULL, '2019-08-06 13:05:14.166247', '', 3, 'FUGA E AGUA EN LAVABO DEL BAÑO\n\n', 2, 1, NULL, 'SANDRA IVONNE ', 'KRIPE', 'MARTINEZ', NULL, NULL, NULL, 7, '', '2019-08-10 18:23:04.000000', '2019-08-10 18:23:06.000000', 'PASEO DEL PARQUE', '6', NULL, 'VALLE GRANDE', 1890, 26, 'ESQ. CON SAHUARIPA', NULL, 'ATRAS DE RESTAURANT  JOWAH', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (15, '13282381', NULL, '2019-08-06 13:30:38.146414', '', 3, 'CAMBIO DE LLANTA IZQ. TRASERA', 18, 4, NULL, 'NICOLAS ABELARDO ', 'BETANCUR', NULL, NULL, NULL, NULL, 24, '', '2019-08-10 18:24:02.000000', '2019-08-10 18:24:06.000000', 'BLVD GUSTO SIERRA', NULL, '112', 'PITIC', 1890, 26, 'ESQ. CON AVENIDA CENTRAL', NULL, 'A ESPALDAS DE COLEGIO REGIS', 'BMW', 'GRIS', '376', 'PITIC HERMOSILLO', NULL, NULL, '', '');
INSERT INTO `orden` VALUES (16, '15564445', NULL, '2019-08-06 13:35:40.362699', '', 1, 'FUGA DE AGUA EN CISTERNA  EN TUBERIA E HIDRONEUMATICO', 2, 9, NULL, 'EDUARDO RAMIRO', 'VALENZUELA', NULL, 'PIPESO', 'DE C.V.', 'S.A.', 0, '', NULL, NULL, 'RETORNO FALABLLA', '13', NULL, 'RECIDENCIAL CORSELES', 1890, 26, NULL, NULL, 'MARCAR CLAVE DE ACCESO 1370', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (17, '174132', NULL, '2019-08-06 13:41:20.245140', '', 3, 'SE REPORTA CORTO EN APAGADOR DE COCINA', 4, 1, NULL, 'FAUSTO ENRIQUE.', 'Luna ', 'CASTRO', NULL, NULL, NULL, 7, '', '2019-08-10 19:12:40.000000', '2019-08-10 19:12:41.000000', 'dominico', '16', NULL, 'EL CAMPANARIO', 1890, 26, 'ESQ, CON ANTONIANOS', NULL, 'A TRES CUADRAS A LA DERECHA ENTRANDO AL FRACCIONAMIENTO', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (18, '174132', NULL, '2019-08-06 13:41:20.418149', '', 3, 'SE REPORTA CORTO EN APAGADOR DE COCINA', 4, 1, NULL, 'FAUSTO ENRIQUE.', 'Luna ', 'CASTRO', NULL, NULL, NULL, 7, '', '2019-08-10 19:12:54.000000', '2019-08-10 19:12:54.000000', 'dominico', '16', NULL, 'EL CAMPANARIO', 1890, 26, 'ESQ, CON ANTONIANOS', NULL, 'A TRES CUADRAS A LA DERECHA ENTRANDO AL FRACCIONAMIENTO', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (19, '174132', NULL, '2019-08-06 13:41:22.623276', '', 3, 'SE REPORTA CORTO EN APAGADOR DE COCINA', 4, 1, NULL, 'FAUSTO ENRIQUE.', 'Luna ', 'CASTRO', NULL, NULL, NULL, 7, '', '2019-08-10 19:13:03.000000', '2019-08-10 19:13:03.000000', 'dominico', '16', NULL, 'EL CAMPANARIO', 1890, 26, 'ESQ, CON ANTONIANOS', NULL, 'A TRES CUADRAS A LA DERECHA ENTRANDO AL FRACCIONAMIENTO', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (20, '174189', NULL, '2019-08-06 13:45:09.187234', '', 1, 'FUGA EN LAVAMANOS DE BAÑO', 2, 1, NULL, 'VICTOR', 'AGUILAR', 'CORDOVA', NULL, NULL, NULL, 7, '', NULL, NULL, 'JOSE MARIA MENDOZA', '1213', NULL, 'SAHUARO INDECO', 1890, 26, 'CALLE 9 ', 'CALLE 11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (21, '15565347', NULL, '2019-08-06 13:52:24.383126', '', 1, 'FUGA EN FREGADERO (alimentacion)', 2, 9, NULL, 'mari', 'Brawer', NULL, NULL, NULL, NULL, 7, '', NULL, NULL, 'primo de verdad ', '52', NULL, 'pitic', 1890, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (22, '174251', NULL, '2019-08-06 13:57:17.974919', '', 3, 'fuga de agua en el fregadero', 2, 1, NULL, 'RUTH', 'BRAWN', 'MOLINA', NULL, NULL, NULL, 7, '', '2019-08-11 09:46:52.000000', '2019-08-11 09:46:53.000000', 'LUIS ORCI', '149', NULL, 'BALDERRAMA', 1890, 26, 'GRAL. PÑA', 'REYES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (23, '174369', NULL, '2019-08-06 16:04:03.063905', '', 1, 'SE GENERO UN APAGON EN EL AREA DE LA SALA', 4, 1, NULL, 'RAMON ', 'CHAN', 'VALENZUELA', 'VIRGINIA ', 'LAM', NULL, 7, '', NULL, NULL, 'RETORNO ROSARIO CASTELLANOS', '33', NULL, 'URBI VILLA DEL CEDRO', 1890, 26, 'JAIME SABINES', 'GABRIEL SAID', 'A LA IZQUIERDA UN ABARREY', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (24, '174380', NULL, '2019-08-06 17:02:42.891227', '', 3, 'POSIBLE CORTO CONTACTO COCINA.  **1589 ACCESO**', 4, 1, NULL, 'GUADALUPE ', 'COTA', 'SNCHEZ', NULL, NULL, NULL, 11, '', '2019-08-11 09:49:27.000000', '2019-08-11 09:49:34.000000', 'RETORNO CAMPIRANO', '12', NULL, 'CORCELES.', 1890, 26, 'BLVD QUIROGA', 'COLOSIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (25, '174265', NULL, '2019-08-07 18:11:51.481310', '', 3, 'fuga en mecanismo wc', 2, 1, NULL, 'leslie yarim dominguez ', 'grijalva', NULL, NULL, NULL, NULL, 7, '', '2019-08-11 09:59:25.000000', '2019-08-11 09:59:26.000000', 'catabria', '27', NULL, 'portales', 1890, 26, 'esq. puerto palos', NULL, 'clave de acceso 3027', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (26, '15573616', NULL, '2019-08-08 17:36:28.624687', '', 3, 'FUGA ENTUBERIA DE TINACO', 2, 9, NULL, 'ELEN ', 'MARTINEZ', 'GARCIA', NULL, NULL, NULL, 7, '', '2019-08-11 09:58:40.000000', '2019-08-11 09:58:41.000000', 'CABALLET PONIENTE', '7', NULL, 'EL ESPLENDOR', 1890, 26, 'BLVD DEL ARTE', NULL, 'PERIMETRAL NTE  Y HAY UN CAR WACH', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (27, '15571811', NULL, '2019-08-08 17:42:12.647364', '', 3, 'FUGA DE WC ALIMENTACION', 2, 9, NULL, 'HECTOR JAVIER ', 'PEREZ', 'GASTELUM', NULL, NULL, NULL, 7, '', '2019-08-11 09:58:50.000000', '2019-08-11 09:58:51.000000', 'COLONIZADORES', '4', NULL, 'DE ANZA', 1890, 26, 'ESQ. SOLIDARIDAD', NULL, 'FRENTE FARMACIA GI', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (28, '173961', NULL, '2019-08-08 17:51:50.564419', '', 3, 'NO SIRVE LA CERRADURA SI SE REQUIERE CAMBIO HABLAR A CABINA', 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '', '2019-08-11 10:00:02.000000', '2019-08-11 10:00:04.000000', 'GERMANICA', '15', NULL, 'PRIVADAS DEL REAL', 1890, 26, 'GERNICA', 'GUADALQUIVIR', 'FACHADA CON REJA AMARILLA Y CAFE', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (29, '173963', NULL, '2019-08-08 17:57:14.899970', '', 1, 'CORTO CIRCUITO EN AREA DE LAVADO', 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 'GERMANICA', '15', NULL, 'PRIV. DEL RAL', 0, 26, 'GERNICA', 'GUADALQUIVIR', 'FACHADA CON REJA AMARILLA Y CAFE', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (30, '174265', NULL, '2019-08-08 18:53:07.869749', '', 3, 'fuga en mecanismo wc', 2, 1, NULL, 'leslie yarim ', 'dominguez', 'grijalva', NULL, NULL, NULL, 11, '', '2019-08-11 10:00:40.000000', '2019-08-11 10:00:42.000000', 'catabria', '27', NULL, 'los portales', 1890, 26, 'esq puerto de palos', NULL, 'clave acceso 3027', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (31, '174101', NULL, '2019-08-08 18:58:15.562348', '', 3, 'fuga de agua en lavabo de baño', 2, 1, NULL, 'sandra ivonne', 'kripe', 'martinez', NULL, NULL, NULL, 7, '', '2019-08-11 10:01:58.000000', '2019-08-11 10:01:59.000000', 'paseo del parque', '6', NULL, 'VALLE GRANDE', 1890, 26, 'esq. con sahuaripa', NULL, 'atras de restaurant JOWAH', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (32, '14995', NULL, '2019-08-08 19:12:09.280034', '', 1, 'FUGA EN LAVABO (GOTEA)', 2, 17, NULL, 'FERNANDO', 'LOHERA', NULL, NULL, NULL, NULL, 11, '', NULL, NULL, 'GRABADOS PONIENTE ', '2', NULL, 'EL ESPLENDOR', 1890, 26, 'ESQ. BLVD BELARDE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (33, '174905', NULL, '2019-08-09 09:20:17.599679', '', 3, 'FUGA EN TUBERIA DE AIMENTACION QUE VA AL TINACO', 2, 1, NULL, 'CARMEN MAGDALENA ', 'AMAYA', 'BORGARO', NULL, NULL, NULL, 11, '', '2019-08-11 10:02:53.000000', '2019-08-11 10:02:56.000000', 'LA MESA', NULL, '13', 'SANTA FE', 1890, 26, 'BLVD. NAVARRETE ', 'PASEO SNTA FE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (34, '17410', NULL, '2019-08-09 09:31:55.545600', '', 3, 'FUGA  EN CESPOL DE LAVABO BAÑO', 2, 1, NULL, 'LUIS RUBEN GARCILAZO', NULL, NULL, NULL, NULL, NULL, 11, '', '2019-08-11 10:05:36.000000', '2019-08-11 10:05:39.000000', 'BLVD DEL RETIRO ', '29', NULL, 'VALLE ESCONDIDO', 1890, 26, 'JARDINES ', 'LA PAZ', 'ENREJADO CAFE', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (35, '15562371', NULL, '2019-08-09 10:26:16.490115', '', 1, NULL, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (36, '174934', NULL, '2019-08-09 11:54:45.204756', '', 1, 'FALLA  DE LA MUFA DENTRO DEL DOMICILIO (POSIBLE CORTO)', 4, 1, NULL, 'MARIA FERNANDA', 'OCANO', 'FONTE', NULL, NULL, NULL, 7, '', NULL, NULL, 'PALMITO', '10-A', 'TEPIC', 'PALO VERDE', 1890, 26, 'CACTUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (37, '', NULL, '2019-08-09 12:04:20.850681', '', 1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (38, '174910', NULL, '2019-08-09 12:09:14.371470', '', 3, 'FUGA DE AGUA CESPOL DE LAVABO', 2, 1, NULL, 'LUIS RUBEN', 'GARCILAZO', NULL, NULL, NULL, NULL, 11, '', '2019-08-11 10:07:55.000000', '2019-08-11 10:07:56.000000', 'BLVD. DEL RETIRO', '29', NULL, NULL, 1890, 26, 'JARDINES', 'DE LA PAZ', 'ENREJADO CAFE', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (39, '15562371', NULL, '2019-08-09 12:14:37.543954', '', 3, 'FUGA DE FREGADERO DESGUE', 2, 9, NULL, 'FRANCISCA ', 'RODRIGUEZ', 'MOLINA', NULL, NULL, NULL, 11, '', '2019-08-10 12:44:11.000000', '2019-08-10 13:00:56.000000', 'ACACIA BLANCA', '46', NULL, 'PUERTA REAL', 1890, 26, NULL, NULL, 'CERRADA SECCION CORDOVA', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (40, '15575915', NULL, '2019-08-09 13:56:54.101945', '', 3, 'FALLA INTERRUPTOR GENERL', 4, 9, NULL, 'VICTOR ', 'MELO', 'RIVERA', NULL, NULL, NULL, 7, '', '2019-08-10 13:05:44.000000', '2019-08-10 13:05:54.000000', 'CERRADA VISCONTI', '11', NULL, 'PUERTA REAL', 1890, 26, 'NAVOJOA', 'REYES CATOLICO', 'ENTRADA SEGUNADA ETAPA', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (41, '13298871', NULL, '2019-08-09 14:08:03.590238', '', 3, NULL, 14, 4, NULL, 'ADOLFO ', 'ALVAREZ', 'QUINTERO', 'IDEL', 'ALVAREZ', 'GARCIA', 12, '', '2019-08-11 10:09:40.000000', '2019-08-11 10:09:42.000000', 'VALLE DEL TIGO', '1546', NULL, 'VILLA FONTANA', 1890, 26, 'PASEO MIRA VALLE', 'AUSTRIA', 'ESQUINA ABARROTES CAMPA', 'TOYOTA RAV 2013', 'BLANCO', '3094', NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (42, '13301635', NULL, '2019-08-10 12:07:25.865061', '', 3, 'SE ABRIRA PUERTA DE AUTO POR EL LADO DEL COPILOTO\nLAS LLAVES SE QUEDARON DENTRO.\nUSUARIO INDICO QUE SOLO SERA APERTURA( HAY UN EXCEDENTE DE $96 PESOS QUE USURIO ASEPTO CUBRIR.  ASIGNO CORRSPONSALIA :ALEJANDRA LOPEZ. ', 10, 4, NULL, 'MARIA', 'FUFUTIS', 'MENDOZA', NULL, NULL, NULL, 12, '', '2019-08-10 12:40:17.000000', '2019-08-10 12:41:51.000000', 'AMBERES', '2155', NULL, 'BELLA VISTA', 1890, 26, 'ESQ. MILAN', NULL, NULL, 'MONZA', 'ARENA', '1159', NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (43, '175132', NULL, '2019-08-10 17:28:50.809096', '', 1, 'APERTURA PUERTA PRINCIPAL CERRADURA CONVENCIONAL\n ', 10, 1, NULL, 'JOSE MARIA', 'PORTILLO ', 'ALVAREZ', NULL, NULL, NULL, 12, '', NULL, NULL, 'AYOLA  ', '20017', NULL, 'LAS ESPIGAS', 1940, 26, 'PARIS', 'ESCUINAPA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (44, 'TA2524821', NULL, '2019-08-10 17:56:07.579714', '', 1, 'SE REQUIERE CAMBIAR ', 4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (45, '173432', NULL, '2019-08-10 18:01:37.459582', '', 1, 'POSIBLE CORTO EN COCINA', 4, 1, NULL, 'MIRIAM', 'MEDINA', 'BELTRAN', 'PIPESO', 'DE C.V.', 'S.A.', 7, '', NULL, NULL, 'MAZATLAN ', '730', NULL, 'Hermosillo', 0, 0, 'PASEO COTA DE HERMOSILLO ', 'Y VILLA FONTANA', 'CASA COLOR ROSA Y CERCO CAFE', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (46, '13303728', NULL, '2019-08-11 13:35:43.278145', '', 3, NULL, 1, 4, NULL, 'Ana Maria ', 'Figueroa', 'Gonzalez', 'PIPESO', 'DE C.V.', 'S.A.', 6, '', '2019-08-11 13:35:55.000000', '2019-08-11 13:35:58.000000', 'carretera a sanpedro km 3.7', NULL, NULL, 'san pedro', 1890, 26, NULL, NULL, 'afuera del super del norte y la ferrteria lubrimar', 'Honda', 'ROJO', '9504', NULL, 'MAGNA', '20', '', '');
INSERT INTO `orden` VALUES (47, '13304837', NULL, '2019-08-12 09:01:27.760741', '', 1, 'KM ADICIONALES 25KM X 7 175 + IVA', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, '', NULL, NULL, NULL, NULL, NULL, NULL, 1940, 26, NULL, NULL, NULL, NULL, NULL, 'VE-35-821', NULL, 'PREMIUM ', '20', '', '');
INSERT INTO `orden` VALUES (48, 'PARTICULAR PLOMERIA', NULL, '2019-08-12 09:20:07.280774', '', 1, 'REQUIERE SERVICIO DE PLOMERIA Y ALBAÑILERIA PARA \nCANCELAR UNA TUBERIA', 2, 0, NULL, 'MARIA JESUS', 'PEREZ', NULL, NULL, NULL, NULL, 7, '', NULL, NULL, 'ARTICULO TERCERO', '76', NULL, 'MISION DEL SOL', 1890, 26, 'CALLE 2', 'CALLE 1 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (49, '13306057', NULL, '2019-08-12 10:17:26.471395', '', 1, 'LLANTA DELANTERA DERECHA', 18, 4, NULL, 'LUZ ALEJANDRA', 'VILLALBA', NULL, NULL, NULL, NULL, 11, '', NULL, NULL, 'DIEGO HURTADO', '661-A', NULL, 'SAN JAVIER', 1890, 26, 'SOLIDARIDAD', 'CRISTOBAL COLON', 'EBFRENDE DE FLORERIA CHADAI', 'SENTRA 2018', 'BLANCO', NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (50, '13306187', NULL, '2019-08-12 10:25:24.801440', '', 1, NULL, 1, 4, NULL, 'LUIS JAVIER', 'AMAVIZCA', NULL, NULL, NULL, NULL, 11, '', NULL, NULL, 'BLVD SOLIDARIDAD', NULL, NULL, NULL, 1890, 26, 'SOLIDARIDAD', 'NAVARRETE ', NULL, 'FORD ESCORT 98', 'VERDE', '669A', NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (51, '13306057', NULL, '2019-08-12 10:30:26.675773', '', 1, NULL, 18, 4, NULL, 'LUZ ALEJANDRA', 'VILLALBA', NULL, NULL, NULL, NULL, 11, '', NULL, NULL, 'DIEGO HURTADO', '661-A', NULL, 'SAN JAVIER', 1890, 26, 'SOLIDARIDAD', 'CRITOLBAL COLON', NULL, 'SENTRA NISSAN 2018', 'BLANCO', 'VVE3A', NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (52, '13303728', NULL, '2019-08-12 10:37:25.245513', '', 1, 'SAN PEDRO KM 37 ', 1, 4, NULL, 'ANA MARIA', 'FIGUEROA', 'GONZALEZ', NULL, NULL, NULL, 6, '', NULL, NULL, 'KM 37', NULL, NULL, 'SAN PEDRO', 0, 26, 'ESQ. ROMULO CORDOVA', NULL, 'ENFRENTE DE LUBR, MART', 'HONDA CIVIC 2002', 'ROJO', '9504', NULL, 'MAGNA', '20', '', '');
INSERT INTO `orden` VALUES (53, '175188', NULL, '2019-08-12 10:43:41.186177', '', 1, 'APERTURA PUERTA PRINCIPAL (SOLO APERTURA)', 10, 4, NULL, 'JULIO CESAR', 'MIJARES', 'SALAS', NULL, NULL, NULL, 19, '', NULL, NULL, 'CIRCUITO DEL OLIVER PTE', '3', NULL, NULL, 1890, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (54, '174132', NULL, '2019-08-12 11:08:30.120606', '', 1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (55, '13306515', NULL, '2019-08-12 12:57:28.851344', '', 1, 'CAMBIO DE LLANTA DERECHA DELANTERA USUARIO CUENTA CON BIRLOS Y LLAVE.\nENTRAR POR LA ZONA DE PROVEEDORES ACCESO 3809', 18, 4, NULL, 'EMILIANO ', 'RUIZ', 'LUCERO', NULL, NULL, NULL, 7, '', NULL, NULL, 'LAGO SUPERIOR', '9', NULL, 'VALLE DEL LAGO', 1890, 26, 'RETORNO GRANDES LAGOS', NULL, 'VALLE DEL LAGO SECCION ATARDECERES', 'HONDA HODISAY 2011', 'PLATA', NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (56, '15585574', NULL, '2019-08-12 13:09:08.627179', '', 1, 'FUGA EN TUBERIA QUE DA AL PATIO\nEN LA CASETA INFORMAR QUE VA AL DOMICILIO', 2, 9, NULL, 'MARIA TERESA', 'CARLON', NULL, NULL, NULL, NULL, 11, '', NULL, NULL, 'CERRADA DE LOS PROFETAS', '27', NULL, 'SAN MARCOS RECIEDENCIAL', 1890, 26, NULL, NULL, 'EN CERRADA DE LOS PROFETAS', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `orden` VALUES (57, '15585599', NULL, '2019-08-12 13:25:15.833283', '', 1, 'APERTURA DE PUERTA PRINCIPAL, CHAPA CONVENCIONAL', 10, 9, NULL, 'CLAUDIA ', 'RAMOS', NULL, NULL, NULL, NULL, 12, '', NULL, NULL, 'REAL DE CATALUÑA', '1921', NULL, 'MISION  DEL SOL', 1940, 26, 'BLVD MISION DEL REAL', 'SANTA FE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '');

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
INSERT INTO `tecnico` VALUES (6, 'Javier', 'Partida', 'Lugo', 0, 26, 1890, '1,7,2,4,6,8,9,10,11,12,14', '6622568642', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (7, 'Jose Luis', 'Gonzalez', '', 0, 26, 1890, '4,2,15', '', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (8, 'Rey Baltazar', 'Maldonado', 'Samayoa', 0, 26, 1890, '8,9,10,7,1,14', '6621786167', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (9, 'Rene ', 'Gonzalez', '', 0, 26, 1890, '8,9,6,16', '6621429182', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (10, 'Jose', 'Chavez', 'Gaviño', 0, 26, 1890, '2,12,8', '6621454790', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (11, 'Ramon ', 'Mac Group', '', 0, 26, 1890, '4,2,8,12', '6621575936', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (12, 'Juan Carlos ', 'Hacha', '', 0, 26, 1940, '10,1,7', '6444082100', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (13, 'Adrian ', 'Acosta', '', 0, 26, 1940, '1,14', '', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (14, 'Genaro', 'Muñoz', '', 0, 26, 1947, '2,4,6', '6221112745', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (15, 'Cristhian', 'Reyna', '', 0, 26, 0, '6,4,2,15', '6564194245', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (16, 'Carlos ', 'Contreras', '', 0, 26, 1890, '19', '6623530203', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (17, 'Francisco', 'Rodriguez', '', 0, 26, 1924, '2,4,6,12,16', '6453335111', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (18, 'Juan Ramon ', 'Esquer', '', 0, 26, 1940, '2,8', '', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (19, 'Marcos ', 'Valenzuela', '', 0, 26, 1890, '10', '6622004816', '6622249468', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (20, 'Joel', 'Magaña', '', 0, 26, 1940, '4,15,2', '6441219761', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (21, 'Everardo ', 'Gutierrez', '', 0, 26, 1890, '16,6,11', '6621554880', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (22, 'Omar ', 'Becerra', 'Gomez', 0, 26, 1890, '2,4,15', '6623953740', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (23, 'Armando', 'Veloz', '', 0, 26, 1905, '8', '6311028328', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (24, 'German ', 'Noperi ', '', 0, 26, 1890, '7,1,14', '6621600437', '', '', NULL, NULL);
INSERT INTO `tecnico` VALUES (25, 'Ivan ', 'Gonzalez', '', 0, 26, 1947, '10', '6221513625', '', '', NULL, NULL);

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
