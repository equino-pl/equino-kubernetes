#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires Docker registry username and password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: registry-basic-auth-secret
  namespace: equino-docker-registry
data:
  users: |2
    $(htpasswd -nb $1 $2 | base64)
EOF

