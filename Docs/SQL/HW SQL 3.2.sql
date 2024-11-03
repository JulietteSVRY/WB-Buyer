DROP DATABASE IF EXISTS hw3;

CREATE DATABASE IF NOT EXISTS hw3;

USE hw3;

-- 'Персонал'
CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    `surname` VARCHAR(45),
    `speciality` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
);

INSERT INTO `staff` (name, surname, speciality, seniority, salary, age)
VALUES 
 ('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
 ('Петр', 'Петькин', 'Начальник', 8, 70000, 30),
 ('Катя', 'Каткина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сашкин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
 ('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юра', 'Юркин', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Воронин', 'Рабочий', 2, 11000, 22),
 ('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
 ('Люся', 'Люськина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff;

-- 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
-- по убыванию:
SELECT *
FROM staff
ORDER BY salary DESC;

-- по возрастанию: 
SELECT *
FROM staff
ORDER BY salary ASC;

-- 2**. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT speciality, SUM(salary) AS total_salary
FROM staff
GROUP BY speciality
HAVING SUM(salary) > 100000;
