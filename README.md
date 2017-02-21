# dockereq
Everquest Emulator in Docker.

## Introduction

## Installation
### Requirements
* Docker is required to run this, and you can find it at http://docker.com
* Docker-compose is used for orchestrating all containers. 

## Usage
* build.sh (or build.bat) pulls source from eqemu/master into the src/ directory and builds a docker image called buildeq to compile eqemu binaries into eqemu_data/ directory.
* start.sh (start.bat) runs the docker-compose environment. This depends on either build being ran or the binaries to be set in the eqemu_data/ directory.

