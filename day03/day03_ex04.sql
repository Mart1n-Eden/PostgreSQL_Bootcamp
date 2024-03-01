(SELECT piz.name
FROM pizzeria piz
JOIN menu m ON m.pizzeria_id = piz.id
JOIN person_order po ON po.menu_id = m.id
JOIN person p ON p.id = po.person_id
WHERE p.gender = 'female'
EXCEPT
SELECT piz.name
FROM pizzeria piz
JOIN menu m ON m.pizzeria_id = piz.id
JOIN person_order po ON po.menu_id = m.id
JOIN person p ON p.id = po.person_id
WHERE p.gender = 'male')
UNION
(SELECT piz.name
FROM pizzeria piz
JOIN menu m ON m.pizzeria_id = piz.id
JOIN person_order po ON po.menu_id = m.id
JOIN person p ON p.id = po.person_id
WHERE p.gender = 'male'
EXCEPT
SELECT piz.name
FROM pizzeria piz
JOIN menu m ON m.pizzeria_id = piz.id
JOIN person_order po ON po.menu_id = m.id
JOIN person p ON p.id = po.person_id
WHERE p.gender = 'female')
ORDER BY 1