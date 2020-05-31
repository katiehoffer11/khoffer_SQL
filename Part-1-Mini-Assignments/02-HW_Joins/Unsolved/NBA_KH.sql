Select * from players;
Select * from seasons_stats;
--Perform joins that will generate the following outputs:
--Basic Information:
SELECT
	id,
	player,
	height,
	weight,
	college,
	born,
	pos as "position",
	tm
FROM players p 
JOIN seasons_stats s ON p.id = s.player_id;

--Percent Stats:
SELECT
	player_id,
	college,
	"Year",
	pos as "position",
	"2P%" as "two_point_percentage",
	"FG%" as "fg_percentage",
	"FT%" as "ft_percentage",
	"TS%" as "ts_percentage"
FROM players p 
JOIN seasons_stats s ON p.id = s.player_id;