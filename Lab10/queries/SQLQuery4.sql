CREATE TRIGGER fourth_trigger
ON DATABASE
FOR ALTER_TABLE
AS 
BEGIN
   	DECLARE @MODCOLUMN VARCHAR(max);
   	SET @MODCOLUMN = (SELECT EVENTDATA().value('(/EVENT_INSTANCE/AlterTableActionList/Alter/Columns/Name)[1]','varchar(max)'));
   	IF @MODCOLUMN = 'Id_Disciplina'
   		BEGIN
   			PRINT ('NO RIGHT TO CHANGE ID_DISCIPLINA COLUMN')
   			ROLLBACK;
   		END
END;