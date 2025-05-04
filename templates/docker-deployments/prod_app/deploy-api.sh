#!/usr/bin/env bash

cd /home/ubuntu/prod_app/api/

docker compose up --build --detach --remove-orphans  --scale api=2

#docker-compose exec api python manage.py migrate
docker system prune -f
