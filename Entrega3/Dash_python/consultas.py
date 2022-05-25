def champRange():
    return """SELECT cp.name as champion, AVG(a.base_range)::real as range
    FROM (Champion c INNER JOIN Play p ON (c.name = p.name_Champion)) cp
    INNER JOIN Ability a on (cp.name = a.name_Champion)
	GROUP BY cp.name"""
    
def champDeaths():
    return """SELECT c.name as champion, SUM(p.deaths) Total_Deaths
    FROM Champion c INNER JOIN Play p ON (c.name = p.name_Champion)
    GROUP BY c.name
    ORDER BY Total_Deaths DESC"""
    
def champKills():
    return """SELECT c.name as champion, SUM(p.kills) Total_Kills
    FROM Champion c INNER JOIN Play p ON (c.name = p.name_Champion)
    GROUP BY c.name
    ORDER BY Total_Kills DESC"""
    
def champKD():
    return """(SELECT c.name champion, SUM(p.kills)::real KD 
 FROM Champion c INNER JOIN Play p ON (c.name = p.name_Champion)
 GROUP BY c.name 
 HAVING SUM(p.deaths) = 0)
UNION
(SELECT c.name, SUM(p.Kills)/SUM(p.Deaths)::real KD
 FROM Champion c INNER JOIN Play p ON (c.name = p.name_Champion)
 GROUP BY c.name
 HAVING SUM(p.Deaths)>0)"""
 
def notPlayed():
     return """SELECT c.name champions
FROM Champion c LEFT JOIN Play p ON (c.name = p.name_Champion)
WHERE p.pick_rate is NULL"""