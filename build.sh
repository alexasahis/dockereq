#!/bin/bash
set -e
if [ -f "env.txt" ]; then
	source env.txt
else 
	read -e -p "Enter git repo to pull source from (default: https://github.com/eqemu/server):" GITSOURCE
	if [ -z "${GITSOURCE}" ]; then
		GITSOURCE=https://github.com/eqemu/server
	fi
	echo "Building env.txt, edit this file to change default options in future..."
	echo "export GITSOURCE=${GITSOURCE}" >> env.txt
	source env.txt
fi


cd src
if [ -f ".gitignore" ]; then
	echo "Updating ${GITSOURCE} to src/..."
	git pull
else 
	echo "Cloning ${GITSOURCE} git to src/..."
	git clone ${GITSOURCE} .
fi
cd ..

echo "Building 'build' docker container..."
docker build docker/build/. -t buildeq

echo "Building binaries..."
docker run -v $(pwd)/src:/src -v $(pwd)/eqemu_data:/eqemu buildeq 

echo "Building Images..."
docker-compose build

echo "Build completed. Run docker-compose run mariadb to inject DB data, or run the start.sh script to begin the environment."