INSERT INTO osm_other_point (
	osm_id
	,feature
	,"name"
	,name_ru
	,shelter_type
	,geometry
)
SELECT 
	-osm_id
	,feature
	,"name"
	,name_ru
	,shelter_type
	,ST_Centroid(geometry) geometry
FROM osm_other_line L
WHERE NOT EXISTS (
	SELECT 1 FROM osm_other_point P WHERE osm_id = -L.osm_id
)

--SELECT * FROM osm_other_point

