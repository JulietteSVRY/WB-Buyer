DROP DATABASE IF EXISTS sql222;

CREATE DATABASE IF NOT EXISTS sql222;

USE sql222;

-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
CREATE TABLE IF NOT EXISTS sales
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL,
    bucket VARCHAR(50) AS (
        CASE
            WHEN count_product <= 100 THEN 'less than equal to 100'
            WHEN count_product BETWEEN 101 AND 300 THEN '101 to 300'
            WHEN count_product > 300 THEN 'greater than 300'
            ELSE 'unknown'
        END
    ) STORED
);

INSERT INTO sales(order_date, count_product)
VALUES
    ('2021-01-01', 156),
    ('2021-01-02', 180),
    ('2021-01-03', 21),
    ('2021-01-04', 124),
    ('2021-01-05', 341);

SELECT * FROM sales;

-- 2. Разделите  значения поля “bucket” на 3 сегмента: меньше 100(“Маленький заказ”), 100-300(“Средний заказ”) и больше 300 (“Большой заказ”)
SELECT 
	id,
    CASE
		WHEN count_product < 100 THEN "Маленький заказ"
        WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
        ELSE "Большой заказ"
    END AS "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE.
CREATE TABLE IF NOT EXISTS orders
(
    orderid INT PRIMARY KEY AUTO_INCREMENT,
    employeeid VARCHAR(20),
    amount FLOAT DEFAULT 0.0,
    orderstatus VARCHAR(20)
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
    ('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED'),
    ('e04', 99.99, 'OPEN');

SELECT
    orderid,
    employeeid,
    orderstatus,
    CASE
        WHEN orderstatus = 'OPEN' THEN 'Order is in open state.'
        WHEN orderstatus = 'CLOSED' THEN 'Order is closed.'
        WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled.'
        ELSE ''
    END AS order_summary
FROM orders;

