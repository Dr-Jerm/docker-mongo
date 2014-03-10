# run with:
# -v /data/compromise:/data/compromise
# example:
# sudo docker run -name mongo-compromise -d -v /data/compromise:/data/compromise drjerm/ubuntu-mongo

FROM ubuntu

VOLUME ["/data/compromise"]

RUN apt-get update

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get update
RUN apt-get install mongodb-10gen

EXPOSE 27017
ENTRYPOINT ["mongod", "-f", "/data/compromise/mongodb.conf"]
