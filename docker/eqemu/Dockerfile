FROM ubuntu:14.04
MAINTAINER Xackery <xackery@gmail.com>

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get -y update \
	&& apt-get install -y liblua5.1 libmysql++ libperl5i-perl lua5.1 zlibc supervisor wget
#RUN apt-get -y upgrade
RUN mkdir -p /var/log/supervisor

# Define default command.
CMD ["/usr/bin/supervisord"]