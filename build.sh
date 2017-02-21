#!/bin/bash
set -e

cd src
if [ -f "src/.gitignore" ]; then
	echo "Updating EQEMU git to src/..."
	git pull
else 
	echo "Cloning EQEMU git to src/..."
	git clone https://github.com/eqemu/server src/
fi
cd ..

echo "Building 'build' docker container..."
docker build docker/build/. -t buildeq

echo "Running build..."
docker run -v $(pwd)/src:/src -v $(pwd)/eqemu_data:/eqemu buildeq 

echo "Build is successful. Type docker-compose up"