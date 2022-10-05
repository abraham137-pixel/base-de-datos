-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema practica6otravez
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `practica6otravez` ;

-- -----------------------------------------------------
-- Schema practica6otravez
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `practica6otravez` ;
USE `practica6otravez` ;

-- -----------------------------------------------------
-- Table `practica6otravez`.`fabricante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `practica6otravez`.`fabricante` ;

CREATE TABLE IF NOT EXISTS `practica6otravez`.`fabricante` (
  `idcodigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idcodigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `practica6otravez`.`productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `practica6otravez`.`productos` ;

CREATE TABLE IF NOT EXISTS `practica6otravez`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `precio` DOUBLE UNSIGNED NOT NULL,
  `fabricante_idcodigo` INT NOT NULL,
  PRIMARY KEY (`idproductos`),
  INDEX `fk_productos_fabricante_idx` (`fabricante_idcodigo` ASC) VISIBLE,
  CONSTRAINT `fk_productos_fabricante`
    FOREIGN KEY (`fabricante_idcodigo`)
    REFERENCES `practica6otravez`.`fabricante` (`idcodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
