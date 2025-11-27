use Bank_Loan_DB

select * from Bank_loan_data

--Total Loan applications:
select count(id) as Total_Loan_application from dbo.Bank_loan_data; 

--MTD Loan applications:
select count(id) as MTD_Total_loan_application from Bank_Loan_data
WHERE MONTH(ISSUE_DATE) = 12;

--PMTD Loan applications:
select count(id) as PMTD_Total_loan_application from Bank_Loan_data
WHERE MONTH(ISSUE_DATE) = 11;

--Total funded amount:
select sum(loan_amount) as Total_funded_amount from
Bank_Loan_data;

--MTD Total funded amount:
select sum(loan_amount) as Total_funded_amount fromBank_Loan_data
where month(issue_date) = 12;

--PMTD Total funded amount:
select sum(loan_amount) as Total_funded_amount fromBank_Loan_data
where month(issue_date) = 11;

--Total amount received:
select sum(total_payment) as Total_payment_received from Bank_loan_data;

--MTD Total amount received:
select sum(total_payment) as Total_payment_received from Bank_loan_data where month(issue_date) = 12;

--PMTD Total amount received:
select sum(total_payment) as Total_payment_received from Bank_loan_data where month(issue_date) = 111;

--Average Interest rate:
select Round(avg(int_rate),5)*100 as Avg_int_rate from Bank_Loan_Data

--MTD Average Interest rate:
select Round(avg(int_rate),5)*100 as Avg_int_rate from Bank_Loan_Data
where month(issue_date) = 12;

--PMTD Average Interest rate:
select Round(avg(int_rate),5)*100 as Avg_int_rate from Bank_Loan_Data
where month(issue_date) = 11;

--Average DTI:
select Round(avg(dti),5)*100 as Avg_Dti from Bank_Loan_Data

--MTD Average DTI:
select Round(avg(dti),5)*100 as Avg_Dti from Bank_Loan_Data
where month(issue_date) = 12;

--PMTD Average DTI:
select Round(avg(dti),5)*100 as Avg_Dti from Bank_Loan_Data where month(issue_date) = 11;

--Good loan percentage
select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' Then id End)*100)/ count(id) as Good_loan_percentage from Bank_loan_data;

--Good loan application
select count(id) as Good_loan_application from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

--Good loan funded amount
select sum(loan_amount) as Good_loan_funded_amount from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

--Good loan amount received
select sum(total_payment) as Good_loan_received_amount from Bank_loan_data where loan_status = 'Fully Paid' or loan_status = 'Current';

--Bad loan percentage
select (count(case when loan_status = 'Charged Off' Then id End)*100)/ count(id) as bad_loan_percentage from Bank_loan_data;

--Bad loan application
select count(loan_status) as Bad_loan_application from Bank_loan_data
where loan_status = 'Charged Off';

--Bad loan funded amount
select sum(loan_amount) as Bad_loan_funded_amount from Bank_loan_data
where loan_status = 'Charged Off';

--Bad loan amount received
select sum(total_payment) as Bad_loan_amount_received from Bank_loan_data
where loan_status = 'Charged Off';

--LOAN STATUS
select loan_status, 
count(id) as Loan_count, 
sum(Total_payment) as Total_amount_received, 
sum(loan_amount) as Total_funded_amount,
Avg(int_rate)*100 as Avg_intrest_rate, 
Avg(dti)*100 as Avg_Dti 
from Bank_loan_data 
Group by loan_status;

select loan_status, 
sum(loan_amount) as MTD_Total_funded_amount, 
sum(Total_payment) as MTD_Total_payment_received 
from Bank_loan_data 
where month(issue_date) = 12
Group by loan_status;

--MONTH
select 
month(issue_date) as Month_number,
Datename(Month, issue_date) as Months,
count(id) as No_of_aplications,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received
from Bank_loan_data
group by month(issue_date), Datename(Month, issue_date)
order by month(issue_date);

--STATE
select 
	address_state as State,
	count(id) as No_of_applications,
	sum(loan_amount) as Total_funded_amount,
	sum(total_payment) as Total_amount_received
	from bank_loan_data
	Group by address_state
	order by address_state;

--TERM
select term,
	   sum(loan_amount) as Total_funded_amount,
	   sum(Total_payment) as Total_amount_received
	   from Bank_loan_data
	   Group by term
	   order by term;

--EMPLOYEE LENGTH
select emp_length,
	   count(id) as Total_application,
	   sum(loan_amount) as Total_funded_amount,
	   sum(Total_payment) as Total_amount_received
	   from Bank_loan_data
	   Group by emp_length
	   order by emp_length;

--PURPOSE
select purpose,
	   count(id) as Total_application,
	   sum(loan_amount) as Total_funded_amount,
	   sum(Total_payment) as Total_amount_received
	   from Bank_loan_data
	   Group by purpose
	   order by purpose;

--HOME OWNERSHIP
select home_ownership,
	   count(id) as Total_application,
	   sum(loan_amount) as Total_funded_amount,
	   sum(Total_payment) as Total_amount_received
	   from Bank_loan_data
	   Group by home_ownership
	   order by home_ownership;

--



























