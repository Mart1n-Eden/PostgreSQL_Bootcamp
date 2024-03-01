SELECT p.name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON m.id = po.menu_id
WHERE p.address IN('Moscow', 'Samara') AND m.pizza_name IN('pepperoni pizza', 'mushroom pizza') AND p.gender = 'male'
ORDER BY 1 DESC