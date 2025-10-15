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
CREATE TABLE IF NOT EXISTS `TeamSeas`.`Arrangements` (
  `idArrangements` INT NOT NULL AUTO_INCREMENT,
  `ArrangementLocation` TEXT NULL,
  `ArrangementDate` DATE NULL,
  PRIMARY KEY (`idArrangements`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TeamSeas`.`Volunteer_Info_has_Arrangements`
-- -----------------------------------------------------
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
