(SELECT piz.name
FROM pizzeria piz
JOIN person_visits pv ON pv.pizzeria_id = piz.id
JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'female'
EXCEPT ALL
SELECT piz.name
FROM pizzeria piz
JOIN person_visits pv ON pv.pizzeria_id = piz.id
JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'male')
UNION ALL
(SELECT piz.name
FROM pizzeria piz
JOIN person_visits pv ON pv.pizzeria_id = piz.id
JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'male'
EXCEPT ALL
SELECT piz.name
FROM pizzeria piz
JOIN person_visits pv ON pv.pizzeria_id = piz.id
JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'female')
ORDER BY 1