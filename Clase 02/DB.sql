Create Database Clase01
Go
Use Clase01
Go
Create Table Areas(
    ID_Area smallint not null identity(1000, 100) primary key,
    Nombre varchar(50) not null,
    Presupuesto money not null check(Presupuesto > 0),
    Mail varchar(250) not null unique
)
Go
Create Table Empleados(
    Legajo smallint not null primary key,
    ID_Area smallint null foreign key references Areas(ID_Area),
    Apellidos varchar(250) not null,
    Nombres varchar(250) not null,
    Telefono varchar(30) null
)

