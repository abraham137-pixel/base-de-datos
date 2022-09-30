-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mercado
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mercado` ;

-- -----------------------------------------------------
-- Schema mercado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mercado` ;
USE `mercado` ;

-- -----------------------------------------------------
-- Table `mercado`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mercado`.`cliente` ;

CREATE TABLE IF NOT EXISTS `mercado`.`cliente` (
  `cedula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `mercado`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mercado`.`producto` ;

CREATE TABLE IF NOT EXISTS `mercado`.`producto` (
  `codigo` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio_unitario` FLOAT NOT NULL,
  `unidad_de_venta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `mercado`.`factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mercado`.`factura` ;

CREATE TABLE IF NOT EXISTS `mercado`.`factura` (
  `numero_de_factura` INT NOT NULL AUTO_INCREMENT,
  `cliente_cedula` INT NOT NULL,
  `producto_codigo` INT NOT NULL,
  `metodo de pago` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  INDEX `fk_cliente_has_producto_producto1_idx` (`producto_codigo` ASC) VISIBLE,
  INDEX `fk_cliente_has_producto_cliente_idx` (`cliente_cedula` ASC) VISIBLE,
  PRIMARY KEY (`numero_de_factura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `mercado`.`formas_de_pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mercado`.`formas_de_pago` ;

CREATE TABLE IF NOT EXISTS `mercado`.`formas_de_pago` (
  `tarjeta_de_credito` FLOAT NOT NULL,
  `tarjeta_de_debito` FLOAT NOT NULL,
  `efectivo` FLOAT NOT NULL,
  `trasferencia` FLOAT NOT NULL,
  `factura_numero_de_factura` INT NOT NULL,
  INDEX `fk_formas_de_pago_factura1_idx` (`factura_numero_de_factura` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
