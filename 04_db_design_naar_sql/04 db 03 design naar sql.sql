-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gameraccount` ;

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameraccount` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dbfirst` ;

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `gameraccount` ;

-- -----------------------------------------------------
-- Table `gameraccount`.`gamer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`gamer` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`gamer` (
  `idgamer` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `usertag` VARCHAR(45) NULL,
  PRIMARY KEY (`idgamer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`game` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`game` (
  `idgame` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `company` VARCHAR(45) NOT NULL,
  `gamer_idgamer` INT NOT NULL,
  PRIMARY KEY (`idgame`),
  INDEX `fk_game_gamer_idx` (`gamer_idgamer` ASC) VISIBLE,
  CONSTRAINT `fk_game_gamer`
    FOREIGN KEY (`gamer_idgamer`)
    REFERENCES `gameraccount`.`gamer` (`idgamer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`achievements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`achievements` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`achievements` (
  `idachievements` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `game_idgame` INT NOT NULL,
  PRIMARY KEY (`idachievements`, `game_idgame`),
  INDEX `fk_achievements_game1_idx` (`game_idgame` ASC) VISIBLE,
  CONSTRAINT `fk_achievements_game1`
    FOREIGN KEY (`game_idgame`)
    REFERENCES `gameraccount`.`game` (`idgame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`artist` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`artist` (
  `idartist` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `genre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idartist`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`playlist` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`playlist` (
  `idplaylist` INT NOT NULL,
  `creator` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idplaylist`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`song` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`song` (
  `idsong` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `duration` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idsong`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
