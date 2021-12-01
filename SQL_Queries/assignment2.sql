/*
1. Find out the number of documentaries with deleted scenes.
*/

select count(*) from film
inner join film_category on
film.film_id = film_category.film_id
inner join category on
category.category_id = film_category.category_id
where
category.name = 'Documentary' and
film.special_features = 'Deleted Scenes';
/*
2. Find out the total sales from Animation movies.
*/
select sum(payment.amount) as total_sales from payment
inner join rental on
rental.rental_id = payment.rental_id
inner join inventory on
inventory.inventory_id = rental.inventory_id
inner join film on
film.film_id = inventory.film_id
inner join film_category on
film.film_id = film_category.film_id
inner join category on
category.category_id = film_category.category_id
where category.name = 'Animation'
;
/*
3.Find out the number of sci-fi movies rented by the store managed by Jon Stephens.
*/
select count(*) from staff
inner join  rental on
staff.staff_id = rental.staff_id
inner join inventory on 
inventory.inventory_id = rental.inventory_id
inner join film on 
film.film_id = inventory.film_id
inner join film_category on
film.film_id = film_category.film_id
inner join category on
category.category_id = film_category.category_id
where category.name = 'Sci-Fi'
and staff.first_name = 'Jon' 
and staff.last_name = 'Stephens'
;

/*
4.Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.
*/
select category.name,count(category.name) from customer
inner join rental on 
customer.customer_id = rental.customer_id
inner join inventory on 
inventory.inventory_id = rental.inventory_id
inner join film on
film.film_id = inventory.film_id
inner join film_category on 
film.film_id = film_category.film_id
inner join category on
category.category_id = film_category.category_id
where customer.first_name ='PATRICIA' and
customer.last_name = 'JOHNSON'
group by category.name
order by count(category.name) desc
limit 3
;
/*
5.Find out the number of R rated movies rented by “SUSAN WILSON”
*/
select count(*) from film
inner join film_category on
film.film_id = film_category.film_id
inner join category on 
category.category_id = film_category.category_id
inner join inventory on 
film.film_id = inventory.film_id
inner join rental on
inventory.inventory_id = rental.inventory_id
inner join customer on
rental.customer_id = customer.customer_id
where film.rating = 'R' and customer.first_name="SUSAN" and customer.last_name ="WILSON";