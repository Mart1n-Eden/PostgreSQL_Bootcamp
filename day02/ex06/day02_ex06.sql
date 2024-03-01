SELECT m.pizza_name, piz.name
FROM menu m
INNER JOIN person_order  po ON po.menu_id = m.id
INNER JOIN pizzeria piz ON m.pizzeria_id = piz.id
INNER JOIN person p ON p.id = po.person_id
WHERE p.name IN('Denis', 'Anna')
ORDER BY 1, 2