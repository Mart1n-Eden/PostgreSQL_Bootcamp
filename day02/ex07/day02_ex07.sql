SELECT piz.name
FROM menu m
INNER JOIN pizzeria piz ON m.pizzeria_id = piz.id
INNER JOIN person_visits pv ON pv.pizzeria_id = piz.id
INNER JOIN person p ON p.id = pv.person_id
WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND m.price  < 800