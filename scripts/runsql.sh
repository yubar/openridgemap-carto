#!/bin/bash
DIR=$(dirname $0)

time psql -d openridgemap -f $DIR/update.sql
time psql -d openridgemap -f $DIR/length.sql
time psql -d openridgemap -f $DIR/angle.sql
time psql -d openridgemap -f $DIR/generalized.sql