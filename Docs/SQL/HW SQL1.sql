-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ
CREATE DATABASE IF NOT EXISTS hw1;

USE hw1;

CREATE TABLE IF NOT EXISTS `hw1`.`telephon` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `ProductCount` DOUBLE NULL,
  `Price` DOUBLE NULL,
  PRIMARY KEY (`Id`));
  
INSERT telephon(ProductName, Manufacturer, ProductCount, Price) 
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

SELECT * FROM telephon;

-- 2.Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price
FROM telephon
WHERE ProductCount > 2; 

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM telephon
WHERE Manufacturer = 'Samsung';

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT *
FROM telephon
WHERE ProductCount * Price > 100000 AND
	ProductCount * Price < 145000;

-- 4.1 C помощью регуляр. выражений найти товары, в которых есть упоминание "Iphone"
SELECT *
FROM telephon
WHERE ProductName LIKE '%Iphone%';

-- 4.2 C помощью регуляр. выражений найти "Galaxy"
SELECT *
FROM telephon
WHERE ProductName LIKE '%Galaxy%';

-- 4.3 C помощью регуляр. выражений найти товары, в которых есть ЦИФРЫ
SELECT *
FROM telephon
WHERE ProductName RLIKE '[:digit:]';

-- 4.4 C помощью регуляр. выражений найти товары, в которых есть ЦИФРА "8"
SELECT *
FROM telephon
WHERE ProductName RLIKE '8';