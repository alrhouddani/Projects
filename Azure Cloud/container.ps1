mcr.microsoft.com/azuredocs/aci-wordcount
docker pull mcr.microsoft.com/mcr/hello-world

git clone https://github.com/azure-samples/aci-helloworld.git

az login
az acr build --image demo/custom-image-demo:v1 --registry azurecontainer011 --file Dockerfile .

az aks get-upgrades --name Kubernetes --resource-group Kubernetes
az aks --help
kubectl get storageclass

Storge 

az account set --subscription a6cab1fe-4878-4b88-b438-c84987d1a910
az aks get-credentials --resource-group Kubernetes --name kubernates