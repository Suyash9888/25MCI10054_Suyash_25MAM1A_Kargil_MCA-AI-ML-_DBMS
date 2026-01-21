
CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    percentage DECIMAL(5,2)
);
INSERT INTO Students VALUES
(1, 'Amit', 'Delhi', 96.5),
(2, 'Riya', 'Mumbai', 94.2),
(3, 'Rahul', 'Delhi', 97.8),
(4, 'Sneha', 'Mumbai', 98.1),
(5, 'Ankit', 'Chandigarh', 95.6),
(6, 'Pooja', 'Delhi', 93.4),
(7, 'Karan', 'Chandigarh', 96.2);

----- without case statment 
select city , count (*) as student_count from Students
where percentage>95
group by city;

------ with case statment 
select city , sum(case when percentage >95 then 1 else 0 end ) as Student_count
from Students 
group by city ;

-----(2)  with case statment 
select city , Avg (case when percentage > 95 then percentage else null end) as Student_Avg
from Students
group by city 
ORDER BY STUDENT_AVG DESC;

------ without case statment 
select city , avg (percentage) as student_Avg from Students
where percentage >95
group by city;