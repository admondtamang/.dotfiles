#!/bin/bash

cd /home/ubuntu/prod_app/api

if [[ $1 ]]; then
  docker compose down -v
  exit 0
fi

docker compose up --build --detach --scale api=2
