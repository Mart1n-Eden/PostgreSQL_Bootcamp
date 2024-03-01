SELECT menu.pizza_name, menu.price, piz.name
FROM
(SELECT m.id
FROM menu m
EXCEPT
SELECT po.menu_id
FROM person_order po) AS m
JOIN menu ON menu.id = m.id
JOIN pizzeria piz ON piz.id = menu.pizzeria_id
ORDER BY 1, 2