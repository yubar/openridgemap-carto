CREATE TEMP TABLE IF NOT EXISTS tmp_waterways (
	id serial
	,"name" varchar
	,len float
	,len2 float
	,parent bigint
	,child bigint
);

TRUNCATE TABLE tmp_waterways;

INSERT INTO tmp_waterways ("name", len, len2, parent, child)
SELECT
		L1."name"
		,L1.len
		,L2.len len2
		,L1.osm_id parent
		,L2.osm_id child 
	FROM
		osm_waterway L1
		JOIN osm_waterway L2 ON L1."name" = L2."name" 
			AND L1.feature = L2.feature 
			AND st_endpoint(L1.geometry) = st_startpoint(L2.geometry)
			AND L1.id<>L2.id
			AND L1.osm_id<>L2.osm_id
	WHERE
		L1.name <> ''
		AND L2."name" <> '';

CREATE INDEX IF NOT EXISTS Ix_tmp_waterways_parent ON tmp_waterways(parent, child, len2);

CREATE TABLE IF NOT EXISTS osm_waterway_join(
	id serial
	,"name" varchar
	,len float
	,ids bigint[]
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
	FROM tmp_waterways
	WHERE 
		parent NOT IN (SELECT child FROM tmp_waterways)

	UNION

	SELECT 
		N+1 N
		,r."name"
		,r.len + s.len2 len
		,r.parent
		,s.child
		,r.ids || s.child ids
	FROM rec r
		JOIN tmp_waterways s ON r.child = s.parent
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
	FROM rec
)
INSERT INTO osm_waterway_join("name", len, ids)
SELECT name, len, ids FROM fnl
WHERE N = 1 AND N2 = 1;



CREATE TABLE IF NOT EXISTS osm_waterway_join_member(
	id serial
	,"name" varchar
	,len float
	,osm_id bigint
);

TRUNCATE TABLE osm_waterway_join_member;

INSERT INTO osm_waterway_join_member("name", len, osm_id)
SELECT "name", len, UNNEST(ids) FROM osm_waterway_join;

CREATE INDEX IF NOT EXISTS IX_osm_waterway_join_member_osm_id ON osm_waterway_join_member(osm_id);

DROP TABLE tmp_waterways;


