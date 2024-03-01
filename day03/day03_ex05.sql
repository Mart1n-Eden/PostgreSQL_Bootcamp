SELECT piz.name
FROM person_visits pv
JOIN pizzeria piz ON piz.id = pv.pizzeria_id
JOIN person p ON p.id = pv.person_id
WHERE p.name = 'Andrey'
EXCEPT
SELECT piz.name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria piz ON m.pizzeria_id = piz.id
JOIN person p ON p.id = po.person_id
WHERE p.name = 'Andrey'