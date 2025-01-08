INSERT 0 1
                                          Table "public.staff"
   Column    |       Type        | Collation | Nullable |                    Default                    
-------------+-------------------+-----------+----------+-----------------------------------------------
 employee_id | integer           |           | not null | nextval('employee_employee_id_seq'::regclass)
 first_name  | character varying |           | not null | 
 last_name   | character varying |           |          | 
 salary      | double precision  |           | not null | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (employee_id)

         List of relations
 Schema | Name  | Type  |  Owner   
--------+-------+-------+----------
 public | staff | table | postgres
(1 row)

                                          Table "public.staff"
   Column    |       Type        | Collation | Nullable |                    Default                    
-------------+-------------------+-----------+----------+-----------------------------------------------
 employee_id | integer           |           | not null | nextval('employee_employee_id_seq'::regclass)
 first_name  | character varying |           | not null | 
 last_name   | character varying |           |          | 
 salary      | double precision  |           | not null | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (employee_id)

INSERT 0 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
         106 | agrim      | chaudhary |  90000
         129 | akshay     | katoch    | 980000
         147 | aman       | dhamija   |  80000
         127 | peter      | parker    |  70000
(4 rows)

ALTER TABLE
 employee_id 
-------------
         106
         129
         147
         127
(4 rows)

          row          
-----------------------
 (106,agrim,chaudhary)
 (129,akshay,katoch)
 (147,aman,dhamija)
 (127,peter,parker)
(4 rows)

UPDATE 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
         106 | agrim      | chaudhary |  90000
         147 | aman       | dhamija   |  80000
         127 | peter      | parker    |  70000
         129 | akshay     | katoch    |  20000
(4 rows)

DELETE 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
         106 | agrim      | chaudhary |  90000
         127 | peter      | parker    |  70000
         129 | akshay     | katoch    |  20000
(3 rows)

 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
         106 | agrim      | chaudhary |  90000
(1 row)

           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | employees | table | postgres
(1 row)

CREATE TABLE
                                         Table "public.products"
    Column    |       Type        | Collation | Nullable |                    Default                    
--------------+-------------------+-----------+----------+-----------------------------------------------
 products_id  | integer           |           | not null | nextval('products_products_id_seq'::regclass)
 product_name | character varying |           |          | 
 price        | integer           |           |          | 
Indexes:
    "products_pkey" PRIMARY KEY, btree (products_id)

INSERT 0 1
 products_id | product_name | price 
-------------+--------------+-------
         101 | paper        |     5
(1 row)

INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
 products_id | product_name | price 
-------------+--------------+-------
         101 | paper        |     5
         107 | shampoo      |    51
         177 | watches      |   571
        7779 | Gold batches |  8571
         850 | Laptop       | 85751
(5 rows)

UPDATE 1
 products_id | product_name | price 
-------------+--------------+-------
         101 | paper        |     5
         107 | shampoo      |    51
         177 | watches      |   571
         850 | Laptop       | 85751
        7779 | Gold batches | 78900
(5 rows)

UPDATE 1
 products_id | product_name | price 
-------------+--------------+-------
         101 | paper        |     5
         107 | shampoo      |    51
         177 | watches      |   571
         850 | Laptop       | 85751
        7779 | Gold         | 78900
(5 rows)

 products_id | product_name | price 
-------------+--------------+-------
         850 | Laptop       | 85751
        7779 | Gold         | 78900
(2 rows)

DELETE 1
 products_id | product_name | price 
-------------+--------------+-------
         107 | shampoo      |    51
         177 | watches      |   571
         850 | Laptop       | 85751
        7779 | Gold         | 78900
(4 rows)
Q1 =>Insert three new employees into the "employees" table. 
 Insert Into staff (employee_id , first_name , last_name , salary) values (127 , 'peter' , 'parker' ,70000);
 Insert Into staff (employee_id , first_name , last_name , salary) values (106 , 'agrim' , 'chaudhary' ,90000);
 Insert Into staff (employee_id , first_name , last_name , salary) values (129 , 'akshay' , 'katoch' ,20000);
Q2 =>Retrieve all employee records from the "employees" table.
select * from employees;
Q3 => Retrieve only the first and last names of all employees.
 select (employee_id, first_name , last_name) from employees;
Q4 =>Update the salary of an employee with a specific employee_id.
 update employees set salary = 20000 where employee_id = 129;
Q5 =>Delete the record of an employee with a specific employee_id.
delete from employees where employee_id = 147;
Q6 => Retrieve all employees whose salary is greater than a certain amount.
select * from employees where salary > 81000;
Q7 =>Insert five new products into the "products" table.
company=# insert into products (products_id , product_name , price) values (101 , 'paper' , 5);
company=# insert into products (products_id , product_name , price) values (107 , 'shampoo' , 51);
company=# insert into products (products_id , product_name , price) values (177 , 'watches' , 571);
company=# insert into products (products_id , product_name , price) values (7779 , 'Gold batches' , 8571);
company=# insert into products (products_id , product_name , price) values (850 , 'Laptop' , 85751);
Q8 =>Update the price of a specific product.
update products set price = 78900 where product_id = 7779;
Q9 =>Retrieve all products with a price between a certain range.
select * from products where price > 41000;
Q10 =>Delete all products with a price below a certain threshold.
delete from products where price < 10;
