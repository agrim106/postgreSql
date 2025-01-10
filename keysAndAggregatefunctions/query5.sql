CREATE DATABASE
CREATE TABLE
          List of relations
 Schema |   Name   | Type  |  Owner   
--------+----------+-------+----------
 public | products | table | postgres
(1 row)

CREATE TABLE
 product_id | product_name | price | qty 
------------+--------------+-------+-----
(0 rows)

           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | customers | table | postgres
 public | products  | table | postgres
(2 rows)

INSERT 0 3
 product_id | product_name  | price | qty  
------------+---------------+-------+------
        909 | paper         |  50.3 |  150
        787 | carboardBoxes |  89.4 |  450
        546 | pens          |  10.5 | 1000
(3 rows)

INSERT 0 5
 product_id | product_name  | price | qty  
------------+---------------+-------+------
        909 | paper         |  50.3 |  150
        787 | carboardBoxes |  89.4 |  450
        546 | pens          |  10.5 | 1000
        635 | envelopes     |   2.5 | 2000
        899 | Notebooks     |  90.3 |  850
        101 | pencils       |   1.5 | 5000
        103 | crayons       |   3.5 |  420
        102 | paints        | 30.45 |   80
(8 rows)

INSERT 0 1
 customer_id | name | items_purchased | total 
-------------+------+-----------------+-------
           1 | John | pens            |     5
(1 row)

CREATE TABLE
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | customers | table | postgres
 public | orders    | table | postgres
 public | products  | table | postgres
(3 rows)

DROP TABLE
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | customers | table | postgres
 public | products  | table | postgres
(2 rows)

CREATE TABLE
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | customers | table | postgres
 public | orders    | table | postgres
 public | products  | table | postgres
(3 rows)

 order_id | customers_id | items_ordered | orderqty | totalrate 
----------+--------------+---------------+----------+-----------
(0 rows)

ALTER TABLE
 order_id | customers_id | items_ordered | orderqty 
----------+--------------+---------------+----------
(0 rows)

INSERT 0 1
 customer_id |  name  | items_purchased | total 
-------------+--------+-----------------+-------
           1 | John   | pens            |     5
           2 | Akshay | paper           |    10
(2 rows)

INSERT 0 2
 customer_id |  name  | items_purchased | total 
-------------+--------+-----------------+-------
           1 | John   | pens            |     5
           2 | Akshay | paper           |    10
           3 | Agrim  | cdBxs           |    20
           4 | philip | pncl            |    61
(4 rows)

           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | customers | table | postgres
 public | orders    | table | postgres
 public | products  | table | postgres
(3 rows)

DROP TABLE
DROP TABLE
          List of relations
 Schema |   Name   | Type  |  Owner   
--------+----------+-------+----------
 public | products | table | postgres
(1 row)

CREATE TABLE
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | customers | table | postgres
 public | products  | table | postgres
(2 rows)

 customer_id | product_id | first_name | last_name 
-------------+------------+------------+-----------
(0 rows)

CREATE TABLE
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | customers | table | postgres
 public | orders    | table | postgres
 public | products  | table | postgres
(3 rows)

 order_id | customer_id | product_id | orderqty 
----------+-------------+------------+----------
(0 rows)

INSERT 0 4
 customer_id | product_id | first_name | last_name 
-------------+------------+------------+-----------
           1 |        102 | agrim      | chaudhary
           2 |        101 | akshay     | katoch
           3 |        787 | steve      | rogers
           4 |        546 | tony       | soprano
(4 rows)

 order_id | customer_id | product_id | orderqty 
----------+-------------+------------+----------
(0 rows)

INSERT 0 3
 order_id | customer_id | product_id | orderqty 
----------+-------------+------------+----------
      200 |           1 |        102 |        5
      201 |           2 |        101 |        4
      202 |           3 |        787 |       12
(3 rows)

Keys
Design a database for an e-commerce store.
Identify the primary key for the customers table.
Define the foreign key relationship between orders and customers.

postgres=# create database shoppingstore;

create table customers (
    customer_id serial primary key, 
    product_id integer references products(product_id), 
    first_name varchar, 
    last_name varchar
);

create table orders (
    order_id serial primary key, 
    customer_id integer references customers(customer_id), 
    product_id integer references products(product_id), 
    orderQty int
);

