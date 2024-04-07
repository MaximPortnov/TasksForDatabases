
# Answer for module 1

## Content

1. [Chapter I](#chapter-i)\
    1.1. [Task 1](#task-1)\
    1.2. [Task 2](#task-2)\
    1.3. [Task 3](#task-3)\
    1.4. [Task 4](#task-4)\
    1.5. [Task 5](#task-5)\
    1.6. [Task 6](#task-6)\
    1.7. [Task 7](#task-7)\
    1.8. [Task 8](#task-8)\
    1.9. [Task 9](#task-9)\
    1.9. [Task 10](#task-10)

## Chapter I

### Task 1

```SQL
SELECT name, age 
FROM customer
WHERE address = 'Kazan';
```

|name  |age|
|:----|:-:|
|Kate  |33 |
|Denis |13 |
|Elvira|45 |

---

### Task 2

```SQL
SELECT name, age 
FROM customer
WHERE address = 'Kazan' AND gender = 'female'
ORDER BY name;
```

|name  |age|
|:----|:-:|
|Elvira|45 |
|Kate  |33 |

---

### Task 3

```SQL
SELECT name, rating 
FROM cafe
WHERE rating >= 3.5 AND rating <= 5.0
ORDER BY rating;

SELECT name, rating 
FROM cafe
WHERE rating BETWEEN 3.5 AND 5.0
ORDER BY rating;
```

|name|rating|
|:-|:-:|
|Bean There|4.2|
|Starbucks|4.3|
|Coffee House|4.6|
|Cafe Nero|4.9|

---

### Task 4

```SQL
SELECT DISTINCT cv.customer_id 
FROM customer_visits as cv
WHERE 
    cv.visit_date BETWEEN '2022-01-06' AND '2022-01-09'
    OR cv.cafe_id = 2
ORDER BY cv.customer_id DESC;
```

|customer_id|
|:-|
|9|
|8|
|7|
|6|
|5|
|4|
|2|

---

### Task 5

```SQL
SELECT 
    name || 
    ' (age:' || age || 
    ',gender:''' || gender  || 
    ''',address:''' || address || ''')' 
    as customer_information 
FROM customer
ORDER BY customer_information ASC;
```

|customer_information|
|:--|
|Andrey (age:21,gender:'male',address:'Moscow')|
|Anna (age:16,gender:'female',address:'Moscow')|
|Denis (age:13,gender:'male',address:'Kazan')|
|Dmitriy (age:18,gender:'male',address:'Samara')|
|Elvira (age:45,gender:'female',address:'Kazan')|
|Irina (age:21,gender:'female',address:'Saint-Petersburg')|
|Kate (age:33,gender:'female',address:'Kazan')|
|Nataly (age:30,gender:'female',address:'Novosibirsk')|
|Peter (age:24,gender:'male',address:'Saint-Petersburg')|

---

### Task 6

```SQL
SELECT 
    (SELECT name FROM customer WHERE id = co.customer_id ) AS name
FROM customer_orders AS co
WHERE co.order_date = '2022-01-07'
    AND (
        co.menu_id = 13 OR
        co.menu_id = 14 OR
        co.menu_id = 18
    );
```

|name|
|:-|
|Denis|
|Nataly|

---

### Task 7

```SQL
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
```

|name|check_name|
|:-|:-|
|Denis|true|
|Nataly|false|

---

### Task 8

```SQL
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
```

|id|name|interval_info|
|:-:|--|--|
|1|Anna|interval #1|
|4|Denis|interval #1|
|9|Dmitriy|interval #1|
|6|Irina|interval #2|
|2|Andrey|interval #2|
|8|Nataly|interval #3|
|5|Elvira|interval #3|
|7|Peter|interval #3|
|3|Kate|interval #3|

---

### Task 9

```SQL
SELECT * 
FROM customer_orders AS co
WHERE co.id % 2 = 0
ORDER BY id;
```

|id|customer_id|menu_id|order_date|
|:-:|---|---|---|
|2|1|2|2022-01-01|
|4|2|9|2022-01-01|
|6|4|16|2022-01-07|
|8|4|18|2022-01-07|
|10|4|7|2022-01-08|
|12|5|7|2022-01-09|
|14|7|3|2022-01-03|
|16|7|4|2022-01-05|
|18|8|14|2022-01-07|
|20|9|6|2022-01-10|

---

### Task 10

```SQL
SELECT 
    (SELECT name FROM customer WHERE id = cv.customer_id) AS customer_name,
    (SELECT name FROM cafe WHERE id = cv.cafe_id) AS cafe_name
FROM (
    SELECT customer_id, cafe_id 
    FROM customer_visits 
    WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
) AS cv
ORDER BY customer_name ASC, cafe_name DESC;
```

|customer_name|cafe_name|
|---|---|
|Denis|Local Brew|
|Denis|Bean There|
|Dmitriy|Local Brew|
|Dmitriy|Cafe Nero|
|Elvira|Starbucks|
|Elvira|Bean There|
|Irina|Starbucks|
|Nataly|Cafe Nero|
