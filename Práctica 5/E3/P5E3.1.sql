/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

1. Listar DNI, nombre, apellido,dirección y email de integrantes nacidos entre 1980 y 1990 y que
hayan realizado algún recital durante 2023.
*/

SELECT i.DNI, i.nombre, i.apellido, i.direccion, i.email
FROM Integrante i
WHERE i.fecha_nacimiento BETWEEN '1980-01-01' AND '1990-12-31'
INTERSECT (
SELECT i.DNI, i.nombre, i.apellido, i.direccion, i.email
FROM Recital r INNER JOIN Banda b ON (r.codigoB=b.codigoB)
INNER JOIN Integrante i ON (i.codigoB=b.codigoB)
WHERE r.fecha BETWEEN '2023-01-01' AND '2023-12-31'
)
