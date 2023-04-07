SELECT SUM(population), region
FROM cities
GROUP BY region

SELECT SUM(population), region, COUNT(name) as quantity
FROM cities
GROUP BY region
HAVING COUNT(name) >= 10

SELECT name, population
FROM cities
WHERE region in (SELECT uuid
                  FROM regions
                  WHERE area_quantity >= 5)
ORDER BY population DESC
LIMIT 5 OFFSET 10

SELECT name, (SELECT SUM(population)
FROM cities
WHERE population > 300000 AND( cities.region = regions.uuid)) as region_population
FROM regions
ORDER BY region_population DESC
         
SELECT name, population
FROM cities
WHERE region IN (SELECT uuid
                  FROM regions
                  WHERE area_quantity <= 5) AND (population < 150000 OR population > 500000)
