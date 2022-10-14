 create database practica8;
 use practica8;
create table alumnos(
id int (1) primary key,
nombre varchar(50)not null,
apellido_paterno varchar(50) not null,
apellido_materno varchar(50)not null,
nota  int (0));

insert into alumnos (id,nombre,apellido_paterno,apellido_materno,nota)
values (5,"juan","martinez","salvador",5);
insert into alumnos (id,nombre,apellido_paterno,apellido_materno,nota)
values (9,"pepe","gomez","diaz",8);
insert into  alumnos (id,nombre,apellido_paterno,apellido_materno,nota)
values (6,"jose","perez","dominic",12);


DELIMITER $$
CREATE TRIGGER alumnos_check_nota_bi BEFORE INSERT ON alumnos
FOR EACH ROW
begin
 if new.nota <0 then
 set new.nota=0;
 end if;
 if new.nota>10 then
 set new.nota=10;
 end if;
 end;$$
 -- para verificar este use el select from en otra pesataña para que no tengan problemas y se compruebe como se debe


 
 DELIMITER $$
CREATE TRIGGER alumnos_check_bu BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
if new.nota<0 then
set new.nota=0;
end if;
if new.nota>10 then
set new.nota=10;
end if;
end;$$
-- recuerdda los select deben de tener su propio punto azul
 select*from alumnos;
-- recuerda para actualizar no lleva from 
 UPDATE alumnos SET nota=9 WHERE id=5;
update alumnos set nota=7 where id=9;