CREATE ASSERTION boekenPerKast
	CHECK (
		SELECT MIN(COUNT(DISTINCT b.auteur))
		FROM Boek b 
		LEFT OUTER JOIN Exemplaar ON e.isbn = b.isbn
		GROUP BY e.kast
		) >= 10; 