/*
Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)

1. Listar datos personales de clientes cuyo apellido comience con el string ‘Pe’. Ordenar por DNI
*/

SELECT nombre, apellido, DNI, telefono, direccion
FROM Cliente
WHERE apellido LIKE 'Pe%'
ORDER BY DNI
