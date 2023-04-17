-- La cantidad de obras
-- 
Select count(*) as CantObras From Obras

-- La cantidad de artistas con seudónimo
-- 
Select count(*) as CantSeudoc From Artistas A
Where A.Pseudonimo Is not null

Select Count(A.Pseudonimo) as CantSeudoc2 From Artistas A

Select Count(*) as Cant From Artistas A Where A.Nombres = 'Angel'

-- La cantidad de pedidos en el año 2022
-- 
Select Count(*) As CantPedidos2022 From Pedidos P
Where Year(P.Fecha) = 2022

-- El valor total de venta todas las obras
-- 
Select Sum(O.Venta) As TotalValorizado From Obras O

-- El costo promedio de todas las obras
-- 
Select Avg(O.Costo) As CostoPromedio From Obras O

Select Sum(O.Costo) / Count(O.Costo) AS CostoPromedio2 From Obras O

Select Sum(O.Costo) / Count(*) AS CostoPromedio3 From Obras O

-- El valor de venta más alto de una obra
-- 
Select Max(O.Venta) as ValorMasCostoso From Obras O

Select Top 1 O.Venta as ValorMasCostoso2 From Obras O
Order by O.Venta Desc

-- Por cada artista, la cantidad de obras realizadas
-- 
Select A.ID_Artista, A.Apellidos, Count(*) as CantObras
From Artistas A
Inner Join Obras O ON A.ID_Artista = O.ID_Artista
Group By A.ID_Artista, A.Apellidos


-- Por cada tipo de obra, la cantidad de obras realizadas
-- 
Select TDO.Tipo, Count(O.ID_Obra) as Cant
From TiposDeObra TDO
Left Join Obras O ON TDO.ID_Tipo = O.ID_Tipo
Group by TDO.Tipo


-- Por cada artista, la cantidad de materiales distintos utilizados entre todas sus obras
-- 
Select A.ID_Artista, A.Apellidos, Count(distinct MxO.ID_Material) as Cantidad 
From Artistas A
Inner Join Obras O ON A.ID_Artista = O.ID_Artista
Inner Join Materiales_x_Obra MxO ON O.ID_Obra = MxO.ID_Obra
Group By A.ID_Artista, A.Apellidos

-- Por cada cliente, el importe total abonado en concepto de compras
-- 

-- Por cada material y tipo de obra, la cantidad total de obras de dicho material y tipo
-- 

-- Por cada artista, el precio de la obra más cara que haya publicado
-- 

-- El artista que haya publicado la obra más cara
-- 

-- Los artistas que hayan invertido más de 300000 en total en sus obras
-- 
Select A.ID_Artista, A.Apellidos, Sum(O.Costo) as TotalInversion
From Artistas A
Inner Join Obras O ON A.ID_Artista = O.ID_Artista
Group By A.ID_Artista, A.Apellidos
Having Sum(O.Costo) > 300000


-- Los artistas que hayan invertido entre 150000 y 200000 en total en sus obras
-- 

-- Por cada obra, el título y una columna con todos los materiales utilizados separados por coma
--
Select O.Titulo, M.Nombre From Obras O
Inner Join Materiales_x_Obra MxO ON O.ID_Obra = MxO.ID_Obra
Inner Join Materiales M ON M.ID_Material = MxO.ID_Material
order by O.titulo asc, M.Nombre asc

Select O.Titulo, STRING_AGG(M.Nombre, ';') as MaterialesUtilizados
From Obras O
Inner Join Materiales_x_Obra MxO ON O.ID_Obra = MxO.ID_Obra
Inner Join Materiales M ON M.ID_Material = MxO.ID_Material
Group By O.Titulo