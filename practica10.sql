-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema practica10
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `practica10` ;

-- -----------------------------------------------------
-- Schema practica10
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `practica10` ;
USE `practica10` ;

-- -----------------------------------------------------
-- Table `practica10`.`categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categorias` ;

CREATE TABLE IF NOT EXISTS `categorias` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `practica10`.`provedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `provedor` ;

CREATE TABLE IF NOT EXISTS `provedor` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `categorias_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_provedor_categorias1_idx` (`categorias_codigo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

insert into provedor(codigo,nombre,direccion,ciudad,provincia)
values(4,"juan","texcoco","texcococ","texcoco");
-- -----------------------------------------------------
-- Table `practica10`.`piezas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `piezas` ;

CREATE TABLE IF NOT EXISTS `piezas` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `categorias_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_piezas_categorias1_idx` (`categorias_codigo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

insert into piezas(codigo,nombre,color,precio)
values(6,"martillo","negro","80.00");

-- -----------------------------------------------------
-- Table `practica10`.`suministra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `suministra` ;

CREATE TABLE IF NOT EXISTS `suministra` (
  `provedor_codigo` INT NOT NULL,
  `piezas_codigo` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`provedor_codigo`, `piezas_codigo`),
  INDEX `fk_provedor_has_piezas_piezas1_idx` (`piezas_codigo` ASC) VISIBLE,
  INDEX `fk_provedor_has_piezas_provedor_idx` (`provedor_codigo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
select*from suministra;
select *from suministra where cantidad;