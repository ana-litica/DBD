/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

8. Reportar para cada escenario, nombre del escenario y cantidad de recitales durante 2024.
*/

SELECT nombre_escenario, COUNT(*) as cantidad_recitales
FROM Escenario INNER JOIN Recital ON (Escenario.nroEscenario=Recital.nroEscenario)
WHERE Recital.fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY Escenario.nroEscenario
