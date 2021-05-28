/*1. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
que más dinero gastan y en cuantos alquileres lo hacen?*/
/*
select concat(customer.first_name," ", customer.last_name) as cliente, count(rental_id), sum(payment.amount) as total from customer
inner join payment on  payment.customer_id = customer.customer_id
group by cliente
order by total desc
limit 10; */

/*
2. Generar un reporte que indique: el id del cliente, la cantidad de alquileres y
el monto total para todos los clientes que hayan gastado más de 150 dólares
en alquileres.*/
/*
select customer.customer_id as "cliente id", count(rental_id) as "cantidad de alquileres", sum(payment.amount) as total from customer
inner join payment on  payment.customer_id = customer.customer_id
group by customer.customer_id 
having total >= 150
order by total desc */
/*
3. Generar un reporte que responda a la pregunta: ¿cómo se distribuyen la
cantidad y el monto total de alquileres en los meses pertenecientes al año
2005? (tabla payment).*/

/*
select count(rental_id) as "cantidad de alquileres", sum(amount) "MONTO TOTAL", payment_date from payment
where payment_date between "2005-01-01 00:00:00" and  "2006-01-01 00:00:00"*/

/*
4. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios
más alquilados? (columna inventory_id en la tabla rental) Para cada una de
ellas, indicar la cantidad de alquileres.*/

/*
select inventory.inventory_id, count(rental.rental_id)from inventory
inner join rental on rental.inventory_id = inventory.inventory_id
group by inventory.inventory_id
order by count(rental.rental_id) desc
limit 5; */


/*Parte 2:
1. Generar un reporte que responda a la pregunta: Para cada tienda
(store), ¿cuál es la cantidad de alquileres y el monto total del dinero
recaudado por mes?*/

/*
select store.store_id, count(rental.rental_id) as "cantidad de alquileres", sum(amount) as "MONTO TOTAL", extract(month from payment_date), extract(year from payment_date)
from store
inner join customer on store.store_id = customer.store_id
inner join rental on rental.customer_id = customer.customer_id
inner join payment on payment.customer_id = customer.customer_id
group by extract(month from payment_date)
*/


/*
2. Generar un reporte que responda a la pregunta: ¿cuáles son las 10 películas
que generan más ingresos? ¿ Y cuáles son las que generan menos ingresos?
Para cada una de ellas indicar la cantidad de alquileres.*/

/*
select film.title,store.store_id,customer.customer_id,rental.rental_id, payment.payment_id, sum(payment.amount)   from film
-- , sum(payment.amount)
 inner join inventory on inventory.film_id = film.film_id
 inner join store on store.store_id = inventory.store_id
 inner join customer on customer.store_id = store.store_id
 inner join rental on customer.customer_id = rental.customer_id
 inner join payment on payment.rental_id = rental.rental_id
 group by  film.title */
 
/* SELECT film.title AS "Película", COUNT(payment.rental_id) AS "Cantidad de Alquileres", SUM(payment.amount) AS "Ingresos"
FROM payment
INNER JOIN rental ON rental.rental_id=payment.rental_id
INNER JOIN inventory ON inventory.inventory_id=rental.inventory_id
INNER JOIN film ON film.film_id=inventory.film_id
GROUP BY film.title
ORDER BY SUM(payment.amount) DESC
LIMIT 10*/
/*
3. ¿Existen clientes que no hayan alquilado películas?*/

/*select customer.last_name, rental.rental_id, film.title from customer
left join rental on customer.customer_id = rental.customer_id
left join inventory on rental.inventory_id = inventory.inventory_id
left join film on inventory.film_id = film.film_id
where film.film_id IS NULL*/   


/*
4. Nivel avanzado: El jefe de stock quiere discontinuar las películas (film) con
menos alquileres (rental). ¿Qué películas serían candidatas a discontinuar?
Recordemos que pueden haber películas con 0 (Cero) alquileres.*/
/*
select film.title, count(rental.rental_id)  from film
 left join inventory on inventory.film_id = film.film_id
 left join rental on rental.inventory_id = inventory.inventory_id
 group by film.title
 -- order by  count(rental.rental_id) 
 having count(rental.rental_id) =0; */




