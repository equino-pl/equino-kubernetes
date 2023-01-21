#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-api-db-postgres.app.username and actracker-api-db-postgres.app.password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-api-postgres-app-secret
  namespace: equino-int
type: Opaque
data:
  actracker-api-db-postgres.app.username: $(echo -n "$1" | base64)
  actracker-api-db-postgres.app.password: $(echo -n "$2" | base64)
EOF
