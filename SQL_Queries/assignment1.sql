show tables;
/*
1.Find out the PG-13 rated comedy movies. DO NOT use the film_list table.
tables used film , film_category,category
*/
select film.film_id,category.category_id,film.title,film.rating,category.name from film 
inner join film_category on
 film.film_id = film_category.film_id
inner join category on
film_category.category_id = category.category_id
where film.rating = 'PG-13' and category.name = 'Comedy';
/*
 Find out the top 3 rented horror movies.
*/
select film.title,count(*) as top from rental
inner join inventory on
inventory.inventory_id = rental.inventory_id
inner join film on
film.film_id = inventory.film_id
inner join film_category on 
film_category.film_id = film.film_id
inner join category on 
category.category_id = film_category.category_id
where category.name='Horror'
group by film.title
order by top desc
limit 3
;
/*
3.Find out the list of customers from India who have rented sports movies.
*/
select * from film
inner join film_category
on film.film_id = film_category.film_id
inner join category on
film_category.category_id = category.category_id
inner join inventory on
film.film_id = inventory.film_id 
inner join rental on
inventory.inventory_id = rental.inventory_id
inner join customer on
customer.customer_id = rental.customer_id
inner join address
on address.address_id = customer.address_id
inner join city
on city.city_id = address.city_id
inner join country
on country.country_id = city.country_id
where country.country = 'India' and category.name = 'Sports';

/*
 4.Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.
*/
select * from customer
inner join rental on
customer.customer_id = rental.customer_id
inner join inventory on 
inventory.inventory_id = rental.inventory_id
inner join film on
film.film_id = inventory.film_id
inner join film_actor on 
film_actor.film_id = film.film_id
inner join actor on
actor.actor_id = film_actor.actor_id
where actor.first_name= 'NICK'and actor.last_name='WAHLBERG' and
customer.address_id in (
select address_id from address
inner join city on 
city.city_id = address.city_id
inner join country on
country.country_id = city.country_id
where country.country = 'Canada'
);
/*
5.Find out the number of movies in which “SEAN WILLIAMS” acted.
*/
select count(*) as NumberOfFilmsBySEAN_WILLIAMS from actor
inner join film_actor on
actor.actor_id = film_actor.actor_id
inner join film on
film.film_id= film_actor.film_id
where actor.first_name='SEAN' and 
actor.last_name='WILLIAMS';