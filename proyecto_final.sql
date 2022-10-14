create database proyecto_final;
use proyecto_final;
create table provedores(
codigo int(4)primary key,
nombre varchar(50) not null,
ciudad varchar(50) not null,
provincia varchar(50) not null,
direccion  varchar (50)); 

insert into provedores(codigo,nombre,ciudad,provincia,direccion)
values(3,"migel","barcelona","federico","segunda calle ala izquierda");

create table piezas(
codigo int(8)primary key,
color varchar(50),
precio float,






