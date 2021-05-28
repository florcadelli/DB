-- select*from categorias
-- select categoriaNombre, descripcion from categorias
-- select * from productos

 -- select * from productos
 -- where discontinuado =1
 
 -- select * from productos
 -- where proveedorID =8
 
 -- select * from productos
 -- where preciounitario between 10 and 22
 
 -- select * from productos
-- where unidadesstock < nivelreorden and unidadespedidas = 0

-- select contacto, compania, titulo, pais from clientes
-- where titulo="owner"
-- order by pais

-- select *from clientes
-- where contacto like"c%"

-- select * from facturas
-- order by fechafactura

-- select * from facturas
-- where paisenvio ="usa" and enviovia != 3

 -- select * from facturas
 -- where clienteID = "GOURL"
 
 -- select * from facturas
 -- where empleadoID in (1,2,4,5,9)
 -- order by empleadoID 
 
--  select * from productos
-- order by preciounitario desc
  
-- select * from productos
-- order by preciounitario desc
-- limit 5
 
 -- select * from productos
 -- order by unidadesstock desc
 -- limit 10
 
 
 -- select FacturaID, ProductoID, cantidad from facturadetalle
 
--  select FacturaID, ProductoID, cantidad from facturadetalle
-- order by cantidad desc
 
-- select FacturaID, ProductoID, cantidad from facturadetalle
-- where cantidad between 50 and 100

-- select FacturaID as Nrofactura, ProductoID as producto, (preciounitario*cantidad) as total from facturadetalle


-- select * from clientes
-- where (pais ="Brazil" or pais ="Mexico") or titulo like "sales%"

-- select * from clientes
-- where compania like "A%"

-- select ciudad, contacto as nombreyapellido,titulo as puesto from clientes
-- where ciudad = "Madrid"

-- select * from facturas
-- where facturaid between 10000 and 10500 or clienteid like "B%"

-- select * from facturas
-- where ciudadenvio = "vancouver" or enviovia=3

 -- select * from empleados
 -- where apellido = "Buchanan" 
 
 -- select * from facturas
 -- where empleadoID = 5


-- ===========================QUERIES EMARKET XL=====================================

/*1) Generar un listado de todas las facturas del empleado 'Buchanan'.*/
/*
select * from facturas
inner join empleados on facturas.empleadoID=empleados.EmpleadoID
where empleados.Apellido = 'Buchanan'*/
/*
2) Generar un listado con todos los campos de las facturas del correo 'Speedy
Express'.*/
 /*
select * from facturas
inner join correos on facturas.enviovia = correos.correoID
where correos.compania = 'Speedy Express';*/

/*
3) Generar un listado de todas las facturas con el nombre y apellido de los
empleados.*/

/*
select facturas.FacturaID, empleados.nombre, empleados.apellido from facturas
inner join empleados on empleados.EmpleadoID= facturas.EmpleadoID
*/

/*
4) Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío
“USA”.*/

/*
select facturas.FacturaID, clientes.titulo from facturas
inner join clientes on clientes.clienteID= facturas.ClienteID
where clientes.titulo = 'owner'*/

/*
5) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
“Leverling” o que incluyan el producto id = “42”.*/
 
 /*
select facturas.FacturaID, empleados.apellido,facturadetalle.ProductoID from empleados
inner join facturas on empleados.EmpleadoID= facturas.EmpleadoID
inner join facturadetalle on facturadetalle.FacturaID = facturas.FacturaID
where apellido = 'Leverling' or facturadetalle.ProductoID = '42' ; */

/*
6) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
“Leverling” y que incluya los producto id = “80” o ”42”.*/

/*
select facturas.*, empleados.apellido,facturadetalle.ProductoID from empleados
inner join facturas on empleados.EmpleadoID= facturas.EmpleadoID
inner join facturadetalle on facturadetalle.FacturaID = facturas.FacturaID
where apellido = 'Leverling' and (facturadetalle.ProductoID = '80'or facturadetalle.ProductoID = '42');
*/

/*
7) Generar un listado con los cinco mejores clientes, según sus importes de
compras total (PrecioUnitario * Cantidad).*/

/*
select compania, sum(facturadetalle.PrecioUnitario * facturadetalle.Cantidad) as "importe de compras total" from clientes
inner join facturas on clientes.ClienteID = facturas.ClienteID
inner join  facturadetalle on facturadetalle.FacturaID = facturas.FacturaID
group by compania
order by sum(facturadetalle.PrecioUnitario * facturadetalle.Cantidad) desc
limit 5;
*/


/*
8) Generar un listado de facturas, con los campos id, nombre y apellido del cliente,
fecha de factura, país de envío, Total, ordenado de manera descendente por
fecha de factura y limitado a 10 filas.*/

select facturas.facturaID, clientes.contacto, facturas.fechafactura, PaisEnvio, facturadetalle.PrecioUnitario from clientes
inner join facturas on clientes.ClienteID = facturas.ClienteID
inner join  facturadetalle on facturadetalle.FacturaID = facturas.FacturaID
order by facturas.fechafactura desc
limit 10





 
 

 