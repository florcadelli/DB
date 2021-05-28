-- PRIMERA PARTE --------------------------------------------

-- Listar los clientes que hayan realizado compras durante el año 1996.
-- El listado debe contener las siguientes columnas:
-- Nombre y la inicial del apellido. Por ejemplo en lugar de 'Mario Pontes' debe decir 'Mario P.'
-- El título todo el mayúscula.



/*2.	Listar las facturas para las cuales el envío haya sido a una ciudad distinta a la ciudad del cliente. 
Considerar únicamente a los clientes de UK.
a.	El listado debe incluir:
b.	El número de factura completando con ceros a la izquierda 8 posiciones. Por ejemplo, 00001234.
c.	La fecha de la factura en formato YYYY-MM-DD. Por ejemplo 1996-12-01,
d.	La ciudad del cliente.
e.	La ciudad de destino.*/

/*
select concat("000",facturas.FacturaID) as "fecha factura", DATE_FORMAT(facturas.FechaFactura, '%Y-%m-%d') as "fecha factura" ,facturas.ciudadEnvio as "ciudad envio", clientes.ciudad as "ciudad cliente", clientes.pais from facturas
inner join  clientes on facturas.ClienteID =clientes.ClienteID
where clientes.pais = "UK" and facturas.ciudadEnvio != clientes.ciudad*/

/*3.	Listar las categorías y sus productos, incluyendo aquellas categorías para las cuales 
no haya productos en la base de datos. En el caso de los nombres de los productos, donde diga Mix o Chef,
 reemplazarlo por MIX o CHEF respectivamente. 
Por ejemplo, en lugar de Filo Mix, colocar Filo MIX. */

/*
select categorias.CategoriaNombre, replace(replace(productos.ProductoNombre, "Mix", "MIX"),"Chef", "CHEF") from categorias
left join productos on productos.CategoriaID=categorias.CategoriaID */
-- where productos.ProductoNombre like "%Chef%"

-- Para cada empresa de correo, calcular el total de transporte.
-- Incluir todas las empresas de correo, aun cuando no hayan realizado ninguna operación.

/*
select correos.compania,sum(facturas.transporte) from correos
left join facturas on facturas.EnvioVia= correos.CorreoID
group by correos.compania */

-- Listar la información de contacto (o, dirección, etc.) de los clientes que no hayan realizado compras.
-- Mostrar la información en el formato que considere más apropiado. Por ejemplo: <direccion> (CP: <codigo postal>)
/*
select concat(clientes.contacto, clientes.direccion),facturas.ClienteID from clientes
left join facturas on facturas.ClienteID =clientes.ClienteID
where facturas.ClienteID is null */

-- Listar los empleados, junto con el importe total de sus ventas de la categoria Beverages.
-- Mostrar el importe con dos decimales.
select empleados.apellido, format( sum((facturadetalle.preciounitario *facturadetalle.Cantidad) - facturadetalle.Descuento),2) as "total facturas" ,categorias.CategoriaNombre from empleados
inner join facturas on facturas.empleadoID = empleados.empleadoID
inner join facturadetalle on facturadetalle.facturaID = facturas.facturaID
inner join productos on facturadetalle.productoID = productos.productoID
inner join categorias on productos.CategoriaID = categorias.CategoriaID
where categorias.CategoriaNombre = "Beverages"
group by empleados.Apellido



