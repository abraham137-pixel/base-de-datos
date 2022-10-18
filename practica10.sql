
DROP SCHEMA IF EXISTS `practica10` ;


CREATE SCHEMA IF NOT EXISTS `practica10` ;
USE `practica10` ;


--  el ombre es para saber de que categoria es cada pieza
CREATE TABLE  categorias (
  codigo INT (5) primary key,
  nombre VARCHAR(45) NOT NULL);


CREATE TABLE  provedor (
  codigo INT (8) primary key,
  nombre VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  ciudad VARCHAR(45) NOT NULL,
  provincia VARCHAR(45) NOT NULL,
  categorias_codigo INT NOT NULL);


CREATE TABLE  piezas (
  codigo INT (4) primary key,
  nombre VARCHAR(45) NOT NULL,
  color VARCHAR(45) NOT NULL,
  precio DOUBLE NOT NULL,
  categorias_codigo INT NOT NULL);
  



CREATE TABLE  suministra (
  provedor_codigo INT NOT NULL,
  piezas_codigo INT NOT NULL,
  fecha DATETIME NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (provedor_codigo, piezas_codigo));
  

-- insert into provedor(codigo,nombre,direccion,ciudad,provincia)
 -- values(4,"juan","texcoco","texcococ","texcoco");

-- insert into piezas(codigo,nombre,color,precio)
 -- values(6,"martillo","negro","80.00");
