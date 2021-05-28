 -- select canciones.nombre, generos.nombre from canciones, generos
 -- where compositor ="Willie Dixon" and id_genero = generos.id and generos.nombre = "blues"

 -- select canciones.nombre, generos.nombre from canciones, generos
 -- where compositor ="Willie Dixon" and id_genero = generos.id and generos.nombre = "rock"
 
-- SELECT canciones.nombre, generos.nombre
-- FROM canciones
-- INNER JOIN generos
-- ON generos.nombre = "rock"

-- select albumes.id, albumes.titulo,artistas.nombre from albumes
-- INNER JOIN artistas
-- ON id_artista = artistas.id and artistas.nombre ="Deep Purple"
-- limit 10

 -- select canciones.nombre, canciones.id_tipo_de_medio, tipos_de_medio.nombre from canciones
 -- INNER JOIN tipos_de_medio
 -- ON   canciones.id_tipo_de_medio = tipos_de_medio.id 
 
 -- select  distinct titulo from empleados
 
 -- select * from playlists
-- select distinct canciones.nombre, playlists.nombre from canciones
-- INNER JOIN canciones_de_playlists ON canciones.id = canciones_de_playlists.id_cancion
 -- INNER JOIN playlists ON playlists.id = canciones_de_playlists.id_playlist

-- select distinct concat("La canción " ,nombre, " fue compuesta por ", compositor)from canciones

-- select coalesce (estado_o_provincia_de_facturacion,pais_de_facturacion, codigo_postal_de_facturacion) from facturas

-- select nombre, apellido, floor(datediff( fecha_de_contratacion, fecha_nacimiento)/ 365) from empleados

select id_cliente, extract(month from fecha_factura) from facturas
where id_cliente =2
order by fecha_factura desc
