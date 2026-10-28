/*
Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)

3. Listar nombre, descripción, precio y stock de productos vendidos al cliente con DNI 45789456,
pero que no fueron vendidos a clientes de apellido ‘Garcia’.
*/

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Detalle d ON (d.idProducto = p.idProducto)
INNER JOIN Factura f ON (f.nroTicket = d.nroTicket)
INNER JOIN Cliente c ON (c.idCliente = f.idCliente)
WHERE c.DNI = 45789456
EXCEPT (
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Detalle d ON (d.idProducto = p.idProducto)
INNER JOIN Factura f ON (f.nroTicket = d.nroTicket)
INNER JOIN Cliente c ON (c.idCliente = f.idCliente)
WHERE c.apellido = 'Garcia'
)
