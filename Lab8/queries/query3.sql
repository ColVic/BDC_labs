USE universitatea
GO
DROP VIEW IF EXISTS dbo.ex1;
GO
CREATE VIEW dbo.ex1 (Id_Student, Nume_Student, Prenume_Student, Data_Nastere_Student, Adresa_Postala_Student)
			 WITH SCHEMABINDING AS
	SELECT Id_Student, Nume_Student, Prenume_Student, Data_Nastere_Student, Adresa_Postala_Student
	FROM studenti.studenti
	WHERE Nume_Student like '%u'
	WITH CHECK OPTION;
GO
SELECT * FROM dbo.ex1;

USE universitatea
GO
DROP VIEW IF EXISTS dbo.ex2;
GO
CREATE VIEW dbo.ex2 (Disciplina, AvgMark) WITH SCHEMABINDING AS
	SELECT Disciplina, AVG(Nota) AS AvgMark
	FROM plan_studii.discipline AS C, studenti.studenti_reusita AS D
	WHERE C.Id_Disciplina = D.Id_Disciplina and
	Tip_Evaluare = 'Examen'	
	GROUP BY Disciplina
	HAVING AVG(Nota) >7.0
	WITH CHECK OPTION;
GO
SELECT * 
FROM dbo.ex2
ORDER BY Disciplina DESC;