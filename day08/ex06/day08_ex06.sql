BEGIN;--Начало транзакции первой Session #1

BEGIN;--Начало транзакции первой Session #2

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;--Устанавливаем уровень изоляции REPEATABLE READ в Session #1

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;--Устанавливаем уровень изоляции REPEATABLE READ в Session #2

SELECT SUM(rating) FROM pizzeria;--Выводим суммарное значение рейтинга в Session #1

UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut'; --Транзакция для Session #2

COMMIT;--Комит для Session #2

SELECT SUM(rating) FROM pizzeria;--Выводим суммарное значение рейтинга в Session #1

COMMIT;--Комит для Session #1

SELECT SUM(rating) FROM pizzeria;--Выводим суммарное значение рейтинга в Session #1

SELECT SUM(rating) FROM pizzeria;--Выводим суммарное значение рейтинга в Session #2