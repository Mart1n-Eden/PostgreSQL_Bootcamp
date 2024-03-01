SELECT  p.name AS person_name, COUNT(pv.id) AS visit_count
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
GROUP BY 1
HAVING COUNT(pv.id) > 3;