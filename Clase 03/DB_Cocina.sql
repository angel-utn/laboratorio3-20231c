Create Database CocinApp
GO
Use CocinApp
go
Create Table Platos(
    IDPlato int not null primary key identity (1, 1),
    Nombre varchar(50) not null,
    TiempoCoccion smallint not null check (TiempoCoccion > 0)
)
go
Create Table Ingredientes(
    IDIngrediente int not null primary key identity (1, 1),
    Nombre varchar(100) not null,
    Vegano bit,
    Vegetariano bit,
    AptoCeliaco bit
)
go
Create Table Recetas(
    IDIngrediente int foreign key references Ingredientes(IDIngrediente),
    IDPlato int foreign key references Platos(IDPlato),
    Cantidad decimal(6, 2) null,
    UnidadMedida varchar(50) not null,
    primary key (IDIngrediente, IDPlato)
)
