/*
Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)

9. Listar nroTicket, total, fecha, hora para las facturas del cliente  ́Jorge Pérez ́ donde no haya
comprado el producto  ́Z ́.
*/
SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM Cliente c INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
WHERE c.nombre = 'Jorge' AND c.apellido='Perez'
EXCEPT
(
SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM  Factura f INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (p.idProducto= d.idProducto)
WHERE p.nombreP = 'Z'
)
