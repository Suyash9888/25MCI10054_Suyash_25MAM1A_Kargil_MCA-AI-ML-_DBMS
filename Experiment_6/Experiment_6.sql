CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
salary INT,
status VARCHAR(20),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO employees VALUES
(101, 'Sumit', 45000, 'Active', 2),
(102, 'Neha', 52000, 'Active', 1),
(103, 'Rahul', 38000, 'Inactive', 2),
(104, 'Priya', 60000, 'Active', 3),
(105, 'Karan', 48000, 'Active', 1);

Select * from departments;
Select * from employees;
--- Creating a Simple View for Data Filtering
CREATE VIEW active_employees AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE status = 'Active';

SELECT * FROM active_employees;

--- Creating a View Using JOIN (Multiple Tables)

CREATE VIEW employee_department AS
SELECT e.emp_id, e.emp_name, d.dept_name, e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

SELECT * FROM employee_department;

---Creating an Advanced Summarization View

CREATE VIEW department_salary_summary AS
SELECT d.dept_name,
COUNT(e.emp_id) AS total_employees,
AVG(e.salary) AS avg_salary,
MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM department_salary_summary;

