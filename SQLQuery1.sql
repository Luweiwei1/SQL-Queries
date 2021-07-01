CREATE DATABASE ecommerce;

SELECT * from customer

SELECT * from product

SELECT * from sales

--Select all products with brand "Cacti Plus"
SELECT * FROM product
WHERE brand='Cacti Plus'

--Count of total products with product category="Skin Care"
SELECT COUNT (*) FROM product
WHERE category= 'Skin Care'

--Count of total products with MRP more than 100
SELECT COUNT (*) FROM product
WHERE mrp >100

--Count of total products with product category="Skin Care" and MRP more than 100
SELECT COUNT (*) FROM product
WHERE category= 'Skin Care' and mrp > 100

--Brandwise product count
SELECT product.brand, COUNT (product.product_id) FROM product	
GROUP BY brand

--Brandwise as well as Active/Inactive Status wise product count
SELECT product.brand,
	sum(case when active = 'Y' then 1 else 0 end) as active,
	sum(case when active = 'N' then 1 else 0 end) as inactive,
	COUNT(*) AS totals
FROM product
GROUP BY brand

--Display all columns with Product category in Skin Care or Hair Care
SELECT * FROM product
WHERE category = 'Skin Care' or category = 'Hair Care'

--Display   all   columns   with   Product   category="Skin   Care"  and Brand="Pondy", and MRP more than 100
SELECT * FROM product
WHERE mrp>100 and (category='Skin Care' and brand='Pondy');

--Display   all   columns   with   Product   category   ="Skin   Care"   or Brand="Pondy", and MRP more than 100
SELECT * FROM product
WHERE mrp>100 and (category='Skin Care' or brand='Pondy');

--Display all product names only with names starting from letter P
SELECT * FROM product
WHERE product_name LIKE 'P%';

--Display  all product  names only with names Having letters "Bar"  in Between
SELECT * FROM product
WHERE product_name LIKE '%Bar%';

--Sales of those products which have been sold in more than two quantity in a bill
SELECT * FROM sales
WHERE qty > 2

--Sales of those products which have been sold in more than two quantity throughout the bill
SELECT product_id, SUM(qty) quantity FROM sales
GROUP BY product_id HAVING SUM(qty) > 2

--Create a new table with columns username and birthday, and dump data from dates file. Convert it to .csv format if required.
--After populating the data, find no of people sharing
--Birth date
--Birth month
--Weekday
--Find the current age of all people

CREATE TABLE person(
    name varchar(50),
    birthdate DATE
)

BULK INSERT dbo.person
FROM 'C:\Users\user\Downloads\dates - Sheet1.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
);

SELECT* From person


SELECT COUNT(name) 
FROM person 
WHERE birthdate 
    IN (
     SELECT birthdate
     FROM person
     GROUP BY birthdate
     HAVING COUNT(birthdate) > 1
    )


SELECT * ,
    DATENAME(weekday, GETDATE()) as WEEKDAY
FROM person


SELECT   *, DATEDIFF(year, birthdate, GETDATE()) Age
FROM     person







