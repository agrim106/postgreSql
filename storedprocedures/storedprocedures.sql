CREATE VIEW
UPDATE 0
UPDATE 1
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

DROP VIEW




**What are the benefits of using views?**
This is such an interesting concept. Views are like having different lenses to look at your data. Think of them as preset filters on a camera - you can look at the same scene in different ways without changing the original. They're fantastic for hiding complexity, enforcing security, and maintaining consistency across an application. It's like creating a custom window into your data that shows exactly what you want, how you want it.

**What are the limitations of using views?**
Now this gets into some fascinating territory. Views can sometimes be like looking through a one-way mirror - great for seeing but not always ideal for touching. Complex views, especially those built on other views, can sometimes perform slowly because they're like a chain of translations happening one after another. Also, some views (particularly those with complex joins or aggregations) can't be updated directly, which is like trying to change a photograph without accessing the original scene.

**Can a view be based on another view?**
Absolutely! This is one of those concepts that shows the power of abstraction in databases. It's like stacking transparent overlays - each one adds its own layer of information or filtering. You can keep building these layers up, though you need to be careful about not creating a tower that's too tall (performance-wise) or too complex to maintain.

**What are some common use cases for views?**
This is where theory meets practice in fascinating ways. Views are perfect for situations like creating a sanitized version of sensitive data for different user groups (like showing sales data without revealing customer details), simplifying commonly used complex queries (like a monthly revenue report that pulls from multiple tables), or providing backward compatibility when database schemas change. They're like creating custom TV channels that show exactly what each viewer should see.

How can you use views to implement data virtualization?
This touches on some advanced database concepts. 
Views can act as an abstraction layer that makes distributed or heterogeneous data sources appear as if they're all part of one unified database.
 It's like having a universal remote control that works with all your devices - the complexity is hidden behind a simple interface.
  This is particularly powerful in modern data architectures where data might live in multiple places but needs to be accessed uniformly.
