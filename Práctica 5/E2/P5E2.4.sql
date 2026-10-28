/* Localidad = (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol = (nroArbol, especie, anios, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

4. Reportar especie, años,calle, nro y localidad de árboles que fueron podados durante 2022 y no
fueron podados durante 2023.
*/

SELECT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Poda p ON (a.nroArbol=p.nroArbol)
INNER JOIN Localidad l ON (a.codigoPostal=l.codigoPostal)
WHERE p.fecha BETWEEN '2022-01-01' AND '2022-12-31'
EXCEPT
SELECT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal=l.codigoPostal)
INNER JOIN Poda p ON (a.nroArbol=p.nroArbol)
WHERE p.fecha BETWEEN '2023-01-01' AND '2023-12-31'
