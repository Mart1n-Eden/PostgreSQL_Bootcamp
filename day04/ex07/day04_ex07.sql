INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id)+1 FROM person_visits),
		(SELECT id FROM person WHERE name = 'Dmitriy'), 
		(SELECT DISTINCT piz.id
		FROM menu m
		INNER JOIN pizzeria piz ON m.pizzeria_id = piz.id
		INNER JOIN person_visits pv ON pv.pizzeria_id = piz.id
		INNER JOIN person p ON p.id = pv.person_id
		WHERE m.price  < 800 AND piz.name <> 'Papa Johns'),
		'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
-- select * from mv_dmitriy_visits_and_eats