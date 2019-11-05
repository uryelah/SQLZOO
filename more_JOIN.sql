-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2
SELECT yr FROM movie
WHERE title='Citizen Kane'

-- 3
SELECT id, title, yr FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

-- 4
SELECT id FROM actor
WHERE name='Glenn Close'

-- 5
SELECT id FROM movie
WHERE title='Casablanca'

-- 6
SELECT name FROM movie
   JOIN casting ON (casting.movieid=11768) 
   JOIN actor ON (casting.actorid= actor.id)
   GROUP BY movieid, actorid, name

-- 7
SELECT name FROM actor
WHERE id IN (SELECT actorid FROM casting
     WHERE movieid = (SELECT id FROM movie
     WHERE title='Alien'))


-- 8
SELECT title FROM movie
   WHERE id IN (SELECT movieid FROM casting
   WHERE actorid = (SELECT id FROM actor 
   WHERE name='Harrison Ford'))

-- 9
SELECT title FROM movie
   WHERE id IN (SELECT movieid FROM casting
   WHERE actorid = (SELECT id FROM actor 
   WHERE name='Harrison Ford') AND ord!=1 )

-- 10
SELECT title, name FROM movie
   JOIN casting ON (movie.id=casting.movieid)
   JOIN actor ON (casting.actorid=actor.id)
   WHERE yr=1962 AND ord=1

-- 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12
SElECT DISTINCT title, name FROM movie w
   JOIN casting ON (w.id=casting.movieid)
   JOIN actor ON (casting.actorid=actor.id AND ord=1)
   WHERE w.id IN (SELECT DISTINCT movieid FROM casting y
   WHERE y.actorid IN (
   SELECT x.id FROM actor x
   WHERE name='Julie Andrews')) 
   
-- 13
SELECT DISTINCT name FROM actor
   JOIN casting ON (actor.id=casting.actorid and ord=1)
   GROUP BY name
   HAVING COUNT(movieid) >= 30

-- 14
SELECT title, COUNT(actorid) FROM movie
   JOIN casting ON (movie.id=casting.movieid)
   WHERE yr=1978
   GROUP BY title
   ORDER BY COUNT(actorid) DESC, title

-- 15
SELECT name FROM casting 
   JOIN actor ON (casting.actorid=actor.id and name!='Art Garfunkel')
   WHERE movieid IN (SELECT movieid FROM casting
      WHERE actorid = (SELECT id FROM actor WHERE name='Art Garfunkel'))    
