/*
Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)

6. Listar nombre, apellido, DNI, teléfono y dirección de clientes que compraron los productos con
nombre ‘prod1’ y ‘prod2’ pero nunca compraron el producto con nombre ‘prod3’.
*/
SELECT nombre, apellido, DNI, telefono, direccion
FROM Cliente c INNER JOIN Factura f ON f.idCliente = c.idCliente
INNER JOIN Detalle d ON d.nroTicket = f.nroTicket
INNER JOIN Producto p ON p.idProducto = d.idProducto
WHERE p.nombreP = 'prod1' AND (c.idCliente
IN (
SELECT c.idCliente
FROM Cliente c INNER JOIN Factura f ON f.idCliente = c.idCliente
INNER JOIN Detalle d ON d.nroTicket = f.nroTicket
INNER JOIN Producto p ON p.idProducto = d.idProducto
WHERE p.nombreP = 'prod2'))
EXCEPT(
SELECT nombre, apellido, DNI, telefono, direccion
FROM Cliente c INNER JOIN Factura f ON f.idCliente = c.idCliente
INNER JOIN Detalle d ON d.nroTicket = f.nroTicket
INNER JOIN Producto p ON p.idProducto = d.idProducto
WHERE p.nombreP = 'prod3')
