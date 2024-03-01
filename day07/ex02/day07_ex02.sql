(SELECT piz.name, COUNT(po.person_id), 'order' AS action_type
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3)
UNION
(SELECT piz.name, COUNT(pv.person_id), 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria piz ON piz.id = pv.pizzeria_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3)
ORDER BY 3, 2 DESC