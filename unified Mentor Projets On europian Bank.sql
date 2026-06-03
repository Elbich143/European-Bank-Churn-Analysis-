create database europian_bank;
use  europian_bank;

select * from european_bank;

## Good Credit Score Customers:-

select CustomerId, Surname, CreditScore, Geography, Gender, Age, EstimatedSalary
from european_bank
where CreditScore > 650 ;


select * from european_bank;

## Creating a Column Called as Average Salary :-
select avg(EstimatedSalary) as AverageSalary From european_bank ;


## Chethe Customer whose Salary is above the Average Salary:
select * from european_bank
where EstimatedSalary > (Select avg(EstimatedSalary) as AverageSalary From european_bank); 

## Count the Number Of Feame And Male Customer:-
Select  Gender, Count(*) As Total_Customer 
From european_bank 
group by Gender;

select * from european_bank;
## Counting the number of customer from each country:-
Select Geography, count(*) As Total_Number_Of_Customer_each_Country
From european_bank
Group By Geography;

## Count the Age Group:-
select Age, Count(*) As Age_Group from european_bank
group by Age 
order by Age ASC;


## Checking Overall Churn Rate:-
Select 
	case
		when Exited = 1 then "Left"
        Else "Retained"
	End AS Customer_Status,
    Count(*) As Total_Customer 
    From european_bank
    Group By Exited;
    
## Or wwe can write this query as 
Select Exited, count(*) As Total_Customer   ## where 1 = Customer Left And 0 = Customeer Retained 
	From european_bank
group by Exited;


select * From european_bank;
## Calculation Of Churn Rate Percentages:-
SELECT
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM european_bank;


## Churn By Gender :- 
SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM european_bank
GROUP BY Gender;



## Churn By Geography:

Select Geography,
	Count(*) As No_Of_Countries,
    COUNT(Gender) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM european_bank
Group By Geography;





## Churn By Age Group:-
Select 
	 CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Above 50'
    END AS Age_Group,
	Count(*) As No_Of_Countries,
    COUNT(Gender) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM european_bank
Group By Age;



## Churn BY Credit Score Catagory:-
SELECT
    CASE
        WHEN CreditScore < 500 THEN 'Low'
        WHEN CreditScore BETWEEN 500 AND 700 THEN 'Medium'
        ELSE 'High'
    END AS Credit_Category,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM european_bank
GROUP BY Credit_Category;



## Churn By Balance :-
SELECT
    CASE
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance < 50000 THEN 'Low Balance'
        WHEN Balance BETWEEN 50000 AND 100000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS Balance_Group,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited)*100.0/COUNT(*),2) AS Churn_Rate
FROM european_bank
GROUP BY Balance_Group;


## Churn By Tenure :- 
SELECT
    Tenure,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited)*100.0/COUNT(*),2) AS Churn_Rate
FROM european_bank
GROUP BY Tenure
ORDER BY Tenure;


## Churn By Number of Products:-
SELECT
    NumOfProducts,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited)*100.0/COUNT(*),2) AS Churn_Rate
FROM european_bank
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


## Churn By Active Membership:- 
SELECT
    IsActiveMember,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited)*100.0/COUNT(*),2) AS Churn_Rate
FROM european_bank
GROUP BY IsActiveMember;


## Churn Ownweship:- 
SELECT
    HasCrCard,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited)*100.0/COUNT(*),2) AS Churn_Rate
FROM european_bank
GROUP BY HasCrCard;


## Identifying High risk Customer segments:-
SELECT
    Gender,
    Geography,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(SUM(Exited)*100.0/COUNT(*),2) AS Churn_Rate
FROM european_bank
GROUP BY Gender, Geography
ORDER BY Churn_Rate DESC;

