create database loans_dataset_new;

use loans_dataset_new;

select *
from customers
limit 10;

/* 1.create a new column app date with new date data type
2. Translate the application date from text to date values
3.Update the new app date column with the translated date values */

alter table loans 
add column app_date date;

select *
from loans
limit 10;

SELECT STR_TO_DATE("August 10 2017", "%M %d %Y");

set sql_safe_updates = 0;

update loans
set app_date = str_to_date(ApplicationDate, "%d-%m-%Y");

SELECT *
from highcreditcardbalancecustomers;

select *
from depositcustomers;

/*1.Find the female customers from rural area*/
select gender, property_area
from customers
where gender= "female" and property_area= "rural";

/*List the married customers with no credit history or unmarried customers with income <5000*/
select married, credit_history, Applicantincome
from customers
where (married= "yes" and credit_history= "0") or (married= "no" and Applicantincome < 5000);

/*Find the list of married customers whose loans were rejected*/
select c.custId, c.married, l.loan_status
from customers c inner join loans l on c.loan_id =l.loan_id
where l.loan_status= "N" and c.married= "Yes";
 
 /*Show the loan application date, loan status for all the self employed customer with dependents*/
 select l.loan_status, l.app_date, c.dependents
 from customers c inner join loans l on c.loan_id =l.loan_id
 where c.self_employed= "Yes" and c.dependents= "Yes";
 
 -- Outer Join Practice Exerices: using Loans_Dataset
/*1. List of all the customers who have high credit card
balance. Also, show the list of amount of deposit they have
made (if any).*/
select dc.custId, hc.CCBalance, dc.depositAmt
from depositcustomers dc left join highcreditcardbalancecustomers hc on dc.custId= hc.custId;

/*2. List the customers who have both high cc balance as well
as deposited money.*/
select dc.custId, hc.CCBalance, dc.depositAmt
from depositcustomers dc left join highcreditcardbalancecustomers hc on dc.custId= hc.custId
order by hc.CCBalance and dc.depositAmt desc
limit 2;

/*3. List all the deposit customers. Show they credit card
balance amount also if they have.*/
select dc.custId, hc.CCBalance
from depositcustomers dc left join highcreditcardbalancecustomers hc on dc.custId= hc.custId;

/*4. List all the customers and the loanAmount they have taken.
Also, show their deposit amount and credit card balance, if any.*/
select c.custId, l.loanamount, dc.depositAmt, hc.CCBalance
from loans l left join customers c on l.loan_id= c.loan_id left join depositcustomers dc on c.custID= dc.custID left join highcreditcardbalancecustomers hc on c.custID= hc.custID;

/*Show how many loans were rejected or approved for female customers who are graduate*/
select l.loan_status, count(c.custID) AS TOTAL
from loans l inner join customers c on l.loan_id= c.loan_id
where c.education= "graduate" and c.gender= "Female"
group by l.loan_status;

/*Show the total number of customers by their marital status.Also show there average Income*/
select married, count(custID) as Cnt
from customers
group by married;

/*1.Find the total number of customers.*/
select count(custID)
from customers;

/*2.How mant customers have deposited money?*/
select count(c.custID), dc.depositAmt 
from customers c inner join depositcustomers dc on c.custID= dc.custID
group by depositAmt;

/*5.Show the total number of customers whose loans are rejected.Show this data gender wise.*/
select count(custid), l.loan_status, c.gender
from customers c inner join loans l on c.loan_ID= l.loan_ID
where l.loan_status= "N"
group by c.gender;

/*List the avg ApplicatIncome of female customers education level-wise. Show only those education levels with at least 4000 as AverageApplicantIncome.*/
select avg(ApplicantIncome) as AverageApplicantincome, gender, education
from customers c inner join loans l on c.loan_ID= l.loan_ID
where gender= "Female"
group by education
having avg(ApplicantIncome)>= 4000;

/*List the total number of customers in each property_area.Show only those areas with atlaest 8 customers.*/
select count(custID) as cnt, property_area
from customers
group by property_area
having count(custID) >= 8;






