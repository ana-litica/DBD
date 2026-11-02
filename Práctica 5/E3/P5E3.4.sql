/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

4. Listar DNI, nombre, apellido,email de integrantes que hayan tocado en el escenario con nombre
‘Gustavo Cerati’ y en el escenario con nombre ‘Carlos Gardel’.
*/

SELECT i.DNI, i.nombre, i.apellido, i.email
FROM Integrante i
WHERE EXISTS (
SELECT *
FROM Recital INNER JOIN Escenario ON (Recital.nroEscenario=Escenario.nroEscenario)
INNER JOIN Banda ON (Recital.codigoB=Banda.codigoB)
WHERE i.codigoB=Banda.codigoB AND Escenario.nombre_escenario='Carlos Gardel'
)
AND EXISTS (
SELECT *
FROM Recital INNER JOIN Escenario ON (Recital.nroEscenario=Escenario.nroEscenario)
INNER JOIN Banda ON (Recital.codigoB=Banda.codigoB)
WHERE i.codigoB=Banda.codigoB AND Escenario.nombre_escenario='Gustavo Cerati'
)
