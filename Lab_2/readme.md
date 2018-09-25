# Laboratory Work Nr. 2

## Creation and maintenance of Database

### Objectives:
1. Creati o baza de date plasata fizic in mapa **MyDocuments\Data**, fixind o crestere a bazei de 16MB cu limita de crestere de 128 MB si a log-ului de 64 MB cu limita de crestere 1024 MB. Pentru fisierele secundare sa se defineasca un Filegroup nou implicit, setand cresterea fisierelor secundare de 64 MB cu limita de 1024 MB.

2. Creati o baza de date unde fisierul log sa fie fizic plasat in mapa **MyDocuments\Log**, numele fisierului log in mediul sistemului de operare treb sa se deosebeasca de cel logic definit in schema fizica. Este improtant ca baza creata sa fie compatibila cu sistemul MS SQL Server 2017 si ea sa fie accesibila numai unui singur utilizator intr-un moment de timp.

3. Creati planul de intretinere a bazei de date, construita in sarcina 1. Spatiul neutilizat de fisierele bazei de date trebuie indreptat atunci cand el atinge marimea 2000Mb. Spatiul eliberat trebuie sa fie returnat sistemului de operate. Aceasta operatiune trebuie sa ruleze in fiecare vineri, la ora 00:00. Raportul executarii planului de intretinere trebuie salvat in dosarul **MyDocuments\SQL_event_logs**. Initializati executarea planului. DUpa executare, verificati rezultatele in fisierul log.

4. Creati planul de intretinere a bazei de date, contstuite in exercitiul 2. Numele planului va fi: "Reconstruire index". In cadrul acestui plan, sistemul trebuie sa realizeze reconstruirea index-ilor numai asuprea tabelelor de baza (exclusiv viziunilor) din toate schemele care exista in baza de date si in cauza. Spatiul liber pe pagina trebuie sa urmeze colectarea statisticilor complete despre indecsii reconstruiti. AL treilea pas al planului trebuie sa constituie sarcina de stergere a istoriei despre operatiile de Backup-Restore ce au avut loc pe SQL Server. Trebuie sters istoricul care este mai vechi de 6 saptamani. Acest plan treb executat in fiecare prima duminica a lunii. Creati dosarul **MyDocuments\SQL_reports**. Raportul de executare a planului trebuie sa fie adaugat in acest fisier. Procesul de mantenanta - sa fie logat in mod extended. Initializati executarea planului. Dupa executare, verificati rezultatele in fisierul log generat.

### Tasks:

1. ![Screen Shot 2018-09-18 at 11.10.28.png](images/task1.png =949x624)

2. ![Screen Shot 2018-09-25 at 12.30.12.png](images/task2.png =691x626)

3. ![Screen Shot 2018-09-25 at 12.31.39.png](images/task3.png =1390x471)

4. ![Screen Shot 2018-09-25 at 12.32.07.png](images/task4.png =1391x675)