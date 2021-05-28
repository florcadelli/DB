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

 select canciones.nombre, canciones.id_tipo_de_medio, tipos_de_medio.nombre from canciones
 INNER JOIN tipos_de_medio
 ON   canciones.id_tipo_de_medio = tipos_de_medio.id 
