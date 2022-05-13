/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : acore_world

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 25/04/2022 13:45:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_enchants
-- ----------------------------
DROP TABLE IF EXISTS `custom_enchants`;
CREATE TABLE `custom_enchants`  (
  `enchantId` int(11) NOT NULL,
  `allowableClass` int(255) NULL DEFAULT -1,
  `level` tinyint(255) NULL DEFAULT 0,
  PRIMARY KEY (`enchantId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_enchants
-- ----------------------------
INSERT INTO `custom_enchants` VALUES (600600, 128, 0);
INSERT INTO `custom_enchants` VALUES (600601, 128, 0);
INSERT INTO `custom_enchants` VALUES (600602, 128, 0);
INSERT INTO `custom_enchants` VALUES (600603, 128, 0);
INSERT INTO `custom_enchants` VALUES (600604, 128, 0);
INSERT INTO `custom_enchants` VALUES (600605, 128, 0);
INSERT INTO `custom_enchants` VALUES (600606, 128, 0);
INSERT INTO `custom_enchants` VALUES (600607, 128, 0);
INSERT INTO `custom_enchants` VALUES (600608, 128, 0);
INSERT INTO `custom_enchants` VALUES (600609, 128, 0);
INSERT INTO `custom_enchants` VALUES (600610, 128, 0);
INSERT INTO `custom_enchants` VALUES (600611, 128, 0);
INSERT INTO `custom_enchants` VALUES (600612, 128, 0);
INSERT INTO `custom_enchants` VALUES (600613, 128, 0);
INSERT INTO `custom_enchants` VALUES (600614, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600615, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600616, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600617, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600618, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600619, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600620, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600621, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600622, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600623, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600624, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600625, 1024, 0);
INSERT INTO `custom_enchants` VALUES (600626, 2, 0);
INSERT INTO `custom_enchants` VALUES (600627, 2, 0);
INSERT INTO `custom_enchants` VALUES (600628, 2, 0);
INSERT INTO `custom_enchants` VALUES (600629, 2, 0);
INSERT INTO `custom_enchants` VALUES (600630, 2, 0);
INSERT INTO `custom_enchants` VALUES (600631, 2, 0);
INSERT INTO `custom_enchants` VALUES (600632, 2, 0);
INSERT INTO `custom_enchants` VALUES (600633, 2, 0);
INSERT INTO `custom_enchants` VALUES (600634, 2, 0);
INSERT INTO `custom_enchants` VALUES (600635, 2, 0);
INSERT INTO `custom_enchants` VALUES (600636, 2, 0);
INSERT INTO `custom_enchants` VALUES (600637, 2, 0);
INSERT INTO `custom_enchants` VALUES (600638, 2, 0);
INSERT INTO `custom_enchants` VALUES (600639, 2, 0);
INSERT INTO `custom_enchants` VALUES (600640, 256, 0);
INSERT INTO `custom_enchants` VALUES (600641, 256, 0);
INSERT INTO `custom_enchants` VALUES (600642, 256, 0);
INSERT INTO `custom_enchants` VALUES (600643, 256, 0);
INSERT INTO `custom_enchants` VALUES (600644, 256, 0);
INSERT INTO `custom_enchants` VALUES (600645, 256, 0);
INSERT INTO `custom_enchants` VALUES (600646, 256, 0);
INSERT INTO `custom_enchants` VALUES (600647, 256, 0);
INSERT INTO `custom_enchants` VALUES (600648, 256, 0);
INSERT INTO `custom_enchants` VALUES (600649, 256, 0);
INSERT INTO `custom_enchants` VALUES (600650, 256, 0);
INSERT INTO `custom_enchants` VALUES (600651, 256, 0);
INSERT INTO `custom_enchants` VALUES (600652, 4, 0);
INSERT INTO `custom_enchants` VALUES (600653, 4, 0);
INSERT INTO `custom_enchants` VALUES (600654, 4, 0);
INSERT INTO `custom_enchants` VALUES (600655, 4, 0);
INSERT INTO `custom_enchants` VALUES (600656, 4, 0);
INSERT INTO `custom_enchants` VALUES (600657, 4, 0);
INSERT INTO `custom_enchants` VALUES (600658, 4, 0);
INSERT INTO `custom_enchants` VALUES (600659, 4, 0);
INSERT INTO `custom_enchants` VALUES (600660, 4, 0);
INSERT INTO `custom_enchants` VALUES (600661, 4, 0);
INSERT INTO `custom_enchants` VALUES (600662, 4, 0);
INSERT INTO `custom_enchants` VALUES (600663, 4, 0);
INSERT INTO `custom_enchants` VALUES (600664, 4, 0);
INSERT INTO `custom_enchants` VALUES (600665, 32, 0);
INSERT INTO `custom_enchants` VALUES (600666, 32, 0);
INSERT INTO `custom_enchants` VALUES (600667, 32, 0);
INSERT INTO `custom_enchants` VALUES (600668, 32, 0);
INSERT INTO `custom_enchants` VALUES (600669, 32, 0);
INSERT INTO `custom_enchants` VALUES (600670, 32, 0);
INSERT INTO `custom_enchants` VALUES (600671, 32, 0);
INSERT INTO `custom_enchants` VALUES (600672, 32, 0);
INSERT INTO `custom_enchants` VALUES (600673, 32, 0);
INSERT INTO `custom_enchants` VALUES (600674, 32, 0);
INSERT INTO `custom_enchants` VALUES (600675, 32, 0);
INSERT INTO `custom_enchants` VALUES (600676, 64, 0);
INSERT INTO `custom_enchants` VALUES (600677, 64, 0);
INSERT INTO `custom_enchants` VALUES (600678, 64, 0);
INSERT INTO `custom_enchants` VALUES (600679, 64, 0);
INSERT INTO `custom_enchants` VALUES (600680, 64, 0);
INSERT INTO `custom_enchants` VALUES (600681, 64, 0);
INSERT INTO `custom_enchants` VALUES (600682, 64, 0);
INSERT INTO `custom_enchants` VALUES (600683, 64, 0);
INSERT INTO `custom_enchants` VALUES (600684, 64, 0);
INSERT INTO `custom_enchants` VALUES (600685, 64, 0);
INSERT INTO `custom_enchants` VALUES (600686, 8, 0);
INSERT INTO `custom_enchants` VALUES (600687, 8, 0);
INSERT INTO `custom_enchants` VALUES (600688, 8, 0);
INSERT INTO `custom_enchants` VALUES (600689, 8, 0);
INSERT INTO `custom_enchants` VALUES (600690, 8, 0);
INSERT INTO `custom_enchants` VALUES (600691, 8, 0);
INSERT INTO `custom_enchants` VALUES (600692, 8, 0);
INSERT INTO `custom_enchants` VALUES (600693, 8, 0);
INSERT INTO `custom_enchants` VALUES (600694, 8, 0);
INSERT INTO `custom_enchants` VALUES (600695, 8, 0);
INSERT INTO `custom_enchants` VALUES (600696, 8, 0);
INSERT INTO `custom_enchants` VALUES (600697, 8, 0);
INSERT INTO `custom_enchants` VALUES (600698, 8, 0);
INSERT INTO `custom_enchants` VALUES (600699, 1, 0);
INSERT INTO `custom_enchants` VALUES (600700, 1, 0);
INSERT INTO `custom_enchants` VALUES (600701, 1, 0);
INSERT INTO `custom_enchants` VALUES (600702, 1, 0);
INSERT INTO `custom_enchants` VALUES (600703, 1, 0);
INSERT INTO `custom_enchants` VALUES (600704, 1, 0);
INSERT INTO `custom_enchants` VALUES (600705, 1, 0);
INSERT INTO `custom_enchants` VALUES (600706, 1, 0);
INSERT INTO `custom_enchants` VALUES (600707, 1, 0);
INSERT INTO `custom_enchants` VALUES (600708, 1, 0);
INSERT INTO `custom_enchants` VALUES (600709, 1, 0);
INSERT INTO `custom_enchants` VALUES (600710, 1, 0);
INSERT INTO `custom_enchants` VALUES (600711, 1, 0);
INSERT INTO `custom_enchants` VALUES (600712, 16, 0);
INSERT INTO `custom_enchants` VALUES (600713, 16, 0);
INSERT INTO `custom_enchants` VALUES (600714, 16, 0);
INSERT INTO `custom_enchants` VALUES (600715, 16, 0);
INSERT INTO `custom_enchants` VALUES (600716, 16, 0);
INSERT INTO `custom_enchants` VALUES (600717, 16, 0);
INSERT INTO `custom_enchants` VALUES (600718, 16, 0);
INSERT INTO `custom_enchants` VALUES (600719, 16, 0);
INSERT INTO `custom_enchants` VALUES (600720, 16, 0);
INSERT INTO `custom_enchants` VALUES (600721, 16, 0);
INSERT INTO `custom_enchants` VALUES (600722, 16, 0);
INSERT INTO `custom_enchants` VALUES (600723, 16, 0);
INSERT INTO `custom_enchants` VALUES (600724, 16, 0);
INSERT INTO `custom_enchants` VALUES (600725, -1, 0);
INSERT INTO `custom_enchants` VALUES (600726, -1, 0);
INSERT INTO `custom_enchants` VALUES (600727, -1, 0);
INSERT INTO `custom_enchants` VALUES (600728, -1, 0);
INSERT INTO `custom_enchants` VALUES (600729, -1, 0);

SET FOREIGN_KEY_CHECKS = 1;
