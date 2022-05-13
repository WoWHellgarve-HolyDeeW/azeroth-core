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

 Date: 27/04/2022 14:14:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mythic_loot
-- ----------------------------
DROP TABLE IF EXISTS `mythic_loot`;
CREATE TABLE `mythic_loot`  (
  `id` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `quantity` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `ItemId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mythic_loot
-- ----------------------------
INSERT INTO `mythic_loot` VALUES (1101, 40628, 1);
INSERT INTO `mythic_loot` VALUES (1101, 40629, 1);
INSERT INTO `mythic_loot` VALUES (1101, 40630, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110100, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110101, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110102, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110103, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110104, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110105, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110106, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110107, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110108, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110109, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110110, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110111, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110112, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110113, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110114, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110115, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110116, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110117, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110118, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110119, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110120, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110121, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110122, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110123, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110124, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110125, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110126, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110127, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110128, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110129, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110130, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110131, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110132, 1);
INSERT INTO `mythic_loot` VALUES (1101, 110133, 1);
INSERT INTO `mythic_loot` VALUES (1201, 120100, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120101, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120102, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120103, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120104, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120105, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120106, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120107, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120108, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120109, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120110, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120111, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120112, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120113, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120114, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120115, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120116, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120117, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120118, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120119, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120120, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120121, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120122, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120123, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120124, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120125, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120126, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120127, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120128, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120129, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120130, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120131, NULL);
INSERT INTO `mythic_loot` VALUES (1201, 120132, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120200, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120201, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120202, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120203, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120204, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120205, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120206, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120207, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120208, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120209, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120210, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120211, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120212, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120213, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120214, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120215, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120216, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120217, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120218, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120219, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120220, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120221, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120222, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120223, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120224, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120225, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120226, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120227, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120228, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120229, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120230, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120231, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120232, NULL);
INSERT INTO `mythic_loot` VALUES (1202, 120233, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120300, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120301, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120302, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120303, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120304, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120305, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120306, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120307, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120308, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120309, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120310, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120311, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120312, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120313, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120314, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120315, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120316, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120317, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120318, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120319, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120320, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120321, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120322, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120323, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120324, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120325, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120326, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120327, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120328, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120329, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120330, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120331, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120332, NULL);
INSERT INTO `mythic_loot` VALUES (1203, 120333, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120400, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120401, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120402, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120403, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120404, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120405, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120406, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120407, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120408, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120409, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120410, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120411, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120412, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120413, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120414, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120415, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120416, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120417, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120418, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120419, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120420, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120421, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120422, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120423, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120424, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120425, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120426, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120427, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120428, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120429, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120430, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120431, NULL);
INSERT INTO `mythic_loot` VALUES (1204, 120432, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120500, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120501, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120502, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120503, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120504, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120505, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120506, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120507, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120508, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120509, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120510, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120511, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120512, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120513, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120514, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120515, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120516, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120517, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120518, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120519, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120520, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120521, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120522, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120523, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120524, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120525, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120526, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120527, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120528, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120529, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120530, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120531, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120532, NULL);
INSERT INTO `mythic_loot` VALUES (1205, 120533, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120600, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120601, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120602, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120603, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120604, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120605, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120606, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120607, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120608, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120609, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120610, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120611, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120612, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120613, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120614, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120615, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120616, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120617, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120618, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120619, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120620, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120621, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120622, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120623, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120624, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120625, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120626, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120627, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120628, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120629, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120630, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120631, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120632, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120633, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120634, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120635, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120636, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120637, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120638, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120639, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120640, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120641, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120642, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120643, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120644, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120645, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120646, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120647, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120648, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120649, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120650, NULL);
INSERT INTO `mythic_loot` VALUES (1206, 120651, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 40634, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 40635, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 40636, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120700, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120701, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120702, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120703, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120704, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120705, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120706, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120707, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120708, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120709, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120710, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120711, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120712, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120713, NULL);
INSERT INTO `mythic_loot` VALUES (1207, 120714, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120800, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120801, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120802, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120803, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120804, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120805, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120806, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120807, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120808, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120809, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120810, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120811, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120812, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120813, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120814, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120815, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120816, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120817, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120818, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120819, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120820, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120821, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120822, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120823, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120824, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120825, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120826, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120827, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120828, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120829, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120830, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120831, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120832, NULL);
INSERT INTO `mythic_loot` VALUES (1208, 120833, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120900, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120901, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120902, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120903, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120904, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120905, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120906, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120907, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120908, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120909, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120910, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120911, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120912, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120913, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120914, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120915, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120916, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120917, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120918, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120919, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120920, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120921, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120922, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120923, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120924, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120925, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120926, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120927, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120928, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120929, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120930, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120931, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120932, NULL);
INSERT INTO `mythic_loot` VALUES (1209, 120933, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 40637, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 40638, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 40639, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121000, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121001, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121002, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121003, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121004, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121005, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121006, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121007, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121008, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121009, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121010, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121011, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121012, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121013, NULL);
INSERT INTO `mythic_loot` VALUES (1210, 121014, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121100, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121101, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121102, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121103, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121104, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121105, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121106, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121107, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121108, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121109, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121110, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121111, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121112, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121113, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121114, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121115, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121116, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121117, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121118, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121119, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121120, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121121, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121122, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121123, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121124, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121125, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121126, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121127, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121128, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121129, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121130, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121131, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121132, NULL);
INSERT INTO `mythic_loot` VALUES (1211, 121133, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121200, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121201, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121202, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121203, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121204, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121205, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121206, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121207, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121208, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121209, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121210, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121211, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121212, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121213, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121214, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121215, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121216, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121217, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121218, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121219, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121220, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121221, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121222, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121223, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121224, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121225, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121226, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121227, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121228, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121229, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121230, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121231, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121232, NULL);
INSERT INTO `mythic_loot` VALUES (1212, 121233, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 40625, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 40626, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 40627, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121300, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121301, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121302, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121303, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121304, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121305, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121306, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121307, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121308, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121309, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121310, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121311, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121312, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121313, NULL);
INSERT INTO `mythic_loot` VALUES (1213, 121314, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 44577, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 44581, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121400, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121401, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121402, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121403, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121404, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121405, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121406, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121407, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121408, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121409, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121410, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121411, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121412, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121413, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121414, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121415, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121416, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121417, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121418, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121419, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121420, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121421, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121422, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121423, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121424, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121425, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121426, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121427, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121428, NULL);
INSERT INTO `mythic_loot` VALUES (1214, 121429, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 40631, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 40632, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 40633, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121500, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121501, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121502, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121503, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121504, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121505, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121506, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121507, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121508, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121509, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121510, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121511, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121512, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121513, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121514, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121515, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121516, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121517, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121518, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121519, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121520, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121521, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121522, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121523, NULL);
INSERT INTO `mythic_loot` VALUES (1215, 121524, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 43952, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130100, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130101, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130102, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130103, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130104, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130105, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130106, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130107, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130108, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130109, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130110, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130111, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130112, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130113, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130114, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130115, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130116, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130117, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130118, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130119, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130120, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130121, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130122, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130123, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130124, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130125, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130126, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130127, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130128, NULL);
INSERT INTO `mythic_loot` VALUES (1301, 130129, NULL);

SET FOREIGN_KEY_CHECKS = 1;
