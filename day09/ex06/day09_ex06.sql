CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08') RETURNS TABLE (pizzeria_name VARCHAR) AS 
$$
BEGIN
RETURN QUERY
	SELECT piz.name
	FROM person_visits pv
    JOIN person_order po ON po.person_id = pv.person_id AND po.order_date = pv.visit_date
    JOIN person p ON p.id = pv.person_id
    JOIN menu ON menu.id = po.menu_id
    JOIN pizzeria piz ON piz.id = menu.pizzeria_id
    WHERE p.name = pperson AND menu.price <= pprice AND pv.visit_date = pdate
    GROUP BY piz.id;
    END;
$$ LANGUAGE plpgsql;

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);

-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

-- select * from menu