-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema PRACTICA6
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PRACTICA6` ;

-- -----------------------------------------------------
-- Schema PRACTICA6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PRACTICA6` ;
USE `PRACTICA6` ;

-- -----------------------------------------------------
-- Table `PRACTICA6`.`FABRICANTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRACTICA6`.`FABRICANTE` ;

CREATE TABLE IF NOT EXISTS `PRACTICA6`.`FABRICANTE` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `PRACTICA6`.`productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRACTICA6`.`productos` ;

CREATE TABLE IF NOT EXISTS `PRACTICA6`.`productos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `precio` DOUBLE UNSIGNED NOT NULL,
  `FABRICANTE_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_productos_FABRICANTE_idx` (`FABRICANTE_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_productos_FABRICANTE`
    FOREIGN KEY (`FABRICANTE_codigo`)
    REFERENCES `PRACTICA6`.`FABRICANTE` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

describe table fabricante;
insert into fabricante (idcodigo.nombre) values (null,"sony");
insert into fabricante (idcodigo.nombre) values ("windos");
insert into fabricante (idcodigo.nombre)values ("pepsi");
insert into fabricante (idcodigo.nombre) values ("hawei");
insert into fabricante (idcodigo.nombre)  values ("xiaomi");
insert into fabricante (idcodigo.nombre)  values ("lenovo");
insert into fabricante (idcodigo.nombre) values ("adidas");
insert into fabricante (idcodigo.nombre)  values ("android");
insert into fabricante (idcodigo.nombre) values ("capcom");
