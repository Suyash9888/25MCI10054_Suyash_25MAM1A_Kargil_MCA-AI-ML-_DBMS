CREATE TABLE Violations (
    id INT PRIMARY KEY,             
    Entity_Name VARCHAR(100),       
    Violation_count INT              
);

INSERT INTO Violations VALUES
(1, 'User_data', 13),
(2, 'Payment_data', 5),
(3, 'Audit_data', 22),
(4, 'Order_data', 0),
(5, 'Inventory_data', 0),
(6, 'Supplyer_data', 13);


SELECT*FROM Violations;

----Classifying Data Using CASE Expression
SELECT 
    Entity_name,
    Violation_count,
    CASE
        WHEN violation_count = 0 THEN 'No Violation'
        WHEN violation_count BETWEEN 1 AND 5 THEN 'Minor Violation'
        WHEN violation_count BETWEEN 6 AND 15 THEN 'Moderate Violation'
        ELSE 'Critical Violation'
    END AS Violation_Status
FROM Violations;


---- Applying CASE Logic in Data Updates

ALTER TABLE Violations
ADD COLUMN approval_status VARCHAR(30);

select * from Violations;

UPDATE Violations
SET approval_status =
    CASE
        WHEN violation_count = 0 THEN 'Approved'
        WHEN violation_count BETWEEN 1 AND 15 THEN 'Needs Review'
        ELSE 'Rejected'
    END;


----- Implementing IF–ELSE Logic Using PL/pgSQL


DO $$
DECLARE
    v_violation_count INT := 12;   -- Change value to test output
BEGIN

    IF v_violation_count = 0 THEN
        RAISE NOTICE 'Status: Approved — No violations found';

    ELSIF v_violation_count BETWEEN 1 AND 5 THEN
        RAISE NOTICE 'Status: Needs Review — Minor violations detected';

    ELSIF v_violation_count BETWEEN 6 AND 15 THEN
        RAISE NOTICE 'Status: Needs Review — Moderate violations detected';

    ELSE
        RAISE NOTICE 'Status: Rejected — Critical violations detected';

    END IF;

END $$;

-----Real-World Classification Scenario (Grading System)

CREATE TABLE Grades (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);


---Insert sample student records

INSERT INTO Grades (student_name, marks) VALUES
('Rohit', 95),
('Neha', 82),
('Sumit', 68),
('Priya', 91),
('Mehak', 56),
('Hemant', 45),
('Nikita', 77),
('Prince', 88),
('Atul', 35);

---grade

SELECT 
    student_name,
    marks,
    CASE
        WHEN marks >= 90 THEN 'A+ Grade'
        WHEN marks BETWEEN 80 AND 89 THEN 'A Grade'
        WHEN marks BETWEEN 70 AND 79 THEN 'B Grade'
        WHEN marks BETWEEN 60 AND 69 THEN 'C Grade'
        WHEN marks BETWEEN 40 AND 59 THEN 'D Grade'
        ELSE 'Fail'
    END AS Grade
FROM Grades;



-----Using CASE for Custom Sorting

SELECT 
    entity_name,
    violation_count,
    CASE
        WHEN violation_count > 15 THEN 'Critical Violation'
        WHEN violation_count BETWEEN 6 AND 15 THEN 'Moderate Violation'
        WHEN violation_count BETWEEN 1 AND 5 THEN 'Minor Violation'
        ELSE 'No Violation'
    END AS Violation_Severity
FROM Violations
ORDER BY
    CASE
        WHEN violation_count > 15 THEN 1   
        WHEN violation_count BETWEEN 6 AND 15 THEN 2
        WHEN violation_count BETWEEN 1 AND 5 THEN 3
        ELSE 4                              
    END;
