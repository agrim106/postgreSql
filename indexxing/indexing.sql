              List of relations
 Schema |      Name       | Type  |  Owner   
--------+-----------------+-------+----------
 public | customers       | table | postgres
 public | employeerecords | table | postgres
 public | orders          | table | postgres
(3 rows)

  emp_id  |   name    | last_name |   pan_id   | age | salary  | phone_number | gender | date_of_joining |       designation        
----------+-----------+-----------+------------+-----+---------+--------------+--------+-----------------+--------------------------
 BNL0912  | Arthur    | Morgan    | BRST8956P  |  22 |   67000 |   8233556678 | Male   | 2023-11-05      | QualityTesting
 JAQ6547  | Alexander | Pushkin   | RUNWQ8901L |  52 |  127000 |   7765983240 | Male   | 2009-05-25      | CodeReviewer
 RSA7015  | Marco     | Rossi     | TASQ8901T  |  36 |  300000 |   6765398015 | Male   | 2006-08-13      | VicePresident
 FCV5183  | Marriane  | Barr      | QSXU8901L  |  28 |   70000 |   1256346539 | Female | 2011-02-12      | SystemAnalyst
 ASF1982  | Jenny     | Heur      | KEOT1743X  |  34 |   84000 |   9934546780 | Female | 2019-10-12      | SeniorDesigner
 MST2002  | Jensen    | Huang     | KNGT8923I  |  53 | 1000000 |   5653249875 | Male   | 2005-03-01      | CEO
 ACX4782  | Pamela    | Teressa   | RFSD1233V  |  29 |  100000 |   1456920912 | Female | 2008-03-02      | SeniorAnalyst
 WER2143  | Eve       | Baker     | OIUD1342O  |  33 |  400000 |   9888234873 | Female | 2005-07-09      | DatabaseManagement
 HRYU1098 | Masha     | Gauge     | ASFE13243  |  23 |   72000 |   1288534124 | Female | 2013-07-07      | JuniorDatabaseManagement
 GNB9090  | Patrick   | Bateman   | BOCRT2985K |  24 |   95000 |   8987654532 | Male   | 2024-06-01      | GraphicDesign
(10 rows)

                      Table "public.customers"
    Column     |       Type        | Collation | Nullable | Default 
---------------+-------------------+-----------+----------+---------
 customer_id   | character varying |           | not null | 
 customer_name | character varying |           | not null | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
Referenced by:
    TABLE "orders" CONSTRAINT "orders_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

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

 customer_id |  customer_name  
-------------+-----------------
 CUST001     | John Smith
 CUST002     | Sarah Johnson
 CUST003     | Michael Chen
 CUST004     | Emma Wilson
 CUST005     | David Rodriguez
(5 rows)

 order_id |        order_name         | customer_id | orderdate  
----------+---------------------------+-------------+------------
 ORD001   | E-commerce Frontend       | CUST001     | 2025-01-10
 ORD002   | Mobile App UI/UX          | CUST002     | 2025-01-12
 ORD003   | Game Development          | CUST003     | 2025-01-13
 ORD004   | Cloud Migration           | CUST004     | 2025-01-14
 ORD005   | Blockchain Implementation | CUST005     | 2025-01-15
(5 rows)

CREATE INDEX
CREATE INDEX
CREATE INDEX
 order_id |    order_name    | customer_id | orderdate  
----------+------------------+-------------+------------
 ORD002   | Mobile App UI/UX | CUST002     | 2025-01-12
(1 row)

