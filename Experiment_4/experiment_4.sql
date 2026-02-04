CREATE TABLE employees (
  emp_id     int PRIMARY KEY,
  emp_name   VARCHAR(50),
  salary     int
);

INSERT INTO employees VALUES 
(101, 'Sumit', 45000),
(102, 'Neha', 52000),
(103, 'Rahul', 38000),
(104, 'Priya', 60000),
(105, 'Karan', 48000);

---example 1
do $$ 
begin 
for i in 1..5 loop 
raise notice 'Iteration Number: %', i; 
end loop; 
end; 
$$ ;

---example 2
do $$
declare 
    rec RECORD; 
BEGIN
  FOR rec IN (SELECT emp_id, emp_name FROM employees) LOOP
     raise notice 'Employee ID: %, Name: %', rec.emp_id, rec.emp_name;
  END LOOP;
END;
$$;


----example 3
do $$ 
declare 
    counter INT := 1; 
begin 
    while counter <= 5 loop 
        raise notice 'Counter value: %', counter; 
        counter := counter + 1; 
    end loop; 
end; 
$$ ;

---example 4
do $$ 
declare 
counter int := 1; 
begin 
loop 
raise notice 'Counter value: %', counter; 
counter := counter + 1; 
exit when counter > 4; 
end loop; 
end; 
$$ ;


----example 5
do $$ 
declare 
 rec RECORD; 
begin 
    for rec in 
        select emp_id, salary from employees 
    loop 
        update employees 
        set salary = salary * 1.10 
        where emp_id = rec.emp_id; 
 
        raise notice 'Updated salary for Employee ID: %', rec.emp_id; 
    end loop; 
end; 
$$ ;

---example 6
do $$ 
declare 
 rec RECORD; 
begin 
    for rec in 
        select emp_id, salary from employees 
    loop 
if rec.salary > 50000 then 
raise notice 'Employee ID % has salary more than 50000', rec.emp_id; 
else 
raise notice 'Employee ID % has salary less than 50000', rec.emp_id; 
end if; 
end loop; 
end; 
$$;

