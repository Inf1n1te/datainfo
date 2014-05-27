CREATE TABLE Bestelling(
	isbn INT,
	aantal INT,
	FOREIGN KEY (isbn) REFERENCES Boek(isbn) ON UPDATE cascade ON DELETE cascade
);


CREATE FUNCTION voegbestellingtoe() 
RETURNS TRIGGER
AS $$ BEGIN
	IF( 1 = (SELECT COUNT(auteur) FROM Boek WHERE NEW.auteur = boek.auteur)) THEN
	INSERT INTO Bestelling(isbn, aantal)
	VALUES(NEW.isbn, 0);
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER voegbestellingentoe AFTER INSERT ON Boek
FOR EACH ROW EXECUTE PROCEDURE voegbestellingtoe();