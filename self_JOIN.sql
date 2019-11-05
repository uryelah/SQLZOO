-- 1
SELECT COUNT(id) FROM stops

-- 2
SELECT id FROM stops
   WHERE name='Craiglockhart' 

-- 3
SELECT id, name FROM stops 
   WHERE id IN (SELECT stop FROM route
   WHERE num=4 AND company='LRT')

-- 4
SELECT company, num, COUNT(*) FROM route
   WHERE stop=149 OR stop=53
   GROUP BY company, num
   HAVING COUNT(2)=2

-- 5
SELECT a.company, a.num, a.stop, b.stop FROM route a  
   JOIN route b ON
   (a.company=b.company AND a.num=b.num)
   WHERE a.stop=53 AND b.stop=149

-- 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

-- 7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith' 

-- 8
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

-- 9
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

-- 10

SELECT DISTINCT S.num, S.company, stops.name, E.num, E.company
FROM
(SELECT a.company, a.num, b.stop
 FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
 WHERE a.stop=(SELECT id FROM stops WHERE name= 'Craiglockhart')
)S
  JOIN
(SELECT a.company, a.num, b.stop
 FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
 WHERE a.stop=(SELECT id FROM stops WHERE name= 'Lochend')
)E
ON (S.stop = E.stop)
JOIN stops ON(stops.id = S.stop)