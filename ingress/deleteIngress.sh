#!/bin/bash
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.2/deploy/static/mandatory.yaml
kubectl config set-context --current --namespace ingress-nginx
kubectl delete -f ingress-config.yaml
kubectl delete -f ingress-generic.yaml
kubectl delete LimitRange/ingress-nginx
