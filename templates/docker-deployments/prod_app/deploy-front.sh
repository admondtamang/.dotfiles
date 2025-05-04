#!/usr/bin/env bash

cd /home/ubuntu/prod_app/frontend

docker compose up --build --detach --remove-orphans --scale web=2

#docker system prune -a -f
docker system prune -f
