-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema auto
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `codigo_interno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `direcion` VARCHAR(45) NOT NULL,
  `numero_telefonico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_interno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`auto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`auto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`auto` (
  `matricula` VARCHAR(7) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  `cliente_codigo_interno` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_auto_cliente_idx` (`cliente_codigo_interno` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`revision`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`revision` ;

CREATE TABLE IF NOT EXISTS `mydb`.`revision` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `frenos` MULTIPOINT NOT NULL,
  `aceite` MULTIPOINT NOT NULL,
  `filtro` MULTIPOINT NOT NULL,
  `otros` MULTIPOINT NOT NULL,
  `auto_matricula` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_revision_auto1_idx` (`auto_matricula` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
