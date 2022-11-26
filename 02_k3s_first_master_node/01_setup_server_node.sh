#!/bin/bash

# K3s controller node
curl -sfL https://get.k3s.io | sh -s server \
--cluster-init \
#--flannel-backend=wireguard \
--write-kubeconfig-mode 644

#cat ./manifests/traefik-config.yaml | envsubst | kubectl apply -f -
