SELECT name, age FROM person
WHERE address = 'Kazan';



SELECT name, age FROM person
WHERE address = 'Kazan' 
    AND gender = 'female'
ORDER BY name;



SELECT name, rating FROM pizzeria
WHERE rating >= 3.5 AND rating <= 5.0
ORDER BY rating;

SELECT name, rating FROM pizzeria
WHERE rating BETWEEN 3.5 and 5.0
ORDER BY rating;





SELECT DISTINCT pv.person_id FROM person_visits as pv
WHERE pv.visit_date BETWEEN '2022-01-06' AND ' 2022-01-09'
    OR pv.pizzeria_id = 2
ORDER BY pv.person_id DESC;




SELECT 
    name || ' (age:' || age || 
    ',gender:' || CHR(39) || gender || CHR(39) || 
    ',address:' || CHR(39) || address || CHR(39) || 
    ')' as person_information FROM person
ORDER BY person_information ASC;




SELECT 
    (SELECT name FROM person WHERE id = po.person_id ) AS name
FROM person_order AS po
WHERE po.order_date = '2022-01-07'
    AND (
        po.menu_id = 13 OR
        po.menu_id = 14 OR
        po.menu_id = 18
    )

    




SELECT 
    (SELECT name FROM person WHERE id = po.person_id ) AS name,
    CASE 
        WHEN ( SELECT name FROM person WHERE id = po.person_id ) = 'Denis' THEN 'true' ELSE 'false' 
    END AS check_name 
FROM person_order AS po
WHERE po.order_date = '2022-01-07'
    AND (
        po.menu_id = 13 OR
        po.menu_id = 14 OR
        po.menu_id = 18
    );

-- SELECT 
--     (SELECT name FROM person WHERE id = po.person_id ) AS name,
--     (SELECT name FROM person WHERE id = po.person_id ) = 'Denis' AS check_name 
-- FROM person_order AS po
-- WHERE po.order_date = '2022-01-07'
--     AND (
--         po.menu_id = 13 OR
--         po.menu_id = 14 OR
--         po.menu_id = 18
--     );






SELECT 
    p.id, 
    p.name, 
    CASE
        WHEN age BETWEEN 10 AND 20 THEN 'interval #1'
        WHEN age BETWEEN 21 AND 23 THEN 'interval #2'
        ELSE 'interval #3'
    END AS interval_info
FROM person AS p
ORDER BY interval_info ASC;





SELECT 
    * 
FROM person_order AS po
WHERE po.id % 2 = 0
ORDER BY id




SELECT (SELECT name FROM person WHERE id = pv.person_id) AS person_name ,
        (SELECT name FROM pizzeria WHERE id = pv.pizzeria_id) AS pizzeria_name
FROM (
    SELECT 
        person_id, 
        pizzeria_id 
    FROM person_visits 
    WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
    ) AS pv
ORDER BY person_name ASC, pizzeria_name DESC;
