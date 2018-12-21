DROP TRIGGER IF EXISTS second_trigger;
GO

CREATE TRIGGER  second_trigger ON studenti.studenti
INSTEAD OF INSERT 
AS 
	BEGIN
		DECLARE @IDST INT;
		DECLARE @NAME VARCHAR(50) ;
		DECLARE @SURNAME VARCHAR(50) ;
		DECLARE @DATE DATE;
		DECLARE @ADDRESS VARCHAR(500);
		IF EXISTS (SELECT 1 FROM inserted)
			BEGIN
			SELECT @IDST = Id_Student FROM inserted
			SELECT @NAME = Nume_Student FROM inserted
			SELECT @SURNAME = Prenume_Student FROM inserted
			SELECT @DATE = Data_Nastere_Student FROM inserted
			SELECT @ADDRESS = Adresa_Postala_Student FROM inserted
		
			IF EXISTS(SELECT Id_Student FROM studenti.studenti WHERE Id_Student = @IDST)
			BEGIN
				PRINT('THIS STUDENT ALREADY WAS ENTERED INTO STUDENTI TABLE')
				END
			ELSE

			INSERT INTO studenti.studenti (Id_Student, Nume_Student,Prenume_Student,Data_Nastere_Student,Adresa_Postala_Student)
			VALUES (@IDST,@NAME,@SURNAME,@DATE,@ADDRESS)
			IF EXISTS (SELECT 1 FROM inserted)
				BEGIN
				
				INSERT INTO studenti.studenti_reusita(Id_Student,Id_Disciplina,Id_Profesor,Id_Grupa,Tip_Evaluare,Nota,Data_Evaluare)
				VALUES (@IDST,105,110,1,N'EXAMEN', NULL,NULL)
				PRINT('NEW STUDENT ADDED TO STUNDETI_REUSITA')
				END
				ELSE
				BEGIN
					PRINT ('ERROR ON FOREIGN KEYS')
				END
				PRINT('NEW STUDENT ADDED IN STUDENTI')
			END
		ELSE
			PRINT ('ERROR - CHECK INPUT')
	END