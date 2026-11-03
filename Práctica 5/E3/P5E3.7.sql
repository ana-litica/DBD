/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

7. Listar nombre, género musical y año de creación de bandas que hayan realizado recitales en
escenarios cubiertos durante 2023.// cubierto es true, false según corresponda
*/

SELECT nombreBanda, genero_musical, anio_creacion
FROM Banda b
WHERE EXISTS(
SELECT *
FROM Recital r INNER JOIN Escenario e ON (r.nroEscenario=e.nroEscenario)
WHERE b.codigoB=r.codigoB AND e.cubierto=true AND (r.fecha BETWEEN '2023-01-01' AND '2023-12-31')
)
