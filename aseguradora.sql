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

 Date: 27/08/2019 16:07:07
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

SET FOREIGN_KEY_CHECKS = 1;
