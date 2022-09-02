#!/bin/bash
set -e

# This script sets the default PostgreSQL schema to strapi

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE SCHEMA strapi;
	SET search_path TO strapi;
EOSQL
