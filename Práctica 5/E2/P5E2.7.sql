/* Localidad = (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol = (nroArbol, especie, anios, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

7. Listar especies de árboles que se encuentren en la localidad de ‘La Plata’ y también en la
localidad de ‘Salta’.
*/

SELECT a.especie
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal=l.codigoPostal)
WHERE l.nombreL='La Plata'
INTERSECT (
SELECT a.especie
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal=l.codigoPostal)
WHERE l.nombreL='Salta'
)
