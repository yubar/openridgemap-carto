ALTER TABLE public.osm_ridge_rel ADD COLUMN IF NOT EXISTS len float;

UPDATE public.osm_ridge_rel R SET len = t.len
FROM 
(
	SELECT 
		R.osm_id
		, COUNT(*)
		, ST_Length(
			ST_AsText(ST_Transform(ST_Collect(L.geometry),26915))
		)/1000 AS len
	FROM 
		public.osm_ridge_rel R
		JOIN public.osm_ridge_rel_member RM ON R.osm_id = RM.osm_id
		JOIN public.osm_relief_line L ON RM."member" = L.osm_id
	GROUP BY R.osm_id
) t
WHERE 
	t.osm_id = R.osm_id
	AND R.len IS NULL;


ALTER TABLE public.osm_relief_line ADD COLUMN IF NOT EXISTS len float;

UPDATE public.osm_relief_line 
SET 
	len = ST_Length(
		ST_AsText(ST_Transform(geometry, 26915))
	)/1000
WHERE len IS NULL;
	

ALTER TABLE public.osm_waterway_rel ADD COLUMN IF NOT EXISTS len float;

UPDATE public.osm_waterway_rel R SET len = t.len
FROM 
(
	SELECT 
		R.osm_id
		, ST_Length(
			ST_AsText(ST_Transform(ST_Collect(L.geometry),26915))
		)/1000 AS len
	FROM 
		public.osm_waterway_rel R
		JOIN public.osm_waterway_rel_member RM ON R.osm_id = RM.osm_id
		JOIN public.osm_waterway L ON RM."member" = L.osm_id
	GROUP BY R.osm_id
) t
WHERE 
	t.osm_id = R.osm_id
	AND R.len IS NULL;


ALTER TABLE public.osm_waterway ADD COLUMN IF NOT EXISTS len float;

UPDATE public.osm_waterway 
SET 
	len = ST_Length(
		ST_AsText(ST_Transform(geometry, 26915))
	)/1000
WHERE len IS NULL;
