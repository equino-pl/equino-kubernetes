#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-api-publisher-rabbitmq.username and actracker-api-publisher-rabbitmq.password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-api-rabbitmq-secret
  namespace: equino-prod
type: Opaque
data:
  actracker-api-publisher-rabbitmq.username: $(echo -n "$1" | base64)
  actracker-api-publisher-rabbitmq.password: $(echo -n "$2" | base64)
EOF
