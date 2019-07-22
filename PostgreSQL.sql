
-- Postgre SQL
PREPARE insertData (int) AS
INSERT INTO t SELECT
	CAST(5 * random() AS INT) AS pA,  
	CAST(5 * random() AS INT) AS pB,  
	CAST(100 * random() AS INT) AS sA,  
	CAST(100 * random() AS INT) AS sB  
FROM generate_series(1, $1);


SELECT pA, pB, sA, sB,
  CASE
	WHEN pA = pB THEN sA + sB
	WHEN pA > pB THEN sA
	ELSE sB
  END AS bS
FROM t
