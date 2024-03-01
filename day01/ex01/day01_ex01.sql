(SELECT  name AS object_name FROM person
ORDER BY 1)
UNION ALL
(SELECT  pizza_name FROM menu AS object_name
ORDER BY 1)
