DROP TABLE IF EXISTS task6;
GO
CREATE TABLE task6 (
	ID INT PRIMARY KEY,
	Dependent_ID INT REFERENCES TASK6);

INSERT INTO task6
VALUES
(5 ,0),
(1, 0),
(2, 1),
(4, 2),
(3 ,2),
(0, null);

WITH TRAVERSE (ID, startp, depth) AS
(SELECT ID, cast(null as int) as startp, 0 FROM task6
	WHERE Dependent_ID IS NULL
	UNION ALL
	SELECT task6.ID, Dependent_ID as startp,TRAVERSE.depth + 1  FROM task6
	INNER JOIN TRAVERSE
	ON task6.Dependent_ID = TRAVERSE.ID)

SELECT * FROM TRAVERSE
ORDER BY depth ASC;