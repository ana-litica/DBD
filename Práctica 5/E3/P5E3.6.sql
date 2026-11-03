/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

6. Listar nombre de escenario, ubicación y descripción de escenarios que solo tuvieron recitales
con el género musical rock and roll. Ordenar por nombre de escenario
*/

SELECT DISTINCT nombre_escenario, ubicacion, descripcion
FROM Escenario e INNER JOIN Recital r ON (e.nroEscenario=r.nroEscenario)
INNER JOIN Banda b ON (b.codigoB=r.codigoB)
WHERE b.genero_musical='Rock' AND NOT EXISTS(
SELECT *
FROM Recital r2 INNER JOIN Banda b2 ON (r2.codigoB=b2.codigoB)
WHERE e.nroEscenario=r2.nroEscenario AND b2.genero_musical<>'Rock'
)
ORDER BY nombre_escenario
