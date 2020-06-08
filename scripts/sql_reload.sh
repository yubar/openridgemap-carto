#!/bin/bash
DIR=$(dirname $0)

time psql -d openridgemap -f $DIR/update.sql
time psql -d openridgemap -f $DIR/length.sql
time psql -d openridgemap -f $DIR/angle.sql
time psql -d openridgemap -f $DIR/generalized.sql
time psql -d openridgemap -f $DIR/waterway.sql
time psql -d openridgemap -f $DIR/centroid.sql
time psql -d openridgemap -f $DIR/isolation.sql
