SELECT p.pid FROM Person p
WHERE EXISTS(
	SELECT DISTINCT * FROM Acts a, Movie m
	WHERE a.pid = p.pid
	AND a.mid = m.mid
	AND m.name = 'Back to the Future'
);