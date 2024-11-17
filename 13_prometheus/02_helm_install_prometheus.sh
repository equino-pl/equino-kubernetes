#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install -f values.yaml prometheus prometheus-community/kube-prometheus-stack --namespace equino-prometheus
