create database Diego_database
go

use Diego_database
go

create table sucursal(
id_sucursal int primary key,
sucursal varchar(30))

create table genero(
id_genero int primary key,
genero varchar(30))

create table cliente(
id varchar(100),
id_genero int references genero(id_genero),
ingresos varchar (100),
promovisit varchar (100),
edad int,
sauna int,
masaje int,
hidro int,
yoga int,
id_sucursal int references sucursal(id_sucursal))

insert into genero (id_genero, genero) values (0, 'Masculino') 
insert into genero (id_genero, genero) values (1, 'Femenino')

insert into sucursal (id_sucursal, sucursal) values (1,'Spa Centro')
insert into sucursal (id_sucursal, sucursal) values (2,'Spa Escalon')
insert into sucursal (id_sucursal, sucursal) values (3,'Spa Santa Tecla')

Select * from genero
select * from sucursal
select* from cliente

--Numero de personas por rango de edad
select s.sucursal,COUNT(id) as 'Numero de personas mayores de 30 años por sucursal' from cliente c inner join sucursal s on c.id_sucursal = s.id_sucursal where edad > 30 group by s.sucursal
select s.sucursal,COUNT(id) as 'Numero de personas menores de 30 años por sucursal' from cliente c inner join sucursal s on c.id_sucursal = s.id_sucursal where edad < 30 group by s.sucursal

--Cantidad de personas por genero
select g.genero, COUNT(masaje) as 'Cantidad de mujeres que usan los masajes' from cliente c inner join genero g on c.id_genero= g.id_genero where c.id_genero =1 group by g.genero
select g.genero, COUNT(sauna) as 'Cantidad de hombres que usan el sauna' from cliente c inner join genero g on c.id_genero= g.id_genero where c.id_genero =0 group by g.genero
select s.sucursal, COUNT(sauna) as 'Cantidad de hombres que usan el sauna en la sucursal Spa Centro' from cliente c inner join sucursal s on c.id_sucursal = s.id_sucursal where c.id_sucursal = 1 group by s.sucursal
select g.genero, count(c.id_sucursal)'Cantidad de mujeres y hombre en la sucursal Spa Centro' from cliente c inner join genero g on c.id_genero = g.id_genero where c.id_sucursal = 1 group by g.genero
select g.genero, count(c.id_sucursal)'Cantidad de mujeres y hombre en la sucursal Spa Escalon' from cliente c inner join genero g on c.id_genero = g.id_genero where c.id_sucursal = 2 group by g.genero
select g.genero, count(c.id_sucursal)'Cantidad de mujeres y hombre en la sucursal Spa Santa Tecla' from cliente c inner join genero g on c.id_genero = g.id_genero where c.id_sucursal = 3 group by g.genero
select g.genero, count(c.id_genero) 'Cantidad de mujeres y hombres por las tres sucursales' from cliente c inner join genero g on c.id_genero = g.id_genero  group by g.genero

--Cantidad de personas por sucursal o por servicio
select count(id) as 'Cantidad de clientes que usan el sauna' from cliente where sauna = 1 
select s.sucursal,count(id) as 'Cantidad de personas con más de 10 visitas por sucursal' from cliente c inner join sucursal s on c.id_sucursal = s.id_sucursal  where promovisit > '10' group by s.sucursal
select s.sucursal,count(id) as 'Cantidad de personas con menos de 10 visitas por sucursal' from cliente c inner join sucursal s on c.id_sucursal = s.id_sucursal  where promovisit < '10' group by s.sucursal
