/* Localidad = (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol = (nroArbol, especie, anios, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

5. Reportar DNI, nombre, apellido, fecha de nacimiento y localidad donde viven de aquellos
podadores con apellido terminado con el string ‘ata’ y que tengan al menos una poda durante
2024. Ordenar por apellido y nombre.
*/

SELECT DISTINCT pod.DNI, pod.nombre, pod.apellido, pod.fnac, l.nombreL
FROM Podador pod INNER JOIN Localidad l ON (l.codigoPostal=pod.codigoPostalVive)
INNER JOIN Poda p ON (pod.DNI = p.DNI)
WHERE (pod.apellido LIKE '%ata') AND
EXISTS(
SELECT pod.DNI, pod.nombre, pod.apellido, pod.fnac, l.nombreL
FROM Podador pod INNER JOIN Localidad l ON (l.codigoPostal=pod.codigoPostalVive)
INNER JOIN Poda p ON (pod.DNI = p.DNI)
WHERE (p.fecha BETWEEN '2024-01-01' AND '2024-12-31'))
ORDER BY pod.apellido, pod.nombre
