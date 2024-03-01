COMMENT ON TABLE person_discounts IS 'Таблица со скидками для каждого человека в конктретных пиццериях';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный номер скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'ID человека';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки';