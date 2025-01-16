BEGIN
ROLLBACK
INSERT 0 1
COMMIT
BEGIN
ROLLBACK
BEGIN
ROLLBACK
BEGIN
ROLLBACK
BEGIN
INSERT 0 1
COMMIT
 member_id |  name  |  address  | contact_number 
-----------+--------+-----------+----------------
         1 | Agrim  | HR        | 9896653922
         2 | Aryan  | PB        | 7888465372
         3 | Aalekh | CHD       | 8360196895
         4 | Akshay | Mohali    | 9417976347
         5 | Alok   | Pinjore   | 9138360059
         6 | Aman   | Delhi     | 6589559712
       111 | Apan   | NewDelhii | 5556667779
(7 rows)

--
 public | books    | table | postgres
 public | borrower | table | postgres
(2 rows)


library=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# create database librarySystem
postgres-# \c librarySystem
connection to server at "localhost" (::1), port 5432 failed: FATAL:  database "librarySystem" does not exist
Previous connection kept
postgres-# create database librarySystem;
ERROR:  syntax error at or near "create"
LINE 2: create database librarySystem;
        ^
postgres=# create database librarySystem
postgres-# \c librarySystem
connection to server at "localhost" (::1), port 5432 failed: FATAL:  database "librarySystem" does not exist
Previous connection kept
postgres-# \c library
You are now connected to database "library" as user "postgres".
library-# drop table books;
ERROR:  syntax error at or near "drop"
LINE 2: drop table books;
        ^
library=# select * from books;
 book_id |       book_name       |   book_genre   |     author
---------+-----------------------+----------------+----------------
       1 | TheHolyBible          | religion       | God
       2 | theIlliad             | greeksReligion | Homer
       3 | beyondGoodandEvil     | philosphy      | neitchse
       4 | theCountofMontecristo | fiction        | AlexandreDumas
(4 rows)


library=# drop table books
library-# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | books    | table | postgres
 public | borrower | table | postgres
(2 rows)


library-# drop table books;
ERROR:  syntax error at or near "drop"
LINE 2: drop table books;
        ^
library=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# create database library_system
postgres-# \c library_system
connection to server at "localhost" (::1), port 5432 failed: FATAL:  database "library_system" does not exist
Previous connection kept
postgres-# create database library_system ;
ERROR:  syntax error at or near "create"
LINE 2: create database library_system ;
        ^
postgres=# Create database library_system;
CREATE DATABASE
postgres=# \c library_system
You are now connected to database "library_system" as user "postgres".
library_system=# create table books(book_id serial primary key, title varchar not null , author varchar , publication_ye
ar int , genre varchar );
CREATE TABLE
library_system=# create table members(member_id serial primary key , name varchar not null , address varchar , contact_number int );
CREATE TABLE
library_system=# create table borrorwings(borrowing_id serial primary key , book_id integer reference books(book_id) , member_id integer refrence member(member_id) , borrowdate timestamp , returndate timestamp );
ERROR:  syntax error at or near "reference"
LINE 1: ...borrowing_id serial primary key , book_id integer reference ...
                                                             ^
library_system=# create table borrorwings(borrowing_id serial primary key ,foreign key book_id integer reference books(book_id) , foreign key member_id inte
ger refrence member(member_id) , borrowdate timestamp , returndate timestamp );
ERROR:  syntax error at or near "book_id"
LINE 1: ...ings(borrowing_id serial primary key ,foreign key book_id in...
                                                             ^
library_system=# create table borrorwings(borrowing_id serial primary key ,foreign key book_id integer references books(book_id) , foreign key member_id int
eger refrences member(member_id) , borrowdate timestamp , returndate timestamp );
ERROR:  syntax error at or near "book_id"
LINE 1: ...ings(borrowing_id serial primary key ,foreign key book_id in...
                                                             ^
library_system=# create table borrorwings(borrowing_id serial primary key , book_id integer reference books(book_id) foreign key, member_id integer refrence
 member(member_id) foreign key , borrowdate timestamp , returndate timestamp );
ERROR:  syntax error at or near "reference"
LINE 1: ...borrowing_id serial primary key , book_id integer reference ...
                                                             ^
library_system=# create table borrorwings(borrowing_id serial primary key ,book_id integer references books(book_id), member_id integer refrences member(mem
ber_id)  , borrowdate date , due_date date , return_date date );
ERROR:  syntax error at or near "refrences"
LINE 1: ...eger references books(book_id), member_id integer refrences ...
                                                             ^
library_system=# create table borrorwings(borrowing_id serial primary key ,book_id integer references books(book_id), member_id integer references member(me
mber_id)  , borrowdate date , due_date date , return_date date );
ERROR:  relation "member" does not exist
library_system=# create table borrorwings(borrowing_id serial primary key ,book_id integer references books(book_id), member_id integer references members(m
ember_id)  , borrowdate date , due_date date , return_date date );
CREATE TABLE
library_system=# \dt
            List of relations
 Schema |    Name     | Type  |  Owner
--------+-------------+-------+----------
 public | books       | table | postgres
 public | borrorwings | table | postgres
 public | members     | table | postgres
(3 rows)


library_system=# insert into books(book_id , title , author , publication_year , genre) values (101 , 'theilliad' , 'Homer' , 2222 , 'Religion');
INSERT 0 1
library_system=# insert into books(book_id , title , author , publication_year , genre) values (102 , 'TheLawsofMotion' , 'Newton' , 1670 , 'Physics');
INSERT 0 1
library_system=# insert into books(book_id , title , author , publication_year , genre) values (103 , 'TheCartesianPlaneGeometry' , 'Descarte' , 1780 , 'Mat
hs');
INSERT 0 1
library_system=# insert into books(book_id , title , author , publication_year , genre) values (104 , 'CrimeAndPunishment' , 'Dostoevsky' , 1909 , 'Fiction'
);
INSERT 0 1
library_system=# insert into books(book_id , title , author , publication_year , genre) values (105 , 'SherlockHolmes' , 'ArthurConan' , 1872 , 'Crime');on');
INSERT 0 1
library_system'# \d books
library_system'# \d books;
library_system'# select * from books;
library_system'# select * from books;
library_system'# \dt
library_system'# '
library_system-# -
library_system-# \dt
            List of relations
 Schema |    Name     | Type  |  Owner
--------+-------------+-------+----------
 public | books       | table | postgres
 public | borrorwings | table | postgres
 public | members     | table | postgres
(3 rows)


library_system-# select * from books;
ERROR:  syntax error at or near "on"
LINE 1: on');
        ^
library_system=# select * from books;
 book_id |           title           |   author    | publication_year |  genre
---------+---------------------------+-------------+------------------+----------
     101 | theilliad                 | Homer       |             2222 | Religion
     102 | TheLawsofMotion           | Newton      |             1670 | Physics
     103 | TheCartesianPlaneGeometry | Descarte    |             1780 | Maths
     104 | CrimeAndPunishment        | Dostoevsky  |             1909 | Fiction
     105 | SherlockHolmes            | ArthurConan |             1872 | Crime
(5 rows)


library_system=# insert into members (member_id , name , address , contact_number) values (001 , Agrim , HR , 7888465372);
ERROR:  column "agrim" does not exist
LINE 1: ... , name , address , contact_number) values (001 , Agrim , HR...
                                                             ^
library_system=# insert into members (member_id , name , address , contact_number) values (001 , 'Agrim' , 'HR' , 7888465372);
ERROR:  integer out of range
library_system=# insert into members (member_id , name , address , contact_number) values (001 , 'Agrim' , 'HR' , 7888465);
INSERT 0 1
library_system=# insert into members (member_id , name , address , contact_number) values (002 , 'Aryan' , 'PB' , 59645);
INSERT 0 1
library_system=# insert into members (member_id , name , address , contact_number) values (003 , 'Aalekh' , 'CHD' , 65712);
INSERT 0 1
library_system=# insert into members (member_id , name , address , contact_number) values (003 , 'Akshay' , 'Mohali' , 83672);
ERROR:  duplicate key value violates unique constraint "members_pkey"
DETAIL:  Key (member_id)=(3) already exists.
library_system=# insert into members (member_id , name , address , contact_number) values (004 , 'Akshay' , 'Mohali' , 83672);
INSERT 0 1
library_system=# insert into members (member_id , name , address , contact_number) values (005 , 'Alok' , 'Pinjore' , 786545);
INSERT 0 1
library_system=# select * from members;
 member_id |  name  | address | contact_number
-----------+--------+---------+----------------
         1 | Agrim  | HR      |        7888465
         2 | Aryan  | PB      |          59645
         3 | Aalekh | CHD     |          65712
         4 | Akshay | Mohali  |          83672
         5 | Alok   | Pinjore |         786545
(5 rows)


library_system=# alter table members alter column contact_number Set Data Type varchar(10);
ALTER TABLE
library_system=# insert into members (member_id , name , address , contact_number) values (005 , 'Alok' , 'Pinjore' , 7865450265);
ERROR:  duplicate key value violates unique constraint "members_pkey"
DETAIL:  Key (member_id)=(5) already exists.
library_system=# update members set contact_number= 98966539224 where member_id = 1;
ERROR:  value too long for type character varying(10)
library_system=# update members set contact_number= 9896653922 where member_id = 1;
UPDATE 1
library_system=# update members set contact_number= 7888465372 where member_id = 2;
UPDATE 1
library_system=# update members set contact_number= 8360196895 where member_id = 3;
UPDATE 1
library_system=# update members set contact_number= 9417976347 where member_id = 4;
UPDATE 1
library_system=# update members set contact_number= 9138360059 where member_id = 5;
UPDATE 1
library_system=# select * from members;
 member_id |  name  | address | contact_number
-----------+--------+---------+----------------
         1 | Agrim  | HR      | 9896653922
         2 | Aryan  | PB      | 7888465372
         3 | Aalekh | CHD     | 8360196895
         4 | Akshay | Mohali  | 9417976347
         5 | Alok   | Pinjore | 9138360059
(5 rows)


library_system=# insert into borrowings(borrowing_id , book_id , member_id , borrow_date ,due_date , return_date) values (201 ,101, 001 , '2024-09-18', '2024-10-18','2024-09-25');
ERROR:  relation "borrowings" does not exist
LINE 1: insert into borrowings(borrowing_id , book_id , member_id , ...
                    ^
library_system=# insert into borrorwings(borrowing_id , book_id , member_id , borrow_date ,due_date , return_date) values (201 ,101, 001 , '2024-09-18', '20
24-10-18','2024-09-25');
ERROR:  column "borrow_date" of relation "borrorwings" does not exist
LINE 1: ... borrorwings(borrowing_id , book_id , member_id , borrow_dat...
                                                             ^
library_system=# select * from borrorwings;
 borrowing_id | book_id | member_id | borrowdate | due_date | return_date
--------------+---------+-----------+------------+----------+-------------
(0 rows)


library_system=# insert into borrorwings(borrowing_id , book_id , member_id , borrowdate ,due_date , return_date) values (201 ,101, 001 , '2024-09-18', '202
4-10-18','2024-09-25');
INSERT 0 1
library_system=# insert into borrorwings(borrowing_id , book_id , member_id , borrowdate ,due_date , return_date) values (202 ,102, 002 , '2024-07-11', '202
4-08-11','2024-07-22');
INSERT 0 1
library_system=# insert into borrorwings(borrowing_id , book_id , member_id , borrowdate ,due_date , return_date) values (203 ,103, 003 , '2024-12-11', '202
5-1-11','2024-12-28');
INSERT 0 1
library_system=# insert into borrorwings(borrowing_id , book_id , member_id , borrowdate ,due_date , return_date) values (203 ,103, 003 , '2025-1-02', '2025
-2-11','2025-1-12');
ERROR:  duplicate key value violates unique constraint "borrorwings_pkey"
DETAIL:  Key (borrowing_id)=(203) already exists.
library_system=# insert into borrorwings(borrowing_id , book_id , member_id , borrowdate ,due_date , return_date) values (204 ,104, 004 , '2024-12-11', '202
5-1-11','2024-12-28');
INSERT 0 1
library_system=# insert into borrorwings(borrowing_id , book_id , member_id , borrowdate ,due_date , return_date) values (205 ,105, 005 , '2024-12-24', '202
5-1-24','2025-1-1');
INSERT 0 1
library_system=# select * from borrorwings;
 borrowing_id | book_id | member_id | borrowdate |  due_date  | return_date
--------------+---------+-----------+------------+------------+-------------
          201 |     101 |         1 | 2024-09-18 | 2024-10-18 | 2024-09-25
          202 |     102 |         2 | 2024-07-11 | 2024-08-11 | 2024-07-22
          203 |     103 |         3 | 2024-12-11 | 2025-01-11 | 2024-12-28
          204 |     104 |         4 | 2024-12-11 | 2025-01-11 | 2024-12-28
          205 |     105 |         5 | 2024-12-24 | 2025-01-24 | 2025-01-01
(5 rows)


library_system=# select * from books where author = 'Homer';
 book_id |   title   | author | publication_year |  genre
---------+-----------+--------+------------------+----------
     101 | theilliad | Homer  |             2222 | Religion
(1 row)


library_system=# select * from borrorwings where book_id = 103;
 borrowing_id | book_id | member_id | borrowdate |  due_date  | return_date
--------------+---------+-----------+------------+------------+-------------
          203 |     103 |         3 | 2024-12-11 | 2025-01-11 | 2024-12-28
(1 row)


library_system=# select * from borrorwings where due_date < return_date;
 borrowing_id | book_id | member_id | borrowdate | due_date | return_date
--------------+---------+-----------+------------+----------+-------------
(0 rows)


library_system=# select * from borrorwing where book_id > 100;
ERROR:  relation "borrorwing" does not exist
LINE 1: select * from borrorwing where book_id > 100;
                      ^
library_system=# select * from borrorwings where book_id > 100;
 borrowing_id | book_id | member_id | borrowdate |  due_date  | return_date
--------------+---------+-----------+------------+------------+-------------
          201 |     101 |         1 | 2024-09-18 | 2024-10-18 | 2024-09-25
          202 |     102 |         2 | 2024-07-11 | 2024-08-11 | 2024-07-22
          203 |     103 |         3 | 2024-12-11 | 2025-01-11 | 2024-12-28
          204 |     104 |         4 | 2024-12-11 | 2025-01-11 | 2024-12-28
          205 |     105 |         5 | 2024-12-24 | 2025-01-24 | 2025-01-01
(5 rows)