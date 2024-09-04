-- Week 1 : Beginner Level

-- Problem 1: Calculate the average monthly salary for each department.
SELECT 
    Department,
    AVG(MonthlySalary) AS Average_MonthlySalary
FROM 
    epes.employee_performance_evaluation
GROUP BY 
    Department;


-- Problem 2: Identify the employee with the highest performance score in the IT department.
SELECT 
    Name,
    PerformanceScore
FROM 
    epes.employee_performance_evaluation
WHERE 
    Department = 'IT'
ORDER BY 
    PerformanceScore DESC
LIMIT 1;


-- Problem 3: Count the number of employees in each department.
SELECT 
    Department,
    COUNT(*) AS Number_of_Employees
FROM 
    epes.employee_performance_evaluation
GROUP BY 
    Department;


-- Problem 4: Find the employee who has been with the company the longest.
SELECT 
    Name,
    HireDate
FROM 
    epes.employee_performance_evaluation
ORDER BY 
    HireDate ASC
LIMIT 1;


-- Problem 5: Determine the average performance score across all employees.
SELECT 
    AVG(PerformanceScore) AS Average_Performance_Score
FROM 
    epes.employee_performance_evaluation;


-- Problem 6: List all employees who have a performance score above 80.
SELECT 
    Name,
    PerformanceScore
FROM 
    epes.employee_performance_evaluation
WHERE 
    PerformanceScore > 80;


-- Problem 7: Calculate the total monthly salary expenditure for the Finance department.
SELECT 
    SUM(MonthlySalary) AS Total_Monthly_Salary_Expenditure
FROM 
    epes.employee_performance_evaluation
WHERE 
    Department = "Finance";




