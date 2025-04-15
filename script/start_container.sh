#!/bin/bash

set -e

echo "Check if Docker is installed..."

sudo dpkg --configure -a

if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    sudo apt update
    sudo apt install docker.io -y
    sudo usermod -aG docker ubuntu 
    sudo systemctl restart docker
    echo "Docker installed successfully."
else
    echo "Docker is already installed."
fi

echo "Pulling Docker image shridhar71/demo:latest..."
docker pull shridhar71/demo:latest

echo "Running container as 'demoapp'..."
docker run --name demoapp -p 8000:8000 -d shridhar71/demo:latest || {
    echo "Container with name 'demoapp' may already exist. Attempting to restart..."
    docker start demoapp
}

echo "Success -> run"
