-- creating a database ipl
CREATE DATABASE ipl;

-- using the database crearted;
USE ipl;

-- creating a table
CREATE TABLE ipl_matches(
    id INT,
    city VARCHAR(255),
    date DATE,
    player_of_match VARCHAR(255),
    venue VARCHAR(255),
    neutral_venue VARCHAR(255),
    team1 VARCHAR(255),
    team2 VARCHAR(255),
    toss_winner VARCHAR(255),
    toss_decision VARCHAR(255),
    winner VARCHAR(255),
    result VARCHAR(255),
    result_margin INT,
    eliminator VARCHAR(255),
    method VARCHAR(255),
    umpire1 VARCHAR(255),
    umpire2 VARCHAR(255)
);

SELECT *
FROM ipl_matches;

-- doing data analysis with the data from 2008-present
-- player with most man of matches
SELECT player_of_match, COUNT(player_of_match)
FROM ipl_matches
GROUP BY player_of_match
ORDER BY COUNT(player_of_match) DESC
LIMIT 10;

-- team with most wins
SELECT winner, COUNT(winner)
FROM ipl_matches
GROUP BY winner
ORDER BY COUNT(winner) DESC
LIMIT 10;

-- VENUE THAT HOSTED MOST MATCHES
SELECT venue, COUNT(venue)
FROM ipl_matches
GROUP BY venue
ORDER BY COUNT(venue) DESC
LIMIT 20;

-- chasing or defending
SELECT result, COUNT(result)
FROM ipl_matches
WHERE result NOT IN('tie','NA')
GROUP BY result
ORDER BY COUNT(result) DESC;
-- We can see that teams which are chasing tends to win more

-- umpire who umpired for most matches
SELECT umpire1, COUNT(umpire2)+COUNT(umpire1) AS umpire_count
FROM ipl_matches
GROUP BY umpire1
ORDER BY umpire_count DESC
LIMIT 20;

-- finding the match won with biggest margin (chasing)
SELECT result_margin,team1, team2, winner
FROM ipl_matches
WHERE result<>'wickets'
ORDER BY result_margin DESC
LIMIT 10;

-- -- finding the match won with biggest margin (defending)
SELECT result_margin,team1, team2, winner
FROM ipl_matches
WHERE result<>'runs'
ORDER BY result_margin DESC
LIMIT 10;

