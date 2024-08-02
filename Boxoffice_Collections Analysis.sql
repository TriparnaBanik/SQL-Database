create database boxoffice_db;

use boxoffice_db;

/*2. List the top 5 movies which grossed the highest collections across all years*/
select movie_name, movie_total_worldwide
from movie_commercials
order by 2 desc
limit 5;

select *
from movie_details
limit 10;

/*1. Show the list of movies released in 2020*/
select movie_name, release_date
from movie_details
where release_date >= "2020-01-01" <= "2020-12-31";

/*3. List the name of the producers who has produced comedy movies in 2019*/
select producer, movie_genre, release_date
from movie_details
where release_date >="2019-01-01" <="2019-12-31";
 
/*4. Which movie in 2020 had the shortest duration?*/
select movie_name, release_date, runtime
from movie_details
order by runtime asc
limit 1;

/*5. List the movie with the highest opening weekend. Is this the same movie which had the highest overall collection?*/
select movie_name, movie_opening, movie_weekend
from movie_commercials
order by movie_opening and movie_weekend desc
limit 1;
no

/*6. List the movies which had the weekend collectio same as the first week collection*/
select movie_name
from movie_commercials
where movie_weekend = movie_firstweek;

/*7. List the top 3 movies with the highest foreign collection*/
select movie_name, movie_total_worldwide
from movie_commercials
order by movie_total_worldwide desc
limit 3;

/*8. List the movies that were released on a non-weekend day*/
select movie_name, dayname(release_date) as DyName
from movie_details
where dayname(release_date) <> "Friday" and dayname(release_date) <> "Saturday" and dayname(release_date) <> "Sunday";

/*9. List the movies by Reliance Entertainment which were non comedy.*/
select movie_name, banner, movie_genre
from movie_details
where banner= "Reliance Entertainment" and movie_genre != "comedy";

/*10. List the movies produced in the month of October, November, and December that were released on the weekends.*/
select movie_name, month(release_date) as ReleaseInMonths
from movie_details
where month(release_date) = "October" and "November" and "December";





  
