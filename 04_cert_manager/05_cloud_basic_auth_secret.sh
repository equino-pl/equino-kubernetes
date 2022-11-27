!/bin/bash

if [ $# -ne 2 ]
  then
    echo "No arguments supplied. Requires username and password as arguments"
    exit -1
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: cloud-basic-auth-secret
  namespace: kube-system
data:
  users: |2
    $(htpasswd -nb $1 $2 | base64)
EOF
