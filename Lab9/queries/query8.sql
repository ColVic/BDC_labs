DROP FUNCTION IF EXISTS TASK8;
GO
CREATE FUNCTION TASK8 (@NAME VARCHAR(50))
RETURNS INT
  BEGIN
  	DECLARE @MARK INT;
  	SELECT @MARK = Nota
  	FROM studenti.studenti_reusita A JOIN studenti.studenti B
  			ON A.Id_Student = B.Id_Student
  	WHERE Nume_Student = @NAME
  	RETURN @MARK
  END
GO

SELECT Nume_Student, Prenume_Student, Disciplina, dbo.TASK8(Nume_Student) as Nota, Data_Evaluare
FROM (studenti.studenti_reusita A JOIN studenti.studenti B 
  	ON A.Id_Student = B.Id_Student) JOIN plan_studii.discipline C ON
  	A.Id_Disciplina = C.Id_Disciplina
GO