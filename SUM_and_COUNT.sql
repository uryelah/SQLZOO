-- 1
SELECT SUM(population)
FROM world

-- 2
SELECT continent FROM world
GROUP BY continent

-- 3
SELECt SUM(gdp) FROM world
   WHERE continent='Africa'

-- 4
SELECT COUNT(name) FROM world
   WHERE area >= 1000000 

-- 5
SELECT SUM(population) FROM world
   WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 6
SELECt continent, COUNT(name) FROM world
   GROUP BY continent

-- 7
SELECT continent, count(name) FROM world
   WHERE population >= 10000000
   GROUP BY continent

-- 8 
SELECT continent FROM world
   GROUP BY continent
   HAVING SUM(population) >= 100000000