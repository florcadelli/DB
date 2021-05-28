/*select artistas.nombre, canciones.nombre, items_de_facturas.* from albumes
inner join artistas on albumes.id_artista = artistas.id
inner join canciones on  canciones.id_album = albumes.id
inner join items_de_facturas on  items_de_facturas.id_cancion = canciones.id
where artistas.nombre ='AC/DC'*/

/*select artistas.nombre, canciones.nombre, items_de_facturas.* from albumes
left join artistas on albumes.id_artista = artistas.id
left join canciones on  canciones.id_album = albumes.id
left join items_de_facturas on  items_de_facturas.id_cancion = canciones.id
where artistas.nombre ='caetano veloso' and canciones.milisegundos > 240000*/


-- id de factura, fecha de factura, id del cliente, nombre del cliente, apellido del cliente,total de la factura,  
-- y solamente debe incluir las facturas de Argentina. 
-- Luego ejecutar SELECT * FROM FACTURAS_NACIONALES. ¿Cuántos registros devuelve la consulta?
/*CREATE VIEW  FACTURAS_NACIONALES AS  
select facturas.id as idfacturas, facturas.id_cliente, facturas.pais_de_facturacion, clientes.primer_nombre, clientes.apellido, facturas.total 
from canciones
inner join items_de_facturas on items_de_facturas.id_cancion = canciones.id
inner join facturas on items_de_facturas.id_factura = facturas.id
inner join clientes on facturas.id_cliente = clientes.id
where pais_de_facturacion= "argentina"
group by facturas.id

SELECT * FROM FACTURAS_NACIONALES*/

/*Crear una vista llamada LATINOS con información de artistas con sus álbumes y canciones. 
La vista debe tener las siguientes columnas: nombre del artista, título del álbum, nombre de la canción, y debe incluir únicamente aquellas canciones del género latin. 
Hacer un SELECT sobre la vista LATINOS ordenada por nombre, artista y canción. 
¿Cuál es el nombre de la segunda canción que aparece en el resultado?*/

CREATE VIEW  LATINOS AS 
select artistas.nombre as artista, albumes.titulo as titulo_album, canciones.nombre as cancion, generos.nombre as genero from albumes
INNER join artistas on albumes.id_artista = artistas.id
INNER join canciones on  canciones.id_album = albumes.id
INNER join generos on  canciones.id_genero = generos.id
where generos.nombre = 'latin'

SELECT * FROM LATINOS
ORDER BY artista, cancion


