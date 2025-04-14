#!/bin/bash

set -e

echo "install docker and docker image pull and run "

sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu 
sudo systemctl restart docker

docker pull shridhar71/demo:latest
docker run --name demoapp -p 8000:8000 -d shridhar71/demo:latest 

echo " success -> run "