select loan_status from bank_data;

To find the MySQL folder in my computer
SELECT @@secure_file_priv;

## Project begins

select * from bank_data;

select count(id) AS 'Total Loan Applications' from bank_data;
--Total Applications count

SELECT COUNT(id) AS 'Month to Date Applications' FROM bank_data 
WHERE MONTH(issue_date)= 12 AND YEAR (issue_date)= 2021 

SELECT COUNT(id) AS 'Previous Month to Date Applications' FROM bank_data 
WHERE MONTH(issue_date)= 11 AND YEAR (issue_date)= 2021 

select sum(loan_amount) AS 'Total Funded amount' from bank_data;

select sum(loan_amount) AS 'Total Funded amount Month-to-date' from bank_data
where month(issue_date)= 12 and year(issue_date)= 2021 

select sum(loan_amount) AS 'Total Funded amount Previous Month-to-date' from bank_data
where month(issue_date)= 11 and year(issue_date)= 2021 

select sum(loan_amount) AS 'Total Loan amount Received' from bank_data;

select sum(loan_amount) AS 'Total Loan amount Received Month-to-date' from bank_data
where month(issue_date)= 12 and year(issue_date)= 2021 

select sum(loan_amount) AS 'Total Loan amount Received Previous Month-to-date' from bank_data
where month(issue_date)= 11 and year(issue_date)= 2021 

select Round(avg(int_rate)*100,2) AS 'Avg Interest rate' from bank_data

select Round(avg(int_rate)*100,2) AS 'Avg Interest rate_MOTD' from bank_data
where month(issue_date)= 12 and year(issue_date)= 2021 

select Round(avg(int_rate)*100,2) AS 'Avg Interest rate Previous Month' from bank_data
where month(issue_date)= 11 and year(issue_date)= 2021 

select Round(avg(dti)*100,2) AS 'Avg Debt to Income ratio' from bank_data

select Round(avg(dti)*100,2) AS 'Avg Debt to Income ratio_MTD' from bank_data
where month(issue_date)= 12 and year(issue_date)= 2021 

select Round(avg(dti)*100,2) AS 'Avg Debt to Income ratio_Prev Month' from bank_data
where month(issue_date)= 11 and year(issue_date)= 2021 

GOOD LOAN VS BAD LOAN
--GOOD LOAN
##
select ((count(case when loan_status= 'Fully Paid' or loan_status= 'current' then id end))*100/COUNT(id)) as 'Percentage_Good Loans' 
 from bank_data
;

select COUNT(id) AS 'No. of applications: Good Loan' from bank_data
where loan_status= 'Fully Paid' or loan_status= 'current';

select sum(loan_amount) AS 'Total Funded amount: Good Loan' from bank_data
where loan_status= 'Fully Paid' or loan_status= 'current';

select sum(total_payment) AS 'Total Received amount: Good Loan' from bank_data
where loan_status= 'Fully Paid' or loan_status= 'current';

--BAD LOAN

select COUNT(id) AS 'No. of applications: Bad Loan' from bank_data
where loan_status= 'Charged Off';

select ((count(case when loan_status= 'Charged Off' then id end))*100/COUNT(id)) as 'Percentage_Good Loans' 
 from bank_data;

select sum(loan_amount) AS 'Total Funded amount:  Bad Loan' from bank_data
where loan_status= 'Charged Off';

select sum(total_payment) AS 'Total Received amount:  Bad Loan' from bank_data
where loan_status= 'Charged Off';

select * from bank_data

SELECT loan_status,
COUNT(id) AS 'No. of Loan Applications',
SUM(loan_amount) AS 'Total loan disbursed',
SUM(total_payment) AS 'Total loan Recieved',
ROUND(AVG(int_rate)*100,2) AS 'Avg Interest Rate',
ROUND(AVG(dti)*100,2) AS 'Avg DTI'
FROM
bank_data
GROUP BY loan_status;

 SELECT loan_status,
    COUNT(id) AS 'MTD_No. of Loan Applications',
    SUM(loan_amount) AS 'MTD_Total loan disbursed',
    SUM(total_payment) AS 'MTD_Total loan Received'
FROM bank_data
WHERE MONTH(issue_date)= 12
GROUP BY loan_status

SELECT 
	MONTH(issue_date) AS 'Month Number',
    MONTHNAME(issue_date) AS 'Month',
    COUNT(id) AS 'No. of Loan Applications',
	SUM(loan_amount) AS 'Total loan disbursed',
	SUM(total_payment) AS 'Total loan Recieved'
FROM
bank_data
GROUP BY 
MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY 
MONTH(issue_date)

#Sub-grade wise
SELECT sub_grade,
COUNT(id) AS 'No. of Loan Applications',
SUM(loan_amount) AS 'Total loan disbursed',
SUM(total_payment) AS 'Total loan Recieved',
ROUND(AVG(int_rate)*100,2) AS 'Avg Interest Rate',
ROUND(AVG(dti)*100,2) AS 'Avg DTI'
FROM
bank_data
GROUP BY sub_grade
ORDER BY sub_grade;


#Term Wise
SELECT term,
COUNT(id) AS 'No. of Loan Applications',
SUM(loan_amount) AS 'Total loan disbursed',
SUM(total_payment) AS 'Total loan Recieved',
ROUND(AVG(int_rate)*100,2) AS 'Avg Interest Rate',
ROUND(AVG(dti)*100,2) AS 'Avg DTI'
FROM
bank_data
GROUP BY term
ORDER BY term;

SELECT verification_status,
COUNT(id) AS 'No. of Loan Applications',
SUM(loan_amount) AS 'Total loan disbursed',
SUM(total_payment) AS 'Total loan Recieved'
FROM
bank_data
GROUP BY verification_status
ORDER BY verification_status;

SELECT state,
COUNT(id) AS 'No. of Loan Applications',
SUM(loan_amount) AS 'Total loan disbursed',
SUM(total_payment) AS 'Total loan Recieved'
FROM
bank_data
GROUP BY state
ORDER BY state;


SELECT purpose,
COUNT(id) AS 'No. of Loan Applications',
SUM(loan_amount) AS 'Total loan disbursed',
SUM(total_payment) AS 'Total loan Recieved'
FROM
bank_data
GROUP BY purpose
ORDER BY purpose;

SELECT home_ownership,
COUNT(id) AS 'No. of Loan Applications',
SUM(loan_amount) AS 'Total loan disbursed',
SUM(total_payment) AS 'Total loan Recieved'
FROM
bank_data
GROUP BY home_ownership
ORDER BY home_ownership;