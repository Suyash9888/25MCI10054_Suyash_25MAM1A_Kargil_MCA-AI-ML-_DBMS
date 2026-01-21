CREATE TABLE customer_orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price NUMERIC(10,2),
    order_date DATE
);

INSERT INTO customer_orders (customer_name, product, quantity, price, order_date) VALUES
('Amit', 'Laptop', 1, 60000, '2025-01-05'),
('Riya', 'Mobile', 2, 30000, '2025-01-06'),
('Suresh', 'Laptop', 1, 65000, '2025-01-07'),
('Neha', 'Tablet', 3, 15000, '2025-01-08'),
('Ankit', 'Mobile', 1, 20000, '2025-01-09'),
('Pooja', 'Tablet', 2, 12000, '2025-01-10');

Select * from customer_orders;

---2
SELECT * 
FROM customer_orders
WHERE price > 25000;


SELECT *
FROM customer_orders
WHERE 
    CASE 
        WHEN Price > 25000 THEN 1
        ELSE 0
    END = 1;

---3

--Sort by Price (Ascending)
SELECT customer_name, product, price
FROM customer_orders
ORDER BY price ASC;

--Sort by Price (Descending)
SELECT customer_name, product, price
FROM customer_orders
ORDER BY price DESC;

--Sort by Product, then Price
SELECT customer_name, product, price
FROM customer_orders
ORDER BY product ASC, price DESC;


---4  Total Sales Per Product

SELECT product, SUM(price * quantity) AS total_sales
FROM customer_orders
GROUP BY product;

---5
SELECT product, SUM(price * quantity) AS total_sales
FROM customer_orders
GROUP BY product
HAVING SUM(price * quantity) > 50000;


---6
SELECT product, SUM(price)
FROM customer_orders
GROUP BY product
HAVING SUM(price) > 50000;




