BEGIN;--Начало транзакции первой Session #1

BEGIN;--Начало транзакции первой Session #2

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;--Устанавливаем уровень изоляции по умолчанию в Session #1

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;--Устанавливаем уровень изоляции по умолчанию в Session #2

UPDATE pizzeria SET rating = 2 WHERE id = 1; --Транзакция для Session #1 для id = 1

UPDATE pizzeria SET rating = 1 WHERE id = 2; --Транзакция для Session #2 для id = 2

UPDATE pizzeria SET rating = 2 WHERE id = 2; --Транзакция для Session #1 для id = 2

UPDATE pizzeria SET rating = 1 WHERE id = 1; --Транзакция для Session #2 для id = 1

COMMIT;--Комит для Session #1

COMMIT;--Комит для Session #2
