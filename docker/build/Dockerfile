FROM ubuntu:14.04
MAINTAINER Xackery <xackery@gmail.com>

RUN apt-get -y update
RUN apt-get install -y build-essential cmake cpp curl debconf-utils g++ gcc git git-core libio-stringy-perl liblua5.1 liblua5.1-dev libluabind-dev libmysql++ libperl-dev libperl5i-perl libwtdbomysql-dev libmysqlclient-dev lua5.1 make mariadb-client nano open-vm-tools unzip uuid-dev zlib-bin zlibc
RUN apt-get -y upgrade

ENV HOME /src
WORKDIR /src

RUN cmake

# Define default command.
CMD ["make", "&&", "cp", "/src/bin/*", "/eqemu/"]