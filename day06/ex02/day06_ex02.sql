SELECT p.name, m.pizza_name, m.price, (ROUND(m.price * (100 - pd.discount) / 100)) AS discount_price, piz.name
FROM menu m
JOIN person_order po ON po.menu_id = m.id
JOIN person p ON p.id = po.person_id
JOIN pizzeria piz ON piz.id = m.pizzeria_id
JOIN person_discounts pd ON pd.person_id = p.id
ORDER BY 1, 2