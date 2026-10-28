/*
Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)

1.2. Listar nombre, apellido, DNI, teléfono y dirección de clientes que realizaron compras solamente
durante 2024.
*/

SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c INNER JOIN Factura f ON (c.idCliente=f.idCliente)
WHERE (fecha BETWEEN '2024-01-01' and '2024-12-31')
EXCEPT (
SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c INNER JOIN Factura f ON (c.idCliente=f.idCliente)
WHERE (f.fecha< '2024-01-01' or f.fecha>'2024-12-31')
)
