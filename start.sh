#!/bin/bash
set -e
docker-compose down
docker-compose up
docker-compose run eqemu /eqemu/shared_memory