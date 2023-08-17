#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-search-feeder-prod-owner-username and actracker-search-feeder-prod-owner-password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-search-feeder-prod-owner-secret
  namespace: equino-postgres
type: Opaque
data:
  OWNER_USERNAME: $(echo -n "$1" | base64)
  OWNER_PASSWORD: $(echo -n "$2" | base64)
  DB_NAME: $(echo -n "actracker_search_feeder_prod" | base64)
  SCHEMA_NAME: $(echo -n "actracker_search_feeder_prod_schema" | base64)
EOF
