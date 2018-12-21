UPDATE dbo.profesori 
	SET Adresa_Postala_Profesor = 'mun.Chisinau'
	WHERE Adresa_Postala_Profesor IS NULL;