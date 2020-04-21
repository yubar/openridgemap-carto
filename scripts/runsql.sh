#!/bin/bash
DIR=$(dirname $0)

psql -d openridgemap -f $DIR/update.sql
psql -d openridgemap -f $DIR/ridgelen.sql
psql -d openridgemap -f $DIR/angle.sql