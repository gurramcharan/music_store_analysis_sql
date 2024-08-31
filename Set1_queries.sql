-- Set 1: Q1: Who is the senior most employee based on job title?

select * from employee
Order by levels desc limit 1;

-- Set 1: Q2: Which countries have the most Invoices?

select count(*) as c,billing_country 
from invoice
group by billing_country
order by c desc

-- Set 1: Q3: What are the top 3 values of total invoice?
SELECT
	*
FROM
	INVOICE
ORDER BY
	TOTAL DESC
LIMIT 3;

-- Set 1: Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city 
-- we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return 
-- both the city name & sum of all invoice totals
SELECT
	SUM(TOTAL) AS INVOICE_TOTAL,
	BILLING_CITY
FROM
	INVOICE
GROUP BY
	BILLING_CITY
ORDER BY
	INVOICE_TOTAL DESC


-- Set 1: Q5: Who is the best customer? The customer who has spent the most money will be
-- declared the best customer. Write a query that returns the person who has spent the
-- most money
SELECT
	CUS.CUSTOMER_ID,
	CUS.FIRST_NAME,
	CUS.LAST_NAME,
	SUM(INV.TOTAL) AS TOTAL
FROM
	CUSTOMER CUS
	JOIN INVOICE INV ON CUS.CUSTOMER_ID = INV.CUSTOMER_ID
GROUP BY
	CUS.CUSTOMER_ID
ORDER BY
	TOTAL DESC
LIMIT 1;

