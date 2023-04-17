-- Listar las localidades en las que no se hayan registrado multas.

-- LOCALIDADES (UNIVERSO: LOCALIDADES) -  LOCALIDADES CON MULTAS(MULTAS) = LOCALIDADES SIN MULTAS

SELECT L.*, P.Provincia 
FROM Localidades L
Left Join Multas M ON M.IDLocalidad = L.IDLocalidad
Inner Join Provincias P ON P.IDProvincia = L.IDProvincia
where M.IdMulta Is Null

-- Listar el ID de la multa, la patente, el monto y el importe de referencia a partir del tipo de infracción cometida. También incluir una columna llamada TipoDeImporte a partir de las siguientes condiciones:
-- 'Punitorio' si el monto de la multa es mayor al importe de referencia
-- 'Leve' si el monto de la multa es menor al importe de referencia
-- 'Justo' si el monto de la multa es igual al importe de referencia

Select M.IDMulta, M.Patente, M.Monto as ImporteReal, TI.ImporteReferencia,
Case
    When M.Monto > TI.ImporteReferencia Then 'Punitorio'
    When M.Monto < TI.ImporteReferencia Then 'Leve'
    Else 'Justo'
End As 'TipoDeImporte'
From Multas M
Inner Join TipoInfracciones TI ON TI.IdTipoInfraccion = M.IdTipoInfraccion