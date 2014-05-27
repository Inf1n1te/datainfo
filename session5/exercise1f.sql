CREATE TABLE Boek (
	isbn varchar(20) NOT NULL,
	titel varchar(255) NOT NULL,
	auteur varchar(255) NOT NULL,
	PRIMARY KEY (isbn)
);

CREATE TABLE Exemplaar (
	isbn varchar(20) NOT NULL,
	volgnummer  varchar(255) NOT NULL,
	gewicht /*in gram*/ INTEGER NULL,
	kast varchar(255) NULL,
	PRIMARY KEY (isbn, volgnummer),
	FOREIGN KEY (isbn) REFERENCES Boek(isbn)
		ON UPDATE CASCADE
		INITIALLY IMMEDIATE NOT DEFERRABLE
);

CREATE FUNCTION verwijderalles() 
RETURNS TRIGGER
AS $$ BEGIN
	DELETE FROM Exemplaar WHERE isbn = OLD.isbn;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER verwijderexemplaren AFTER DELETE ON Boek
FOR EACH ROW EXECUTE PROCEDURE verwijderalles();