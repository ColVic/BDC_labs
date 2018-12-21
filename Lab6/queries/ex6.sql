CREATE TABLE orar(
	Id_Grupa INT,
	Id_Disciplina INT,
	Id_Profesor INT,
	Ora VARCHAR(5),
	Auditoriu INT,
	Bloc CHAR,
	Zi VARCHAR(10),
	PRIMARY KEY (Id_Grupa, Id_Disciplina, Id_Profesor)
);

INSERT INTO orarul(Id_Grupa, Id_Disciplina, Id_Profesor, Ora, Auditoriu, Bloc, Zi)
VALUES	(1, 107, 101, '08:00', 202, 'B', 'Luni'),
		(1, 108, 101, '11:30', 501, 'B', 'Luni'),
		(1, 119, 117, '13:00', 501, 'B', 'Luni');