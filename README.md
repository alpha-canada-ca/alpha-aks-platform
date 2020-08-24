# alpha-aks-platform
Alpha AKS cloud infrastructure

# Pre-requisites
- Azure subscription with login/password
- Visual Studio code (Kubernetes plugin)
- Azure CLI
- kubectl
- Helm

# Steps to re-create platform
- ##az login## (Login to azure)
- ##./azure/createAKS.sh## [Cluster name] (The only parameter required is the cluster name (alphanumberic) ex: tbsprod2 )

# Base platform
The above creates a kubernetes cluster with the following: 
- Resource group (clustername-rg)
- 1.16
- Autoscale up to 5 nodes
- 10 g private container registery (clustername-acr)
- Kubernetes cluster (clustername-aks)

# Cluster Utilities

#cert-manager - resposible for automatically creating certificates for any domain created on the platform
- Ensure you have selected the correct cluster
- cd cert-manager
- ./install-cert-manager.sh
- ./install-cluster-issuer.sh

