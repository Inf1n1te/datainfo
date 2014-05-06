DROP TABLE IF EXISTS problem1;

CREATE TABLE problem1 (
	task CHAR(1) PRIMARY KEY, result BOOLEAN, motivation VARCHAR(200));
	
INSERT INTO problem1 (task, result, motivation) VALUES 
	('a',FALSE,'voertuig geeft een capaciteit aan, niet andersom'),
	('b',TRUE,'zie 2, C van V'),
	('c',FALSE,'uit F volgen meerdere P''s'),
	('d',TRUE,'uit P volgt F, uit F volgt A'),
	('e',TRUE,'uit P volgt F, uit F volgen O en G'),
	('f',FALSE,'B kan voor meerdere voertuigen gerechtigd zijn'),
	('g',FALSE,'een voertuig kan meerdere bezorgers hebben'),
	('h',TRUE,'B is niet afhankelijk van andere variabelen'),
	('i',TRUE,'C is niet afhankelijk van andere variabelen'),
	('j',FALSE,'B en C zijn beide niet afhankelijk van andere variabelen');