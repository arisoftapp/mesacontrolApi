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

 Date: 12/09/2019 13:01:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for costo
-- ----------------------------
DROP TABLE IF EXISTS `costo`;
CREATE TABLE `costo`  (
  `id_orden` int(255) NOT NULL,
  `mano_obra` double(255, 0) NULL DEFAULT 0,
  `corres` double(255, 0) NULL DEFAULT 0,
  `kilometros` double(255, 0) NULL DEFAULT 0,
  `importe_materiales` double(255, 0) NULL DEFAULT 0,
  `total` double(255, 0) NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
