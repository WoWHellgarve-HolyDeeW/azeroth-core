/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : characters

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 19/04/2022 17:25:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character_modes
-- ----------------------------
DROP TABLE IF EXISTS `character_modes`;
CREATE TABLE `character_modes`  (
  `guid` int(11) NOT NULL,
  `mode` bigint(255) NULL DEFAULT NULL,
  `done` tinyint(255) NULL DEFAULT 0,
  `createdAt` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
