@echo off
if NOT exist eqemu_data/world (
	if NOT exist src/bin/world (
		echo "Could not find world binary in eqemu_data or src/bin, please copy required binaries to eqemu_data to start."
		exit
	)
)
echo "Running Shared Memory on EQEMU Server..."
docker-compose run -w /eqemu eqemu /eqemu/shared_memory
echo "Starting EQEMU Server..."
docker-compose run eqemu