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

 Date: 27/08/2019 16:07:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
