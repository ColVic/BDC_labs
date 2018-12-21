IF EXISTS (SELECT * FROM master.sys.BCD_Labs WHERE name='universitatea_lab11')
DROP DATABASE universitatea_lab11;
GO
  RESTORE DATABASE universitatea_lab11
  FROM DISK = 'C:\Fake\Path\exercitiul1.bak'
  WITH MOVE 'universitatea' TO 'C:\Fake\Path\data.mdf',
  MOVE 'universitatea_log' TO 'C:\Fake\Path\log.ldf',
  NORECOVERY
GO
  RESTORE LOG universitatea_lab11
  FROM DISK = 'C:\Fake\Path\exercitiul3.bak'
  WITH NORECOVERY
GO
RESTORE DATABASE universitatea_lab11
  FROM DISK = 'C:\Fake\Path\exercitiul2.bak'
  WITH
  NORECOVERY;