UPDATE public.osm_ridge_rel R SET len = NULL
FROM 
(
	SELECT R.osm_id 
	FROM 
		public.osm_ridge_rel R
		JOIN public.osm_ridge_rel_member RM ON R.osm_id = RM.osm_id
		JOIN public.osm_relief_line L ON RM."member" = L.osm_id
	WHERE L.len IS NULL
) t
WHERE 
	t.osm_id = R.osm_id
	AND R.len IS NOT NULL;

UPDATE public.osm_waterway_rel R SET len = NULL
FROM 
(
	SELECT R.osm_id 
	FROM 
		public.osm_waterway_rel R
		JOIN public.osm_waterway_rel_member RM ON R.osm_id = RM.osm_id
		JOIN public.osm_waterway L ON RM."member" = L.osm_id
	WHERE L.len IS NULL
) t
WHERE 
	t.osm_id = R.osm_id
	AND R.len IS NOT NULL;


