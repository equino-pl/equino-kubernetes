#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-int-owner-username and actracker-int-owner-password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-int-owner-secret
  namespace: equino-postgres
type: Opaque
data:
  OWNER_USERNAME: $(echo -n "$1" | base64)
  OWNER_PASSWORD: $(echo -n "$2" | base64)
  DB_NAME: $(echo -n "actracker_int" | base64)
  SCHEMA_NAME: $(echo -n "actracker_int_schema" | base64)
EOF
