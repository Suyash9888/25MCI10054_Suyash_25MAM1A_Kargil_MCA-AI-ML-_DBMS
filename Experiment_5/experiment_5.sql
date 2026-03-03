---table creation 

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
experience INT,
salary INT,
performance_rating INT
);

INSERT INTO employees VALUES
(101, 'Sumit', 3, 40000, 4),
(102, 'Neha', 6, 50000, 5),
(103, 'Rahul', 2, 32000, 3),
(104, 'Priya', 8, 65000, 5),
(105, 'Karan', 5, 48000, 4);

select * from employees;

---- Simple Forward-Only Cursor
DO $$
DECLARE
emp_record RECORD;
emp_cursor CURSOR FOR
SELECT emp_id, emp_name, salary FROM employees;
BEGIN
OPEN emp_cursor;

LOOP
FETCH emp_cursor INTO emp_record;
EXIT WHEN NOT FOUND;

RAISE NOTICE 'Employee ID: %, Name: %, Salary: %',
emp_record.emp_id, emp_record.emp_name, emp_record.salary;
END LOOP;

CLOSE emp_cursor;
END;
$$;


---Salary Update Using Cursor (Experience + Performance Logic)

DO $$
DECLARE
emp_record RECORD;
emp_cursor CURSOR FOR
SELECT * FROM employees;
bonus NUMERIC;
BEGIN
OPEN emp_cursor;

LOOP
FETCH emp_cursor INTO emp_record;
EXIT WHEN NOT FOUND;

bonus := emp_record.salary *
(emp_record.experience * 0.02 +
emp_record.performance_rating * 0.03);

UPDATE employees
SET salary = salary + bonus
WHERE emp_id = emp_record.emp_id;

RAISE NOTICE 'Salary updated for Employee ID: %',
emp_record.emp_id;
END LOOP;

CLOSE emp_cursor;
END;
$$;

---Exception Handling for Empty Result Set

DO $$
DECLARE
emp_record RECORD;
emp_cursor CURSOR FOR
SELECT * FROM employees WHERE salary > 100000;
BEGIN
OPEN emp_cursor;

FETCH emp_cursor INTO emp_record;

IF NOT FOUND THEN
RAISE NOTICE 'No employee found with given condition';
END IF;

CLOSE emp_cursor;
END;
$$;
