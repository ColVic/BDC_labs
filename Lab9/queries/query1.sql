DROP PROCEDURE IF EXISTS Task1;
GO
CREATE PROCEDURE Task1
	@Sufix Varchar(255) = '%u'
AS
	SELECT * 
	FROM studenti.studenti
	WHERE Nume_Student LIKE @Sufix

EXECUTE Task1;

DROP PROCEDURE IF EXISTS TASK2;
GO
CREATE PROCEDURE TASK2
	@Test Varchar(255)= 'EXAMEN',
	@Mark FLOAT = '7.0'
AS
	SELECT Disciplina, AVG(Nota) AS AvgMark
	FROM plan_studii.discipline AS C, studenti.studenti_reusita AS D
	WHERE C.Id_Disciplina = D.Id_Disciplina and
	Tip_Evaluare = @Test
	GROUP BY Disciplina
	HAVING AVG(Nota) > @Mark

EXECUTE TASK2;