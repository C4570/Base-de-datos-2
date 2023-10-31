-- Ejercicio 2: CREACIÓN DE TABLAS
Create database Trabajo_practico
use Trabajo_practico;

create table sucursal( 
	id_sucursal varchar(5) not null,
    nombre varchar(25) not null,
    ubicacion varchar(255) not null,
    primary key(id_sucursal)
    );

create table sala(
	id_sala varchar(5) not null,
    id_sucursal varchar(5) not null,
    nombre varchar(25) not null,
    primary key (id_sala, id_sucursal),
    foreign key (id_sucursal) references sucursal(id_sucursal) 
    );

create table butaca(
	id_butaca int identity(1,1) not null,
	numero varchar(5) not null,
    id_sala varchar(5) not null,
	id_sucursal varchar(5) not null,
    grupo_butaca varchar(30),
    primary key (id_butaca),
    foreign key (id_sala, id_sucursal) references sala(id_sala, id_sucursal)
    );

create table genero(
	id_genero varchar(5) not null ,
    genero varchar(20) not null,
    primary key(id_genero)
    );

create table pelicula(
	id_pelicula varchar(10) not null,
	id_genero varchar(5) not null,
	nombre varchar (40) not null,
	apta varchar(2) not null,
	subtitulada varchar(5) not null,
	precio int not null,
    primary key(id_pelicula),
    foreign key(id_genero) references genero( id_genero)
    );

create table funcion(
	id_funcion int identity (1,1),
	funcion varchar(5) not null,
    id_pelicula varchar(10) not null,
    id_sala varchar(5) not null,
	id_sucursal varchar(5) not null,
    fecha date not null,
	hora time not null,
    primary key (id_funcion),
    foreign key (id_pelicula) references pelicula(id_pelicula),
    foreign key (id_sala, id_sucursal) references sala(id_sala, id_sucursal)
    );

create table entrada( 
	id_entrada varchar(5) not null,
    id_butaca int not null,
	id_funcion int not null,
    cliente varchar (20),
    primary key (id_entrada),
    foreign key (id_butaca) references butaca (id_butaca),
	foreign key (id_funcion) references funcion (id_funcion)
    );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Ejercicio 3: CARGA DE DATOS
INSERT INTO Sucursal(id_sucursal, nombre, ubicacion)
VALUES 
('suc1', 'showcase', 'rosario, santa fe, argentina'),
('suc2', 'aimax', 'cordoba, cordoba, argentina'),
('suc3', 'village', 'la plata, buenos aires, argentina')

INSERT INTO sala(id_sala, id_sucursal, nombre) 
VALUES
('sl1', 'suc1', 'A'), 
('sl2', 'suc1', 'B'), 
('sl3', 'suc1', 'C'), 
('sl1', 'suc2', 'A'),
('sl2', 'suc2', 'B'), 
('sl3', 'suc2', 'C'), 
('sl1', 'suc3', 'A'), 
('sl2', 'suc3', 'B'), 
('sl3', 'suc3', 'C')

INSERT INTO butaca(numero, id_sala, id_sucursal, grupo_butaca) 
VALUES
-- Sucursal 1 -- 
('1', 'sl1', 'suc1', 'BAJA'), --Sala 1
('2', 'sl1', 'suc1', 'BAJA'),
('3', 'sl1', 'suc1', 'BAJA'),
('4', 'sl1', 'suc1', 'BAJA'),
('5', 'sl1', 'suc1', 'BAJA'),
('6', 'sl1', 'suc1', 'BAJA'),
('7', 'sl1', 'suc1', 'BAJA'),
('8', 'sl1', 'suc1', 'BAJA'),
('9', 'sl1', 'suc1', 'MEDIA'),
('10', 'sl1', 'suc1', 'MEDIA'),
('11', 'sl1', 'suc1', 'MEDIA'),
('12', 'sl1', 'suc1', 'MEDIA'),
('13', 'sl1', 'suc1', 'MEDIA'),
('14', 'sl1', 'suc1', 'MEDIA'),
('15', 'sl1', 'suc1', 'ALTA'),
('16', 'sl1', 'suc1', 'ALTA'),
('17', 'sl1', 'suc1', 'ALTA'),
('18', 'sl1', 'suc1', 'ALTA'),
('19', 'sl1', 'suc1', 'ALTA'),
('20', 'sl1', 'suc1', 'ALTA'),
('1', 'sl2', 'suc1', 'BAJA'), -- Sala 2 
('2', 'sl2', 'suc1', 'BAJA'),
('3', 'sl2', 'suc1', 'BAJA'),
('4', 'sl2', 'suc1', 'BAJA'),
('5', 'sl2', 'suc1', 'BAJA'),
('6', 'sl2', 'suc1', 'BAJA'),
('7', 'sl2', 'suc1', 'BAJA'),
('8', 'sl2', 'suc1', 'BAJA'),
('9', 'sl2', 'suc1', 'MEDIA'),
('10', 'sl2', 'suc1', 'MEDIA'),
('11', 'sl2', 'suc1', 'MEDIA'),
('12', 'sl2', 'suc1', 'MEDIA'),
('13', 'sl2', 'suc1', 'MEDIA'),
('14', 'sl2', 'suc1', 'MEDIA'),
('15', 'sl2', 'suc1', 'ALTA'),
('16', 'sl2', 'suc1', 'ALTA'),
('17', 'sl2', 'suc1', 'ALTA'),
('18', 'sl2', 'suc1', 'ALTA'),
('19', 'sl2', 'suc1', 'ALTA'),
('20', 'sl2', 'suc1', 'ALTA'),
('1', 'sl3', 'suc1', 'BAJA'), -- Sala 3
('2', 'sl3', 'suc1', 'BAJA'),
('3', 'sl3', 'suc1', 'BAJA'),
('4', 'sl3', 'suc1', 'BAJA'),
('5', 'sl3', 'suc1', 'BAJA'),
('6', 'sl3', 'suc1', 'BAJA'),
('7', 'sl3', 'suc1', 'BAJA'),
('8', 'sl3', 'suc1', 'BAJA'),
('9', 'sl3', 'suc1', 'MEDIA'),
('10', 'sl3', 'suc1', 'MEDIA'), 
('11', 'sl3', 'suc1', 'MEDIA'),
('12', 'sl3', 'suc1', 'MEDIA'),
('13', 'sl3', 'suc1', 'MEDIA'),
('14', 'sl3', 'suc1', 'MEDIA'),
('15', 'sl3', 'suc1', 'ALTA'),
('16', 'sl3', 'suc1', 'ALTA'),
('17', 'sl3', 'suc1', 'ALTA'),
('18', 'sl3', 'suc1', 'ALTA'),
('19', 'sl3', 'suc1', 'ALTA'),
('20', 'sl3', 'suc1', 'ALTA'),
-- Sucursal 2 -- 
('1', 'sl1', 'suc2', 'BAJA'), --Sala 1
('2', 'sl1', 'suc2', 'BAJA'),
('3', 'sl1', 'suc2', 'BAJA'),
('4', 'sl1', 'suc2', 'BAJA'),
('5', 'sl1', 'suc2', 'BAJA'),
('6', 'sl1', 'suc2', 'BAJA'),
('7', 'sl1', 'suc2', 'BAJA'),
('8', 'sl1', 'suc2', 'BAJA'),
('9', 'sl1', 'suc2', 'MEDIA'),
('10', 'sl1', 'suc2', 'MEDIA'),
('11', 'sl1', 'suc2', 'MEDIA'),
('12', 'sl1', 'suc2', 'MEDIA'),
('13', 'sl1', 'suc2', 'MEDIA'),
('14', 'sl1', 'suc2', 'MEDIA'),
('15', 'sl1', 'suc2', 'ALTA'),
('16', 'sl1', 'suc2', 'ALTA'),
('17', 'sl1', 'suc2', 'ALTA'),
('18', 'sl1', 'suc2', 'ALTA'),
('19', 'sl1', 'suc2', 'ALTA'),
('20', 'sl1', 'suc2', 'ALTA'),
('1', 'sl2', 'suc2', 'BAJA'), -- Sala 2 
('2', 'sl2', 'suc2', 'BAJA'),
('3', 'sl2', 'suc2', 'BAJA'),
('4', 'sl2', 'suc2', 'BAJA'),
('5', 'sl2', 'suc2', 'BAJA'),
('6', 'sl2', 'suc2', 'BAJA'),
('7', 'sl2', 'suc2', 'BAJA'),
('8', 'sl2', 'suc2', 'BAJA'),
('9', 'sl2', 'suc2', 'MEDIA'),
('10', 'sl2', 'suc2', 'MEDIA'),
('11', 'sl2', 'suc2', 'MEDIA'),
('12', 'sl2', 'suc2', 'MEDIA'),
('13', 'sl2', 'suc2', 'MEDIA'),
('14', 'sl2', 'suc2', 'MEDIA'),
('15', 'sl2', 'suc2', 'ALTA'),
('16', 'sl2', 'suc2', 'ALTA'),
('17', 'sl2', 'suc2', 'ALTA'),
('18', 'sl2', 'suc2', 'ALTA'),
('19', 'sl2', 'suc2', 'ALTA'),
('20', 'sl2', 'suc2', 'ALTA'),
('1', 'sl3', 'suc2', 'BAJA'), -- Sala 3
('2', 'sl3', 'suc2', 'BAJA'),
('3', 'sl3', 'suc2', 'BAJA'),
('4', 'sl3', 'suc2', 'BAJA'),
('5', 'sl3', 'suc2', 'BAJA'),
('6', 'sl3', 'suc2', 'BAJA'),
('7', 'sl3', 'suc2', 'BAJA'),
('8', 'sl3', 'suc2', 'BAJA'),
('9', 'sl3', 'suc2', 'MEDIA'),
('10', 'sl3', 'suc2', 'MEDIA'), 
('11', 'sl3', 'suc2', 'MEDIA'),
('12', 'sl3', 'suc2', 'MEDIA'),
('13', 'sl3', 'suc2', 'MEDIA'),
('14', 'sl3', 'suc2', 'MEDIA'),
('15', 'sl3', 'suc2', 'ALTA'),
('16', 'sl3', 'suc2', 'ALTA'),
('17', 'sl3', 'suc2', 'ALTA'),
('18', 'sl3', 'suc2', 'ALTA'),
('19', 'sl3', 'suc2', 'ALTA'),
('20', 'sl3', 'suc2', 'ALTA'),
-- Sucursal 3 -- 
('1', 'sl1', 'suc3', 'BAJA'), --Sala 1
('2', 'sl1', 'suc3', 'BAJA'),
('3', 'sl1', 'suc3', 'BAJA'),
('4', 'sl1', 'suc3', 'BAJA'),
('5', 'sl1', 'suc3', 'BAJA'),
('6', 'sl1', 'suc3', 'BAJA'),
('7', 'sl1', 'suc3', 'BAJA'),
('8', 'sl1', 'suc3', 'BAJA'),
('9', 'sl1', 'suc3', 'MEDIA'),
('10', 'sl1', 'suc3', 'MEDIA'),
('11', 'sl1', 'suc3', 'MEDIA'),
('12', 'sl1', 'suc3', 'MEDIA'),
('13', 'sl1', 'suc3', 'MEDIA'),
('14', 'sl1', 'suc3', 'MEDIA'),
('15', 'sl1', 'suc3', 'ALTA'),
('16', 'sl1', 'suc3', 'ALTA'),
('17', 'sl1', 'suc3', 'ALTA'),
('18', 'sl1', 'suc3', 'ALTA'),
('19', 'sl1', 'suc3', 'ALTA'),
('20', 'sl1', 'suc3', 'ALTA'),
('1', 'sl2', 'suc3', 'BAJA'), -- Sala 2 
('2', 'sl2', 'suc3', 'BAJA'),
('3', 'sl2', 'suc3', 'BAJA'),
('4', 'sl2', 'suc3', 'BAJA'),
('5', 'sl2', 'suc3', 'BAJA'),
('6', 'sl2', 'suc3', 'BAJA'),
('7', 'sl2', 'suc3', 'BAJA'),
('8', 'sl2', 'suc3', 'BAJA'),
('9', 'sl2', 'suc3', 'MEDIA'),
('10', 'sl2', 'suc3', 'MEDIA'),
('11', 'sl2', 'suc3', 'MEDIA'),
('12', 'sl2', 'suc3', 'MEDIA'),
('13', 'sl2', 'suc3', 'MEDIA'),
('14', 'sl2', 'suc3', 'MEDIA'),
('15', 'sl2', 'suc3', 'ALTA'),
('16', 'sl2', 'suc3', 'ALTA'),
('17', 'sl2', 'suc3', 'ALTA'),
('18', 'sl2', 'suc3', 'ALTA'),
('19', 'sl2', 'suc3', 'ALTA'),
('20', 'sl2', 'suc3', 'ALTA'),
('1', 'sl3', 'suc3', 'BAJA'), -- Sala 3
('2', 'sl3', 'suc3', 'BAJA'),
('3', 'sl3', 'suc3', 'BAJA'),
('4', 'sl3', 'suc3', 'BAJA'),
('5', 'sl3', 'suc3', 'BAJA'),
('6', 'sl3', 'suc3', 'BAJA'),
('7', 'sl3', 'suc3', 'BAJA'),
('8', 'sl3', 'suc3', 'BAJA'),
('9', 'sl3', 'suc3', 'MEDIA'),
('10', 'sl3', 'suc3', 'MEDIA'), 
('11', 'sl3', 'suc3', 'MEDIA'),
('12', 'sl3', 'suc3', 'MEDIA'),
('13', 'sl3', 'suc3', 'MEDIA'),
('14', 'sl3', 'suc3', 'MEDIA'),
('15', 'sl3', 'suc3', 'ALTA'),
('16', 'sl3', 'suc3', 'ALTA'),
('17', 'sl3', 'suc3', 'ALTA'),
('18', 'sl3', 'suc3', 'ALTA'),
('19', 'sl3', 'suc3', 'ALTA'),
('20', 'sl3', 'suc3', 'ALTA')

INSERT INTO genero(id_genero, genero) 
 VALUES
('gn1', 'ciencia ficcion'),
('gn2', 'romance'), 
('gn3', 'accion'),
('gn4', 'drama') 

INSERT INTO pelicula(id_pelicula, id_genero, nombre, apta, subtitulada, precio) 
VALUES
('pel1', 'gn4', 'Argentina, 1985', 'si', 'no', 1300),
('pel2', 'gn3', 'matrix', 'no', 'si', 500),
('pel3', 'gn3', 'ryf 8', 'no', 'si', 850),
('pel4', 'gn1', 'cuando te encuentre', 'si', 'si', 9999),
('pel5', 'gn1', 'cars', 'si', 'si', 100)

INSERT INTO funcion(funcion, id_pelicula, id_sala, id_sucursal, fecha, hora) 
VALUES
-- Sucursal 1 --
('f1', 'pel1', 'sl1', 'suc1', '2022-10-24', '18:00'),
('f2', 'pel2', 'sl2', 'suc1', '2022-10-24', '21:00'),
('f3', 'pel3', 'sl1', 'suc1', '2022-10-25', '18:00'),
('f4', 'pel4', 'sl3', 'suc1', '2022-10-25', '21:00'),
('f5', 'pel5', 'sl1', 'suc1', '2022-10-26', '18:00'),
('f6', 'pel1', 'sl2', 'suc1', '2022-10-26', '18:00'),
('f7', 'pel2', 'sl1', 'suc1', '2022-10-27', '18:00'),
('f8', 'pel3', 'sl1', 'suc1', '2022-10-27', '21:00'),
('f9', 'pel4', 'sl3', 'suc1', '2022-10-28', '18:00'),
('f10', 'pel5', 'sl3', 'suc1', '2022-10-28', '21:00'),
('f11', 'pel1', 'sl2', 'suc1', '2022-10-29', '18:00'),
('f12', 'pel2', 'sl2', 'suc1', '2022-10-29', '21:00'),
('f13', 'pel3', 'sl1', 'suc1', '2022-10-30', '18:00'),
('f14', 'pel4', 'sl2', 'suc1', '2022-10-30', '21:00'),
('f15', 'pel5', 'sl1', 'suc1', '2022-10-31', '18:00'),
('f16', 'pel1', 'sl3', 'suc1', '2022-10-31', '21:00'),
-- Sucursal 2 --
('f1', 'pel1', 'sl1', 'suc2', '2022-10-24', '18:00'),
('f2', 'pel2', 'sl2', 'suc2', '2022-10-24', '21:00'),
('f3', 'pel3', 'sl1', 'suc2', '2022-10-25', '18:00'),
('f4', 'pel4', 'sl3', 'suc2', '2022-10-25', '21:00'),
('f5', 'pel5', 'sl1', 'suc2', '2022-10-26', '18:00'),
('f6', 'pel1', 'sl2', 'suc2', '2022-10-26', '21:00'),
('f7', 'pel2', 'sl1', 'suc2', '2022-10-27', '18:00'),
('f8', 'pel3', 'sl1', 'suc2', '2022-10-27', '21:00'),
('f9', 'pel4', 'sl3', 'suc2', '2022-10-28', '18:00'),
('f10', 'pel5', 'sl3', 'suc2', '2022-10-28', '21:00'),
('f11', 'pel1', 'sl2', 'suc2', '2022-10-29', '18:00'),
('f12', 'pel2', 'sl2', 'suc2', '2022-10-29', '21:00'),
('f13', 'pel3', 'sl1', 'suc2', '2022-10-30', '18:00'),
('f14', 'pel4', 'sl2', 'suc2', '2022-10-30', '21:00'),
('f15', 'pel5', 'sl1', 'suc2', '2022-10-31', '18:00'),
('f16', 'pel1', 'sl3', 'suc2', '2022-10-31', '21:00'),
-- Sucrusal 3 --
('f1', 'pel1', 'sl1', 'suc3', '2022-10-24', '18:00'),
('f2', 'pel2', 'sl2', 'suc3', '2022-10-24', '21:00'),
('f3', 'pel3', 'sl1', 'suc3', '2022-10-25', '18:00'),
('f4', 'pel4', 'sl3', 'suc3', '2022-10-25', '21:00'),
('f5', 'pel5', 'sl1', 'suc3', '2022-10-26', '18:00'),
('f6', 'pel1', 'sl2', 'suc3', '2022-10-26', '21:00'),
('f7', 'pel2', 'sl1', 'suc3', '2022-10-27', '18:00'),
('f8', 'pel3', 'sl1', 'suc3', '2022-10-27', '21:00'),
('f9', 'pel4', 'sl3', 'suc3', '2022-10-28', '18:00'),
('f10', 'pel5', 'sl3', 'suc3', '2022-10-28', '21:00'),
('f11', 'pel1', 'sl2', 'suc3', '2022-10-29', '18:00'),
('f12', 'pel2', 'sl2', 'suc3', '2022-10-29', '21:00'),
('f13', 'pel3', 'sl1', 'suc3', '2022-10-30', '18:00'),
('f14', 'pel4', 'sl2', 'suc3', '2022-10-30', '21:00'),
('f15', 'pel5', 'sl1', 'suc3', '2022-10-31', '18:00'),
('f16', 'pel1', 'sl3', 'suc3', '2022-10-31', '21:00')

insert into entrada(id_entrada, id_butaca, id_funcion, cliente)
values 
('e1', '2', 38, '43567890'),
('e2', '5', 5, '45748908'),
('e3', '7', 48, '45256127'),
('e4', '8', 40, '4251532'),
('e5', '9', 40, '12132546'),
('e6', '16', 1, '2165531'),
('e7', '11', 1, '2313546'),
('e8', '12', 1, '2341654'),
('e9', '13', 1, '14122523'),
('e10','14', 1, '2302161'),
('e11','15', 1, '2302171'),
('e12','16', 20, '2302181'),
('e13','17', 21, '2302191'),
('e14','18', 22, '2302201'),
('e15','19', 18, '2302211'),
('e16','20', 7, '2302221'),
('e17','2',	5, '2302231'),
('e18','1', 13, '2302241'),
('e19','5', 20, '2302251'),
('e20','19', 40, '2302261'),
('e21','18', 9, '2302271'),
('e22','17', 10, '2302281'),
('e23','16', 11, '2302291'),
('e24','15', 1, '2302301')

/*
Falta añadir más datos de entradas vendidas
Se recomienda usar un script de python para añadir de 0 a 20 entradas vendidas por función
*/

-- Ejercicio 4: CONSULTAS VARIAS

--ejercicio 4 a) ¿Cuántas funciones hay en la sucursal La Plata (no importa si la funci´on ya ocurrió o no)?

SELECT count(*) Funciones FROM funcion
WHERE id_sucursal='suc3';

--ejercicio 4 b) ¿Cuáles son las películas en cartelera en una fecha determinada (fije la fecha que prefiera) en la sucursal Córdoba?
--FECHA ELEGIDA: 27/10/2022 */

SELECT DISTINCT p.nombre, fecha, s.nombre, s.ubicacion FROM pelicula p
              JOIN funcion f ON p.id_pelicula = f.id_pelicula 
			  JOIN sucursal s ON f.id_sucursal = s.id_sucursal
WHERE f.fecha = '2022-10-27' AND s.id_sucursal='suc2';

--ejercicio 4 c) ¿Cuáles son los horarios disponibles para ver la película Argentina, 1985 en una fecha determinada (fije la fecha) en la sucursal Rosario?
--FECHA ELEGIDA: 31/10/2022 */

SELECT DISTINCT p.nombre, f.fecha, f.hora FROM funcion f
       JOIN pelicula p ON  f.id_pelicula = p.id_pelicula
WHERE f.fecha = '2022-10-31' AND f.id_sucursal='suc1' AND p.nombre = 'Argentina, 1985';

--ejercicio 4 d)  ¿Cuáles son los horarios disponibles para ver la película Argentina, 1985 en una fecha determinada (fije la fecha) para cada sucursal?
--Muestre estos resultados ordenados cronológicamente de forma creciente.
--FECHA ELEGIDA: 26/10/2022 */

SELECT DISTINCT p.nombre, f.fecha, f.hora, s.nombre FROM funcion f
       JOIN pelicula p ON f.id_pelicula = p.id_pelicula
	   JOIN sucursal s ON f.id_sucursal = s.id_sucursal  
WHERE f.fecha = '2022-10-26' AND p.nombre = 'Argentina, 1985'
ORDER BY hora;

--4) e)
/* ¿Cuáles películas de ciencia ficción hay en cartelera la semana del 24 de octubre de 2022 en la sucursal Rosario? */ 
--Rosario es suc1
-- gn1 es ciencia ficción 

SELECT DISTINCT p.nombre, f.fecha, f.hora, f.id_sucursal FROM funcion f
       JOIN pelicula p ON p.id_pelicula = f.id_pelicula 
WHERE id_sucursal = 'suc1'
AND (f.fecha = '2022-10-24' OR f.fecha = '2022-10-25' OR f.fecha = '2022-10-26' OR f.fecha = '2022-10-27' OR f.fecha = '2022-10-28' OR f.fecha = '2022-10-29' OR f.fecha = '2022-10-30') 
AND id_genero = 'gn1' 


/* Ejercicio 4) f) ¿Cuáles son las butacas *vendidas* para ver Argentina, 1985 en Córdoba en una función determinada (fije la función)?
   Ejercicio 4) g) ¿Cuáles son las butacas *libres* para ver Argentina, 1985 en Córdoba en una función determinada (fije la función)?
--FECHA ELEGIDA: 26/10/2022 */

SELECT DISTINCT e.id_entrada, e.id_butaca, e.id_funcion, e.cliente FROM entrada e
       JOIN funcion f ON e.id_funcion = f.id_funcion
	   JOIN pelicula p ON p.id_pelicula = f.id_pelicula 
	   JOIN sucursal s ON s.id_sucursal = f.id_sucursal
WHERE f.fecha = '2022-10-26' AND p.nombre = 'Argentina, 1985' AND s.id_sucursal = 'suc2'

--Fijamos funcion 22

SELECT e.id_entrada, e.id_butaca, e.id_funcion, e.cliente,  20 - count(id_butaca) Cantidad_de_butacas_libres
FROM entrada e
	JOIN funcion f ON e.id_funcion = f.id_funcion
	JOIN pelicula p ON p.id_pelicula = f.id_pelicula 
	JOIN sucursal s ON s.id_sucursal = f.id_sucursal
WHERE f.fecha = '2022-10-26' AND p.nombre = 'Argentina, 1985' AND s.id_sucursal = 'suc2'
GROUP BY e.id_entrada, e.id_butaca, e.id_funcion, e.cliente

--- Ejercicio 4 h) ¿Cuántas peliculas por género están o estuvieron en cartelera en el Cine Paraíso?

SELECT g.genero Generos, COUNT(DISTINCT(f.id_pelicula)) Cantidad_Peliculas
FROM funcion f
		JOIN pelicula p on f.id_pelicula = p.id_pelicula
		JOIN genero g on p.id_genero = g.id_genero
GROUP BY g.genero


-- Ejercicio 6: MÁS CONSULTAS
-- 6) a. Determine el total recaudado por función.

-- Cuenta cuantas entradas fueron vendidas para una funcion y luego esto lo multiplica segun el precio de la pelicula de la funcion --
select funcion.id_funcion, SUM (pelicula.precio) as Recaudacion from pelicula, funcion, entrada -- Hace un producto cartesiano de peliculas, funcion y entrada segun la id de funcion que tenga y ...[COMPLETAR]
where pelicula.id_pelicula = funcion.id_pelicula and entrada.id_funcion = funcion.id_funcion -- Solo muestra los resultados que coincida la pelicula y funcion  para evitar que se muestren peliculas o funciones distintas
group by funcion.id_funcion -- Agrupa los resultados en base a la id de funcion


-- 6) b.  Determine el promedio recaudado por función para cada película. Es decir, si la película Argentina, 1985 tuvo dos funciones, y en una recaudó 1000 pesos, y en la otra recaudó 
        --3000 pesos, el promedio recaudado por funcóon para esta película es 2000 pesos.

--No tenemos precios variables para la misma pelicula, es decir que para cada pelicula el precio promedio sera el mismo precio de la entrada.

select pel.nombre, AVG(pel.precio) Precio_promedio, SUM(pel.precio) Recaudacion_total
from funcion 
join pelicula pel on
funcion.id_pelicula = pel.id_pelicula
group by pel.nombre

-- 6) c. Determine el porcentaje de entradas vendidas por función, y muestre película, sucursal,
	--   hora y día, solo para aquellas en las que se vendió menos del 50 %.

select (count(id_butaca)* 100 / 20) as Porcentaje_Entradas_Vendidas ,func.funcion funcion, pel.nombre Pelicula, suc.nombre Sucursal, func.fecha, func.hora
from entrada
join funcion func on
entrada.id_funcion = func.id_funcion
join pelicula pel on 
func.id_pelicula = pel.id_pelicula
join sucursal suc on
func.id_sucursal = suc.id_sucursal 
group by func.funcion, pel.nombre, suc.nombre, func.fecha, func.hora
having (count(id_butaca) / 20 * 100) < 50

-- 6) d. Determine, para cada película, cuál fue la función que más recaudó.

select pelicula.nombre, func.funcion, SUM(pelicula.precio) as Recaudacion_maxima
from entrada
join funcion func on
entrada.id_funcion = func.id_funcion
join pelicula on 
func.id_pelicula = pelicula.id_pelicula
group by  pelicula.nombre, func.funcion
order by SUM (pelicula.precio) desc, pelicula.nombre

-- Intentamos calcular la recaudación de función para cada pelicula. Pero después no supimos como quedarnos con las funciones que mas recaudaron de cada pelicula.
