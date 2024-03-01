SELECT m.pizza_name, m.price, piz.name AS pizza_name, pv.visit_date
FROM person_visits pv
JOIN person p ON p.id = pv.person_id
JOIN pizzeria piz ON piz.id = pv.pizzeria_id
JOIN menu m ON piz.id = m.pizzeria_id
WHERE p.name = 'Kate' AND m.price BETWEEN 800 AND 1000
ORDER BY 1,2,3