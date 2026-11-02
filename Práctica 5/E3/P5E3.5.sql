/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

5. Reportar nombre, género musical y año de creación de bandas que tengan más de 5 integrantes.
*/

SELECT nombreBanda, genero_musical, anio_creacion, COUNT(*) as cantidad_integrantes
FROM Integrante INNER JOIN Banda ON (Banda.codigoB=Integrante.codigoB)
GROUP BY nombreBanda,genero_musical,anio_creacion
HAVING COUNT(Integrante.codigoB)>5
