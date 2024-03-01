SELECT piz.name, piz.rating
FROM pizzeria piz
LEFT JOIN person_visits  pv ON piz.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL