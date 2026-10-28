/*
Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)

4. Listar nombre, descripción, precio y stock de productos no vendidos a clientes que tengan
teléfono con característica 221 (la característica está al comienzo del teléfono). Ordenar por
nombre.
*/

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
EXCEPT (
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON d.nroTicket=f.nroTicket
INNER JOIN Cliente c ON c.idCliente=f.idCliente
WHERE c.telefono LIKE '221%'
)
ORDER BY nombreP
