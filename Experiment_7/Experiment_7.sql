CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
truncate students;
INSERT INTO students VALUES
(1, 'Amit', 101),
(2, 'Neha', 102),
(3, 'Rahul', 101),
(4, 'Priya', 103),
(5, 'Karan', 102),
(6, 'sumit' , NULL);

select * from students;

INSERT INTO courses VALUES
(201, 'DBMS'),
(202, 'Machine Learning'),
(203, 'Web Development'),
(204, 'Data Structures');
select * from courses;
INSERT INTO enrollments VALUES
(1, 1, 201),
(2, 1, 202),
(3, 2, 203),
(4, 3, 201),
(5, 4, 204);
Select * From enrollments ;

INSERT INTO departments VALUES
(101, 'Computer Science'),
(102, 'Information Technology'),
(103, 'Artificial Intelligence');

select * from departments;


--List students with their enrolled courses (INNER JOIN)

SELECT s.student_id, s.student_name, c.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;


--Find students not enrolled in any course (LEFT JOIN)

SELECT s.student_id, s.student_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id IS NULL;

--Display all courses with or without enrolled students (RIGHT JOIN)

SELECT s.student_name, c.course_name
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;

--Show students with department info (Multiple JOIN)

SELECT s.student_id, s.student_name, d.department_name
FROM students s
JOIN departments d ON s.department_id = d.department_id;

--Display all possible student-course combinations (CROSS JOIN)

SELECT s.student_name, c.course_name
FROM students s
CROSS JOIN courses c;