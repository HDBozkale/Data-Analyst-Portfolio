Select Count(ID) as PMTD_Total_Loan_Applications
From Bank_Loan
Where month(issue_date) = 11 AND Year(issue_date) = 2021

--(MTD-PMTD)/(PMTD)

----Total Funded Amount

Select Sum(Loan_amount) as Total_funded_Amount
From BankLoanDB..Bank_Loan

--Total Funded Amount MTD

Select Sum(Loan_amount) as MTD_Total_funded_Amount
From BankLoanDB..Bank_Loan
Where Month(issue_date) = 12 and Year(issue_date) = 2021

--Total Funded Amount PMTD

Select Sum(Loan_amount) as PMTD_Total_funded_Amount
From BankLoanDB..Bank_Loan
Where Month(issue_date) = 11 and Year(issue_date) = 2021
 
---Total amount recieved

Select Sum(total_payment) as Total_Amount_Recieved
From BankLoanDB..Bank_Loan

---Total amount recieved MTM

Select Sum(total_payment) as MTM_Total_Amount_Recieved
From BankLoanDB..Bank_Loan
Where Month(issue_date) = 12 and Year(issue_date) = 2021

---Total amount recieved PMTD

Select Sum(total_payment) as PMTD_Total_Amount_Recieved
From BankLoanDB..Bank_Loan
Where Month(issue_date) = 11 and Year(issue_date) = 2021

---Average Interest Rate

Select ROUND(AVG(CAST(int_rate AS float)), 4) * 100 as AVG_Interest_Rate
From BankLoanDB..Bank_Loan

---Average Interest Amount MTD

Select ROUND(AVG(CAST(int_rate AS float)), 4) * 100 as MTD_AVG_Interest_Rate
From BankLoanDB..Bank_Loan
Where Month(issue_date) = 12 AND Year(issue_date)=2021

---Average Interest Amount PMTD

Select ROUND(AVG(CAST(int_rate AS float)), 4) * 100 as PMTD_AVG_Interest_Rate
From BankLoanDB..Bank_Loan
Where Month(issue_date) = 11 AND Year(issue_date)=2021

---Average Debt to Income Ratio

Select Round(AVG(CAST(dti as Float)), 4) * 100 as AVG_DTI
From BankLoanDB..Bank_Loan

---Average Debt to Income Ratio MTD

Select Round(AVG(CAST(dti as Float)), 4) * 100 as MTD_AVG_DTI
From BankLoanDB..Bank_Loan
Where Month(issue_date) = 12 AND Year(issue_date)= 2021

---Average Debt to Income Ratio PMTD

Select Round(AVG(CAST(dti as Float)), 4) * 100 as PMTD_AVG_DTI
From BankLoanDB..Bank_Loan
Where Month(issue_date) = 11 AND Year(issue_date)= 2021

--GOOD VS BAD LOAN KPI

Select loan_status
From BankLoanDB..Bank_Loan

--Good Loan

Select 
	Count(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) *100
	/
	COUNT(id) AS Good_Loan_percentage
From BankLoanDB..Bank_Loan

--Good Loan Applications

Select Count(id) Good_Loan_Applications
From BankLoanDB..Bank_Loan
Where loan_status = 'Fully Paid' or loan_status = 'Current'


---Good Loan Funded Amount

Select SUM(loan_amount) AS Good_Loan_funded_Amount
From BankLoanDB..Bank_Loan
WHERE loan_status = 'Fully Paid' or loan_status = 'Current'

--Good Loan Total Recieved Amount

Select SUM(total_payment) AS Good_Loan_Recieved_Amount
From BankLoanDB..Bank_Loan
WHERE loan_status = 'Fully Paid' or loan_status = 'Current'

---BAD LOANS

--Total Percentage of Bad Loans

Select Count(CASE WHEN loan_status = 'Charged Off' Then id END) * 100
/
Count(id) AS Bad_loan_Percentage
From BankLoanDB..Bank_Loan

--Bad Loan Applications

Select COUNT(id) AS Bad_Loan_Applications
From BankLoanDB..Bank_Loan
Where loan_status = 'Charged Off'

--Bad_loan_Funded

Select SUM(loan_amount) as Bad_loan_Funded_Amount
From BankLoanDB..Bank_Loan
Where loan_status = 'Charged Off'

--Bad Loan Amount Recieved

Select SUM(total_payment) AS Bad_Loan_Amount_Recieved
From BankLoanDB..Bank_Loan
Where loan_status = 'Charged Off'

--Loan Status Grade View

Select
loan_status,
Count(id) AS Total_Loan_Applications,
SUM(total_payment) as Total_Amount_Recieved,
SUM(loan_amount) as Total_Funded_Amount, 
Round(AVG(CAST(int_rate as float) * 100),2) as Interest_Rate,
Round(AVG(Cast(dti as float) * 100),2) as DTI
From BankLoanDB..Bank_Loan
Group By loan_status

--Loan Status Grade View MTD

Select
loan_status,
SUM(total_payment) as MTD_Total_Amount_Recieved,
SUM(loan_amount) as MTD_Total_Funded_Amount 
From BankLoanDB..Bank_Loan
Where MONTH(issue_date) = 12
Group By loan_status

--DASHBOARD 2 CHARTS OVERVIEW

--Monthly Trends By Issue Date

Select 
	Month(issue_date) as Month_Number,
	DATENAME(MONTH,issue_date) as Month_Name,
	Count(id) AS Total_loan_Applications,
	Sum(loan_amount) as Total_Funded_Amount,
	Sum(total_payment) as Total_Recieved_Amount
From BankLoanDB..Bank_Loan
Group By Month(issue_date),DATENAME(MONTH,issue_date)
Order By Month(issue_date)

--Regional Analysis By State

Select 
address_state,
Count(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funeded_Amount,
SUM(total_payment) AS Total_REcieved_Amount
From BankLoanDB..Bank_Loan
Group By address_state
Order BY SUM(loan_amount) desc

---Loan Term Analysis

Select
	term,
	Count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funeded_Amount,
	SUM(total_payment) AS Total_REcieved_Amount
From BankLoanDB..Bank_Loan
Group By term
Order By term

----Employee Length Analysis

Select
	emp_length,
	Count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funeded_Amount,
	SUM(total_payment) AS Total_REcieved_Amount
From BankLoanDB..Bank_Loan
Group By emp_length
Order By emp_length

----Loan Purpose Breakdown

Select 
	purpose,
	Count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funeded_Amount,
	SUM(total_payment) AS Total_REcieved_Amount
From BankLoanDB..Bank_Loan
Group By purpose
Order By purpose desc

---Home Ownership Analysis

Select 
	home_ownership,
	Count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funeded_Amount,
	SUM(total_payment) AS Total_REcieved_Amount
From BankLoanDB..Bank_Loan
Group By home_ownership
Order By Count(id) desc







