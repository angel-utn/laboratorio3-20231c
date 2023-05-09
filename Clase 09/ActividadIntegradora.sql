/*
A) El trofeo de oro del torneo es para aquel que haya capturado el pez más pesado entre todos los peces. Puede haber más de un ganador del trofeo. Listar Apellido y nombre, especie de pez que capturó y el pesaje del mismo.
*/
Select Top 1 With Ties PAR.Apellido, PAR.Nombre, ESP.Especie, CAP.Peso
From PARTICIPANTES PAR
Inner Join CAPTURAS CAP ON PAR.IDPARTICIPANTE = CAP.IDPARTICIPANTE
Inner Join ESPECIES ESP ON ESP.IDESPECIE = CAP.IDESPECIE
Order By Peso DEsc

-- Variante Agustín
SELECT P.APELLIDO, P.NOMBRE, E.ESPECIE, C.PESO
FROM PARTICIPANTES P
INNER JOIN CAPTURAS C ON P.IDPARTICIPANTE = C.IDPARTICIPANTE
INNER JOIN ESPECIES E ON C.IDESPECIE = E.IDESPECIE
WHERE (SELECT MAX(PESO) FROM CAPTURAS WHERE IDESPECIE is not null) = C.PESO

/*
    B) Listar todos los participantes que no hayan pescado ningún tipo de bagre.
*/
Select * From PARTICIPANTES Where IDPARTICIPANTE Not In (
    Select Distinct PAR.IDPARTICIPANTE From PARTICIPANTES PAR
    Inner Join CAPTURAS CAP ON PAR.IDPARTICIPANTE = CAP.IDPARTICIPANTE
    Inner Join ESPECIES ESP ON ESP.IDESPECIE = CAP.IDESPECIE
    Where ESP.ESPECIE LIKE '%BAGRE%'
)

/*
    C) Listar los participantes cuyo promedio de pesca (en kilos) sea mayor a 20. Listar apellido, nombre y promedio de kilos. 
*/
Select PAR.IDParticipante, PAR.Apellido, PAR.Nombre, AVG(CAP.PESO) as PromKilos
From PARTICIPANTES PAR
Inner Join CAPTURAS CAP ON PAR.IDPARTICIPANTE = CAP.IDPARTICIPANTE
Where CAP.IDESPECIE IS Not Null
Group By Par.IDPARTICIPANTE, Par.APELLIDO, Par.NOMBRE
Having AVG(CAP.PESO) > 20

Select * From (
    Select PAR.IDParticipante, PAR.Apellido, PAR.Nombre, AVG(CAP.PESO) as PromKilos
    From PARTICIPANTES PAR
    Inner Join CAPTURAS CAP ON PAR.IDPARTICIPANTE = CAP.IDPARTICIPANTE
    Where CAP.IDESPECIE IS Not Null
    Group By Par.IDPARTICIPANTE, Par.APELLIDO, Par.NOMBRE
) As PromedioPorParticipante
Where PromedioPorParticipante.PromKilos > 20

/*
    D) Por cada especie, listar la cantidad de participantes que la han capturado.
*/
SELECT E.ESPECIE, COUNT(DISTINCT IDPARTICIPANTE) as CantParticipantes FROM ESPECIES E
LEFT JOIN CAPTURAS C ON C.IDESPECIE=E.IDESPECIE
GROUP BY ESPECIE

/*
    E) Listar apellido y nombre del participante y nombre de la especie de cada pez que haya capturado el pescador/a. Si alguna especie de pez no ha sido pescado nunca entonces deberá aparecer en el listado de todas formas pero sin relacionarse con ningún pescador. El listado debe aparecer ordenado por nombre de especie de manera creciente. La combinación apellido y nombre y nombre de la especie debe aparecer sólo una vez este listado.
*/
Select Distinct PAR.Apellido, PAR.Nombre, ESP.Especie
From PARTICIPANTES PAR
Inner Join CAPTURAS CAP ON PAR.IDPARTICIPANTE = CAP.IDPARTICIPANTE
Right Join ESPECIES ESP ON ESP.IDESPECIE = CAP.IDESPECIE
Order By ESP.ESPECIE Asc

/*
    F) El trofeo de plata de la competencia se lo adjudica quien haya capturado la mayor cantidad de kilos en total y nunca haya capturado un pez por debajo del peso mínimo de la especie.
*/
Select Top 1 PAR.IDParticipante, Par.Apellido, Par.Nombre, SUM(CAP.Peso) as KilosTotales
From PARTICIPANTES PAR
Inner Join CAPTURAS CAP ON CAP.IDPARTICIPANTE = Par.IDPARTICIPANTE
Where Cap.IDESPECIE Is Not Null And Par.IDPARTICIPANTE Not In (
    Select Distinct PAR.IDPARTICIPANTE
    From PARTICIPANTES PAR
    Inner Join CAPTURAS CAP ON PAR.IDPARTICIPANTE = CAP.IDPARTICIPANTE
    Inner Join ESPECIES ESP ON ESP.IDESPECIE = CAP.IDESPECIE
    Where CAP.PESO < ESP.PESO_MINIMO
)
Group By PAR.IDParticipante, Par.Apellido, Par.Nombre
Order By KilosTotales Desc



-- Cantidad de capturas por persona después de las 20:00. Solamente aquellos que hayan capturado más de una captura.
Select PAR.Apellido, PAR.Nombre, Count(*) as CantCapturasNoche
From PARTICIPANTES PAR
Inner Join CAPTURAS CAP ON PAR.IDPARTICIPANTE = CAP.IDPARTICIPANTE
Inner Join ESPECIES ESP ON ESP.IDESPECIE = CAP.IDESPECIE
Where DatePart(HOUR, CAP.FECHA_HORA) > 20
Group By PAR.APELLIDO, PAR.NOMBRE
Having Count(*) > 1

