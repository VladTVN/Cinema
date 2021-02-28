-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cinema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cinema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cinema` DEFAULT CHARACTER SET utf8 ;
USE `Cinema` ;

-- -----------------------------------------------------
-- Table `Cinema`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Role` (
  `RoleId` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RoleId`),
  UNIQUE INDEX `RoleId_UNIQUE` (`RoleId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Passowrd` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_User_Role_idx` (`Role` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role`
    FOREIGN KEY (`Role`)
    REFERENCES `Cinema`.`Role` (`RoleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`StatusPremises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`StatusPremises` (
  `Status` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Status`),
  UNIQUE INDEX `Status_UNIQUE` (`Status` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Country` (
  `idCountry` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCountry`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`Cinema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Cinema` (
  `idCinema` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NULL,
  `CreationDate` DATETIME NULL,
  `Status` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idCinema`),
  INDEX `fk_Cinema_StatusPremises1_idx` (`Status` ASC) VISIBLE,
  INDEX `fk_Cinema_Country1_idx` (`Country` ASC) VISIBLE,
  CONSTRAINT `fk_Cinema_StatusPremises1`
    FOREIGN KEY (`Status`)
    REFERENCES `Cinema`.`StatusPremises` (`Status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cinema_Country1`
    FOREIGN KEY (`Country`)
    REFERENCES `Cinema`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`StatusPresentation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`StatusPresentation` (
  `Status` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Status`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`Film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Film` (
  `idFilm` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Year` DATE NOT NULL,
  `Genre` VARCHAR(45) NOT NULL,
  `CountryOfOrigin` VARCHAR(45) NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  `Starring` VARCHAR(45) NOT NULL,
  `Budget` FLOAT NULL,
  `Duration` FLOAT NOT NULL,
  `Status` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idFilm`),
  INDEX `fk_Film_StatusPresentation1_idx` (`Status` ASC) VISIBLE,
  INDEX `fk_Film_Country1_idx` (`CountryOfOrigin` ASC) VISIBLE,
  CONSTRAINT `fk_Film_StatusPresentation1`
    FOREIGN KEY (`Status`)
    REFERENCES `Cinema`.`StatusPresentation` (`Status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_Country1`
    FOREIGN KEY (`CountryOfOrigin`)
    REFERENCES `Cinema`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`Hall`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Hall` (
  `idHall` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Floor` INT NOT NULL,
  `Rows` INT NOT NULL,
  `Seats` INT NOT NULL,
  `Status` VARCHAR(25) NOT NULL,
  `idCinema` INT NOT NULL,
  PRIMARY KEY (`idHall`),
  INDEX `fk_Hall_StatusPremises1_idx` (`Status` ASC) VISIBLE,
  INDEX `fk_Hall_Cinema1_idx` (`idCinema` ASC) VISIBLE,
  CONSTRAINT `fk_Hall_StatusPremises1`
    FOREIGN KEY (`Status`)
    REFERENCES `Cinema`.`StatusPremises` (`Status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hall_Cinema1`
    FOREIGN KEY (`idCinema`)
    REFERENCES `Cinema`.`Cinema` (`idCinema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`Show`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Show` (
  `idSession` INT NOT NULL AUTO_INCREMENT,
  `Number` INT NOT NULL,
  `Time` TIME NOT NULL,
  `Cost` FLOAT NOT NULL,
  `Status` VARCHAR(25) NOT NULL,
  `idFilm` INT NOT NULL,
  `idHall` INT NOT NULL,
  `idManager` INT NOT NULL,
  PRIMARY KEY (`idSession`),
  INDEX `fk_Show_StatusPresentation1_idx` (`Status` ASC) VISIBLE,
  INDEX `fk_Show_Film1_idx` (`idFilm` ASC) VISIBLE,
  INDEX `fk_Show_Hall1_idx` (`idHall` ASC) VISIBLE,
  INDEX `fk_Show_User1_idx` (`idManager` ASC) VISIBLE,
  UNIQUE INDEX `Number_UNIQUE` (`Number` ASC) VISIBLE,
  CONSTRAINT `fk_Show_StatusPresentation1`
    FOREIGN KEY (`Status`)
    REFERENCES `Cinema`.`StatusPresentation` (`Status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Show_Film1`
    FOREIGN KEY (`idFilm`)
    REFERENCES `Cinema`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Show_Hall1`
    FOREIGN KEY (`idHall`)
    REFERENCES `Cinema`.`Hall` (`idHall`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Show_User1`
    FOREIGN KEY (`idManager`)
    REFERENCES `Cinema`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Ticket` (
  `idTicket` INT NOT NULL AUTO_INCREMENT,
  `Seat` INT NOT NULL,
  `Row` INT NOT NULL,
  `idSession` INT NOT NULL,
  PRIMARY KEY (`idTicket`),
  INDEX `fk_Ticket_Show1_idx` (`idSession` ASC) VISIBLE,
  UNIQUE INDEX `Seat_UNIQUE` (`Seat` ASC) VISIBLE,
  UNIQUE INDEX `Row_UNIQUE` (`Row` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Show1`
    FOREIGN KEY (`idSession`)
    REFERENCES `Cinema`.`Show` (`idSession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Actor` (
  `idActor` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `Birthday` DATE NULL,
  PRIMARY KEY (`idActor`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  UNIQUE INDEX `Surname_UNIQUE` (`Surname` ASC) VISIBLE,
  UNIQUE INDEX `Birthday_UNIQUE` (`Birthday` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`Actor_has_Film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`Actor_has_Film` (
  `Actor_idActor` INT NOT NULL,
  `Film_idFilm` INT NOT NULL,
  PRIMARY KEY (`Actor_idActor`, `Film_idFilm`),
  INDEX `fk_Actor_has_Film_Film1_idx` (`Film_idFilm` ASC) VISIBLE,
  INDEX `fk_Actor_has_Film_Actor1_idx` (`Actor_idActor` ASC) VISIBLE,
  CONSTRAINT `fk_Actor_has_Film_Actor1`
    FOREIGN KEY (`Actor_idActor`)
    REFERENCES `Cinema`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actor_has_Film_Film1`
    FOREIGN KEY (`Film_idFilm`)
    REFERENCES `Cinema`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
