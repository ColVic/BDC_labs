EXEC sp_addumpdevice 'DISK', 'ex2','D:\Projects\LabDB11\exercitiul2.bak'
GO 
BACKUP DATABASE universitatea
TO ex2 WITH FORMAT, NAME = N'universitatea-Differential Database Backup';
