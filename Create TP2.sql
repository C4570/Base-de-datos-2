--Create BD
Create database Trabajo_practico_2;

--Create Tables
use Trabajo_practico_2;

Create table usuario(
	usuario varchar (255) not null,
	contraseña varchar (255) not null,
	--Keys
	Primary Key (usuario)
);

Create table planes(
	id_plan char not null,
	ds_plan varchar(8) not null,--Gratuito(G), Premium(P) o Familiar(F)
	--Keys
	Primary Key (id_plan)
);

Create table genero (
	id_genero int identity(1,1) not null,
	genero varchar(255) not null,
	--Keys
	Primary Key (id_genero)
);

Create table tipo (
	id_tipo int identity(1,1) not null, 
	id_plan char not null,
	--Keys
	Primary Key (id_tipo), 
	Foreign Key (id_plan) references planes (id_plan)
);

Create table pelicula (
	id_pelicula int identity(1,1) not null,
	id_genero int not null,
	id_tipo int not null,
	nombre varchar(255) not null,
	--Keys
	Primary Key (id_pelicula),
	Foreign Key (id_genero) references genero(id_genero),
	Foreign Key (id_tipo) references tipo (id_tipo)
);

Create table subscripcion(
	id_sub int identity(1,1) not null, 
	id_plan char not null, 
	ds_activo varchar(8) not null, --Activo o Inactivo
	ds_sub varchar(9) not null, -- Anual o Mensual
	--Keys
	Primary Key (id_sub), 
	Foreign Key (id_plan) references planes(id_plan)
);

Create table pago(
	id_pago int identity(1,1) not null,
	id_sub int not null, 
	usuario varchar (255) not null,
	fecha_ven date not null,
	--Keys
	Primary Key (id_pago),
	Foreign Key (id_sub) references subscripcion(id_sub),
	Foreign Key (usuario) references usuario(usuario)
);

--Data Upload
Insert into usuario(usuario, contraseña)
Values
('Julian', '123'),
('Bianca', '123'),
('Timoteo', '123'),
('Lara', '123')

Insert into planes(id_plan, ds_plan)
Values
('G','Gratuito'),
('P','Premium'),
('F','Familiar')

Insert into tipo(id_plan)
Values
('G'),
('P'),
('F')

Insert into subscripcion(id_plan,ds_activo,ds_sub)
Values
('P','Inactivo','Anual'),
('G','Inactivo','Mensual'),
('F','Inactivo','Mensual'),
('P','Inactivo','Mensual')

Insert into pago(id_sub, usuario, fecha_ven)
Values
(1, 'Julian', '2022-12-10'),
(2, 'Bianca', '2022-12-10'),
(3, 'Timoteo', '2022-12-10'),
(4, 'Lara', '2022-12-10')

Select * from pago  
Select * from subscripcion  
Select * from tipo   
Select * from usuario  
Select * from planes  