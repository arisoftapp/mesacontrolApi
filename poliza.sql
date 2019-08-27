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

 Date: 27/08/2019 16:08:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
