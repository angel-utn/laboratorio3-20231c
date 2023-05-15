-- SP_ObrasAutor

Create Procedure SP_ObrasAutor(
    @ID_Artista bigint
)
As
Begin
    Select O.Titulo, TDO.Tipo as 'Tipo de Obra', O.Costo, O.Venta 
    From Obras O 
    Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
    Where @ID_Artista = O.ID_Artista
End
Go
Alter Procedure SP_ObrasAutor(
    @ID_Artista bigint
)
As
Begin
    Select O.Titulo, TDO.Tipo as 'Tipo de Obra', O.Costo, O.Venta, O.Venta - O.Costo as 'Ganancia Teorica' 
    From Obras O 
    Inner Join TiposDeObra TDO ON TDO.ID_Tipo = O.ID_Tipo
    Where @ID_Artista = O.ID_Artista
End

Exec SP_ObrasAutor 1

go

Create Procedure SP_AgregarPedido(
    @ID_Obra bigint,
    @ID_Cliente bigint,
    @Fecha date
)
As
Begin
    Insert Into Pedidos(ID_Obra, ID_Cliente, Fecha, Cancelado, Motivo)
    Values (@ID_Obra, @ID_Cliente, @Fecha, 0, '') 
End

Go

Alter Procedure SP_AgregarPedido(
    @ID_Obra bigint,
    @ID_Cliente bigint,
    @Fecha date
)
As
Begin
    
    Declare @Cant bit
    Set @Cant = (
                    Select count(*) From Pedidos 
                    Where ID_Obra = @ID_Obra And 
                    ID_Cliente = @ID_Cliente And
                    Cancelado = 0
                )
    
    If @Cant = 0 Begin 
        Insert Into Pedidos(ID_Obra, ID_Cliente, Fecha, Cancelado, Motivo)
        Values (@ID_Obra, @ID_Cliente, @Fecha, 0, '') 
    End
    Else Begin
        RAISERROR ('Este cliente ya ha realizado un pedido para esta obra', 16, 0)
    End
End
Go
Create Procedure SP_CancelarPedido(
    @ID_Pedido bigint,
    @Motivo varchar(50)
)
As
Begin
    Update Pedidos Set Motivo = @Motivo, Cancelado = 1 Where ID_Pedido = @ID_Pedido
End

Exec SP_CancelarPedido 16, 'Clase de Laboratorio III'

Declare @FechaHoy DateTime
Set @FechaHoy = getdate()
Exec SP_AgregarPedido 15, 6, @FechaHoy


