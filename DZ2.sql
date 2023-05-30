DROP DATABASE IF EXISTS lesson2;
CREATE DATABASE IF NOT EXISTS lesson2;
USE lesson2;

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT NOT NULL
);
INSERT INTO sales (order_date, count_product)
VALUES 
	("2022-01-01", "156"),
	("2022-01-02", "180"),
	("2022-01-03", "21"),
    ("2022-01-04", "124"),
    ("2022-01-05", "341");
    
SELECT * FROM sales; 

ALTER TABLE sales
ADD COLUMN order_type VARCHAR(30);

 SELECT 
      id AS "ID заказа",
		IF (count_product < 100, "Маленький заказ",
         IF (count_product >= 100 AND count_product <= 300, "Средний заказ","Большой заказ"))
         AS "Тип заказа"
         FROM sales;  
         
CREATE TABLE orders
(id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(45) NOT NULL,
amount DECIMAL NOT NULL,
order_status VARCHAR(20) NOT NULL
);         
SELECT * FROM orders; 

INSERT INTO orders(employee_id, amount, order_status)
VALUES 
	("e03", "15.00", "OPEN"),
	("e01", "25.50", "OPEN"),
	("e05", "100.70", "CLOSED"),
    ("e02", "22.18", "OPEN"),
    ("e04", "9.50", "CANCELLED");
    SELECT * FROM orders;
    
SELECT order_status,
CASE 
WHEN order_status = "OPEN" THEN "Order is in open state"
WHEN order_status = "CLOSED" THEN "Order is closed"
ELSE "Order is cancelled"
END AS full_order_status
FROM orders;

/* NULL - это специальное значение, которое используется в SQL 
для обозначения отсутствия данных. Оно отличается от пустой строки
или нулевого значения, так как NULL означает отсутствие какого-либо
значения в ячейке таблицы.*/
