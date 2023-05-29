-- Código de Federico

Create PROCEDURE SP_ProcesarPagos
as
BEGIN
UPDATE Multas
SET
        Pagada = 1      
WHERE Multas.Monto <= (SELECT ISNULL(SUM(PAGOS.Importe), 0)
FROM Pagos WHERE MULTAS.IdMulta = PAGOS.IdMulta)
END

EXEC SP_ProcesarPagos

-- Código alternativo truchito
    Select 'UPDATE MULTAS SET PAGADA = ' + 
    CAST(
    Case
    When Monto < (SELECT ISNULL(SUM(P.Importe), 0)
    FROM Pagos P WHERE M.IdMulta = P.IdMulta) Then 1
    Else 0
    End As varchar(5)) + ' WHERE IDMULTA = ' + Cast(IDMulta as varchar(5))
    From Multas M