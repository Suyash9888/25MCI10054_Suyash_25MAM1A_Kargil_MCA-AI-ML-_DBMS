# 📘 Worksheet – PostgreSQL Triggers

## 👨‍🎓 Student Details

* **Student Name:** Suyash
* **UID:** 25MCI10054
* **Branch:** MCA (AI & ML)
* **Section/Group:** MAM-1 A
* **Semester:** 2nd
* **Subject Name:** Technical Training - I
* **Subject Code:** 25CAP-652

---

## 🎯 Aim

To implement database triggers in PostgreSQL to automatically calculate values and enforce constraints during data insertion operations.

---

## 🛠️ Tools Used

* PostgreSQL
* pgAdmin
* Windows OS

---

## 📌 Objectives

* Understand how to create and use triggers in PostgreSQL
* Automate calculation of total payable amount
* Enforce constraints using trigger conditions
* Execute logic automatically before inserting data

---

## 📖 Theory

Triggers are special database objects that automatically execute a function when a specified event (INSERT, UPDATE, DELETE) occurs on a table.

In PostgreSQL:

Triggers are linked with trigger functions (PL/pgSQL)
Used for:
* Data integrity
* Business rule enforcement
* Automation

---

## ⚙️ Experiment Steps

### Step 1: Create Table
```sql id="emp1"
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    working_hours INT,
    perhour_salary NUMERIC,
    total_payable_amount NUMERIC
);
```
### Step 2: Create Trigger Function
```sql id="emp1"
CREATE OR REPLACE FUNCTION CACULATE_PAYABLE_AMOUNT()
RETURNS TRIGGER
AS
$$
BEGIN
    NEW.total_payable_amount := NEW.perhour_salary * NEW.working_hours;

    IF NEW.total_payable_amount > 25000 THEN
        RAISE EXCEPTION 'INVALID ENTRY BECAUSE PAYABLE AMOUNT CAN NOT BE GREATER THAN 25000';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
```
### Step 3: Create Trigger
```sql id="emp1"
CREATE OR REPLACE TRIGGER AUTOMATED_PAYABLE_AMOUNT_CALCULATION
BEFORE INSERT
ON employee
FOR EACH ROW
EXECUTE FUNCTION CACULATE_PAYABLE_AMOUNT();
```
### Step 4: Insert Valid Data
```sql id="emp1"
INSERT INTO employee(emp_id, emp_name, working_hours, perhour_salary)
VALUES (1, 'AKASH', 10, 1000);
```
#### Output
![Output](images/image%201.jpg)

### Step 5: Insert Invalid Data (Exception Case)
```sql id="emp1"
INSERT INTO employee(emp_id, emp_name, working_hours, perhour_salary)
VALUES (2, 'Ankush', 8, 100000);
```
#### Output:
![Output](images/image%202.jpg)

### Step 6: Retrieve Data
```sql id="emp1"
SELECT * FROM employee;
```
####  Output:
![Output](images/image%203.jpg)

## 🎓 Learning Outcomes
* Able to create and use triggers in PostgreSQL
* Understand automation using triggers
* Enforce constraints using trigger conditions
* Understand real-time execution of database logic