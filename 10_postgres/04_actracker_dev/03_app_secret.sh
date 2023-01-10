#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-dev-app-username and actracker-dev-app-password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-dev-app-secret
  namespace: equino-postgres
type: Opaque
data:
  APP_USERNAME: $(echo -n "$1" | base64)
  APP_PASSWORD: $(echo -n "$2" | base64)
EOF
