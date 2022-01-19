#!/bin/bash

export COMPOSE_IGNORE_ORPHANS=True

# db query
export DB_QUERY_IMAGE=learn-go-restful-api-db-query
export DB_QUERY_IMAGE_TAG=production
export DB_QUERY_CONTAINER=learn-go-restful-api-db-query-production
export DB_QUERY_HOST=learn-go-restful-api-db-query.service
export BACKEND_STAGE=production

docker build -t "$DB_QUERY_IMAGE:$DB_QUERY_IMAGE_TAG" .
docker-compose -f ./manifest/docker-compose.production.yaml up -d --build
