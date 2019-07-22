-- Google BigQuery

INSERT INTO `myproject.t` 
SELECT ARRAY((SELECT CAST(FLOOR(  5 * RAND()) AS INT64) FROM UNNEST(temp))) AS price,
       ARRAY((SELECT CAST(FLOOR(100 * RAND()) AS INT64) FROM UNNEST(temp))) AS size
FROM (
    SELECT *, GENERATE_ARRAY(1, rowLength) AS temp FROM (
        SELECT CAST(1 + FLOOR(@M * RAND()) AS INT64) AS rowLength 
        FROM UNNEST(GENERATE_ARRAY(1, @N))));


WITH t_ext AS (
  SELECT *, (SELECT MAX(p) FROM UNNEST(price) as p) AS bestPrice
  FROM `myproject.t`)
SELECT *, 
  (SELECT SUM(s)
    FROM UNNEST(price) AS p WITH OFFSET
    JOIN UNNEST(size) AS s WITH OFFSET
    USING(OFFSET) 
    WHERE p = bestPrice
  ) AS bS
FROM t_ext        