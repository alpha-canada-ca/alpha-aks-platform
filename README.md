# alpha-aks-platform
Alpha AKS cloud infrastructure

# Prerequisites
- Azure subscription with login/password
- Visual Studio code (Kubernetes plugin)
- Azure CLI
- kubectl
- Helm

# Steps to re-create platform
- **az login** (Login to azure)
- **./azure/createAKS.sh** [Cluster name] (The only parameter required is the cluster name (alphanumberic) ex: tbsprod2 )

# Base platform
The above creates a kubernetes cluster with the following: 
- Resource group (clustername-rg)
- 1.16
- Autoscale up to 5 nodes
- 10GB private container registery (clustername-acr)
- Kubernetes cluster (clustername-aks)

# How to view log information
- Install Azure CLI (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
- Install VS Code (https://code.visualstudio.com/download)
- Install Kubernetes plugin for VS Code (https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools)
- Run the following from the commandline: az aks get-credentials --resource-group tbs-prod-rg --name tbs-prod-aks
- Select the namespace for the container in the clusters pane (Right-click "use context")
- Open the workloads 
- Open the deployments
- Right-click and selct "Follow Logs"

# Cluster Utilities

**cert-manager** - resposible for automatically creating certificates for any domain created on the platform
- Ensure you have selected the correct cluster
- cd cert-manager
- ./install-cert-manager.sh
- ./install-cluster-issuer.sh

