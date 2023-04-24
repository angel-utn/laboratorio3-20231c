-- Las obras cuyo costo sea superior al costo promedio
select * from obras where Costo > (
    select avg(costo) from obras
)

-- Las obras cuyo valor de venta sea superior al de toda obra de tipo 'Pintura'
-- Las obras cuyo valor de venta sea superior a cualquier obra de tipo 'Pintura'
-- Las obras cuyo valor de venta sea superior a la obra de tipo 'Pintura' más cara
 
 -- Manera 1
select * from obras where Venta > (
    select Top 1 Venta from Obras O
    Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
    Where TDO.Tipo = 'Pintura' order by Venta desc
)

-- Manera 2
select * from obras where Venta > (
    select Max(Venta) from Obras O
    Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
    Where TDO.Tipo = 'Pintura'
)

-- Manera 3
Select * From Obras Where Venta > All(
    select Venta from Obras O
    Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
    Where TDO.Tipo = 'Pintura'
)

-- Las obras cuyo valor de venta sea superior al de alguna obra de tipo 'Pintura'
-- Las obras cuyo valor de venta sea superior al menos la más barata de las obras de tipo 'Pintura'
 -- Manera 1
select * from obras where Venta > (
    select Top 1 Venta from Obras O
    Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
    Where TDO.Tipo = 'Pintura' order by Venta asc
)

-- Manera 2
select * from obras where Venta > (
    select Min(Venta) from Obras O
    Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
    Where TDO.Tipo = 'Pintura'
)

-- Manera 3
Select * From Obras Where Venta > Any(
    select Venta from Obras O
    Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
    Where TDO.Tipo = 'Pintura'
)

-- Los datos completos de los artistas que no registran obras
-- Artistas (Universo) - Obras (Artistas que registran obras) ---> (Artistas que no registras obras)

Select * From Artistas Where ID_Artista Not In (
    Select distinct ID_Artista From Obras
)

-- Por cada cliente, apellidos y nombres y la cantidad de pedidos cancelados y la cantidad de pedidos no cancelados.

select Cli.ID_Cliente, Cli.Apellidos, Cli.Nombres, 
 (
    Select count(*) from Pedidos P where P.Cancelado = 1 And P.ID_Cliente = Cli.ID_Cliente
 ) as CantPedidosCancelados,
(
    Select count(*) from Pedidos P where P.Cancelado = 0 And P.ID_Cliente = Cli.ID_Cliente
) as CantPedidosNoCancelados
from Clientes Cli

-- Por cada artista, los apellidos, nombres y seudonimos y la cantidad de obras realizadas iniciadas en el año 2020 la cantidad de obras realizadas iniciadas en el año 2021 y la cantidad de obras realizadas iniciadas en el año 2022
Select A.Apellidos, A.Nombres, A.Pseudonimo,
(
    Select Count(*) From Obras O Where Year(O.FechaInicio) = 2020 And O.ID_Artista = A.ID_Artista
) as Cant2020,
(
    Select Count(*) From Obras O Where Year(O.FechaInicio) = 2021 And O.ID_Artista = A.ID_Artista
) as Cant2021,
(
    Select Count(*) From Obras O Where Year(O.FechaInicio) = 2022 And O.ID_Artista = A.ID_Artista
) as Cant2022
From Artistas A

-- Los artistas que tengan obras iniciadas en el 2020 pero no en el 2021.
Select * From (
    Select A.Apellidos, A.Nombres, A.Pseudonimo,
    (
        Select Count(*) From Obras O Where Year(O.FechaInicio) = 2020 And O.ID_Artista = A.ID_Artista
    ) as Cant2020,
    (
        Select Count(*) From Obras O Where Year(O.FechaInicio) = 2021 And O.ID_Artista = A.ID_Artista
    ) as Cant2021,
    (
        Select Count(*) From Obras O Where Year(O.FechaInicio) = 2022 And O.ID_Artista = A.ID_Artista
    ) as Cant2022
    From Artistas A
) As Aux
Where Aux.Cant2020 > 0 And Aux.Cant2021 = 0