CREATE TABLE person_discounts (
 id bigint PRIMARY KEY,
 person_id bigint NOT NULL,
 pizzeria_id bigint NOT NULL,
 discount numeric,
 constraint fk_person_discounts_pizzeria_id foreign key (pizzeria_id) references pizzeria(id),
 constraint fk_person_discounts_person_id foreign key (person_id) references person(id));
-- select * from person_discounts