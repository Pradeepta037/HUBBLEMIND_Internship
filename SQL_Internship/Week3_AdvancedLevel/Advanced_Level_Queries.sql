-- Week 3 : Advanced Level

-- Problem 1: Identify the top 5 employees with the highest performance scores across all departments and list their department, job title, and years at the company. 
SELECT 
	EmployeeID, 
    Name, 
	Department, 
	JobTitle, 
	DATEDIFF(CURDATE(), HireDate) / 365 AS Years_At_Company,
	PerformanceScore
FROM 
	epes.employee_performance_evaluation
ORDER BY 
	PerformanceScore DESC
LIMIT 5;


-- Problem 2: Determine the impact of department and job title on performance scores by analysing the average performance score for each combination.
SELECT 
	Department,
	JobTitle,
	AVG(PerformanceScore) AS Average_Performance_Score
FROM 
	epes.employee_performance_evaluation
GROUP BY 
	Department, JobTitle
ORDER BY 
	Department, JobTitle;


-- Problem 3: Create a performance evaluation report that ranks employees by performance score, including their department, job title, and years at the company.
SELECT 
	EmployeeID,
	Name,
	Department,
	JobTitle,
	DATEDIFF(CURDATE(), HireDate) / 365 AS Years_At_Company,
	PerformanceScore
FROM 
	epes.employee_performance_evaluation
ORDER BY 
	PerformanceScore DESC;


-- Problem 4: Develop a recommendation system to suggest potential promotions based on years at the company, job title, and performance score.
SELECT 
	EmployeeID,
	Name,
	Department,
	JobTitle,
	DATEDIFF(CURDATE(), HireDate) / 365 AS Years_At_Company,
	PerformanceScore
FROM 
	epes.employee_performance_evaluation
WHERE 
	(DATEDIFF(CURDATE(), HireDate) / 365) >= 5 -- Employees with at least 5 years at the company
  AND PerformanceScore >= 85 -- Employees with a performance score of 85 or above
  AND JobTitle IN ("Sales Manager", "System Administrator", "Mechanical Engineer", "HR Manager", "Recruiter", 
  "Customer Service Manager", "Content Creator", "Software Engineer", "Accountant", "Data Scientist", 
  "HR Coordinator", "Support Agent", "Sales Representative", "Account Manager", "Network Engineer", 
  "Security Analyst", "IT Support", "Marketing Manager", "Marketing Specialist", 
  "Finance Manager", "Civil Engineer", "Financial Analyst") 
  -- Specific job titles that are considered for promotion
ORDER BY 
	PerformanceScore DESC, Years_At_Company DESC;


-- Problem 5: Perform a year-wise analysis of hiring trends, identifying the number of employees hired each year and any notable patterns.
SELECT 
	YEAR(HireDate) AS Hire_Year,
	COUNT(EmployeeID) AS Number_Of_Employee_Hires
FROM 
	epes.employee_performance_evaluation
GROUP BY 
	YEAR(HireDate)
ORDER BY 
	Hire_Year;


-- Problem 6: Generate a report to identify employees whose salaries are below the department average and have a high performance score (above 80).
SELECT 
	e.EmployeeID,
	e.Name,
	e.Department,
	e.MonthlySalary,
	e.PerformanceScore
FROM 
	epes.employee_performance_evaluation e
JOIN (
    SELECT 
		Department, 
		AVG(MonthlySalary) AS Avg_Department_Salary
    FROM 
		epes.employee_performance_evaluation
    GROUP BY 
		Department
) Dept_Avg ON e.Department = Dept_Avg.Department
WHERE 
	e.MonthlySalary < Dept_Avg.Avg_Department_Salary AND e.PerformanceScore > 80
ORDER BY 
	e.Department, e.PerformanceScore DESC;




