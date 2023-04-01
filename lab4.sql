SELECT UPPER(name)
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5

SELECT name, LENGTH (name) AS len
FROM cities
WHERE LENGTH(name) NOT IN (8,9,10)

SELECT sum(population)
FROM cities
WHERE region IN ('C','S')

SELECT region, AVG(population)
FROM cities
WHERE region = 'W'

SELECT COUNT(name)
FROM cities
WHERE region = 'E'