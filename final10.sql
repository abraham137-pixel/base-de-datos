 create database final10;
 use final10;

create table provedores(
codigo int(8)primary key,
nombre varchar(50) not null,
ciudad varchar(50) not null,
provincia varchar(50) not null,
direccion varchar(50) not null);

insert into provedores( codigo,nombre,ciudad,provincia,direccion)
values (01,"juan","nose","talvez","masedonia");

create table piezas(
codigo int(5) primary key,
nombre varchar(50) not null,
color varchar(50) not null,
precio double not null);

insert into provedores( codigo,nombre,color,precio)
values (9,"martillo","rojo","50");

create table categoria(
codigo int(4) primary key,
nombre varchar(50) not null,
foreign key(`piezas_codigo`)
references`final`.`piezas`(`codigo`),
foreign key(`provedores_codigo`)
references`final`.`provedores`(`codigo`));

