-- 1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- 2
SELECT id,stadium,team1,team2 FROM game
   WHERE id = 1012   

-- 3
SELECT player,teamid, stadium, mdate FROM game
   JOIN goal ON (game.id=goal.matchid and goal.teamid='GER')

-- 4
SELECT team1, team2, player FROM game
   JOIN goal ON (game.id=goal.matchid and goal.player LIKE 'Mario%')

-- 5
SELECT player, teamid, coach, gtime FROM goal 
   JOIN eteam on teamid=id
   WHERE gtime<=10
 
-- 6
SELECT mdate, teamname FROM game
   JOIN eteam ON (game.team1=eteam.id and eteam.coach='Fernando Santos')

-- 7
SELECT player FROM game
   JOIN goal ON (game.id=goal.matchid and game.stadium='National Stadium, Warsaw')

-- 8
SELECT DISTINCT player FROM game 
   JOIN goal ON (goal.matchid = game.id) 
   WHERE (team1='GER' OR team2='GER')
   AND teamid!='GER'

-- 9
SELECT teamname, COUNT(id) FROM eteam
 JOIN goal ON id=teamid
 GROUP BY teamname

-- 10
SELECT stadium, count(id) FROM goal
   JOIN game ON (goal.matchid=game.id) 
   GROUP BY stadium

-- 11
SELECT matchid, mdate, COUNT(teamid) FROM game 
   JOIN goal ON (goal.matchid=game.id) 
   WHERE (team1 = 'POL' OR team2 = 'POL')
   GROUP BY matchid, mdate

-- 12
SELECT matchid, mdate, COUNT(teamid) FROM game
   JOIN goal ON (goal.matchid=game.id and teamid='GER')
   GROUP BY matchid, mdate

-- 13
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game LEFT JOIN goal ON (id = matchid)
    GROUP BY mdate,team1,team2
    ORDER BY mdate, matchid, team1, team2