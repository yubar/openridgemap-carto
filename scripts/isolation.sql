--ALTER TABLE public.osm_place DROP COLUMN IF EXISTS pplrank;
/*
ALTER TABLE public.osm_place ADD COLUMN IF NOT EXISTS geomlatlon geometry;
ALTER TABLE public.osm_place ADD COLUMN IF NOT EXISTS pplrank int;
ALTER TABLE public.osm_place ADD COLUMN IF NOT EXISTS ppliso float;



UPDATE osm_place 
SET 
	geomlatlon = ST_ShiftLongitude(ST_Transform(geometry, 4326))
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

CREATE INDEX IF NOT EXISTS osm_place_rank ON public.osm_place (pplrank, geomlatlon);
--DROP INDEX IF EXISTS osm_place_rank; 

*/
/*
UPDATE osm_place P 
SET ppliso = iso 
FROM (
	SELECT
		(
			SELECT 
				ST_Distance_Sphere(
					p1.geomlatlon
					,p2.geomlatlon
				)
			FROM 
				osm_place p2 
			WHERE 
				p1.pplrank > p2.pplrank
				AND p2.pplrank IS NOT NULL
			ORDER BY 
				p1.geomlatlon <-> p2.geomlatlon ASC
			LIMIT 1
		) iso   
		,p1.id
	FROM osm_place p1
	WHERE 
		pplrank IS NOT NULL
) T
WHERE
	P.id = T.id
;
*/



/*
SELECT
	p1.name_ru
	,p1.population
	,p2.id
	,p2.name_ru
	,p2.population
	,ST_Distance_Sphere(
		p1.geomlatlon
		,p2.geomlatlon
	)
	,p1.geomlatlon <-> p2.geomlatlon
	
FROM
	osm_place p1
	,osm_place p2
WHERE
	p1.id = 148140	
	AND p2.pplrank < p1.pplrank
ORDER BY 
--p2.pplrank asc
p1.geomlatlon <-> p2.geomlatlon ASC

--SELECT * FROM osm_place WHERE name='Анадырь'
*/
	

/*
	SELECT
		(
			SELECT 
				ST_Distance_Sphere(
					p1.geomlatlon
					,p2.geomlatlon
				)
			FROM 
				osm_place p2 
			WHERE 
				p1.pplrank > p2.pplrank
				AND p2.pplrank IS NOT NULL
			ORDER BY 
				p1.geomlatlon <-> p2.geomlatlon ASC
			LIMIT 1
		) iso   
		,p1.id
	FROM osm_place p1
	WHERE 
		pplrank IS NOT NULL
		AND place='town'
	ORDER BY iso desc
;


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
				p1.geomlatlon <-> p2.geomlatlon ASC
			LIMIT 1
		) iso  ON true
	WHERE 
		pplrank IS NOT NULL
		AND place='town'
	ORDER BY iso desc
;
*/

/*
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
				p1.geomlatlon <-> p2.geomlatlon ASC
			LIMIT 1
		) iso  ON true
	WHERE 
		pplrank IS NOT NULL
) T
WHERE
	P.id = T.id
;

*/

--CREATE TABLE osm_place_isolation (id int4, iso float, CONSTRAINT osm_place_isolation_pkey PRIMARY KEY (id));
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
	
	