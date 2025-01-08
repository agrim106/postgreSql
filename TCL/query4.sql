BEGIN
ROLLBACK
BEGIN
UPDATE 4
                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =Tc/postgres         +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres+
           |          |          |                 |                    |                    |        |           | agrim=c/postgres
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(4 rows)

COMMIT
BEGIN
UPDATE 1
INSERT 0 1
COMMIT
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | employees | table | postgres
 public | products  | table | postgres
(2 rows)

BEGIN
DELETE 1
INSERT 0 1
ROLLBACK
                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =Tc/postgres         +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres+
           |          |          |                 |                    |                    |        |           | agrim=c/postgres
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(4 rows)

BEGIN
UPDATE 1
ROLLBACK
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
         106 | agrim      | chaudhary |  90000
         127 | peter      | parker    |  70000
         129 | akshay     | katoch    |  20000
(3 rows)

 products_id | product_name | price 
-------------+--------------+-------
         107 | shampoo      | 99999
         850 | Laptop       | 99999
        7779 | Gold         | 99999
         177 | watches      | 99999
         888 | Tablet       |   300
(5 rows)

Q1 => Create a transaction to insert two new employees and update the salary of an existing employee.
BEGIN;

-- Insert two new employees
INSERT INTO employees (employee_id, first_name, last_name, salary) VALUES (130, 'john', 'doe', 50000);
INSERT INTO employees (employee_id, first_name, last_name, salary) VALUES (131, 'jane', 'smith', 55000);

-- Update the salary of an existing employee
UPDATE employees SET salary = 60000 WHERE employee_id = 129;

-- Commit the transaction to save the changes
COMMIT;

Q2 => Create a transaction to delete a product and insert a new product.
BEGIN;

-- Delete a product
DELETE FROM products WHERE product_id = 850;

-- Insert a new product
INSERT INTO products (product_id, product_name, price) VALUES (999, 'Smartphone', 899);

-- Rollback the transaction to undo the changes
ROLLBACK;

Q3 => Create a transaction to update the price of a product and insert a new product.
BEGIN;

-- Update the price of a product
UPDATE products SET price = 99999 WHERE product_id = 177;

-- Insert a new product
INSERT INTO products (product_id, product_name, price) VALUES (888, 'Tablet', 300);

-- Commit the transaction to save the changes
COMMIT;
