Use MAster
go
drop database AgenciaTransito
go
Create Database AgenciaTransito
Go
Use AgenciaTransito
go
CREATE TABLE Provincias(
    IDProvincia smallint not null primary key identity (1, 1),
    Provincia varchar(50) not null
)
go
CREATE TABLE Localidades(
    IDLocalidad int not null primary key identity (1, 1),
    Localidad varchar(150) not null,
    IDProvincia smallint not null foreign key references Provincias(IDProvincia)
)
Go
CREATE TABLE TipoInfracciones (
    IdTipoInfraccion INT NOT NULL PRIMARY KEY identity (1, 1),
    Descripcion VARCHAR(100),
    ImporteReferencia MONEY NOT NULL
);
go
CREATE TABLE Agentes (
    IdAgente INT NOT NULL PRIMARY KEY identity (1, 1),
    Legajo varchar(10) NOT NULL UNIQUE,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    FechaIngreso DATE NOT NULL,
    Email VARCHAR(100) NULL,
    Telefono VARCHAR(20) NULL,
    Celular VARCHAR(20) NULL,
    Activo BIT NOT NULL
);
GO
CREATE TABLE Multas (
    IdMulta INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
    IdTipoInfraccion INT NOT NULL FOREIGN KEY REFERENCES TipoInfracciones(IdTipoInfraccion),
    IDLocalidad INT NOT NULL FOREIGN KEY REFERENCES Localidades(IDLocalidad),
    IdAgente INT NULL FOREIGN KEY REFERENCES Agentes(IdAgente),
    Patente VARCHAR(10) NOT NULL,
    FechaHora DATETIME NOT NULL,
    Monto MONEY NOT NULL,
    Pagada BIT NOT NULL DEFAULT (0)
);


