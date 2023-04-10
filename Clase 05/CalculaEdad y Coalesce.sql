Select * from Agentes

-- ID, Legajo, Apellidos y nombres, FechaNacimiento, Edad
Select IDAgente, Legajo, Apellidos, Nombres, FechaNacimiento,
DateDiff(Year, FechaNacimiento, getdate()) - 
Case
    When Month(getdate()) < Month(FechaNacimiento) Or (Month(getdate()) = Month(FechaNacimiento) And Day(getdate()) < Day(FechaNacimiento)) Then 1
    Else 0
End
 as Edad,
DateDiff(Year, 0, Getdate() - Cast(FechaNacimiento as Datetime)) As EdadReferenciaOK
From Agentes
go

Select * From Agentes

-- Email, Celular, Telefono, 'Incontactable'

Select IDAgente, Apellidos, Nombres, 
IsNull(Email, IsNull(Celular, IsNull(Telefono, 'Incontactable'))) as DatosContacto From Agentes

Select IDAgente, Apellidos, Nombres,
Case 
    When Email Is null And Celular is null and Telefono is null then 'Incontactable'
    When Email Is null And Celular is null then Telefono
    When Email Is null Then Celular
    Else Email
End As DatosContacto
From Agentes

Select IDAgente, Apellidos, Nombres, Coalesce(Email, Celular, Telefono, 'Incontactable') as DatosContacto From Agentes