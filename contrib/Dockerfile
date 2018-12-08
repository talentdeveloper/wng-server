# Wng docker image
#
# to use:
#
# 1. install docker, see docker.com
# 2. clone the git repo including this Dockerfile
# 3. build the container with ```docker build -t wng .```
# 4. run the created wng container with ```docker run -d -p 127.0.0.1:7876:7876 -p 7874:7874 wng```
# 5. inspect with docker logs (image hash, find out with docker ps, or assign a name)

FROM phusion/baseimage
# start off with standard ubuntu images

# Set local and enable UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C
ENV LC_ALL C.UTF-8

#java8
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN apt-get install -y wget unzip
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer

# run and compile wng
RUN mkdir /wng
ADD . /wng
# repo has
ADD contrib/docker_start.sh /docker_start.sh
# set wng to listen on all interfaces
RUN echo 'wng.allowedBotHosts=*' >> /wng/conf/wng.properties
RUN echo 'wng.apiServerHost=0.0.0.0' >> /wng/conf/wng.properties
RUN chmod +x /docker_start.sh

RUN cd /wng; ./compile.sh
# both Wng ports get exposed
EXPOSE 7874 7876
CMD ["/docker_start.sh"]
