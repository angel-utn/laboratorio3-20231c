Create Database DBTransito
go
Use DBTransito
go
Create Table Multas(
    IDMulta int not null primary key identity (1, 1),
    IDLocalidad int not null, 
    IDTipoInfraccion int not null,
    IDAgente int null,
    Patente varchar(10) not null,
    Monto money not null,
    FechaHora datetime not null,
    Pagada bit not null default(0)
)
go
Create Table Agentes(
    IDAgente int not null primary key identity (1, 1),
    Legajo varchar(10) not null,
    Nombres varchar(50) not null,
    Apellidos varchar(50) not null,
    FechaNacimiento date not null,
    FechaIngreso date not null,
    Sueldo money not null default(100000),
    Email varchar(100) null,
    Telefono varchar(20) null,
    Celular varchar(20) null,
    Activo bit not null default(1)
)
Go
Create Table TipoInfracciones(
    IDTipoInfraccion int not null primary key identity(1, 1),
    Descripcion varchar(100),
    ImporteReferencia money not null
)
Go
Create Table Localidades(
    IDLocalidad int not null primary key identity (1, 1),
    Localidad varchar(150) not null,
    IDProvincia int not null
)
Go
Create Table Provincias(
    IDProvincia int not null primary key identity (1, 1),
    Provincia varchar(50) not null
)
Go
-- Restricciones Multas
Alter Table Multas
Add Constraint FK_Multas_Localidades Foreign Key (IDLocalidad) References Localidades(IDLocalidad)
Go
Alter Table Multas
Add Constraint FK_Multas_TipoInfracciones Foreign Key (IDTipoInfraccion) References TipoInfracciones(IDTipoInfraccion)
Go
Alter Table Multas
Add Constraint FK_Multas_Agentes Foreign Key (IDAgente) References Agentes(IDAgente)
GO
Alter Table Multas
Add Constraint CHK_Monto_Positivo Check(Monto > 0)
go
-- Restricciones Agentes
Alter Table Agentes
Add Constraint UQ_Legajo Unique(Legajo)
go
-- Restricciones Localidades
Alter Table Localidades
Add Constraint FK_Localidades_Provincias Foreign key (IDProvincia) References Provincias(IDProvincia)
go
-- Agregamos una columna, la modificamos y luego la borramos
Alter Table Agentes
Add EstadoCivil varchar(20) null
go
Alter Table Agentes
Alter Column EstadoCivil varchar(50) not null
go
Alter Table Agentes
Drop Column EstadoCivil