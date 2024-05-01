use churned_customers;
select * from customer_churn_dataset;

---- TOTAL NUMBER OF CUSTOMERS -----

select count(customer_id) from customer_churn_dataset;

------ TOTAL NO. OF CHURN RATE ----

select count(churn_status) from customer_churn_dataset
where churn_status='yes';

------ 2. AVERAGE AGE OF CHURNED CUSTOMERS ------

select avg(age) from customer_churn_dataset
where churn_status='yes';

------ 3. MOST COMMON CONTRACT TYPE AMONG CHURNED CUSTOMERS -------

select contract_type , churn_status from customer_churn_dataset
where churn_status ='yes';
--
select count(contract_type) from customer_churn_dataset;
--
SELECT 
    COUNT(contract_type)
FROM
    customer_churn_dataset
WHERE
    contract_type = 'yearly';

------ 4.Distribution of monthly charges ------

select monthly_charges, churn_status from customer_churn_dataset
where churn_status='yes';
---- Min Distribution
select min(monthly_charges), churn_status from customer_churn_dataset
where churn_status='yes';

---- Max Distribution
select max(monthly_charges), churn_status from customer_churn_dataset
where churn_status='yes';

---- AVERAGE Distribution
select avg(monthly_charges), churn_status from customer_churn_dataset
where churn_status='yes';

------ 5. CUSTOMERS WITH TOTAL_CHARGES

select customer_id, total_charges, churn_status from customer_churn_dataset
where churn_status='yes';

------ 6. TOTAL_CHARGES DISTRIBUTION AMONG CHURNED CUSTOMERS

--- MIN DISTRIBUTION

select min(total_charges), churn_status from customer_churn_dataset
where churn_status='yes';

--- MAX DISTRIBUTION

select max(total_charges), churn_status from customer_churn_dataset
where churn_status='yes';

--- AVERAGE DISTRIBUTION

select avg(total_charges), churn_status from customer_churn_dataset
where churn_status='yes';

------ TOTAL_CHARGES DISTRIBUTION AMONG NON-CHURNED CUSTOMERS

--- MIN DISTRIBUTION

select min(total_charges), churn_status from customer_churn_dataset
where churn_status='no';

--- MAX DISTRIBUTION

select max(total_charges), churn_status from customer_churn_dataset
where churn_status='no';

--- AVERAGE DISTRIBUTION

select avg(total_charges), churn_status from customer_churn_dataset
where churn_status='no';

------- 7. AVERAGE MONTHLY CHARGES FOR DIFF CONTRACT TYPES AMONG CHURNED CUSTOMERS

select avg(monthly_charges) , contract_type, churn_status from customer_churn_dataset
where contract_type='yearly' and churn_status='yes';

select avg(monthly_charges) , contract_type, churn_status from customer_churn_dataset
where contract_type='monthly' and churn_status='yes';

------- 8. CUSTOMERS WHO HAVE BOTH ONLINE SECURITY AND ONLINE BACKUP SERVICES AND HAVE NOT CHURNED -----

select customer_id, online_security, online_backup, churn_status from customer_churn_dataset
where churn_status='no' and online_security ='yes' and online_backup ='yes';


-------- 9. MOST COMMON CONTRIBUTIONS OF SERVICES AMONG CHURNED CUSTOMERS  ----

select count(internet_service),  churn_status from customer_churn_dataset
where churn_status='yes' and internet_service='DSL' ;

select count(internet_service), churn_status from customer_churn_dataset
where churn_status='yes' and internet_service='Fibre optic' ;

 ------ 10. AVERAGE TOTAL CHARGES IN TERMS OF GENDER AND MARITAL STATUS
 ----- GENDER
select avg(total_charges), gender from customer_churn_dataset 
where gender='male'
union
select avg(total_charges), gender from customer_churn_dataset 
where gender='female';

  ----- MARITAL_STATUS
select avg(total_charges), marital_status from customer_churn_dataset 
where marital_status='married'
union
select avg(total_charges), marital_status from customer_churn_dataset 
where marital_status='single';

------ 11. AVERAGE MONTHLY CHARGES FOR DIFF AGE GROUP

-- AGE Below 30

select avg(monthly_charges) as average_monthly_charges, avg(age) as average_age, churn_status from customer_churn_dataset
where age <= 30 and churn_status ='yes';

---- AGE B/W 30 AND 60

select avg(monthly_charges) as average_monthly_charges, avg(age) as average_age, churn_status from customer_churn_dataset
where age > 30 and age <=60 and churn_status ='yes';

------- AGE ABOVE 60
select avg(monthly_charges) as average_monthly_charges, avg(age) as average_age, churn_status from customer_churn_dataset
where age > 60 and churn_status ='yes';

------  12. AVERAGE AGE AND TOTAL CHARGES FOR CUSTOMERS WITH MULTIPLE LINES AND ONLINE BACKUP

select avg(age) as average_age, avg(total_charges) as average_total_charges, multiple_lines, online_backup from customer_churn_dataset
where multiple_lines ='yes' and online_backup ='yes';

------- 13. CONTRACT TYPE WITH HIGHEST CHURN RATE AMONG SENIOR CITIZEN (AGE 65 AND OVER)

select (contract_type), age, churn_status from customer_churn_dataset
where age >= 65 and contract_type = 'yearly' and churn_status ='yes';

 ---- 
 
select (contract_type), age, churn_status from customer_churn_dataset
where age >= 65 and contract_type = 'monthly' and churn_status ='yes';

---

SELECT contract_type, 
       COUNT(*) AS total_customers,
       SUM(CASE WHEN churn_status = 'yes' THEN 1 ELSE 0 END) AS churned_customers,
       (SUM(CASE WHEN churn_status = 'no' THEN 1 ELSE 0 END) / COUNT(*)) AS churn_rate
FROM customer_churn_dataset
WHERE age >= 65  -- Filter for senior citizens (age 65 and over)
GROUP BY contract_type
ORDER BY churn_rate DESC;

------ 14. AVERAGE MONTHLY CHARGES FOR CUSTOMERS WHO HAVE MULTIPLE LINES AND STREAMING TV

select avg(monthly_charges) as average_monthly_charges, multiple_lines, streaming_tv
from customer_churn_dataset
where
multiple_lines='yes'
and
streaming_tv='yes';

----- 15.AVERAGE AGE AND TOTAL CHARGES FOR CUSTOMERS WITH DIFF COMBINATION OF STREAMING SERVICES

select avg(age)as average_age, avg(total_charges), streaming_tv, streaming_movies from customer_churn_dataset
where streaming_tv = 'yes' and streaming_movies ='yes';

----