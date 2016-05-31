#!/bin/bash
if ! docker ps --quiet; then
    # Delete all containers
    docker rm $(docker ps -a -q)
    # Delete all images
    docker rmi $(docker images -a -q)
else
    echo 'no containers to remove'
fi
