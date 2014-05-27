 CREATE TABLE Bestelling (
	isbn varchar(20),
	aantal integer,
	FOREIGN KEY (isbn) REFERENCES Boek(isbn)
		ON UPDATE CASCADE
		NOT DEFERRABLE
);

CREATE TRIGGER newBookUnknownAuthor AFTER INSERT
	ON Boek b
	NOT DEFERRABLE INITIALLY IMMEDIATE
	FOR EACH ROW
	WHEN NOT EXISTS	(SELECT *
					 FROM Boek b
					 WHERE b.auteur = NEW.auteur
					 AND b.isbn != NEW.isbn)
	EXECUTE PROCEDURE	(INSERT INTO Bestelling (isbn, aantal)
						 VALUES (NEW.isbn, 2))
;