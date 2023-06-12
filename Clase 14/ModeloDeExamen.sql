-- Hacer un procedimiento almacenado llamado SP_Ranking que a partir de un IDParticipante se pueda obtener las tres mejores fotografías publicadas (si las hay). Indicando el nombre del concurso, apellido y nombres del participante, el título de la publicación, la fecha de publicación y el puntaje promedio obtenido por esa publicación.

Alter Procedure SP_Ranking(
    @IDParticipante bigint
)
As
Begin
    Select Top 3 With Ties C.Titulo As Concurso, P.Apellidos, P.Nombres, F.Titulo, F.Publicacion, AVG(V.Puntaje) as PProm
    From Concursos C
    Inner Join Fotografias F ON C.ID = F.IDConcurso
    Inner Join Participantes P ON P.ID = F.IDParticipante
    Inner Join Votaciones V ON F.ID = V.IDFotografia
    Where P.ID = @IDParticipante
    Group By C.Titulo, P.Apellidos, P.Nombres, F.Titulo, F.Publicacion
    Order by PProm Desc
End

Exec SP_Ranking 2

Go

-- Hacer un procedimiento almacenado llamado SP_Descalificar que reciba un ID de fotografía y realice la descalificación de la misma. También debe eliminar todas las votaciones registradas a la fotografía en cuestión. Sólo se puede descalificar una fotografía si pertenece a un concurso no finalizado.

Alter Procedure SP_Descalificar(
    @IDFotografia bigint
)
As
Begin
    -- El concurso no tiene que haber finalizado
    Declare @Vigente int
    
    Select @Vigente = Count(*) From Concursos C
    Inner Join Fotografias F ON C.ID = F.IDConcurso
    Where F.ID = @IDFotografia And Getdate() <= C.Fin

    begin try
    If @Vigente = 1 Begin
        Begin transaction
        -- Update para descalificar
        Update Fotografias Set Descalificada = 1 Where ID = @IDFotografia

        -- Votacion hacer delete
        Delete From Votaciones Where IDFotografia = @IDFotografia
        commit transaction
    End
    ELSE Begin
        Raiserror('No se puede eliminar la fotografia porque el concurso finalizó', 16, 0)
    End
    end try
    begin catch
        if @@TRANCOUNT > 0 Begin
            rollback transaction
        End
        print error_message()
    end catch
End
Go
-- Fotografia del concurso 1, No debe permitir la descalificación
-- Fotografia #1
Exec SP_Descalificar 1
Go
-- Fotografia del concurso 3, Puede descalificar
-- Fotografia #2 tiene 2 votaciones (6 y 7)
Exec SP_Descalificar 2
Go

-- Al insertar una fotografía verificar que el usuario creador de la fotografía tenga el ranking suficiente para participar en el concurso. También se debe verificar que el concurso haya iniciado y no finalizado. Si ocurriese un error, mostrarlo con un mensaje aclaratorio. De lo contrario, insertar el registro teniendo en cuenta que la fecha de publicación es la fecha y hora del sistema.
Create Trigger TR_Insertar_Fotografia on Fotografias
Instead Of Insert
As
Begin
    Declare @IDParticipante bigint
    Declare @IDConcurso bigint
    Select @IDParticipante = IDParticipante, @IDConcurso = IDConcurso From inserted

    -- Concurso iniciado y no finalizado
    Declare @Vigente int
    
    Select @Vigente = Count(*) From Concursos C
    Where Getdate() between C.Inicio AND C.Fin And C.ID = @IDConcurso

    If @Vigente = 0 Begin
        Raiserror('El concurso no está vigente', 16, 1)
        Return
    End

    Declare @RankingParticipante decimal(5, 2)
    Declare @RankingConcurso decimal(5, 2)
    
    Select @RankingConcurso = RankingMinimo From Concursos Where ID = @IDConcurso
    
    select @RankingParticipante = IsNull(AVG(v.Puntaje),0)  
    FROM Votaciones v JOIN Fotografias f on v.IDFotografia = f.ID 
    WHERE f.IDParticipante = @IDParticipante

    -- Ranking del participante >= Concurso 
    if @RankingParticipante < @RankingConcurso Begin
        Raiserror('No posee el ranking suficiente', 16, 0)
        Return
    End

    Insert into Fotografias
    Select IDParticipante, IDConcurso, Titulo, 0, getdate() From inserted

End


-- Falla insert porque concurso finalizó
insert into Fotografias(IDParticipante, IDConcurso, Titulo, Descalificada, Publicacion)
Values(1, 2, 'No deberia guardarlo', 0, getdate())

-- Falla insert porque ranking no es suficiente
insert into Fotografias(IDParticipante, IDConcurso, Titulo, Descalificada, Publicacion)
Values(1, 4, 'No le da el ranking', 0, getdate())

    --  select IDParticipante, Isnull(AVG(v.Puntaje),0)  
    --  FROM Votaciones v JOIN Fotografias f on v.IDFotografia = f.ID 
    --  group by IDParticipante

-- Al insertar una votación, verificar que el usuario que vota no lo haga más de una vez para el mismo concurso ni se pueda votar a sí mismo. Tampoco puede votar una fotografía descalificada. Si ninguna validación lo impide insertar el registro de lo contrario, informarlo con un mensaje de error.
Go
Alter Trigger TR_Nueva_Votacion on Votaciones
After Insert
AS
Begin
    Begin try
        Begin Transaction
        Declare @Descalificada bit
        Declare @IDFotografia bigint, @IDVotante bigint, @IDVotado bigint, @IDConcurso bigint
        Declare @CantidadVotosConcurso int

        Select @IDFotografia = IDFotografia, @IDVotante = IDVotante from inserted

        Select @IDConcurso = IDConcurso, @IDVotado = IDParticipante, @Descalificada = Descalificada
        From Fotografias
        Where ID = @IDFotografia

        -- No puede la fotografía estar descalificada
        If @Descalificada = 1 Begin
            Raiserror('No se puede votar una fotografía descalificada', 16, 0)
        End
        -- No puede votarse a sí mismo
        IF @IDVotante = @IDVotado Begin
            Raiserror('No se puede votar a sí mismo', 16, 0)
        End
        -- No puede votar más de una vez para el mismo concurso
        Select @CantidadVotosConcurso = Count(*) From Votaciones V
        Inner Join Fotografias F ON F.ID = V.IDFotografia
        Where V.IDVotante = @IDVotante And F.IDConcurso = @IDConcurso

        If @CantidadVotosConcurso > 1 Begin
            Raiserror('El votante ya votó en ese concurso', 16, 0)
        End

        Commit Transaction
    End Try
    Begin Catch
        ROLLBACK Transaction
        Print Error_Message()
    End Catch
End 

-- Falla por fotografía descalificada
Insert into Votaciones(IDVotante, IDFotografia, Fecha, Puntaje)
Values (1, 2, getdate(), 10)

-- Falla por votarse a sí mismo
Insert into Votaciones(IDVotante, IDFotografia, Fecha, Puntaje)
Values (1, 1, getdate(), 10)

-- Falla por votar más de una vez el mismo concurso
Insert into Votaciones(IDVotante, IDFotografia, Fecha, Puntaje)
Values (9, 12, getdate(), 10)

-- OK
Insert into Votaciones(IDVotante, IDFotografia, Fecha, Puntaje)
Values (10, 12, getdate(), 10)

-- Hacer un listado en el que se obtenga: ID de participante, apellidos y nombres de los participantes que hayan registrado al menos dos fotografías descalificadas.
Select P.ID, P.Apellidos, P.Nombres, Count(*) as CantDescalificadas
From Participantes P
Inner Join Fotografias F ON P.ID = F.IDParticipante
Where F.Descalificada = 1
Group by P.ID, P.Apellidos, P.Nombres
Having Count(*) >= 2