EXEC sp_addumpdevice 'DISK', 'backup_Log', 'C:\Fake\Path\exercitiul3.bak'
GO
BACKUP LOG universitatea TO backup_Log;