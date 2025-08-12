
-- ===============================================
-- SQL Script: Sales Trend Analysis (Task 6)
-- Objective: Analyze monthly revenue and order volume
-- Dataset: online_sales (order_date, amount, product_id, order_id)
-- ===============================================

-- 1. Drop table if it exists to avoid duplication
DROP TABLE IF EXISTS online_sales;

-- 2. Create the table structure
CREATE TABLE online_sales (
    order_id INTEGER,
    order_date TEXT,
    amount REAL,
    product_id INTEGER
);

-- 3. Insert 20 sample sales records
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-05', 120.50, 101),
(2, '2023-01-15', 250.00, 102),
(3, '2023-01-20', 180.00, 103),
(4, '2023-02-02', 75.00, 101),
(5, '2023-02-10', 200.00, 104),
(6, '2023-02-18', 150.00, 105),
(7, '2023-03-01', 95.00, 101),
(8, '2023-03-07', 300.00, 102),
(9, '2023-03-12', 210.00, 106),
(10, '2023-04-04', 125.00, 103),
(11, '2023-04-15', 500.00, 107),
(12, '2023-04-28', 320.00, 108),
(13, '2023-05-03', 250.00, 109),
(14, '2023-05-10', 130.00, 110),
(15, '2023-05-20', 220.00, 111),
(16, '2023-06-06', 400.00, 105),
(17, '2023-06-15', 180.00, 102),
(18, '2023-06-25', 90.00, 104),
(19, '2023-07-02', 350.00, 107),
(20, '2023-07-18', 275.00, 106);

-- 4. Query to analyze monthly revenue and order volume
--    - strftime('%Y', order_date) extracts the year
--    - strftime('%m', order_date) extracts the month
--    - SUM(amount) calculates total monthly revenue
--    - COUNT(DISTINCT order_id) calculates number of unique orders
--    - GROUP BY groups results by year and month
--    - ORDER BY sorts results chronologically
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;
