CREATE DATABASE proyecto_Biblioteca;
USE proyecto_Biblioteca;


CREATE TABLE clientes (
  id_cliente_lector INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  telefono DECIMAL(10,0) NOT NULL,
  direccion VARCHAR(100),
  mail VARCHAR(100),
  nro_cliente DECIMAL(10,0) NOT NULL
);



insert into clientes values (null,'fernando','ferreyra',
3512000320,'Roberto Cayol 345','f_f@hotmail.com',1),(null,'Jeremias','Guzmán',
351256456,'Romulo Carbia 2658','J_J@hotmail.com',2),(null,'Josue','Teniente',
3516985754,'Tablada 79','J_T@hotmail.com',3),(null,'Lidia','Guzmán',
351785965,'Romulo carbia 56','L_G@hotmail.com',4),(null,'Constantino','Mangiafave',
3513695784,'Flores 54','C_M@Gmailmail.com',5),(null,'Catalina','Mangiafave',
3515986256,'Duarte quiros 2115','Cata_M@gmail.com',6),(null,'Agustin','ferreyra',
3513456734,'Roberto Cayol 300','A_f@hotmail.com',7);

insert into proyecto_biblioteca.clientes(id_cliente_lector,nombre, 
apellido, telefono,direccion, mail,nro_cliente)
values (null,'Agustin','ferreyra',
3513456734,'Roberto Cayol 300','A_f@hotmail.com',7);

USE proyecto_Biblioteca;
insert ignore into clientes values(null,'Agustin','ferreyra',
3513456734,'Roberto Cayol 300','A_f@hotmail.com',7);

create or replace view vista_clientes as 
(select nombre, apellido,mail from clientes);

select * from vista_clientes;

Select * from clientes;


-- Crear el trigger
DELIMITER //
CREATE TRIGGER tr_cliente_insert
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    -- Acción a realizar cuando se inserta un cliente
    INSERT INTO registro_clientes (id_cliente, fecha_registro)
    VALUES (NEW.id_cliente_lector, NOW());
END;
//
DELIMITER ;

-- Crear tabla Empleados
CREATE TABLE empleados (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  fecha_nacimiento DATE,
  nacionalidad VARCHAR(100)
);
insert into Empleados values (null,'Luis','Perez',
'1975-09-20','Español'),(null,'Candelaria','Nuñez',
'1993-07-12','Argentina');

create view vista_empleados as 
(select nombre,nacionalidad from empleados);

select * from vista_empleados ve ;


Select * from empleados;

-- Crear tabla Editoriales
CREATE TABLE editoriales (
  id_editorial INT AUTO_INCREMENT PRIMARY KEY,
  nombre_editorial VARCHAR(100),
  direccion VARCHAR(100),
  telefono DECIMAL(10,0) NOT NULL,
  sucursal VARCHAR(100)
);

insert into Editoriales values (null,'Planeta','Av. Libertad 78-Buenos Aires',
0114785968,13),(null,'Ediciones','Pedro Zanni 45 - Rosario',
0451476585,22),(null,'Macmillian','Rondeau 55- Córdoba',
3514758695,83),(null,'Alfaguara','Nuñez 223 - Santa Fe',
0523785475,54),(null,'Salamandra','Av.Córdoba 876 - Buenos Aires',
0113695456,675),(null,'Anagrama','Av.Rafael Nuñez 235 - Córdoba',
3515698452,96),(null,'Catedra','Av.Rafael Nuñez 1568 - Córdoba',
351764548, 112);

Select * From Editoriales;

create view vista_editoriales as (select nombre_editorial from editoriales);

select * from vista_editoriales ve ;


-- Crear tabla Autor
CREATE TABLE autor (
  id_autor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  fecha_nacimiento DECIMAL(10,0) NOT NULL,
  nacionalidad VARCHAR(100)
);
insert into Autor values (null,'Vivian','Gornick',
1945-05-22,'EEUU'),(null,'Stephen','King',
1947-03-12,'EEUU'),(null,'Harper','Lee',
1926-11-28,'EEUU'),(null,'Mark','Twain',
1949-01-22,'EEUU'),(null,'Edgard Allan','Poe',
1936-02-18,'EEUU'),(null,'Gabriel Garcia','Márquez',
1927-07-10,'México'),(null,'Jorge Luis','Borges',
1899-07-15,'Argentino'),(null,'Mario','Vargas Llosa',
1836-08-18,'Perú'),(null,'Leopoldo','Marechal',
1900-03-11,'Argentino'),(null,'Isabel','Allende',
1942-05-03,'Chilena'),(null,'Pablo','Neruda',
1904-07-10,'Chileno'),(null,'Ernesto','Sábato',
1911-09-10,'Argentino');

select * from autor a ;

create view vista_autor as (select nombre, nacionalidad from autor a);
select * from vista_autor va ;

-- Crear tabla Libros
CREATE TABLE libros (
  id_libros INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100),
  autor VARCHAR(100),
  id_autor INT,
  id_editorial INT,
  FOREIGN KEY (id_editorial) REFERENCES editoriales(id_editorial)
);

insert into Libros values (null,'Apegos feroces','Vivian Gornick',
1,17),(null,'Mirarse de frente','Vivian Gornick',
1,17), (null,'la mujer singular y la ciudad','Vivian Gornick',
1,17),(null,'El Instituto','Stephen King',
2,15), (null,'El Pistolero','Stephen King',
2,15),(null,'IT','Stephen King',
2,15), (null,'Matar a un Ruiseñor','Harper Lee',
3,20),(null,'Ve y pone un centinela','Harper Lee',
3,20),(null,'To kill a Mockingbird','Harper Lee',
3,20),(null,'Las aventiras de Tom Sawyer','Mark Twain',
4,21),(null,'El Cuervo','Edgard Allan Poe',
5,18),(null,'El Escarabajo de Oro','Edgard Allan Poe',
5,18),(null,'Cien Años de Soledad','Gabriel Garcia Márquez',
6,18),(null,'Amor en los tiempos de Cólera','Gabriel Garcia Márquez',
6,19),(null,'Noticias de un Secuestro','Gabriel Garcia Márquez',
6,19),(null,'Noticias de un Secuestro','Jorge Luis Borges',
8,16),(null,'Noticias de un Secuestro','Jorge Luis Borges',
8,16),(null,'La mirada quieta','Mario Vargas Llosa',
9,21),(null,'La Ciudad y los Perros','Mario Vargas Llosa',
9,21),(null,'La fiesta del Chivo','Mario Vargas Llosa',
9,17),(null,'El Centauro','Leopoldo Marechal',
10,17),(null,'La Casa de los espíritus','Isabel Allende',
11,19),(null,'Más allá del Invierno','Isabel Allende',
11,19),(null,'Cien Sonetos de Amor','Pablo Neruda',
12,20),(null,'Canto General','Pablo Neruda',
12,20),(null,'El Tunel','Ernesto Sábato',
13,16),(null,'Sobre Héroes y Tumbas','Ernesto Sábato',
13,16),(null,'La Resistencia','Ernesto Sábato',
13,16);

create or replace view vista_libros as (select id_libros ,titulo,autor from libros l);

select * from vista_libros vl;

-- Crear tabla Prestamos
CREATE TABLE prestamos (
  id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente_lector INT,
  id_empleado INT,
  id_libros INT,
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion DATE NOT NULL,
  FOREIGN KEY (id_cliente_lector) REFERENCES clientes(id_cliente_lector),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
  FOREIGN KEY (id_libros) REFERENCES libros(id_libros)
);

insert into prestamos values (null,6,1,12,'2024-07-22','2024-07-29'),
(null,3,2,1,'2024-07-22','2024-07-26'),(null,4,2,3,'2024-07-22','2024-07-30'),
(null,5,2,4,'2024-07-22','2024-07-25'),(null,6,1,2,'2024-07-22','2024-07-26'),(null,1,2,5,'2024-07-22','2024-07-31'),
(null,2,1,6,'2024-07-22','2024-07-31'),
(null,3,1,7,'2024-07-22','2024-07-26'),(null,4,1,8,'2024-07-22','2024-07-31'),
(null,5,2,9,'2024-07-22','2024-08-01'),(null,6,1,10,'2024-07-22','2024-07-26'),(null,6,1,12,'2024-07-22','2024-07-29');
select * from prestamos;
select * from prestamos where fecha_devolucion = '2024-07-29';
alter table prestamos  auto_increment = 1;


create or replace view vista_prestamos as(select id_libros, fecha_prestamo,fecha_devolucion from prestamos);

select * from vista_prestamos vp ;

-- Creación de tabla por archivo insertado

create table Biblioteca(
id_Biblioteca int auto_increment primary key,
nombre varchar (100),
ciudad varchar (100)
);

select *
from biblioteca b ;

-- CREACIÓN DE STORED PROCEDURES
drop procedure if exists sp_get_clientes;

DELIMITER //
CREATE PROCEDURE sp_get_clientes()
begin
	select *
	from proyecto_biblioteca.clientes;
END //

DELIMITER ;
call sp_get_clientes();

drop procedure if exists sp_get_editoriales;

DELIMITER //
CREATE PROCEDURE sp_get_editoriales()
begin
	select * from proyecto_biblioteca.editoriales;
END //

DELIMITER ;
call sp_get_editoriales();

drop procedure if exists sp_get_autor;
DELIMITER //

CREATE PROCEDURE sp_get_autor()
begin
	select * from proyecto_biblioteca.autor;
END //

DELIMITER ;

call sp_get_autor(); 

drop procedure if exists sp_get_libros;
DELIMITER //
CREATE PROCEDURE sp_get_libros()
begin
	select * from proyecto_biblioteca.libros;
END //

DELIMITER ;
call sp_get_libros();


create table venta_libros (
id_venta int auto_increment primary key,
titulo varchar (60),
precio_venta_libro decimal (15,2),
costo_libro decimal (15,2)
);

select * from venta_libros;

insert into venta_libros values( null,'Apegos feroces',800.00,500.00),
(null,'Mirarse de frente',1100.00,700.00),
(null,'la mujer singular y la ciudad',500.00,300.00),
(null,'El Instituto',1800.00,1500.00), (null,'El Pistolero',2600.00,2300.00),(null,'IT',2800.00,2500.00), 
(null,'Matar a un Ruiseñor',1350.00,950.00),(null,'Ve y pone un centinela',1300.00,1050.00),
(null,'To kill a Mockingbird',650.00,450.00),(null,'Las aventiras de Tom Sawyer',1300.00,1000.00),
(null,'El Cuervo',1100.00,850.00),(null,'El Escarabajo de Oro',2900.00,2600.00),
(null,'Cien Años de Soledad',1800.00,1500.00),(null,'Amor en los tiempos de Cólera',850.00,650.00),
(null,'Noticias de un Secuestro',850.00,550.00),(null,'Noticias de un Secuestro',3100.00,2800.00),
(null,'Noticias de un Secuestro',1000.00,750.00),(null,'La mirada quieta',900.00,650.00),
(null,'La Ciudad y los Perros',1600.00,1300.00),
(null,'La fiesta del Chivo',900.00,650.00),(null,'El Centauro',1300.00,850.00),
(null,'La Casa de los espíritus',1300.00,900.00),(null,'Más allá del Invierno',1850.00,1560.00),
(null,'Cien Sonetos de Amor',1200.00,800.00),(null,'Canto General',1850.00,1550.00),(null,'El Tunel',1350.00,960.00),
(null,'Sobre Héroes y Tumbas',650.00,450.00),(null,'La Resistencia',1600.00,1200.00);



SELECT 
    id_venta,
    titulo,
    costo_libro,
    CONCAT("$ ", precio_venta_libro) AS venta_display
FROM venta_libros;

SELECT 
    id_venta,
    titulo,
    precio_venta_libro,
    CONCAT("$ ", costo_libro) AS costo_display
FROM venta_libros;



select sum(costo_libro) as total_costo from venta_libros;
select sum(precio_venta_libro) as total_venta from venta_libros;

select * from proyecto_biblioteca.libros where autor = 'Pablo Neruda';

-- unión de 2 tablas
SELECT *
FROM clientes
INNER JOIN prestamos
ON clientes.id_cliente_lector = prestamos.id_cliente_lector;

SELECT *
FROM libros
INNER JOIN venta_libros
ON libros.titulo = venta_libros.titulo;

select *
from prestamos
inner join libros
on prestamos.id_libros = libros.id_libros;

-- CREACION DE FUNCION
DELIMITER $$

CREATE FUNCTION fn_ganancia_neta(venta_id INT) RETURNS decimal (15,2)
deterministic
    no sql
BEGIN
    DECLARE diferenciaPrecio decimal (15,2);
    select 
    (precio_venta_libro - costo_libro) INTO diferenciaPrecio
from venta_libros where id_venta = venta_id;

    RETURN diferenciaPrecio;
END $$

DELIMITER ;

select fn_ganancia_neta(2);

select id_venta, titulo, precio_venta_libro, costo_libro, (precio_venta_libro - costo_libro) as diferenciaPrecio
from venta_libros;