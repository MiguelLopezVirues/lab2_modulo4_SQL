-- Clientes: Incluye campos como id_cliente (clave primaria), nombre, email, direccion, telefono, pais.
DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes(
	id_cliente SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	direccion VARCHAR(100) NOT NULL,
	telefono VARCHAR(9) NOT NULL CHECK(LENGTH(telefono) = 9),
	pais VARCHAR(30) NOT NULL
);

-- Empleados: Incluye campos como id_empleado (clave primaria), nombre, cargo, email.
DROP TABLE IF EXISTS empleados;
CREATE TABLE empleados(
	id_empleado SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	cargo VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE
);

-- Proveedores: Incluye campos como id_proveedor (clave primaria), nombre, contacto, telefono, direccion.
DROP TABLE IF EXISTS proveedores;
CREATE TABLE proveedores(
	id_proveedor SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	contacto VARCHAR(100) UNIQUE,
	telefono VARCHAR(9) NOT NULL CHECK(LENGTH(telefono) = 9),
	direccion VARCHAR(100) NOT NULL
);


-- Envíos: Incluye campos como id_envio (clave primaria), id_cliente (clave foránea), id_empleado (clave foránea), id_proveedor (clave foránea), fecha_envio, estado, total.
CREATE TABLE envios(
	id_envio SERIAL PRIMARY KEY,
	id_cliente INT,
	id_empleado INT,
	id_proveedor INT,
	fecha_envio DATE NOT NULL,
	estado VARCHAR(30) NOT NULL,
	total INT NOT NULL,
	FOREIGN KEY (id_cliente)
		REFERENCES clientes(id_cliente)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (id_empleado) 
		REFERENCES empleados(id_empleado)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (id_proveedor) 
		REFERENCES proveedores(id_proveedor)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);




-- Detalle de Envíos: Incluye campos como id_detalle (clave primaria), id_envio (clave foránea), producto, cantidad, precio_unitario.
DROP TABLE IF EXISTS detalle_envios;
CREATE TABLE detalle_envios(
	id_detalle SERIAL PRIMARY KEY,
	id_envio INT,
	producto VARCHAR(30),
	cantidad INT NOT NULL,
	precio_unitario DECIMAL(5,2) NOT NULL,
	FOREIGN KEY (id_envio) 
		REFERENCES envios(id_envio)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);



-- Regiones: Incluye campos como id_region (clave primaria), nombre, pais.
DROP TABLE IF EXISTS regiones;
CREATE TABLE regiones(
	id_region SERIAL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	pais VARCHAR(30) NOT NULL
);




/* Ejercicio 2: Inserción de Datos */

-- Inserta al menos 10 clientes en la tabla Clientes.
INSERT INTO clientes (nombre, email, direccion, telefono, pais)
VALUES ('nombre_cliente1', 'cliente_email1@gmail.com', 'calle cliente N1, Madrid', '666777888', 'España'),
('nombre_cliente2', 'cliente_email2@gmail.com', 'calle cliente N2, Madrid', '666777889', 'España'),
('nombre_cliente3', 'cliente_email3@gmail.com', 'calle cliente N3, Madrid', '666777890', 'España'),
('nombre_cliente4', 'cliente_email4@gmail.com', 'calle cliente N4, Madrid', '666777891', 'España'),
('nombre_cliente5', 'cliente_email5@gmail.com', 'calle cliente N5, Madrid', '666777892', 'España'),
('nombre_cliente6', 'cliente_email6@gmail.com', 'calle cliente N6, Madrid', '666777893', 'España'),
('nombre_cliente7', 'cliente_email7@gmail.com', 'calle cliente N7, Madrid', '666777894', 'España'),
('nombre_cliente8', 'cliente_email8@gmail.com', 'calle cliente N8, Madrid', '666777895', 'España'),
('nombre_cliente9', 'cliente_email9@gmail.com', 'calle cliente N9, Madrid', '666777896', 'España'),
('nombre_cliente10', 'cliente_email10@gmail.com', 'calle cliente N10, Madrid', '666777897', 'España'),
('nombre_cliente11', 'cliente_email11@gmail.com', 'calle cliente N11, Madrid', '666777898', 'España');


SELECT * FROM clientes;


-- Inserta al menos 5 empleados en la tabla Empleados.

INSERT INTO  empleados (nombre, cargo, email)
VALUES  ('empleado1', 'pringui', 'empleado_pringui@gmail.com'),
('empleado2', 'menos_pringui', 'empleado_menos_pringui@gmail.com'),
('empleado3', 'neutro', 'empleado_neutro@gmail.com'),
('empleado4', 'carguito', 'empleado_carguito@gmail.com'),
('empleado5', 'jefaso', 'empleado_jefaso@gmail.com');

-- Inserta al menos 3 proveedores en la tabla Proveedores.
INSERT INTO proveedores (nombre, contacto, telefono, direccion)
VALUES ('frutero', 'frutas@gmail.com', '777888999', 'calle de la fruta N1. Chiclana'),
('verdulero', 'verduras@gmail.com', '777889999', 'calle de la verdura N2. Chiclana'),
('carnicero', 'carne@gmail.com', '777899999', 'calle de la carne N3. Chiclana');


-- Inserta al menos 8 envíos en la tabla Envíos, asignando envíos a los clientes, empleados y proveedores registrados.
INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total)
VALUES (1,2,1, '2024-01-01','enviado', 255.5),
(2,2,2, '2024-01-01','recibido', 280.4),
(3,3,3, '2024-01-01','pendiente envio', 300),
(4,4,1, '2024-01-01','recibido', 100.85),
(5,5,2, '2024-01-01','enviado', 80.9),
(6,1,3, '2024-01-01','pendiente envio', 230.75),
(7,2,1, '2024-01-01','enviado', 250.75),
(8,3,2, '2024-01-01','recibido', 120.55);


SELECT * FROM clientes;
SELECT * FROM empleados;
SELECT * FROM proveedores;

-- Inserta los detalles correspondientes en la tabla Detalle de Envíos, asegurando que las cantidades y precios unitarios sean consistentes con los productos y los envíos.
INSERT INTO detalle_envios (id_envio, producto, cantidad, precio_unitario)
VALUES (1, 'rabanos', 10, 25.55),
(2, 'mango', 12, 23.37),
(3, 'ternera', 5, 60.00),
(4, 'calabacin', 2, 50.43),
(5, 'manzana', 8, 10.11),
(6, 'pollo', 9, 25.64),
(7, 'berenjena', 7, 35.82),
(8, 'melon', 6, 20.09);






-- Inserta al menos 5 regiones en la tabla Regiones.
INSERT INTO regiones (nombre, pais)
VALUES ('Cadiz', 'España'),
('Madrid', 'España'),
('Barcelona', 'España'),
('Badajoz', 'España'),
('Murcia', 'España');



/*Ejercicio 3: Modificación y Actualización de Datos*/
-- Actualizar el Estado de un Envío. Actualiza el estado del envío con id_envio = 3 a "Entregado".
UPDATE envios
SET estado = 'Entregado'
WHERE id_envio = 3;

-- Modificar el Cargo de un Empleado. Cambia el cargo del empleado con id_empleado = 5 a "Director de Datos".
UPDATE empleados
SET cargo = 'Director de Datos'
WHERE id_empleado = 5;

-- Incrementar el Precio Unitario de un Producto. Incrementa en un 10% el precio unitario del producto "Producto A" en la tabla Detalle_Envíos.
UPDATE detalle_envios
SET precio_unitario = precio_unitario*1.1
WHERE producto = 'manzana';

UPDATE envios
SET total = total*1.1
WHERE id_envio = 5;

-- Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con id_cliente = 2 a "Nueva Calle B, 123".
UPDATE clientes
SET direccion = 'Nueva Calle B, 123'
WHERE id_cliente = 2;

-- Cambiar el Proveedor de un Envío. Cambia el proveedor del envío con id_envio = 4 al proveedor con id_proveedor = 3.
UPDATE envios
SET id_proveedor = 3
WHERE id_envio = 4;

-- Actualizar la Cantidad de un Producto en un Envío. Modifica la cantidad del producto "Producto C" en el envío con id_envio = 2 a 5 unidades.
UPDATE detalle_envios
SET cantidad = 5
WHERE id_envio = 2 AND producto='mango';

UPDATE envios
SET total = 23.37*5
WHERE id_envio=2;

-- Actualizar el Total de un Envío. Incrementa el total del envío con id_envio = 5 en 50 unidades monetarias.
UPDATE envios
SET total = total + 50
WHERE id_envio = 5;

-- Modificar el Contacto de un Proveedor. Cambia el contacto del proveedor con id_proveedor = 2 a "Nuevo Contacto 2".
UPDATE proveedores
SET contacto = 'Nuevo Contacto 2'
WHERE id_proveedor = 2;

-- Cambiar el País de un Cliente. Actualiza el país del cliente con id_cliente = 6 a "Portugal".
UPDATE clientes
SET pais = 'Portugal'
WHERE id_cliente = 6;

-- Actualizar la Fecha de un Envío. Modifica la fecha del envío con id_envio = 7 a "2024-08-10".
UPDATE envios
SET fecha_envio = '2024-08-10'
WHERE id_envio = 7;


/*Ejercicio 4: Eliminación de Datos*/
-- Añadir una Columna. Añade una columna fecha_nacimiento de tipo DATE a la tabla Clientes.
ALTER TABLE clientes
ADD COLUMN fecha_nacimiento DATE;

-- Añadir una Columna. Añade una columna codigo_postal de tipo VARCHAR(10) a la tabla Proveedores.
ALTER TABLE proveedores
ADD COLUMN codigo_postal VARCHAR(10);

-- Eliminar una Columna. Elimina la columna contacto de la tabla Proveedores.
ALTER TABLE proveedores
DROP COLUMN contacto;

-- Eliminar una Columna. Elimina la columna pais de la tabla Regiones.
ALTER TABLE regiones
DROP COLUMN pais;

-- Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna telefono en la tabla Clientes a VARCHAR(15).
ALTER TABLE clientes
ALTER COLUMN telefono TYPE VARCHAR(15);


-- Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna total en la tabla Envíos a NUMERIC(12, 2).
ALTER TABLE envios
ALTER COLUMN total TYPE NUMERIC(12,2);

-- Añadir una Columna. Añade una columna fecha_contrato de tipo DATE a la tabla Empleados.
ALTER TABLE empleados
ADD COLUMN fecha_contrato DATE;

-- Eliminar una Columna. Elimina la columna estado de la tabla Envíos.
ALTER TABLE envios
DROP COLUMN estado;

-- Modificar el Nombre de una Columna. Modifica el nombre de la columna nombre en la tabla Empleados a nombre_completo.
ALTER TABLE empleados
RENAME COLUMN nombre TO nombre_completo;


/* Ejercicio 5: Contesta a las siguientes preguntas usando queries */

-- 1. Listar todos los clientes que viven en España.
SELECT nombre
FROM clientes
WHERE pais = 'España';

-- 2. Obtener todos los envíos realizados por un empleado específico.
SELECT id_envio
FROM envios
WHERE id_empleado = 2;

-- 3. Listar todos los productos incluidos en un envío específico.
SELECT producto
FROM detalle_envios
WHERE id_envio = 2;

-- 4. Encontrar todos los proveedores con un teléfono específico.
SELECT nombre
FROM proveedores
WHERE telefono = '777888999';

-- 5. Listar los empleados que tienen un cargo de "Supervisor de Envíos".
SELECT nombre_completo
FROM empleados
WHERE cargo = 'pringui';

-- 6. Obtener todos los envíos que fueron realizados por el cliente con id_cliente = 5.
SELECT id_envio
FROM envios
WHERE id_cliente = 5;


-- 7. Listar todas las regiones con su nombre y país.
SELECT * 
FROM regiones; -- NO puedo sacar la columna país porque la hemos borrado anteriormente. Saco todo para que se vea por claridad.

-- 8. Mostrar todos los productos cuyo precio unitario sea mayor que 50.
SELECT producto
FROM detalle_envios 
WHERE precio_unitario > 50;


-- 9. Obtener todos los envíos realizados el 2024-08-05.
SELECT id_envio
FROM envios 
WHERE fecha_envio = '2024-08-05';

-- 10. Listar todos los clientes que tienen un número de teléfono que comienza con "6003".
SELECT nombre
FROM clientes 
WHERE LEFT(telefono,4) = '6003'; 

