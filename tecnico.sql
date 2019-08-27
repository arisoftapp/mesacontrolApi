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

 Date: 27/08/2019 16:08:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
