SELECT gs::date AS missing_date
FROM (SELECT * 
	  FROM person_visits
	 WHERE person_id BETWEEN 1 AND 2) AS pv
RIGHT JOIN GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') as gs ON pv.visit_date = gs
WHERE pv.id IS NULL
ORDER BY 1