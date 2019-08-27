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

 Date: 27/08/2019 16:07:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
