-- Creación de la Vista
Create View VW_Pedidos
As
Select P.ID_Pedido, O.Titulo, A.Apellidos, A.Nombres From Pedidos P
Inner Join Obras O ON O.ID_Obra = P.ID_Obra
Inner Join Artistas A ON A.ID_Artista = O.ID_Artista
go
-- Modificación de la Vista
Alter View VW_Pedidos
As
Select P.ID_Pedido, O.ID_Tipo, P.Fecha, O.Titulo, A.Apellidos, A.Nombres,
Case
When P.Cancelado =1 Then 'Si'
Else 'No'
End As Cancelado,
P.Motivo
From Pedidos P
Inner Join Obras O ON O.ID_Obra = P.ID_Obra
Inner Join Artistas A ON A.ID_Artista = O.ID_Artista
Go
-- Selección de la Vista
Select * From VW_Pedidos
