/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

2. Reportar nombre, género musical y año de creación de bandas que hayan realizado recitales
durante 2023, pero no hayan tocado durante 2022 .
*/

SELECT b.nombreBanda, b.genero_musical, b.anio_creacion
FROM Banda b INNER JOIN Recital r ON (b.codigoB=r.codigoB)
WHERE (r.fecha BETWEEN '2023-01-01' AND '2023-12-31') AND
NOT EXISTS(
SELECT *
FROM Recital r2
WHERE (b.codigoB=r2.codigoB) AND (r2.fecha BETWEEN '2022-01-01' AND '2022-12-31')
)
