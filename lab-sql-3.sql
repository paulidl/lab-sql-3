use sakila;
-- 1. How many distinct (different) actors' last names are there?

select count(distinct last_name) from sakila.actor; -- There are 121 different actor's last names.

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)

select count(distinct language_id) from sakila.film; -- The films where produced in only one language.

-- 3. How many movies were released with "PG-13" rating?
 
select count(film_id) from sakila.film where rating = "PG-13"; -- There are 223 films releases with "PG-13" rating.

-- 4. Get 10 the longest movies from 2006.

select * from sakila.film where release_year = "2006" order by length desc limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?

select DATEDIFF(max(last_update), min(rental_date)) as operating_days from sakila.rental; -- The company has been operating for 275 days.

-- 6. Show rental info with additional columns month and weekday. Get 20.

select *, date_format(rental_date, "%b") as month, date_format(rental_date, "%a") as weekday from sakila.rental limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, date_format(rental_date, "%a") as weekday, if(date_format(rental_date,'%w') in (0,6) , "weekend", "workday") as day_type from sakila.rental;

-- 8. How many rentals were in the last month of activity?

select max(rental_date) from sakila.rental; -- The last month of activity was february.
select count(*) from sakila.rental where rental_date > "2006-02-01 00:00:00"; -- In the last month of activity there were 182 rentals.

