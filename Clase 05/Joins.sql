-- Listado de Obras con título, tipo de obra, valor de la obra y apellido y nombre del artista.
Select O.Titulo, TDO.Tipo As Categoria, O.Venta, A.Apellidos, A.Nombres
From Obras As O
inner Join TiposDeObra As TDO on O.ID_Tipo = TDO.ID_Tipo
inner Join Artistas As A ON A.ID_Artista = O.ID_Artista

-- Listado con Pedidos, titulo de la obra y Apellidos y nombres de clientes.
Select P.ID_Pedido, O.Titulo, C.Apellidos, C.Nombres From Pedidos P
Inner Join Obras O ON O.ID_Obra = P.ID_Obra
Inner Join Clientes C ON C.ID_Cliente = P.ID_Cliente
order by O.Titulo Asc

-- Listado con Pedidos, titulo de la obra y Apellidos y nombres de clientes. Agregar aquellos clientes sin pedidos.
Select P.ID_Pedido, O.Titulo, C.Apellidos, C.Nombres From Pedidos P
Inner Join Obras O ON O.ID_Obra = P.ID_Obra
right Join Clientes C ON C.ID_Cliente = P.ID_Cliente
order by O.Titulo Asc

-- Por cada obra, el título y el nombre del material utilizado
Select O.Titulo, M.Nombre, MxO.Cantidad, TDO.Tipo
From Obras O
Inner Join Materiales_x_Obra MxO ON O.ID_Obra = MxO.ID_Obra
Inner Join Materiales M ON M.ID_Material = MxO.ID_Material
Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
Order by O.Titulo Asc

-- Producto cartesiano entre Obras y Tipos de obra.  (Obras x TipoObra)
Select O.Titulo, TDO.Tipo
From Obras O
Cross Join TiposDeObra TDO
Order by O.Titulo Asc

-- Apellidos y nombres de los clientes que nunca hicieron un pedido.
Select C.Apellidos, C.Nombres From Pedidos P
right Join Clientes C ON C.ID_Cliente = P.ID_Cliente
where P.ID_Pedido is null

-- Apellidos y nombres, sin repetir, de los clientes que hicieron pedidos en el 2023.
Select distinct C.Apellidos, C.Nombres From Clientes C
Inner Join Pedidos P ON P.ID_Cliente = C.ID_Cliente
Where Year(P.Fecha) = 2023

-- Apellidos y nombres de los clientes que nunca hicieron un pedido y apellidos y nombres de los clientes que hicieron pedidos en 2023.
Select C.Apellidos, C.Nombres From Pedidos P
right Join Clientes C ON C.ID_Cliente = P.ID_Cliente
where P.ID_Pedido is null
Union
Select distinct C.Apellidos, C.Nombres From Clientes C
Inner Join Pedidos P ON P.ID_Cliente = C.ID_Cliente
Where Year(P.Fecha) = 2023
