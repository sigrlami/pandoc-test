#!/bin/bash

docker build -t tmp-ghcjs .
echo "Copying ghcjs.tar.gz file from the docker image."
docker run --rm tmp-ghcjs cat /opt/ghcjs.tar.gz > ghcjs.tar.gz