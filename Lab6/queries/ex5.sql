CREATE TABLE profesori_new (
	Id_Profesor INT,
	Nume_Profesor VARCHAR(60) NOT NULL,
	Prenume_Profesor VARCHAR(60) NOT NULL,
	Localitate VARCHAR(255) DEFAULT('mun.Chisinau'),
	Adresa_1 VARCHAR(255),
	Adresa_2 VARCHAR(255),
	PRIMARY KEY CLUSTERED(Id_Profesor))

INSERT INTO profesori_new(Id_Profesor, Nume_Profesor, Prenume_Profesor, Localitate, Adresa_1, Adresa_2)
SELECT Id_Profesor, 
	   Nume_Profesor, 
	   Prenume_Profesor,
	   
	   CASE
			WHEN CHARINDEX(', ', Adresa_Postala_Profesor) > 0
				THEN SUBSTRING(Adresa_Postala_Profesor, 1, CHARINDEX(', ', Adresa_Postala_Profesor) -1)
				ELSE SUBSTRING(Adresa_Postala_Profesor, 1, LEN(Adresa_Postala_Profesor))
	   END Localitate, 
	   
	   CASE 
			WHEN CHARINDEX(', str.', Adresa_Postala_Profesor) > 0
				THEN SUBSTRING(Adresa_Postala_Profesor, 
							   CHARINDEX('str.', Adresa_Postala_Profesor), 
							   CHARINDEX(',', SUBSTRING(Adresa_Postala_Profesor, CHARINDEX('str.', Adresa_Postala_Profesor), 123)) - 1)
			WHEN CHARINDEX(', bd.', Adresa_Postala_Profesor) > 0
				THEN SUBSTRING(Adresa_Postala_Profesor, 
							   CHARINDEX('bd.', Adresa_Postala_Profesor), 
							   CHARINDEX(',', SUBSTRING(Adresa_Postala_Profesor, CHARINDEX('bd.', Adresa_Postala_Profesor), 123)) - 1)
	   END Adresa_1,

	   CASE 
			WHEN CHARINDEX(', str.', Adresa_Postala_Profesor) > 0 OR CHARINDEX(', bd.', Adresa_Postala_Profesor) > 0
				THEN SUBSTRING(Adresa_Postala_Profesor, PATINDEX('%[0-9]%', Adresa_Postala_Profesor), 12)
	   END Adresa_2
				
FROM dbo.profesori

