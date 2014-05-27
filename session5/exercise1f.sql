 CREATE TABLE Boek (
	isbn varchar(20) NOT NULL,
	titel varchar(255) NOT NULL,
	auteur varchar(255) NOT NULL,
	PRIMARY KEY (isbn),
);

CREATE TABLE Exemplaar (
	isbn varchar(20) REFERENCES Boek(isbn),
	volgnummer  varchar(255) NOT NULL,
	gewicht /*in gram*/ double NULL,
	kast varchar(255) NULL,
	PRIMARY KEY (isbn, volgnummer),
	FOREIGN KEY (isbn) REFERENCES Boek(isbn)
		ON UPDATE CASCADE
		NOT DEFERRABLE
);

CREATE TRIGGER isbnDeleteCascade AFTER DELETE
	ON Boek b
	DEFERRABLE INITIALLY IMMEDIATE
	FOR EACH ROW
	EXECUTE PROCEDURE  (DELETE *
						FROM Exemplaar e
						WHERE b.isbn = e.isbn)
;