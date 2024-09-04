-- Week 2 : Intermediate Level

-- Problem 1: Create a list of employees who have been with the company for more than 10 years but have a performance score below 50.
SELECT 
    Name,
    YearsAtCompany,
    PerformanceScore
FROM 
    epes.employee_performance_evaluation
WHERE 
    YearsAtCompany > 10 
    AND PerformanceScore < 50;


-- Problem 2: Determine the average number of years at the company for each job title.
SELECT 
    JobTitle,
    AVG(YearsAtCompany) AS Average_Years_With_Company
FROM 
    epes.employee_performance_evaluation
GROUP BY 
    JobTitle;


-- Problem 3: Find the top 3 highest-paid employees in the HR department.
SELECT 
	EmployeeID, Name, Department, MonthlySalary
FROM 
	epes.employee_performance_evaluation
WHERE 
	Department = "HR"
ORDER BY 
	MonthlySalary DESC
LIMIT 3;


-- Problem 4: Calculate the total number of years all employees have worked at the company combined.
SELECT 
	SUM(YearsAtCompany) AS Total_Years
FROM 
	epes.employee_performance_evaluation;


-- Problem 5: Generate a list of employees who were hired before the year 2000.
SELECT 
	EmployeeID, Name, HireDate
FROM 
	epes.employee_performance_evaluation
WHERE 
	HireDate < "2000-01-01";


-- Problem 6: Find the department with the highest average performance score.
SELECT 
	Department
FROM 
	epes.employee_performance_evaluation
GROUP BY 
	Department
ORDER BY 
	AVG(PerformanceScore) DESC
LIMIT 1;


-- Problem 7: Analyse the distribution of monthly salaries across different departments and identify any significant disparities.
SELECT 
	Department,
	AVG(MonthlySalary) AS Average_Salary,
	MIN(MonthlySalary) AS Min_Salary,
	MAX(MonthlySalary) AS Max_Salary,
	STDDEV(MonthlySalary) AS Salary_StandardDeviation
FROM 
	epes.employee_performance_evaluation
GROUP BY 
	Department
ORDER BY 
	Average_Salary DESC;



