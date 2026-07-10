#!/bin/bash

<< task
Deploy a django app
and hadle the code for error
task

code_clone(){
        echo "Cloning the Django app....."
        git clone https://github.com/LondheShubham153/django-notes-app.git

}

install_requirements(){
        echo " Installing Dependencies......"
        sudo apt-get install docker.io nginx -y

}

required_restarts(){
        sudo chown $USER /var/run/docker.sock
        sudo systemctl enable docker
        sudo systemctl enable nginx
        sudo systemctl restart docker
}

deploy(){
        # Stop all containers
        docker stop $(docker ps -aq) 2>/dev/null || true

        # Completely remove Docker data
        sudo systemctl stop docker
        sudo systemctl stop containerd

        # Remove ALL Docker and containerd data
        sudo rm -rf /var/lib/docker
        sudo rm -rf /var/lib/containerd

        # Start Docker fresh
        sudo systemctl start containerd
        sudo systemctl start docker
        sleep 5

        # Pull base image first
        docker pull python:3.9

        # Build with BuildKit (not legacy)
        export DOCKER_BUILDKIT=1
        docker build -t notes-app .

        # Run container
        docker run -d -p 8000:8000 notes-app:latest
}

echo "***************Deployment Started*****************"
echo "==================================================="
 if ! code_clone; then
         echo "The Code Directory Already Exixts"
         cd django-notes-app
 fi

echo "==================================================="
if ! install_requirements; then
        echo "Installiation Failed"
        exit 1
fi

echo "==================================================="
if ! required_restarts; then
        echo "System faulut identified"
        exit 1
fi

echo "==================================================="
if ! deploy; then

        echo "Deployment failed, mailing the admin"
        # send mail
fi

echo "==================================================="


echo "***************Deployment Completed*****************"
