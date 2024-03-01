-- SELECT order_date AS action_date, person_id FROM person_order
-- INTERSECT
-- SELECT visit_date, person_id FROM person_visits
-- ORDER BY action_date, person_id DESC

SELECT action_date, name AS person_name
FROM (SELECT order_date AS action_date, person_id
	 FROM person_order
	 INTERSECT
	 SELECT visit_date, person_id
	 FROM person_visits) as tab
INNER JOIN person ON id = person_id
ORDER BY 1, 2 DESC