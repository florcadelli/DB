/*
1. Debemos listar los títulos de cada película con el nombre del género. En el caso de que
no tenga género, mostraremos una leyenda que diga "no tiene género*/

/* select movies.title, coalesce(genres.name,"no tiene género")"no tiene género" from movies
left join genres on genres.id = genre_id */


/*2. Generar un listado de todos los actores y las películas en que trabajaron. Si no
actuaron en ninguna película, se deberían listar de todas formas.*/

/*select actors.id ,actors. last_name, actor_movie.actor_id, actor_movie.movie_id, movies.id, movies.title from actors
left join actor_movie on actor_movie.actor_id = actors.id
left join movies on movies.id = actor_movie.movie_id*/

/*3. ¿Hay actores que no actuaron nunca en una serie?*/
 /*
select actors.first_name, actors.last_name, series.title from actors
left join actor_episode on actor_episode.actor_id = actors.id
left join episodes on actor_episode.episode_id = episodes.id
left join seasons on episodes.season_id = seasons.id
left join series on seasons.serie_id =  series.id*/
