FROM ubuntu:14.04
MAINTAINER Xackery <xackery@gmail.com>

RUN apt-get -y update
RUN apt-get install -y liblua5.1 libmysql++ libperl5i-perl lua5.1 zlibc
RUN apt-get -y upgrade

ENV HOME /eqemu
WORKDIR /eqemu

# Define default command.
CMD ["bash"]