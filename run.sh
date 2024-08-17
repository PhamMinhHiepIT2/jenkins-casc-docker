#!/bin/bash

docker compose --env-file .env -f docker-compose.yml up --no-deps --build -d