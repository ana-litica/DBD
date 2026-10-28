/* Localidad = (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol = (nroArbol, especie, anios, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

3. Listar especie, años, calle, nro y localidad de árboles que no fueron podados nunca.
*/

SELECT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
EXCEPT
SELECT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
INNER JOIN Poda p ON (a.nroArbol=p.nroArbol)
