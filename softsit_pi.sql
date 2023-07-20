create database softsit_pi; 
use softsit_pi;
drop database softsit_pi;

create table pefundas(
id int not null primary key auto_increment,
Nombre varchar(100),
Ape_p varchar(100),
Ape_m varchar(100),
Municipio varchar(100),
Estado varchar(100),
Colonia varchar(100),
Calle varchar(100),
Direccion varchar(100));

select * from pefundas;



