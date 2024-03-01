CREATE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) RETURNS SETOF INTEGER AS
$$
 WITH RECURSIVE r AS (
  SELECT 0 AS x, 1 AS y
    
  UNION ALL 
    
  SELECT y AS x, r.x + r.y AS y 
     FROM r
     WHERE y < pstop
 )
SELECT x FROM r;
$$ LANGUAGE SQL;

-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();