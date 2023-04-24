Alter Table MediosPago
Add MedioPagoElectronico bit not null default (1)
go
Update MediosPago Set MedioPagoElectronico = 0 Where Nombre like 'Efectivo'
go
-- Otro agente
Set dateformat 'YMD'
INSERT INTO Agentes (Legajo, Nombres, Apellidos, FechaNacimiento, FechaIngreso, Email, Telefono, Celular, Activo) VALUES
('A016', 'Legna', 'Nomis', '1986-02-10', '2014-08-30', 'lnomis@utn.edu.ar', '11-2231-8901', NULL, 1)

-- Más multas
INSERT INTO Multas (IdTipoInfraccion, IDLocalidad, IdAgente, Patente, FechaHora, Monto)
VALUES
    (1, 10, 1, 'SQL001', '2023-04-22 09:10:00', 15500),
    (2, 6, 1, 'SQL001', '2023-04-08 18:20:00', 5500),
    (3, 18, 1, 'SQL001', '2023-03-15 13:45:00', 12500),
    (4, 25, 1, 'SQL001', '2023-04-06 16:30:00', 25400),
    (5, 22, 1, 'SQL001', '2023-04-11 11:55:00', 31000),
    (6, 1, 1, 'SQL002', '2023-04-20 14:45:00', 10000),
    (7, 9, 1, 'SQL002', '2023-04-01 15:35:00', 30000),
    (8, 12, 1, 'SQL002', '2023-01-02 10:00:00', 30000),
    (9, 17, 1, 'SQL002', '2023-04-13 19:10:00', 21000),
    (10, 26, 1, 'SQL002', '2023-02-11 11:25:00', 8000),
    (6, 1, null, 'SQL002', '2023-04-20 14:45:00', 10000),
    (7, 9, null, 'SQL002', '2023-04-01 15:35:00', 30000),
    (3, 12, null, 'SQL002', '2023-01-02 10:00:00', 30000)

-- Más pagos
Insert into Pagos(IDMulta, IDMedioPago, Fecha, Importe)
Values(47, 5, getdate(), 25400)
Insert into Pagos(IDMulta, IDMedioPago, Fecha, Importe)
Values(46, 3, getdate(), 25400)
Insert into Pagos(IDMulta, IDMedioPago, Fecha, Importe)
Values(52, 5, getdate(), 15000)
Insert into Pagos(IDMulta, IDMedioPago, Fecha, Importe)
Values(52, 5, getdate(), 15000)
Insert into Pagos(IDMulta, IDMedioPago, Fecha, Importe)
Values(53, 1, getdate(), 20000)
Insert into Pagos(IDMulta, IDMedioPago, Fecha, Importe)
Values(53, 2, getdate(), 1000)