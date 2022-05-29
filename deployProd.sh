#!/bin/bash
kubectl apply -f ./artifacts/prod/deployment.yaml
kubectl apply -f ./artifacts/prod/service.yaml

kubectl scale --replicas=0 deployment netlifycms-auth -n twitchmidi
kubectl scale --replicas=2 deployment netlifycms-auth -n twitchmidi