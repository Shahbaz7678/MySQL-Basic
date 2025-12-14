create database zepto_db;
use zepto_db;

select * from zepto_sales;

-- Q: Show the first 8 rows with order_id, order_date, customer_id, product_name, total_amount.
 
 select order_id, order_date, customer_id, product_name, total_amount
from zepto_sales
order by order_date, order_id
limit 8;

-- Q: Show 15 delivered orders.

select order_id, order_date, product_name, order_status
from zepto_sales
where order_status = "Delivered"
limit 15;

-- Q: Delivered orders from Bengaluru with total_amount > 500.

select order_id, order_date, product_name, city, order_status, total_amount
from zepto_sales
where order_status = "Delivered"
and city = "Bengaluru"
and total_amount>500
order by total_amount desc
limit 15;

-- Q: Orders with total_amount between 300 and 700 (inclusive).

select order_id, order_date, city, product_name, total_amount
from zepto_sales
where total_amount between 300 and 700
order by total_amount desc
limit 50;

-- Q: Orders placed between 2025-01-01 and 2025-03-31.

select order_id, order_date, product_name, total_amount
from zepto_sales
where order_date between "2025-01-01" and "2025-03-01"
order by order_date desc
limit 50;

-- Q: Orders paid with UPI or Card.

select order_id, order_date, product_name, category, total_amount, payment_method
from zepto_sales
where payment_method in ("Card","UPI")
order by total_amount desc
limit 100;


select order_id, order_date, product_name, category, total_amount, payment_method
from zepto_sales
where payment_method not in ("Card","UPI")
order by total_amount desc
limit 100;

-- Q: Orders not from Delhi, Mumbai, or Bengaluru.

select order_id, order_date, city, product_name, category, total_amount 
from zepto_sales
where city not in ("Delhi","Bengaluru","Mumbai")
and total_amount between 1000 and 10000
order by order_date desc
limit 100;

-- Q: List distinct payment_method values.

select distinct payment_method
from zepto_sales;

-- Q: Distinct (city, payment_method) pairs (exclude NULL city).

SELECT DISTINCT city, payment_method 
FROM zepto_sales 
WHERE city IS NOT NULL 
ORDER BY city, payment_method 
LIMIT 200;

-- Q: Find products with Rice in the name.

select distinct product_name, category
from zepto_sales
where product_name like "%RICE%";

-- Q: Products that start with Frozen. 

select distinct product_name, category
from zepto_sales
where product_name like "Frozen%";

-- Q: How many rows have missing city? (show sample rows)

SELECT order_id, order_date, city, pincode 
FROM zepto_sales 
WHERE city IS NULL 
LIMIT 20; 

-- Q: Show rows where coupon_code is present but rating is missing (useful for “promo feedback” example).

select order_id, coupon_code, rating
from zepto_sales
where coupon_code is not null
  and rating is null
limit 50;

-- Q: Show order_id, price, quantity, and compute gross_amount = price * quantity with alias.

select order_id, price, quantity, (price*quantity) as gross_price
from zepto_sales
limit 20;

-- Q: Show orders where gross (price*quantity) > 1000, order by gross descending.

select order_id, product_name, price, quantity, (price*quantity) as gross_price
from zepto_sales
where (price*quantity)>1000
order by gross_price desc
limit 50;

-- Q: Top 10 orders by total_amount.

select order_id, order_date, city, product_name, total_amount
from zepto_sales
order by total_amount desc
limit 10;

-- Q: Show rows 21-30 by order_date (oldest first).

select order_id, order_date, customer_id, total_amount
from zepto_sales
order by order_date
limit 10 offset 20;

-- Q: Dairy or Bakery products with names containing Butter or Bread.

select order_id, order_date, product_name, category, total_amount
from zepto_sales
where category in ("Dairy","Bakery")
and (product_name like "%Butter%" or product_name like "%Bread%")
order by total_amount desc
limit 50;

-- Q: Delivered Express orders paid by Wallet with total_amount > 500.

select order_id, order_date, product_name, category, payment_method, delivery_type, total_amount
from zepto_sales
where delivery_type = "Express"
and payment_method = "Wallet"
and total_amount>500
order by order_date desc
limit 100;

-- Q: For Dairy category delivered between 2025-06-01 and 2025-08-31, paid by Card 
-- or UPI, show order_id, order_date, product_name, quantity, total_amount ordered by date. 

select order_id, order_date, product_name, category, order_status, payment_method ,quantity, total_amount
from zepto_sales
where order_date between "2025-06-01" and "2025-08-31" 
and category = "Dairy"
and order_status = "Delivered"
and payment_method in ("Card","UPI")
order by order_date desc
limit 200;


