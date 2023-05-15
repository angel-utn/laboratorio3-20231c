Create Function FN_TotalGastoPorArtista(
    @ID_Artista bigint
)
Returns Money
As
Begin
    Declare @Total money
    Select @Total = IsNull(Sum(Costo), 0) From Obras Where ID_Artista = @ID_Artista
    return @Total
End
go
Create Function FN_TotalSaldoDelArtista(
    @ID_Artista bigint
)
Returns Money
As
Begin
    Declare @TotalGasto money
    Declare @TotalIngreso money
    
    Select @TotalGasto = IsNull(Sum(Costo), 0) From Obras Where ID_Artista = @ID_Artista
    
    Select @TotalIngreso = IsNull(Sum(V.Importe), 0) From Ventas V
    Inner Join Pedidos P ON P.ID_Pedido = V.ID_Pedido
    Inner Join Obras O ON O.ID_Obra = P.ID_Obra
    Where O.ID_Artista = @ID_Artista
    

    return @TotalIngreso - @TotalGasto
End

go
Select  A.Apellidos, 
        A.Nombres, 
        dbo.FN_TotalGastoPorArtista(A.ID_Artista) as TotalGasto,
        dbo.FN_TotalSaldoDelArtista(A.ID_Artista) as TotalSaldo
From Artistas A