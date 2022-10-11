-- -----------------------------------------------------
-- Schema PRACTICA6
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PRACTICA6` ;
CREATE SCHEMA IF NOT EXISTS `PRACTICA6` ;
USE `PRACTICA6` ;

-- -----------------------------------------------------
-- Table `PRACTICA6`.`FABRICANTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRACTICA6`.`FABRICANTE` ;

CREATE TABLE IF NOT EXISTS `PRACTICA6`.`FABRICANTE` (
  `codigo` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL UNIQUE);


-- -----------------------------------------------------
-- Table `PRACTICA6`.`productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRACTICA6`.`productos` ;

CREATE TABLE IF NOT EXISTS `PRACTICA6`.`productos` (
  `codigo` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL UNIQUE,
  `precio` DOUBLE UNSIGNED NOT NULL,
  `FABRICANTE_codigo` INT,
  CONSTRAINT `fk_productos_FABRICANTE`
    FOREIGN KEY (`FABRICANTE_codigo`)
    REFERENCES `PRACTICA6`.`FABRICANTE` (`codigo`));


-- aqui se ven los valores para la tabla de fabricante
describe table fabricante;
-- y aqui insertamos los valores para la tabla 
insert into fabricante (codigo,nombre) values (null,"asus");
insert into fabricante (codigo, nombre) values (null,"lenovo");
insert into fabricante (codigo, nombre)values (null,"hewlett-pack");
insert into fabricante (codigo, nombre) values (null,"samsug");
insert into fabricante (codigo, nombre)  values (null,"seagate");
insert into fabricante (codigo, nombre)  values (null,"crucial");
insert into fabricante (codigo, nombre) values (null,"gygabite");
insert into fabricante (codigo, nombre)  values (null,"huawei");
insert into fabricante (codigo, nombre) values (null,"xiaomi");
-- se ven los valores que lleva esta tabla
describe table productos;
-- insertamos los valores para la tabla
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"discodurosat3itb",89.99,5);
insert into productos (codigo,nombre,precio,fabricante_codigo) values (null,"memoriaramddr48gb",120,6);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"discossd1tb",150.99,4);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"geforcegtx105ti",185,7);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"geforcegt1080xtreme",755,6);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"monitor24ledfullhd",202,1);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"monitor27ledfullhd",245.99,1);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"portatilyoga520",559,2);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"portatilideapd320",320,2);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"impresorahpdeskjt3720",59.99,3);
insert into productos (codigo,nombre,precio,fabricante_codigo) values(null,"impresorahplaseretjetprom26nw",180,3);

select * from productos;
select * from fabricante;