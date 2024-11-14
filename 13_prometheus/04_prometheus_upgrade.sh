#!/bin/bash

helm upgrade -f values.yaml prometheus prometheus-community/kube-prometheus-stack -n equino-prometheus