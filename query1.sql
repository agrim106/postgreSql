 
 
CREATE TABLE
          List of relations
 Schema |   Name   | Type  |  Owner   
--------+----------+-------+----------
 public | employee | table | postgres
 public | staff    | table | postgres
(2 rows)

DROP TABLE
          List of relations
 Schema |   Name   | Type  |  Owner   
--------+----------+-------+----------
 public | employee | table | postgres
(1 row)

 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
(0 rows)

                                        Table "public.employee"
   Column    |       Type        | Collation | Nullable |                    Default                    
-------------+-------------------+-----------+----------+-----------------------------------------------
 employee_id | integer           |           | not null | nextval('employee_employee_id_seq'::regclass)
 first_name  | character varying |           | not null | 
 last_name   | character varying |           |          | 
 salary      | double precision  |           |          | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (employee_id)

ALTER TABLE
          List of relations
 Schema |   Name   | Type  |  Owner   
--------+----------+-------+----------
 public | employee | table | postgres
(1 row)

                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(4 rows)

                                        Table "public.employee"
   Column    |       Type        | Collation | Nullable |                    Default                    
-------------+-------------------+-----------+----------+-----------------------------------------------
 employee_id | integer           |           | not null | nextval('employee_employee_id_seq'::regclass)
 first_name  | character varying |           | not null | 
 last_name   | character varying |           |          | 
 salary      | double precision  |           |          | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (employee_id)

ALTER TABLE
                                        Table "public.employee"
   Column    |       Type        | Collation | Nullable |                    Default                    
-------------+-------------------+-----------+----------+-----------------------------------------------
 employee_id | integer           |           | not null | nextval('employee_employee_id_seq'::regclass)
 first_name  | character varying |           | not null | 
 last_name   | character varying |           |          | 
 salary      | double precision  |           | not null | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (employee_id)

ALTER TABLE
                                          Table "public.staff"
   Column    |       Type        | Collation | Nullable |                    Default                    
-------------+-------------------+-----------+----------+-----------------------------------------------
 employee_id | integer           |           | not null | nextval('employee_employee_id_seq'::regclass)
 first_name  | character varying |           | not null | 
 last_name   | character varying |           |          | 
 salary      | double precision  |           | not null | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (employee_id)

CREATE TABLE
                                           Table "public.departments"
     Column      |       Type        | Collation | Nullable |                      Default                       
-----------------+-------------------+-----------+----------+----------------------------------------------------
 department_id   | integer           |           | not null | nextval('departments_department_id_seq'::regclass)
 department_name | character varying |           | not null | 
Indexes:
    "departments_pkey" PRIMARY KEY, btree (department_id)

CREATE DATABASE
CREATE TABLE
          List of relations
 Schema |  Name   | Type  |  Owner   
--------+---------+-------+----------
 public | product | table | postgres
(1 row)

DROP DATABASE
                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | DROP TABLE
a.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(4 rows)

  Q1 create database company
  Q2 Create table employee(employee_id serial primary key , first_name varchar not null , last_name varchar , salary float);
  Q4 alter table employee alter column salary set not null; 
  Q5  alter table employee rename to staff;
  Q6  drop table departments;
  Q7 create table departments (department_id serial primary key , department_name varchar not null );
  Q8  create database inventory;
  Q9 create table product (product_id serial primary key, product_name varchar not null , product_price decimal);
  Q10 drop database inventory;