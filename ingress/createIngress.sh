#!/bin/bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl config set-context --current --namespace ingress-nginx
kubectl apply -f ingress-config.yaml
kubectl apply -f static-ip-ingress-prod.yaml
kubectl delete LimitRange/ingress-nginx
