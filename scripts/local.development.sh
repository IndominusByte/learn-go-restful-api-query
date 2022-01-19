#!/bin/bash

export COMPOSE_IGNORE_ORPHANS=True

# db query
export DB_QUERY_IMAGE=learn-go-restful-api-db-query
export DB_QUERY_IMAGE_TAG=development
export DB_QUERY_CONTAINER=learn-go-restful-api-db-query-development
export DB_QUERY_HOST=learn-go-restful-api-db-query.service
export BACKEND_STAGE=development

docker build -t "$DB_QUERY_IMAGE:$DB_QUERY_IMAGE_TAG" .
docker-compose -f ./manifest/docker-compose.development.yaml up -d --build
