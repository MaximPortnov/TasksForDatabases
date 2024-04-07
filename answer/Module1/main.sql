-- Active: 1712235013311@@localhost@5432@test@public

SELECT name, age 
FROM customer
WHERE address = 'Kazan';



SELECT name, age 
FROM customer
WHERE address = 'Kazan' AND gender = 'female'
ORDER BY name;



SELECT name, rating 
FROM cafe
WHERE rating >= 3.5 AND rating <= 5.0
ORDER BY rating;

SELECT name, rating 
FROM cafe
WHERE rating BETWEEN 3.5 AND 5.0
ORDER BY rating;





SELECT DISTINCT cv.customer_id 
FROM customer_visits as cv
WHERE 
    cv.visit_date BETWEEN '2022-01-06' AND '2022-01-09'
    OR cv.cafe_id = 2
ORDER BY cv.customer_id DESC;




SELECT 
    name || 
    ' (age:' || age || 
    ',gender:''' || gender  || 
    ''',address:''' || address || ''')' 
    as customer_information 
FROM customer
ORDER BY customer_information ASC;




SELECT 
    (SELECT name FROM customer WHERE id = co.customer_id ) AS name
FROM customer_orders AS co
WHERE co.order_date = '2022-01-07'
    AND (
        co.menu_id = 13 OR
        co.menu_id = 14 OR
        co.menu_id = 18
    );

    




SELECT 
    (SELECT name FROM customer WHERE id = co.customer_id ) AS name,
    (SELECT name FROM customer WHERE id = co.customer_id ) = 'Denis' AS check_name 
FROM customer_orders AS co
WHERE co.order_date = '2022-01-07'
    AND (
        co.menu_id = 13 OR
        co.menu_id = 14 OR
        co.menu_id = 18
    );





SELECT 
    c.id, 
    c.name, 
    CASE
        WHEN age >= 10 AND age <= 20 THEN 'interval #1'
        WHEN age > 20 AND age < 24 THEN 'interval #2'
        ELSE 'interval #3'
    END AS interval_info
FROM customer AS c
ORDER BY interval_info ASC;





SELECT 
    * 
FROM customer_orders AS co
WHERE co.id % 2 = 0
ORDER BY id;




SELECT 
    (SELECT name FROM customer WHERE id = cv.customer_id) AS customer_name,
    (SELECT name FROM cafe WHERE id = cv.cafe_id) AS cafe_name
FROM (
    SELECT customer_id, cafe_id 
    FROM customer_visits 
    WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
) AS cv
ORDER BY customer_name ASC, cafe_name DESC;
