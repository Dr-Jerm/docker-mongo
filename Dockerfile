# run with:
# -v /data/[hostDatabaseDirectory]:/data
# example:
# sudo docker run --name mongo-compromise -v /data/compromise:/data -d drjerm/ubuntu-mongo
FROM ubuntu:latest

MAINTAINER Jeremy R Bernstein <utilityjerm@gmail.com>

VOLUME ["/data/"]

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get update
RUN apt-get install -y -q mongodb-org

#ADD mongodb.conf /etc/

#EXPOSE 27017

ENTRYPOINT mongod -f /data/mongodb.conf
