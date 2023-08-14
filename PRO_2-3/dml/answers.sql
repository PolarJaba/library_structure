--2nd question

SELECT r.reader_id, r.last_name, r.first_name, r.surname, COUNT(rent.rent_id) AS lost_books
FROM reader r
JOIN rent ON r.reader_id = rent.reader_id 
WHERE rent.returned = FALSE  AND (rent.rent_date + INTERVAL '14 days') < current_date -- AND r.reader_id = 2 for example
GROUP BY r.reader_id, r.last_name, r.first_name, r.surname
ORDER BY r.num_id

--3rd question 

WITH 
	lost_books AS (
		SELECT r.book_id, COUNT(r.book_id) AS amount
		FROM rent r
		WHERE (r.rent_date + INTERVAL '14 days') < current_date
		GROUP BY book_id)
UPDATE book 
SET num_of_copies = num_of_copies - lb.amount
FROM lost_books lb
WHERE book.book_id IN (SELECT lb.book_id
						FROM lost_books lb
						JOIN book b ON lb.book_id = b.book_id)

--4th question 

SELECT date_part('year', r.rent_date) AS "year", date_part('quarter', r.rent_date) AS quart_of_year, SUM(b.price) AS los_books_price, COUNT(r.rent_id) AS lost_books_sum
FROM rent r
JOIN book b ON r.book_id = b.book_id 
WHERE returned = FALSE  AND (r.rent_date + INTERVAL '14 days') < current_date AND r.rent_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY quart_of_year, "year" 
ORDER BY quart_of_year

--or for all of years

SELECT date_part('year', r.rent_date) AS "year", date_part('quarter', r.rent_date) AS quart_of_year, SUM(b.price) AS los_books_price, COUNT(r.rent_id) AS lost_books_sum
FROM rent r
JOIN book b ON r.book_id = b.book_id 
WHERE returned = FALSE  AND (r.rent_date + INTERVAL '14 days') < current_date
GROUP BY quart_of_year, "year" 
ORDER BY "year", quart_of_year 