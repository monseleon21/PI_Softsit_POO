create database SOFTSIT 

use SOFTSIT

create table estados (
id_estado int identity (1,1),
nombre_estado varchar (100),
primary key (id_estado))

insert into estados (nombre_estado) values
('Queretaro'),
('Edo. México'),
('Jalisco'),
('Michoacán'),
('Yucatán'),
('Guerrero'),
('Chiapas'),
('Nuevo Leon'),
('Sinaloa'),
('Hidalgo')


create table municipios (
id_municipio int identity (1,1),
nombre_municipio varchar (100),
id_estado int,
primary key (id_municipio),
foreign key (id_estado) references estados(id_estado))

insert into municipios (nombre_municipio) values
('Aculco'),
('Atenco'),
('Zumpango'),
('Zacuaplan'),
('Timilpan'),
('Sultepec'),
('Polotitlán'),
('Tezxoyuca'),
('Tlataya'),
('Tonaltico')


create table colonias (
id_colonia int identity (1,1),
nombre_colonia varchar (100),
id_municipio int,
primary key (id_colonia),
foreign key (id_municipio) references municipios (id_municipio)
)

insert into colonias (nombre_colonia) values
('Balvanera'),
('Polo'),
('Juriquilla'),
('Jurica'),
('El refugio'),
('Loma dorada'),
('El campanario'),
('LAs teresas'),
('Arboledas'),
('Milenio')

create table calles (
id_calle int identity (1,1),
nombre_calle varchar (100),
id_colonia int,
primary key (id_calle),
foreign key (id_colonia) references colonias (id_colonia))

insert into calles (nombre_calle) values
('Venustiano carranza'),
('San francisco I Madero'),
('Luis pasteur'),
('5 febrero'),
('Abeto'),
('Abogados'),
('Camino real'),
('Maldo'),
('Malinche'),
('Maíz')

create table direcciones (
id_direccion int identity (1,1),
no_local varchar (100),
id_calle int,
primary key (id_direccion),
foreign key (id_calle) references calles (id_calle))

insert into direcciones (no_local) values
('1'),
('2'),
('3'),
('4'),
('5'),
('6'),
('7'),
('8'),
('9'),
('10')

create table clientes (
id_cliente int identity (1,1),
nombre varchar (100),
ape_p varchar (100),
ape_m varchar (100),
id_direccion int,
primary key (id_cliente),
foreign key (id_direccion) references direcciones (id_direccion))

insert into clientes (nombre, ape_p, ape_m) values
('Maria','Leon','Flores'),
('Martha','Leonila','Reyes'),
('Yolanda','Hernandez','Nuñez'),
('Ándres','Gonzales','Lopez'),
('Cesar','Barrera','Neri'),
('Julio','Campuzano','Fili'),
('Aldo','Carrillo','Elizalde'),
('Raul','Mendez','Alvarez'),
('Jose','Estrada','Morales'),
('Diego','Alvarado','Becerril')

create table marcas(
id_marca int identity (1,1),
nombre_marca varchar (100),
primary key (id_marca))

insert into marcas (nombre_marca) values
('Fiat'),
('Renault'),
('Cadillac'),
('Ford'),
('Skoda'),
('Buick'),
('Solana'),
('Shelby'),
('Borgward'),
('DINA')

create table modelos (
id_modelo int identity (1,1),
nombre_modelo varchar (100),
id_marca int,
primary key (id_modelo),
foreign key (id_marca) references marcas (id_marca))

insert into modelos (nombre_modelo) values
('Audi Q5'),
('chevrolet Express 1995'),
('Fiat Palio Adventure 1997'),
('Toyota Land Cruiser 2007'),
('Dodge Grand Caravan 2007'),
('Nissan 2007 GTR'),
('Chevrolet Tornado'),
('Nissan Frontier'),
('Nissan Frontier Pro 2004'),
('Dodge Caravan 2007')

create table fundas (
id_funda int identity (1,1),
modelo_f varchar (100),
precio int,
primary key (id_funda))


insert into fundas (modelo_f, precio) values
('Clasico 1.0',' 1300 '),
('Premium 1.0',' 2000'),
('Clasico 1.0',' 1300'),
('Clasico 2.0',' 1700'),
('Basic',' 1100'),
('Premium 2.0','2000'),
('Clasico 2.0',' 1600'),
('Basic',' 1100'),
('Clasico 1.0',' 1300'),
('Clasico 2.0',' 1700')

create table instalaciones (
id_instalacion int identity (1,1),
fecha date,
id_funda int,
primary key (id_instalacion),
foreign key (id_funda) references fundas (id_funda))

insert into instalaciones (fecha) values
('2022/01/10'),
('2022/02/11'),
('2022/03/12'),
('2023/04/01'),
('2023/12/02'),
('2023/02/23'),
('2023/10/04'),
('2023/11/24'),
('2023/02/15'),
('2023/09/05')

create table autos (
id_auto int identity (1,1),
id_modelo int,
id_funda int,
primary key (id_auto),
foreign key (id_modelo) references autos (id_modelo),
foreign key (id_funda) references fundas (id_funda))

create table ventas (
id_venta int identity (1,1),
id_cliente int,
id_funda int,
id_instalacion int,
primary key (id_venta),
foreign key (id_cliente) references clientes (id_cliente),
foreign key (id_funda) references fundas (id_funda),
foreign key (id_instalacion) references instalaciones (id_instalacion))

