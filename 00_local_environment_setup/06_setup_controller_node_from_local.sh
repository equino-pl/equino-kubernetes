#!/bin/bash

# K3s controller
k3sup install \
  --ip ${CONTROLLER_NODE_IP} \
  --cluster \
  --user ${NODE_USER} \
  --k3s-channel stable \
  --local-path ~/.kube/config \
  --merge --context equino-kubernetes \
  --k3s-extra-args '--no-deploy traefik --write-kubeconfig-mode 644'
