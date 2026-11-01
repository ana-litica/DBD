/* Localidad = (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol = (nroArbol, especie, anios, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

9. Reportar nombre, descripción y cantidad de habitantes de localidades que tengan menos de 5
árboles.
*/

SELECT l.nombreL, l.descripcion, l.nroHabitantes
FROM Localidad l INNER JOIN Arbol a ON (l.codigoPostal=a.codigoPostal)
GROUP BY l.codigoPostal, l.nombreL, l.descripcion, l.nroHabitantes
HAVING COUNT(*) <5
