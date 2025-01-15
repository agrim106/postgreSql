CREATE DATABASE
-- 1. Customer Order Analysis
-- Find customers who haven't placed any orders
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 2. Product Inventory Tracking
-- Find products not stocked in any warehouse
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN inventories i ON p.product_id = i.product_id
LEFT JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE i.inventory_id IS NULL;

-- 3. Employee Performance Analysis
-- Find top-performing department by sales
SELECT 
    d.department_name,
    COUNT(s.sale_id) as total_sales,
    SUM(s.sale_amount) as total_revenue
FROM departments d
INNER JOIN employees e ON d.department_id = e.department_id
INNER JOIN sales s ON e.employee_id = s.employee_id
GROUP BY d.department_id, d.department_name
ORDER BY total_revenue DESC;

-- 4. Website User Activity
-- Find users who never logged in
SELECT u.user_id, u.username
FROM users u
LEFT JOIN sessions s ON u.user_id = s.user_id
WHERE s.session_id IS NULL;

-- 5. Social Media Engagement
-- Find most popular posts by likes
SELECT 
    p.post_id,
    p.content,
    COUNT(l.like_id) as like_count
FROM posts p
INNER JOIN likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.content
ORDER BY like_count DESC
LIMIT 10;

-- 6. E-commerce Order Fulfillment
-- Find frequently co-purchased products
WITH product_pairs AS (
    SELECT 
        oi1.product_id as product1_id,
        oi2.product_id as product2_id,
        COUNT(*) as pair_frequency
    FROM order_items oi1
    INNER JOIN order_items oi2 
        ON oi1.order_id = oi2.order_id
        AND oi1.product_id < oi2.product_id
    GROUP BY oi1.product_id, oi2.product_id
)
SELECT 
    p1.product_name as product1,
    p2.product_name as product2,
    pp.pair_frequency
FROM product_pairs pp
INNER JOIN products p1 ON pp.product1_id = p1.product_id
INNER JOIN products p2 ON pp.product2_id = p2.product_id
ORDER BY pp.pair_frequency DESC
LIMIT 10;

-- 7. Financial Transaction Analysis
-- Find suspicious transactions
SELECT 
    c.customer_id,
    c.customer_name,
    t.transaction_amount,
    t.transaction_date
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id
INNER JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_amount > (
    SELECT AVG(transaction_amount) + 2 * STDDEV(transaction_amount)
    FROM transactions
)
ORDER BY t.transaction_amount DESC;

-- 8. Healthcare Patient Monitoring
-- Find patients without recent appointments
SELECT 
    p.patient_id,
    p.patient_name,
    MAX(a.appointment_date) as last_appointment
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.patient_name
HAVING MAX(a.appointment_date) < CURRENT_DATE - INTERVAL '1 year'
    OR MAX(a.appointment_date) IS NULL;

-- 9. Educational Student Performance
-- Find failing students
SELECT 
    s.student_id,
    s.student_name,
    c.course_name,
    g.grade
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id
INNER JOIN courses c ON g.course_id = c.course_id
WHERE g.grade < 60
ORDER BY c.course_name, s.student_name;

-- 10. Supply Chain Management
-- Find inactive suppliers
SELECT 
    s.supplier_id,
    s.supplier_name,
    MAX(o.order_date) as last_order_date
FROM suppliers s
LEFT JOIN orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_id, s.supplier_name
HAVING MAX(o.order_date) < CURRENT_DATE - INTERVAL '3 months'
    OR MAX(o.order_date) IS NULL;