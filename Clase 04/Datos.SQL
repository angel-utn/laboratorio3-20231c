Use Master
Use AgenciaTransito

Set DateFormat 'YMD'

INSERT INTO TipoInfracciones (Descripcion, ImporteReferencia) VALUES
('Exceso de velocidad', 10000.00),
('Estacionamiento en lugar prohibido', 7500.00),
('No respetar semaforo en rojo', 25000.00),
('No respetar señal de stop', 12500.00),
('No usar cinturon de seguridad', 5000.00),
('Hablar por telefono mientras se conduce', 7500.00),
('Circular en sentido contrario', 20000.00),
('No llevar luces encendidas en horario nocturno', 10000.00),
('Conducir bajo los efectos del alcohol', 50000.00),
('No respetar carril exclusivo para transporte publico', 1500.00);

INSERT INTO Agentes (Legajo, Nombres, Apellidos, FechaNacimiento, FechaIngreso, Email, Telefono, Celular, Activo) VALUES
('A001', 'Carlos', 'Gomez', '1988-04-15', '2012-07-01', 'carlos.gomez@transito.gov.ar', '11-4567-8901', '15845858625', 1),
('A002', 'Maria', 'Fernandez', '1985-12-10', '2013-01-15', 'maria.fernandez@transito.gov.ar', '11-2345-6789', '154748584', 1),
('A003', 'Juan', 'Lopez', '1990-02-25', '2014-06-30', NULL, '11-3456-7890', NULL, 1),
('A004', 'Ana', 'Perez', '1992-05-08', '2015-02-01', 'ana.perez@transito.gov.ar', NULL, NULL, 1),
('A005', 'Diego', 'Rodriguez', '1986-11-30', '2016-03-15', 'diego.rodriguez@transito.gov.ar', '11-5678-9012', '152623625', 1),
('A006', 'Carla', 'Lopez', '1989-09-12', '2017-01-01', NULL, '11-7890-1234', '154758485', 0),
('A007', 'Pablo', 'Diaz', '1993-07-05', '2012-04-01', 'pablo.diaz@transito.gov.ar', '11-2345-6789', NULL, 0),
('A008', 'Romina', 'Martinez', '1991-04-20', '2013-05-15', NULL, '11-3456-7890', NULL, 1),
('A009', 'Lucas', 'Gutierrez', '1988-02-13', '2014-07-30', 'lucas.gutierrez@transito.gov.ar', NULL, NULL, 1),
('A010', 'Marcela', 'Sanchez', '1995-01-27', '2015-02-01', NULL, NULL, NULL, 1),
('A011', 'Santiago', 'Lopez', '1990-12-18', '2016-04-15', 'santiago.torres@transito.gov.ar', '11-5678-9012', '154785485', 1),
('A012', 'Valentina', 'Suarez', '1992-08-31', '2017-02-01', NULL, '11-7890-1234', NULL, 1),
('A013', 'Gustavo', 'Hernandez', '1987-06-24', '2012-05-01', 'gustavo.hernandez@transito.gov.ar', NULL, NULL, 1),
('A014', 'Julieta', 'Gongora', '1984-03-09', '2013-06-15', NULL, '11-3456-7890', NULL, 1),
('A015', 'Mariano', 'Paz', '1991-01-22', '2014-08-30', 'mariano.paz@transito.gov.ar', '11-4567-8901', NULL, 1)

INSERT INTO Provincias (Provincia)
VALUES ('Buenos Aires'),
       ('Cordoba'),
       ('Santa Fe'),
       ('Mendoza'),
       ('Tucuman');

-- Buenos Aires
INSERT INTO Localidades (Localidad, IDProvincia)
VALUES ('La Plata', 1),
       ('Mar del Plata', 1),
       ('Bahia Blanca', 1),
       ('Lomas de Zamora', 1),
       ('San Nicolas de los Arroyos', 1),
       ('Junin', 1);

-- Cordoba
INSERT INTO Localidades (Localidad, IDProvincia)
VALUES ('Cordoba', 2),
       ('Villa Maria', 2),
       ('Rio Cuarto', 2),
       ('Jesus Maria', 2),
       ('Bell Ville', 2),
       ('San Francisco', 2);

-- Santa Fe
INSERT INTO Localidades (Localidad, IDProvincia)
VALUES ('Rosario', 3),
       ('Santa Fe', 3),
       ('Venado Tuerto', 3),
       ('Rafaela', 3),
       ('Reconquista', 3),
       ('Esperanza', 3);

-- Mendoza
INSERT INTO Localidades (Localidad, IDProvincia)
VALUES ('Mendoza', 4),
       ('San Rafael', 4),
       ('Lujan de Cuyo', 4),
       ('Maipu', 4),
       ('Godoy Cruz', 4),
       ('Malargüe', 4);

-- Tucuman
INSERT INTO Localidades (Localidad, IDProvincia)
VALUES ('San Miguel de Tucuman', 5),
       ('Concepcion', 5),
       ('Banda del Rio Sali', 5),
       ('Yerba Buena', 5),
       ('Aguilares', 5),
       ('Simoca', 5);

INSERT INTO Multas (IdTipoInfraccion, IDLocalidad, IdAgente, Patente, FechaHora, Monto)
VALUES
    (2, 10, 9, 'AB123CD', '2023-02-22 09:10:00', 15500),
    (4, 6, 4, 'CD456EF', '2023-02-08 18:20:00', 25500),
    (8, 18, 12, 'EF789GH', '2023-02-15 13:45:00', 19500),
    (5, 25, 15, 'GH012IJ', '2023-03-06 16:30:00', 25500),
    (1, 22, 5, 'IJ345KL', '2023-02-11 11:55:00', 32000),
    (9, 1, 11, 'KL678MN', '2023-02-20 14:45:00', 13000),
    (6, 9, 13, 'MN901OP', '2023-02-01 15:35:00', 32000),
    (7, 12, 3, 'OP234PQ', '2023-03-02 10:00:00', 37500),
    (3, 17, 10, 'PQ567RS', '2023-03-13 19:10:00', 26000),
    (10, 26, 8, 'RS890TU', '2023-03-11 11:25:00', 8000),
    (2, 24, 12, 'TU123UV', '2023-02-10 17:30:00', 14500),
    (4, 7, 6, 'UV456WX', '2023-03-09 12:45:00', 33500),
    (8, 19, 15, 'WX789YZ', '2023-02-27 08:15:00', 22500),
    (5, 23, 2, 'IJ567KL', '2023-03-08 14:20:00', 35500),
    (1, 2, 1, 'AB123CD', '2023-03-05 10:50:00', 39000),
    (9, 5, 10, 'CD678EF', '2023-03-03 16:10:00', 5000),
    (6, 16, 7, 'EF901GH', '2023-02-13 18:55:00', 12000),
    (7, 28, 9, 'AB123CD', '2023-03-12 09:30:00', 26500),
    (3, 27, 11, 'IJ567KL', '2023-02-23 14:40:00', 17000),
    (10, 13, 14, 'AB123CD', '2023-03-21 11:50:00', 24000),
    (2, 29, 4, 'IJ567KL', '2023-02-18 12:25:00', 13000)

INSERT INTO Multas (IdTipoInfraccion, IDLocalidad, IdAgente, Patente, FechaHora, Monto, Pagada)
VALUES 
(1, 20, 3, 'ABC123', '2023-01-02 08:15:00', 8000, 0),
(5, 17, 7, 'DEF456', '2023-01-04 13:25:00', 20000, 0),
(3, 12, 2, 'GHI789', '2023-01-06 18:35:00', 15000, 0),
(7, 24, 10, 'JKL012', '2023-01-08 22:45:00', 12000, 0),
(2, 6, 11, 'MNO345', '2023-01-11 04:55:00', 25000, 0),
(4, 28, 4, 'PQR678', '2023-01-13 09:05:00', 12000, 0),
(6, 9, 8, 'STU901', '2023-01-16 14:15:00', 8000, 0),
(9, 5, 15, 'VWX234', '2023-01-18 19:25:00', 30000, 0),
(8, 26, 13, 'YZA567', '2023-01-21 00:35:00', 35000, 0),
(1, 14, 1, 'BCD890', '2023-01-23 05:45:00', 10000, 0),
(5, 23, 7, 'EFG123', '2023-01-26 10:55:00', 18000, 0),
(3, 8, 2, 'HIJ456', '2023-02-01 16:05:00', 13000, 0),
(7, 25, 10, 'KLM789', '2023-02-05 21:15:00', 8000, 0),
(2, 1, 11, 'NOP012', '2023-02-10 02:25:00', 22000, 0),
(4, 27, 4, 'QRS345', '2023-02-14 07:35:00', 12000, 0),
(6, 10, 8, 'TUV678', '2023-02-19 12:45:00', 10000, 0),
(9, 2, 15, 'WXY901', '2023-02-23 17:55:00', 37000, 0),
(8, 29, 13, 'ZAB234', '2023-02-27 23:05:00', 26000, 0),
(1, 15, 1, 'CDE567', '2023-03-03 04:15:00', 15000, 0),
(5, 22, 7, 'FGH890', '2023-03-07 09:25:00', 18000, 0)