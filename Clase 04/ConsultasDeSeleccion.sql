Use VentaDeArte
go
Select *, Venta / 100 As VentaUSD, Year(FechaInicio) as AñoInicio From Obras
go
Select *, Apellidos + ', ' + Nombres + ' (' + Pseudonimo + ')' Artista from Artistas
go
Select Apellidos, Nombres, IsNull(Pseudonimo, 'Anonimo') as Pseudonimo From Artistas
go
-- Todos los datos de las obras cuyo costo sea mayor a $ 95000 y que se hayan iniciado en 2020
Select * from Obras Where Costo > 95000 and Year(FechaInicio) = 2020

-- Todos datos de las obras cuyo IDTipo sea 4 o que sean del IDartista 6
Select * From Obras Where ID_Tipo = 4 or ID_Artista = 6

-- Todos los datos de las obras realizadas por los artistas con ID 1, 3, 5 y 7
Select * From Obras Where ID_Artista = 1 or ID_Artista = 3 or ID_Artista = 5 or ID_Artista = 7

Select * From Obras Where ID_Artista in (1, 3, 5, 7)

-- Todos los datos de las obras no realizadas por los artistas con ID 1, 3, 5 y 7
Select * From Obras Where ID_Artista <> 1 and ID_Artista <> 3 And ID_Artista <> 5 And ID_Artista <> 7

Select * From Obras Where ID_Artista not in (1, 3, 5, 7)

-- Todos los datos de las obras cuyo costo se encuentre entre $ 100000 y $ 150000 (intervalo cerrado)
Select * From Obras Where Costo >= 100000 and Costo <= 150000

Select * From Obras Where Costo  between 100000 and 150000

-- Apellidos y nombres de los clientes que tengan telefono, pero no mail
Select Apellidos, Nombres, Telefono, Email from Clientes Where Telefono is not null And Email is null

Select * From Clientes Order By FechaNacimiento desc

Select Top 1 with ties * From Obras order by Venta desc

-- Mostrame todos los precios de venta de las obras
Select distinct Venta from Obras order by Venta desc

-- Like
-------
-- Todos los datos de clientes cuyo apellido comience con P,L o M y tenga 5 caracteres en total
Select * from Clientes Where Apellidos Like '[PLM]____'

-- Todos los datos de clientes cuyo apellido contenga la LL
Select * From Clientes Where Apellidos Like '%LL%'

-- Todos los datos de clientes cuyo nombre comience y termine con vocal
Select * From Clientes Where Nombres Like '[AEIOU]%[AEIOU]'

-- Todos los datos de clientes cuyo nombre no comience con vocal y termine con vocal
Select * From Clientes Where Nombres Like '[^AEIOU]%[AEIOU]'