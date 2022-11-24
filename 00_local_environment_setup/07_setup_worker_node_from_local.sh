#!/bin/bash

#k3s worker
k3sup join \
  --server-ip ${CONTROLLER_NODE_IP} \
  --ip ${WORKER_NODE_IP} \
  --user ${NODE_USER} \
  --k3s-channel stable \
  --k3s-extra-args '--no-deploy traefik --write-kubeconfig-mode 644'
