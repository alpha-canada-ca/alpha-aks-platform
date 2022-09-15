#!/bin/bash

# create resource group all resources need a rg
az group create --location canadacentral --name $1-rg

# create the service principal for the cluster, it will have a name of cluster name + _sp
SP_PASSWD=$(az ad sp create-for-rbac --name $1-sp --skip-assignment --query password --output tsv)
SP_APP_ID=$(az ad sp list --display-name $1-sp --query [0].appId -o tsv)
echo name: $1-sp
echo AppId: $SP_APP_ID
echo Password: $SP_PASSWD

# create the cluster, it will have autoscale enabled, and will use canadacentral as the server location
az aks create \
            --name $1-aks \
            --location canadacentral \
            --resource-group $1-rg \
            --enable-cluster-autoscaler \
            --kubernetes-version 1.23.8 \
            --load-balancer-sku basic \
            --max-count 5 \
            --min-count 1 \
            --node-vm-size Standard_B2s \
            --service-principal $SP_APP_ID \
            --client-secret "$SP_PASSWD" \
            --dns-service-ip 10.0.0.10 \
            --network-plugin kubenet
# enable kubectl control of this cluster
az aks get-credentials --resource-group $1-rg --name $1-aks --admin --overwrite-existing
# create the container registry for storing private containers
az acr create --resource-group $1-rg --name $1acr --sku Basic
az aks update -n $1-aks -g $1-rg --attach-acr $1acr

#NODE_POOL_RG=$(az aks show --resource-group $1-rg --name $1-aks --query nodeResourceGroup -o tsv)
#echo Node Pool: $NODE_POOL_RG
#az role assignment create --assignee $SP_APP_ID --role "4d97b98b-1d4f-4787-a291-c67834d212e7" --resource-group $NODE_POOL_RG


            
