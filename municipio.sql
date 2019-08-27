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

 Date: 27/08/2019 16:07:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
