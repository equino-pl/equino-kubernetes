#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires actracker-search-feeder.elasticsearch.username and actracker-search-feeder.elasticsearch.password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: actracker-search-feeder-elasticsearch-secret
  namespace: equino-prod
type: Opaque
data:
  actracker-search-feeder.elasticsearch.username: $(echo -n "$1" | base64)
  actracker-search-feeder.elasticsearch.password: $(echo -n "$2" | base64)
EOF
