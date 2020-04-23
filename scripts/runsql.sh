#!/bin/bash
DIR=$(dirname $0)

time psql -d openridgemap -f $DIR/update.sql
time psql -d openridgemap -f $DIR/ridgelen.sql
time psql -d openridgemap -f $DIR/angle.sql