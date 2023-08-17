#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-search-feeder.postgres.owner.username and actracker-search-feeder.postgres.owner.password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-search-feeder-postgres-owner-secret
  namespace: equino-prod
type: Opaque
data:
  actracker-search-feeder.postgres.owner.username: $(echo -n "$1" | base64)
  actracker-search-feeder.postgres.owner.password: $(echo -n "$2" | base64)
EOF
