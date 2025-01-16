What's the difference between a function and a stored procedure?
That is a great question, and very interesting. Compare functions to a calculator. They take input, and always return a certain value. A stored procedure can be thought of as the act of following a recipe; they are able to update ingredients (modify data), add comments in one's cookbook (insert data), or perform multiple procedures at the same time. In contrast, functions are inherently more restrictive in a positive way-they are like purely mathematical equations that do not change the outside world.

Can a function have side effects?
This gets into some interesting database theory. 
While technically possible in some cases, functions are generally designed to be "pure" - like mathematical functions in algebra.
They should give you the same output every time you provide the same input, without changing anything else in the database.
Some databases do allow functions to have side effects, though it's generally considered a practice to avoid, like mixing oil and water.

This also facilitates good readability and maintainability of the code.
This is where functions really come into their own! Think of them as being like LEGO bricks. Instead of writing the same complex calculation or logic over and over, you create one well-named function that clearly states its purpose. It's as if you were creating your vocabulary for your database - when you name a function something like "calculate_total_revenue", anyone reading the code instantly knows what it does.

What are some performance considerations when using functions?
Each function call has some overhead-it's like making a phone call instead of talking in person. 
If you're calling a function for each row in a large dataset, it's similar to making thousands of phone calls when you could have had one meeting.
The database optimizer will have a tougher time optimizing queries that involve functions, especially when such functions are complex.

What are some examples of built-in functions in PostgreSQL?
PostgreSQL provides numerous built-in functions for various purposes:

String Functions: LENGTH(), CONCAT(), SUBSTRING(), UPPER(), LOWER()
Numeric Functions: ROUND(), CEIL(), FLOOR(), POWER()
Date/Time Functions: CURRENT_DATE, CURRENT_TIMESTAMP, AGE(), DATE_PART()
Aggregate Functions: SUM(), AVG(), COUNT(), MAX(), MIN()
Array Functions: ARRAY_AGG(), UNNEST()



             List of relations
 Schema |      Name       | Type  |  Owner   
--------+-----------------+-------+----------
 public | customers       | table | postgres
 public | employeerecords | table | postgres
 public | orders          | table | postgres
(3 rows)

                    Table "public.employeerecords"
     Column      |       Type        | Collation | Nullable | Default 
-----------------+-------------------+-----------+----------+---------
 emp_id          | character varying |           | not null | 
 name            | character varying |           | not null | 
 last_name       | character varying |           |          | 
 pan_id          | character varying |           | not null | 
 age             | integer           |           |          | 
 salary          | double precision  |           |          | 
 phone_number    | double precision  |           |          | 
 gender          | character varying |           |          | 
 date_of_joining | date              |           |          | 
 designation     | character varying |           | not null | 
Indexes:
    "employeerecords_pkey" PRIMARY KEY, btree (emp_id)

                    Table "public.employeerecords"
     Column      |       Type        | Collation | Nullable | Default 
-----------------+-------------------+-----------+----------+---------
 emp_id          | character varying |           | not null | 
 name            | character varying |           | not null | 
 last_name       | character varying |           |          | 
 pan_id          | character varying |           | not null | 
 age             | integer           |           |          | 
 salary          | double precision  |           |          | 
 phone_number    | double precision  |           |          | 
 gender          | character varying |           |          | 
 date_of_joining | date              |           |          | 
 designation     | character varying |           | not null | 
Indexes:
    "employeerecords_pkey" PRIMARY KEY, btree (emp_id)

                      Table "public.orders"
   Column    |       Type        | Collation | Nullable | Default 
-------------+-------------------+-----------+----------+---------
 order_id    | character varying |           | not null | 
 order_name  | character varying |           | not null | 
 customer_id | character varying |           |          | 
 orderdate   | date              |           |          | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (order_id)
Foreign-key constraints:
    "orders_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

                      Table "public.customers"
    Column     |       Type        | Collation | Nullable | Default 
---------------+-------------------+-----------+----------+---------
 customer_id   | character varying |           | not null | 
 customer_name | character varying |           | not null | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
Referenced by:
    TABLE "orders" CONSTRAINT "orders_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)



                                                                                                                                                                                                                                                                                         

CREATE FUNCTI
CREATE FUNCTION  emp_id  |   name    | last_name |   pan_id   | age | salary  | phone_number | gender | date_of_joining |       designation        
----------+-----------+-----------+------------+-----+---------+--------------+--------+-----------------+--------------------------
 GNB9090  | Patrick   | Bateman   | BOCRT2985K |  24 |   90000 |   8987654532 | Male   | 2024-06-01      | GraphicDesign
 BNL0912  | Arthur    | Morgan    | BRST8956P  |  22 |   67000 |   8233556678 | Male   | 2023-11-05      | QualityTesting
 JAQ6547  | Alexander | Pushkin   | RUNWQ8901L |  52 |  127000 |   7765983240 | Male   | 2009-05-25      | CodeReviewer
 RSA7015  | Marco     | Rossi     | TASQ8901T  |  36 |  300000 |   6765398015 | Male   | 2006-08-13      | VicePresident
 FCV5183  | Marriane  | Barr      | QSXU8901L  |  28 |   70000 |   1256346539 | Female | 2011-02-12      | SystemAnalyst
 ASF1982  | Jenny     | Heur      | KEOT1743X  |  34 |   84000 |   9934546780 | Female | 2019-10-12      | SeniorDesigner
 MST2002  | Jensen    | Huang     | KNGT8923I  |  53 | 1000000 |   5653249875 | Male   | 2005-03-01      | CEO
 ACX4782  | Pamela    | Teressa   | RFSD1233V  |  29 |  100000 |   1456920912 | Female | 2008-03-02      | SeniorAnalyst
 WER2143  | Eve       | Baker     | OIUD1342O  |  33 |  400000 |   9888234873 | Female | 2005-07-09      | DatabaseManagement
 HRYU1098 | Masha     | Gauge     | ASFE13243  |  23 |   72000 |   1288534124 | Female | 2013-07-07      | JuniorDatabaseManagement
(10 rows)

 get_employee_salary 
---------------------
               90000
(1 row)

