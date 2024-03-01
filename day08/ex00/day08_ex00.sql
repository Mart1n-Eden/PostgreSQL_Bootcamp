BEGIN;--Начало первой Session #1

UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut'; --Транзакция для Session #1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'--Вывод рейтинга для Session #1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'--Вывод рейтинга для Session #2

COMMIT;--Комит для Session #1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'--Вывод рейтинга для Session #2 после комита