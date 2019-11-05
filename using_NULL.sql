-- 1
SELECT name FROM teacher
   WHERE dept IS NULL

-- 2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
           
-- 4
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
           
-- 5
SELECT teacher.name, COALESCE(teacher.mobile, '07986 444 2266')
FROM teacher

-- 6
SELECT teacher.name, COALESCE(dept.name, 'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
   
-- 7
SELECT COUNT(name), COUNT(mobile) FROM teacher

-- 8
SELECT dept.name, COUNT(teacher.name) FROM dept 
   LEFT JOIN teacher ON (dept.id=teacher.dept)
   GROUP BY dept.name

-- 9
SELECT name, (CASE WHEN teacher.dept < 3 THEN 'Sci' ELSE 'Art' END) FROM teacher

-- 10
SELECT name, (CASE WHEN teacher.dept < 3 THEN 'Sci' WHEN teacher.dept = 3 THEN 'Art' ELSE 'None' END) FROM teacher
