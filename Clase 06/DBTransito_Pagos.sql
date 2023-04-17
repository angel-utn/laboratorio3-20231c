Create Table MediosPago(
    IDMedioPago tinyint not null primary key identity (1, 1),
    Nombre varchar(50) not null
)

Create Table Pagos(
    IDPago bigint not null primary key identity (1, 1),
    IDMulta int not null foreign key references Multas(IDMulta),
    Importe money not null check (Importe > 0),
    Fecha date not null,
    IDMedioPago tinyint not null foreign key references MediosPago(IDMedioPago)
)

-- Medios de pago
INSERT INTO MediosPago (Nombre) VALUES ('Tarjeta de credito');
INSERT INTO MediosPago (Nombre) VALUES ('Tarjeta de debito');
INSERT INTO MediosPago (Nombre) VALUES ('PayPal');
INSERT INTO MediosPago (Nombre) VALUES ('Transferencia bancaria');
INSERT INTO MediosPago (Nombre) VALUES ('Efectivo');

Set DateFormat 'YMD'

-- Pagos
-- Multa 1
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (1, 15500.00, '2023-02-25', 1);

-- Multa 1 (pago parcial)
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (1, 7000.00, '2023-03-15', 2);

-- Multa 1 (pago parcial)
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (1, 8500.00, '2023-03-20', 3);

-- Multa 3
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (3, 19500.00, '2023-02-25', 1);

-- Multa 3 (pago parcial)
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (3, 1500.00, '2023-03-01', 2);

-- Multa 5
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (5, 32000.00, '2023-02-25', 1);

-- Multa 5 (pago parcial)
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (5, 10000.00, '2023-03-10', 4);

-- Multa 5 (pago parcial)
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (5, 10000.00, '2023-03-15', 2);

-- Multa 5 (pago parcial)
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (5, 2000.00, '2023-03-20', 3);

-- Multa 6
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (6, 13000.00, '2023-02-25', 1);

-- Multa 20
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (20, 24000.00, '2023-03-25', 1);

-- Multa 20 (pago parcial)
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (20, 8000.00, '2023-04-05', 2);

-- Multa 22
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (22, 8000.00, '2023-01-05', 1);

-- Multa 29
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (29, 30000.00, '2023-01-25', 1);

-- Multa 30
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (30, 35000.00, '2023-02-05', 1);

--Multas con ID 31 en adelante

--Pago total de la multa 31 con medio de pago 1
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (31, 10000, '2023-02-25', 1);

--Pagos parciales de la multa 32 con medio de pago 2
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (32, 8000, '2023-02-28', 2);

INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (32, 10000, '2023-03-02', 2);

--Pagos parciales de la multa 33 con medio de pago 3
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (33, 8000, '2023-03-05', 3);

INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (33, 5000, '2023-03-07', 3);

--Pago total de la multa 34 con medio de pago 4
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (34, 8000, '2023-03-09', 4);

--Pagos parciales de la multa 35 con medio de pago 5
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (35, 10000, '2023-03-12', 5);

INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (35, 12000, '2023-03-15', 5);

--Pago total de la multa 36 con medio de pago 1
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (36, 12000, '2023-03-18', 1);

--Pagos parciales de la multa 37 con medio de pago 2
INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (37, 4000, '2023-03-21', 2);

INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (37, 6000, '2023-03-24', 2);

INSERT INTO Pagos (IDMulta, Importe, Fecha, IDMedioPago)
VALUES (37, 1000, '2023-03-27', 2);

-- Agrego multas adicionales
INSERT INTO Multas (IdTipoInfraccion, IDLocalidad, IdAgente, Patente, FechaHora, Monto)
VALUES(1, 4, 6, 'AB123CD', '2023-03-22 19:10:00', 54000)

INSERT INTO Multas (IdTipoInfraccion, IDLocalidad, IdAgente, Patente, FechaHora, Monto)
VALUES(1, 3, 6, 'CDE567', '2023-03-26 19:10:00', 25000)

INSERT INTO Multas (IdTipoInfraccion, IDLocalidad, IdAgente, Patente, FechaHora, Monto)
VALUES(3, 3, 6, 'IJ567KL', '2023-03-16 12:10:00', 15000)
