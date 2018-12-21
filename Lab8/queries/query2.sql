USE universitatea
GO
INSERT INTO dbo.ex1
VALUES 
	('176', 'Robu', 'Maria', '1997-04-12', 'FAF'),
	('178', 'Cojoc', 'Ana', '2000-08-21', 'FAF'),
	('179', 'Crudu', 'Petru', '1994-10-22', 'FAF')
GO
UPDATE dbo.ex1 
SET Adresa_Postala_Student = 'Mun.Chisinau' WHERE Nume_Student = 'Robu';
GO
DELETE FROM dbo.ex1
WHERE Nume_Student = 'Cojoc';