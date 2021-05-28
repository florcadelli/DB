select * categorias
select CategoriaNombre, descripcion from categorías
select* from productos
select* from productos where Discontinuado = 1
select * from productos where proveedorID = 8
select * from productos where precio unitario between 10 and 22order by preciounitario
select * from productos where unidadesstock<nivelreorden and unidadespedidas=0
where empleado_id in (1,2,4,5,9)

select * from productos order by PrecioUnitario desc
select * from productos order by PrecioUnitario desc limit 5
select * from productos order by UnidadesStock desc limit 10
select facturaid, productoid, cantidad from facturadetalle
select facturaid, productoid, cantidad from facturadetallewhere cantidad between 50 and 100order by cantidad desc
select facturaid as nrofactura, productoid as producto, cantidad*preciounitario as total  from facturadetalle

