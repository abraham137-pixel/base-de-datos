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

DELIMITER $$
CREATE TRIGGER alumnos_check_nota_bi BEFORE INSERT ON alumnos
FOR EACH ROW
begin
 if new.nota <-10 then
 set new.nota=0;
 end if;
 if new.nota<10 then
 set new.nota=10;
 end if;
 end;$$
 
 select* from alumnos
 
 DELIMITER $$
CREATE TRIGGER alumnos_check_bu BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
if new.nota<-10 then
set new.nota=0;
end if;
if new.nota<10 then
set new.nota=10;
end if;
end;$$
 