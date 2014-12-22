#!/bin/bash

#
# Starts tmpnb server using the jupyter-kernel as the base image
# The idea is that (eventually) this will be an API you can hit to start a new 
# container for a user
# 


# Set key environment variables

export REDIRECT_URL=http://127.0.0.1:9999
export CONTAINER_IP=0.0.0.0
export TOKEN=$( head -c 30 /dev/urandom | xxd -p )


#
# Kill all the docker containers
#
docker kill $(docker ps -aq)
docker rm proxy
docker rm tmpnb

#
# Start the proxy server
#

docker run -d --net=host -e CONFIGPROXY_AUTH_TOKEN=$TOKEN --name=proxy \
                  jupyter/configurable-http-proxy --default-target $REDIRECT_URL

#
# Start the tmpnb server
#
docker run -d --net=host --name=tmpnb -e CONFIGPROXY_AUTH_TOKEN=$TOKEN \
   -v /var/run/docker.sock:/docker.sock \
   odewahn/tmpnb \
   python orchestrate.py --container_ip=$CONTAINER_IP --image="odewahn/ruby-kernel-test" \
   --command="python jupyter-kernel.py --base_path='{base_path}'" --pool_size=120 --redirect-uri="/"

#
# For testing, also start a single instance running directly on 8888
#
docker run -d -p 8888:8888 odewahn/jupyter-kernel ./go.sh


#
# Print some status messages
#
echo "\n"
echo "TOKEN: $TOKEN"
echo "CONTAINER_IP: $CONTAINER_IP"
echo "REDIRECT_URL set to $REDIRECT_URL"
