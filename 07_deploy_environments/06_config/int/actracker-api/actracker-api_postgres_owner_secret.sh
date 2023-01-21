#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-api-db-postgres.owner.username and actracker-api-db-postgres.owner.password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-api-postgres-owner-secret
  namespace: equino-int
type: Opaque
data:
  actracker-api-db-postgres.owner.username: $(echo -n "$1" | base64)
  actracker-api-db-postgres.owner.password: $(echo -n "$2" | base64)
EOF
