DROP DATABASE IF EXISTS hww5_cars;
CREATE DATABASE IF NOT EXISTS hww5_cars;
USE hww5_cars;


CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов   
CREATE VIEW cars_view AS
(
	SELECT *
    FROM cars
    WHERE cost < 25000
);

SELECT *
FROM cars_view;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW cars_view AS
(
	SELECT *
    FROM cars
    WHERE cost < 30000
);

SELECT *
FROM cars_view;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW cars_view2 AS
(
	SELECT *
    FROM cars
    WHERE name IN ("Skoda", "Audi")
);

SELECT *
FROM cars_view2;

-- 4 задание Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
CREATE TABLE IF NOT EXISTS Analysis (
    an_id INT PRIMARY KEY,
    an_name VARCHAR(100),
    an_cost DECIMAL(10, 2),
    an_price DECIMAL(10, 2),
    an_group INT
);

CREATE TABLE IF NOT EXISTS Groupps (
    gr_id INT PRIMARY KEY,
    gr_name VARCHAR(100),
    gr_temp VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Orders (
    ord_id INT PRIMARY KEY,
    ord_datetime DATETIME,
    ord_an INT
);

INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group) VALUES
(1, 'Анализ крови', 300.00, 500.00, 1),
(2, 'Анализ мочи', 150.00, 250.00, 1),
(3, 'Анализ на COVID-19', 800.00, 1200.00, 2),
(4, 'Аллергены', 400.00, 600.00, 1),
(5, 'Гормоны', 700.00, 1000.00, 3);

INSERT INTO Groupps (gr_id, gr_name, gr_temp) VALUES
(1, 'Общие анализы', 'Обычный'),
(2, 'Специальные анализы', 'Холодный'),
(3, 'Гормональные анализы', 'Комнатная');

INSERT INTO Orders (ord_id, ord_datetime, ord_an) VALUES
(1, '2020-02-05 10:00:00', 1),
(2, '2020-02-06 11:30:00', 2),
(3, '2020-02-07 14:00:00', 3),
(4, '2020-02-08 09:15:00', 4),
(5, '2020-02-12 13:45:00', 5),
(6, '2020-02-10 16:30:00', 1),
(7, '2020-02-14 17:00:00', 2);

SELECT a.an_name, a.an_price
FROM Analysis a
JOIN Orders o ON a.an_id = o.ord_an
WHERE o.ord_datetime >= '2020-02-05' AND o.ord_datetime < '2020-02-12';

-- 5.
/*
Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD .
 Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
 В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/

DROP DATABASE IF EXISTS hw5_trains;
CREATE DATABASE IF NOT EXISTS hw5_trains;
USE hw5_trains;

CREATE TABLE trains(
	train_id INT NOT NUll,
    station VARCHAR(20) NOT NUll,
    station_time TIME NOT NUll
);

INSERT INTO trains
VALUES
(110, "San Francisco", '10:00:00'),
(110, "Redwood City", '10:54:00'),
(110, "Palo Alto", '11:02:00'),
(110, "San Jose", '12:35:00'),
(120, "San Francisco", '11:00:00'),
(120, "Palo Alto", '12:49:00'),
(120, "San Jose", '13:30:00');

SELECT 
    train_id,
    station,
    station_time,
    TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time), station_time) AS time_to_next_station
FROM trains;

