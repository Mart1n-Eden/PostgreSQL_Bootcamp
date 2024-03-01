WITH orderCTE AS 
(SELECT piz.name, COUNT(*) AS c, 'orders' AS action_type
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY 1),
visitCTE AS
(SELECT piz.name, COUNT(*) AS c, 'visits' AS action_type
FROM person_visits pv
JOIN pizzeria piz ON piz.id = pv.pizzeria_id
GROUP BY 1),
unCTE AS
(SELECT *
FROM orderCTE
UNION ALL
SELECT *
FROM visitCTE)

SELECT name, SUM(c)
FROM unCTE
GROUP BY 1
ORDER BY 2 DESC, 1