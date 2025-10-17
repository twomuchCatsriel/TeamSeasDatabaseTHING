-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TeamSeas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TeamSeas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TeamSeas` DEFAULT CHARACTER SET utf8 ;
USE `TeamSeas` ;

-- -----------------------------------------------------
-- Table `TeamSeas`.`Volunteer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TeamSeas`.`Volunteer` ;

CREATE TABLE IF NOT EXISTS `TeamSeas`.`Volunteer` (
  `idVolunteer` INT NOT NULL AUTO_INCREMENT,
  `FirstName` TEXT NULL,
  `LastName` TEXT NULL,
  `Address` TEXT NULL,
  PRIMARY KEY (`idVolunteer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeamSeas`.`Arrangements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TeamSeas`.`Arrangements` ;

CREATE TABLE IF NOT EXISTS `TeamSeas`.`Arrangements` (
  `idArrangements` INT NOT NULL AUTO_INCREMENT,
  `ArrangementLocation` TEXT NULL,
  `ArrangementDate` DATE NULL,
  `ArrangementImageURL` TEXT NULL,
  PRIMARY KEY (`idArrangements`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeamSeas`.`Volunteer_Info_has_Arrangements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TeamSeas`.`Volunteer_Info_has_Arrangements` ;

CREATE TABLE IF NOT EXISTS `TeamSeas`.`Volunteer_Info_has_Arrangements` (
  `VolunteerID` INT NOT NULL,
  `ArrangementID` INT NOT NULL,
  PRIMARY KEY (`VolunteerID`, `ArrangementID`),
  INDEX `fk_Volunteer_Info_has_Arrangements_Arrangements1_idx` (`ArrangementID` ASC) VISIBLE,
  INDEX `fk_Volunteer_Info_has_Arrangements_Volunteer_Info1_idx` (`VolunteerID` ASC) VISIBLE,
  CONSTRAINT `fk_Volunteer_Info_has_Arrangements_Volunteer_Info1`
    FOREIGN KEY (`VolunteerID`)
    REFERENCES `TeamSeas`.`Volunteer` (`idVolunteer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Volunteer_Info_has_Arrangements_Arrangements1`
    FOREIGN KEY (`ArrangementID`)
    REFERENCES `TeamSeas`.`Arrangements` (`idArrangements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '			';


-- -----------------------------------------------------
-- Table `TeamSeas`.`LoginInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TeamSeas`.`LoginInfo` ;

CREATE TABLE IF NOT EXISTS `TeamSeas`.`LoginInfo` (
  `Username` TEXT NULL,
  `PasswordHash` TEXT NULL,
  `Volunteer_idVolunteer` INT NOT NULL,
  INDEX `fk_LoginInfo_Volunteer1_idx` (`Volunteer_idVolunteer` ASC) VISIBLE,
  PRIMARY KEY (`Volunteer_idVolunteer`),
  CONSTRAINT `fk_LoginInfo_Volunteer1`
    FOREIGN KEY (`Volunteer_idVolunteer`)
    REFERENCES `TeamSeas`.`Volunteer` (`idVolunteer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `TeamSeas`.`Volunteer`
-- -----------------------------------------------------
START TRANSACTION;
USE `TeamSeas`;
INSERT INTO `TeamSeas`.`Volunteer` (`idVolunteer`, `FirstName`, `LastName`, `Address`) VALUES (DEFAULT, 'Sebastian', 'Solace', 'Valsvigveien 105');
INSERT INTO `TeamSeas`.`Volunteer` (`idVolunteer`, `FirstName`, `LastName`, `Address`) VALUES (DEFAULT, 'Mori M.', 'Morison', 'Blålyngveien 208');
INSERT INTO `TeamSeas`.`Volunteer` (`idVolunteer`, `FirstName`, `LastName`, `Address`) VALUES (DEFAULT, 'William J.', 'Afton', 'Festningsveien 65');
INSERT INTO `TeamSeas`.`Volunteer` (`idVolunteer`, `FirstName`, `LastName`, `Address`) VALUES (DEFAULT, 'Fern', 'Baxxter-Hall', 'Møllesvingen 249');
INSERT INTO `TeamSeas`.`Volunteer` (`idVolunteer`, `FirstName`, `LastName`, `Address`) VALUES (DEFAULT, 'Kirsten', 'Reed', 'Nordåsveien 150');
INSERT INTO `TeamSeas`.`Volunteer` (`idVolunteer`, `FirstName`, `LastName`, `Address`) VALUES (DEFAULT, 'Isela', 'Cohen', 'Bakeribakken 156');
INSERT INTO `TeamSeas`.`Volunteer` (`idVolunteer`, `FirstName`, `LastName`, `Address`) VALUES (DEFAULT, 'Sequoia', 'Torres', 'Bakeribakken 156');
INSERT INTO `TeamSeas`.`Volunteer` (`idVolunteer`, `FirstName`, `LastName`, `Address`) VALUES (DEFAULT, 'Ren', 'Hewitt', 'Saxegårdsveien 241');

COMMIT;


-- -----------------------------------------------------
-- Data for table `TeamSeas`.`Arrangements`
-- -----------------------------------------------------
START TRANSACTION;
USE `TeamSeas`;
INSERT INTO `TeamSeas`.`Arrangements` (`idArrangements`, `ArrangementLocation`, `ArrangementDate`, `ArrangementImageURL`) VALUES (DEFAULT, 'Koigen, Hamar', '2025-10-20', 'https://github.com/twomuchCatsriel/TeamSeasReact/blob/main/GoTeamSeas/public/HamarStrand.png');
INSERT INTO `TeamSeas`.`Arrangements` (`idArrangements`, `ArrangementLocation`, `ArrangementDate`, `ArrangementImageURL`) VALUES (DEFAULT, 'Mjellestranda, Bodø', '2025-11-05', 'https://v.imgi.no/visitbodo-383-28f3f8aedc6696fb822e68e6f62bd2d6-1100x619/2022_04_mjelle.jpg');
INSERT INTO `TeamSeas`.`Arrangements` (`idArrangements`, `ArrangementLocation`, `ArrangementDate`, `ArrangementImageURL`) VALUES (DEFAULT, 'Orrestranda, Jæren', '2025-12-28', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Orrestranda_Klepp_in_Norway.JPG/1200px-Orrestranda_Klepp_in_Norway.JPG');
INSERT INTO `TeamSeas`.`Arrangements` (`idArrangements`, `ArrangementLocation`, `ArrangementDate`, `ArrangementImageURL`) VALUES (DEFAULT, 'Operastranda, Oslo', '2026-01-03', 'https://assets.simpleviewcms.com/simpleview/image/fetch/c_limit,h_1200,q_75,w_1200/https://media.newmindmedia.com/TellUs/image/%3Ffile%3Doperastranda-mot-langkaia_793272881.jpg%26dh%3D600%26dw%3D800%26cropX%3D0%26cropY%3D37%26cropH%3D629%26cropW%3D839%26t%3D4');
INSERT INTO `TeamSeas`.`Arrangements` (`idArrangements`, `ArrangementLocation`, `ArrangementDate`, `ArrangementImageURL`) VALUES (DEFAULT, 'Solastranden, Stavanger', '2026-02-09', 'https://upload.wikimedia.org/wikipedia/commons/c/cb/Solastrandennew.jpg');
INSERT INTO `TeamSeas`.`Arrangements` (`idArrangements`, `ArrangementLocation`, `ArrangementDate`, `ArrangementImageURL`) VALUES (DEFAULT, 'Hadal Blacksite, Let Vand Zone', '2025-10-14', 'https://static.wikia.nocookie.net/pressure/images/7/75/ErmWhatsTheSigma.png/revision/latest/scale-to-width-down/1200?cb=20241012173132');

COMMIT;


-- -----------------------------------------------------
-- Data for table `TeamSeas`.`Volunteer_Info_has_Arrangements`
-- -----------------------------------------------------
START TRANSACTION;
USE `TeamSeas`;
INSERT INTO `TeamSeas`.`Volunteer_Info_has_Arrangements` (`VolunteerID`, `ArrangementID`) VALUES (1, 3);
INSERT INTO `TeamSeas`.`Volunteer_Info_has_Arrangements` (`VolunteerID`, `ArrangementID`) VALUES (2, 5);
INSERT INTO `TeamSeas`.`Volunteer_Info_has_Arrangements` (`VolunteerID`, `ArrangementID`) VALUES (1, 4);
INSERT INTO `TeamSeas`.`Volunteer_Info_has_Arrangements` (`VolunteerID`, `ArrangementID`) VALUES (1, 2);
INSERT INTO `TeamSeas`.`Volunteer_Info_has_Arrangements` (`VolunteerID`, `ArrangementID`) VALUES (4, 2);
INSERT INTO `TeamSeas`.`Volunteer_Info_has_Arrangements` (`VolunteerID`, `ArrangementID`) VALUES (7, 1);
INSERT INTO `TeamSeas`.`Volunteer_Info_has_Arrangements` (`VolunteerID`, `ArrangementID`) VALUES (3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `TeamSeas`.`LoginInfo`
-- -----------------------------------------------------
START TRANSACTION;
USE `TeamSeas`;
INSERT INTO `TeamSeas`.`LoginInfo` (`Username`, `PasswordHash`, `Volunteer_idVolunteer`) VALUES ('HandsomeFishWife', '33f2d6c98a9228ccc3ca9f064f7221a2', 1);
INSERT INTO `TeamSeas`.`LoginInfo` (`Username`, `PasswordHash`, `Volunteer_idVolunteer`) VALUES ('Mlem_Mem', 'ce8f4b0cd9194afdb367fa3453831e42', 2);
INSERT INTO `TeamSeas`.`LoginInfo` (`Username`, `PasswordHash`, `Volunteer_idVolunteer`) VALUES ('NotAChildKiller', '2eba4e43c1e06434f58376d42378f40c', 3);
INSERT INTO `TeamSeas`.`LoginInfo` (`Username`, `PasswordHash`, `Volunteer_idVolunteer`) VALUES ('FernWashere', 'a4c12c5b54384890651d25607fb1dec4', 4);
INSERT INTO `TeamSeas`.`LoginInfo` (`Username`, `PasswordHash`, `Volunteer_idVolunteer`) VALUES ('CantbeFound', '2ca790eaf60f49f128b0e1bfe0f0d77c', 5);
INSERT INTO `TeamSeas`.`LoginInfo` (`Username`, `PasswordHash`, `Volunteer_idVolunteer`) VALUES ('MusketeerShots', '31e07e363b3c9649a1b52834b9bf37f4', 6);
INSERT INTO `TeamSeas`.`LoginInfo` (`Username`, `PasswordHash`, `Volunteer_idVolunteer`) VALUES ('NOTEXPENDABLE', 'a468326dc31c59a00cedfeee8ff69b5d', 7);
INSERT INTO `TeamSeas`.`LoginInfo` (`Username`, `PasswordHash`, `Volunteer_idVolunteer`) VALUES ('YeslLongerNull', '3642f12444fa2eacd82f7592e47c3187', 8);

COMMIT;

