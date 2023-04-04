Use Master
drop database VentaDeArte
Create Database VentaDeArte
go
Use VentaDeArte
go
Create Table Artistas(
    ID_Artista bigint not null primary key identity (1, 1),
    Apellidos varchar(100)  null,
    Nombres varchar(100)  null,
    Pseudonimo varchar(100) null
)
go
Create Table TiposDeObra(
    ID_Tipo smallint not null primary key identity (1, 1),
    Tipo varchar(50) not null
)
go
Create Table Obras(
    ID_Obra bigint not null primary key identity (1, 1),
    ID_Artista bigint not null foreign key references Artistas(ID_Artista),
    ID_Tipo smallint not null foreign key references TiposDeObra(ID_Tipo),
    Titulo varchar(100) not null,
    FechaInicio date not null,
    FechaFin date null,
    Costo money not null default(0),
    Venta money not null default(0)
)
go
Create Table Materiales(
    ID_Material bigint not null primary key identity (1, 1),
    Nombre varchar(100) not null
)
go
Create Table Materiales_x_Obra(
    ID_Material bigint not null foreign key references Materiales(ID_Material),
    ID_Obra bigint not null foreign key references Obras(ID_Obra),
    Cantidad smallint not null,
    primary key (ID_Material, ID_Obra)
)
go
Create Table Provincias(
    ID_Provincia int not null primary key identity (1, 1),
    Nombre varchar(50) not null
)
go
Create Table Localidades(
    ID_Localidad int not null primary key identity (1, 1),
    ID_Provincia int not null foreign key references Provincias(ID_Provincia),
    Nombre varchar(50) not null
)
go
Create Table Clientes(
    ID_Cliente bigint not null primary key identity (1, 1),
    Apellidos varchar(100) not null,
    Nombres varchar(100) not null,
    FechaNacimiento date null,
    Email varchar(100)  null,
    Celular varchar(100) null,
    Telefono varchar(100) null,
    Domicilio varchar(200) null,
    ID_Localidad int not null foreign key references Localidades(ID_Localidad)
)
go
Create Table Pedidos(
    ID_Pedido bigint not null primary key identity (1, 1),
    ID_Obra bigint not null foreign key references Obras(ID_Obra),
    ID_Cliente bigint not null foreign key references Clientes(ID_Cliente),
    Fecha date not null,
    Cancelado bit not null default(0),
    Motivo varchar(50) not null
)
go
Create Table Ventas(
    ID_Pedido bigint not null primary key foreign key references Pedidos(ID_Pedido),
    Importe money not null check (Importe > 0),
    Forma_Pago char(2) not null check (Forma_Pago in ('E', 'QR', 'TC', 'TD')),
    Envio_a_domicilio bit not null default (0)
)

