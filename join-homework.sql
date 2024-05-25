/* list all customers who live in Texas*/

select *
from customer 
full join address
on customer.address_id = address.address_id
where address.district = 'Texas'

/* get all payments about $6.99 with customer's full name */
select customer.first_name , customer.last_name 
from payment
full join customer
on payment.customer_id = customer.customer_id
where payment.amount > 6.99
group by customer.first_name, customer.last_name 

/* show all customers names who have made payments over $175 */
select first_name, last_name 
from customer
where customer_id in (select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175
);

/* list all customers that live in Nepal */
select *
from customer
full join address
on customer.address_id = address.address_id
full join city_
on address.city_id = city_.city_id 
full join country
on city_.country_id = country.country_id 
where country = 'Nepal'

/* which staff member had the most transactions? */
select count(staff.staff_id), first_name, last_name 
from staff
join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by count(staff.staff_id) asc 

/* how many movies of each rating are there? */
select rating, count(rating) 
from film
group by rating

/* show all customers who have made a single payment above 6.99 */
select customer.customer_id, customer.first_name, customer.last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
	group by customer_id
	order by customer_id asc
) 

/* how many free rentals did our stores give away? */
select store.store_id, count(store.store_id) as Free_Rentals, address.address, address.district 
from staff
join payment
on staff.staff_id = payment.staff_id
join store
on staff.store_id = store.store_id
join address
on store.address_id = address.address_id 
where payment.amount = 0
group by(store.store_id, address.address, address.district)


