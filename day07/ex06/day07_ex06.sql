SELECT piz.name, COUNT(*) AS count_of_order, ROUND(SUM(m.price) / COUNT(*), 2) AS average_price, MAX(m.price) AS max_price, MIN(m.price) AS min_price
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY 1
ORDER BY 1