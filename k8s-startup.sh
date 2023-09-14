#!/bin/bash

# Build microservices
nx run-many -t build -p api-gateway -p auth-microservice -p payments-microservice

# Let minikube use docker
minikube docker-env
eval $(minikube -p minikube docker-env)

# Build Docker image used by api and microservices. Name of image has to match image declared on templates.
docker build -f apps/api-gateway/Dockerfile . -t mint/api-gateway:1.0.2 
docker build -f apps/auth-microservice/Dockerfile . -t mint/auth-microservice:1.0.2
docker build -f apps/payments-microservice/Dockerfile . -t mint/payments-microservice:1.0.2

# List docker images
docker images --format "table {{.ID}}\t{{.Tag}}\t{{.Repository}}"

# Apply kubernetes manifests
kubectl apply -f ./k8s/unified/k8s-config.yaml
kubectl apply -f ./k8s/unified/k8s-kafka.yaml
kubectl apply -f ./k8s/unified/k8s-api.yaml
kubectl apply -f ./k8s/unified/k8s-microservices.yaml