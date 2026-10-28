/*Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)

7. Listar nroTicket, total, fecha, hora y DNI del cliente, de aquellas facturas donde se haya
comprado el producto ‘prod38’ o la factura tenga fecha de 2023.
*/

SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM Producto p INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (c.idCliente=f.idCliente)
WHERE p.nombreP = 'prod38'
UNION
SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM Producto p INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (c.idCliente=f.idCliente)
WHERE (f.fecha BETWEEN '2023-01-01' AND '2023-12-31')
