/*Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)

10. Listar DNI, apellido y nombre de clientes donde el monto total comprado, teniendo en cuenta
todas sus facturas, supere $100000.*/

SELECT c.DNI, c.apellido, c.nombre
FROM Cliente c INNER JOIN Factura f ON (c.idCliente = f.idCliente)
GROUP BY c.DNI, c.apellido, c.nombre
HAVING SUM(f.total) > 100000.00
