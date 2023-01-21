#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-int-postgres-username and actracker-int-postgres-password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-int-postgres-secret
  namespace: equino-postgres
type: Opaque
data:
  POSTGRES_USERNAME: $(echo -n "$1" | base64)
  POSTGRES_PASSWORD: $(echo -n "$2" | base64)
EOF
