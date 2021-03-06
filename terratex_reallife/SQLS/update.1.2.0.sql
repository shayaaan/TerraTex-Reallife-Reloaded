ALTER TABLE user_gold ADD SkillBooster INT DEFAULT 0 NULL;

ALTER TABLE user ADD Gender VARCHAR(20) DEFAULT "anonym" NULL;

ALTER TABLE user_data ADD children VARCHAR(255) DEFAULT "{}" NULL;

CREATE TABLE `data_crimes_categories` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CategorieName` varchar(255) DEFAULT NULL,
  `Order` int(11) DEFAULT '50',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `data_crimes_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CategorieID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Percentage` int(11) DEFAULT '5',
  `MinPercentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `data_crimes_list_data_crimes_categories_ID_fk` (`CategorieID`),
  CONSTRAINT `data_crimes_list_data_crimes_categories_ID_fk` FOREIGN KEY (`CategorieID`) REFERENCES `data_crimes_categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE log_chat ENGINE=MyISAM;

CREATE TABLE `log_kills` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Attacker` varchar(255) DEFAULT NULL,
  `Target` varchar(255) DEFAULT NULL,
  `AttackerFaction` int(11) DEFAULT NULL,
  `TargetFaction` int(11) DEFAULT NULL,
  `BlacklistOrWantedkill` int(11) DEFAULT '0',
  `WeaponID` int(11) DEFAULT '0',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `user_crimes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nickname` varchar(255) DEFAULT NULL,
  `CrimeID` int(11) DEFAULT NULL,
  `CrimePercentage` int(11) DEFAULT NULL,
  `AdditionalReason` text,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `user_crimes_user_Nickname_fk` (`Nickname`),
  CONSTRAINT `user_crimes_user_Nickname_fk` FOREIGN KEY (`Nickname`) REFERENCES `user` (`Nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `data_crimes_categories` (`ID`, `CategorieName`, `Order`) VALUES(1000, 'Admincrimes', 1000);
INSERT INTO `data_crimes_list` (`ID`, `CategorieID`, `Name`, `Percentage`, `MinPercentage`) VALUES(1000, 1000, 'SDM', 50, 50);
INSERT INTO `data_crimes_list` (`ID`, `CategorieID`, `Name`, `Percentage`, `MinPercentage`) VALUES(1001, 1000, 'SDM - Extrem', 100, 100);

ALTER TABLE user_gold
ADD CONSTRAINT user_gold_user_Nickname_fk
FOREIGN KEY (Nickname) REFERENCES user (Nickname) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE user_achievements DROP Erfolg_Rubbellosgluck;
ALTER TABLE user_achievements DROP Erfolg_10erLos;

ALTER TABLE objects_houses_wishes DROP FOREIGN KEY objects_houses_wishes_ibfk_1;
ALTER TABLE objects_houses_wishes
ADD CONSTRAINT objects_houses_wishes_ibfk_1
FOREIGN KEY (Nickname) REFERENCES user (Nickname) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE user_vehicles ADD lastHealth FLOAT DEFAULT 1000 NULL;
ALTER TABLE user_vehicles ADD lastPosition VARCHAR(255) DEFAULT '[[0,0,0,0,0,0,0,0]]' NULL;
ALTER TABLE user_vehicles ADD lastDamageStates VARCHAR(512) DEFAULT '[[]]' NULL;

CREATE TABLE `log_lotto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Number1` int(11) DEFAULT NULL,
  `Number2` int(11) DEFAULT NULL,
  `Number3` int(11) DEFAULT NULL,
  `CorrectNumbers` int(11) DEFAULT 0,
  `Winnerlist` text,
  `winnerPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `log_tow_police` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Owner` varchar(255) DEFAULT NULL,
  `Officer` varchar(255) DEFAULT NULL,
  `CarSlot` int(11) DEFAULT NULL,
  `Reason` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `log_anonym` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `who` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `message` text,
  `factionFrom` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `log_car_deletes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Owner` varchar(255) DEFAULT NULL,
  `SlotId` int(11) DEFAULT NULL,
  `VehicleModel` int(11) DEFAULT NULL,
  `Reason` text,
  `DeletedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `log_car_deletes_user_Nickname_fk` (`Owner`),
  CONSTRAINT `log_car_deletes_user_Nickname_fk` FOREIGN KEY (`Owner`) REFERENCES `user` (`Nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE log_playermoney ADD AdditionalData TEXT DEFAULT null NULL;