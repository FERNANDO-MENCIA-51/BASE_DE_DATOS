-- Crear base de datos HandsLabs
CREATE DATABASE HandsLabs;

USE HandsLabs;
-- Crear la tabla CLIENTE
CREATE TABLE CLIENTE (
    codigo VARCHAR(3) PRIMARY KEY,
    DNI INT(8) UNIQUE,
    CorreoElectronico VARCHAR(255) UNIQUE,
    Nombre VARCHAR(255),
    Estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

-- Insertar datos en la tabla CLIENTE
INSERT INTO CLIENTE (codigo, Nombre, DNI, CorreoElectronico)
VALUES
('C01', 'BARRIOS PALOMINO, Eugenio', 78451211, 'eugenio@yahoo.com'),
('C02', 'TARAZONA MEZA, Carolina', 78451212, 'carolina.tarazona@yahoo.com'),
('C03', 'MARTINEZ CAMPOS, Roberto', 7412598, 'roberto.martinez@gmail.com'),
('C04', 'RODRIGUEZ GUERRA, Claudia', 15253698, 'claudia.rodriguez@outlook.com'),
('C05', 'HUAMAN PEREZ, Julio', 45123698, 'julio.huaman@gmail.com'),
('C06', 'MANCO AVILA, Marcos', 45781236, 'marco.manco@yahoo.com'),
('C07', 'TAIPE CARMEÑO, Micaela', 45127733, 'micaela.taipe@gmail.com'),
('C08', 'ORE VASQUEZ, Pedro', 15253364, 'pedro.ore@gmail.com'),
('C09', 'PALOMINO FARFAN, Yolanda', 15223364, 'yolanda.palomino@outlook.com'),
('C10', 'SANCHEZ ROMERO, Luisa', 11223365, 'luisa.sanchez@gmail.com');

select * from CLIENTE;

-- Crear la tabla EMPLEADO
CREATE TABLE EMPLEADO (
    codigo VARCHAR(3) PRIMARY KEY,
    Empleado varchar(90),
    TipoEmpleado ENUM('V', 'A'),
    EstadoCivil ENUM('S', 'C', 'D'),
    CorreoElectronico VARCHAR(255) UNIQUE,
    Sexo ENUM('M', 'F'),
    HorasTrabajoMensual INT CHECK(HorasTrabajoMensual <= 160),
    Estado ENUM('Activo', 'Inactivo'),
    PagoPorHora DECIMAL(6, 2) CHECK(PagoPorHora <= 12)
);

-- Insertar datos en la tabla EMPLEADO
INSERT INTO EMPLEADO (codigo, Empleado, TipoEmpleado, EstadoCivil, CorreoElectronico, Sexo, HorasTrabajoMensual, Estado, PagoPorHora)
VALUES
('E01','MARTINEZ OCARES, Eulalo', 'V', 'S', 'eulalio.martinez@laempresa.com',  120, 'Activo', 11.00),
('E02','LOMBARDI GUERRA, Mario', 'V', 'C', 'mario.lombardi2@laempresa.com',  110, 'Activo', 10.00),
('E03', 'RODRIGUEZ ROJAS , Bruno', 'A',  'S', 'bruno.rodriguez@laempresa.com', 160, 'Activo', 12.00),
('E04', 'PARRA GRAU, Bernardo', 'A', 'C', 'bernardo.parra@laempresa.com',  160, 'Activo', 12.00),
('E05', 'BENAVIDES CENTENO, Yolanda', 'C', 'M', 'yolanda.benavides@laempresa.com',  100, 'Activo', 8.00),
('E06', 'OSCORIMA PEÑA, Fabian', 'V', 'S', 'fabian.oxcorima@laempresa.com',  125, 'Activo', 8.00);

select * from EMPLEADO;


-- Crear la tabla PRODUCTO
CREATE TABLE PRODUCTO (
    codigo VARCHAR(3) PRIMARY KEY,
    Producto varchar(90),
    Marca varchar(90),
    color varchar(90),
    Stock INT NOT NULL DEFAULT 0,
    Precio DECIMAL(6, 2) NOT NULL DEFAULT 0,
    Descripcion varchar(255),
    Estado ENUM('A', 'I') DEFAULT 'A'
);

-- Insertar datos en la tabla PRODUCTO
INSERT INTO PRODUCTO (codigo, Producto, Marca, Color, Stock, Precio, Descripcion, Estado)
VALUES
('P01', 'Combo inalambrico de teclado y mouse', 'Logitech', 'Negro', 60, 32.75, 'Facil de usar: este combo de teclado y mouse inalambrico', 'A'),
('P02', 'Monitor led ultradelgado sin marco', 'Sceptre', 'Negro Rojo', 50, 120.42, 'Perfil ultra delgado de 24 pulgadas', 'A'),
('P03', 'Mouse inalambrico para computador', 'Logitech', 'Negro', 75, 75.35, 'Comodidad  hora tras hora con este mouse de diseño ergonomico', 'A'),
('P04', 'AMD Ryzen 7 5800X procesador', 'AMD', '', 120, 245.88, 'AMD El procesador de 8 nucleos mas rapido para escritorio principal', 'A'),
('P05', 'Lenovo idealpad gaming 3 - 2022', 'Lenovo', 'Azul', 135, 599.99, 'Aumenta el rendimiento de tu juego con los procesadores AMD Ryzen serie 6000', 'A'),
('P06', 'TP-LINK AC1750-Enrutador WIFI', 'TP-LINK', 'Negro', 92, 53.99, 'El enrutador de internet inalambrico funciona  con alexa  compatible con todos los dispositivos WI-FI', 'A'),
('P07', 'Camara web C920e HD 1080p', 'Logitech', 'Negro', 72, 66.99, 'La camara web C0920e cuenta con dos microfonos omnidirecionales integrados ', 'A'),
('P08', 'Estacion de acomplamiento USB C', 'WAVLINK', 'Gris', 65, 55.87, 'Base USB C 12 en 1: PLug and Play', 'A');
select * from PRODUCTO;



-- Crear tabla VENTA
CREATE TABLE VENTA (
    CodigoVenta INT AUTO_INCREMENT PRIMARY KEY,
    FechaVenta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Cliente VARCHAR(3),
    Vendedor VARCHAR(3),
    TipoPago ENUM('E', 'T', 'Y'),
    Estado ENUM('A', 'I')
);

-- Insertar datos en la tabla VENTA
INSERT INTO VENTA (Cliente, Vendedor, TipoPago, Estado)
VALUES
('MARTINEZ CAMPOS, Roberto ', 'LOMBARDI GUERRA, Maria', 'E', 'A'),
('TARAZONA MEZA, Carolina', 'PARRA GRAU, Bernardo', 'T', 'A'),
('HUAMAN PEREZ, Julio', 'BENAVIDES, CENTENO, Yolanda', 'Y', 'A'),
('ORE VASQUEZ, Pedro', 'MARTINEZ OCARES, Eulalio', 'E', 'A');

select * FROM  VENTA;


-- Crear tabla VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    IDVentaDetalle INT AUTO_INCREMENT PRIMARY KEY,
    VentaCodigo INT,
    ProductoCodigo VARCHAR(3),
    Cantidad INT NOT NULL CHECK(Cantidad >= 1),
    FOREIGN KEY (ProductoCodigo) REFERENCES PRODUCTO(codigo)
);

-- Insertar datos en la tabla VENTA_DETALLE
INSERT INTO VENTA_DETALLE (VentaCodigo, ProductoCodigo, Cantidad)
VALUES
(1, 'P01', 3),
(2, 'P02', 2),
(3, 'P03', 1),
(4, 'P04', 3),
(5, 'P01', 2);

SELECT * FROM VENTA_DETALLE;

