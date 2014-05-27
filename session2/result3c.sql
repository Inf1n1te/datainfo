SELECT p.name
FROM Person p
JOIN Writes w ON p.pid = w.pid
JOIN Movie m ON w.mid = m.mid
JOIN Directs d ON m.mid = d.mid
WHERE d.pid = NULL;