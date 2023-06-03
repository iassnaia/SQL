
/*
Используя JOIN-ы, выполните следующие операции:
1.Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
*/
SELECT *
FROM cats;

SELECT *
FROM shops;

SELECT shops.shopname, cats.name
FROM shops
JOIN cats
ON shops.id = cats.shops_id;

SELECT shops.shopname, cats.name
FROM shops
RIGHT JOIN cats
ON shops.id = cats.shops_id;

SELECT shops.shopname, cats.name
FROM cats
RIGHT JOIN shops
ON shops.id = cats.shops_id;

SELECT shops.shopname, cats.name
FROM shops
LEFT JOIN cats
ON shops.id = cats.shops_id;

-- 2.Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)

SELECT shopname
FROM shops
WHERE EXISTS(SELECT * FROM cats 
WHERE name = 'Murzik' AND shops.id = cats.shops_id);

SELECT *
FROM cats
JOIN shops
ON shops.id = cats.shops_id
WHERE name = 'Murzik';
-- 3.Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

SELECT s.shopname 
FROM shops AS s
LEFT JOIN cats AS c 
ON s.id = c.shops_id 
WHERE c.name = 'Murzik' OR c.name = 'Zuza' IS NULL; 

/* 
4.Вывести название и цену для всех анализов, которые 
продавались 5 февраля 2020 и всю следующую неделю.
*/

SELECT an_name, an_price
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_an
WHERE ord_datetime BETWEEN'2020-02-05' AND '2020-02-12';
