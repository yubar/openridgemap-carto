#!/bin/bash
DIR=$(dirname $0)

psql -d openridgemap -f $DIR/preupdate.sql
psql -d openridgemap -f $DIR/update.sql
psql -d openridgemap -f $DIR/length.sql
psql -d openridgemap -f $DIR/angle.sql
psql -d openridgemap -f $DIR/centroid.sql
