DROP DATABASE IF EXISTS  lesson6;

CREATE DATABASE IF NOT EXISTS  lesson6;

USE lesson6;

/*

Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

*/

DELIMITER //

CREATE PROCEDURE time_sec(num INT)

BEGIN		CASE

 WHEN num < 60 THEN

  SELECT CONCAT(num, ' ', 'seconds') AS Result;

 WHEN num >= 60 AND num < 3600 THEN

  SELECT CONCAT_WS(' ', num DIV 60, 'minutes', MOD(num, 60), 'seconds') AS Result;

 WHEN num >= 3600 AND num < 86400 THEN

  SELECT CONCAT_WS(' ', num DIV 3600, 'hours', MOD(num, 3600) DIV 60, 'minutes', 

    MOD(MOD(num, 3600),60), 'seconds') AS Result;

  ELSE

   SELECT CONCAT_WS(' ', num DIV 86400, 'days', MOD(num, 86400) DIV 3600, 'hours', 

    MOD(MOD(num, 86400),3600) DIV 60, 'minutes',
    MOD(MOD(MOD(num, 86400),3600),60), 'seconds') AS Result;

END CASE;

END//

DELIMITER ;

CALL time_sec(123456); 

-- Создайте функцию, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10 

delimiter $$ 

CREATE FUNCTION even_value(num INT) 

RETURNS VARCHAR(256) 

DETERMINISTIC 

BEGIN 

DECLARE i INT DEFAULT 0; 

DECLARE result VARCHAR(256); 

SET result = ' '; 

 WHILE i < num DO 
 
  SET i = i + 2; 

  SET result = concat(result, '  ', i); 

   END while; 

   RETURN result; 

END $$ 

delimiter ; 

SELECT even_value(10);
