Use VentaDeArte
go
set Dateformat 'YMD'
go
-- Artistas
INSERT INTO Artistas (Apellidos, Nombres, Pseudonimo)
VALUES ('Rodriguez', 'Maria', 'Maria Rodriguez'),
       ('Nomis', 'Legna', NULL),
       ('Alvarez', 'Marta', 'M. A.'),
       ('Hernandez', 'Juan', 'Juan H.'),
       (NULL, NULL, 'DaniKlost'),
       ('Gonzalez', 'Carlos', 'Carlos G.'),
       ('Fernandez', 'Laura', NULL),
       (NULL, 'Ana', 'Ana Artista'),
       ('Martinez', NULL, 'Martinez Art'),
       ('Garcia', NULL, NULL)

-- Tipos de Obras
INSERT INTO TiposDeObra (Tipo)
VALUES ('Pintura'),
       ('Escultura'),
       ('Fotografia'),
       ('Grabado'),
       ('Arte digital'),
       ('Instalacion'),
       ('Arte conceptual')

-- Obras
INSERT INTO Obras(ID_Artista, ID_Tipo, Titulo, FechaInicio, FechaFin, Costo, Venta) VALUES
(2, 4, 'La Ciudad de los Sueños', '2020-08-23', '2022-02-12', 120000, 150000),
(5, 1, 'Sin Titulo 1', '2020-05-10', null, 75000, 95000),
(1, 2, 'Ocaso', '2022-01-15', null, 90000, 110000),
(3, 3, 'La Naturaleza que Gime', '2021-07-05', '2023-01-01', 200000, 250000),
(2, 2, 'Cielo en Llamas', '2022-02-28', null, 100000, 120000),
(4, 1, 'Composicion Geometrica', '2020-09-10', '2022-05-15', 85000, 100000),
(6, 4, 'Recuerdos del Futuro', '2023-01-10', null, 150000, 180000),
(1, 1, 'Luz y Sombra', '2021-04-20', '2023-08-08', 180000, 220000),
(5, 3, 'Sueños de Otoño', '2022-06-12', null, 80000, 95000),
(2, 1, 'La Nube Roja', '2020-11-05', '2022-12-30', 130000, 160000),
(3, 2, 'La Catedral de las Sombras', '2022-03-20', null, 110000, 130000),
(4, 3, 'Jardin de Cristal', '2021-09-18', '2023-04-30', 190000, 250000),
(6, 1, 'El Grito del Alma', '2020-06-25', null, 95000, 120000),
(1, 4, 'Ecos del Pasado', '2022-05-01', null, 140000, 170000),
(5, 2, 'Eclipse de Luna', '2021-11-12', '2023-06-30', 120000, 150000);

-- Materiales
INSERT INTO Materiales (Nombre)
VALUES ('Oleo'),
       ('Acrilico'),
       ('Carboncillo'),
       ('Pastel'),
       ('Bronce'),
       ('Marmol'),
       ('Arcilla'),
       ('Resina'),
       ('Papel fotografico'),
       ('Tinta'),
       ('Serigrafia'),
       ('Aguafuerte'),
       ('Video proyeccion'),
       ('Pantalla LCD'),
       ('Luz LED'),
       ('Cable HDMI'),
       ('Madera'),
       ('Vidrio'),
       ('Acero'),
       ('Aluminio')

-- Materiales_x_Obra
INSERT INTO Materiales_x_Obra(ID_Obra, ID_Material, Cantidad) VALUES
(1, 1, 3),
(1, 2, 2),
(1, 9, 1),
(2, 1, 4),
(2, 2, 2),
(2, 4, 1),
(2, 11, 2),
(3, 2, 3),
(3, 6, 1),
(3, 7, 2),
(3, 8, 1),
(4, 3, 2),
(4, 6, 3),
(4, 9, 1),
(5, 1, 3),
(5, 2, 2),
(5, 10, 1),
(6, 1, 2),
(6, 2, 1),
(6, 5, 1),
(7, 4, 2),
(7, 5, 1),
(7, 6, 1),
(7, 7, 2),
(8, 1, 3),
(8, 2, 1),
(8, 9, 2),
(9, 1, 2),
(9, 2, 2),
(9, 10, 1),
(10, 1, 3),
(10, 2, 2),
(10, 5, 1),
(11, 2, 2),
(11, 5, 1),
(11, 6, 2),
(12, 3, 2),
(12, 6, 1),
(12, 8, 1),
(12, 12, 2),
(13, 11, 2),
(13, 12, 1),
(13, 13, 1),
(13, 14, 1),
(14, 1, 2),
(14, 2, 2),
(14, 15, 1),
(15, 4, 2),
(15, 5, 1),
(15, 6, 1),
(15, 7, 2);

-- Provincias
INSERT INTO Provincias (Nombre) VALUES
('Buenos Aires'),
('Cordoba'),
('Santa Fe'),
('Mendoza'),
('Salta');

-- Localidades de Buenos Aires
INSERT INTO Localidades (ID_Provincia, Nombre) VALUES
(1, 'La Plata'),
(1, 'Mar del Plata'),
(1, 'Bahia Blanca'),
(1, 'San Isidro'),
(1, 'Tandil'),
(1, 'Junin'),
(1, 'Chivilcoy'),
(1, 'Lobos');

-- Localidades de Cordoba
INSERT INTO Localidades (ID_Provincia, Nombre) VALUES
(2, 'Cordoba'),
(2, 'Villa Carlos Paz'),
(2, 'Rio Cuarto'),
(2, 'Jesus Maria'),
(2, 'Bell Ville'),
(2, 'Rio Tercero'),
(2, 'Villa Maria'),
(2, 'Morteros');

-- Localidades de Santa Fe
INSERT INTO Localidades (ID_Provincia, Nombre) VALUES
(3, 'Rosario'),
(3, 'Santa Fe'),
(3, 'Venado Tuerto'),
(3, 'Rafaela'),
(3, 'San Lorenzo'),
(3, 'Esperanza'),
(3, 'Sunchales'),
(3, 'Firmat');

-- Localidades de Mendoza
INSERT INTO Localidades (ID_Provincia, Nombre) VALUES
(4, 'Mendoza'),
(4, 'San Rafael'),
(4, 'San Martin'),
(4, 'Malargüe'),
(4, 'Tunuyan'),
(4, 'Lujan de Cuyo'),
(4, 'General Alvear'),
(4, 'Maipu');

-- Localidades de Salta
INSERT INTO Localidades (ID_Provincia, Nombre) VALUES
(5, 'Salta'),
(5, 'San Ramon de la Nueva Oran'),
(5, 'General Güemes'),
(5, 'Cafayate'),
(5, 'San Antonio de los Cobres'),
(5, 'Rosario de la Frontera'),
(5, 'Metan'),
(5, 'La Merced');


-- Clientes
INSERT INTO Clientes (Apellidos, Nombres, FechaNacimiento, Email, Celular, Telefono, Domicilio, ID_Localidad) VALUES
('Garcia', 'Mariana', '1983-09-20', 'mariana.garcia@gmail.com', '11-1234-5678', null, 'Francia 123', 25),
('Perez', 'Juan', '1981-06-15', 'juan.perez@hotmail.com', null, '11-4567-8901', 'Francia 321', 8),
('Lopez', 'Lucas', '1999-11-10', null, '11-1111-1111', null, 'Calle Corrientes 1234', 20),
('Rodriguez', 'Sofia', '1987-03-03', 'sofia.rodriguez@gmail.com', null, null, 'Av. Libertador 987', 12),
('Martinez', 'Carlos', '2001-07-01', null, null, '11-5555-5555', 'San Martin 456', 2),
('Gonzalez', 'Laura', '1995-02-22', 'laura.gonzalez@yahoo.com', null, null, 'Av. 9 de Julio 123', 33),
('Alonso', 'Luis', '1980-12-12', null, null, null, 'Reconquista 432', 7),
('Pires', 'Fernando', '1986-09-05', 'fernando.pires@gmail.com', '11-8765-4321', null, 'Florida 999', 15),
('Fernandez', 'Marcela', '2004-01-20', null, null, '11-7777-7777', 'Lavalle 555', 4),
('Castillo', 'Agustina', '1989-08-18', 'agustina.castillo@gmail.com', '11-2222-2222', null, 'Funes 333', 18),
('Chavez', 'Jose', '1997-05-13', null, '11-9999-9999', '11-6666-6666', 'Callao 567', 37),
('Wong', 'Luciana', '2002-12-30', null, null, null, 'Calle Arroyo 678', 27),
('Gutierrez', 'Nicolas', '1984-11-25', 'nicolas.gutierrez@gmail.com', null, null, 'Corrientes 789', 9),
('Santos', 'Valentina', '1993-02-14', null, '11-3333-3333', '11-4444-4444', 'Av. Santa Fe 1010', 31),
('Silva', 'Roberto', '1982-07-07', 'roberto.silva@hotmail.com', '11-0000-0000', null, 'Uruguay 555', 38)
INSERT INTO Clientes (Apellidos, Nombres, FechaNacimiento, Email, Celular, Telefono, Domicilio, ID_Localidad)
VALUES
('Rossi', 'Giovanni', '1985-03-12', 'girossi@gmail.com', NULL, '11-4567-8910', 'Av. Italia 1234', 15),
('Bianchi', 'Antonio', '1998-09-25', NULL, '11-2345-6789', NULL, 'Av. Roma 4321', 20),
('Ricci', 'Sofia', '1993-05-03', 'sofia.ricci@hotmail.com', NULL, NULL, 'Via Napoli 567', 5),
('Moretti', 'Luisa', '1987-12-18', 'luisa.moretti@gmail.com', NULL, NULL, 'Piazza del Popolo 12', 38),
('Romano', 'Marco', '2002-07-28', NULL, NULL, '11-7890-1234', 'Via Vittorio Emanuele II 876', 3),
('De Luca', 'Giancarlo', '1989-11-02', 'giancarlo.deluca@gmail.com', '11-3456-7890', NULL, 'Via dei Giardini 90', 12),
('Ferrari', 'Francesca', '1995-02-14', NULL, NULL, '11-9012-3456', 'Piazza del Duomo 567', 28),
('Esposito', 'Paolo', '1986-08-09', 'paolo.esposito@gmail.com', NULL, NULL, 'Corso Umberto I 432', 11),
('Conti', 'Giorgia', '2000-04-22', NULL, '11-6789-0123', NULL, 'Via Garibaldi 987', 32),
('Pellegrini', 'Elena', '1991-01-31', 'elenapellegrini@hotmail.com', NULL, NULL, 'Via della Repubblica 234', 8),
('Marini', 'Matteo', '1998-06-06', NULL, '11-2345-6789', NULL, 'Via dei Condotti 456', 25),
('Vitale', 'Laura', '1984-09-14', 'laura.vitale@gmail.com', NULL, '11-4567-8910', 'Via Nazionale 1234', 17),
('De Santis', 'Nicola', '1992-11-22', NULL, NULL, '11-8901-2345', 'Via Appia Nuova 678', 21),
('Galli', 'Alessandra', '2001-02-03', 'alessandra.galli@hotmail.com', NULL, NULL, 'Piazza San Pietro 10', 36),
('Leone', 'Fabio', '1983-07-16', NULL, NULL, '11-5678-9012', 'Corso Vittorio Emanuele 345', 2);

-- Pedidos
INSERT INTO Pedidos (ID_Obra, ID_Cliente, Fecha, Cancelado, Motivo)
VALUES
(1, 5, '2022-01-15', 0, ''),
(2, 14, '2022-02-10', 0, ''),
(3, 26, '2022-03-03', 0, ''),
(4, 12, '2022-04-18', 0, ''),
(5, 2, '2022-05-22', 0, ''),
(6, 20, '2022-06-05', 0, ''),
(7, 8, '2022-07-07', 0, ''),
(8, 19, '2022-08-12', 0, ''),
(9, 11, '2022-09-01', 0, ''),
(10, 7, '2022-10-05', 0, ''),
(11, 3, '2022-11-11', 0, ''),
(12, 1, '2022-12-20', 0, ''),
(1, 4, '2023-01-05', 1, 'No le gusta el arte'),
(2, 18, '2023-02-14', 1, 'No tiene el dinero suficiente'),
(3, 4, '2023-03-07', 1, 'Por motivos personales');

-- Ventas
INSERT INTO Ventas(ID_Pedido, Importe, Forma_Pago, Envio_a_domicilio) VALUES
(1, 150000, 'E', 1),
(2, 95000, 'QR', 0),
(3, 250000, 'TC', 1),
(4, 100000, 'TD', 0),
(5, 120000, 'E', 1),
(6, 180000, 'QR', 0),
(7, 220000, 'TC', 1),
(8, 95000, 'TD', 0),
(9, 130000, 'E', 1),
(10, 230000, 'QR', 0),
(11, 120000, 'TC', 1),
(12, 170000, 'TD', 0),
(13, 160000, 'E', 1),
(14, 150000, 'QR', 0),
(15, 120000, 'TC', 1);