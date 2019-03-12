ALTER TABLE planet_osm_rels ADD COLUMN IF NOT EXISTS len float;


UPDATE planet_osm_rels R
SET len = 
	ST_Length(ST_AsText(ST_Transform((
		SELECT ST_Collect(way)
		FROM planet_osm_line L 
		WHERE L.osm_id = ANY (R.parts)
	),26915)))/1000
WHERE
	tags::hstore->'natural' = 'ridge'
