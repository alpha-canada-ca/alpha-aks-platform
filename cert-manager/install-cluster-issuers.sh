#!/bin/bash
kubectl apply -f cluster-issuer-prod.yaml -n cert-manager
kubectl apply -f cluster-issuer-staging.yaml -n cert-manager