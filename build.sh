#!/bin/bash
set -e
if [ -f "env.txt"]; then
	source env.txt
else 
	echo "Building env.txt, edit this file for default option changes..."
	echo "$GITSOURCE=https://github.com/eqemu/server" >> env.txt
	source env.txt
fi


cd src
if [ -f "src/.gitignore" ]; then
	echo "Updating EQEMU git to src/..."
	git pull
else 
	echo "Cloning EQEMU git to src/..."
	git clone ${GITSOURCE} src/
fi
cd ..

echo "Building 'build' docker container..."
docker build docker/build/. -t buildeq

echo "Building binaries..."
docker run -v $(pwd)/src:/src -v $(pwd)/eqemu_data:/eqemu buildeq 

echo "Building Images..."
docker-compose build

echo "Build completed. Run the start.sh script to begin the environment."