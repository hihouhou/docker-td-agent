#
# Td-agent Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >


# Update & install packages for installing td-agent
RUN apt-get update && \
    apt-get install -y curl

#Install and configure consul
RUN curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add - && \
    echo "deb http://packages.treasuredata.com/2/debian/jessie/ jessie contrib" > /etc/apt/sources.list.d/treasure-data.list && \
    apt-get update && \
    apt-get install -y td-agent
    
#Add configuration file for binary
ADD td-agent.conf /etc/td-agent/

#CMD ["/usr/local/bin/consul", "agent", "-config-file","/etc/consul.d/server/server.json"]
