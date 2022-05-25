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

 Date: 22/05/2022 19:54:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dungeon_access_template
-- ----------------------------
DROP TABLE IF EXISTS `dungeon_access_template`;
CREATE TABLE `dungeon_access_template`  (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The dungeon template ID',
  `map_id` mediumint(8) UNSIGNED NOT NULL COMMENT 'Map ID from instance_template',
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '5 man: 0 = normal, 1 = heroic, 2 = epic (not implemented) | 10 man: 0 = normal, 2 = heroic | 25 man: 1 = normal, 3 = heroic',
  `min_level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `max_level` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `min_avg_item_level` smallint(5) UNSIGNED NULL DEFAULT NULL COMMENT 'Min average ilvl required to enter',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Dungeon Name 5/10/25/40 man - Normal/Heroic',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_dungeon_access_template__instance_template`(`map_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Dungeon/raid access template and single requirements' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dungeon_access_template
-- ----------------------------
INSERT INTO `dungeon_access_template` VALUES (1, 33, 0, 14, 0, 0, 'Shadowfang Keep');
INSERT INTO `dungeon_access_template` VALUES (2, 34, 0, 15, 0, 0, 'Stormwind Stockades');
INSERT INTO `dungeon_access_template` VALUES (3, 36, 0, 10, 0, 0, 'Deadmines (DM)');
INSERT INTO `dungeon_access_template` VALUES (4, 43, 0, 10, 0, 0, 'Wailing Caverns (WC)');
INSERT INTO `dungeon_access_template` VALUES (5, 47, 0, 17, 0, 0, 'Razorfen Kraul');
INSERT INTO `dungeon_access_template` VALUES (6, 48, 0, 19, 0, 0, 'Blackfathom Deeps');
INSERT INTO `dungeon_access_template` VALUES (7, 70, 0, 30, 0, 0, 'Uldaman');
INSERT INTO `dungeon_access_template` VALUES (8, 90, 0, 15, 0, 0, 'Gnomeregan');
INSERT INTO `dungeon_access_template` VALUES (9, 109, 0, 35, 0, 0, 'Sunken Temple (of Atal\'Hakkar)');
INSERT INTO `dungeon_access_template` VALUES (10, 129, 0, 25, 0, 0, 'Razorfen Downs');
INSERT INTO `dungeon_access_template` VALUES (11, 189, 0, 20, 0, 0, 'Scarlet Monastery (SM) - All wings');
INSERT INTO `dungeon_access_template` VALUES (12, 209, 0, 35, 0, 0, 'Zul\'Farrak (ZF)');
INSERT INTO `dungeon_access_template` VALUES (13, 229, 0, 45, 0, 0, 'Blackrock Spire - Both Lower (LBRS) & Upper (UBRS) - 5/10man');
INSERT INTO `dungeon_access_template` VALUES (14, 230, 0, 40, 0, 0, 'Blackrock Depths (BRD)');
INSERT INTO `dungeon_access_template` VALUES (15, 249, 0, 80, 0, 0, 'Onyxia\'s Lair - 10man');
INSERT INTO `dungeon_access_template` VALUES (16, 249, 1, 80, 0, 0, 'Onyxia\'s Lair - 25man');
INSERT INTO `dungeon_access_template` VALUES (17, 269, 0, 66, 0, 0, 'Caverns Of Time: Black Morass/Opening the Dark Portal - Normal');
INSERT INTO `dungeon_access_template` VALUES (18, 269, 1, 70, 0, 0, 'Caverns Of Time: Black Morass/Opening the Dark Portal - Heroic');
INSERT INTO `dungeon_access_template` VALUES (19, 289, 0, 45, 0, 0, 'Scholomance');
INSERT INTO `dungeon_access_template` VALUES (20, 309, 0, 50, 0, 0, 'Zul\'Gurub (ZG) - 20man');
INSERT INTO `dungeon_access_template` VALUES (21, 329, 0, 45, 0, 0, 'Stratholme');
INSERT INTO `dungeon_access_template` VALUES (22, 349, 0, 30, 0, 0, 'Maraudon - All wings');
INSERT INTO `dungeon_access_template` VALUES (23, 389, 0, 8, 0, 0, 'Ragefire Chasm (RF)');
INSERT INTO `dungeon_access_template` VALUES (24, 409, 0, 50, 0, 0, 'Molten Core - 40man');
INSERT INTO `dungeon_access_template` VALUES (25, 429, 0, 45, 0, 0, 'Dire Maul - All wings');
INSERT INTO `dungeon_access_template` VALUES (26, 469, 0, 60, 0, 0, 'Blackwing Lair (BWL) - 40man');
INSERT INTO `dungeon_access_template` VALUES (27, 509, 0, 50, 0, 0, 'Ahn\'Qiraj Ruins (AQ20) - 20man');
INSERT INTO `dungeon_access_template` VALUES (28, 531, 0, 50, 0, 0, 'Ahn\'Qiraj Temple (AQ40) - 40man');
INSERT INTO `dungeon_access_template` VALUES (29, 532, 0, 68, 0, 0, 'Karazhan - 10man');
INSERT INTO `dungeon_access_template` VALUES (30, 533, 0, 80, 0, 0, 'Naxxramas - 10man');
INSERT INTO `dungeon_access_template` VALUES (31, 533, 1, 80, 0, 0, 'Naxxramas');
INSERT INTO `dungeon_access_template` VALUES (32, 534, 0, 70, 0, 0, 'Battle Of Mount Hyjal,Alliance Base');
INSERT INTO `dungeon_access_template` VALUES (33, 540, 0, 55, 0, 0, 'The Shattered Halls');
INSERT INTO `dungeon_access_template` VALUES (34, 540, 1, 70, 0, 0, 'The Shattered Halls');
INSERT INTO `dungeon_access_template` VALUES (35, 542, 0, 55, 0, 0, 'The Blood Furnace');
INSERT INTO `dungeon_access_template` VALUES (36, 542, 1, 70, 0, 0, 'The Blood Furnace');
INSERT INTO `dungeon_access_template` VALUES (37, 543, 0, 55, 0, 0, 'Hellfire Ramparts');
INSERT INTO `dungeon_access_template` VALUES (38, 543, 1, 70, 0, 0, 'Hellfire Ramparts');
INSERT INTO `dungeon_access_template` VALUES (39, 544, 0, 65, 0, 0, 'Hellfire Citadel: Magtheridon\'s Lair - 25man');
INSERT INTO `dungeon_access_template` VALUES (40, 545, 0, 55, 0, 0, 'The Steamvault');
INSERT INTO `dungeon_access_template` VALUES (41, 545, 1, 70, 0, 0, 'The Steamvault');
INSERT INTO `dungeon_access_template` VALUES (42, 546, 0, 55, 0, 0, 'The Underbog');
INSERT INTO `dungeon_access_template` VALUES (43, 546, 1, 70, 0, 0, 'The Underbog');
INSERT INTO `dungeon_access_template` VALUES (44, 547, 0, 55, 0, 0, 'The Slave Pens');
INSERT INTO `dungeon_access_template` VALUES (45, 547, 1, 70, 0, 0, 'The Slave Pens');
INSERT INTO `dungeon_access_template` VALUES (46, 548, 0, 68, 0, 0, 'Coilfang Reservoir: Serpentshrine Cavern - 25man');
INSERT INTO `dungeon_access_template` VALUES (47, 550, 0, 70, 0, 0, 'The Eye');
INSERT INTO `dungeon_access_template` VALUES (48, 552, 0, 68, 0, 0, 'The Arcatraz');
INSERT INTO `dungeon_access_template` VALUES (49, 552, 1, 70, 0, 0, 'The Arcatraz');
INSERT INTO `dungeon_access_template` VALUES (50, 553, 0, 67, 0, 0, 'The Botanica');
INSERT INTO `dungeon_access_template` VALUES (51, 553, 1, 70, 0, 0, 'The Botanica');
INSERT INTO `dungeon_access_template` VALUES (52, 554, 0, 67, 0, 0, 'The Mechanar');
INSERT INTO `dungeon_access_template` VALUES (53, 554, 1, 70, 0, 0, 'The Mechanar');
INSERT INTO `dungeon_access_template` VALUES (54, 555, 0, 65, 0, 0, 'Shadow Labyrinth');
INSERT INTO `dungeon_access_template` VALUES (55, 555, 1, 70, 0, 0, 'Shadow Labyrinth');
INSERT INTO `dungeon_access_template` VALUES (56, 556, 0, 55, 0, 0, 'Sethekk Halls');
INSERT INTO `dungeon_access_template` VALUES (57, 556, 1, 70, 0, 0, 'Sethekk Halls');
INSERT INTO `dungeon_access_template` VALUES (58, 557, 0, 55, 0, 0, 'Mana Tombs');
INSERT INTO `dungeon_access_template` VALUES (59, 557, 1, 70, 0, 0, 'Mana Tombs');
INSERT INTO `dungeon_access_template` VALUES (60, 558, 0, 55, 0, 0, 'Auchenai Crypts');
INSERT INTO `dungeon_access_template` VALUES (61, 558, 1, 70, 0, 0, 'Auchenai Crypts');
INSERT INTO `dungeon_access_template` VALUES (62, 560, 0, 64, 0, 0, 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Normal');
INSERT INTO `dungeon_access_template` VALUES (63, 560, 1, 70, 0, 0, 'Caverns Of Time: Old Hillsbrad Foothills/Escape from Durnholde - Heroic');
INSERT INTO `dungeon_access_template` VALUES (64, 564, 0, 70, 0, 0, 'Black Temple');
INSERT INTO `dungeon_access_template` VALUES (65, 565, 0, 70, 0, 0, 'Gruul\'s Lair');
INSERT INTO `dungeon_access_template` VALUES (66, 568, 0, 70, 0, 0, 'Zul\'Aman');
INSERT INTO `dungeon_access_template` VALUES (67, 574, 0, 65, 0, 0, 'Utgarde Keep');
INSERT INTO `dungeon_access_template` VALUES (68, 574, 1, 80, 0, 180, 'Utgarde Keep');
INSERT INTO `dungeon_access_template` VALUES (69, 575, 0, 75, 0, 0, 'Utgarde Pinnacle');
INSERT INTO `dungeon_access_template` VALUES (70, 575, 1, 80, 0, 180, 'Utgarde Pinnacle');
INSERT INTO `dungeon_access_template` VALUES (71, 576, 0, 66, 0, 0, 'The Nexus');
INSERT INTO `dungeon_access_template` VALUES (72, 576, 1, 80, 0, 180, 'The Nexus');
INSERT INTO `dungeon_access_template` VALUES (73, 578, 0, 75, 0, 0, 'The Oculus');
INSERT INTO `dungeon_access_template` VALUES (74, 578, 1, 80, 0, 180, 'The Oculus');
INSERT INTO `dungeon_access_template` VALUES (75, 580, 0, 70, 0, 0, 'Sunwell Plateau');
INSERT INTO `dungeon_access_template` VALUES (76, 585, 0, 65, 0, 0, 'Magisters\' Terrace - Normal');
INSERT INTO `dungeon_access_template` VALUES (77, 585, 1, 70, 0, 0, 'Magisters\' Terrace - Heroic');
INSERT INTO `dungeon_access_template` VALUES (78, 595, 0, 75, 0, 0, 'Culling of Stratholme');
INSERT INTO `dungeon_access_template` VALUES (79, 595, 1, 80, 0, 180, 'Culling of Stratholme');
INSERT INTO `dungeon_access_template` VALUES (80, 599, 0, 72, 0, 0, 'Ulduar,Halls of Stone');
INSERT INTO `dungeon_access_template` VALUES (81, 599, 1, 80, 0, 180, 'Ulduar,Halls of Stone');
INSERT INTO `dungeon_access_template` VALUES (82, 600, 0, 69, 0, 0, 'Drak\'Tharon Keep');
INSERT INTO `dungeon_access_template` VALUES (83, 600, 1, 80, 0, 180, 'Drak\'Tharon Keep');
INSERT INTO `dungeon_access_template` VALUES (84, 601, 0, 67, 0, 0, 'Azjol-Nerub');
INSERT INTO `dungeon_access_template` VALUES (85, 601, 1, 80, 0, 180, 'Azjol-Nerub');
INSERT INTO `dungeon_access_template` VALUES (86, 602, 0, 75, 0, 0, 'Ulduar,Halls of Lightning');
INSERT INTO `dungeon_access_template` VALUES (87, 602, 1, 80, 0, 180, 'Ulduar,Halls of Lightning');
INSERT INTO `dungeon_access_template` VALUES (88, 603, 0, 81, 0, 0, 'Ulduar - 10man');
INSERT INTO `dungeon_access_template` VALUES (89, 603, 1, 81, 0, 0, 'Ulduar');
INSERT INTO `dungeon_access_template` VALUES (90, 604, 0, 71, 0, 0, 'Gundrak (North entrance)');
INSERT INTO `dungeon_access_template` VALUES (91, 604, 1, 80, 0, 180, 'Gundrak (North entrance)');
INSERT INTO `dungeon_access_template` VALUES (92, 608, 0, 70, 0, 0, 'Violet Hold');
INSERT INTO `dungeon_access_template` VALUES (93, 608, 1, 80, 0, 180, 'Violet Hold');
INSERT INTO `dungeon_access_template` VALUES (94, 615, 0, 80, 0, 0, 'The Obsidian Sanctum - 10man');
INSERT INTO `dungeon_access_template` VALUES (95, 615, 1, 80, 0, 0, 'Chamber of Aspects,Obsidian Sanctum');
INSERT INTO `dungeon_access_template` VALUES (96, 616, 0, 80, 0, 0, 'The Eye of Eternity (Malygos) - 10man');
INSERT INTO `dungeon_access_template` VALUES (97, 616, 1, 80, 0, 0, 'The Eye of Eternity');
INSERT INTO `dungeon_access_template` VALUES (98, 619, 0, 68, 0, 0, 'Ahn\'Kahet');
INSERT INTO `dungeon_access_template` VALUES (99, 619, 1, 80, 0, 180, 'Ahn\'Kahet');
INSERT INTO `dungeon_access_template` VALUES (100, 624, 0, 80, 0, 0, 'Vault of Archavon - 10man');
INSERT INTO `dungeon_access_template` VALUES (101, 624, 1, 80, 0, 0, 'Vault of Archavon');
INSERT INTO `dungeon_access_template` VALUES (102, 631, 0, 81, 0, 0, 'Icecrown Citadel - 10man Normal');
INSERT INTO `dungeon_access_template` VALUES (103, 631, 1, 81, 0, 0, 'IceCrown Citadel');
INSERT INTO `dungeon_access_template` VALUES (104, 631, 2, 81, 0, 0, 'IceCrown Citadel');
INSERT INTO `dungeon_access_template` VALUES (105, 631, 3, 81, 0, 0, 'IceCrown Citadel');
INSERT INTO `dungeon_access_template` VALUES (106, 632, 0, 81, 0, 180, 'Forge of Souls');
INSERT INTO `dungeon_access_template` VALUES (107, 632, 1, 81, 0, 200, 'Forge of Souls');
INSERT INTO `dungeon_access_template` VALUES (108, 649, 0, 81, 0, 0, 'Trial of the Crusader - 10man Normal');
INSERT INTO `dungeon_access_template` VALUES (109, 649, 1, 81, 0, 0, 'Trial of the Crusader');
INSERT INTO `dungeon_access_template` VALUES (110, 649, 2, 81, 0, 0, 'Trial of the Crusader');
INSERT INTO `dungeon_access_template` VALUES (111, 649, 3, 81, 0, 0, 'Trial of the Crusader');
INSERT INTO `dungeon_access_template` VALUES (112, 650, 0, 81, 0, 180, 'Trial of the Champion');
INSERT INTO `dungeon_access_template` VALUES (113, 650, 1, 81, 0, 200, 'Trial of the Champion');
INSERT INTO `dungeon_access_template` VALUES (114, 658, 0, 81, 0, 180, 'Pit of Saron');
INSERT INTO `dungeon_access_template` VALUES (115, 658, 1, 81, 0, 200, 'Pit of Saron');
INSERT INTO `dungeon_access_template` VALUES (116, 668, 0, 81, 0, 180, 'Halls of Reflection');
INSERT INTO `dungeon_access_template` VALUES (117, 668, 1, 81, 0, 219, 'Halls of Reflection');
INSERT INTO `dungeon_access_template` VALUES (118, 724, 0, 81, 0, 0, 'The Ruby Sanctum - 10man Normal');
INSERT INTO `dungeon_access_template` VALUES (119, 724, 1, 81, 0, 0, 'The Ruby Sanctum');
INSERT INTO `dungeon_access_template` VALUES (120, 724, 2, 81, 0, 0, 'The Ruby Sanctum');
INSERT INTO `dungeon_access_template` VALUES (121, 724, 3, 81, 0, 0, 'The Ruby Sanctum');

SET FOREIGN_KEY_CHECKS = 1;
