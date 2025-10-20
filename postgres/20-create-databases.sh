#!/usr/bin/env bash
set -e

export VARIANT="v3"
export PGPASSWORD=test
psql -h postgres -U program -d postgres -f "/scripts/db-$VARIANT.sql"
