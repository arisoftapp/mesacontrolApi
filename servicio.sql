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

 Date: 27/08/2019 16:08:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
