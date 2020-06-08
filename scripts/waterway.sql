 DROP TABLE IF EXISTS public.osm_waterway_named;
 CREATE TABLE IF NOT EXISTS public.osm_waterway_named(
	id serial NOT NULL,
	osm_id int8 NOT NULL,
	feature varchar NULL,
	"name" varchar NULL,
	len float8 NULL,
	geometry geometry NULL,
	startp geometry NULL,
	endp geometry NULL,
	CONSTRAINT osm_waterway_named_pkey PRIMARY KEY (osm_id, id)
);

INSERT INTO public.osm_waterway_named(
	osm_id,
	feature,
	"name",
	len,
	geometry,
	startp,
	endp
)
SELECT 
	osm_id,
	feature,
	COALESCE(NULLIF(name_ru,''), "name") "name",
	len,
	geometry,
	st_startpoint(geometry) startp,
	st_endpoint(geometry) endp
FROM
	osm_waterway
WHERE 
	COALESCE(NULLIF(name_ru,''), "name") <> '';

CREATE INDEX IF NOT EXISTS osm_waterway_named_geom ON public.osm_waterway_named USING gist (geometry);

CREATE INDEX IF NOT EXISTS osm_waterway_named_name ON public.osm_waterway_named(name);

CREATE INDEX IF NOT EXISTS osm_waterway_named_start ON public.osm_waterway_named(startp);


CREATE TEMP TABLE IF NOT EXISTS tmp_waterways (
	id serial
	,"name" varchar
	,len float
	,len2 float
	,parent bigint
	,child bigint
	,startpoint geometry
	,endpoint geometry
);
TRUNCATE TABLE tmp_waterways;
DROP INDEX IF EXISTS Ix_tmp_waterways_parent;

INSERT INTO tmp_waterways ("name", len, len2, parent, child, startpoint, endpoint)
SELECT
	L2."name"
	,L1.len
	,L2.len len2
	,L1.osm_id parent
	,L2.osm_id child 
	,L1.startp
	,L2.endp
FROM
	osm_waterway_named L1
	JOIN osm_waterway_named L2 
		ON L1.feature = L2.feature 
		
		AND L1.id <> L2.id
		AND L1.osm_id <> L2.osm_id
		
		AND (
			(
				L1."name" = L2."name"
				AND (
					L1.endp = L2.startp
					OR (
						st_touches(L1.endp, L2.geometry)
						AND st_touches(L2.startp, L1.geometry)
						AND NOT L1.startp = L2.startp
					)
				)
				AND NOT EXISTS(
					SELECT * 
					FROM osm_waterway_named L4
					WHERE
						L4.startp = L2.startp
						AND L4.endp = L2.endp
						AND L4.len < L2.len
				)
				AND NOT EXISTS(
					SELECT * 
					FROM osm_waterway_named L5
					WHERE
						L5.startp = L1.startp
						AND L5.endp = L1.endp
						AND L5.len < L1.len
				)
			)
			OR (
				L1.endp = L2.startp
				AND NOT EXISTS(
					SELECT * 
					FROM osm_waterway_named L3
					WHERE
						L3."name" = L2."name"
						AND L3.endp = L2.startp
				)
			)
		);

CREATE INDEX IF NOT EXISTS Ix_tmp_waterways_parent ON tmp_waterways(parent, child, len2);

DROP TABLE IF EXISTS osm_waterway_join;

CREATE TABLE IF NOT EXISTS osm_waterway_join(
	id serial
	,"name" varchar
	,len float
	,ids bigint[]
	,startpoint geometry
	,endpoint geometry
);

TRUNCATE TABLE osm_waterway_join;

WITH RECURSIVE rec AS (
	SELECT 
		2 N
		,"name"
		,len + len2 len
		,parent
		,child
		,ARRAY[]::bigint[] || parent || child ids
		,startpoint
		,endpoint
	FROM tmp_waterways
	WHERE 
		parent NOT IN (SELECT child FROM tmp_waterways)
	UNION

	SELECT 
		N+1 N
		,s."name"
		,r.len + s.len2 len
		,r.parent
		,s.child
		,r.ids || s.child ids
		,r.startpoint
		,s.endpoint
	FROM rec r
		JOIN tmp_waterways s ON r.child = s.parent  AND n<400
)
, fnl AS (
	SELECT
		ROW_NUMBER() OVER(PARTITION BY parent ORDER BY len desc) N
		,ROW_NUMBER() OVER(PARTITION BY child ORDER BY len desc) N2
		,parent
		,child
		,"name"
		,len
		,ids
		,startpoint
		,endpoint
	FROM rec
)

INSERT INTO osm_waterway_join("name", len, ids, startpoint, endpoint)
SELECT name, len, ids, startpoint, endpoint FROM fnl
WHERE N = 1 AND N2 = 1;


CREATE TABLE IF NOT EXISTS osm_waterway_join_member(
	id serial
	,"name" varchar
	,len float
	,osm_id bigint
	,jid int
	,CONSTRAINT osm_waterway_join_member_pkey PRIMARY KEY (osm_id, id)
);

TRUNCATE TABLE osm_waterway_join_member;

INSERT INTO osm_waterway_join_member("name", len, osm_id, jid)
SELECT "name", len, UNNEST(ids), id FROM osm_waterway_join;




