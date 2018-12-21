DROP PROCEDURE IF EXISTS TASK5;
GO

CREATE PROCEDURE TASK5
	@SUBJECT VARCHAR(255),
	@OLDMARK INT = NULL,
	@ID_SUB INT = NULL

AS
	SET @ID_SUB = (SELECT Id_Disciplina
					FROM plan_studii.discipline
					WHERE Disciplina = @SUBJECT)
	
BEGIN 
	UPDATE studenti.studenti_reusita SET Nota = Nota + 1 
	WHERE Nota < 10 AND Tip_Evaluare = 'Examen'
	AND Id_Student IN (SELECT TOP 3 Id_Student 
						FROM studenti.studenti_reusita
						WHERE Id_Disciplina = @ID_SUB 
						GROUP BY Id_Student
						ORDER BY AVG(CAST(Nota AS DECIMAL(4,2))) DESC)
	
	SELECT Id_Grupa AS Cod_Grup, Nume_Student, Prenume_Student, Disciplina, (Nota -1) AS Nota_Veche, Nota as Nota_Noua
	FROM (studenti.studenti_reusita A join studenti.studenti B ON A.Id_Student = B.Id_Student ) 
				JOIN plan_studii.discipline C ON A.Id_Disciplina = C.Id_Disciplina
	WHERE A.Id_Disciplina IN (SELECT Id_Disciplina FROM  plan_studii.discipline WHERE Disciplina = @SUBJECT)
			AND Tip_Evaluare = 'Examen'
			AND A.Id_Student IN (SELECT TOP 3 Id_Student 
								FROM studenti.studenti_reusita
								WHERE Id_Disciplina = @ID_SUB 
								GROUP BY Id_Student
								ORDER BY AVG(CAST(Nota AS DECIMAL(4,2))) DESC) 
	
	ORDER BY Nume_Student
END
GO
EXECUTE TASK5 @SUBJECT ='Programarea aplicatiilor Windows'