/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

9. Modificar el nombre de la banda ‘Mempis la Blusera’ a: ‘Memphis la Blusera’.
*/

UPDATE Banda SET nombreBanda='Memphis la Blusera' WHERE nombreBanda='Mempis la Blusera'
