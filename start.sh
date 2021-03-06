#!/bin/bash
set -e
if [ ! -f "eqemu_data/world" ]; then
	if [ ! -f "src/bin/world"]; then
		echo "Could not find world binary in eqemu_data or src/bin, please copy required binaries to eqemu_data to start."
		exit
	fi
fi
echo "Running Shared Memory on EQEMU Server..."
docker-compose run -w /eqemu eqemu /eqemu/shared_memory
echo "Starting EQEMU Server..."
docker-compose run eqemu