#!/bin/bash
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml
kubectl config set-context --current --namespace ingress-nginx
kubectl delete -f ingress-config.yaml
kubectl delete -f ingress-generic.yaml
kubectl delete LimitRange/ingress-nginx
