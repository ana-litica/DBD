/* Localidad = (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol = (nroArbol, especie, anios, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

2. Reportar DNI, nombre, apellido, fecha de nacimiento y localidad donde viven de aquellos
podadores que tengan podas realizadas durante 2023.
*/

SELECT DISTINCT p.DNI, p.nombre, p.apellido, p.fnac, l.nombreL
FROM Podador p INNER JOIN Localidad l ON (p.codigoPostalVive = l.codigoPostal)
INNER JOIN Poda pod ON (p.DNI = pod.DNI)
WHERE pod.fecha BETWEEN '2023-01-01' AND '2023-12-31'
