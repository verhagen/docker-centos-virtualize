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

# Parasoft Virtualize 
# Copy the *.tar.gz; unpack the file; run the *.sh installer
RUN mkdir -p /opt
COPY parasoft_virtualize_9.8_linux_x86_64.tar.gz /opt/parasoft_virtualize_9.8_linux_x86_64.tar.gz
RUN cd /opt && tar -xzvf parasoft_virtualize_9.8_linux_x86_64.tar.gz
RUN chmod +x /opt/parasoft_virtualize_9.8_linux_x86_64_20141024.sh
RUN mkdir -p /opt/parasoft/virtualize/9.8
RUN cd /opt && echo -e '1\n\n\n' | /opt/parasoft_virtualize_9.8_linux_x86_64_20141024.sh
RUN rm /opt/parasoft_virtualize*

# Configure Supervisor it to run Virtualize
ADD virtualize.conf /etc/supervisor/conf.d/

# Make sure SSH and RDP are exposed to the outside world
EXPOSE 22

#CMD ["supervisord", "-n"]
	
