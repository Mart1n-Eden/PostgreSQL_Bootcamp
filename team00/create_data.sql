CREATE TABLE paths
(
	point1 varchar NOT NULL,
	point2 varchar NOT NULL,
	cost integer NOT NULL
);

INSERT INTO paths (point1, point2, cost)
VALUES 
	('a', 'b', 10),
	('a', 'c', 15),
	('a', 'd', 20),
	('b', 'a', 10),
	('b', 'c', 35),
	('b', 'd', 25),
	('c', 'a', 15),
	('c', 'b', 35),
	('c', 'd', 30),
	('d', 'a', 20),
	('d', 'b', 25),
	('d', 'c', 30);