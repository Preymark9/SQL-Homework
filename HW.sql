use sakila;
#first, look at the table to assess what column to read
select * from actor;
#attempt at 1a: show firstname and lastname
select first_name, last_name
from actor;
#success!
#attempting 1b
#tried a join and for some reason it didn't work
#attempted a union, it didn't display the way I wanted
#will attempt later, moving on
#attempting 2a
select * from actor where first_name = "JOE";
#success! why was this easier than 1b? :( attempting 2b 
#for some reason if I do a double ; after line 13, line 18 will execute. I do not understand why this happens
select * from actor where first_name like '%Gen%' or last_name like '%Gen%';
#Rob helped! The issue was I used the where statement twice, which was the cause of the error. 
#attempting 2c, but first I need to figure out what's wrong with 2b
select * from actor where first_name like '%LI%' or last_name like '%LI%'
Order by first_name ASC, last_name DESC;
#Success! beginning 2d
Select * from country;
#visualization is done
Select country_id from country where country in("Afghanistan", "Bangladesh", "China");
#Success! note, I need to wrap the queries in quotes, or it assumes I'm naming a column. Attempting 3a
#Alter Table actor add actor_description blob;
select * from actor;
#success! description is a function, so I named it actor_description so I didn't catch any keyword errors attempting 3b
alter table actor drop column actor_description; 
#failure, somehow. I'm certain the syntax is right. I'll return to this. attempting 4a
select count(last_name) from actor;
#success...I think?! Attempting 4b
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name;
#success, theoretically? attempting 4c
Update actor set first_name = "HARPO", last_name = "WILLIAMS" where first_name = "GROUCHO" and last_name = "WILLIAMS";
#success, I think...moving on to 4d
Update actor set first_name = "GROUCHO", last_name = "WILLIAMS" where first_name = "HARPO" and last_name = "WILLIAMS";
#success maybe, moving onto 5a
show create table address;
#it works! hints are nice. <3 attempting 6a
select * from address;
select * from staff;
#visualization done
SELECT first_name, last_name, staff_id FROM staff LEFT JOIN address ON staff.staff_id = staff_id;
#after much tribulation, success! moving on to #6b
select * from payment;
#visualization done 
SELECT payment_date, SUM(amount) FROM payment LEFT JOIN staff ON staff.first_name = first_name;
#i got...something. the sum of a payment made. Not sure if this is conclusive, may come back to it later. moving on to 6c
select * from film;
select * from film_actor;
#visualization done
SELECT title FROM film INNER JOIN film_actor ON actor_id = actor_id;
#only got halfway. attempting 6d
select * from inventory where film_id = "439";
#my answer is 6, I first checked the film table to find the id and then checked for that same id in inventory. I know there's a faster way to do it but I'm really tired and pressed on time. moving on to 6e
select * from payment;
select * from customer;
SELECT first_name, last_name FROM customer JOIN payment ON amount Order By last_name;
#It did the alphabetical order but didn't show the payments, again, halfway there. going to 7a
select * from film where title like 'K%' or title like 'Q%';
#success I think, onto 7b
select * from film where title = "ALONE TRIP";
select * from film_actor where film_id = "17";
select * from actor where actor_id = "3" or  actor_id = "12" or actor_id = "13" or actor_id = "82" or actor_id = "100" or actor_id = "160" or actor_id = "167" or actor_id = "187";
#success! I'm pretty sure that's not how I was supposed to reach that conclusion but onto 7c
select * from city where country_id = "20";
select * from address where city_id = "179" or city_id = "196" or city_id = "300" or city_id = "313" or city_id = "383" or city_id = "430" or city_id = "565";
select email from customer where address_id = "481" or address_id = "468" or address_id = "1" or address_id = "3" or address_id = "193" or address_id = "415" or address_id = "441"; 
#again, I get the feeling this isn't how I was supposed to do this but, success and onto 7d
select * from film where rating = "G" or rating = "PG";
#I admit I feel like I'm cutting corners here, but ratings already give me the information I need. moving onto 7e
select * from film order by rental_duration DESC;
#maybe? onto 7f
#I dunno where to start so onto 7g
select * from city where city_id = "300";
select * from country where city_id in(select city_id from city where city_id = "300")
#I forgot how to do this where they all link together, 7h looks worse, and it's due today so I'll go to 8a
#I couldn't figure out 7h or 8a, but I know how I would write 8b
CREATE VIEW V_FAILED_ATTEMPT AS #I'd put the query for 7h in this place and close with;
DROP VIEW V_FAILED_ATTEMPT #this is my answer to 8c
