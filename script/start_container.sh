#!/bin/bash

set -e

echo " docker image pull and run "

docker pull shridhar71/demo:latest
docker run --name demoapp -p 8000:8000 -d shridhar71/demo:latest 

echo " success -> run "