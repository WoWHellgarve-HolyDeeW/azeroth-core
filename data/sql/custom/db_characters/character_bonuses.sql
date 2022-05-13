/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : acore_characters

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 18/04/2022 19:59:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character_bonuses
-- ----------------------------
DROP TABLE IF EXISTS `character_bonuses`;
CREATE TABLE `character_bonuses`  (
  `uuid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `guid` int(11) NOT NULL,
  `spellId` int(11) NULL DEFAULT NULL,
  `inQueue` tinyint(255) NULL DEFAULT NULL,
  `category` tinyint(255) NULL DEFAULT NULL,
  `type` tinyint(255) NULL DEFAULT NULL,
  `specId` tinyint(255) NULL DEFAULT NULL,
  `chosen` tinyint(255) NULL DEFAULT NULL,
  `isDefault` tinyint(255) NULL DEFAULT 0,
  `createdAt` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
