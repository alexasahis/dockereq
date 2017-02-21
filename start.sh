#!/bin/bash
set -e
docker-compose down
docker-compose up
echo "Running Shared Memory on eqemu..."
docker-compose run -w /eqemu eqemu /eqemu/shared_memory
docker-compose up