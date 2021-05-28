
-- 1. Obtener el nombre y apellido de los primeros 5 actores disponibles, utilizar
-- aliases para mostrar los nombres de las columnas en español.

-- select first_name AS nombre,last_name as apellido from actor
-- limit 5

-- 2. Obtener un listado que incluya nombre, apellido y correo electrónico de los
-- clientes (customers) inactivos, utilizar aliases para mostrar los nombres de
-- las columnas en español.

-- select first_name as nombre, last_name as apellido, email, active from customer
-- where active = 0;




/*3. Obtener un listado de films incluyendo título, año y descripción de los films
que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de
mayor a menor y utilizar aliases para mostrar los nombres de las columnas
en español*/
 /* select title as titulo, release_year as feche_estreno , description as descripcion ,rental_duration as duracion_alquiler from film
 where rental_duration >5
 order by rental_duration desc*/


/*
4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de
mayo de 2005, incluir en el resultado todas las columnas disponibles.
*/

/*select *,extract( year from rental_date) from rental
where extract( year from rental_date)= 2005*/


/*
Reportes parte 2: Sumemos complejidad

Si llegamos hasta acá tenemos en claro la estructura básica de un
SELECT. En los siguientes reportes vamos a sumar complejidad.
¿Probamos?

1. Obtener la cantidad TOTAL de alquileres (rentals), utilizar un alias para
mostrarlo en una columna llamada “cantidad”*/

-- select count(*) as cantidad from rental


/*
2. Obtener la suma TOTAL de todos los pagos (payments), utilizar un alias para
mostrarlo en una columna llamada “total”, una columna con la cantidad de
alquileres con el alias “Cantidad”, y una columna que indique el “Importe
promedio” por alquiler.*/
-- select sum(amount) as total, count (rental. rental_id), svg(amount) from payment

/*select sum(amount) as total, count(rental.rental_id) as cantidad,  (sum(amount)/count(rental.rental_id)) as "importe promedio" from payment
inner join rental on payment.rental_id = rental.rental_id*/

/*
3. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
que más dinero gastan y en cuantos alquileres lo hacen?*/
-- select * from payment
/*
select concat(first_name," ", last_name) as "nombre y apellido",sum(payment.amount) as "monto total", count(payment.rental_id) "cantidad de alquileres" from customer
inner join rental on rental.customer_id = customer.customer_id
inner join payment on payment.rental_id = rental.rental_id
group by customer.customer_id
order by sum(payment.amount) desc
limit 10*/



/*
4. Generar un reporte que indique: id de cliente, cantidad de alquileres y monto
total para todos los clientes que hayan gastado más de 150 dólares en
alquileres.*/

/*select customer.customer_id,sum(payment.amount) as "monto total", count(payment.rental_id) "cantidad de alquileres" from customer
inner join rental on rental.customer_id = customer.customer_id
inner join payment on payment.rental_id = rental.rental_id
group by customer.customer_id
having sum(payment.amount)>150
order by sum(payment.amount) desc*/




/*
5. Generar un reporte que muestre por mes de alquiler (rental_date de tabla
rental), la cantidad de alquileres y la suma total pagado (amount de tabla
payment) para el año de alquiler 2005 (rental_date de tabla rental).
Pista: Las tablas a utilizar son rental y payment.*/

/*
select extract(month from rental.rental_date) as "mes alquiler",extract(year from rental.rental_date) as "año alquiler", count(payment.rental_id) as "cantidad de alquileres", sum(amount) as "suma total" from rental
inner join payment on payment.rental_id = rental.rental_id
group by extract(month from rental.rental_date)
having extract(year from rental.rental_date) = 2005; -- ME TIRA ERROR QUE DESCONOCE LA COLUMNA
-- having "año alquiler" = 2005; ME DEVUELVE LAS COLUMNAS VACIAS*/

/*select rental_date, extract(month from rental_date) as mes, count(payment.rental_id), sum(payment.amount) from rental
inner join payment on rental.rental_id = payment.rental_id
group by extract(month from rental_date)
having extract(year from rental_date) = 2005*/
/*
6. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios
más alquilados? (columna inventory_id en la tabla rental) para cada una de
ellas indicar la cantidad de alquileres.*/

/*
select  inventory_id, count(rental.inventory_id) as "cantidad de alquileres" from rental
group by inventory_id
order by count(rental.inventory_id) desc
-- limit 5
*/

-- Sobre la tabla “Payment” calcular la cantidad de pagos
--  y la suma total de monto (amount) para el cliente (Customer_id) “10”.

/*select count(*), sum(amount) from payment
where Customer_id = "10"*/

/* select count(active) from customer
where active = "0";*/

-- Necesitamos obtener un reporte con todas las películas (Films) de Acción.
-- Veamos la siguiente consulta: 

/* SELECT film.title, category.name FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
where category.name = "Action"*/


