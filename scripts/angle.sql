ALTER TABLE public.osm_relief_point ADD COLUMN IF NOT EXISTS angle float;

WITH 
	eps AS (SELECT 0.001 eps)
UPDATE
	public.osm_relief_point P
SET angle=
	degrees(ST_Azimuth(
      ST_StartPoint(ST_LineSubstring(L.geometry, ST_LineLocatePoint(L.geometry, P.geometry)*(1-eps), CASE WHEN ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) = 0 THEN eps WHEN ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) > 1 THEN 1 ELSE ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) END)), 
      ST_EndPoint(ST_LineSubstring(L.geometry, ST_LineLocatePoint(L.geometry, P.geometry)*(1-eps), CASE WHEN ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) = 0 THEN eps WHEN ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) > 1 THEN 1 ELSE ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) END)))
    )-180
FROM
	public.osm_relief_line L
	,eps
WHERE 
	P.mountain_pass = TRUE
	AND ST_DWithin(P.geometry, L.geometry, 0);

	
ALTER TABLE public.osm_water_point ADD COLUMN IF NOT EXISTS angle float;

WITH 
	eps AS (SELECT 0.001 eps)
UPDATE
	public.osm_water_point P
SET angle=
	degrees(ST_Azimuth(
      ST_StartPoint(ST_LineSubstring(L.geometry, ST_LineLocatePoint(L.geometry, P.geometry)*(1-eps), CASE WHEN ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) = 0 THEN eps WHEN ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) > 1 THEN 1 ELSE ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) END)), 
      ST_EndPoint(ST_LineSubstring(L.geometry, ST_LineLocatePoint(L.geometry, P.geometry)*(1-eps), CASE WHEN ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) = 0 THEN eps WHEN ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) > 1 THEN 1 ELSE ST_LineLocatePoint(L.geometry, P.geometry)*(1+eps) END)))
    )-180
FROM
	public.osm_waterway L
	,eps
WHERE 
	(
		P.waterway = 'waterfall'
		OR P.whitewater = 'rapid' OR rapid_name<>'' OR rapid_grade<>''
	)
	AND ST_DWithin(P.geometry, L.geometry, 0);