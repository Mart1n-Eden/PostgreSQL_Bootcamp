SELECT p.name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female' AND m.pizza_name = 'cheese pizza'
INTERSECT
SELECT p.name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female' AND m.pizza_name = 'pepperoni pizza'
ORDER BY 1