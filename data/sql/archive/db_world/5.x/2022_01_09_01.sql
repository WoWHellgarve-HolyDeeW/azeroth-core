-- DB update 2022_01_09_00 -> 2022_01_09_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2022_01_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2022_01_09_00 2022_01_09_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1641574598839293356'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1641574598839293356');

-- remove ctm for creatures dalaran visitor (two fo them) by default they are just walkers but smart ai set them as runnings
-- this corrects the issue of them flying when they land in dalaran
DELETE FROM `creature_template_movement` WHERE  `CreatureID` IN (32596, 32597);

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2022_01_09_01' WHERE sql_rev = '1641574598839293356';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
