/* Localidad = (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol = (nroArbol, especie, anios, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

Listar DNI, apellido, nombre, teléfono y fecha de nacimiento de podadores que solo podaron
árboles de especie ‘Coníferas’.
*/

SELECT p.DNI, p.apellido, p.nombre, p.telefono, p.fnac
FROM Poda pod INNER JOIN Podador p ON (p.DNI=pod.DNI)
INNER JOIN Arbol a ON (pod.nroArbol=a.nroArbol)
WHERE (a.especie='Conífera') AND
NOT EXISTS(
SELECT *
FROM Poda pod INNER JOIN Podador p ON (p.DNI=pod.DNI)
INNER JOIN Arbol a ON (pod.nroArbol=a.nroArbol)
WHERE p.DNI=p.DNI AND a.especie <> 'Conífera')
