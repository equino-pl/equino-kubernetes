#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires Docker registry username and password as arguments"
    exit -1
fi

kubectl create secret docker-registry equino-registry -n equino-dev \
--docker-server=registry.cloud.equino.ovh \
--docker-username="$1" \
--docker-password="$2" \
--docker-email=something@randomhere.com

kubectl create secret docker-registry equino-registry -n equino-int \
--docker-server=registry.cloud.equino.ovh \
--docker-username="$1" \
--docker-password="$2" \
--docker-email=something@randomhere.com

kubectl create secret docker-registry equino-registry -n equino-prod \
--docker-server=registry.cloud.equino.ovh \
--docker-username="$1" \
--docker-password="$2" \
--docker-email=something@randomhere.com
