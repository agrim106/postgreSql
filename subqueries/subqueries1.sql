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



What is the difference between EXISTS and IN subqueries?
You know, I've always found this to be an interesting distinction. EXISTS is really about checking if something is there - like when you're rummaging through your closet looking for at least one blue shirt. You don't care about all of them, you just want to know if you have one. IN, on the other hand, is more like having a shopping list and checking if each item matches what's on your list. It compares every single value.

Can you use a subquery in the FROM clause?
Absolutely! Think of it like creating a temporary box to store some stuff before you use it. When you put a subquery in the FROM clause, you're essentially creating a virtual table on the fly that you can then work with. It's like making a quick sandwich prep station before assembling your final sandwich.

Can you use a subquery within another subquery?
Yes - it's actually pretty fascinating when you think about it. It's like those Russian nesting dolls, where each doll contains a smaller one inside. Each inner query gets evaluated first, passing its results to the outer query. You can keep nesting them deeper, though just because you can doesn't always mean you should!

What are some common performance issues with subqueries?
This is something that keeps database developers up at night! The main challenge is that subqueries can be like asking someone to run up and down stairs multiple times instead of bringing everything in one trip. Each subquery might need to scan tables repeatedly, and if your data is large enough, that can really slow things down. It's like trying to find a book by checking every single shelf in a library multiple times instead of using the catalog system.

What are some real-world examples of how subqueries are used in business applications?
This is one of my favorite topics because it shows how theoretical concepts apply in the real world. Think about an e-commerce platform - subqueries are often used to find things like "customers who spent more than the average customer last month" or "products that have been reviewed above the average rating." Or in HR systems, where you might need to find "employees who have more certifications than their department's average." It's fascinating how these queries translate into actual business insights.


