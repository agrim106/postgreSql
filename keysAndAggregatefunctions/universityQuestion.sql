CREATE DATABASE
CREATE TABLE
                                       Table "public.students"
   Column   |       Type        | Collation | Nullable |                   Default                    
------------+-------------------+-----------+----------+----------------------------------------------
 student_id | integer           |           | not null | nextval('students_student_id_seq'::regclass)
 year       | integer           |           | not null | 
 name       | character varying |           | not null | 
 last_name  | character varying |           |          | 
 course     | character varying |           |          | 
Indexes:
    "students_pkey" PRIMARY KEY, btree (student_id)

CREATE TABLE
          List of relations
 Schema |   Name   | Type  |  Owner   
--------+----------+-------+----------
 public | courses  | table | postgres
 public | students | table | postgres
(2 rows)

INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
 student_id | year | name  | last_name |  course   
------------+------+-------+-----------+-----------
        106 | 2021 | agrim | chaudhary | CompSci
        190 | 2021 | Peter | parker    | CompSci
        191 | 2022 | Isaac | newton    | CompSci
        171 | 2020 | Bill  | Gates     | ElecEng
       1991 | 1999 | Sam   | Altman    | MechaTron
(5 rows)

 course_id | subject_name | c_year 
-----------+--------------+--------
(0 rows)

INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
 course_id |      subject_name      | c_year 
-----------+------------------------+--------
       555 | Physics                | 2000
       575 | Java                   | 2002
       577 | Python                 | 2005
       817 | Mathematics            | 2009
       717 | ElectricityAndCurrents | 2015
       787 | ArtificalIntelligence  | 2019
(6 rows)

