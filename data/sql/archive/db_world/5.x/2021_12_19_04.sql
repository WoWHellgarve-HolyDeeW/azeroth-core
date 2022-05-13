-- DB update 2021_12_19_03 -> 2021_12_19_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_12_19_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_12_19_03 2021_12_19_04 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1639784010825845091'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1639784010825845091');

-- Windrunner Village

-- Respawn Phantasmal Seeker
DELETE FROM `creature` WHERE `id`=16323;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`ScriptName`,`VerifiedBuild`) VALUES
(82365, 16323, 530, 0, 0, 1, 1, 0, 0, 7337.08, -5955.628, 16.020636, 2.906997919082641601, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82350, 16323, 530, 0, 0, 1, 1, 0, 0, 7293.7656, -5866.1025, 15.965864, 0.837758064270019531, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82492, 16323, 530, 0, 0, 1, 1, 0, 0, 7216.102, -5949.7236, 21.42316, 1.320139408111572265, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82495, 16323, 530, 0, 0, 1, 1, 0, 0, 7193.2686, -5955.971, 21.408205, 3.926452159881591796, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82343, 16323, 530, 0, 0, 1, 1, 0, 0, 7101.747, -5823.162, 28.058128, 5.424769401550292968, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82487, 16323, 530, 0, 0, 1, 1, 0, 0, 7173.976, -5960.954, 37.294537, 3.018028497695922851, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82493, 16323, 530, 0, 0, 1, 1, 0, 0, 7193.401, -5955.305, 37.29319, 2.536022424697875976, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82490, 16323, 530, 0, 0, 1, 1, 0, 0, 7216.9116, -5978.712, 19.762234, 2.027275562286376953, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82494, 16323, 530, 0, 0, 1, 1, 0, 0, 7189.9775, -5934.968, 37.295235, 2.594232797622680664, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82496, 16323, 530, 0, 0, 1, 1, 0, 0, 7200.259, -5974.7334, 37.295174, 4.607669353485107421, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82322, 16323, 530, 0, 0, 1, 1, 0, 0, 7305.513, -5844.5586, 15.955423, 2.213610410690307617, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82324, 16323, 530, 0, 0, 1, 1, 0, 0, 7320.78, -5854.772, 23.892014, 5.375614166259765625, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82332, 16323, 530, 0, 0, 1, 1, 0, 0, 7277.304, -5830.534, 26.002935, 3.549860477447509765, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82318, 16323, 530, 0, 0, 1, 1, 0, 0, 7318.713, -5817.8735, 36.63201, 3.661095380783081054, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82319, 16323, 530, 0, 0, 1, 1, 0, 0, 7328.855, -5840.738, 36.63805, 4.156533241271972656, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82326, 16323, 530, 0, 0, 1, 1, 0, 0, 7304.423, -5845.991, 25.912775, 4.40850830078125, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82333, 16323, 530, 0, 0, 1, 1, 0, 0, 7282.8506, -5834.311, 36.637493, 4.599081039428710937, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82349, 16323, 530, 0, 0, 1, 1, 0, 0, 7314.559, -5867.8447, 36.639473, 3.23850417137145996, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82325, 16323, 530, 0, 0, 1, 1, 0, 0, 7308.0244, -5837.12, 36.65221, 5.553331375122070312, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82351, 16323, 530, 0, 0, 1, 1, 0, 0, 7299.4473, -5854.985, 36.65165, 2.129517078399658203, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82323, 16323, 530, 0, 0, 1, 1, 0, 0, 7317.896, -5854.1475, 36.656178, 3.93407297134399414, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82328, 16323, 530, 0, 0, 1, 1, 0, 0, 7286.8193, -5885.7305, 13.588091, 1.093656301498413085, 300, 0, 0, 1, 0, 2, 0, 0, 0, '', 0),
(82497, 16323, 530, 0, 0, 1, 1, 0, 0, 7079.4795, -5836.2217, 24.6094, 4.2983856201171875, 300, 0, 0, 1, 0, 2, 0, 0, 0, '', 0),
(82344, 16323, 530, 0, 0, 1, 1, 0, 0, 7191.7173, -5859.729, 14.524639, 1.99407958984375, 300, 4, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82491, 16323, 530, 0, 0, 1, 1, 0, 0, 7265.72, -5934.7666, 17.94278, 2.111848354339599609, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82352, 16323, 530, 0, 0, 1, 1, 0, 0, 7278.3433, -5927.71, 17.917862, 5.191697120666503906, 300, 2, 0, 1, 0, 1, 0, 0, 0, '', 0);

-- Respawn Stonewing Slayer
DELETE FROM `creature` WHERE `id`=16324;
DELETE FROM `creature` WHERE `guid`=82336;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`ScriptName`,`VerifiedBuild`) VALUES
(82484, 16324, 530, 0, 0, 1, 1, 0, 0, 7286.3057, -6011.4873, 18.123753, 0.757922708988189697, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82373, 16324, 530, 0, 0, 1, 1, 0, 0, 7317.652, -5985.4385, 15.159128, 0.907571196556091308, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82366, 16324, 530, 0, 0, 1, 1, 0, 0, 7347.3413, -5982.721, 11.589425, 1.225203990936279296, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82362, 16324, 530, 0, 0, 1, 1, 0, 0, 7383.033, -5946.0625, 15.268849, 0.644867241382598876, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82354, 16324, 530, 0, 0, 1, 1, 0, 0, 7350.886, -5918.5527, 13.793149, 0.305367976427078247, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82347, 16324, 530, 0, 0, 1, 1, 0, 0, 7320.355, -5887.585, 14.603671, 1.442512989044189453, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82353, 16324, 530, 0, 0, 1, 1, 0, 0, 7318.848, -5913.211, 15.616427, 5.841299057006835937, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82503, 16324, 530, 0, 0, 1, 1, 0, 0, 7112.414, -5880.1416, 13.517964, 2.066246509552001953, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82505, 16324, 530, 0, 0, 1, 1, 0, 0, 7060.271, -5854.9697, 19.102646, 3.873501539230346679, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82504, 16324, 530, 0, 0, 1, 1, 0, 0, 7081.804, -5881.824, 13.51797, 2.336824893951416015, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82501, 16324, 530, 0, 0, 1, 1, 0, 0, 7178.292, -5912.5986, 14.145738, 1.169049382209777832, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82500, 16324, 530, 0, 0, 1, 1, 0, 0, 7150.548, -5919.0757, 12.07551, 5.559179306030273437, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82340, 16324, 530, 0, 0, 1, 1, 0, 0, 7150.846, -5852.5225, 11.859842, 0.807836592197418212, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82499, 16324, 530, 0, 0, 1, 1, 0, 0, 7151.2285, -5951.1777, 14.510498, 4.542376041412353515, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82498, 16324, 530, 0, 0, 1, 1, 0, 0, 7171.5063, -5988.0474, 19.543344, 5.741291522979736328, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82489, 16324, 530, 0, 0, 1, 1, 0, 0, 7247.739, -5989.7656, 18.95509, 3.760385513305664062, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82485, 16324, 530, 0, 0, 1, 1, 0, 0, 7249.2095, -6018.532, 19.28175, 3.639249324798583984, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82348, 16324, 530, 0, 0, 1, 1, 0, 0, 7248.385, -5883.5005, 15.519976, 6.12486287580908203125, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82346, 16324, 530, 0, 0, 1, 1, 0, 0, 7217.838, -5886.397, 13.680141, 4.265284538269042968, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82321, 16324, 530, 0, 0, 1, 1, 0, 0, 7320.0615, -5814.5776, 11.878908, 1.328147053718566894, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82329, 16324, 530, 0, 0, 1, 1, 0, 0, 7346.9834, -5850.5303, 14.873583, 4.004080772399902343, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82486, 16324, 530, 0, 0, 1, 1, 0, 0, 7316.242, -5867.7593, 36.63754, 3.486287593841552734, 300, 0, 0, 1, 0, 2, 0, 0, 0, '', 0),
(82367, 16324, 530, 0, 0, 1, 1, 0, 0, 7364.819, -5966.272, 13.050111, 4.007206439971923828, 300, 0, 0, 1, 0, 2, 0, 0, 0, '', 0),
(82336, 16324, 530, 0, 0, 1, 1, 0, 0, 7215.4883, -5822.1455, 10.822056, 1.137501955032348632, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82337, 16324, 530, 0, 0, 1, 1, 0, 0, 7190.469, -5821.857, 15.308548, 5.413441658020019531, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82345, 16324, 530, 0, 0, 1, 1, 0, 0, 7179.9756, -5886.4805, 11.110972, 4.426172256469726562, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82338, 16324, 530, 0, 0, 1, 1, 0, 0, 7248.4316, -5848.971, 13.171762, 2.337450265884399414, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(82334, 16324, 530, 0, 0, 1, 1, 0, 0, 7276.3823, -5812.784, 12.109152, 1.484862875588418212, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0);

-- Pathing for Phantasmal Seeker Entry: 16323
SET @NPC := 82328;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7287.8228,-5883.7896,13.539035,0,0,0,0,100,0),
(@PATH,2,7285.8115,-5893.134,13.789035,0,0,0,0,100,0),
(@PATH,3,7267.225,-5897.0396,14.87131,0,0,0,0,100,0),
(@PATH,4,7253.26,-5903.4355,15.479996,0,0,0,0,100,0),
(@PATH,5,7242.7173,-5913.6274,16.433731,0,0,0,0,100,0),
(@PATH,6,7240.8535,-5930.3916,17.343765,0,0,0,0,100,0),
(@PATH,7,7239.111,-5946.506,18.061293,0,0,0,0,100,0),
(@PATH,8,7249.4116,-5964.729,18.067152,0,0,0,0,100,0),
(@PATH,9,7267.4814,-5976.908,17.212618,0,0,0,0,100,0),
(@PATH,10,7286.501,-5964.237,15.477797,0,0,0,0,100,0),
(@PATH,11,7301.863,-5955.8813,14.95287,0,0,0,0,100,0),
(@PATH,12,7312.5454,-5947.145,13.739003,0,0,0,0,100,0),
(@PATH,13,7306.452,-5925.6514,14.437667,0,0,0,0,100,0),
(@PATH,14,7298.639,-5913.2705,14.670607,0,0,0,0,100,0),
(@PATH,15,7287.653,-5895.778,13.914035,0,0,0,0,100,0);

-- Pathing for Phantasmal Seeker Entry: 16323
SET @NPC := 82497;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7078.8936,-5837.555,24.471336,0,0,0,0,100,0),
(@PATH,2,7065.068,-5844.194,21.727947,0,0,0,0,100,0),
(@PATH,3,7064.487,-5861.2456,17.463543,0,0,0,0,100,0),
(@PATH,4,7079.6963,-5879.5854,13.484352,0,0,0,0,100,0),
(@PATH,5,7100.6606,-5881.0415,13.504208,0,0,0,0,100,0),
(@PATH,6,7126.1177,-5874.634,13.504208,0,0,0,0,100,0),
(@PATH,7,7146.7617,-5869.35,12.569586,0,0,0,0,100,0),
(@PATH,8,7167.731,-5888.3984,11.15952,0,0,0,0,100,0),
(@PATH,9,7199.818,-5896.315,12.859471,0,0,0,0,100,0),
(@PATH,10,7230.858,-5890.361,15.052214,0,0,0,0,100,0),
(@PATH,11,7249.5293,-5883.857,15.778265,0,0,0,0,100,0),
(@PATH,12,7270.5845,-5881.6475,14.946628,0,0,0,0,100,0),
(@PATH,13,7287.4766,-5877.186,13.539035,0,0,0,0,100,0),
(@PATH,14,7294.007,-5868.0605,15.882529,0,0,0,0,100,0),
(@PATH,15,7311.232,-5834.498,15.878667,0,0,0,0,100,0),
(@PATH,16,7320.2344,-5811.8125,11.586924,0,0,0,0,100,0),
(@PATH,17,7311.232,-5834.498,15.878667,0,0,0,0,100,0),
(@PATH,18,7294.007,-5868.0605,15.882529,0,0,0,0,100,0),
(@PATH,19,7287.4766,-5877.186,13.539035,0,0,0,0,100,0),
(@PATH,20,7270.5845,-5881.6475,14.946628,0,0,0,0,100,0),
(@PATH,21,7249.5293,-5883.857,15.778265,0,0,0,0,100,0),
(@PATH,22,7230.858,-5890.361,15.052214,0,0,0,0,100,0),
(@PATH,23,7199.818,-5896.315,12.859471,0,0,0,0,100,0),
(@PATH,24,7167.731,-5888.3984,11.15952,0,0,0,0,100,0),
(@PATH,25,7146.7617,-5869.35,12.569586,0,0,0,0,100,0),
(@PATH,26,7126.1177,-5874.634,13.504208,0,0,0,0,100,0),
(@PATH,27,7100.6606,-5881.0415,13.504208,0,0,0,0,100,0),
(@PATH,28,7079.6963,-5879.5854,13.484352,0,0,0,0,100,0),
(@PATH,29,7064.487,-5861.2456,17.463543,0,0,0,0,100,0),
(@PATH,30,7065.0674,-5844.246,21.713665,0,0,0,0,100,0);

-- Pathing for Stonewing Slayer Entry: 16324
SET @NPC := 82367;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7369.158,-5936.1543,15.36826,0,0,0,0,100,0),
(@PATH,2,7343.0713,-5914.3643,14.858722,0,0,0,0,100,0),
(@PATH,3,7327.6025,-5890.818,15.065943,0,0,0,0,100,0),
(@PATH,4,7335.854,-5864.2925,14.377511,0,0,0,0,100,0),
(@PATH,5,7340.393,-5850.4683,14.400704,0,0,0,0,100,0),
(@PATH,6,7324.6094,-5822.4634,12.21998,0,0,0,0,100,0),
(@PATH,7,7286.2456,-5814.7207,12.166025,0,0,0,0,100,0),
(@PATH,8,7261.852,-5816.5923,12.432216,0,0,0,0,100,0),
(@PATH,9,7250.124,-5840.846,12.518942,0,0,0,0,100,0),
(@PATH,10,7246.8257,-5860.666,13.454,0,0,0,0,100,0),
(@PATH,11,7243.721,-5881.558,14.279851,0,0,0,0,100,0),
(@PATH,12,7231.0835,-5910.859,16.342487,0,0,0,0,100,0),
(@PATH,13,7235.9644,-5929.9536,17.837418,0,0,0,0,100,0),
(@PATH,14,7244.8364,-5947.1313,17.660414,0,0,0,0,100,0),
(@PATH,15,7245.572,-5973.7646,18.905668,0,0,0,0,100,0),
(@PATH,16,7241.577,-6000.3286,17.92609,0,0,0,0,100,0),
(@PATH,17,7252.286,-6013.513,19.168766,0,0,0,0,100,0),
(@PATH,18,7275.27,-6007.8994,19.334187,0,0,0,0,100,0),
(@PATH,19,7321.434,-6002.094,16.63307,0,0,0,0,100,0),
(@PATH,20,7339.5063,-5990.318,14.004128,0,0,0,0,100,0),
(@PATH,21,7359.104,-5973.0034,13.183084,0,0,0,0,100,0);

-- Pathing for Stonewing Slayer Entry: 16324
SET @NPC := 82486;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7315.0767,-5868.1777,36.547043,0,0,0,0,100,0),
(@PATH,2,7301.9976,-5870.645,36.54644,0,0,0,0,100,0),
(@PATH,3,7288.1606,-5864.154,36.543846,0,0,0,0,100,0),
(@PATH,4,7282.268,-5851.51,36.557365,0,0,0,0,100,0),
(@PATH,5,7281.4414,-5836.441,36.549744,0,0,0,0,100,0),
(@PATH,6,7291.971,-5824.3047,36.557346,0,0,0,0,100,0),
(@PATH,7,7310.848,-5821.8857,36.54849,0,0,0,0,100,0),
(@PATH,8,7318.971,-5816.202,36.552242,0,0,0,0,100,0),
(@PATH,9,7306.3896,-5810.4683,34.559734,0,0,0,0,100,0),
(@PATH,10,7295.1226,-5809.596,30.666824,0,0,0,0,100,0),
(@PATH,11,7287.444,-5814.809,28.18847,0,0,0,0,100,0),
(@PATH,12,7277.1104,-5831.7266,25.918013,0,0,0,0,100,0),
(@PATH,13,7302.4185,-5844.3457,25.829445,0,0,0,0,100,0),
(@PATH,14,7319.901,-5854.153,23.80343,0,0,0,0,100,0),
(@PATH,15,7315.646,-5863.9194,20.86582,0,0,0,0,100,0),
(@PATH,16,7308.54,-5866.2256,17.65228,0,0,0,0,100,0),
(@PATH,17,7298.4053,-5865.24,15.879758,0,0,0,0,100,0),
(@PATH,18,7286.711,-5878.5674,13.539035,0,0,0,0,100,0),
(@PATH,19,7292.5493,-5901.6357,14.222242,0,0,0,0,100,0),
(@PATH,20,7296.4053,-5916.968,15.009474,0,0,0,0,100,0),
(@PATH,21,7286.152,-5954.9307,15.797743,0,0,0,0,100,0),
(@PATH,22,7285.6787,-5966.9653,15.653902,0,0,0,0,100,0),
(@PATH,23,7265.091,-5973.717,17.20413,0,0,0,0,100,0),
(@PATH,24,7242.941,-5966.4736,18.351698,0,0,0,0,100,0),
(@PATH,25,7213.16,-5979.4097,21.184593,0,0,0,0,100,0),
(@PATH,26,7192.21,-5985.093,29.156004,0,0,0,0,100,0),
(@PATH,27,7183.501,-5981.842,32.192154,0,0,0,0,100,0),
(@PATH,28,7178.2866,-5974.3105,35.505596,0,0,0,0,100,0),
(@PATH,29,7183.501,-5981.842,32.192154,0,0,0,0,100,0),
(@PATH,30,7192.21,-5985.093,29.156004,0,0,0,0,100,0),
(@PATH,31,7213.16,-5979.4097,21.184593,0,0,0,0,100,0),
(@PATH,32,7242.941,-5966.4736,18.351698,0,0,0,0,100,0),
(@PATH,33,7265.091,-5973.717,17.20413,0,0,0,0,100,0),
(@PATH,34,7285.6787,-5966.9653,15.653902,0,0,0,0,100,0),
(@PATH,35,7286.152,-5954.9307,15.797743,0,0,0,0,100,0),
(@PATH,36,7296.4053,-5916.968,15.009474,0,0,0,0,100,0),
(@PATH,37,7292.5493,-5901.6357,14.222242,0,0,0,0,100,0),
(@PATH,38,7286.711,-5878.5674,13.539035,0,0,0,0,100,0),
(@PATH,39,7298.4053,-5865.24,15.879758,0,0,0,0,100,0),
(@PATH,40,7308.54,-5866.2256,17.65228,0,0,0,0,100,0),
(@PATH,41,7315.646,-5863.9194,20.86582,0,0,0,0,100,0),
(@PATH,42,7319.901,-5854.153,23.80343,0,0,0,0,100,0),
(@PATH,43,7302.4185,-5844.3457,25.829445,0,0,0,0,100,0),
(@PATH,44,7277.1104,-5831.7266,25.918013,0,0,0,0,100,0),
(@PATH,45,7287.444,-5814.809,28.18847,0,0,0,0,100,0),
(@PATH,46,7295.1226,-5809.596,30.666824,0,0,0,0,100,0),
(@PATH,47,7306.3794,-5810.4673,34.55706,0,0,0,0,100,0),
(@PATH,48,7318.971,-5816.202,36.552242,0,0,0,0,100,0),
(@PATH,49,7310.848,-5821.8857,36.54849,0,0,0,0,100,0),
(@PATH,50,7291.971,-5824.3047,36.557346,0,0,0,0,100,0),
(@PATH,51,7281.4414,-5836.441,36.549744,0,0,0,0,100,0),
(@PATH,52,7282.268,-5851.51,36.557365,0,0,0,0,100,0),
(@PATH,53,7288.1606,-5864.154,36.543846,0,0,0,0,100,0),
(@PATH,54,7301.9976,-5870.645,36.54644,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2021_12_19_04' WHERE sql_rev = '1639784010825845091';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
