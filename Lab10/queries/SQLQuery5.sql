DROP TRIGGER IF EXISTS the_fifth ON DATABASE
GO

CREATE TRIGGER the_fifth ON DATABASE
FOR ALTER_TABLE
AS

IF (DATEPART(HOUR, GETDATE()) NOT BETWEEN 7 and 17)AND (DATEPART(DAY, GETDATE()) NOT IN (1,5))
BEGIN 
   PRINT('NOW IS NON-WORKINT TIME')
   ROLLBACK
END