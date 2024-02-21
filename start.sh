#!/bin/bash

if [ ! -d "./project" ]; then
    echo "First clone a GIT project to the folder project"
	echo "$ git clone <repository> project"
	exit
fi

#FILL IN THE PATH TO THE OPENAPI SPECS json
jsonfile="storage/api-docs/api-docs.json"
docker-compose down

cd project
git pull
cd ..
cp project/$(jsonfile) src/api-docs.json

docker-compose up -d