-- CREATE TABLE Customers (
--     customer_id INT PRIMARY KEY, 
--     customer_name VARCHAR(255) NOT NULL, 
--     city VARCHAR(255) NOT NULL, 
--     phone_number VARCHAR(15) UNIQUE, 
--     email VARCHAR(255) UNIQUE ,
--     registration_date DATE NOT NULL 
-- );

-- copy Customers from 'C:\Table.1--customers.csv' delimiter ',' csv header;

-- create table order_items (
--     order_item_id INT PRIMARY KEY,
--     order_id INT NOT NULL,
--     product_id INT NOT NULL,
--     quantity INT NOT NULL,
--     total_price DECIMAL(10, 2) NOT NULL
-- );


-- copy order_items from 'C:\Table.4--order_items.csv 'delimiter ','csv header;

-- create table product_data(
-- product_id int primary key,
-- product_name varchar(100) not null,
-- category varchar (100)not null,
-- price int not null,
-- stock_quantity int,
-- supplier_name varchar(100) not null,
-- supplier_city varchar(200) not null,
-- supply_date date not null
-- ) ;

-- copy product_data from 'C:\Table.3--products.csv' delimiter ',' header csv;


-- create table order_data(
--     order_id INT PRIMARY KEY, 
--     customer_id INT NOT NULL, 
--     order_date DATE NOT NULL, 
--     order_amount DECIMAL(10, 2) NOT NULL, 
--     delivery_city VARCHAR(255) NOT NULL, 
--     payment_mode VARCHAR(50) NOT NULL, 
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
-- );
-- copy order_data from 'C:\Table.2--orders.csv' delimiter ',' header csv;

--  *****************************Task_2.1*****************************************

-- SELECT 
--     c.customer_name, 
--     c.city, 
--     o.order_date
-- FROM 
--     customers c
-- JOIN 
--     order_data o
-- ON 
--     c.customer_id = o.customer_id
-- WHERE 
--     EXTRACT(YEAR FROM o.order_date) = 2023;

-- ***************************************Task_2.2*************************************************

-- select product_name,category,oi.total_price from Customers c
-- join 
-- order_data od on c.customer_id = od.customer_id
-- join
-- order_items oi on od.order_id = oi.order_id
-- join
-- product_data pd on oi.product_id = pd.product_id
-- where c.city = 'Mumbai';



-- ***************************************Task_2.3*************************************************

-- select c.customer_name,od.order_date,oi.total_price from Customers c
-- join
-- order_data od on c.Customer_id = od.customer_id
-- join
-- order_items oi on od.order_id = oi.order_id
-- where od.payment_mode = 'Credit Card';

-- **************************************Task_2.4*************************************************

-- select pd.product_name,pd.category,oi.total_price from order_data od
-- join order_items oi on od.order_id = oi.order_id
-- join product_data pd on pd.product_id = oi.product_id
-- where od.order_date between '2023-01-01' and '2023-06-30';

-- *************************************Task_2.5.**************************************************

-- select c.customer_name,sum(oi.quantity) as total_product_ordered from Customers c
-- join order_data od on c.customer_id = od.customer_id
-- join order_items oi on oi.order_id = od.order_id
-- group by c.customer_name
-- order by total_product_ordered desc

-- *************************************Task_2.6.**************************************************

-- Task 1:
-- Get a distinct list of cities where customers are located.

-- SELECT DISTINCT city FROM Customers;
-- *************************************
-- Task 2:
-- Retrieve distinct supplier_name from the products table.

-- SELECT DISTINCT supplier_name FROM product_data;
-- *************************************
-- Task 3:
-- Find distinct payment methods used in the orders table.

-- select distinct payment_mode from order_data

-- *************************************
-- Task 4:
-- List all distinct product categories that have been ordered.

-- SELECT DISTINCT p.category 
-- FROM product_data p
-- JOIN order_items oi 
-- ON p.product_id = oi.product_id;
-- *************************************

-- Task 5:
-- Find distinct cities from which suppliers supply products by querying the
-- products table.

-- SELECT DISTINCT supplier_city 
-- FROM product_data;
-- - *************************************Task_2.6.**************************************************
-- 3. ORDER BY

-- Task 1:
-- List all customers sorted by customer_name in ascending order.
-- select * from Customers order by customer_name asc
-- ****************************Task_3.1********************************
-- Task 2:
-- Display all orders sorted by total_price in descending order.
-- select * from order_items order by total_price desc8
-- ****************************Task_3.2******************************
-- Task 3:
-- Retrieve a list of products sorted by price in ascending order and then by
-- category in descending order.
-- select * from product_data order by price asc,category desc
-- ****************************Task_3.3***************************
-- Task 4:
-- Sort all orders by order_date in descending order and display the order_id,
-- customer_id, and order_date.
-- select order_id,customer_id,order_date from order_data order by order_date desc
-- ******************************Task_3.4****************************
-- Task 5:
-- Get the list of cities where orders were placed, sorted in alphabetical order,
-- and display the total number of orders placed in each city.
-- select delivery_city,sum(order_id) as total_order_place from order_data group by delivery_city order by delivery_city desc
-- ********************************Task_3.5************************8*******

-- 4. LIMIT & OFFSET

-- Task 1:
-- Retrieve the first 10 rows from the customers table ordered by
-- customer_name.
-- select * from Customers order by customer_name limit 10;

-- Task 2:
-- Display the top 5 most expensive products (sorted by price in descending
-- order).
-- select product_name,price from product_data order by price desc limit 5;

-- Task 3:
-- Get the orders for the 11th to 20th customers (using OFFSET and LIMIT),
-- sorted by customer_id.
-- select * from order_data order by customer_id limit 10 offset 10;

-- Task 4:
-- List the first 5 orders placed in 2023, displaying order_id, order_date, and
-- customer_id.
-- select order_id,order_date,customer_id from order_data where extract(year from order_date) = '2023' order by order_date limit 5;


-- Task 5:
-- Fetch the next 10 distinct cities where orders were placed, using LIMIT and
-- OFFSET.
-- select distinct delivery_city from order_data limit 10 offset 10
-- *******************************************Task_2.4.5***************************************************
-- 5. AGGREGATE FUNCTIONS

-- Task 1:
-- Calculate the total number of orders placed by all customers.
-- SELECT COUNT(*) AS total_orders 
-- FROM order_data;

-- Task 2:
-- Find the total revenue generated from orders paid via 'UPI' from the orders
-- table.
-- select count(order_amount) as total_revenue from order_data  where payment_mode   = 'UPI';  

-- Task 3:
-- Get the average price of all products in the products table.
-- select avg(price) as avrage_price from product_data ;

-- Task 4:
-- Find the maximum and minimum total price of orders placed in 2023.
-- select max(order_amount) as maximum_price,min(order_amount) as minimun_price from order_data 
-- where extract (year from order_date) = '2023';

-- Task 5:
-- Calculate the total quantity of products ordered for each product_id using
-- the order_items table.
-- select product_id,sum(quantity) as total_quantity from order_items group by product_id;

-- ******************************Task_3.5***************************************************

-- 7. SUBQUERIES

-- Task 1:
-- Find the names of customers who placed orders with a total price greater
-- than the average total price of all orders.
-- SELECT c.customer_name,order_amount FROM Customers c
-- JOIN order_data o ON c.customer_id = o.customer_id
-- WHERE o.order_amount > (SELECT AVG(order_amount) FROM order_data);

-- Task 2:
-- Get a list of products that have been ordered more than once by any
-- customer.
-- SELECT DISTINCT p.product_name
-- FROM product_data p
-- JOIN order_items oi ON p.product_id = oi.product_id
-- WHERE oi.product_id IN (
--     SELECT product_id
--     FROM order_items
--     GROUP BY product_id
--     HAVING SUM(quantity) > 1
-- );


-- Task 3:
-- Retrieve the product names that were ordered by customers from Pune
-- using a subquery.
-- SELECT DISTINCT p.product_name
-- FROM product_data p
-- JOIN order_items oi ON p.product_id = oi.product_id
-- WHERE oi.order_id IN (
--     SELECT o.order_id
--     FROM order_data o
--     JOIN Customers c ON o.customer_id = c.customer_id
--     WHERE c.city = 'Pune'
-- );


-- Task 4:
-- Find the top 3 most expensive orders using a subquery.
-- SELECT order_id, order_amount
-- FROM order_data
-- WHERE order_amount IN (
--     SELECT DISTINCT order_amount
--     FROM order_data
--     ORDER BY order_amount DESC
--     LIMIT 3
-- );


-- Task 5:
-- Get the customer names who placed orders for a product that costs more
-- than ₹30,000 using a subquery.
-- SELECT DISTINCT c.customer_name
-- FROM Customers c
-- JOIN order_data o ON c.customer_id = o.customer_id
-- WHERE o.order_id IN (
--     SELECT oi.order_id
--     FROM order_items oi
--     JOIN product_data p ON oi.product_id = p.product_id
--     WHERE p.price > 30000
-- );






