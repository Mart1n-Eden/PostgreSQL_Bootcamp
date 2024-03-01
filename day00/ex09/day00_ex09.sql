SELECT DISTINCT (SELECT pz.name
	   FROM pizzeria pz
	   WHERE pz.id = pv.pizzeria_id),
	   (SELECT p.name
	   FROM person p
	   WHERE p.id = pv.person_id)
FROM (SELECT person_id, pizzeria_id, visit_date
	 FROM person_visits
	 WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-9') AS pv, person p, pizzeria pz
ORDER BY 2, 1 DESC
