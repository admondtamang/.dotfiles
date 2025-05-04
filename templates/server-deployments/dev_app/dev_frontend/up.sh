#!/bin/bash

cd /home/ubuntu/dev_app/dev_frontend  

if [[ $1 ]]; then
  docker compose down -v
  exit 0
fi

docker compose up --build --detach --scale dev_web=1
