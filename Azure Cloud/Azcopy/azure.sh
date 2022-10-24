az group list --output table
az group list --query "[].name"
az group list --query "[].{Name:name,Location:Location}" --output table
az group list --query "[?Location==germanywestcentral].name"
az group list -h
az upgrade
az interactive
az group list --output tsv
az group list --output jsonc
az group list --output table
az group create --Location "germanywestcentral" --name "free"
az vm create --Location germanywestcentral 
az vm list 
az group delete --name free --no-wait

