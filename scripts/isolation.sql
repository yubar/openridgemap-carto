
INSERT INTO spatial_ref_sys(srid, proj4text)
SELECT
	100001 srid
	,'+proj=lcc +lon_0=100 +lat_1=47 +lat_2=62' proj4text
ON CONFLICT DO NOTHING;

ALTER TABLE public.osm_place ADD COLUMN IF NOT EXISTS geomproj geometry;
ALTER TABLE public.osm_place ADD COLUMN IF NOT EXISTS geomlatlon geometry;
ALTER TABLE public.osm_place ADD COLUMN IF NOT EXISTS pplrank int;
ALTER TABLE public.osm_place ADD COLUMN IF NOT EXISTS ppliso float;

UPDATE osm_place 
SET 
	geomproj = ST_Transform(geometry, 100001)
	,geomlatlon = ST_Transform(geometry, 4326)
	,pplrank = N 
FROM (
	SELECT
		id
		,DENSE_RANK() OVER (ORDER BY population desc) N
	FROM osm_place
	WHERE NULLIF(population, 0) IS NOT NULL
) t
WHERE
	t.id = osm_place.id;

CREATE INDEX IF NOT EXISTS osm_place_rank ON public.osm_place (pplrank, geomproj);
CREATE INDEX IF NOT EXISTS osm_place_geomproj ON public.osm_place USING gist (geomproj);


UPDATE osm_place P 
SET ppliso = iso 
FROM (
	SELECT
		iso.iso  
		,p1.id
	FROM 
		osm_place p1
		LEFT JOIN LATERAL (
			SELECT 
				ST_Distance_Sphere(
					p1.geomlatlon
					,p2.geomlatlon
				) iso
			FROM 
				osm_place p2 
			WHERE 
				p1.pplrank > p2.pplrank
				AND p2.pplrank IS NOT NULL
			ORDER BY 
				p1.geomproj <-> p2.geomproj ASC
			LIMIT 1
		) iso  ON true
	WHERE 
		pplrank IS NOT NULL
) T
WHERE
	P.id = T.id;


/*
--CREATE TABLE osm_place_isolation (id int4, iso float, CONSTRAINT osm_place_isolation_pkey PRIMARY KEY (id));
TRUNCATE TABLE osm_place_isolation

INSERT INTO osm_place_isolation (id, iso)
SELECT
	p1.id
	,iso.iso  
FROM 
	osm_place p1
	LEFT JOIN LATERAL (
		SELECT 
			ST_Distance_Sphere(
				p1.geomlatlon
				,p2.geomlatlon
			) iso
		FROM 
			osm_place p2 
		WHERE 
			p1.pplrank > p2.pplrank
			AND p2.pplrank IS NOT NULL
		ORDER BY 
			p1.geomlatlon <-> p2.geomlatlon ASC
		LIMIT 1
	) iso  ON true
WHERE 
	pplrank IS NOT NULL;
*/
/*
SELECT
	p1.id
	,p1."name"
	,p1.population
	,iso.name
	,iso.iso  
FROM 
	osm_place p1
	LEFT JOIN LATERAL (
		SELECT 
			ST_Distance_Sphere(
				p1.geomlatlon
				,p2.geomlatlon
			) iso
			,"name"
		FROM 
			osm_place p2 
		WHERE 
			p1.pplrank > p2.pplrank
			AND p2.pplrank IS NOT NULL
		ORDER BY 
			p1.geomlatlon <-> p2.geomlatlon ASC
		LIMIT 1
	) iso  ON true
WHERE 
	pplrank IS NOT NULL
	AND place='town'
ORDER BY iso desc
	;


SELECT
	p2."name"
	,ST_Distance_Sphere(
		p1.geomlatlon
		,p2.geomlatlon
	) iso
	,p1.geomlatlon <-> p2.geomlatlon
	
FROM 
	osm_place p1,
	osm_place p2 
WHERE 
	p1.id = 137699

	AND p1.pplrank > p2.pplrank
	AND p2.pplrank IS NOT NULL
ORDER BY 
	p1.geomlatlon <-> p2.geomlatlon ASC
*/