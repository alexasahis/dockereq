# dockereq
Everquest Emulator in Docker.

## Introduction

DockerEQ establishes a docker instance for you to run an [Everquest Emulator](http://www.eqemulator.org/) server.

## Installation

### Requirements
* [Docker](http://docker.com)
* [Docker Compose](https://github.com/docker/compose/releases)

### Building from source (Optional)
* DockerEQ can build eqemu from latest source. To do so, it will pull from a described git repository and place it's contents inside the src/ directory. Running the `build.sh` script will walk you through this procedure.

### Preparing Environment
* Copy binaries such as world, ucs, zone, etc compiled for linux to eqemu_data/.
* Edit eqemu_data/eqemu_config.xml with any custom username/password/database settings you may need. *Be sure to edit /docker-compose.yml to reflect the same changes*.

#### First Time Setup
* To Start using DockerEQ, you will need to insert a database with data. 
* `docker-compose run mariadb` will just start the mariadb server. 
* Using your favorite MySQL client, such as [HeidiSQL](https://www.heidisql.com/download.php), load the database from a .sql backup file.

## Running the Server
* Simply call `start.sh` to start the docker environment. 

