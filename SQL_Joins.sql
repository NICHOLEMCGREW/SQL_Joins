/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
-- SELECT p.Name AS Product, c.Name as Category
-- FROM products AS p
-- INNER JOIN categories AS c
-- ON p.CategoryID = c.CategoryID;
--  
-- /* joins: find all product names, product prices, and products ratings that have a rating of 5 */
--  SELECT p.name AS Product, p.Price AS price, r.Rating
--  FROM products AS p
--  INNER JOIN reviews AS r
--  ON p.ProductID = r.ProductID
--  WHERE r.Rating = 5; 

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- SELECT concat(e.FirstName," ", e.LastName) AS Employee, SUM(s.Quantity) AS Total
-- FROM employees AS e
-- INNER JOIN sales AS s
-- ON e.EmployeeID = s.EmployeeID
-- GROUP BY s.EmployeeID
-- HAVING Total = 37

-- ORDER BY total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
-- SELECT c.Name AS Category, d.Name As Department 
-- FROM Categories AS c
-- INNER JOIN departments AS d
-- ON c.DepartmentID = d.DepartmentID
-- WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
-- SELECT p.Name AS Product, SUM(s.Quantity) AS TOTAL_SOLD, SUM(s.Quantity * s.PricePerUnit) AS TOTAL_GROSS
-- FROM products AS p
-- INNER JOIN sales AS s
-- ON s.ProductID = p.ProductID
-- WHERE p.Name LIKE "%Eagles: Hotel California%"
-- GROUP BY p.ProductID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- SELECT p.Name AS Product, r.Reviewer, r.Rating, r.Comment
-- FROM reviews AS r
-- INNER JOIN products AS p
-- ON r.ProductID = p.ProductID
-- WHERE p.Name LIKE "Vioso TV%" 
-- AND r.Rating = (SELECT r.Rating FROM reviews AS r INNER JOIN products AS p ON p.ProductID = r.ProductID WHERE p.Name LIKE "%Visio TV%" ORDER BY r.Rating LIMIT 1);


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS Product, SUM(s.Quantity) AS TOTAL_SOLD
FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, s.ProductID;
