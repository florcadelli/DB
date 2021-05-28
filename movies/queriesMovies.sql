-- select *from movies
-- select first_name, last_name from actors
-- select title from series

-- select first_name, last_name,rating from actors
-- WHERE rating > 7.5

-- select title,awards,rating from movies
-- WHERE rating > 7.5 and awards>2

-- select title,rating from movies
-- order by rating

-- select title,rating from movies
-- where title like "%Toy Story%"

-- select * from actors
-- where first_name like "sam%"

-- select * from movies
-- where release_date between  "2004-01-01" and "2008-12-31"

-- =============================================
-- PARTE II

-- select title as titulo from series 

-- select title from movies
-- where rating >3 and awards >1  between "1998-01-01 00:00:00" and "2010-01-01 00:00:00"
-- limit 3
-- offset 10


 -- select*from episodes
 -- order by rating
 -- limit 3
 
 -- select id,first_name as nombre, last_name as apellido, rating from actors
 
 -- ====================MOVIES III=========================
 
 -- 1. ¿Cuántas películas hay?
 
 -- select count(*) from movies
 
 -- 2. ¿Cuántas películas tienen entre 3 y 7 premios?
 --  select count(*) from movies
  -- where awards between 3 and 7
 
 -- 3. ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
-- select count(*) from movies
-- where rating > 7 and awards between 3 and 7

-- 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
-- cantidad de películas por id. de género.

-- select count(movies.title), genres.name from movies
-- inner join genres on movies. genre_id = genres.id
-- group by(genres.name)

-- 5. De la consulta anterior, listar sólo aquellos géneros que tengan como suma
-- de premios un número mayor a 5.

 -- select count(movies.title),count(movies.awards), genres.name from movies
 -- inner join genres on movies. genre_id = genres.id
 -- group by(genres.name)
-- having count(movies.awards)>5
 
 
 
 
 -- ====================MOVIES IV=========================
 
 
 -- 1 Utilizando la base de datos de movies, queremos conocer, por un lado, los
-- títulos y el nombre del género de todas las series de la base de datos.

-- SELECT title, genres.name from series
-- inner join genres on genre_id = genres.id

-- 2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y
-- apellido de los actores que trabajan en cada uno de ellos

-- select episodes.title, actors.first_name, last_name from episodes
-- inner join actor_episode on episodes.id = episode_id
-- inner join actors on actors.id = actor_id

-- 3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
-- actrices (mostrar nombre y apellido) que han trabajado en cualquier película
-- de la saga de La Guerra de las galaxias.

-- select  actors.first_name, last_name, movies.title from actors
-- inner join movies on favorite_movie_id = movies.id
-- where movies.title like "%La Guerra de las galaxias%"

-- 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
-- cantidad de películas por nombre de género.

-- select title, genres.name from movies
-- inner join genres on movies.genre_id = genres.id

-- =============================MOVIES 5=========================

/* 1. Debemos listar los títulos de cada película con su id de género. Solo vamos a
trabajar con la tabla de movies. En el caso de que no tenga género,
mostraremos una leyenda que diga "no tiene género".
Como ayuda podemos usar la función COALESCE() que retorna el primer
valor no nulo de una lista. Podemos encontrar más información haciendo clic
acá.*/

-- select title, coalesce(genre_id, "no tiene género") from movies


/*2. Necesitamos mostrar, de cada serie, la cantidad de días desde su estreno
hasta su fin, con la particularidad de que a la columna que mostrará dicha
cantidad la renombraremos: “Duración”. */

-- select title, DATEDIFF(end_date,release_date) from series
/*
3. Listar los actores (nombre y apellido) ordenados alfabéticamente por ambas
columnas, cuyo nombre sea mayor a 6 caracteres.*/

/*
select first_name,last_name from actors
order by last_name, first_name */


/*4. Nos piden que obtengamos el título de todas las series y el total de
temporadas que tiene cada una de ellas.*/

/*
select series.title, count(seasons.id)from series
inner join seasons on seasons.serie_id = series.id
group by series.title*/




