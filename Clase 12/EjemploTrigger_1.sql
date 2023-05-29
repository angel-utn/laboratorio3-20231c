-- Crear un trigger que al eliminar un pedido este se cancele. Solamente puede cancelarse si el mismo no tiene una venta asociada.
Create Trigger TR_CancelarPedido ON Pedidos
instead of delete
as
Begin
    Declare @IDPedido int
    SELECT @IDPedido = ID_Pedido From deleted

    Declare @ExistePedido int
    SELECT @ExistePedido = Count(*) From Ventas Where ID_Pedido = @IDPedido

    If @ExistePedido = 0 Begin
         Update Pedidos Set Cancelado = 1 Where ID_Pedido = @IDPedido
    End
    Else Begin
        Raiserror('No se puede eliminar el pedido porque ya fue vendido', 16, 0)
    End
End

Select * From Pedidos
Select * From Ventas

-- Debería cancelar el pedido en lugar de borrarlo
Delete From Pedidos Where ID_Pedido = 17

-- Debería mostrar un mensaje de error
Delete from Pedidos Where ID_Pedido = 1


