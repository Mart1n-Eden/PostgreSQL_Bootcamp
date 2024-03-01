CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);
set Enable_seqscan =off;
EXPLAIN ANALYZE SELECT pizzeria_id
FROM person_discounts