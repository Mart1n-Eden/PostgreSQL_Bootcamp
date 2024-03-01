SELECT person.name AS person_name, pizza_name, pizzeria.name
FROM person
INNER JOIN person_order ON person.id = person_id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2, 3