EXEC sp_addumpdevice 'DISK', 'ex1New', 'C:\Fake\Path\exercitiul1.bak'
GO

BACKUP DATABASE universitatea
TO ex1New WITH FORMAT, NAME = N'universtitatea-Full Database backup';