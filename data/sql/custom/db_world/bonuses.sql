/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : world

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 18/04/2022 20:00:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bonuses
-- ----------------------------
DROP TABLE IF EXISTS `bonuses`;
CREATE TABLE `bonuses`  (
  `id` int(11) NOT NULL,
  `unique` tinyint(255) NULL DEFAULT NULL,
  `allowableClass` int(255) NULL DEFAULT -1,
  `permanent` tinyint(255) NULL DEFAULT 1,
  `chance` int(255) NULL DEFAULT 100,
  `category` tinyint(255) NULL DEFAULT NULL,
  `type` tinyint(255) NULL DEFAULT NULL,
  `groupId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
