#!/bin/bash
docker build -t netlifycms-auth .
docker tag netlifycms-auth rafaelpernil/netlifycms-auth
docker push rafaelpernil/netlifycms-auth

kubectl apply -f ./artifacts/dev/deployment.yaml
kubectl apply -f ./artifacts/dev/service.yaml

kubectl scale --replicas=0 deployment netlifycms-auth -n twitchmidi
kubectl scale --replicas=2 deployment netlifycms-auth -n twitchmidi