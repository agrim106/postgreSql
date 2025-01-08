 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
         106 | agrim      | chaudhary |  90000
         127 | peter      | parker    |  70000
         129 | akshay     | katoch    |  20000
(3 rows)

GRANT
CREATE ROLE
CREATE ROLE
CREATE ROLE
GRANT
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | employees | table | postgres
 public | products  | table | postgres
(2 rows)

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

GRANT
GRANT
REVOKE
CREATE ROLE
GRANT
GRANT ROLE
GRANT
                                        Table "public.employees"
   Column    |       Type        | Collation | Nullable |                    Default                    
-------------+-------------------+-----------+----------+-----------------------------------------------
 employee_id | integer           |           | not null | nextval('employee_employee_id_seq'::regclass)
 first_name  | character varying |           | not null | 
 last_name   | character varying |           |          | 
 salary      | double precision  |           | not null | 
Indexes:
    "employee_pkey" PRIMARY KEY, btree (employee_id)

REVOKE
GRANT
REVOKE
GRANT
REVOKE
GRANT
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

Q1 => Grant the SELECT privilege on the "employees" table to a specific user.
GRANT SELECT ON employees TO 'agrim';

Q2 => Grant the INSERT privilege on the "employees" table to a group of users.
GRANT INSERT ON employees TO 'agrim', 'akshay', 'peter';

Q3 => Revoke the UPDATE privilege on the "employees" table from a specific user.
REVOKE UPDATE ON employees FROM 'akshay';

Q4 => Grant all privileges on the "products" table to a specific role.
GRANT ALL PRIVILEGES ON products TO 'admin_role';

Q5 => Revoke the DELETE privilege on the "products" table from all users.
REVOKE DELETE ON products FROM PUBLIC;

Q6 => Grant the SELECT and INSERT privileges on the "departments" table to a specific user.
GRANT SELECT, INSERT ON departments TO 'agrim';

Q7 => Revoke all privileges on the "departments" table from a specific role.
REVOKE ALL PRIVILEGES ON departments FROM 'user_role';

Q8 => Grant the USAGE privilege on a specific schema to a user.
GRANT USAGE ON SCHEMA public TO 'akshay';

Q9 => Revoke the USAGE privilege on a specific schema from a group of users.
REVOKE USAGE ON SCHEMA public FROM 'agrim', 'akshay';

Q10 => Grant the CONNECT privilege to a new user.
GRANT CONNECT ON DATABASE company TO 'peter';
