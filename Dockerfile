FROM centos:latest
MAINTAINER Verhagen "https://github.com/verhagen"

# Cache date (see https://github.com/docker/docker/issues/3313)
ENV LAST_UPDATED "17-01-2015 13:30"

#RUN apt-get update && apt-get upgrade -q -y && apt-get install aptitude -q -y && apt-get clean


RUN yum install -y bash-completion \
  tar \
  openssh-server \
  lsof \
  java-1.7.0-openjdk

#  supervisor \

RUN mkdir -p /opt
COPY parasoft_virtualize_9.7_linux_x86_64.tar.gz /opt/parasoft_virtualize_9.7_linux_x86_64.tar.gz
RUN cd /opt && tar -xzfv parasoft_virtualize_9.7_linux_x86_64.tar.gz
RUN chmod +x /opt/virtualize*

# Make sure SSH and RDP are exposed to the outside world
EXPOSE 22

#CMD ["supervisord", "-n"]
