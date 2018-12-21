DROP TRIGGER IF EXISTS dritte_trigger;
GO

CREATE TRIGGER dritte_trigger ON studenti.studenti_reusita
FOR UPDATE 
AS
BEGIN
   	DECLARE @ID INT;
   	SELECT @ID = (SELECT Id_Student FROM inserted)
   		IF UPDATE(Nota)
   			BEGIN
   				IF EXISTS(SELECT Id_Student FROM studenti.studenti_reusita a JOIN grupe b ON a.Id_Grupa = b.Id_Grupa WHERE Cod_Grupa = 'CIB171' and Id_Student = @ID)
   				BEGIN
   					IF EXISTS(SELECT * FROM studenti.studenti_reusita s INNER JOIN inserted i ON s.Id_Disciplina = i.Id_Disciplina
   								INNER JOIN deleted d ON i.Id_Disciplina = d.Id_Disciplina
   							 WHERE s.Nota<>i.Nota and d.Nota<>i.Nota and i.Nota < d.Nota )
   							 BEGIN
   								 PRINT('RESTRICTION TO DECREASE MARK')
   								 ROLLBACK TRANSACTION	 
   							 END
   				END
   			END
   		IF UPDATE(Data_Evaluare)
   			BEGIN
   			IF EXISTS(SELECT Id_Student FROM studenti.studenti_reusita a JOIN grupe b ON a.Id_Grupa = b.Id_Grupa WHERE Cod_Grupa = 'CIB171' and Id_Student = @ID )
   				BEGIN
   				IF EXISTS(SELECT * FROM studenti.studenti_reusita s INNER JOIN inserted i ON s.Id_Disciplina = i.Id_Disciplina
   							INNER JOIN deleted d ON i.Id_Disciplina = d.Id_Disciplina
   						 WHERE s.Data_Evaluare<>i.Data_Evaluare and  d.Data_Evaluare<>i.Data_Evaluare and d.Data_Evaluare IS NOT NULL)
   						BEGIN
   							PRINT('RESTRICTION TO CHANGE DATE IS INSERTED ONCE')
   							ROLLBACK TRANSACTION	
   						END	
   				END	 
   			END
   END 