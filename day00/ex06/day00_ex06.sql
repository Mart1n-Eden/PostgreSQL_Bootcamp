-- SELECT p.name, CASE
-- 				WHEN name = 'Denis'
-- 				THEN true
-- 				ELSE false
-- 				END AS check_name
-- FROM (SELECT person_id, menu_id, order_date
-- 	 FROM person_order) po, person p
-- WHERE p.id = po.person_id AND (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18) AND (po.order_date = '2022-01-07') 



-- SELECT (SELECT p.name
-- 	   FROM person p
-- 	   WHERE p.id = po.person_id AND (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18) AND po.order_date = '2022-01-07')

-- FROM person_order po
-- GROUP BY name;

SELECT (SELECT p.name
	   FROM person p
	   WHERE p.id = po.person_id), CASE
				WHEN name = 'Denis'
				THEN true
				ELSE false
				END AS check_name
FROM person_order po, person p
WHERE p.id = po.person_id AND (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18) AND po.order_date = '2022-01-07'