-- 1) Select firstname, lastname, title, age, salary for everyone in your Employee table.
SELECT firstname, lastname, title, age, salary 
FROM Employee;

--2) Select firstname, age and salary for everyone in your Employee table.
SELECT firstname, age, salary 
FROM Employee;

--3) Selct firstname and display as 'Name' for everyone in your Employee table
SELECT firstname AS Name 
FROM Employee;

--4) Select firstname and lastname as 'Name' for everyone. Use " " (space) to separate firstname and last.
SELECT firstname + ' ' + lastname  AS Name
FROM Employee;

--5)  Select all columns for everyone with a salary over 38000. 
SELECT * 
FROM Employee
WHERE salary > 38000;

--6) Select first and last names for everyone that's under 24 years old. 
SELECT firstname, lastname
FROM Employee
WHERE age < 24;

--7) Select first name, last name, and salary for anyone with "Programmer" in their title.
SELECT firstname, lastname, salary
FROM Employee 
WHERE title = 'Programmer';

--8)  Select all columns for everyone whose last name contains "O".
SELECT * 
FROM Employee
WHERE lastname LIKE '%O';

--9) Select the lastname for everyone whose first name equals "Kelly". 
SELECT lastname 
FROM Employee 
WHERE firstname = 'Kelly';

--10) . Select all columns for everyone whose last name ends in "Moore".
SELECT *
FROM Employee 
WHERE lastname like '%Moore';

--11) Select all columns for everyone who are 35 and above
SELECT *
FROM Employee
WHERE age >= 35;

--12)  Select firstname ,lastname,age and salary of everyone whose age is above 24 and below 43.
SELECT firstname, lastname, age, salary
FROM Employee
WHERE age > 24 AND age < 43;

--13)  Select firstname, title and lastname whose age is in the range 28 and 62 and salary greater than 31250
SELECT firstname, title, lastname
FROM Employee
WHERE age BETWEEN 28 AND 62 AND salary > 31250;

--14) Select all columns for everyone whose age is not more than 48 and salary not less than 21520
SELECT *
FROM Employee
WHERE age <= 48 AND salary >= 21520;

--15) Select firstname and age of everyone whose firstname starts with "John" and salary in the range 25000 and 35000
SELECT firstname, age 
FROM Employee
WHERE firstname LIKE 'John%' AND salary BETWEEN 25000 and 35000;

--16)  Select all columns for everyone by their ages in descending order
SELECT * 
FROM Employee
ORDER BY age DESC;

--17)  Select all columns for everyone by their ages in ascending order.
SELECT * 
FROM Employee
ORDER BY age;

--18) Select all columns for everyone by their salaries in descending order
SELECT * 
FROM Employee
ORDER BY salary DESC;

--19) Select all columns for everyone by their salaries in ascending order.
SELECT * 
FROM Employee
ORDER BY salary ;

--20) Select all columns for everyone by their salaries in ascending order whose age not less than 17.
SELECT *
FROM Employee 
WHERE age >= 17
ORDER BY salary;

--21) Select all columns for everyone by their salaries in descending order whose age not more than 34.
SELECT *
FROM Employee 
WHERE age <= 34
ORDER BY salary DESC;

--22)  Select all columns for everyone by their length of firstname in ascending order
SELECT * 
FROM Employee
ORDER BY LEN(firstname) 

--23)  Select the number of employees whose age is above 45
SELECT count(*) AS no_of_employees
FROM Employee
WHERE age > 45;

--24) Show the results by adding 5 to ages and removing 250 from salaries of all employees
SELECT FirstName, LastName, Age+ 5 AS Age , Salary - 250 AS Salary
FROM Employee;

--25) Select the number of employees whose lastname ends with "re" or "ri" or "ks"
SELECT COUNT(*)
FROM Employee
WHERE LastName LIKE '%re' OR LastName LIKE '%ri' OR LastName LIKE '%ks';

--26)  Select the average salary of all your employees
SELECT AVG(salary) AS Avg_Salary
FROM employee;

--27)  Select the average salary of Freshers
SELECT AVG(salary) AS Avg_Salary
FROM employee
WHERE title = 'Fresher';

--28) . Select the average age of Programmers
SELECT AVG(salary) AS Avg_Salary
FROM employee
WHERE title = 'Programmer';

--29) Select the average salary of employees whose age is not less than 35 and not more than 50
SELECT AVG(salary) AS Avg_Salary
FROM employee
WHERE age >= 35 AND age <= 50;

--30) Select the number of Freshers
SELECT COUNT(*) AS No_of_Freshers
FROM employee
WHERE title = 'Fresher';

--31) What percentage of programmers constitute your employees
SELECT (CAST( COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM Employee))*100 AS PercentageOfProgrammers
FROM Employee
WHERE title = 'Programmer';

--32) What is the combined salary that you need to pay to the employees whose age is not less than 40
SELECT SUM(salary) AS combined_salary 
FROM employee
WHERE age >= 40;

--33) What is the combined salary that you need to pay to all the Freshers and Programmers for 1 month
SELECT SUM(salary) AS combined_salary 
FROM employee
WHERE title = 'Programmer' OR title = 'Fresher';

--34) What is the combined salary that you need to pay to all the Freshers whose age is greater than 27 for 3years
SELECT SUM(salary)*36 AS combined_salary 
FROM employee
WHERE title = 'Fresher' AND age > 27;

--35)  Select the eldest employee's firstname, lastname and age whose salary is less than 35000
SELECT firstname, lastname, age
FROM employee 
WHERE age = (
				SELECT MAX(age)
				FROM employee
				WHERE salary < 35000
			);

-- 36)  Who is the youngest General Manager
SELECT * 
FROM employee
Where  title = 'General Manager' AND age = (SELECT MIN(age) FROM employee WHERE title = 'General Manager'  );

--37)  Select the eldest fresher whose salary is less than 35000
SELECT * 
FROM employee
Where  title = 'Fresher' AND age = (SELECT MAX(age) FROM employee WHERE title = 'Fresher');

--38) Select firstname and age of everyone whose firstname starts with "John" or "Michael" and salary in range 17000 and 26000
SELECT firstname, age
FROM employee 
WHERE firstname IN ('John', 'Michael') AND salary BETWEEN 17000 AND 26000;

--39)  How many employees are having each unique title. Select the title and display the number of employees present in ascending order
SELECT title, count(*) AS No_of_Employees
FROM employee 
GROUP BY title;

--40) . What is the average salary of each unique title of the employees. Select the title and display the average salary of employees in each
SELECT title, AVG(salary) AS AVG_Salary_of_Employees
FROM employee 
GROUP BY title;

--41)  What is the average salary of employees excluding Freshers
SELECT AVG(salary) AS AVG_SALARY_of_non_freshers
FROM employee
WHERE title != 'Fresher';

--42) . What is the average age of employees of each unique title.
SELECT title, AVG(salary) AS AVG_Salary_of_Employees
FROM employee 
GROUP BY title;

--43)  In the age range of 25 to 40 get the number of employees under each unique title.
SELECT title, COUNT(*) AS Number_of_Employees
FROM employee 
WHERE age BETWEEN 25 AND 40
GROUP BY title;

--44) Show the average salary of each unique title of employees only if the average salary is not less than 25000
SELECT title, AVG(salary) AS AVG_Salary_of_Employees
FROM employee 
GROUP BY title
HAVING AVG(salary) > 25000;

--45) Show the sum of ages of each unique title of employee only if the sum of age is greater than 30
SELECT title, sum(age) AS Sum_of_ages_Employees
FROM employee 
GROUP BY title
HAVING sum(age) > 30;

--46) Lisa Ray just got married to Michael Moore. She has requested that her last name be updated to Moore
UPDATE employee 
SET lastname = 'Moore'
where firstname = 'Lisa' and lastname='Ray';

-- 47)  Ginger Finger's birthday is today, add 1 to his age and a bonus of 5000
UPDATE employee 
SET age = age + 1, salary = salary + 5000
WHERE firstname = 'Ginger' and lastname = 'Finger';

--48) All 'Programmer's are now called "Engineer"s. Update all titles accordingly. 
UPDATE employee 
SET title = 'Engineer'
WHERE title = 'Programmer';

--49) Everyone whose making under 30000 are to receive a 3500 bonus. 
UPDATE employee
SET salary = salary + 3500
WHERE salary < 30000;

--50) Everyone whose making over 35500 are to be deducted 15% of their salarie
UPDATE employee
SET salary = salary - (salary * 0.15)
WHERE salary > 35500;
