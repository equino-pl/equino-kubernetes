#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-search-feeder.rabbitmq.username and actracker-search-feeder.rabbitmq.password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-search-feeder-rabbitmq-secret
  namespace: equino-int
type: Opaque
data:
  actracker-search-feeder.rabbitmq.username: $(echo -n "$1" | base64)
  actracker-search-feeder.rabbitmq.password: $(echo -n "$2" | base64)
EOF
