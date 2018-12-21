# Laboratory work nr. 6
-----
## Topic : *Creating Tables and Indexes*
### Author : *Colta Victor*
-----
## Objectives :
1. Get familiar with the instructions for creation and management of tables;
2. Sudy the concepts of creating and maintaning indexes;

## Course of the work :
### Quiz :

1. Basic syntax of CREATE TABLE :
   ```
   CREATE TABLE name_of_table (
      column1 data_type1 [DEFAULT expression1] [constraints_column1],
      column2 data_type2 [DEFAULT expression2] [constraints_column2],
      ...
      [constraints_table] );
   ```

2. Basic syntax of ALTER TABLE :
   ```
   ALTER TABLE name_of_table ACTION description
   ```
   , where ACTION is ADD, ALTER or DROP and description is a command associated to the ACTION

3. Basic syntax of INSERT :
   ```
   INSERT [INTO] name_of_table (columnl , column2 ... )
      VALUES (expressionl, expression2 ... );
   ```

4. Basic syntax of DELETE :
   ```
   DELETE [FROM] name_of_table
   WHERE criteria;
   ```

5. Basic syntax of UPDATE :
   ```
   UPDATE name_of_table
      SET columnl = expressionl ,
          column2 = expression2 ,
          ...
   WHERE criteria;
   ```

6. DELETE instruction is safer, but slower than TRUNCATE, because second deletes the table and recreates it. In case of DELETE the deleted lines can be restored.

7. Types of indexes in SQL Server 2017 :

   * Clustered;
   * Non-Clustered;
   * Covering;
   * Unique;
   * Indexed views;
   * Spatial;
   * Filtered;
   * Full-text;
   * Primary/Secondary XML;
   * Columnstore;

8. CREATE INDEX Creates a relational index on a table or view. Also called a rowstore index because it is either a clustered or nonclustered B-tree index. Syntax :
   ```
   CREATE [ UNIQUE ] [ CLUSTERED | NONCLUSTERED ] INDEX index_name
    ON <object> ( column [ ASC | DESC ] [ ,...n ] )
    [ INCLUDE ( column_name [ ,...n ] ) ]
    [ WHERE <filter_predicate> ]
    [ WITH ( <relational_index_option> [ ,...n ] ) ]
    [ ON { partition_scheme_name ( column_name )
         | filegroup_name
         | default
         }
    ]
   ```

### Practical Assignments :
1.
   ```
   UPDATE dbo.profesori
	SET Adresa_Postala_Profesor = 'mun.Chisinau'
	WHERE Adresa_Postala_Profesor IS NULL;
   ```

2.
   ```
   ALTER TABLE dbo.grupe
	   ALTER COLUMN Cod_Grupa CHAR(6) NOT NULL;

   ALTER TABLE dbo.grupe
	   ADD CONSTRAINT UNQ_Cod_Grupa UNIQUE(Cod_Grupa);

   ALTER TABLE dbo.grupe
	   ADD CONSTRAINT PK_Id_Grupa PRIMARY KEY(Id_Grupa);
   ```

3. Add columns :
   ```
   ALTER TABLE dbo.grupe ADD Sef_grupa INT, Prof_Indrumator INT;
   ```

   Update new columns :
   ```
   UPDATE dbo.grupe
	SET Sef_grupa = ( SELECT TOP 1 Id_Student
					      FROM dbo.studenti_reusita SR
					      WHERE dbo.grupe.Id_Grupa = SR.Id_Grupa
					      GROUP BY Id_Student
					      ORDER BY AVG(CONVERT(FLOAT, Nota)) DESC),
		 Prof_Indrumator = ( SELECT TOP 1 Id_Profesor
							      FROM dbo.studenti_reusita SR
							      WHERE dbo.grupe.Id_Grupa = SR.Id_Grupa
							      GROUP BY Id_Profesor
							      ORDER BY COUNT(Id_Disciplina) DESC, Id_Profesor);
   ```

4.
   ```
   UPDATE dbo.studenti_reusita
	SET Nota = Nota + 1 WHERE Nota != 10 AND Id_Student IN (SELECT Sef_grupa FROM dbo.grupe);
   ```

5. See queries/ex5.sql

6. See queries/ex6.sql

7. See queries/ex7.sql

### Conclusions

In T-SQL we have special instructions for creating, updating, deleting and modifying the tables.

Indexes are structures in form of Balanced Binary Trees which make the access to table records easier and more efficient. Depending on what we want to do and how we want to access the table there are different types of indexes.
