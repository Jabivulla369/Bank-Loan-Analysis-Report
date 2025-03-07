SELECT * FROM bank_loan_data;

-- LOAN APPLICATIONS

SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data;


SELECT COUNT(id) AS MTD_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;


SELECT COUNT(id) AS PMTD_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


-- (MTD - PMTD)/PMTD


-- FUNDED AMOUNTS

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data;

SELECT SUM(loan_amount) AS MTD_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(loan_amount) AS PMTD_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


-- AMOUNT RECIEVED

SELECT SUM(total_payment) AS Total_Amount_Recieved FROM bank_loan_data;

SELECT SUM(total_payment) AS MTD_Amount_Recieved FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT SUM(total_payment) AS PMTD_Amount_Recieved FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;



-- AVERAGE INTEREST RATE

SELECT ROUND(AVG(int_rate),4) * 100 AS Average_Interest_Rate FROM bank_loan_data;


SELECT ROUND(AVG(int_rate),4) * 100 AS MTD_Average_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT ROUND(AVG(int_rate),4) * 100 AS PMTD_Average_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;




-- AVERAGE DEBT-TO-INCOME RATIO

SELECT ROUND(AVG(dti),4) * 100 AS Average_DTI FROM bank_loan_data;

SELECT ROUND(AVG(dti),4) * 100 AS MTD_Average_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT ROUND(AVG(dti),4) * 100 AS PMTD_Average_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


-- GOOD LOAN APPLICATION PERCENTAGE

SELECT
(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
/
COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data


-- GOOD LOAN APPLICATION

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- GOOD LOAN FUNDED AMOUNT


SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


-- GOOD LOAN TOTAL RECIEVED AMOUNT

SELECT SUM(total_payment) AS Good_Loan_Recieved_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'



-- BAD LOAN PERCENTAGE

SELECT
(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0)
/
COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data


-- BAD LOAN TOTAL APPLICATIONS

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'


SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Amount_Recieved FROM bank_loan_data
WHERE loan_status = 'Charged Off'


SELECT
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Recieved,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
	FROM bank_loan_data
	WHERE MONTH(issue_date) = 12
	GROUP BY loan_status



-- MONTHLY TREND BY ISSUE DATE


	SELECT
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_date) Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
	ORDER BY MONTH(issue_date)


-- REGIONAL ANALYSIS BY STATE

SELECT
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY address_state
	ORDER BY Total_Funded_Amount DESC


-- LOAN TERM ANALYSIS

SELECT
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY term
	ORDER BY term


-- EMPLOYEE LENGTH ANALYSIS


SELECT
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY emp_length
	ORDER BY Total_Loan_Applications DESC


-- LOAN PURPOSE BREAKDOWN

SELECT
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY purpose
	ORDER BY Total_Loan_Applications DESC



-- LOAN OWNERSHIP ANALYSIS

SELECT
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
	FROM bank_loan_data
	GROUP BY home_ownership
	ORDER BY Total_Loan_Applications DESC
















