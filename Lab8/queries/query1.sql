USE universitatea
GO
DROP VIEW IF EXISTS dbo.ex1;
GO
CREATE VIEW ex1 AS
	SELECT *
	FROM studenti.studenti
	WHERE Nume_Student like '%u';
GO
SELECT * FROM ex1;

USE universitatea
GO
DROP VIEW IF EXISTS dbo.ex2;
GO
CREATE VIEW ex2 AS
	SELECT Disciplina, AVG(Nota) AS AvgMark
	FROM plan_studii.discipline AS C, studenti.studenti_reusita AS D
	WHERE C.Id_Disciplina = D.Id_Disciplina and
	Tip_Evaluare = 'Examen'
	GROUP BY Disciplina
	HAVING AVG(Nota) >7.0;
GO
SELECT * 
FROM ex2
ORDER BY Disciplina DESC;