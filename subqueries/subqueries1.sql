 select name , salary from employeerecords where salary > ( select AVG (salary) from employeerecords) ;
  name  | salary  
--------+---------
 Marco  |  300000
 Jensen | 1000000
 Eve    |  400000
(3 rows)

Q2 

The difference between exist and In subqueries is that In evaluates the entire subquery till an answer is found. Whi

  name  | designation | salary  
--------+-------------+---------
 Jensen | CEO         | 1000000
(1 row)

