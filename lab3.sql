SELECT name
FROM cities
WHERE name LIKE '%ськ'

SELECT name
FROM cities
WHERE name LIKE '%донец%'

SELECT Concat(name,'(',region,')') population
FROM cities
WHERE population > 100000

SELECT name, (population / 40000000) * 100 AS procent
FROM cities
ORDER BY population DESC
LIMIT 50

SELECT Concat(name,' - ', (population / 40000000) * 100,'%')
FROM cities
ORDER BY population DESC
LIMIT 50