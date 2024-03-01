SELECT m.pizza_name, piz1.name AS pizzeria_name_1, piz2.name AS pizzeria_name_2, m.price
FROM menu m
JOIN menu men ON men.id <> m.id AND men.pizza_name = m.pizza_name AND men.pizzeria_id < m.pizzeria_id AND men.price = m.price
JOIN pizzeria piz1 ON piz1.id = m.pizzeria_id
JOIN pizzeria piz2 ON piz2.id = m.pizzeria_id
ORDER BY 1