Select *, Datediff(Day, FechaInicio, FechaFin) Demora From Obras where FechaFin is not null

Select Avg(
    Cast(
        Datediff(Day, FechaInicio, FechaFin) 
        as Decimal(10, 2))
) as PromedioDemoraDias From Obras where FechaFin is not null
