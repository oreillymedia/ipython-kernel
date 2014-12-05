#!/bin/bash

#
# Starts tmpnb server using the jupyter-kernel as the base image
# The idea is that (eventually) this will be an API you can hit to start a new 
# container for a user
# 


# Set the default redirect URL
# Note that if you're on boot2docker, I assume you're on a dev env
export REDIRECT_URL=http://127.0.0.1:9999
export CONTAINER_IP=0.0.0.0
if boot2docker > /dev/null 2>&1; then
	export REDIRECT_URL=192.168.59.103:9999
	export CONTAINER_IP=192.168.59.103
fi



# 
# Set the token
#
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
   jupyter/tmpnb \
   python orchestrate.py --container_ip=$CONTAINER_IP --image="odewahn/jupyter-kernel" \
   --command="python jupyter-kernel.py --base_path='{base_path}'" --pool_size=5 --redirect-uri="/"

#
# Print some status messages
#
echo "TOKEN: $TOKEN"
echo "CONTAINER_IP: $CONTAINER_IP"
echo "REDIRECT_URL set to $REDIRECT_URL"
