#!/bin/bash
set -e
if [ -f "eqemu_data/world" ]; then
else
	echo "Could not find world inside eqemu_data, please copy these binaries or run build.sh"
	exit
fi

docker-compose down
docker-compose up
echo "Running Shared Memory on eqemu..."
docker-compose run -w /eqemu eqemu /eqemu/shared_memory
docker-compose up