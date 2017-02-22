@echo off
cd src
if exist .gitignore (
	echo "Updating git from source"
	git pull
) else (
	echo "Cloning git from source"
	git clone https://github.com/eqemu/server .
)
cd ..


echo "Building 'build' docker container..."
docker build docker\build\. -t buildeq

echo "Building binaries..."
docker run -v %cd%/src:/src -v $(pwd)/eqemu_data:/eqemu buildeq 

echo "Building Images..."
docker-compose build

echo "Build completed. Run docker-compose run mariadb to inject DB data, or run the start.sh script to begin the environment."