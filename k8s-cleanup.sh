#!/bin/bash

# delete kubernetes manifests
kubectl delete -f ./k8s/unified/k8s-config.yaml
kubectl delete -f ./k8s/unified/k8s-kafka.yaml
kubectl delete -f ./k8s/unified/k8s-api.yaml
kubectl delete -f ./k8s/unified/k8s-microservices.yaml