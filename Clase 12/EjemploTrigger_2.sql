--Crear un trigger que al ingresar una venta no permita que el importe de la misma se encuentre por debajo del valor de costo de la obra. Es decir, puede diferir del precio de venta de la obra pero nunca comprarse a un valor menor al costo.
Create Trigger TR_NuevaVenta ON Ventas
After Insert
As
BEGIN
    Begin transaction
        Declare @Importe money
        Declare @CostoObra money
        Declare @IDPedido int
        Select @Importe = Importe, @IDPedido = ID_Pedido from inserted

        Select @CostoObra = O.Costo From Obras O
        Inner Join Pedidos P ON P.ID_Obra = O.ID_Obra
        where P.ID_Pedido = @IDPedido

        If @Importe < @CostoObra Begin
            Rollback transaction
        End
        Else Begin
            Commit Transaction    
        End
End

Select * from Pedidos
Select * From Obras Where ID_Obra = 15;
Select * From Ventas

-- Venta no se registra
Insert into Ventas(ID_Pedido, Importe, Forma_Pago, Envio_a_domicilio)
Values (17, 1, 'TC', 1)

-- Venta sí debería registrarse
Insert into Ventas(ID_Pedido, Importe, Forma_Pago, Envio_a_domicilio)
Values (17, 120001, 'TC', 1)

