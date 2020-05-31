-- Drop table if exists
DROP TABLE firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

SELECT * FROM firepower;

--Find the rows that have a ReservePersonnel of 0 and remove these rows from the dataset.
SELECT * FROM firepower
WHERE ReservePersonnel = 0;

--Every country in the world at least deserves one FighterAircraft—it only seems fair. 
--Let's add one to each nation that has none.
UPDATE firepower
SET FighterAircraft = 1
WHERE FighterAircraft = 0;


--Oh no! By updating this column, the values within TotalAircraftStrength column are now off for those nations! 
--We need to add 1 to the original number.
UPDATE firepower
SET TotalAircraftStrength = (fighteraircraft + attackaircraft + TotalHelicopterStrength + AttackHelicopters);


--Find the Averages for TotalMilitaryPersonnel, TotalAircraftStrength, TotalHelicopterStrength, 
--and TotalPopulation, and rename the columns with their designated average.
SELECT 
	AVG(TotalMilitaryPersonnel) as avg_TotalMilitaryPersonnel,
	AVG(TotalAircraftStrength) as avg_TotalAircraftStrength, 
	AVG(TotalHelicopterStrength) as avg_TotalHelicopterStrength, 
	AVG(TotalPopulation) as avg_TotalPopulation
FROM firepower;

