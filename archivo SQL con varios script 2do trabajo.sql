
-- proyecto_biblioteca
-- Creación de tabla por archivo insertado

create table Biblioteca(
id_Biblioteca int auto_increment primary key,
nombre varchar (100),
ciudad varchar (100)
);

select *
from biblioteca b ;

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

-- CREACIÓN DE STORED PROCEDURES
call sp_get_clientes();

call sp_get_editoriales();

call sp_get_autor(); 

call sp_get_libros();

-- CREACIÓN DE VISTAS
create view vista_autor as (select nombre, nacionalidad from autor a);
select * from vista_autor va ;

create view vista_editoriales as (select nombre_editorial from editoriales);

select * from vista_editoriales ve ;

create view vista_empleados as 
(select nombre,nacionalidad from empleados);

select * from vista_empleados ve ;

create or replace view vista_libros as (select id_libros ,titulo,autor from libros l);

select * from vista_libros vl ;

create or replace view vista_prestamos as(select id_libros, fecha_prestamo,fecha_devolucion from prestamos);

select * from vista_prestamos vp ;


-- CREACIÓN DE TRIGGERS
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