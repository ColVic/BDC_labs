DROP PROCEDURE IF EXISTS TASK4;
GO

CREATE PROCEDURE TASK4
	@OLDNAME VARCHAR(50),
	@OLDSURNAME VARCHAR(50),
	@NEWNAME VARCHAR(50),
	@NEWSURNAME VARCHAR(50),
	@SUBJECT VARCHAR(255),
	@ID_TOLD INT = NULL,
	@ID_TNEW INT = NULL,
	@ID_SUB INT = NULL

AS
	DECLARE @ERR_MESSAGE NVARCHAR(255)
	SET @ID_TOLD = (SELECT Id_Profesor
					FROM cadre_didactice.profesori
					WHERE Nume_Profesor = @OLDNAME
						AND Prenume_Profesor =@OLDSURNAME)
	
	SET @ID_TNEW = (SELECT Id_Profesor
					FROM cadre_didactice.profesori
					WHERE Nume_Profesor = @NEWNAME
						AND Prenume_Profesor =@NEWSURNAME)

	SET @ID_SUB = (SELECT Id_Disciplina
					FROM plan_studii.discipline
					WHERE Disciplina=@SUBJECT)

	
	IF @ID_TOLD IS NULL OR @ID_TNEW IS NULL OR @ID_SUB IS NULL
		BEGIN
			SET @ERR_MESSAGE = 'Missing ore or more IDs'
			RAISERROR(@ERR_MESSAGE, 10 ,1)
		END
	ELSE
		BEGIN
			UPDATE studenti.studenti_reusita SET Id_Profesor = @ID_TNEW 
				WHERE Id_Profesor = @ID_TOLD and Id_Disciplina = @ID_SUB;
				SELECT * FROM studenti.studenti_reusita WHERE Id_Profesor = @ID_TOLD
				SELECT * FROM studenti.studenti_reusita WHERE Id_Profesor = @ID_TNEW
		END
GO

EXECUTE TASK4 
	@OLDNAME = 'Popescu',
	@OLDSURNAME = 'Gabriel',
	@NEWNAME = 'Bivol',
	@NEWSURNAME = 'Ion',
	@SUBJECT = 'Sisteme de operare'