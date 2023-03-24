SELECT name FROM cities
where population > 1000000

SELECT name,region FROM cities
WHERE region = "E" OR region = "W"
order by population

SELECT name,region FROM cities
WHERE region IN ("S","N","C") AND population > 50000

SELECT name,region,population
FROM cities
WHERE region IN ("E","N","W") AND population > 150000 AND population < 350000
ORDER BY name
LIMIT 20

SELECT name,region,population
FROM cities
WHERE region NOT IN ("E","W")
ORDER BY population DESC
LIMIT 10 OFFSET 10