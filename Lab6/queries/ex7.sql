INSERT INTO orar(Id_Grupa, Id_Disciplina, Id_Profesor, Ora, Auditoriu, Bloc, Zi)
VALUES (	
			(SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = 'INF171'),
			(SELECT Id_Disciplina FROM discipline WHERE Disciplina = 'Structuri de date si algoritmi'),
			(SELECT Id_Profesor FROM profesori WHERE Nume_Profesor = 'Bivol' AND Prenume_Profesor = 'Ion'),
			'08:00', 101, 'B', 'Luni' ),
		(
			(SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = 'INF171'),
			(SELECT Id_Disciplina FROM discipline WHERE Disciplina = 'Programe aplicative'),
			(SELECT Id_Profesor FROM profesori WHERE Nume_Profesor = 'Mircea' AND Prenume_Profesor = 'Sorin'),
			'11:30', 101, 'B', 'Luni' ),
		(
			(SELECT Id_Grupa FROM grupe WHERE Cod_Grupa = 'INF171'),
			(SELECT Id_Disciplina FROM discipline WHERE Disciplina = 'Baze de date'),
			(SELECT Id_Profesor FROM profesori WHERE Nume_Profesor = 'Micu' AND Prenume_Profesor = 'Elena'),
			'13:00', 101, 'B', 'Luni' )