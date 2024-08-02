create database webanalytics_db_new;

use webanalytics_db_new;

/*1. Show the list of top 10 longest visits on the weekends.*/
select VistID, Time_Spent
from visitdata
where time_spent != "weekday"
order by time_spent desc
limit 10;
/*2. Show the visits from January month where the visitor also clicked on the ad.*/
select VistID, clicked, month
from visitdata
where Month= "January" and clicked= "Yes";

/*3. List the top 5 visitors from Singapore.*/
select VistID, country_name
from visitorprofile_withdob
where country_name= "singapore"
order by vistID desc
limit 5;