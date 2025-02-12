-- Mocha Mirage DATA CLEANING PROJECT 

CREATE DATABASE coffee_sales;
use coffee_sales;

SELECT *
FROM dirty_cafe_sales;


SELECT *
FROM dirty_cafe_sales
WHERE Transaction_Date IS NULL;



--1. CREATE A STAGING TABLE

SELECT * INTO cafe_sales FROM dirty_cafe_sales;

SELECT * FROM cafe_sales;

--2. REMOVE DUMPLICATES
SELECT COUNT(Transaction_ID), COUNT(DISTINCT(Transaction_ID))
FROM cafe_sales;

-- 3.STANDARDISING THE DATA
SELECT  DISTINCT(Item),
FROM cafe_sales;

SELECT   DISTINCT(Payment_Method)
FROM cafe_sales;

SELECT DISTINCT(Location)
FROM cafe_sales;

SELECT Item, MAX(Price_Per_Unit)
FROM cafe_sales
GROUP BY Item;

SELECT DISTINCT(Price_Per_Unit)
FROM cafe_sales

SELECT a.Price_Per_Unit, a.item,b.item
FROM cafe_sales a left join cafe_sales b
	ON a.Transaction_ID = b.Transaction_ID

SELECT item, Price_Per_Unit
from cafe_sales
where item = 'coffee'


SELECT a.Price_Per_Unit, a.item,b.item
FROM cafe_sales a left join cafe_sales b
	ON a.Price_Per_Unit = b.Price_Per_Unit
WHERE a.item IS NULL AND b.item IS NOT NULL;

--4. WORKING WITH NULL AND BLANK VALUES

-- fill in the missing items
UPDATE a
SET a.item = b.item
FROM cafe_sales AS a
JOIN cafe_sales AS b
	ON a.Price_Per_Unit = b.Price_Per_Unit
WHERE a.item IS NULL AND b.item IS NOT NULL;

-- fill in the missing unit prices
UPDATE a
SET a.Price_Per_Unit = b.Price_Per_Unit
FROM cafe_sales AS a
JOIN cafe_sales AS b
	ON a.item = b.item
WHERE a.Price_Per_Unit IS NULL AND b.Price_Per_Unit IS NOT NULL;


SELECT *
FROM cafe_sales
where Location LIKE 'ERROR'

-- fill in the missing quantities
SELECT 
    a.Transaction_Date,
    a.Item,
    COALESCE(a.Quantity, b.Total_Spent / b.Price_Per_Unit) AS Quantity,  -- Fill NULL quantity
    b.Quantity,
    b.Price_Per_Unit,
    b.Total_Spent,
    a.Total_Spent / a.Price_Per_Unit AS Quantity_From_A
FROM 
    cafe_sales a 
JOIN 
    cafe_sales b ON a.Item = b.Item
WHERE 
    a.Quantity IS NULL 
    AND b.Quantity IS NOT NULL 
    AND b.Total_Spent IS NOT NULL;


  UPDATE a
SET a.Quantity = b.Total_Spent / b.Price_Per_Unit
FROM cafe_sales a
JOIN cafe_sales b ON a.Item = b.Item
WHERE a.Quantity IS NULL
  AND b.Quantity IS NOT NULL
  AND b.Total_Spent IS NOT NULL;

-- fill in the total spend
UPDATE a
SET a.Total_Spent = b.Quantity * b.Price_Per_Unit
FROM cafe_sales a
JOIN cafe_sales b ON a.Item = b.Item
WHERE a.Total_Spent IS NULL
  AND b.Price_Per_Unit IS NOT NULL
  AND b.Quantity IS NOT NULL;


--5. REMOVE UNWANTED COLUMNS OR ROWS

-- remove transactions without item name and price per unit
DELETE FROM cafe_sales
WHERE Item IS NULL 
    AND Price_Per_Unit IS NULL;
	
-- remove transactions without location and payment 

DELETE FROM cafe_sales
  WHERE Payment_Method IS NULL 
	AND Location IS NULL

DELETE FROM cafe_sales
  WHERE Payment_Method IS NULL 
	
DELETE FROM cafe_sales
  WHERE Location IS NULL
  
 -- remove SYSTEM errors
 
DELETE
FROM cafe_sales
WHERE item LIKE '%ERROR%'

DELETE
FROM cafe_sales
WHERE Payment_Method LIKE '%ERROR%'

DELETE
FROM cafe_sales
WHERE Location LIKE '%ERROR%'

-- remove unknown or incomplete transactions
DELETE
FROM cafe_sales
WHERE item LIKE '%UNKNOWN%'

DELETE
FROM cafe_sales
WHERE Payment_Method LIKE '%UNKNOWN%'

DELETE
FROM cafe_sales
WHERE Location LIKE '%UNKNOWN%'

--6. CREATE A VIEW 

CREATE VIEW view_cafe_sales AS
SELECT *
FROM cafe_sales;

	


