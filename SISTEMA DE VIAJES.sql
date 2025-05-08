CREATE DATABASE SISTEMA DE VIAJES

CREATE TABLE vendedor (
    id SERIAL PRIMARY KEY, -- Identificador único
    usuario VARCHAR(100) NOT NULL,
    contrasenia VARCHAR(150) UNIQUE NOT NULL,

);

CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY, -- Identificador único
    nombre_apellidos VARCHAR(100) NOT NULL,
    correoelectronico VARCHAR(150) UNIQUE NOT NULL,
    direccion TEXT,
	telefono VARCHAR(15),
    cedula VARCHAR(15) UNIQUE NOT NULL, -- Documento de Identidad
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Fecha de registro en el sistema
);

CREATE TABLE Reserva (
    id SERIAL PRIMARY KEY, -- Identificador único de la reserva
    cliente_id INT NOT NULL REFERENCES Cliente(id), -- Relación con el cliente
    destino VARCHAR(150) NOT NULL, -- Ciudad o país
    origen VARCHAR(150) NOT NULL, -- Ciudad o país
    fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de reserva
    fecha_viaje TIMESTAMP NOT NULL, -- Fecha de viaje
    cantidad_pasajeros INT NOT NULL CHECK (cantidad_pasajeros > 0), -- Al menos 1 pasajero
    clase VARCHAR(50) NOT NULL CHECK (clase IN ('Económica', 'Ejecutiva', 'Primera')), -- Clase de servicio
    precio_total NUMERIC(10, 2) NOT NULL CHECK (precio_total >= 0), -- Precio total
    estado VARCHAR(50) NOT NULL CHECK (estado IN ('Confirmada', 'Pendiente', 'Cancelada')) -- Estado de la reserva
);

CREATE TABLE Pasaje (
    id SERIAL PRIMARY KEY, -- Identificador único del pasaje
    reserva_id INT NOT NULL REFERENCES Reserva(id) ON DELETE CASCADE, -- Relación con la reserva
    pasajero_nombre VARCHAR(150) NOT NULL,
    pasajero_dni VARCHAR(15) NOT NULL, -- Documento de identidad del pasajero
    asiento VARCHAR(10) NOT NULL -- Número de asiento
);

CREATE TABLE Factura (
    id SERIAL PRIMARY KEY, -- Identificador único de la factura
    reserva_id INT NOT NULL REFERENCES Reserva(id) ON DELETE CASCADE, -- Relación con la reserva
    fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de emisión
    metodo_pago VARCHAR(50) NOT NULL CHECK (metodo_pago IN ('Efectivo', 'Tarjeta', 'Transferencia')), -- Método de pago
    subtotal NUMERIC(10, 2) NOT NULL CHECK (monto_total >= 0), -- Monto total
    iva NUMERIC(10, 2) NOT NULL CHECK (impuestos >= 0), -- iva aplicados
	total NUMERIC(10, 2) NOT NULL CHECK (impuestos >= 0), 
    estado VARCHAR(50) NOT NULL CHECK (estado IN ('Pagada', 'Anulada', 'Pendiente')) -- Estado de la factura
);

select * from cliente
select * from factura
select * from reserva
select * from vendedor

DELETE FROM cliente WHERE id = 7;
DELETE FROM factura WHERE id = 11;
DELETE FROM reserva WHERE id = 9;