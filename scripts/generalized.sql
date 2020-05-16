
CREATE TABLE IF NOT EXISTS public.osm_waterway_gen (
	id serial NOT NULL,
	osm_id int8 NOT NULL,
	feature varchar NULL,
	"name" varchar NULL,
	geometry geometry NULL,
	len float8 NULL,
	CONSTRAINT osm_waterway_gen_pkey PRIMARY KEY (osm_id, id)
);

TRUNCATE TABLE public.osm_waterway_gen;

INSERT INTO public.osm_waterway_gen(osm_id, feature, "name", geometry, len)
SELECT 
   L.osm_id
  ,feature
  ,COALESCE(NULLIF(L.name_ru,''), NULLIF(L."name", ''), NULLIF(R.name_ru,''), NULLIF(R."name", ''), JM."name")
  ,ST_ChaikinSmoothing(ST_Simplify(L.geometry, 2000), 4, true)
  ,COALESCE(R.len, JM.len, L.len) AS len
FROM
  public.osm_waterway L
  LEFT JOIN public.osm_waterway_rel_member RM ON L.osm_id = RM."member"
  LEFT JOIN public.osm_waterway_rel R ON RM.osm_id = R.osm_id
  LEFT JOIN public.osm_waterway_join_member JM ON L.osm_id = JM.osm_id
WHERE
	COALESCE(R.len, JM.len, L.len) > 250;

CREATE INDEX  IF NOT EXISTS osm_waterway_gen_geom ON public.osm_waterway_gen USING gist (geometry);
CREATE INDEX  IF NOT EXISTS osm_waterway_gen_geom_geohash ON public.osm_waterway_gen USING btree (st_geohash(st_transform(st_setsrid((box2d(geometry))::geometry, 3857), 4326)));
 