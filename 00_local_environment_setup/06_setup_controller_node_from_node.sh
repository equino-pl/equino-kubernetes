#!/bin/bash

# K3s controller
k3sup install \
  --cluster \
  --local
  --k3s-channel stable \
  --local-path ~/.kube/config \
  --merge --context equino-k8s-cluster \
  --k3s-extra-args '--no-deploy traefik --write-kubeconfig-mode 644'
