/*
Localidad = (codigoPostal, nombreL, descripcion, nroHabitantes)
Arbol = (nroArbol, especie, anios, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

1. Listar especie, años, calle, nro y localidad de árboles podados por el podador ‘Juan Perez’ y por
el podador ‘Jose Garcia’.
*/

SELECT a.especie, a. anios, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
INNER JOIN Poda pod ON (pod.nroArbol=a.nroArbol)
INNER JOIN Podador p ON (p.DNI =pod.DNI)
WHERE p.nombre= 'Juan' AND p.apellido='Perez'
INTERSECT
SELECT a.especie, a. anios, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
INNER JOIN Poda pod ON (pod.nroArbol=a.nroArbol)
INNER JOIN Podador p ON (p.DNI =pod.DNI)
WHERE p.nombre= 'Jose' AND p.apellido='Garcia'
