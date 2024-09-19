-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema flores
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `flores` ;

-- -----------------------------------------------------
-- Schema flores
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flores` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `flores` ;

-- -----------------------------------------------------
-- Table `flores`.`color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flores`.`color` ;

CREATE TABLE IF NOT EXISTS `flores`.`color` (
  `idcolor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcolor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flores`.`ocasion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flores`.`ocasion` ;

CREATE TABLE IF NOT EXISTS `flores`.`ocasion` (
  `idcolor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcolor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flores`.`tipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flores`.`tipo` ;

CREATE TABLE IF NOT EXISTS `flores`.`tipo` (
  `idtipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flores`.`flores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flores`.`flores` ;

CREATE TABLE IF NOT EXISTS `flores`.`flores` (
  `idflores` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `ocasion` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `precio` DECIMAL NULL,
  `color_idcolor` INT NOT NULL,
  `ocasion_idcolor` INT NOT NULL,
  `tipo_idtipo` INT NOT NULL,
  PRIMARY KEY (`idflores`, `color_idcolor`, `ocasion_idcolor`, `tipo_idtipo`),
  INDEX `fk_flores_color_idx` (`color_idcolor` ASC) VISIBLE,
  INDEX `fk_flores_ocasion1_idx` (`ocasion_idcolor` ASC) VISIBLE,
  INDEX `fk_flores_tipo1_idx` (`tipo_idtipo` ASC) VISIBLE,
  CONSTRAINT `fk_flores_color`
    FOREIGN KEY (`color_idcolor`)
    REFERENCES `flores`.`color` (`idcolor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flores_ocasion1`
    FOREIGN KEY (`ocasion_idcolor`)
    REFERENCES `flores`.`ocasion` (`idcolor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flores_tipo1`
    FOREIGN KEY (`tipo_idtipo`)
    REFERENCES `flores`.`tipo` (`idtipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
