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

 Date: 18/04/2022 20:51:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for character_active_poll_perks
-- ----------------------------
DROP TABLE IF EXISTS `character_active_poll_perks`;
CREATE TABLE `character_active_poll_perks`  (
  `guid` int(11) NOT NULL,
  `spellId` int(11) NULL DEFAULT NULL,
  `specId` int(11) NULL DEFAULT NULL,
  `isChosen` tinyint(255) NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
