# run with:
# -v /data/[hostDatabaseDirectory]:/data
# example:
# sudo docker run -name mongo-compromise -d -v /data/compromise:/data drjerm/ubuntu-mongo

FROM ubuntu

VOLUME ["/data/"]

RUN apt-get update

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get update
RUN apt-get install mongodb-10gen

EXPOSE 27017
ENTRYPOINT ["mongod", "-f", "/data/mongodb.conf"]
