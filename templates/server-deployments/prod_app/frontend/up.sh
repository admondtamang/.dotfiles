#!/bin/bash

cd /home/ubuntu/prod_app/frontend

if [[ $1 ]]; then
  docker compose down -v
  exit 0
fi

docker compose up --build --detach --scale web=2
