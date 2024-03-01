BEGIN;--Начало транзакции первой Session #1

BEGIN;--Начало транзакции первой Session #2

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;--Устанавливаем уровень изоляции по умолчанию в Session #1

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;--Устанавливаем уровень изоляции по умолчанию в Session #2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';--Выводим значение рейтинга пиццерии в Session #1

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --Транзакция для Session #2

COMMIT;--Комит для Session #2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';--Выводим значение рейтинга пиццерии в Session #1

COMMIT;--Комит для Session #1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';--Выводим значение рейтинга пиццерии в Session #1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';--Выводим значение рейтинга пиццерии в Session #2