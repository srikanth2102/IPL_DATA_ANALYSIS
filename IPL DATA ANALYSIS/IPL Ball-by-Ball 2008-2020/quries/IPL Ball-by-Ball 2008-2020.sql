-- creating a database ipl
use ipl;

--creating table ipl_players
CREATE TABLE ipl_players(id INT,
	inning INT,
    overs INT,
    balls INT,
	batsman VARCHAR(255),
    non_striker VARCHAR(255),
    bowler VARCHAR(255),
    batsman_runs INT,
    extra_runs INT,
	total_runs INT,
	non_boundary INT,
    is_wicket INT,	
    dismissal_kind VARCHAR(255),
    player_dismissed VARCHAR(255),
    fielder VARCHAR(255),
    extras_type VARCHAR(255),
    batting_team VARCHAR(255),
    bowling_team VARCHAR(255)
);

SELECT *
FROM ipl_players;

-- batsman with most runs
SELECT batsman, SUM(batsman_runs)
FROM ipl_players
GROUP BY batsman
ORDER BY SUM(batsman_runs) DESC;

-- bowler with most wickets
SELECT bowler, SUM(is_wicket)
FROM ipl_players
GROUP BY bowler
ORDER BY SUM(is_wicket) DESC;

-- average score of csk while batting first
SELECT batting_team, SUM(total_runs)/
    (SELECT COUNT(DISTINCT((id)))
    FROM ipl_players
    WHERE
    (batting_team='Chennai Super Kings'
    OR
    bowling_team = 'Chennai Super Kings'))
FROM ipl_players 
WHERE batting_team = 'Chennai Super Kings';


-- fielder with most catches
SELECT fielder, COUNT(dismissal_kind)
FROM ipl_players
WHERE dismissal_kind='caught'
GROUP BY fielder
ORDER BY COUNT(dismissal_kind) DESC;

-- team that gave most extras
SELECT bowling_team, SUM(extra_runs)
FROM ipl_players
GROUP BY bowling_team
ORDER BY SUM(extra_runs) DESC;

-- findind the ways a batsman gets dismissed
SELECT dismissal_kind, COUNT(dismissal_kind)
FROM ipl_players
WHERE dismissal_kind<>'NA'
GROUP BY dismissal_kind
ORDER  BY COUNT(dismissal_kind) DESC;
