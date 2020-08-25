#!/bin/bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.2/deploy/static/mandatory.yaml
kubectl config set-context --current --namespace ingress-nginx
kubectl apply -f ingress-config.yaml
kubectl apply -f $1
kubectl delete LimitRange/ingress-nginx
