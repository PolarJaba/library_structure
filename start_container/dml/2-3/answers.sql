--1st question
SELECT r.reader_id, COUNT(r.reader_id) AS num_of_books
FROM public.rent r
WHERE r.return_date >= '2023-01-01'
GROUP BY r.reader_id
ORDER BY num_of_books DESC;

--2nd
SELECT r.reader_id, COUNT(r.reader_id)
FROM public.rent r 
WHERE (current_date BETWEEN r.rent_date AND  r.return_date) OR r.return_date IS NULL
--replace current_date with any desired date
GROUP BY r.reader_id;

--3rd
SELECT r.reader_id, r.book_id, b.book_name
FROM public.rent r
JOIN public.book b ON r.book_id = b.book_id 
WHERE r.book_id = 2 AND ((current_date BETWEEN r.rent_date AND  r.return_date) OR r.return_date IS NULL);
--replace r.book_id with any desired book_id or use
/*
SELECT r.reader_id, r.book_id, b.book_name
FROM public.rent r
JOIN public.book b ON r.book_id = b.book_id 
WHERE b.book_name = 'Story tales'
*/

--4th (1, 2, 3 are for example)
SELECT r.reader_id, r.book_id, b.book_name
FROM public.rent r
JOIN public.book b ON r.book_id = b.book_id 
WHERE r.reader_id IN (1, 3, 5) AND ((current_date BETWEEN r.rent_date AND  r.return_date) OR r.return_date IS NULL);

--5th 
SELECT COUNT(DISTINCT r.reader_id)
FROM public.rent r 
WHERE (current_date BETWEEN  (r.rent_date + INTERVAL '14 day') AND r.return_date) OR r.return_date IS NULL;

--6th 
SELECT COUNT(r.book_id) AS num_of_rented_books, p.publish_id, p.publish_name  
FROM public.rent r 
JOIN public.book b ON r.book_id = b.book_id 
JOIN public.publisher p ON b.publish_id = p.publish_id
GROUP BY p.publish_id  
ORDER BY num_of_rented_books DESC;

--7th
SELECT COUNT(a2.author_id) AS quantity, a2.author_id 
FROM public.author a 
JOIN public.authorship a2 ON a.author_id =a2.author_id 
GROUP BY a2.author_id
ORDER BY quantity DESC
LIMIT 1;

--8th
SELECT  r.reader_id, SUM(r.return_date-r.rent_date) OVER (PARTITION BY r.reader_id) AS days,  
SUM(b.volume) OVER (PARTITION BY r.reader_id) AS vol_sum, 
(SUM(b.volume) OVER (PARTITION BY r.reader_id))/(SUM(r.return_date-r.rent_date) OVER (PARTITION BY r.reader_id)) AS pages_per_day
FROM public.rent r 
JOIN public.book b ON r.book_id = b.book_id 
WHERE r.return_date IS NOT NULL 
ORDER BY pages_per_day DESC;
