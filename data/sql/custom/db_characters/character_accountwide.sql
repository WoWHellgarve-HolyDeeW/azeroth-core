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

 Date: 18/04/2022 19:58:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character_accountwide_mount
-- ----------------------------
DROP TABLE IF EXISTS `character_accountwide_mount`;
CREATE TABLE `character_accountwide_mount`  (
  `accountId` int(11) NOT NULL,
  `spellId` int(11) NOT NULL,
  PRIMARY KEY (`accountId`, `spellId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_accountwide_reputation
-- ----------------------------
DROP TABLE IF EXISTS `character_accountwide_reputation`;
CREATE TABLE `character_accountwide_reputation`  (
  `accountId` int(11) NOT NULL,
  `standing` int(255) NOT NULL,
  `factionId` int(11) NOT NULL,
  PRIMARY KEY (`accountId`, `standing`, `factionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_accountwide_taxi
-- ----------------------------
DROP TABLE IF EXISTS `character_accountwide_taxi`;
CREATE TABLE `character_accountwide_taxi`  (
  `accountId` int(11) NOT NULL,
  `node` int(255) NOT NULL,
  PRIMARY KEY (`accountId`, `node`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_accountwide_title
-- ----------------------------
DROP TABLE IF EXISTS `character_accountwide_title`;
CREATE TABLE `character_accountwide_title`  (
  `accountId` int(11) NOT NULL,
  `titleId` int(11) NOT NULL,
  PRIMARY KEY (`accountId`, `titleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
