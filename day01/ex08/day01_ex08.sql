SELECT order_date, (name || ' (age:' || age || ')') AS person_information
FROM person_order NATURAL JOIN (SELECT id AS person_id, name, age FROM person) as tab
ORDER by 1, 2